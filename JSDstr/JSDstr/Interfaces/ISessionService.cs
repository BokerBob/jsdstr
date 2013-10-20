using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JSDstr.Models;

namespace JSDstr.Interfaces
{
    public interface ISessionService
    {
        Guid CreateSession(string userName);
        bool PingSession(Guid sessionGuid);
        bool CompleteSession(Guid sessionGuid);
    }
}