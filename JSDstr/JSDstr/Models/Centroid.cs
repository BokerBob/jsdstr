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
        public int Iteration { get; set; }

        [Column]
        public bool Committed { get; set; }
    }
}