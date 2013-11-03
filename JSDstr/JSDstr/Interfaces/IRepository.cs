using System.Collections.Generic;
using System.Data.Linq;
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
        TModel Save(TModel entity);
        IEnumerable<TModel> Save(IEnumerable<TModel> entities);
        Table<TModel> BeginContext();
        //void Submit();
        void Refresh(TModel entity);
    }
}