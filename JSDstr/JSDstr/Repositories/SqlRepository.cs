using System;
using System.Collections.Generic;
using System.Linq;
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

        private Table<TModel> GetTable(DataContext dataContext)
        {
            return dataContext != null ? dataContext.GetTable<TModel>() : null;
        }

        public IQueryable<TModel> Entities
        {
            get
            {
                if (DataContext == null)
                    DataContext = new DataContext(ConnectionString);
                return GetTable(DataContext).OfType<TModel>();
            }
        }

        public TModel Insert(TModel entity)
        {
            lock (_locker)
            {
                using (var dataContext = new DataContext(ConnectionString))
                {
                    entity.CreatedDate = entity.ChangedDate = DateTime.Now;
                    GetTable(dataContext).InsertOnSubmit(entity);
                    dataContext.SubmitChanges();
                    return entity;
                }
            }
        }

        public IQueryable<TModel> Insert(IEnumerable<TModel> entities)
        {
            if (entities == null) return null;
            lock (_locker)
            {
                using (var dataContext = new DataContext(ConnectionString))
                {
                    var source = entities.ToArray();
                    var now = DateTime.Now;
                    foreach (var entity in source)
                    {
                        entity.CreatedDate = entity.ChangedDate = now;
                    }
                    GetTable(dataContext).InsertAllOnSubmit(source);
                    dataContext.SubmitChanges();
                    return source.AsQueryable();
                }
            }
        }

        public void Delete(TModel entity)
        {
            lock (_locker)
            {
                if (DataContext == null)
                    DataContext = new DataContext(ConnectionString);
                entity.ChangedDate = DateTime.Now;
                GetTable(DataContext).DeleteOnSubmit(entity);
                DataContext.SubmitChanges();
                DataContext.Dispose();
                DataContext = null;
            }
        }

        public void Delete(IEnumerable<TModel> entities)
        {
            lock (_locker)
            {
                if (DataContext == null)
                    DataContext = new DataContext(ConnectionString);
                var source = entities.ToArray();
                var now = DateTime.Now;
                foreach (var entity in source)
                {
                    entity.ChangedDate = now;
                }
                GetTable(DataContext).DeleteAllOnSubmit(source);
                DataContext.SubmitChanges();
                DataContext.Dispose();
                DataContext = null;
            }
        }

        public void BeginContext()
        {
            DataContext = new DataContext(ConnectionString);
        }

        public void Submit(bool updateChangedDate = true)
        {
            lock (_locker)
            {
                if (DataContext == null)
                    DataContext = new DataContext(ConnectionString);
                if (updateChangedDate)
                {
                    var changed = DataContext.GetChangeSet().Updates;
                    foreach (TModel entity in changed)
                    {
                        entity.ChangedDate = DateTime.Now;
                    }
                }
                DataContext.SubmitChanges();
                DataContext.Dispose();
                DataContext = null;
            }
        }

        public void Refresh()
        {
            using (var dataContext = new DataContext(ConnectionString))
            {
                dataContext.Refresh(RefreshMode.OverwriteCurrentValues);
            }
        }
    }

}