using System;
using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    [Table]
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

        [Column]
        public int CalculationId { get; set; }

        [Column]
        public int Iteration { get; set; }
    }
}