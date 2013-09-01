using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using Newtonsoft.Json;
using JSDstr.Interfaces;

namespace JSDstr.ViewObjects
{
    [JsonObject(MemberSerialization.OptOut)]
    public class ViewObjectCollection<TViewObject> : IViewObjectCollection<TViewObject>, ISeriazable
    {
        private readonly TViewObject[] _viewObjects;

        public TViewObject[] ViewObjects
        {
            get
            {
                return _viewObjects;
            }
        }

        public ViewObjectCollection(TViewObject[] viewObjects)
        {
            if (viewObjects == null)
                throw new ArgumentNullException("viewObjects");
            _viewObjects = viewObjects;
        }

        public IEnumerator<TViewObject> GetEnumerator()
        {
            return ((IEnumerable<TViewObject>)ViewObjects).GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        public string ToJson()
        {
            return JsonConvert.SerializeObject(this);
        }
    }

}