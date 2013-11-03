using System;
using System.Collections;
using JSDstr.Interfaces;
using JSDstr.Models;

namespace JSDstr.ViewObjects
{
    public class VectorViewObject : ViewObject<Earthquake>, IClusteredEntity<decimal, decimal, decimal>
    {
        public VectorViewObject()
        {
        }

        public VectorViewObject(Earthquake source) : base(source)
        {
            if (!source.Latitude.HasValue)
                throw new ArgumentNullException("source.V1");
            if (!source.Longitude.HasValue)
                throw new ArgumentNullException("source.V2");
            if (!source.Intensity.HasValue)
                throw new ArgumentNullException("source.V3");
            Id = source.Id;
            V1 = source.Latitude.Value;
            V2 = source.Longitude.Value;
            V3 = source.Intensity.Value;
        }

        public VectorViewObject(Centroid source)
        {
            Id = source.Id;
            V1 = source.V1;
            V2 = source.V2;
            V3 = source.V3;
        }

        public int Id { get; set; }
        public decimal V1 { get; set; }
        public decimal V2 { get; set; }
        public decimal V3 { get; set; }

        public override int GetHashCode()
        {
            return V1.GetHashCode() ^ V2.GetHashCode() ^ V3.GetHashCode();
        }

        public override bool Equals(object obj)
        {
            var other = obj as VectorViewObject;
            if (other == null)
                return false;
            return V1 == other.V1 && V2 == other.V2 && V3 == other.V3;
        }

        public static VectorViewObject operator +(VectorViewObject a, VectorViewObject b)
        {
            a.V1 += b.V1;
            a.V2 += b.V2;
            a.V3 += b.V3;
            return a;
        }

        public static VectorViewObject operator *(VectorViewObject vector, decimal value)
        {
            vector.V1 *= value;
            vector.V2 *= value;
            vector.V3 *= value;
            return vector;
        }
    }
}