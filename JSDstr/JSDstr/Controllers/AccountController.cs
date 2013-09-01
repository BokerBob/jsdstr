using System;
using System.Web.Mvc;
using System.Web.Security;
using JSDstr.Models;
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

        [Authorize]
        public ActionResult Logout(string returnUrl)
        {
            if(User.Identity.IsAuthenticated)
                LogService.Log(string.Format("User [{0}] logged out", User.Identity.Name));
            FormsAuthentication.SignOut();
            return Redirect(!string.IsNullOrEmpty(returnUrl) ? returnUrl : "/");
        }

        [HttpPost]
        public bool SignIn(string email, string pwd, bool remember)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pwd) ||
                (email.StartsWith("anonym.") && email.EndsWith("@jsdstr.com")))
            {
                LogService.Log(
                    string.Format("Error sign in. Email: [{0}], Pwd: [{1}], Remember: [{2}]", email, pwd, remember),
                    LogType.Warning);
                return false;
            }
            if (Membership.ValidateUser(email, pwd))
            {
                FormsAuthentication.SetAuthCookie(email, remember);
                LogService.Log(string.Format("User signed in. Email: [{0}], Pwd: [{1}], Remember: [{2}]", email,
                    pwd, remember));
                return true;
            }
            LogService.Log(string.Format(
                    "Error sign in. Membership.ValidateUser failed. Email: [{0}], Pwd: [{1}], Remember: [{2}]", email,
                    pwd, remember), LogType.Warning);
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
                LogService.Log(string.Format("Anonym user created. Email: [{0}], Pwd: [{1}]", email, pwd));
                if (Membership.ValidateUser(email, pwd))
                {
                    FormsAuthentication.SetAuthCookie(email, false);
                    _settingsService.SetAnonymUsersCount(anonymUsersCount);
                    LogService.Log(string.Format("Anonym user signed in. Email: [{0}], Pwd: [{1}]", email, pwd));
                    return true;
                }
                LogService.Log(string.Format(
                    "Error anonym user sign in. Membership.ValidateUser failed. Email: [{0}], Pwd: [{1}]",
                    email, pwd), LogType.Warning);
                return false;
            }
            catch (MembershipCreateUserException e)
            {
                LogService.Log(string.Format("Anonym user sign up exception. Email: [{0}], Pwd: [{1}]. StatusCode: [{2}]. Exception: [{3}]", email,
                        pwd, e.StatusCode, e.Message), LogType.Warning);
                return false;
            }
        }

        [HttpPost]
        public string SignUp(string email, string pwd)
        {
            var error = Resources.Resources.Error_SignUp;
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pwd))
            {
                LogService.Log(string.Format("Error sign up. Email: [{0}], Pwd: [{1}]", email, pwd),
                    LogType.Warning);
                return error;
            }
            try
            {
                var user = Membership.CreateUser(email, pwd, email);
                LogService.Log(string.Format("User created. Email: [{0}], Pwd: [{1}]", email, pwd));
                if (Membership.ValidateUser(email, pwd))
                {
                    FormsAuthentication.SetAuthCookie(email, true);
                    LogService.Log(string.Format("Created user signed in. Email: [{0}], Pwd: [{1}]", email, pwd));
                    return "";
                }
                LogService.Log(string.Format(
                    "Error created user sign in. Membership.ValidateUser failed. Email: [{0}], Pwd: [{1}]",
                    email, pwd), LogType.Warning);
                return error;
            }
            catch (MembershipCreateUserException e)
            {
                LogService.Log(
                    string.Format(
                        "User sign up exception. Email: [{0}], Pwd: [{1}]. StatusCode: [{2}]. Exception: [{3}]",
                        email, pwd, e.StatusCode, e.Message), LogType.Warning);
                switch (e.StatusCode)
                {
                    case MembershipCreateStatus.DuplicateEmail:
                    case MembershipCreateStatus.DuplicateUserName:
                        error = Resources.Resources.Error_DuplicateEmail;
                        break;
                    case MembershipCreateStatus.InvalidEmail:
                        error = Resources.Resources.Error_Email;
                        break;
                    case MembershipCreateStatus.InvalidPassword:
                        error = Resources.Resources.Error_Password;
                        break;
                    default:
                        error = Resources.Resources.Error_SignUp;
                        break;
                }
                return error;
            }
        }
    }
}
