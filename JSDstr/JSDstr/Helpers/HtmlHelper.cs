using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace JSDstr.Helpers
{
    public static class HtmlHelper
    {
        public static MvcHtmlString SetActiveClass(this System.Web.Mvc.HtmlHelper htmlHelper, string matchUrl) 
        {
            var url = HttpContext.Current.Request.Url.AbsolutePath;
            const string activeClass = "class=active";
            return url == matchUrl ? new MvcHtmlString(activeClass) : new MvcHtmlString("");
        }

        public static MvcHtmlString ToJson(this System.Web.Mvc.HtmlHelper htmlHelper, object o)
        {
            return new MvcHtmlString(JsonConvert.SerializeObject(o));
        }
    }
}