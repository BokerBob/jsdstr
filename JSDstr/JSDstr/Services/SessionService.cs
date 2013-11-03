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

        private const int IdleTimeToTerminate = 60000;

        private bool HandleCalculationState(CalculationTaskViewObject task, Session session, ref string logMsg)
        {
            var successful = true;
            if (task.State == CalculationState.Failed)
            {
                session.StateMessage = "Calculation failed";
                logMsg = string.Format("Session [{0}] calculation failed", session.Guid);
                successful = false;
            }
            else if (task.State == CalculationState.Completed)
            {
                session.StateMessage = "Calculation completed";
                logMsg = string.Format("Session [{0}] calculation completed", session.Guid);
                successful = false;
            }
            else if (task.State == CalculationState.Error)
            {
                session.StateMessage = "Calculation error";
                logMsg = string.Format("Session [{0}] calculation error", session.Guid);
                successful = false;
            }
            else if (task.State == CalculationState.Busy)
            {
                session.StateMessage = "Calculation busy";
                logMsg = string.Format("Session [{0}] calculation busy", session.Guid);
                successful = false;
            }
            return successful;
        }

        private void TerminateInactiveSessions(int calculationId)
        {
            if (calculationId == 0)
                return;
            var deadlineTerminateDate = DateTime.Now.AddMilliseconds(-IdleTimeToTerminate);
            var logMsg = "";
            var inactiveSessions = _sessionRepository.Entities.Where(x =>
                x.State == SessionState.Started &&
                x.ChangedDate < deadlineTerminateDate &&
                x.CalculationId == calculationId).ToArray();
            var anyTerminated = false;
            foreach (var inactiveSession in inactiveSessions)
            {
                var taskResult = _calculationService.CancelTask(new CalculationTaskViewObject
                {
                    SessionGuid = inactiveSession.Guid
                });
                if (!HandleCalculationState(taskResult, inactiveSession, ref logMsg))
                {
                    Log(logMsg, LogType.Warning);
                }
                else
                {
                    inactiveSession.State = SessionState.Stopped;
                    inactiveSession.StateMessage = "Terminated as inactive";
                    _sessionRepository.Save(inactiveSession);
                    anyTerminated = true;
                }
            }
            if (anyTerminated)
            {
                Log(string.Format("Inactive sessions terminated. Sessions guids: [{0}]",
                    inactiveSessions.Select(x => x.Guid.ToString()).ToList().Aggregate((a, b) => (a + "," + b))));
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
                var calculationTask = _calculationService.GetTask(new CalculationTaskViewObject
                {
                    SessionGuid = session.Guid,
                    VectorsCached = sessionViewObject.CalculationTask.VectorsCached
                });                
                if (!HandleCalculationState(calculationTask, session, ref logMsg))
                {
                    session.State = SessionState.Stopped;
                    session.CalculationId = calculationTask.CalculationId;
                    Log(logMsg, LogType.Error);
                }
                else
                {
                    session.CalculationId = calculationTask.CalculationId;
                    Log(string.Format("Session [{0}] created successfull", session.Guid));
                }
                session = _sessionRepository.Insert(session);
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
                _sessionRepository.Save(session);
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
                _sessionRepository.Save(session);
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
                    else
                    {
                        session.State = SessionState.Stopped;
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
                _sessionRepository.Save(session);
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