using System;
using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    public class Cluster : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public override int Id { get; set; }

        [Column]
        public override DateTime CreatedDate { get; set; }

        [Column]
        public override DateTime ChangedDate { get; set; }

        [Column]
        public decimal Latitude { get; set; }

        [Column]
        public decimal Longitude { get; set; }

        [Column]
        public int Intensity { get; set; }

        [Column]
        public int CalculationId { get; set; }

        private EntityRef<KmeansCalculation> _calculation;

        [Association(Name = "FK_calculation_cluster", Storage = "_calculation", ThisKey = "CalculationId", OtherKey = "Id", IsForeignKey = false)]
        public KmeansCalculation Calculation
        {
            get { return _calculation.Entity; }
            set { _calculation.Entity = value; }
        }

        private readonly EntitySet<ClusterAssignment> _clusterAssignments;

        [Association(Name = "FK_cluster_assignment", Storage = "_clusterAssignments", ThisKey = "Id", OtherKey = "ClusterId", IsForeignKey = false)]
        public EntitySet<ClusterAssignment> ClusterAssignments
        {
            get
            {
                return _clusterAssignments;
            }
            set
            {
                _clusterAssignments.Assign(value);
            }
        }
    }
}