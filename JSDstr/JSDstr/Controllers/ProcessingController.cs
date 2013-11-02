using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using JSDstr.Interfaces;
using JSDstr.Models;
using JSDstr.Services;
using JSDstr.ViewObjects;

namespace JSDstr.Controllers
{
    public class ProcessingController : Controller
    {
        private readonly ISessionService _sessionService = new SessionService();
        private readonly IStatisticsService _statisticsService = new StatisticsService();
        private readonly IClusterizationResultsService _clusterizationResultsService = new ClusterizationResultsService();

        [Authorize]
        public ActionResult Index()
        {
            ViewBag.RenderStatistics = true;
            return View("Processing");
        }
        
        public ActionResult Results() 
        {
            ViewBag.RenderStatistics = true;
            return View("Results", _clusterizationResultsService.GetClusterizationResults());
        }

        public ActionResult Statistics() 
        {
            return PartialView("Statistics");
        }

        [HttpPost, Authorize]
        public JsonResult CreateSession(string sessionJson)
        {
            return _sessionService.CreateSession((SessionViewObject)sessionJson, User.Identity.Name);
        }

        [HttpPost, Authorize]
        public JsonResult PingSession(string sessionJson)
        {
            return _sessionService.PingSession((SessionViewObject) sessionJson, User.Identity.Name);
        }

        [HttpPost, Authorize]
        public JsonResult CancelSession(string sessionJson)
        {
            return _sessionService.CancelSession((SessionViewObject)sessionJson, User.Identity.Name);
        }

        [HttpPost, Authorize]
        public JsonResult CompleteSession(string sessionJson)
        {
            return _sessionService.CompleteSession((SessionViewObject)sessionJson, User.Identity.Name);
        }
        
        [HttpPost]
        public JsonResult GetStatistics(Guid? sessionGuid)
        {
            return _statisticsService.GetStatistics(sessionGuid);
        }
    }
}