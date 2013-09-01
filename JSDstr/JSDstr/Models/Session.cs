using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    public enum SessionState
    {
        Started = 1,
        Stopped = 2, 
        Completed = 3
    }

    [Table]
    public class Session : BaseModel
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
        public string UserName { get; set; }
        [Column]
        public int State { get; set; }
        [Column]
        public string StateMessage { get; set; }

        [Column]
        public int CalculationId { get; set; }
    }
}