using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
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
        private readonly IRepository<Task> _taskRepository = new SqlRepository<Task>();
        private readonly IRepository<Session> _sessionRepository = new SqlRepository<Session>();
        private readonly ISettingsService _settingsService = new SettingsService();

        private KmeansCalculation _calculation;
        private VectorViewObject[] _vectors;
        private VectorViewObject[] _centroids;
        private VectorViewObject[] _newCentroids;
        private AssignmentViewObject[] _assignments;
        private Task[] _tasks;

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
                        GetTasks();
                        var sessionTasks = _tasks.Where(x =>
                            x.SessionGuid == _calculationTask.SessionGuid && x.State == TaskState.Started).ToArray();
                        if (sessionTasks.Any())
                        {
                            foreach (var sessionTask in sessionTasks)
                            {
                                sessionTask.State = TaskState.Cancelled;
                                sessionTask.SessionGuid = null;
                            }
                            _taskRepository.Save(sessionTasks);
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
            _calculation.Iteration++;
            _calculationRepository.Save(_calculation);
            SaveCentroids(true, true);
            //SaveAssignments(true);
            return StartAssignmentLoop(getTask);
        }

        private CalculationTaskViewObject StartAssignmentLoop(bool getTask)
        {
            _calculation.State = CalculationState.AssignmentLoop;
            _calculationRepository.Save(_calculation);
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
            _calculation.State = CalculationState.UpdateCentroidsLoop;
            _calculationRepository.Save(_calculation);
            SaveCentroids(false, true);
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
            for (int i = 0; i < _calculationTask.Centroids.Length; i++)
            {
                var centroid = _calculationTask.Centroids[i];
                if (centroid == null)
                    continue;
                _newCentroids[i] += centroid;
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
                var clusterSize = _assignments.Count(x => x.C == i);
                if (clusterSize == 0)
                    clusterSize = 1;
                _newCentroids[i] *= (decimal)(1.0 / clusterSize);
                if (!Equals(_newCentroids[i], _centroids[i]))
                    nextIteration = true;
                _centroids[i] = _centroids[i].CopyFrom(_newCentroids[i]);
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
            _calculation.StateMessage = isMaxIterations ? 
                string.Format("Max iteration: {0}", MaxIterations) : 
                "Not difference between iterations";
            _calculation.State = CalculationState.Completed;
            _calculationRepository.Save(_calculation);
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
                _calculation.State = CalculationState.Failed;
                _calculation.StateMessage = message;
                _calculationRepository.Save(_calculation);
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
                        Iteration = 0,
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
            if (_vectors == null)
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
                _vectors = source.Select(x => new VectorViewObject(x)).ToArray();
            }
        }

        private void InitCentroids()
        {
            if (_centroids == null)
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
            if (_assignments == null)
            {
                if(_calculation.State == CalculationState.UpdateCentroidsLoop)
                {
                    GetAssignments();
                }
            }
        }

        private void InitTasks()
        {
            if (_tasks == null)
            {
                if (_calculation.State == CalculationState.AssignmentLoop || _calculation.State == CalculationState.UpdateCentroidsLoop)
                {
                    TerminateUnassignedTasks();
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
                _centroids = source.Select(x => new VectorViewObject(x)).ToArray();
            }
            else
            {
                _newCentroids = source.Select(x => new VectorViewObject(x)).ToArray();
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
                _centroidRepository.Save(_centroids.Select(x => GetCentroidFromViewObject(x, committed)));
                return;
            }
            var source = _centroids.Select(x => GetCentroidFromViewObject(x, committed)).AsQueryable();
            source = _centroidRepository.Insert(source);
            if (committed)
            {
                _centroids = source.Select(x => new VectorViewObject(x)).ToArray();
            }
            else
            {
                _newCentroids = source.Select(x => new VectorViewObject(x)).ToArray();
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
            var c = source.Count();
            if (c > N)
                throw new CalculationFailedException("Invalid number of assignments for current calculation");
            _assignments = source.Select(x => new AssignmentViewObject(x)).ToArray();
        }

        private CentroidAssignment GetAssignmentFromViewObject(AssignmentViewObject viewObject)
        {
            var calculationId = _calculation.Id;
            var iteration = _calculation.Iteration;
            return new CentroidAssignment
            {
                Id = viewObject.Id,
                CentroidId = viewObject.C,
                Vectorid = viewObject.V,
                CalculationId = calculationId,
                Iteration = iteration
            };
        }

        private void MergeAssignments(AssignmentViewObject[] mergeWith)
        {
            if (mergeWith.Length > _assignmentsSlotCapacity)
                throw new InvalidOperationException("MergeAssignments: results length != SlotCapacity");
            _assignmentRepository.Insert(mergeWith.Select(GetAssignmentFromViewObject));
        }

        private AssignmentViewObject[] GetEmptyAssignments()
        {
            var assignments = new AssignmentViewObject[N];
            for (var i = 0; i < N; i++)
                assignments[i] = new AssignmentViewObject()
                {
                    V = i
                };
            return assignments;
        }

        // db => source, viewobjects
        private void GetTasks()
        {
            var tasksSource = _taskRepository.Entities.Where(x =>
                x.Type == _calculation.State &&
                x.CalculationId == _calculation.Id &&
                x.Iteration == _calculation.Iteration);
            _tasks = tasksSource.ToArray();
        }

        private void TerminateUnassignedTasks()
        {
            var tasks = _taskRepository.Entities.Where(x =>
                x.CalculationId == _calculation.Id &&
                x.Iteration == _calculation.Iteration &&
                x.Type == _calculation.State &&
                x.State == TaskState.Started).ToArray();
            var sessions = _sessionRepository.Entities.Where(x =>
                x.CalculationId == _calculation.Id &&
                x.State != SessionState.Started).ToArray();
            var unassignedTasks = tasks.Join(sessions, 
                t => t.SessionGuid,s => s.Guid, (t, s) => t).ToArray();
            foreach (var unassignedTask in unassignedTasks)
            {
                unassignedTask.SessionGuid = null;
                unassignedTask.State = TaskState.Cancelled;
            }
            _taskRepository.Save(unassignedTasks);
        }

        private TaskState[] GetTaskPlan()
        {
            GetTasks();
            var taskPlan = new KeyValuePair<TaskState, DateTime>[N];
            foreach (var task in _tasks)
            {
                var slotStart = task.SlotStart;
                var slotCapacity = task.SlotCapacity;
                var state = task.State;
                var changedDate = task.ChangedDate;
                for (var j = 0; j < slotCapacity && slotStart + j < N; j++)
                {
                    var k = slotStart + j;
                    if (taskPlan[k].Value == default(DateTime) || taskPlan[k].Value < changedDate)
                        taskPlan[k] = new KeyValuePair<TaskState, DateTime>(state, changedDate);
                }
            }
            return taskPlan.Select(x => x.Key).ToArray();
        }

        private CalculationTaskViewObject GetNextTask()
        {
            var taskPlan = GetTaskPlan();
            if (taskPlan.All(x => x == TaskState.Completed))
            {
                //return Error("All tasks are completed, but next iteration isn't started");
                if (_calculation.State == CalculationState.AssignmentLoop)
                    return CompleteAssignmentLoop();
                if (_calculation.State == CalculationState.UpdateCentroidsLoop)
                    return CompleteUpdateCentroidsLoop();
                return Error("Invalid calculation state");
            }
            var slotCapacity = _calculation.State == CalculationState.AssignmentLoop
                ? _assignmentsSlotCapacity
                : _updateCentroidsSlotCapacity;
            var taskIndex = -1;
            for (var i = 0; i < taskPlan.Length; i++)
            {
                if (taskPlan[i] == TaskState.Idle || taskPlan[i] == TaskState.Cancelled)
                {
                    taskIndex = i;
                    break;
                }
            }
            if (taskIndex >= 0)
            {
                var task = new Task
                {
                    CalculationId = _calculation.Id,
                    Iteration = _calculation.Iteration,
                    SessionGuid = _calculationTask.SessionGuid,
                    SlotStart = taskIndex,
                    SlotCapacity = slotCapacity,
                    State = TaskState.Started,
                    Type = _calculation.State
                };
                _taskRepository.Insert(task);
                AssignmentViewObject[] taskAssignments = null;
                if (_calculation.State == CalculationState.UpdateCentroidsLoop)
                    taskAssignments = _assignments.Skip(taskIndex).Take(slotCapacity).ToArray();
                _calculationTask = new CalculationTaskViewObject(_calculation)
                {
                    Vectors = !_calculationTask.VectorsCached ? _vectors : null,
                    Centroids = _calculation.State == CalculationState.AssignmentLoop ? _centroids : _newCentroids,
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
            GetTasks();
            var completedTask = _tasks.FirstOrDefault(x => x.SessionGuid == _calculationTask.SessionGuid);
            if(completedTask != null)
            {
                completedTask.State = TaskState.Completed;
            }
            _taskRepository.Save(completedTask);
        }

        private CalculationTaskViewObject GetNextStep()
        {
            var taskPlan = GetTaskPlan();
            if (taskPlan.All(x => x == TaskState.Completed))
            {
                if (_calculation.State == CalculationState.AssignmentLoop)
                    return CompleteAssignmentLoop();
                if (_calculation.State == CalculationState.UpdateCentroidsLoop)
                    return CompleteUpdateCentroidsLoop();
                return Error("Invalid calculation state");
            }
            return SuccessfulCalculationTask;
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