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
            if(!User.Identity.IsAuthenticated && (Session["IsAuthorized"] == null || (bool)Session["IsAuthorized"] == false))
                return View("Login");
            ViewBag.RenderStatistics = true;
            return View("Processing");
        }

        public ActionResult Login() 
        {
            return View("Login");
        }

        [HttpPost]
        public ActionResult Logout(string returnUrl) 
        {
            FormsAuthentication.SignOut();
            return RedirectPermanent(returnUrl);
        }

        [HttpPost]
        public bool SignIn(string email, string pwd, bool remember) 
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pwd))
                return false;
            Session["IsAuthorized"] = true;
            return true;
        }

        [HttpPost]
        public bool SignUp(string email, string pwd)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pwd))
                return false;
            Session["IsAuthorized"] = true;
            return true;
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
