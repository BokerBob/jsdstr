using System.Runtime.InteropServices;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;

namespace JSDstr.Services
{
    public class LogService : ILogService
    {
        private static readonly IRepository<Log> LogRepository = new SqlRepository<Log>();

        public static void Save(string message, LogType type = LogType.Info)
        {
            var userName = HttpContext.Current.User.Identity.Name;
            var log = new Log
            {
                Message = message,
                UserName = userName,
                Type = (int) type
            };
            LogRepository.Insert(log);
            LogRepository.Submit();
        }
    }
}