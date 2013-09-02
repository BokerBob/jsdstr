using System;
using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    public class CentroidAssignment : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public override int Id { get; set; }

        [Column]
        public override DateTime CreatedDate { get; set; }

        [Column]
        public override DateTime ChangedDate { get; set; }

        [Column]
        public int? CentroidId { get; set; }

        [Column]
        public int? Vectorid { get; set; }

        private EntityRef<Centroid> _centroid;

        [Association(Name = "FK_centroid_assignment", Storage = "_centroid", ThisKey = "CentroidId", OtherKey = "Id", IsForeignKey = false)]
        public Centroid Centroid
        {
            get { return _centroid.Entity; }
            set { _centroid.Entity = value; }
        }

        private EntityRef<Earthquake> _vector;

        [Association(Name = "FK_vector_assignment", Storage = "_vector", ThisKey = "VectorId", OtherKey = "Id", IsForeignKey = false)]
        public Earthquake Vector
        {
            get { return _vector.Entity; }
            set { _vector.Entity = value; }
        }
    }
}