using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JSDstr.Models
{
    public abstract class BaseModel
    {
        private long _hashCode;

        public abstract int Id { get; set; }
        public abstract DateTime CreatedDate { get; set; }
        public abstract DateTime ChangedDate { get; set; }

        public bool IsChanged { get { return _hashCode != GetHash(); } }

        protected BaseModel() { CreateSnapshot(); }

        public void CreateSnapshot() { _hashCode = GetHash(); }

        public long GetHash()
        {
            unchecked
            {
                return Id ^ CreatedDate.Ticks ^ ChangedDate.Ticks;
            }
        }
    }
}