using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QY.Stage.Web.Areas.Back.Controllers {
    public class BaseController : Controller {
        #region /*View Action*/
        public ActionResult Index() {
            return View();
        }

        public ActionResult Add() {
            return View();
        }

        public ActionResult Edit() {
            return View();
        }
        #endregion

        #region /****Go Action****/

        #endregion

        protected override void OnActionExecuting(ActionExecutingContext filterContext) {
            base.OnActionExecuting(filterContext);
            //判断登录
            //判断是否有该模块功能
        }

    }
}
