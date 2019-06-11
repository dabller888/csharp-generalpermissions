using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QY.Stage.Web.Areas.Back.Controllers {
    [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
    public class HomeController : Controller {
        
        public ActionResult Main() {
            return View();
        }
        public ActionResult Info() {
            return View();
        }
    }
}
