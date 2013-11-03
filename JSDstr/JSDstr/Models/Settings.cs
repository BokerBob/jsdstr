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
        [Column(IsPrimaryKey = true, IsDbGenerated = true, UpdateCheck = UpdateCheck.Never)]
        public override int Id { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public override DateTime CreatedDate { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public override DateTime ChangedDate { get; set; }

        [Column(UpdateCheck = UpdateCheck.Never)]
        public string Key { get; set; }
        [Column(UpdateCheck = UpdateCheck.Never)]
        public string Value { get; set; }
    }
}