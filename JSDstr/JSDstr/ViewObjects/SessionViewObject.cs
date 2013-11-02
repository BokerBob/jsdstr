using System;
using System.Web.Helpers;
using JSDstr.Models;
using Newtonsoft.Json;

namespace JSDstr.ViewObjects
{
    public class SessionViewObject : ViewObject<Session>
    {
        public SessionViewObject()
        {
        }

        public SessionViewObject(Session source) : base(source)
        {
            CreatedDate = source.CreatedDate;
            ChangedDate = source.ChangedDate;
            Guid = source.Guid;
            UserName = source.UserName;
            State = source.State;
            StateMessage = source.StateMessage;
            CalculationId = source.CalculationId;
            CalculationTime = source.CalculationTime;
        }

        public DateTime CreatedDate { get; set; }
        public DateTime ChangedDate { get; set; }
        public Guid Guid { get; set; }
        public string UserName { get; set; }
        public SessionState State { get; set; }
        public string StateMessage { get; set; }
        public int CalculationId { get; set; }
        public int CalculationTime { get; set; }

        public CalculationTaskViewObject CalculationTask { get; set; }

        public static explicit operator SessionViewObject(string viewObjectJson)
        {
            return JsonConvert.DeserializeObject<SessionViewObject>(viewObjectJson);
        }

        public static implicit operator SessionViewObject(Session session)
        {
            return new SessionViewObject(session);
        }
    }
}
