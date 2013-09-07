using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JSDstr.Models;

namespace JSDstr.Interfaces
{
    public interface ISessionService
    {
        bool CreateSession(string userName);
        bool PingSession(string userName);
        bool CompleteSession(string userName);
    }
}