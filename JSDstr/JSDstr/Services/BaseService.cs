using System;
using JSDstr.Models;

namespace JSDstr.Services
{
    public abstract class BaseService
    {
        protected void Log(string logMsg)
        {
            LogService.Log(logMsg);
        }

        protected void Log(string logMsg, LogType logType)
        {
            LogService.Log(logMsg, logType);
        }

        protected void Log(Exception ex)
        {
            LogService.Log(ex);
        }
    }
}