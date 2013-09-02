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
        protected readonly string ConnectionString;

        protected DataContext DataContext { get; set; }
        
        private readonly object _locker = new object();

        public SqlRepository()
            : this(ConfigurationHelper.ConnectionString)
        {
        }

        public SqlRepository(string connectionString)
        {
            ConnectionString = connectionString;
            DataContext = new DataContext(ConnectionString);
        }

        public IQueryable<TModel> Entities
        {
            get { return DataContext.GetTable<TModel>().AsQueryable(); }
        }

        public TModel Insert(TModel entity)
        {
            lock(_locker)
            {
                using (DataContext = new DataContext(ConnectionString))
                {
                    entity.CreatedDate = entity.ChangedDate = DateTime.Now;
                    ((Table<TModel>) Entities).InsertOnSubmit(entity);
                    DataContext.SubmitChanges();
                    return entity;
                }
            }
        }

        public IQueryable<TModel> Insert(IEnumerable<TModel> entities)
        {
            if (entities == null) return null;
            lock (_locker)
            {
                using (DataContext = new DataContext(ConnectionString))
                {
                    var enumerable = entities.ToArray();
                    foreach (var entity in enumerable)
                    {
                        entity.CreatedDate = entity.ChangedDate = DateTime.Now;
                    }
                    ((Table<TModel>) Entities).InsertAllOnSubmit(enumerable);
                    DataContext.SubmitChanges();
                    return enumerable.AsQueryable();
                }
            }
        }

        public void Delete(TModel entity)
        {
            lock (_locker)
            {
                using (DataContext = new DataContext(ConnectionString))
                {
                    ((Table<TModel>) Entities).DeleteOnSubmit(entity);
                    DataContext.SubmitChanges();
                }
            }
        }

        public void Delete(IEnumerable<TModel> entities)
        {
            lock (_locker)
            {
                using (DataContext = new DataContext(ConnectionString))
                {
                    ((Table<TModel>) Entities).DeleteAllOnSubmit(entities);
                    DataContext.SubmitChanges();
                }
            }
        }

        public void Submit(bool updateChangedDate = true)
        {
            lock (_locker)
            {
                using (DataContext = new DataContext(ConnectionString))
                {
                    if (updateChangedDate)
                    {
                        foreach (var entity in Entities)
                        {
                            entity.ChangedDate = DateTime.Now;
                        }
                    }
                    DataContext.SubmitChanges();
                }
            }
        }

        public void Refresh()
        {
            using (DataContext = new DataContext(ConnectionString))
            {
                DataContext.Refresh(RefreshMode.OverwriteCurrentValues);
            }
        }
    }

}