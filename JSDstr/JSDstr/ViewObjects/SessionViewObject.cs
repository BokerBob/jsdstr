using System;
using System.Web.Helpers;
using JSDstr.Models;
using Newtonsoft.Json;

namespace JSDstr.ViewObjects
{
    public class SessionViewObject : BaseViewObject<Session>
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
        }

        public DateTime CreatedDate { get; set; }
        public DateTime ChangedDate { get; set; }
        public Guid Guid { get; set; }
        public string UserName { get; set; }
        public int State { get; set; }
        public string StateMessage { get; set; }

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
