using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Http;

namespace QY.Stage.Web.Areas.Front {
    public class FrontArea : AreaRegistration {

        public override string AreaName {
            get { return "Front"; }
        }

        public override void RegisterArea(AreaRegistrationContext context) {
            //Web API的路由映射
            context.Routes.MapHttpRoute("Front_area"
                , "api/Front/{controller}/{action}/{id}"
                , new { controller = "Home", action = "Index", id = RouteParameter.Optional }
                , new string[] { "QY.Stage.Web.Areas.Front.Controllers" });

            //MVC的路由配置
            context.MapRoute("FrontDefault"
                , "Front/{controller}/{action}/{id}"
                , new { controller = "Home", action = "Index", id = UrlParameter.Optional }
                , new string[] { "QY.Stage.Web.Areas.Front.Controllers" });
        }

    }
}