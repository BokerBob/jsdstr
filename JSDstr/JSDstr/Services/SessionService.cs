using System;
using System.Linq;
using System.Transactions;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;
using JSDstr.ViewObjects;

namespace JSDstr.Services
{
    public class SessionService : ISessionService
    {
        private readonly IRepository<Session> _sessionRepository = new SqlRepository<Session>();

        private const int IdleTimeToTerminate = 10000;

        private void TerminateInactiveSessions()
        {
            var deadlineTerminateDate = DateTime.Now.AddMilliseconds(-IdleTimeToTerminate);
            var inactiveSessions = _sessionRepository.Entities.Where(x =>
                x.State == (int) SessionState.Started &&
                x.ChangedDate < deadlineTerminateDate);
            foreach (var inactiveSession in inactiveSessions)
            {
                inactiveSession.State = (int) SessionState.Stopped;
                inactiveSession.ChangedDate = DateTime.Now;
            }
            _sessionRepository.Submit(false);
            if (inactiveSessions.Any())
                LogService.Save(string.Format("Inactive sessions terminated. Sessions ids: [{0}]",
                    inactiveSessions.Select(x => x.Id.ToString()).ToList().Aggregate((a, b) => (a + "," + b))));
        }

        public SessionViewObject CreateSession(string loggedUser)
        {
            TerminateInactiveSessions();
            var session = new Session
            {
                UserName = loggedUser,
                State = (int)SessionState.Started,
                StateMessage = "Created successfull",
                Guid = Guid.NewGuid()
            };
            _sessionRepository.Insert(session);
            _sessionRepository.Submit(false);
            LogService.Save(string.Format("Session [{0}] created successfull", session.Guid));
            return session;
        }

        public SessionViewObject PingSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            string logMsg;
            var logType = LogType.Info;
            var session = _sessionRepository.Entities.SingleOrDefault(x =>
                x.Guid == sessionViewObject.Guid &&
                x.UserName == sessionViewObject.UserName &&
                x.UserName == loggedUser);
            if (session == null)
            {
                logMsg = "Ping session failed. Session is null";
            }
            else
            {
                if (session.State != sessionViewObject.State || session.State != (int) SessionState.Started)
                {
                    session.State = (int) SessionState.Stopped;
                    session.StateMessage =
                        string.Format("Ping failed. Invalid session state. Client: {0}, Server: {1}",
                            (SessionState) sessionViewObject.State, (SessionState) session.State);
                    logMsg = string.Format(
                        "Session [{0}] ping failed. Invalid session state. Client: [{1}], Server: [{2}]", session.Guid,
                        (SessionState) sessionViewObject.State, (SessionState) session.State);
                    logType = LogType.Warning;
                }
                else
                {
                    session.StateMessage = "Ping successfull";
                    logMsg = string.Format("Session [{0}] ping successfull", session.Guid);
                }
                session.ChangedDate = DateTime.Now;
                _sessionRepository.Submit(false);
            }
            LogService.Save(logMsg, logType);
            return session;
        }

        public SessionViewObject CancelSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            string logMsg;
            var logType = LogType.Info;
            Session session;
            using (var t = new TransactionScope(TransactionScopeOption.Required, new TransactionOptions
            {
                IsolationLevel = IsolationLevel.Serializable
            }))
            {
                session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser);
                if (session == null)
                {
                    logMsg = "Cancel session failed. Session is null";
                }
                else
                {
                    if (session.State == (int) SessionState.Started)
                    {
                        session.State = (int) SessionState.Stopped;
                        session.StateMessage = "Cancelled successfull";
                        logMsg = string.Format("Session [{0}] cancel successfull", session.Guid);
                    }
                    else
                    {
                        session.StateMessage =
                            string.Format("Cancel failed. Invalid session state. Client: {0}, Server: {1}",
                                (SessionState) sessionViewObject.State, (SessionState) session.State);
                        logMsg = string.Format(
                            "Session [{0}] cancel failed. Invalid session state. Client: [{1}], Server: [{2}]",
                            session.Guid,
                            (SessionState) sessionViewObject.State, (SessionState) session.State);
                        logType = LogType.Warning;
                    }
                    session.ChangedDate = DateTime.Now;
                    _sessionRepository.Submit(false);
                    t.Complete();
                }
            }
            LogService.Save(logMsg, logType);
            return session;
        }

        public SessionViewObject CompleteSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            string logMsg;
            var logType = LogType.Info;
            Session session;
            using (var t = new TransactionScope(TransactionScopeOption.Required, new TransactionOptions
            {
                IsolationLevel = IsolationLevel.Serializable
            }))
            {
                session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser);
                if (session == null)
                {
                    logMsg = "Complete session failed. Session is null";
                }
                else
                {
                    if (session.State == (int) SessionState.Started)
                    {
                        session.State = (int) SessionState.Completed;
                        session.StateMessage = "Completed successfull";
                        logMsg = string.Format("Session [{0}] complete successfull", session.Guid);
                    }
                    else
                    {
                        session.StateMessage =
                            string.Format("Complete failed. Invalid session state. Client: {0}, Server: {1}",
                                (SessionState) sessionViewObject.State, (SessionState) session.State);
                        logMsg = string.Format(
                            "Session [{0}] complete failed. Invalid session state. Client: [{1}], Server: [{2}]",
                            session.Guid, (SessionState) sessionViewObject.State, (SessionState) session.State);
                        logType = LogType.Warning;
                    }
                    session.ChangedDate = DateTime.Now;
                    _sessionRepository.Submit(false);
                    t.Complete();
                }
            }
            LogService.Save(logMsg, logType);
            return session;
        }
    }
}