using System;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    public enum KmeansCalculationState
    {
        Started = 1,
        AssignmentStep = 2,
        UpdateCentroidsStep = 3,
        Completed = 4,
        Failed = 5
    }

    public class KmeansCalculation : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public override int Id { get; set; }

        [Column]
        public override DateTime CreatedDate { get; set; }

        [Column]
        public override DateTime ChangedDate { get; set; }

        [Column]
        public Guid Guid { get; set; }

        [Column]
        public int K { get; set; }

        [Column]
        public bool Repeat { get; set; }

        [Column]
        public int Iteration { get; set; }

        [Column]
        public KmeansCalculationState State { get; set; }
    }
}