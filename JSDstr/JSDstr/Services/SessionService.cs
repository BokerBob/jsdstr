using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Repositories;
using System.Threading;

namespace JSDstr.Services
{
    public class SessionService : ISessionService
    {
        private readonly IRepository<Session> _sessionRepository = new SqlRepository<Session>();

        private const int ThreadSleep = 100;

        private Session GetActiveSession(string userName) 
        {
            return _sessionRepository.Entities.SingleOrDefault(x => x.UserName == userName && x.State == (int)SessionState.Started);
        }

        private void CheckSession(object sessionId) 
        {
            var sessionIdInt = (int)sessionId;
            var session = _sessionRepository.Entities.SingleOrDefault(x => x.Id == sessionIdInt);
            if (session != null)
            {
                if (session.State == (int)SessionState.Started)
                {
                    var now = DateTime.Now;
                    if (session.ChangedDate < DateTime.Now.AddMinutes(1))
                    {
                        session.State = (int)SessionState.Stopped;
                        session.ChangedDate = now;
                        _sessionRepository.Submit();
                        Thread.CurrentThread.Abort();
                        //logging
                    }
                    else
                    {
                        Thread.Sleep(ThreadSleep);
                    }
                }
                else 
                {
                    Thread.CurrentThread.Abort();
                }
            }
            else 
            {
                Thread.CurrentThread.Abort();
                // logging
            }
        }

        public bool CreateSession(string userName)
        {
            var session = new Session
            {
                UserName = userName,
                State = (int)SessionState.Started,
                DataId = 0,
                StatisticsId = 0
            };
            _sessionRepository.Insert(session);
            var thread = new Thread(CheckSession);
            thread.Start(session.Id); // todo: get id of inserted element at insert
            return true;
            // todo: implement throad for checking session state
        }

        public bool PingSession(string userName)
        {
            var session = GetActiveSession(userName);
            if (session != null)
            {
                session.ChangedDate = DateTime.Now;
                _sessionRepository.Submit();
                return true;
            }
            else 
            {
                // logging
                return false;
            }
        }
        
        public bool CompleteSession(string userName)
        {
            var session = GetActiveSession(userName);
            if (session != null)
            {
                session.ChangedDate = DateTime.Now;
                session.State = (int)SessionState.Completed;
                _sessionRepository.Submit();
                return true;
            }
            else
            {
                // logging
                return false;
            }
        }
    }
}