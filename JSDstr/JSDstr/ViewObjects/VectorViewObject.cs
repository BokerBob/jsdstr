using System;
using JSDstr.Interfaces;
using JSDstr.Models;

namespace JSDstr.ViewObjects
{
    public class VectorViewObject : ViewObject<Earthquake>, IClusteredEntity<decimal, decimal, int>
    {
        public VectorViewObject()
        {
        }

        public VectorViewObject(Earthquake source) : base(source)
        {
            if (!source.Latitude.HasValue)
                throw new ArgumentNullException("source.Latitude");
            if (!source.Longitude.HasValue)
                throw new ArgumentNullException("source.Longitude");
            if (!source.Intensity.HasValue)
                throw new ArgumentNullException("source.Intensity");
            Id = source.Id;
            V1 = source.Latitude.Value;
            V2 = source.Longitude.Value;
            V3 = source.Intensity.Value;
        }

        public VectorViewObject(Cluster source)
        {
            Id = source.Id;
            V1 = source.Latitude;
            V2 = source.Longitude;
            V3 = source.Intensity;
        }

        public int Id { get; set; }
        public decimal V1 { get; set; }
        public decimal V2 { get; set; }
        public int V3 { get; set; }

        public override int GetHashCode()
        {
            return V1.GetHashCode() ^ V2.GetHashCode() ^ V3;
        }

        public override bool Equals(object obj)
        {
            var other = obj as VectorViewObject;
            if (other == null)
                return false;
            return V1 == other.V1 && V2 == other.V2 && V3 == other.V3;
        }
    }
}