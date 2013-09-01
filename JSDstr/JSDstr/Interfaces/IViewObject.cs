using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using JSDstr.Models;

namespace JSDstr.Interfaces
{
    public interface IViewObject<out TModel> where TModel : BaseModel, new()
    {
        TModel Source { get; }
    }
}
