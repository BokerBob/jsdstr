using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
        public TEntityType Source
        {
            get { return _source; }
        }

        public string ToJson()
        {
            return JsonConvert.SerializeObject(this);
        }
    }

}