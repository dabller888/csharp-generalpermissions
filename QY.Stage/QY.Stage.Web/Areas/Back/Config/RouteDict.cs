using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QY.Stage.Web.Areas.Back.Config {
    public static class RouteDict {
        public static Dictionary<String, String> GetRouteDict() {
            Dictionary<String, String> views = new Dictionary<string, string>();
            views.Add("view", "/Back/Home/Info");

            return views;
        }
    }
}