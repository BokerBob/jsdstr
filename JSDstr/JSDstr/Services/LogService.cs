using System;
using System.Web;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;

namespace JSDstr.Services
{
    public class LogService : ILogService
    {
        private static readonly IRepository<Log> LogRepository = new SqlRepository<Log>();

        public static void Log(string message, LogType type = LogType.Info)
        {
            var user = HttpContext.Current.User;
            var userName = user != null ? user.Identity.Name : null;
            var log = new Log
            {
                Message = message,
                UserName = userName,
                Type = (int) type
            };
            LogRepository.Insert(log);
        }

        public static void Log(Exception ex, bool unhandled = false)
        {
            Log(string.Format("{0} exception. Message: [{1}]. Source: [{2}]. StackTrace: [{3}]",
                    unhandled ? "Unhandled" : "Handled", ex.Message,
                    ex.Source, ex.StackTrace), LogType.Error);
        }
    }
}