using System;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    public enum KmeansCalculationState
    {
        Started = 1,
        AssignmentLoop = 2,
        UpdateCentroidsLoop = 3,
        Completed = 4,

        Failed = 5,

        Successful = 6,
        Error = 7,
        Busy = 8
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
        public int K { get; set; }

        [Column]
        public int Iteration { get; set; }

        [Column]
        public KmeansCalculationState State { get; set; }

        [Column]
        public string StateMessage { get; set; }
    }
}