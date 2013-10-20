using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using JSDstr.Interfaces;
using JSDstr.Services;

namespace JSDstr.Controllers
{
    public class ProcessingController : Controller
    {
        private readonly ISessionService _sessionService = new SessionService();

        [Authorize]
        public ActionResult Index()
        {
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

        [HttpPost, Authorize]
        public Guid CreateSession()
        {
            return _sessionService.CreateSession(User.Identity.Name);
        }

        [HttpPost, Authorize]
        public bool PingSession(Guid sessionGuid)
        {
            return _sessionService.PingSession(sessionGuid);
        }
    }
}
