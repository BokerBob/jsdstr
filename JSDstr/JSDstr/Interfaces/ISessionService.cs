using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JSDstr.Models;
using JSDstr.ViewObjects;

namespace JSDstr.Interfaces
{
    public interface ISessionService
    {
        SessionViewObject CreateSession(string loggedUser);
        SessionViewObject PingSession(SessionViewObject sessionViewObject, string loggedUser);
        SessionViewObject CancelSession(SessionViewObject sessionViewObject, string loggedUser);
    }
}