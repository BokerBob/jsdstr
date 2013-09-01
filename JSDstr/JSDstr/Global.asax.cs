using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using JSDstr.Helpers;
using JSDstr.Models;
using JSDstr.Services;

namespace JSDstr
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("favicon.ico");

            routes.MapRoute(
                "Default",
                "",
                new { controller = "Home", action = "Index" }
            );

            routes.MapRoute(
                "About",
                "about",
                new { controller = "Home", action = "About" }
            );

            routes.MapRoute(
                "Processing",
                "processing",
                new { controller = "Processing", action = "Index" }
            );

            routes.MapRoute(
                "Results",
                "results",
                new { controller = "Processing", action = "Results" }
            );

            routes.MapRoute(
                "Login",
                "login",
                new { controller = "Account", action = "Login" }
            );

            routes.MapRoute(
                "Logout",
                "logout",
                new { controller = "Account", action = "Logout" }
            );

            routes.MapRoute(
                "404",
                "404",
                new {controller = "Home", action = "NotFound"}
            );

            routes.MapRoute(
                "500",
                "500",
                new {controller = "Home", action = "ServerError"}
            );

            routes.MapRoute(
                "Error",
                "error",
                new {controller = "Home", action = "GeneralError"}
            );

            routes.MapRoute(
                null,
                "{controller}/{action}/"
            );
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            var ex = Server.GetLastError();
            if (Response.StatusCode != 404)
            {
                LogService.Log(ex);
            }
        }
    }
}