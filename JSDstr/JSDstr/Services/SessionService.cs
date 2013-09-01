using System;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Security;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;
using System.Threading;
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
        }

        public SessionViewObject CreateSession(string loggedUser)
        {
            TerminateInactiveSessions();
            var session = new Session
            {
                UserName = loggedUser,
                State = (int)SessionState.Started,
                StateMessage = string.Format("Created at {0} successfull", DateTime.Now),
                Guid = Guid.NewGuid()
            };
            _sessionRepository.Insert(session);
            _sessionRepository.Submit(false);
            return session;
        }

        public SessionViewObject PingSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            var session = _sessionRepository.Entities.SingleOrDefault(x =>
                x.Guid == sessionViewObject.Guid &&
                x.UserName == sessionViewObject.UserName &&
                x.UserName == loggedUser);
            if (session == null)
                return null;
            if (session.State != sessionViewObject.State || session.State != (int) SessionState.Started)
            {
                session.State = (int) SessionState.Stopped;
                session.StateMessage =
                    string.Format("Ping at {0} failed. Invalid session state. Client: {1}, Server: {2}",
                        DateTime.Now, (SessionState) sessionViewObject.State, (SessionState) session.State);
            }
            else
            {
                session.StateMessage = string.Format("Ping at {0} successfull", DateTime.Now);
            }
            session.ChangedDate = DateTime.Now;
            _sessionRepository.Submit(false);
            return session;
        }

        public SessionViewObject CancelSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            using (var t = new TransactionScope(TransactionScopeOption.Required, new TransactionOptions
            {
                IsolationLevel = IsolationLevel.Serializable
            }))
            {
                var session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser);
                if (session == null)
                    return null;
                if (session.State == (int) SessionState.Started)
                {
                    session.State = (int) SessionState.Stopped;
                    session.StateMessage = string.Format("Cancelled at {0} successfull", DateTime.Now);
                }
                else
                {
                    session.StateMessage =
                        string.Format("Cancel session at {0} failed. Invalid session state. Client: {1}, Server: {2}",
                            DateTime.Now, (SessionState) sessionViewObject.State, (SessionState) session.State);
                }
                session.ChangedDate = DateTime.Now;
                _sessionRepository.Submit(false);
                t.Complete();
                return session;
            }
        }

        public SessionViewObject CompleteSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            using (var t = new TransactionScope(TransactionScopeOption.Required, new TransactionOptions
            {
                IsolationLevel = IsolationLevel.Serializable
            }))
            {
                var session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser);
                if (session == null)
                    return null;
                if (session.State == (int)SessionState.Started)
                {
                    session.State = (int)SessionState.Completed;
                    session.StateMessage = string.Format("Completed at {0} successfull", DateTime.Now);
                }
                else
                {
                    session.StateMessage =
                        string.Format("Complete session at {0} failed. Invalid session state. Client: {1}, Server: {2}",
                            DateTime.Now, (SessionState)sessionViewObject.State, (SessionState)session.State);
                }
                session.ChangedDate = DateTime.Now;
                _sessionRepository.Submit(false);
                t.Complete();
                return session;
            }
        }
    }
}