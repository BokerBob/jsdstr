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
    public class KmeansDistributedService : Singleton<KmeansDistributedService>, ICalculationService
    {
        private KmeansDistributedService(){}

        #region fields
        private readonly IRepository<KmeansCalculation> _calculationRepository = new SqlRepository<KmeansCalculation>();
        private readonly IRepository<Earthquake> _earthquakeRepository = new SqlRepository<Earthquake>();
        private readonly IRepository<Centroid> _centroidRepository = new SqlRepository<Centroid>();
        private readonly IRepository<CentroidAssignment> _centroidAssignmentRepository = new SqlRepository<CentroidAssignment>();
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

        public const int SlotCapacity = 50;
        public const int MaxIterations = 10;

        private static readonly CalculationTaskViewObject SuccessfulCalculationTask = new CalculationTaskViewObject
        {
            State = KmeansCalculationState.Successful
        };

        #endregion

        #region interface
        public CalculationTaskViewObject GetTask(CalculationTaskViewObject calculationTask)
        {
            try
            {
                Init(calculationTask);
                switch (_calculation.State)
                {
                    case KmeansCalculationState.Started:
                        return Start();
                    case KmeansCalculationState.AssignmentLoop:
                        return StartAssignmentStep();
                    case KmeansCalculationState.UpdateCentroidsLoop:
                        return StartUpdateCentroidsStep();
                    case KmeansCalculationState.Completed:
                        return Completed();
                    case KmeansCalculationState.Failed:
                        return Failed();
                    default:
                        return Error("Invalid calculation state");
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }

        public CalculationTaskViewObject CompleteTask(CalculationTaskViewObject calculationTask)
        {
            try
            {
                Init(calculationTask);
                switch (_calculation.State)
                {
                    case KmeansCalculationState.AssignmentLoop:
                        return CompleteAssignmentStep();
                    case KmeansCalculationState.UpdateCentroidsLoop:
                        return CompleteUpdateCentroidsStep();
                    case KmeansCalculationState.Failed:
                        return Failed();
                    default:
                        return Error("Invalid calculation state");
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }

        public CalculationTaskViewObject CancelTask(CalculationTaskViewObject calculationTask)
        {
            try
            {
                Init(calculationTask);
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
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        } 
        #endregion
       
        #region steps
        private CalculationTaskViewObject Start()
        {
            return StartMainLoop();
        }

        private CalculationTaskViewObject StartMainLoop()
        {
            return StartMainStep(true);
        }

        private CalculationTaskViewObject StartMainStep(bool getTask)
        {
            _calculation.Iteration++;
            _calculationRepository.Submit();
            return StartAssignmentLoop(getTask);
        }

        private CalculationTaskViewObject StartAssignmentLoop(bool getTask)
        {
            _calculation.State = KmeansCalculationState.AssignmentLoop;
            _calculationRepository.Submit();
            GetTasks(true);
            return getTask ? StartAssignmentStep() : SuccessfulCalculationTask;
        }

        private CalculationTaskViewObject StartAssignmentStep()
        {
            return GetNextTask();
        }

        private CalculationTaskViewObject CompleteAssignmentStep()
        {
            _assignments = SaveAssignments(_calculationTask.Assignments);
            return GetNextStep();
        }

        private CalculationTaskViewObject CompleteAssignmentLoop()
        {
            var k = K;
            _newCentroids = new VectorViewObject[k];
            for (var i = 0; i < k; i++)
            {
                _newCentroids[i] = new VectorViewObject();
            }
            _newCentroids = SaveCentroids(_newCentroids, false);
            return StartUpdateCentroidsLoop();
        }

        private CalculationTaskViewObject StartUpdateCentroidsLoop()
        {
            _calculation.State = KmeansCalculationState.UpdateCentroidsLoop;
            _calculationRepository.Submit();
            GetTasks(true);
            return SuccessfulCalculationTask;
        }

        private CalculationTaskViewObject StartUpdateCentroidsStep()
        {
            return GetNextTask();
        }

        private CalculationTaskViewObject CompleteUpdateCentroidsStep()
        {
            foreach (var centroid in _calculationTask.Centroids)
            {
                var newCentroid = _newCentroids.SingleOrDefault(x => x.Id == centroid.Id);
                if (newCentroid != null)
                {
                    var i = Array.IndexOf(_newCentroids, newCentroid);
                    _newCentroids[i] += centroid;
                }
                _newCentroids = SaveCentroids(_newCentroids, false);
            }
            return GetNextStep();
        }

        private CalculationTaskViewObject CompleteUpdateCentroidsLoop()
        {
            var nextIteration = false;
            for (var i = 0; i < _newCentroids.Length; i++)
            {
                var clusterSize = _newCentroidsSource.First(x => x.Id == _newCentroids[i].Id).CentroidAssignments.Count();
                _newCentroids[i] *= (decimal)(1.0 / clusterSize);
                if (!Equals(_newCentroids[i], _centroids[i]))
                    nextIteration = true;
                _centroids[i] = _newCentroids[i];
            }
            _newCentroids = SaveCentroids(_newCentroids, false);
            _centroids = SaveCentroids(_centroids);

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
            _calculation.State = KmeansCalculationState.Completed;
            _calculationRepository.Submit();
            return new CalculationTaskViewObject(_calculation);
        }

        private CalculationTaskViewObject Completed()
        {
            return new CalculationTaskViewObject(_calculation);
        }

        private CalculationTaskViewObject Failed()
        {
            _calculation.State = KmeansCalculationState.Failed;
            _calculationRepository.Submit();
            return new CalculationTaskViewObject(_calculation);
        }

        private CalculationTaskViewObject Error(string error)
        {
            return new CalculationTaskViewObject
            {
                State = KmeansCalculationState.Error,
                StateMessage = error
            };
        }
        #endregion

        #region init
        private void Init(CalculationTaskViewObject calculationTask)
        {
            _calculationTask = calculationTask;
            InitCalculation();
            if (_calculation.State != KmeansCalculationState.Completed && _calculation.State == KmeansCalculationState.Failed)
            {
                InitVectors();
                InitCentroids();
                InitAssignments();
                InitTasks();
            }
        }

        private void InitCalculation()
        {
            if (_calculation == null)
            {
                var currentCalculationId = _settingsService.CurrentCalculationId;
                if (currentCalculationId == 0) // calculation was never started, create new
                {
                    _calculation = new KmeansCalculation
                    {
                        Iteration = -1,
                        K = _settingsService.KmeansK,
                        State = KmeansCalculationState.Started
                    };
                    _calculation = _calculationRepository.Insert(_calculation);
                    _settingsService.CurrentCalculationId = _calculation.Id;
                }
                else
                {
                    _calculation = _calculationRepository.Entities.SingleOrDefault(x => x.Id == currentCalculationId);
                    if(_calculation == null)
                        throw new NullReferenceException("_calculation");
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
                    throw new InvalidOperationException("Vectors count = 0");
                _vectorsSource = source;
                _vectors = source.Select(x => new VectorViewObject(x)).ToArray();
            }
        }

        private void InitCentroids()
        {
            if (_centroids == null || _centroidsSource == null)
            {
                if (_calculation.State == KmeansCalculationState.Started)
                {
                    var centroids = GetRandomVectors();
                    if(centroids == null)
                        throw new Exception("GetRandomVectors null");
                    _centroids = SaveCentroids(centroids);
                }
                else if(_calculation.State == KmeansCalculationState.AssignmentLoop || _calculation.State == KmeansCalculationState.UpdateCentroidsLoop)
                {
                    _centroidsSource = GetCentroids();
                    _centroids = _centroidsSource.Select(x => new VectorViewObject(x)).ToArray();
                    if (_calculation.State == KmeansCalculationState.UpdateCentroidsLoop)
                    {
                        _newCentroidsSource = GetCentroids(false);
                        _newCentroids = _newCentroidsSource.Select(x => new VectorViewObject(x)).ToArray();
                    }
                }
            }
        }
        
        private void InitAssignments()
        {
            if (_assignments == null || _assignmentsSource == null)
            {
                if (_calculation.State == KmeansCalculationState.Started)
                {
                    var assignments = _vectors.Select(x => new AssignmentViewObject
                    {
                        VectorId = x.Id
                    }).ToArray();
                    _assignments = SaveAssignments(assignments);
                }
                else
                {
                    var centroidIds = _centroids.Select(x => x.Id);
                    var source = _centroidAssignmentRepository.Entities.Where(x => x.CentroidId.HasValue && centroidIds.Contains(x.CentroidId.Value));
                    var c = source.Count();
                    if (c != N)
                        throw new InvalidOperationException("Invalid number of assignments for current calculation");
                    _assignmentsSource = source;
                    _assignments = source.Select(x => new AssignmentViewObject(x)).ToArray();
                }
            }
        }

        private void InitTasks()
        {
            if (_tasksSource == null)
            {
                if (_calculation.State == KmeansCalculationState.Started)
                {
                    //GetTasks(true);
                }
                else
                {
                    GetTasks(false);
                }
            }
        }        
        #endregion init

        #region get-save

        private IQueryable<Centroid> GetCentroids(bool committed = true)
        {
            var source = _centroidRepository.Entities.Where(x => x.CalculationId == _calculation.Id && x.Committed == committed);
            var c = source.Count();
            if (c != K)
                throw new InvalidOperationException("Invalid number of centroids for current calculation");
            return source;
        }

        private VectorViewObject[] SaveCentroids(VectorViewObject[] centroids, bool committed = true)
        {
            if (centroids == null)
                throw new ArgumentNullException("centroids");
            if (_centroidsSource == null)
            {
                var calculationId = _calculation.Id;
                var centroidsSource = centroids.Select(x => new Centroid
                {
                    CalculationId = calculationId,
                    V1 = x.V1,
                    V2 = x.V2,
                    V3 = x.V3,
                    Committed = committed
                }).AsQueryable();
                _centroidsSource = _centroidRepository.Insert(centroidsSource); // get inserted entities and save to source
            }
            else
            {
                var centroidsForInsert = new List<Centroid>();
                foreach (var centroid in centroids) // !!! optimize
                {
                    var c = centroid;
                    var centroidSource = _centroidsSource.FirstOrDefault(x => x.Id == c.Id);
                    if (centroidSource != null)
                    {
                        centroidSource.V1 = c.V1;
                        centroidSource.V2 = c.V2;
                        centroidSource.V3 = c.V3;
                        centroidSource.Committed = committed;
                    }
                    else
                    {
                        centroidSource = new Centroid
                        {
                            CalculationId = _calculation.Id,
                            V1 = c.V1,
                            V2 = c.V2,
                            V3 = c.V3,
                            Committed = committed
                        };
                        centroidsForInsert.Add(centroidSource);
                    }
                }
                if (centroidsForInsert.Any())
                {
                    _centroidRepository.Insert(centroidsForInsert);
                }
                _centroidRepository.Submit();
            }
            return centroids;
        }

        private AssignmentViewObject[] SaveAssignments(AssignmentViewObject[] assignments)
        {
            if (assignments == null)
                throw new ArgumentNullException("assignments");
            if (_assignmentsSource == null)
            {
                var assignmentsSource = assignments.Where(x => x.CentroidId.HasValue).Select(x => new CentroidAssignment
                {
                    CentroidId = x.CentroidId.Value,
                    Vectorid = x.VectorId
                }).AsQueryable();
                _assignmentsSource = _centroidAssignmentRepository.Insert(assignmentsSource); // get inserted entities and save to source
            }
            else
            {
                var assignmentsForInsert = new List<CentroidAssignment>();
                foreach (var assignment in assignments) // !!! optimize
                {
                    var a = assignment;
                    var assignmentSource = _assignmentsSource.FirstOrDefault(x => x.Id == a.Id);
                    if (assignmentSource != null)
                    {
                        assignmentSource.CentroidId = a.CentroidId;
                        assignmentSource.Vectorid = a.VectorId;
                    }
                    else
                    {
                        assignmentSource = new CentroidAssignment
                        {
                            CentroidId = a.CentroidId,
                            Vectorid = a.VectorId
                        };
                        assignmentsForInsert.Add(assignmentSource);
                    }
                }
                if (assignmentsForInsert.Any())
                {
                    _centroidAssignmentRepository.Insert(assignmentsForInsert);
                }
                _centroidAssignmentRepository.Submit();
            }
            return assignments;
        }

        private IQueryable<VectorTask> GetTasks(bool create)
        {
            if (create)
            {
                var tasks = _vectors.Select(x => new VectorTask
                {
                    Vectorid = x.Id,
                    SessionGuid = null,
                    State = VectorTaskState.Idle,
                    Type = (VectorTaskType)(int)_calculation.State,
                    Iteration = _calculation.Iteration
                });
                return _taskRepository.Insert(tasks);
            }
            _tasksSource = _taskRepository.Entities.Where(x =>
                x.SessionGuid == _calculationTask.SessionGuid &&
                x.Type == (VectorTaskType)(int)_calculation.State &&
                x.Iteration == _calculation.Iteration);
            if (_tasksSource.Count() != N)
                throw new Exception("Tasks count != N");
            return _tasksSource;
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
                    return null;
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

        private CalculationTaskViewObject GetNextTask()
        {
            if (_tasksSource.All(x => x.State == VectorTaskState.Completed))
            {
                return Error("All tasks are completed, but next iteration isn't started");
            }
            else
            {
                var tasks = _tasksSource.ToArray();
                var idleTasks = tasks.Where(x => x.State == VectorTaskState.Idle || x.State == VectorTaskState.Cancelled)
                        .Take(SlotCapacity).ToArray();
                if (idleTasks.Any())
                {
                    var taskIndex = Array.IndexOf(tasks, idleTasks.First());
                    foreach (var task in idleTasks)
                    {
                        task.State = VectorTaskState.Started;
                        task.SessionGuid = _calculationTask.SessionGuid;
                    }
                    _taskRepository.Submit();
                    _calculationTask.Vectors = !_calculationTask.VectorsCached ? _vectors : null;
                    _calculationTask.Centroids = _centroids;
                    _calculationTask.SlotStart = taskIndex;
                    _calculationTask.SlotCapacity = SlotCapacity;
                    _calculationTask.State = _calculation.State;
                    if (_calculation.State == KmeansCalculationState.UpdateCentroidsLoop)
                        _calculationTask.Assignments = _assignments;
                    return _calculationTask;
                }
                else
                {
                    _calculationTask = new CalculationTaskViewObject()
                    {
                        State = KmeansCalculationState.Busy
                    };
                    return _calculationTask;
                }
            }
        }

        private CalculationTaskViewObject GetNextStep()
        {
            if (_tasksSource.All(x => x.State == VectorTaskState.Completed))
            {
                if (_calculation.State == KmeansCalculationState.AssignmentLoop)
                    return CompleteAssignmentLoop();
                else if (_calculation.State == KmeansCalculationState.UpdateCentroidsLoop)
                    return CompleteUpdateCentroidsLoop();
                else
                    return Error("Invalid calculation state");
            }
            else
            {
                return SuccessfulCalculationTask;
            }
        }

        #endregion get-save

    }
}