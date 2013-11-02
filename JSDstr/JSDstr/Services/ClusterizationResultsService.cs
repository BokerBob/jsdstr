using System;
using System.Collections.Generic;
using System.Linq;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;
using JSDstr.ViewObjects;

namespace JSDstr.Services
{
    public class ClusterizationResultsService : BaseService, IClusterizationResultsService
    {
        private readonly IRepository<Earthquake> _vectorsRepository = new SqlRepository<Earthquake>();
        private readonly IRepository<Centroid> _centroidRepository = new SqlRepository<Centroid>();
        private readonly IRepository<CentroidAssignment> _centroidAssignmentRepository = new SqlRepository<CentroidAssignment>();
        private readonly IRepository<KmeansCalculation> _calculationRepository = new SqlRepository<KmeansCalculation>(); 
        private readonly ISettingsService _settingsService = new SettingsService();

        public ClusterizationResultViewObject[] GetClusterizationResults()
        {
            try
            {
                var currentCalculationId = _settingsService.CurrentCalculationId;
                if (currentCalculationId == 0)
                    return null;
                var currentCalculation =
                    _calculationRepository.Entities.FirstOrDefault(x => x.Id == currentCalculationId);
                if (currentCalculation == null)
                    return null;
                var iteration = currentCalculation.Iteration > 0 ? currentCalculation.Iteration - 1 : 0;
                var centroids = _centroidRepository.Entities.Where(x =>
                    x.CalculationId == currentCalculation.Id &&
                    x.Iteration == iteration && x.Committed).OrderBy(x => x.V3).ToArray();
                if (centroids.Length != currentCalculation.K)
                    throw new Exception("centroids.Length != currentCalculation.K");
                var earthquakeGroupLookup = new Dictionary<int, EarthquakeGroup>
                {
                    {centroids[0].Id, EarthquakeGroup.Weak},
                    {centroids[1].Id, EarthquakeGroup.Medium},
                    {centroids[2].Id, EarthquakeGroup.Strong},
                    {centroids[3].Id, EarthquakeGroup.Strongest}
                };
                var vectors =
                    _vectorsRepository.Entities.Where(
                        x => x.Intensity.HasValue && x.Latitude.HasValue && x.Longitude.HasValue).ToArray();
                var source = vectors.Join(_centroidAssignmentRepository.Entities.Where(x => x.CalculationId == currentCalculationId &&
                    x.Iteration == iteration && x.CentroidId.HasValue),
                    x => x.Id,
                    y => y.Vectorid, (x, y) => new ClusterizationResultViewObject
                    {
                        Intensity = x.Intensity.Value,
                        Latitude = x.Latitude.Value,
                        Longitude = x.Longitude.Value,
                        LocationName = x.LocationName,
                        EarthquakeGroup = earthquakeGroupLookup[y.CentroidId.Value]
                    }).ToArray();
                return source;
            }
            catch (Exception ex)
            {
                Log(ex);
                return null;
            }
        }
    }
}