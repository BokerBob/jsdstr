using System;
using System.Collections.Generic;
using System.Linq;
using JSDstr.Helpers;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;
using JSDstr.ViewObjects;

/*
 * Enter points:
 * -> GetTask
 *    - Start
 *      |
 *      StartMainLoop
 *      |
 *      StartMainStep
 *      |
 *      StartAssignmentLoop
 *      |
 *    - StartAssignmentStep -> AssignmentTask
 *    - StartUpdateCentroidsStep -> UpdateCentroidsTask
 *    - Completed -> CompletedTask
 *    - Failed -> FailedTask
 *    - Error -> ErrorTask
 * -> CompleteTask
 *    - CompleteAssignmentStep -> SuccessfulTask
 *      |
 *      CompleteAssignmentLoop
 *      |
 *      StartUpdateCentroidsLoop -> SuccessfulTask
 *    - CompleteUpdateCentroidsStep -> SuccessfulTask
 *      |
 *      CompleteUpdateCentroidsLoop
 *      |
 *      CompleteMainStep_________
 *      |                        |
 *      CompleteMainLoop         StartMainStep
 *      |                        |
 *    - Complete ->              StartAssignmentLoop -> SuccessfulTask
 *    - Failed -> FailedTask
 *    - Error -> ErrorTask
 * -> CancelTask
 *    - CancelTask -> SuccessfulTask
 *    -Error
 */

namespace JSDstr.Services
{
    public class KmeansService : Singleton<KmeansService>, ICalculationService
    {
        private KmeansService(){}

        #region fields
        private readonly IRepository<KmeansCalculation> _calculationRepository = new SqlRepository<KmeansCalculation>();
        private readonly IRepository<Earthquake> _earthquakeRepository = new SqlRepository<Earthquake>();
        private readonly IRepository<Centroid> _centroidRepository = new SqlRepository<Centroid>();
        private readonly IRepository<CentroidAssignment> _assignmentRepository = new SqlRepository<CentroidAssignment>();
        private readonly IRepository<VectorTask> _taskRepository = new SqlRepository<VectorTask>();
        private readonly ISettingsService _settingsService = new SettingsService();

        private IQueryable<Earthquake> _vectorsSource;
        private IQueryable<Centroid> _centroidsSource;
        private IQueryable<Centroid> _newCentroidsSource;
        private IQueryable<CentroidAssignment> _assignmentsSource;
        private IQueryable<VectorTask> _tasksSource;

        private KmeansCalculation _calculation;
        private VectorViewObject[] _vectors;
        private VectorViewObject[] _centroids;
        private VectorViewObject[] _newCentroids;
        private AssignmentViewObject[] _assignments;

        private CalculationTaskViewObject _calculationTask;

        private int N { get { return _vectors.Length; } }
        private int K { get { return _calculation.K; } }
        private int MaxIterations { get { return _calculation.MaxIterations; } }

        private readonly object _locker = new object();

        private int _assignmentsSlotCapacity;
        private int _updateCentroidsSlotCapacity;

        private CalculationTaskViewObject SuccessfulCalculationTask
        {
            get
            {
                return new CalculationTaskViewObject(_calculation)
                {
                    State = CalculationState.Successful,
                    SessionGuid = _calculationTask.SessionGuid,
                    VectorsCached = _calculationTask.VectorsCached
                };
            }
        }

        #endregion

        #region interface
        public CalculationTaskViewObject GetTask(CalculationTaskViewObject calculationTask)
        {
            lock (_locker)
            {
                try
                {
                    Init(calculationTask, true);
                    switch (_calculation.State)
                    {
                        case CalculationState.Started:
                            return Start();
                        case CalculationState.AssignmentLoop:
                            return StartAssignmentStep();
                        case CalculationState.UpdateCentroidsLoop:
                            return StartUpdateCentroidsStep();
                        case CalculationState.Completed:
                            return Completed();
                        case CalculationState.Failed:
                            return Failed("Calculation failed");
                        default:
                            return Error("Invalid calculation state");
                    }
                }
                catch (CalculationFailedException ex)
                {
                    return HandleCalculationFailed(ex);
                }
                catch (Exception ex)
                {
                    return Error(ex.Message);
                }
            }
        }

        public CalculationTaskViewObject CompleteTask(CalculationTaskViewObject calculationTask)
        {
            lock (_locker)
            {
                try
                {
                    Init(calculationTask);
                    switch (_calculation.State)
                    {
                        case CalculationState.AssignmentLoop:
                            return CompleteAssignmentStep();
                        case CalculationState.UpdateCentroidsLoop:
                            return CompleteUpdateCentroidsStep();
                        case CalculationState.Failed:
                            return Failed("Calculation failed");
                        default:
                            return Error("Invalid calculation state");
                    }
                }
                catch (CalculationFailedException ex)
                {
                    return HandleCalculationFailed(ex);
                }
                catch (Exception ex)
                {
                    return Error(ex.Message);
                }
            }
        }

        public CalculationTaskViewObject CancelTask(CalculationTaskViewObject calculationTask)
        {
            lock(_locker)
            {
                try
                {
                    Init(calculationTask);
                    if (_calculation.State == CalculationState.AssignmentLoop ||
                        _calculation.State == CalculationState.UpdateCentroidsLoop)
                    {
                        RefreshTasks();
                        var sessionTasks = _tasksSource.Where(x =>
                            x.SessionGuid == _calculationTask.SessionGuid);
                        if (sessionTasks.Any())
                        {
                            foreach (var sessionTask in sessionTasks)
                            {
                                sessionTask.State = VectorTaskState.Cancelled;
                                sessionTask.SessionGuid = null;
                            }
                            _taskRepository.Submit();
                        }
                        return SuccessfulCalculationTask;
                    }
                    return Error("Invalid calculation state for CancelTask");
                }
                catch (CalculationFailedException ex)
                {
                    return HandleCalculationFailed(ex);
                }
                catch (Exception ex)
                {
                    return Error(ex.Message);
                }
            }
        } 
        #endregion
       
        #region steps
        private CalculationTaskViewObject Start()
        {
            _centroids = GetRandomVectors();
            SaveCentroids(true, true);
            _assignments = GetEmptyAssignments();
            return StartMainLoop();
        }

        private CalculationTaskViewObject StartMainLoop()
        {
            return StartMainStep(true);
        }

        private CalculationTaskViewObject StartMainStep(bool getTask)
        {
            RefreshCalculation();
            _calculation.Iteration++;
            _calculationRepository.Submit();
            SaveCentroids(true, true);
            //SaveAssignments(true);
            return StartAssignmentLoop(getTask);
        }

        private CalculationTaskViewObject StartAssignmentLoop(bool getTask)
        {
            RefreshCalculation();
            _calculation.State = CalculationState.AssignmentLoop;
            _calculationRepository.Submit();
            SaveTasks(true);
            return getTask ? StartAssignmentStep() : SuccessfulCalculationTask;
        }

        private CalculationTaskViewObject StartAssignmentStep()
        {
            return GetNextTask();
        }

        private CalculationTaskViewObject CompleteAssignmentStep()
        {
            MergeAssignments(_calculationTask.Assignments);
            CompleteSessionTasks();
            return GetNextStep();
        }

        private CalculationTaskViewObject CompleteAssignmentLoop()
        {
            return StartUpdateCentroidsLoop();
        }

        private CalculationTaskViewObject StartUpdateCentroidsLoop()
        {
            RefreshCalculation();
            _calculation.State = CalculationState.UpdateCentroidsLoop;
            _calculationRepository.Submit();
            SaveCentroids(false, true);
            SaveTasks(true);
            return SuccessfulCalculationTask;
        }

        private CalculationTaskViewObject StartUpdateCentroidsStep()
        {
            return GetNextTask();
        }

        private CalculationTaskViewObject CompleteUpdateCentroidsStep()
        {
            if(_calculationTask.Centroids.Length != K)
                throw new InvalidOperationException("UpdateCentroids: results length != K");
            foreach (var centroid in _calculationTask.Centroids)
            {
                var newCentroid = _newCentroids.SingleOrDefault(x => x.Id == centroid.Id);
                if (newCentroid != null)
                {
                    var i = Array.IndexOf(_newCentroids, newCentroid);
                    _newCentroids[i] += centroid;
                }
            }
            SaveCentroids(false, false);
            CompleteSessionTasks();
            return GetNextStep();
        }

        private CalculationTaskViewObject CompleteUpdateCentroidsLoop()
        {
            var nextIteration = false;
            for (var i = 0; i < _newCentroids.Length; i++)
            {
                var clusterSize = _assignmentsSource.Count(x => x.CentroidId == _newCentroids[i].Id);
                _newCentroids[i] *= (decimal)(1.0 / clusterSize);
                if (!Equals(_newCentroids[i], _centroids[i]))
                    nextIteration = true;
                _centroids[i] = _newCentroids[i];
            }
            SaveCentroids(false, false);
            SaveCentroids(true, false);

            return CompleteMainStep(nextIteration);
        }

        private CalculationTaskViewObject CompleteMainStep(bool nextIteration)
        {
            if (!nextIteration)
            {
                return CompleteMainLoop(false);
            }
            if (_calculation.Iteration == MaxIterations)
            {
                return CompleteMainLoop(true);
            }
            return StartMainStep(false);
        }

        private CalculationTaskViewObject CompleteMainLoop(bool isMaxIterations)
        {
            return Complete(isMaxIterations);
        }

        private CalculationTaskViewObject Complete(bool isMaxIterations)
        {
            RefreshCalculation();
            _calculation.StateMessage = isMaxIterations ? 
                string.Format("Max iteration: {0}", MaxIterations) : 
                "Not difference between iterations";
            _calculation.State = CalculationState.Completed;
            _calculationRepository.Submit();
            return new CalculationTaskViewObject(_calculation)
            {
                SessionGuid = _calculationTask.SessionGuid,
                VectorsCached = _calculationTask.VectorsCached
            };
        }

        private CalculationTaskViewObject Completed()
        {
            return new CalculationTaskViewObject(_calculation)
            {
                SessionGuid = _calculationTask.SessionGuid,
                VectorsCached = _calculationTask.VectorsCached
            };
        }

        private CalculationTaskViewObject Failed(string message)
        {
            if (_calculation != null)
            {
                RefreshCalculation();
                _calculation.State = CalculationState.Failed;
                _calculation.StateMessage = message;
                _calculationRepository.Submit();
                _calculationTask = new CalculationTaskViewObject(_calculation)
                {
                    SessionGuid = _calculationTask.SessionGuid,
                    VectorsCached = _calculationTask.VectorsCached
                };
            }
            else
            {
                _calculationTask = Error(message);
            }
            ClearCalculation();
            return _calculationTask;
        }

        private CalculationTaskViewObject Error(string error)
        {
            return _calculation != null
                ? new CalculationTaskViewObject(_calculation)
                {
                    State = CalculationState.Error,
                    StateMessage = error,
                    SessionGuid = _calculationTask.SessionGuid,
                    VectorsCached = _calculationTask.VectorsCached
                }
                : new CalculationTaskViewObject
                {
                    State = CalculationState.Error,
                    StateMessage = error,
                    SessionGuid = _calculationTask.SessionGuid,
                    VectorsCached = _calculationTask.VectorsCached
                };
        }
        #endregion

        #region init
        private void Init(CalculationTaskViewObject calculationTask, bool fromGet = false)
        {
            _calculationTask = calculationTask;
            _assignmentsSlotCapacity = _settingsService.AssignmentsSlotCapacity;
            _updateCentroidsSlotCapacity = _settingsService.UpdateCentroidsSlotCapacity;
            InitCalculation(fromGet);
            if (_calculation.State != CalculationState.Completed && _calculation.State != CalculationState.Failed)
            {
                InitVectors();
                InitCentroids();
                InitAssignments();
                InitTasks();
            }
        }

        private void InitCalculation(bool fromGet)
        {
            var currentCalculationId = _settingsService.CurrentCalculationId;
            if (_calculation == null || _calculation.Id != currentCalculationId)
            {
                if (currentCalculationId == 0)
                {
                    if(!fromGet)
                        throw new Exception("Init create wasn't performed from GetTask");
                    _calculation = new KmeansCalculation
                    {
                        Iteration = -1,
                        K = _settingsService.KmeansK,
                        MaxIterations = _settingsService.MaxIterations,
                        State = CalculationState.Started
                    };
                    _calculation = _calculationRepository.Insert(_calculation);
                    _settingsService.CurrentCalculationId = _calculation.Id;
                }
                else
                {
                    _calculation = _calculationRepository.Entities.SingleOrDefault(x => x.Id == currentCalculationId);
                    if (_calculation == null)
                    {
                        throw new CalculationFailedException("Calculation is null");
                    }
                }
            }
        }

        private void InitVectors()
        {
            if (_vectors == null || _vectorsSource == null)
            {
                var source = _earthquakeRepository.Entities.Where(
                    x => x.Latitude.HasValue && x.Longitude.HasValue && x.Intensity.HasValue &&
                         x.CalculationId == _calculation.Id);
                if (!source.Any())
                    source = _earthquakeRepository.Entities.Where(
                        x => x.Latitude.HasValue && x.Longitude.HasValue && x.Intensity.HasValue &&
                             x.CalculationId == 0);
                if (!source.Any())
                    throw new CalculationFailedException("Vectors are empty");
                _vectorsSource = source;
                _vectors = source.Select(x => new VectorViewObject(x)).ToArray();
            }
        }

        private void InitCentroids()
        {
            if (_centroids == null || _centroidsSource == null)
            {
                if (_calculation.State == CalculationState.AssignmentLoop)
                {
                    GetCentroids(true);
                }
                else if (_calculation.State == CalculationState.UpdateCentroidsLoop)
                {
                    GetCentroids(true);
                    GetCentroids(false);
                }
            }
        }
        
        private void InitAssignments()
        {
            if (_assignments == null || _assignmentsSource == null)
            {
                if(_calculation.State == CalculationState.UpdateCentroidsLoop)
                {
                    GetAssignments();
                }
            }
        }

        private void InitTasks()
        {
            if (_tasksSource == null)
            {
                if (_calculation.State == CalculationState.AssignmentLoop || _calculation.State == CalculationState.UpdateCentroidsLoop)
                {
                    //_tasksSource = GetTasks();
                }
            }
        }        
        #endregion init

        #region get-save-handle

        // db => source, viewobjects
        private void GetCentroids(bool committed)
        {
            var source = _centroidRepository.Entities.Where(x =>
                        x.CalculationId == _calculation.Id &&
                        x.Iteration == _calculation.Iteration &&
                        x.Committed == committed);
            var c = source.Count();
            if (c != K)
                throw new CalculationFailedException("Invalid number of centroids for current calculation");
            if (committed)
            {
                _centroidsSource = source;
                _centroids = _centroidsSource.Select(x => new VectorViewObject(x)).ToArray();
            }
            else
            {
                _newCentroidsSource = source;
                _newCentroids = _newCentroidsSource.Select(x => new VectorViewObject(x)).ToArray();
            }
        }

        private Centroid GetCentroidFromViewObject(VectorViewObject viewObject, bool committed)
        {
            return new Centroid
            {
                Id = viewObject.Id,
                V1 = viewObject.V1,
                V2 = viewObject.V2,
                V3 = viewObject.V3,
                Committed = committed,
                CalculationId = _calculation.Id,
                Iteration = _calculation.Iteration
            };
        }

        // viewobjects => db, source
        private void SaveCentroids(bool committed, bool createNew)
        {
            if (!createNew)
            {
                var newCentroids = _centroids;
                _centroidRepository.BeginContext();
                if(_centroidsSource == null)
                    GetCentroids(committed);
                _centroidRepository.Delete(_centroidsSource);
                _centroidsSource = null;
                _centroids = newCentroids;
            }
            var source = _centroids.Select(x => GetCentroidFromViewObject(x, committed)).AsQueryable();
            source = _centroidRepository.Insert(source);
            if (committed)
            {
                _centroidsSource = source;
                _centroids = _centroidsSource.Select(x => new VectorViewObject(x)).ToArray();
            }
            else
            {
                _newCentroidsSource = source;
                _newCentroids = _newCentroidsSource.Select(x => new VectorViewObject(x)).ToArray();
            }
        }
        
        private VectorViewObject[] GetRandomVectors()
        {
            var n = N;
            var k = K;
            var selectedVectors = new VectorViewObject[k];
            var selectedIndexes = new int[k];
            var testedIndexes = new HashSet<int>();
            var tested = 0;
            var selected = 0;
            var rand = new Random();

            while (selected < k)
            {
                if (tested == n)
                    throw new InvalidOperationException("tested == n");
                var randomIndex = rand.Next(0, n - 1);
                if (testedIndexes.Contains(randomIndex))
                    continue;

                testedIndexes.Add(randomIndex);
                tested++;
                var vector = _vectors[randomIndex];
                var select = true;
                int i;
                for (i = 0; i < selected; i++)
                {
                    if (vector.Equals(selectedVectors[i]))
                    {
                        select = false;
                        break;
                    }
                }
                if (select)
                {
                    selectedVectors[selected] = vector;
                    selectedIndexes[selected] = randomIndex;
                    selected++;
                }
            }
            return selectedVectors;
        }

        // db => source, viewobjects
        private void GetAssignments()
        {
            var source = _assignmentRepository.Entities.Where(x =>
                        x.CalculationId == _calculation.Id &&
                        x.Iteration == _calculation.Iteration);
            //var c = source.Count();
            //if (c != N)
            //    throw new CalculationFailedException("Invalid number of assignments for current calculation");
            _assignmentsSource = source;
            _assignments = _assignmentsSource.Select(x => new AssignmentViewObject(x)).ToArray();
        }

        private CentroidAssignment GetAssignmentFromViewObject(AssignmentViewObject viewObject)
        {
            var calculationId = _calculation.Id;
            var iteration = _calculation.Iteration;
            return new CentroidAssignment
            {
                Id = viewObject.Id,
                CentroidId = viewObject.CentroidId,
                Vectorid = viewObject.VectorId,
                CalculationId = calculationId,
                Iteration = iteration
            };
        }
        
        // viewobjects => db, source
        private void SaveAssignments(bool createNew)
        {
            if (!createNew)
            {
                var newAssignments = _assignments;
                _assignmentRepository.BeginContext();
                if (_assignmentsSource == null)
                    GetAssignments();
                _assignmentRepository.Delete(_assignmentsSource);
                _assignmentsSource = null;
                _assignments = newAssignments;
            }
            var source = _assignments.Select(GetAssignmentFromViewObject).AsQueryable();
            source = _assignmentRepository.Insert(source);
            _assignmentsSource = source;
            _assignments = _assignmentsSource.Select(x => new AssignmentViewObject(x)).ToArray();
        }

        private void MergeAssignments(AssignmentViewObject[] mergeWith)
        {
            /*RefreshAssignments();
            foreach (var assignmentViewObject in mergeWith)
            {
                var viewObject = assignmentViewObject;
                var assignmentSource = _assignmentsSource.FirstOrDefault(x => x.Id == viewObject.Id);
                if (assignmentSource != null)
                {
                    assignmentSource.Vectorid = viewObject.VectorId;
                    assignmentSource.CentroidId = viewObject.CentroidId;
                }
            }
            _assignmentRepository.Submit();*/
            if (mergeWith.Length != _assignmentsSlotCapacity)
                throw new InvalidOperationException("MergeAssignments: results length != SlotCapacity");
            _assignmentRepository.Insert(mergeWith.Select(GetAssignmentFromViewObject));
            GetAssignments();
        }

        private AssignmentViewObject[] GetEmptyAssignments()
        {
            return _vectors.Select(x => new AssignmentViewObject
            {
                VectorId = x.Id
            }).ToArray();
        }

        // db => source, viewobjects
        private void GetTasks()
        {
            _taskRepository.BeginContext();
            var tasksSource = _taskRepository.Entities.Where(x =>
                x.Type == _calculation.State &&
                x.CalculationId == _calculation.Id &&
                x.Iteration == _calculation.Iteration);
            if (tasksSource.Count() != N)
            {
                throw new CalculationFailedException("Invalid number of tasks for current calculation");
            }
            _tasksSource = tasksSource;
        }

        // viewobjects => db, source
        private void SaveTasks(bool createNew)
        {
            if (!createNew)
            {
                _taskRepository.BeginContext();
                if (_tasksSource == null)
                    GetTasks();
                _taskRepository.Delete(_tasksSource);
                _tasksSource = null;
            }
            var tasks = _vectors.Select(x => new VectorTask
            {
                Vectorid = x.Id,
                SessionGuid = null,
                State = VectorTaskState.Idle,
                Type = _calculation.State,
                CalculationId = _calculation.Id,
                Iteration = _calculation.Iteration
            });
            _tasksSource = _taskRepository.Insert(tasks);
        }

        private CalculationTaskViewObject GetNextTask()
        {
            RefreshTasks();
            if (_tasksSource.All(x => x.State == VectorTaskState.Completed))
            {
                return Error("All tasks are completed, but next iteration isn't started");
            }
            var tasks = _tasksSource.ToArray();
            var taskIndex = -1;
            var slotCapacity = _calculation.State == CalculationState.AssignmentLoop
                ? _assignmentsSlotCapacity
                : _updateCentroidsSlotCapacity;
            foreach (var task in _tasksSource.
                Where(x => x.State == VectorTaskState.Idle || x.State == VectorTaskState.Cancelled).Take(slotCapacity))
            {
                if (taskIndex == -1)
                    taskIndex = Array.IndexOf(tasks, task);
                task.State = VectorTaskState.Started;
                task.SessionGuid = _calculationTask.SessionGuid;
            }
            if (taskIndex >= 0)
            {
                _taskRepository.Submit();
                AssignmentViewObject[] taskAssignments = null;
                if (_calculation.State == CalculationState.UpdateCentroidsLoop)
                    taskAssignments = _assignments.Skip(taskIndex).Take(slotCapacity).ToArray();
                _calculationTask = new CalculationTaskViewObject(_calculation)
                {
                    Vectors = !_calculationTask.VectorsCached ? _vectors : null,
                    Centroids = _centroids,
                    SlotStart = taskIndex,
                    SlotCapacity = slotCapacity,
                    Assignments =  taskAssignments,
                    SessionGuid =  _calculationTask.SessionGuid,
                    VectorsCached = _calculationTask.VectorsCached
                };
                return _calculationTask;
            }
            _calculationTask = new CalculationTaskViewObject(_calculation)
            {
                State = CalculationState.Busy,
                SessionGuid = _calculationTask.SessionGuid,
                VectorsCached = _calculationTask.VectorsCached
            };
            return _calculationTask;
        }

        private void CompleteSessionTasks()
        {
            RefreshTasks();
            var tasks = _tasksSource.Where(x => x.SessionGuid == _calculationTask.SessionGuid);
            foreach (var vectorTask in tasks)
            {
                vectorTask.State = VectorTaskState.Completed;
            }
            _taskRepository.Submit();
        }

        private CalculationTaskViewObject GetNextStep()
        {
            GetTasks();
            if (_tasksSource.All(x => x.State == VectorTaskState.Completed))
            {
                if (_calculation.State == CalculationState.AssignmentLoop)
                    return CompleteAssignmentLoop();
                if (_calculation.State == CalculationState.UpdateCentroidsLoop)
                    return CompleteUpdateCentroidsLoop();
                return Error("Invalid calculation state");
            }
            return SuccessfulCalculationTask;
        }

        private void RefreshCalculation()
        {
            _calculationRepository.BeginContext();
            _calculation = _calculationRepository.Entities.FirstOrDefault(x => x.Id == _calculation.Id);
            if (_calculation == null)
                throw new NullReferenceException("_calculation");
        }

        private void RefreshAssignments()
        {
            _assignmentRepository.BeginContext();
            GetAssignments();
        }

        private void RefreshTasks()
        {
            _taskRepository.BeginContext();
            GetTasks();
        }

        private void ClearCalculation()
        {
            _settingsService.CurrentCalculationId = 0;
            _calculation = null;
            _vectors = null;
            _centroids = null;
            _assignments = null;
        }

        private CalculationTaskViewObject HandleCalculationFailed(CalculationFailedException ex)
        {
            LogService.Log(ex);
            return Failed(ex.Message);
        }

        #endregion get-save

    }

    public class CalculationFailedException : Exception
    {
        public CalculationFailedException(string message) : base(message){}
    }
}