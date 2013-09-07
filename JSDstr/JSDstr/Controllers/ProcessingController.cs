using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace JSDstr.Controllers
{
    public class ProcessingController : Controller
    {
        public ActionResult Index()
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToRoute("Login", new { returnUrl = "/processing" });
            ViewBag.RenderStatistics = true;
            return View("Processing");
        }
        
        public ActionResult Results() 
        {
            ViewBag.RenderStatistics = true;
            return View("Results");
        }

        public ActionResult Statistics() 
        {
            return PartialView("Statistics");
        }
    }
}
