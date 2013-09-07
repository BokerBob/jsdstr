using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using JSDstr.Services;
using JSDstr.Interfaces;

namespace JSDstr.Controllers
{
    public class AccountController : Controller
    {
        private readonly ISettingsService _settingsService = new SettingsService();

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
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pwd) || (email.StartsWith("anonym.") && email.EndsWith("@jsdstr.com")))
                return false;
            if (Membership.ValidateUser(email, pwd))
            {
                FormsAuthentication.SetAuthCookie(email, remember);
                return true;
            }
            return false;
        }
        
        [HttpPost]
        public bool SignInAnonym()
        {
            var anonymUsersCount = _settingsService.GetAnonymUsersCount();
            var email = string.Format("anonym.{0}@jsdstr.com", ++anonymUsersCount);
            var pwd = Guid.NewGuid().ToString();
            try
            {
                var user = Membership.CreateUser(email, pwd, email);
                if (user != null)
                {
                    if (Membership.ValidateUser(email, pwd))
                    {
                        FormsAuthentication.SetAuthCookie(email, false);
                        _settingsService.SetAnonymUsersCount(anonymUsersCount);
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
                return false;
            }
            return false;
        }

        [HttpPost]
        public bool SignUp(string email, string pwd)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pwd))
                return false;
            try
            {
                var user = Membership.CreateUser(email, pwd, email);
                if (user != null)
                {
                    if (Membership.ValidateUser(email, pwd))
                    {
                        FormsAuthentication.SetAuthCookie(email, true);
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
                return false;
            }
            return false;
        }

        public ActionResult LogOut(string returnUrl)
        {
            FormsAuthentication.SignOut();
            return Redirect(returnUrl);
        }
    }
}
