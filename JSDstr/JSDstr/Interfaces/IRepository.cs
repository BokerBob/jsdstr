using System.Collections.Generic;
using System.Linq;
using JSDstr.Models;

namespace JSDstr.Interfaces
{
    public interface IRepository<TModel> where TModel : BaseModel
    {
        IQueryable<TModel> Entities { get; }
        TModel Insert(TModel entity);
        IQueryable<TModel> Insert(IEnumerable<TModel> entities);
        void Delete(TModel entity);
        void Delete(IEnumerable<TModel> entities);
        void Submit(bool updateChangedDate = true);
        void Refresh();
    }
}