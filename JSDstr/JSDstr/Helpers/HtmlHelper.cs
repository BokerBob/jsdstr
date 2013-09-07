using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JSDstr.Helpers
{
    public static class HtmlHelper
    {
        public static MvcHtmlString SetActiveClass(this System.Web.Mvc.HtmlHelper htmlHelper, string matchUrl) 
        {
            var url = HttpContext.Current.Request.Url.AbsolutePath;
            var activeClass = "class=active";
            return url == matchUrl ? new MvcHtmlString(activeClass) : new MvcHtmlString("");
        }
    }
}