using System;
using System.Linq;
using System.Transactions;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;
using JSDstr.ViewObjects;

namespace JSDstr.Services
{
    public class SessionService : BaseService, ISessionService
    {
        private readonly IRepository<Session> _sessionRepository = new SqlRepository<Session>();
        private readonly ICalculationService _calculationService = KmeansService.Instance;

        private const int IdleTimeToTerminate = 10000;

        private bool HandleCalculationState(CalculationTaskViewObject task, Session session, ref string logMsg)
        {
            _sessionRepository.BeginContext();
            var successful = true;
            if (task.State == (int)KmeansCalculationState.Failed)
            {
                session.State = (int)SessionState.Stopped;
                session.StateMessage = "Session calculation failed";
                logMsg = string.Format("Session [{0}] calculation failed", session.Guid);
                successful = false;
            }
            else if (task.State == (int)KmeansCalculationState.Completed)
            {
                session.State = (int)SessionState.Stopped;
                session.StateMessage = "Session calculation completed";
                logMsg = string.Format("Session [{0}] calculation completed", session.Guid);
                successful = false;
            }
            else if (task.State == (int)KmeansCalculationState.Error)
            {
                session.State = (int)SessionState.Stopped;
                session.StateMessage = "Session calculation error";
                logMsg = string.Format("Session [{0}] calculation error", session.Guid);
                successful = false;
            }
            else if (task.State == (int)KmeansCalculationState.Busy)
            {
                session.State = (int)SessionState.Stopped;
                session.StateMessage = "Session calculation busy";
                logMsg = string.Format("Session [{0}] calculation busy", session.Guid);
                successful = false;
            }
            _sessionRepository.Submit();
            return successful;
        }

        private void TerminateInactiveSessions()
        {
            var deadlineTerminateDate = DateTime.Now.AddMilliseconds(-IdleTimeToTerminate);
            var logMsg = "";
            _sessionRepository.BeginContext();
            var inactiveSessions = _sessionRepository.Entities.Where(x =>
                x.State == (int)SessionState.Started &&
                x.ChangedDate < deadlineTerminateDate);
            foreach (var inactiveSession in inactiveSessions)
            {
                inactiveSession.State = (int)SessionState.Stopped;
                inactiveSession.ChangedDate = DateTime.Now;
                if (!HandleCalculationState(_calculationService.CancelTask(new CalculationTaskViewObject { SessionGuid = inactiveSession.Guid }), inactiveSession, ref logMsg))
                {
                    Log(logMsg, LogType.Warning);
                }
            }
            if (inactiveSessions.Any())
                Log(string.Format("Inactive sessions terminated. Sessions ids: [{0}]",
                    inactiveSessions.Select(x => x.Id.ToString()).ToList().Aggregate((a, b) => (a + "," + b))));
            _sessionRepository.Submit(false);
        }

        public SessionViewObject CreateSession(string loggedUser)
        {
            try
            {
                var logMsg = "";
                TerminateInactiveSessions();
                var session = new Session
                {
                    UserName = loggedUser,
                    State = (int) SessionState.Started,
                    StateMessage = "Created successfull",
                    Guid = Guid.NewGuid()
                };
                session = _sessionRepository.Insert(session);
                var calculationTask = _calculationService.GetTask(new CalculationTaskViewObject
                {
                    SessionGuid = session.Guid
                });
                if (!HandleCalculationState(calculationTask, session, ref logMsg))
                {
                    Log(logMsg, LogType.Error);
                }
                else
                {
                    Log(string.Format("Session [{0}] created successfull", session.Guid));
                }
                var sessionViewObject = new SessionViewObject(session)
                {
                    CalculationTask = calculationTask
                };
                return sessionViewObject;
            }
            catch (Exception ex)
            {
                Log(ex);
                return null;
            }
        }

        public SessionViewObject PingSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            try
            {
                var logType = LogType.Info;
                string logMsg;
                _sessionRepository.BeginContext();
                var session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser);
                if (session == null)
                {
                    logMsg = "Ping session failed. Session is null";
                    Log(logMsg, LogType.Warning);
                    return null;
                }
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
                Log(logMsg, logType);
                return session;
            }
            catch (Exception ex)
            {
                LogService.Log(ex);
                return null;
            }
        }

        public SessionViewObject CancelSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            try
            {
                string logMsg = "";
                var logType = LogType.Info;
                CalculationTaskViewObject calculationTask = null;
                _sessionRepository.BeginContext();
                var session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser);
                if (session == null)
                {
                    logMsg = "Cancel session failed. Session is null";
                    Log(logMsg, LogType.Warning);
                    return null;
                }
                if (session.State == (int) SessionState.Started)
                {
                    calculationTask = _calculationService.CancelTask(new CalculationTaskViewObject {SessionGuid = session.Guid});
                    if (HandleCalculationState(calculationTask, session, ref logMsg))
                    {
                        session.State = (int) SessionState.Stopped;
                        session.StateMessage = "Cancelled successfull";
                        logMsg = string.Format("Session [{0}] cancel successfull", session.Guid);
                    }
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
                Log(logMsg, logType);
                return new SessionViewObject(session)
                {
                    CalculationTask = calculationTask
                };
            }
            catch (Exception ex)
            {
                Log(ex);
                return null;
            }
        }

        public SessionViewObject CompleteSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            try
            {
                string logMsg = "";
                var logType = LogType.Info;
                CalculationTaskViewObject calculationTask = null;
                _sessionRepository.BeginContext();
                var session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser);
                if (session == null)
                {
                    logMsg = "Complete session failed. Session is null";
                    Log(logMsg, LogType.Warning);
                    return null;
                }                
                if (session.State == (int) SessionState.Started)
                {
                    calculationTask = _calculationService.CompleteTask(sessionViewObject.CalculationTask);
                    if (HandleCalculationState(calculationTask, session, ref logMsg))
                    {
                        session.State = (int) SessionState.Completed;
                        session.StateMessage = "Completed successfull";
                        logMsg = string.Format("Session [{0}] complete successfull", session.Guid);
                    }
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
                LogService.Log(logMsg, logType);
                return new SessionViewObject(session)
                {
                    CalculationTask = calculationTask
                };
            }
            catch (Exception ex)
            {
                Log(ex);
                return null;
            }
        }
    }
}