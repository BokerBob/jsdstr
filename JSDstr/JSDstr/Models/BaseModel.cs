using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JSDstr.Models
{
    public abstract class BaseModel
    {
        public abstract int Id { get; set; }
        public abstract DateTime CreatedDate { get; set; }
        public abstract DateTime ChangedDate { get; set; }
    }
}