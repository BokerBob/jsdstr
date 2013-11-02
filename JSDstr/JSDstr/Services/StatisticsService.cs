using System;
using System.Linq;
using System.Web;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;
using JSDstr.ViewObjects;

namespace JSDstr.Services
{
    public class StatisticsService : BaseService, IStatisticsService
    {
        private readonly IRepository<Session> _sessionRepository = new SqlRepository<Session>();
        private readonly IRepository<Task> _taskRepository = new SqlRepository<Task>();

        public StatisticsViewObject GetStatistics()
        {
            var result = new StatisticsViewObject();
            var now = DateTime.Now;
            var user = HttpContext.Current.User;

            if (user != null)
            {
                var userName = user.Identity.Name;
                var userSessions = _sessionRepository.Entities.Where(x => x.UserName == userName).ToArray();
                var firstUserSession = userSessions.OrderBy(x => x.CreatedDate).FirstOrDefault();
                if (firstUserSession != null)
                    result.UserFirstSessionDate = firstUserSession.CreatedDate;
                var lastUserSession = userSessions.OrderByDescending(x => x.CreatedDate).FirstOrDefault();
                if(lastUserSession != null)
                    result.UserLastSessionDate = lastUserSession.CreatedDate;
                result.UserTotalSessionCount = userSessions.Count();
                result.UserTodaySessionCount = userSessions.Count(x => x.CreatedDate.Date == now.Date);
                var userTasks = userSessions.Where(x => x.State == SessionState.Completed)
                    .Join(_taskRepository.Entities.Where(x => x.State == TaskState.Completed),
                        x => x.Guid, x => x.SessionGuid, (x, y) => y);
                result.UserTotalDataProcessed = userTasks.Sum(x => x.SlotCapacity);
                result.UserTodayDataProcessed = userTasks.Where(x => x.CreatedDate.Date == now.Date).Sum(x => x.SlotCapacity);
                result.UserAverageProcessingSpeed =
                    (int)Math.Round((decimal)result.UserTotalDataProcessed/
                    userSessions.Where(x => x.State == SessionState.Completed && x.CalculationTime > 0)
                        .Sum(x => x.CalculationTime));
                result.UserMaxProcessingSpeed =
                    userSessions.Where(x => x.State == SessionState.Completed && x.CalculationTime > 0)
                        .Join(_taskRepository.Entities.Where(x => x.State == TaskState.Completed), x => x.Guid,
                            x => x.SessionGuid,
                            (x, y) => new {x.CalculationTime, y.SlotCapacity})
                        .Select(x => x.SlotCapacity/x.CalculationTime)
                        .Max();
            }
        }
    }
}