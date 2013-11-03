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
            if (entity == null)
                return;
            lock (_locker)
            {
                BeginContext();
                entity.ChangedDate = DateTime.Now;
                GetTable(DataContext).DeleteOnSubmit(entity);
                DataContext.SubmitChanges();
                DataContext.Dispose();
                BeginContext();
            }
        }

        public void Delete(IEnumerable<TModel> entities)
        {
            if (entities == null)
                return;
            lock (_locker)
            {
                BeginContext();
                var source = entities.ToArray();
                var now = DateTime.Now;
                foreach (var entity in source)
                {
                    entity.ChangedDate = now;
                }
                GetTable(DataContext).DeleteAllOnSubmit(source);
                DataContext.SubmitChanges();
                DataContext.Dispose();
                BeginContext();
            }
        }

        public TModel Save(TModel entity)
        {
            if (entity == null)
                return null;
            var ctx = BeginContext();
            ctx.Attach(entity, true);
            Submit();
            return entity;
        }

        public IEnumerable<TModel> Save(IEnumerable<TModel> entities)
        {
            if (entities == null)
                return null;
            var ctx = BeginContext();
            ctx.AttachAll(entities, true);
            Submit();
            return entities;
        }

        public Table<TModel> BeginContext()
        {
            DataContext = new DataContext(ConnectionString);
            return GetTable(DataContext);
        }

        public void Submit()
        {
            lock (_locker)
            {
                var changed = DataContext.GetChangeSet().Updates;
                var inserted = DataContext.GetChangeSet().Inserts;
                var now = DateTime.Now;
                foreach (TModel entity in changed)
                {
                    entity.ChangedDate = now;
                    if (entity.CreatedDate == DateTime.MinValue)
                        entity.CreatedDate = now;
                }
                foreach (TModel entity in inserted)
                {
                    entity.CreatedDate = entity.ChangedDate = DateTime.Now;
                }
                DataContext.SubmitChanges();
                DataContext.Dispose();
                BeginContext();
            }
        }

        public void Refresh(TModel entity)
        {
            DataContext.Refresh(RefreshMode.KeepChanges, entity);
        }
    }

}