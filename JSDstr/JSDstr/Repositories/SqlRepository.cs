using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JSDstr.Helpers;
using JSDstr.Interfaces;
using JSDstr.Models;
using System.Data.Linq;

namespace JSDstr.Repositories
{
    public class SqlRepository<TModel> : IRepository<TModel> where TModel : BaseModel
    {
        protected readonly Table<TModel> DataTable;

        protected readonly DataContext DataContext;

        public SqlRepository()
            : this(ConfigurationHelper.ConnectionString)
        {
        }

        public SqlRepository(string connectionString)
        {
            DataContext = new DataContext(connectionString);
            DataTable = DataContext.GetTable<TModel>();
            foreach (var entity in DataTable)
            {
                entity.CreateSnapshot();
            }
        }

        public IQueryable<TModel> Entities
        {
            get { return DataTable; }
        }

        public void Insert(TModel entity)
        {
            entity.CreatedDate = entity.ChangedDate = DateTime.Now;
            ((Table<TModel>)Entities).InsertOnSubmit(entity);
        }

        public void Insert(IEnumerable<TModel> entities)
        {
            if (entities == null) return;
            foreach (var entity in entities)
            {
                entity.CreatedDate = entity.ChangedDate = DateTime.Now;
            }
            ((Table<TModel>)Entities).InsertAllOnSubmit(entities);
        }

        public void Delete(TModel entity)
        {
            ((Table<TModel>)Entities).DeleteOnSubmit(entity);
        }

        public void Delete(IEnumerable<TModel> entities)
        {
            ((Table<TModel>)Entities).DeleteAllOnSubmit(entities);
        }

        public void Submit()
        {
            foreach (var entity in Entities)
            {
                if (entity.IsChanged)
                    entity.ChangedDate = DateTime.Now;
                entity.CreateSnapshot();
            }
            DataContext.SubmitChanges();
        }

        public void Refresh()
        {
            DataContext.Refresh(RefreshMode.OverwriteCurrentValues);
        }
    }

}