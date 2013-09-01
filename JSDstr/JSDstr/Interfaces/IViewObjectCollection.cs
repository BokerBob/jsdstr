using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JSDstr.Interfaces
{
    public interface IViewObjectCollection<out TViewObject> : IEnumerable<TViewObject>
    {
        TViewObject[] ViewObjects { get; }
    }
}
