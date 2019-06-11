using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using QY.Stage.Frameworks.Utility;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.BLL;

namespace QY.Stage.Web.Areas.Back.Controllers {
    public class LoginController : Controller {

        //登录
        public ActionResult Index() {
            return View();
        }

        [HttpPost]
        public ActionResult SignIn(string UserName, string Passwd, string ImgCode) {
            var result = new ResponseParams();
            SysUserService userService = new SysUserService();
            UserName = UserName.InputFilterSql();
            string desPasswd = Encrypt.Encode(Passwd);
            SysUser user = userService.Get(u => u.LoginName == UserName && u.LoginPass == desPasswd);
            //验证用户
            if (user != null) {
                if (user.IsEnabled == 0) {
                    return Json(new {
                        Code = 4,
                        UserName = string.Empty,
                        Message = "账号被冻结！"
                    }, JsonRequestBehavior.DenyGet);
                }
                string[] level = new string[] {"弱","中","强","非常强" };
                int num = Encrypt.Decode(user.LoginPass).GetPasswdSecurityLevel();
                user.Address = level[num > 0 ? num - 1 : 0];
                user.LoginPass = string.Empty;
                Session.Add("UserInfo", user);
                object code = HttpContext.Cache.Get(Encrypt.MD5(ImgCode.ToLower()));
                if (code == null) {
                    return Json(new {
                        Code = 2,
                        UserName = string.Empty,
                        Message = "输入验证码失效！"
                    }, JsonRequestBehavior.DenyGet);
                }
                if (Convert.ToString(code).ToLower() != ImgCode.ToLower()) {
                    return Json(new {
                        Code = 3,
                        UserName = string.Empty,
                        Message = "输入验证码错误！"
                    }, JsonRequestBehavior.DenyGet);
                }

                return Json(new {
                    Code = 1,
                    UserName = user.LoginName,
                    Message = ""
                }, JsonRequestBehavior.DenyGet);
            }
            return Json(new {
                Code = 0,
                UserName = String.Empty,
                Message = "输入用户名或密码错误！"
            }, JsonRequestBehavior.DenyGet);
        }

        //登出
        [HttpGet]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult SignOut() {
            if (Session["UserInfo"] != null) {
                SysUser user = (SysUser)Session["UserInfo"];
                Session["UserInfo"] = null;
                if (Session[user.LoginName + "module"] != null)
                    Session[user.LoginName + "module"] = null;
                if (Session[user.LoginName + "action"] != null)
                    Session[user.LoginName + "action"] = null;
                if (Session["action"] != null)
                    Session["action"] = null;
            }
            return Redirect("/Back/Login");//RedirectToAction
        }
        //验证码
        [HttpGet]
        public ActionResult GetVerifyCode() {
            string code = "";
            ValidateCode_Style1 validateCode = new ValidateCode_Style1();
            byte[] bytes = validateCode.CreateImage(out code);
            HttpRuntime.Cache.Insert(Encrypt.MD5(code.ToLower()), code, null, DateTime.Now.AddMinutes(2), System.Web.Caching.Cache.NoSlidingExpiration);//page.cache->httpcontext.cache->httpruntime.cache
            return File(bytes, @"image/jpeg"); ;
        }
    }
}
