using System;
using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    public class ClusterAssignment : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public override int Id { get; set; }

        [Column]
        public override DateTime CreatedDate { get; set; }

        [Column]
        public override DateTime ChangedDate { get; set; }

        [Column]
        public int ClusterId { get; set; }

        [Column]
        public int Vectorid { get; set; }

        private EntityRef<Cluster> _cluster;

        [Association(Name = "FK_cluster_assignment", Storage = "_cluster", ThisKey = "ClusterId", OtherKey = "Id", IsForeignKey = false)]
        public Cluster Cluster
        {
            get { return _cluster.Entity; }
            set { _cluster.Entity = value; }
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