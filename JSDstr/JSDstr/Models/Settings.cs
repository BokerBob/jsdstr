using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;

namespace JSDstr.Models
{
    [Table]
    public class Settings : BaseModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public override int Id { get; set; }
        [Column]
        public override DateTime CreatedDate { get; set; }
        [Column]
        public override DateTime ChangedDate { get; set; }

        [Column]
        public string Key { get; set; }
        [Column]
        public string Value { get; set; }
    }
}