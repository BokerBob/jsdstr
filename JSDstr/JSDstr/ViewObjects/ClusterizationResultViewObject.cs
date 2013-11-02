using JSDstr.Models;

namespace JSDstr.ViewObjects
{
    public enum EarthquakeGroup
    {
        Strongest = 0,
        Strong = 1,
        Medium = 2,
        Weak = 3
    }

    public class ClusterizationResultViewObject : ViewObject<Earthquake>
    {
        public string LocationName { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public int Intensity { get; set; }
        public EarthquakeGroup EarthquakeGroup { get; set; }
    }
}