using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.WebParts;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;
using JSDstr.ViewObjects;

namespace JSDstr.Services
{
    public class StatisticsService : BaseService, IStatisticsService
    {
        private readonly IRepository<KmeansCalculation> _calculationRepository = new SqlRepository<KmeansCalculation>();
        private readonly IRepository<Session> _sessionRepository = new SqlRepository<Session>();
        private readonly IRepository<Task> _taskRepository = new SqlRepository<Task>();
        private readonly IRepository<UserActivity> _userActivityRepository = new SqlRepository<UserActivity>();
        private readonly IRepository<Earthquake> _vectorsRepository = new SqlRepository<Earthquake>();
        private readonly ISettingsService _settingsService = new SettingsService();

        private Task[] GetTasks(KmeansCalculation calculation)
        {
            return _taskRepository.Entities.Where(x =>
                x.Type == calculation.State &&
                x.CalculationId == calculation.Id &&
                x.Iteration == calculation.Iteration).ToArray();
        }

        private IQueryable<Session> GetSessions(int calculationId)
        {
            return _sessionRepository.Entities.Where(x => x.CalculationId == calculationId);
        }

        private static KeyValuePair<DateTime, int>[] TestUsersActivity { get; set; }
        private static KeyValuePair<DateTime, int>[] TestSessionsActivity { get; set; }

        public StatisticsViewObject GetStatistics(Guid? sessionGuid)
        {
            var currentCalculationId = _settingsService.CurrentCalculationId;
            if (currentCalculationId == 0)
                return null;
            var currentCalculation = _calculationRepository.Entities.FirstOrDefault(x => x.Id == currentCalculationId);
            if (currentCalculation == null)
                return null;
            var result = new StatisticsViewObject(currentCalculation);
            var sessions = GetSessions(currentCalculationId);
            try
            {
                var now = DateTime.Now;
                var user = HttpContext.Current.User;

                result.UserSignedIn = user != null && user.Identity.IsAuthenticated;
                if (user != null)
                {
                    var userName = user.Identity.Name;
                    var userSessions = sessions.Where(x => x.UserName == userName).ToArray();
                    var firstUserSession = userSessions.OrderBy(x => x.CreatedDate).FirstOrDefault();
                    if (firstUserSession != null)
                        result.UserFirstSessionDate = firstUserSession.CreatedDate;
                    var lastUserSession = userSessions.OrderByDescending(x => x.CreatedDate).FirstOrDefault();
                    if (lastUserSession != null)
                        result.UserLastSessionDate = lastUserSession.CreatedDate;
                    result.UserTotalSessionCount = userSessions.Count();
                    result.UserTodaySessionCount = userSessions.Count(x => x.CreatedDate.Date == now.Date);
                    var userTasks = userSessions.Where(x => x.State == SessionState.Completed)
                        .Join(_taskRepository.Entities.Where(x => x.State == TaskState.Completed),
                            x => x.Guid, x => x.SessionGuid, (x, y) => y).ToArray();
                    result.UserTotalDataProcessed = userTasks.Sum(x => x.SlotCapacity);
                    result.UserTodayDataProcessed =
                        userTasks.Where(x => x.CreatedDate.Date == now.Date).Sum(x => x.SlotCapacity);
                    var totalCalculationTime = userSessions.Where(
                        x => x.State == SessionState.Completed && x.CalculationTime > 0)
                        .Sum(x => x.CalculationTime);
                    result.UserAverageProcessingSpeed =
                        (int)
                            Math.Round((decimal) result.UserTotalDataProcessed/
                                       (totalCalculationTime > 0 ? totalCalculationTime : 1)
                                );
                    var userProcessingSpeed = userSessions.Where(
                        x => x.State == SessionState.Completed && x.CalculationTime > 0)
                        .Join(_taskRepository.Entities.Where(x => x.State == TaskState.Completed), x => x.Guid,
                            x => x.SessionGuid,
                            (x, y) => new {x.CalculationTime, y.SlotCapacity})
                        .Select(x => x.SlotCapacity/x.CalculationTime).ToArray();
                    if (userProcessingSpeed.Any())
                        result.UserMaxProcessingSpeed = userProcessingSpeed.Max();
                }

                var userActivities =
                    _userActivityRepository.Entities.GroupBy(x => x.CreatedDate.Date)
                        .Select(x => new KeyValuePair<DateTime, int>(x.Key, x.Count())).ToArray();
                var rand = new Random();
                if (TestUsersActivity == null)
                {
                    TestUsersActivity = new KeyValuePair<DateTime, int>[20];
                    var startDate = new DateTime(2013, 11, 1);
                    for (var i = 0; i < 20; i++)
                    {
                        TestUsersActivity[i] = new KeyValuePair<DateTime, int>(startDate.AddDays(i), rand.Next(1, 20));
                    }
                }
                result.OnlineUsersCount = TestUsersActivity;
                result.TotalUsersCount = _settingsService.TotalUsersCount;
                var todayUsersCount = userActivities.Where(x => x.Key.Date == now.Date).FirstOrDefault();
                result.TodayOnlineUsersCount = todayUsersCount.Key != default(DateTime) ? todayUsersCount.Value : 0;

                var sessionsActivities =
                    sessions.GroupBy(x => x.CreatedDate.Date)
                        .Select(x => new KeyValuePair<DateTime, int>(x.Key, x.Count())).ToArray();
                if (TestSessionsActivity == null)
                {
                    TestSessionsActivity = new KeyValuePair<DateTime, int>[20];
                    var startDate = new DateTime(2013, 11, 1);
                    for (var i = 0; i < 20; i++)
                    {
                        TestSessionsActivity[i] = new KeyValuePair<DateTime, int>(startDate.AddDays(i), TestUsersActivity[i].Value*rand.Next(1, 10));
                    }
                }
                result.SessionsCount = TestSessionsActivity;
                result.TotalSessionsCount = sessions.Count();
                var todaySessionsCount = sessionsActivities.Where(x => x.Key.Date == now.Date).FirstOrDefault();
                result.TodaySessionsCount = todaySessionsCount.Key != default(DateTime) ? todaySessionsCount.Value : 0;

                result.N = _vectorsRepository.Entities.Count();

                var tasks = GetTasks(currentCalculation);
                var taskPlan = new KeyValuePair<TaskState, DateTime>[result.N];
                int slotCapacity;
                foreach (var task in tasks)
                {
                    var slotStart = task.SlotStart;
                    slotCapacity = task.SlotCapacity;
                    TaskState state = sessionGuid.HasValue && task.SessionGuid == sessionGuid ? TaskState.Current : task.State;
                    var changedDate = task.ChangedDate;
                    for (var j = 0; j < slotCapacity && slotStart + j < result.N; j++)
                    {
                        var k = slotStart + j;
                        if (taskPlan[k].Value == default(DateTime) || taskPlan[k].Value < changedDate)
                            taskPlan[k] = new KeyValuePair<TaskState, DateTime>(state, changedDate);
                    }
                }

                slotCapacity = currentCalculation.State == CalculationState.AssignmentLoop
                    ? _settingsService.AssignmentsSlotCapacity
                    : _settingsService.UpdateCentroidsSlotCapacity;

                var l = (int)Math.Ceiling((float)result.N/slotCapacity);
                var minTaskPlan = new TaskState[l];
                for (var i = 0; i < l; i++)
                {
                    var jj = i*slotCapacity;
                    var ll = jj + slotCapacity;
                    var minState = taskPlan[jj].Key;
                    minTaskPlan[i] = minState;
                }
                result.TaskPlan = minTaskPlan;
            }
            catch (Exception ex)
            {
                Log(ex);
            }
            return result;
        }
    }
}