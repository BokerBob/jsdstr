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

    public class BaseViewObject<TEntityType> : ISeriazable, IViewObject<TEntityType> where TEntityType : BaseModel, new()
    {
        private readonly TEntityType _source;

        public BaseViewObject()
        {
            _source = new TEntityType();
        }

        public BaseViewObject(TEntityType source)
        {
            if (source == null)
                throw new ArgumentNullException("source");
            _source = source;
        }

        public static BaseViewObject<TEntityType> Empty
        {
            get { return new BaseViewObject<TEntityType>(new TEntityType()); }
        }

        [JsonIgnore]
        protected TEntityType Source
        {
            get { return _source; }
        }

        public static implicit operator JsonResult(BaseViewObject<TEntityType> viewObject)
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