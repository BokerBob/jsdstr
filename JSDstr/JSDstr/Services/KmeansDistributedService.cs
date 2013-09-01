using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
 *    - Completed -> CalculationCompletedResult
 *    - Error -> CalculationErrorResult
 * -> SaveResults
 *    - EndAssignmentStep ->
 *      |
 *      EndAssignmentLoop
 *      |
 *      StartUpdateCentroidsLoop ->
 *    - EndUpdateCentroidsStep ->
 *      |
 *      EndUpdateCentroidsLoop
 *      |
 *      EndMainStep ->
 *      |
 *      EndMainLoop
 *      |
 *    - End ->
 *    - Error ->
 */

namespace JSDstr.Services
{
    // should be only one instance!!!
    public class KmeansDistributedService : Singleton<KmeansDistributedService>
    {
        private void Start(){}
            private void StartMainLoop(){}
                private void StartMainStep(){}
                    private void StartAssignmentLoop(){}
                        private void StartAssignmentStep(){}
                        private void EndAssignmentStep(){}
                    private void EndAssignmentLoop(){}
                    private void StartUpdateCentroidsLoop(){}
                        private void StartUpdateCentroidsStep(){}
                        private void EndUpdateCentroidsStep(){}
                    private void EndUpdateCentroidsLoop(){}
                private void EndMainStep(){}
            private void EndMainLoop(){}
        private void Completed(){}
        private void Error(){}

        private readonly IRepository<KmeansCalculation> _calculationRepository = new SqlRepository<KmeansCalculation>();
        private readonly IRepository<Earthquake> _earthquakeRepository = new SqlRepository<Earthquake>(); 
        private readonly IRepository<Cluster> _clusterRepository = new SqlRepository<Cluster>();
        private readonly IRepository<ClusterAssignment> _clusterAssignmentRepository = new SqlRepository<ClusterAssignment>();
        private readonly ISettingsService _settingsService = new SettingsService();
   
        //private const string CurrentCalculationIdKey = "CurrentCalculationId";
        //private const string VectorsKey = "VectorsData";
        //private const string CentroidsKey = "CentroidsData";
        //private const string AssignmentsKey = "AssignmentsData";

        private IQueryable<Earthquake> _vectorsSource;
        private IQueryable<Cluster> _centroidsSource;
        private IQueryable<ClusterAssignment> _assignmentsSource;

        private KmeansCalculation _calculation;
        private VectorViewObject[] _vectors;
        private VectorViewObject[] _centroids;
        private AssignmentViewObject[] _assignments;

        private int N { get { return _vectors.Length; } }
        private int K { get { return _calculation.K; } }
        //private HttpApplicationState State { get { return HttpContext.Current.Application; } }

        public void GetTask()
        {
            Init();
        }

        public void SaveResults()
        {
            Init();
        }

        private void Init()
        {
            if (_calculation == null)
            {
                var currentCalculationId = _settingsService.CurrentCalculationId;
                if (currentCalculationId == 0)
                {
                    _calculation = new KmeansCalculation
                    {
                        Iteration = -1,
                        Repeat = true,
                        K = _settingsService.KmeansK,
                        State = KmeansCalculationState.Started
                    };
                    _calculationRepository.Insert(_calculation);
                }
                else
                {
                    _calculation = _calculationRepository.Entities.SingleOrDefault(x => x.Id == currentCalculationId);
                    if(_calculation == null)
                        throw new NullReferenceException("_calculation");
                }
            }
            if (_vectors == null)
                _vectors = GetVectors();
            if (_centroids == null)
                _centroids = GetCentroids();
            if (_assignments == null)
                _assignments = GetAssignments();
        }

        private VectorViewObject[] GetVectors(object value = null)
        {
            var vectors = value as VectorViewObject[];
            if (vectors != null)
            {
                if(vectors.Length < K)
                    throw new ArgumentException("k > n");
                return vectors;
            }
            var source = _earthquakeRepository.Entities.Where(
                x => x.Latitude.HasValue && x.Longitude.HasValue && x.Intensity.HasValue &&
                     x.CalculationId == _calculation.Id);
            if (!source.Any())
                source = _earthquakeRepository.Entities.Where(
                x => x.Latitude.HasValue && x.Longitude.HasValue && x.Intensity.HasValue &&
                     x.CalculationId == 0);
            if(!source.Any())
                throw new InvalidOperationException("Vectors count = 0");
            _vectorsSource = source;
            return source.Select(x => new VectorViewObject(x)).ToArray();
        }

        private VectorViewObject[] GetCentroids(object value = null)
        {
            var centroids = value as VectorViewObject[];
            if (centroids != null)
            {
                if(centroids.Length != K)
                    throw new ArgumentException("centroids.Length != k");
                return centroids;
            }
            var source = _clusterRepository.Entities.Where(x => x.CalculationId == _calculation.Id);
            var c = source.Count();
            if (c == K)
            {
                _centroidsSource = source;
                return source.Select(x => new VectorViewObject(x)).ToArray();
            }
            if (c != 0) throw new InvalidOperationException("Invalid number of centroids for current calculation");
            centroids = GetRandomVectors();
            SaveCentroids(centroids);
            return centroids;
        }

        private void SaveCentroids(VectorViewObject[] centroids)
        {
            if (centroids == null)
                throw new ArgumentNullException("centroids");
            if (_centroidsSource == null)
            {
                var calculationId = _calculation.Id;
                var centroidsSource = centroids.Select(x => new Cluster
                {
                    CalculationId = calculationId,
                    Latitude = x.V1,
                    Longitude = x.V2,
                    Intensity = x.V3
                }).AsQueryable();
                _clusterRepository.Insert(centroidsSource); // get inserted entities and save to source
                _centroidsSource = centroidsSource;
            }
            else
            {
                var clustersForInsert = new List<Cluster>();
                foreach (var centroid in centroids) // !!! optimize
                {
                    var c = centroid;
                    var cluster = _centroidsSource.FirstOrDefault(x => x.Id == c.Id);
                    if (cluster != null)
                    {
                        cluster.Latitude = c.V1;
                        cluster.Longitude = c.V2;
                        cluster.Intensity = c.V3;
                    }
                    else
                    {
                        cluster = new Cluster
                        {
                            CalculationId = _calculation.Id,
                            Latitude = c.V1,
                            Longitude = c.V2,
                            Intensity = c.V3
                        };
                        clustersForInsert.Add(cluster);
                    }
                }
                if (clustersForInsert.Any())
                {
                    _clusterRepository.Insert(clustersForInsert);
                }
                _clusterRepository.Submit();
            }
        }
        
        private AssignmentViewObject[] GetAssignments(object value = null)
        {
            var assignments = value as AssignmentViewObject[];
            if (assignments != null)
            {
                if(assignments.Length != N)
                    throw new ArgumentException("centroids.Length != n");
                return _assignments;
            }
            var clusterIds = _centroids.Select(x => x.Id);
            var source = _clusterAssignmentRepository.Entities.Where(x => clusterIds.Contains(x.ClusterId));
            var c = source.Count();
            if (c == N)
            {
                _assignmentsSource = source;
                return source.Select(x => new AssignmentViewObject(x)).ToArray();
            }
            if (c != 0) throw new InvalidOperationException("Invalid number of assignments for current calculation");
            assignments = new AssignmentViewObject[_vectors.Length];
            SaveAssignments(assignments);
            return assignments;
        }

        private void SaveAssignments(AssignmentViewObject[] assignments)
        {
            if (assignments == null)
                throw new ArgumentNullException("assignments");
            if (_assignmentsSource == null)
            {
                var assignmentsSource = assignments.Select(x => new ClusterAssignment
                {
                    ClusterId = x.ClusterId,
                    Vectorid = x.VectorId
                }).AsQueryable();
                _clusterAssignmentRepository.Insert(assignmentsSource); // get inserted entities and save to source
                _assignmentsSource = assignmentsSource;
            }
            else
            {
                var assignmentsForInsert = new List<ClusterAssignment>();
                foreach (var assignment in assignments) // !!! optimize
                {
                    var a = assignment;
                    var assignmentSource = _assignmentsSource.FirstOrDefault(x => x.Id == a.Id);
                    if (assignmentSource != null)
                    {
                        assignmentSource.ClusterId = a.ClusterId;
                        assignmentSource.Vectorid = a.VectorId;
                    }
                    else
                    {
                        assignmentSource = new ClusterAssignment
                        {
                            ClusterId = a.ClusterId,
                            Vectorid = a.VectorId
                        };
                        assignmentsForInsert.Add(assignmentSource);
                    }
                }
                if (assignmentsForInsert.Any())
                {
                    _clusterAssignmentRepository.Insert(assignmentsForInsert);
                }
                _clusterAssignmentRepository.Submit();
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
    }
}