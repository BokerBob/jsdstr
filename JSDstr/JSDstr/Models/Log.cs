using System;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    public enum LogType
    {
        Error = 1,
        Warning = 2,
        Info = 3
    }

    [Table]
    public class Log : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public override int Id { get; set; }
        [Column]
        public override DateTime CreatedDate { get; set; }
        [Column]
        public override DateTime ChangedDate { get; set; }

        [Column]
        public string Message { get; set; }
        [Column]
        public string UserName { get; set; }
        [Column]
        public int Type { get; set; }
    }
}