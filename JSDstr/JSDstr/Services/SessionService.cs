using System;
using System.Linq;
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
        private readonly ISettingsService _settingsService = new SettingsService();

        private const int IdleTimeToTerminate = 10000;

        private bool HandleCalculationState(CalculationTaskViewObject task, Session session, ref string logMsg)
        {
            _sessionRepository.BeginContext();
            var successful = true;
            if (task.State == CalculationState.Failed)
            {
                session.State = SessionState.Stopped;
                session.StateMessage = "Session calculation failed";
                logMsg = string.Format("Session [{0}] calculation failed", session.Guid);
                successful = false;
            }
            else if (task.State == CalculationState.Completed)
            {
                session.State = SessionState.Stopped;
                session.StateMessage = "Session calculation completed";
                logMsg = string.Format("Session [{0}] calculation completed", session.Guid);
                successful = false;
            }
            else if (task.State == CalculationState.Error)
            {
                session.State = SessionState.Stopped;
                session.StateMessage = "Session calculation error";
                logMsg = string.Format("Session [{0}] calculation error", session.Guid);
                successful = false;
            }
            else if (task.State == CalculationState.Busy)
            {
                session.State = SessionState.Stopped;
                session.StateMessage = "Session calculation busy";
                logMsg = string.Format("Session [{0}] calculation busy", session.Guid);
                successful = false;
            }
            _sessionRepository.Submit();
            return successful;
        }

        private void TerminateInactiveSessions(int calculationId)
        {
            if (calculationId == 0)
                return;
            var deadlineTerminateDate = DateTime.Now.AddMilliseconds(-IdleTimeToTerminate);
            var logMsg = "";
            _sessionRepository.BeginContext();
            var inactiveSessions = _sessionRepository.Entities.Where(x =>
                x.State == SessionState.Started &&
                x.ChangedDate < deadlineTerminateDate &&
                x.CalculationId == calculationId);
            foreach (var inactiveSession in inactiveSessions)
            {
                inactiveSession.State = SessionState.Stopped;
                inactiveSession.ChangedDate = DateTime.Now;
                if (!HandleCalculationState(_calculationService.CancelTask(new CalculationTaskViewObject { SessionGuid = inactiveSession.Guid }), inactiveSession, ref logMsg))
                {
                    Log(logMsg, LogType.Warning);
                }
            }
            if (inactiveSessions.Any())
            {
                Log(string.Format("Inactive sessions terminated. Sessions ids: [{0}]",
                    inactiveSessions.Select(x => x.Id.ToString()).ToList().Aggregate((a, b) => (a + "," + b))));
                _sessionRepository.Submit(false);
            }
        }

        public SessionViewObject CreateSession(SessionViewObject sessionViewObject, string loggedUser)
        {
            try
            {
                var logMsg = "";
                var calculationId = _settingsService.CurrentCalculationId;
                TerminateInactiveSessions(calculationId);
                var session = new Session
                {
                    UserName = loggedUser,
                    State = SessionState.Started,
                    StateMessage = "Created successfull",
                    Guid = Guid.NewGuid(),
                    CalculationId = calculationId
                };
                session = _sessionRepository.Insert(session);
                var calculationTask = _calculationService.GetTask(new CalculationTaskViewObject
                {
                    SessionGuid = session.Guid,
                    VectorsCached = sessionViewObject.CalculationTask.VectorsCached
                });
                if (!HandleCalculationState(calculationTask, session, ref logMsg))
                {
                    Log(logMsg, LogType.Error);
                }
                else
                {
                    session.CalculationId = calculationTask.CalculationId;
                    _sessionRepository.Submit();
                    Log(string.Format("Session [{0}] created successfull", session.Guid));
                }
                sessionViewObject = new SessionViewObject(session)
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
                var calculationId = _settingsService.CurrentCalculationId;
                _sessionRepository.BeginContext();
                var session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser &&
                    x.CalculationId == calculationId);
                if (session == null)
                {
                    logMsg = "Ping session failed. Session is null";
                    Log(logMsg, LogType.Warning);
                    return null;
                }
                if (session.State != sessionViewObject.State || session.State != SessionState.Started)
                {
                    session.State = SessionState.Stopped;
                    session.StateMessage =
                        string.Format("Ping failed. Invalid session state. Client: {0}, Server: {1}",
                            sessionViewObject.State, session.State);
                    logMsg = string.Format(
                        "Session [{0}] ping failed. Invalid session state. Client: [{1}], Server: [{2}]", session.Guid,
                        sessionViewObject.State, session.State);
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
                var calculationId = _settingsService.CurrentCalculationId;
                CalculationTaskViewObject calculationTask = null;
                _sessionRepository.BeginContext();
                var session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser &&
                    x.CalculationId == calculationId);
                if (session == null)
                {
                    logMsg = "Cancel session failed. Session is null";
                    Log(logMsg, LogType.Warning);
                    return null;
                }
                if (session.State == SessionState.Started)
                {
                    calculationTask = _calculationService.CancelTask(new CalculationTaskViewObject {SessionGuid = session.Guid});
                    if (HandleCalculationState(calculationTask, session, ref logMsg))
                    {
                        session.State = SessionState.Stopped;
                        session.StateMessage = "Cancelled successfull";
                        logMsg = string.Format("Session [{0}] cancel successfull", session.Guid);
                    }
                }
                else
                {
                    session.StateMessage =
                        string.Format("Cancel failed. Invalid session state. Client: {0}, Server: {1}",
                            sessionViewObject.State, session.State);
                    logMsg = string.Format(
                        "Session [{0}] cancel failed. Invalid session state. Client: [{1}], Server: [{2}]",
                        session.Guid,
                        sessionViewObject.State, session.State);
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
                var calculationId = _settingsService.CurrentCalculationId;
                CalculationTaskViewObject calculationTask = null;
                _sessionRepository.BeginContext();
                var session = _sessionRepository.Entities.SingleOrDefault(x =>
                    x.Guid == sessionViewObject.Guid &&
                    x.UserName == sessionViewObject.UserName &&
                    x.UserName == loggedUser &&
                    x.CalculationId == calculationId);
                if (session == null)
                {
                    logMsg = "Complete session failed. Session is null";
                    Log(logMsg, LogType.Warning);
                    return null;
                }                
                if (session.State == SessionState.Started)
                {
                    calculationTask = _calculationService.CompleteTask(sessionViewObject.CalculationTask);
                    if (HandleCalculationState(calculationTask, session, ref logMsg))
                    {
                        session.State = SessionState.Completed;
                        session.StateMessage = "Completed successfull";
                        logMsg = string.Format("Session [{0}] complete successfull", session.Guid);
                    }
                }
                else
                {
                    session.StateMessage =
                        string.Format("Complete failed. Invalid session state. Client: {0}, Server: {1}",
                            sessionViewObject.State, session.State);
                    logMsg = string.Format(
                        "Session [{0}] complete failed. Invalid session state. Client: [{1}], Server: [{2}]",
                        session.Guid, sessionViewObject.State, session.State);
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