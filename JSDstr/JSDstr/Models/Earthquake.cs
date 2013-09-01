using System;
using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    [Table]
    public class Earthquake : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public override int Id { get; set; }

        [Column]
        public override DateTime CreatedDate { get; set; }

        [Column]
        public override DateTime ChangedDate { get; set; }

        [Column]
        public int CalculationId { get; set; }

        [Column(Name = "YEAR")]
        public int? Year { get; set; }

        [Column(Name = "MONTH")]
        public int? Month { get; set; }
        
        [Column(Name = "DAY")]
        public int? Day { get; set; }
       
        [Column(Name = "LOCATION_NAME")]
        public string LocationName { get; set; }

        [Column(Name = "LATITUDE")]
        public decimal? Latitude { get; set; }

        [Column(Name = "LONGITUDE")]
        public decimal? Longitude { get; set; }

        [Column(Name = "INTENSITY")]
        public int? Intensity { get; set; }

        private readonly EntitySet<ClusterAssignment> _clusterAssignments;

        [Association(Name = "FK_vector_assignment", Storage = "_clusterAssignments", ThisKey = "Id", OtherKey = "VectorId", IsForeignKey = false)]
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