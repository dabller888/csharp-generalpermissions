using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using System.Web.Mvc;

namespace QY.Stage.Web.Filters {
    public class AuthAttribute : AuthorizeAttribute {
        protected override bool AuthorizeCore(HttpContextBase httpContext) {
            httpContext.Request.RequestContext.RouteData.GetRequiredString("controller");
            httpContext.Request.RequestContext.RouteData.GetRequiredString("action");



            return true;
        }
    }
}