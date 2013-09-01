using System;
using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    [Table]
    public class Centroid : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public override int Id { get; set; }

        [Column]
        public override DateTime CreatedDate { get; set; }

        [Column]
        public override DateTime ChangedDate { get; set; }

        [Column]
        public decimal V1 { get; set; }

        [Column]
        public decimal V2 { get; set; }

        [Column]
        public decimal V3 { get; set; }

        [Column]
        public int CalculationId { get; set; }

        [Column]
        public bool Committed { get; set; }

        //private EntityRef<KmeansCalculation> _calculation;

        //[Association(Name = "FK_calculation_centroid", Storage = "_calculation", ThisKey = "CalculationId", OtherKey = "Id", IsForeignKey = false)]
        //public KmeansCalculation Calculation
        //{
        //    get { return _calculation.Entity; }
        //    set { _calculation.Entity = value; }
        //}

        //private readonly EntitySet<CentroidAssignment> _centroidAssignments;

        //[Association(Name = "FK_centroid_assignment", Storage = "_centroidAssignments", ThisKey = "Id", OtherKey = "Centroid", IsForeignKey = false)]
        //public EntitySet<CentroidAssignment> CentroidAssignments
        //{
        //    get
        //    {
        //        return _centroidAssignments;
        //    }
        //    set
        //    {
        //        _centroidAssignments.Assign(value);
        //    }
        //}
    }
}