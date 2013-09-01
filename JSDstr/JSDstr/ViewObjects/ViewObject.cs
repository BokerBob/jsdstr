using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using JSDstr.Models;
using JSDstr.Interfaces;

namespace JSDstr.ViewObjects
{
    public enum ViewObjectType
    {
        PageObject, ScriptingObject
    }

    public class ViewObject<TEntityType> : ISeriazable, IViewObject<TEntityType> where TEntityType : BaseModel, new()
    {
        private readonly TEntityType _source;

        public ViewObject()
        {
            _source = new TEntityType();
        }

        public ViewObject(TEntityType source)
        {
            if (source == null)
                throw new ArgumentNullException("source");
            _source = source;
        }

        public static ViewObject<TEntityType> Empty
        {
            get { return new ViewObject<TEntityType>(new TEntityType()); }
        }

        [JsonIgnore]
        protected TEntityType Source
        {
            get { return _source; }
        }

        public static implicit operator JsonResult(ViewObject<TEntityType> viewObject)
        {
            return new JsonResult
            {
                Data = viewObject,
                JsonRequestBehavior = JsonRequestBehavior.DenyGet
            };
        }

        protected static JavaScriptSerializer _javaScriptSerializer = new JavaScriptSerializer();
    }
}