using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QY.Stage.Web.Areas.Back {
    public class BackArea : AreaRegistration{
        public override string AreaName {
            get { return "Back"; }
        }

        public override void RegisterArea(AreaRegistrationContext context) {
            //忽略的路由context.Routes.IgnoreRoute("");

            context.MapRoute("BackDefault"
                , "Back/{controller}/{action}/{id}"
                , new { controller = "Home", action = "Index", id = UrlParameter.Optional }
                , new string[] { "QY.Stage.Web.Areas.Back.Controllers" });
        }
    }
}