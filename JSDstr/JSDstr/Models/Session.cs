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
        [Column(UpdateCheck = UpdateCheck.Never)]
        public override DateTime CreatedDate { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public override DateTime ChangedDate { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public Guid Guid { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public string UserName { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public int State { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public string StateMessage { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public int? DataId { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public int? ResultId { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public int? StatisticsId { get; set; }
    }
}