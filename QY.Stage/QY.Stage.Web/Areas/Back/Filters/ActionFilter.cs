using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using QY.Stage.Frameworks.Utility;
using QY.Stage.PocoModel;
using QY.Stage.Frameworks.BLL;

namespace QY.Stage.Web.Areas.Back.Filters {
    /// <summary>
    /// 授权过滤器
    /// 1.视图过滤器
    /// 2.GO操作过滤器
    /// </summary>

    public class ActionAuthFilter : AuthorizeAttribute {
        //protected override bool AuthorizeCore(HttpContextBase httpContext) {
        //    return true;
        //}
        
        protected override bool AuthorizeCore(HttpContextBase httpContext) {
            if (HttpContext.Current.Session["UserInfo"] == null) {
                HttpContext.Current.Response.Write("<script>top.location.href='/Back/Login';</script>");
                HttpContext.Current.Response.End();
                return false;
            } else {
                SysUser user = (SysUser)HttpContext.Current.Session["UserInfo"];
                if (HttpContext.Current.Session[user.LoginName + "module"] == null
                    || HttpContext.Current.Session[user.LoginName + "action"] == null) {
                    HttpContext.Current.Response.Write("<script>top.location.href='/Back/Login';</script>");
                    HttpContext.Current.Response.End();
                    return false;
                }
                List<UserRoleModule> modules = HttpContext.Current.Session[user.LoginName + "module"] as List<UserRoleModule>;
                List<UserModuleAction> actions = HttpContext.Current.Session[user.LoginName + "action"] as List<UserModuleAction>;

                string _area = httpContext.Request.RequestContext.RouteData.DataTokens["area"] == null ? "Back" : httpContext.Request.RequestContext.RouteData.DataTokens["area"].ToString();
                string _controller = httpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
                string _action = httpContext.Request.RequestContext.RouteData.Values["action"].ToString();
                string _url = string.Format("/{0}/{1}/{2}", _area, _controller, _action);
                
                //动作权限
                string xpath = string.Format("//Controller[@key='{0}']/Action[@name='{1}']", _controller, _action);
                string actionCfg = HttpContext.Current.Server.MapPath("~/Areas/Back/Config/action-attr.xml");
                XmlHelper xmlHelper = new XmlHelper(actionCfg);
                string tmpAction = xmlHelper.GetAttributeValue(xpath, "value");
                bool allow = false;
                if (tmpAction.IndexOf("*") < 0) {
                    foreach (var action in actions) {
                        if (!string.IsNullOrEmpty(tmpAction) && tmpAction.Contains(action.ParaName)) allow = true;
                    }
                } else {
                    allow = true;
                }
                if (!allow) {
                    HttpContext.Current.Response.Write("<script>$.messager.alert(\"友情提示\", \"您没有权限进行改操作！\", \"warning\");</script>");
                    HttpContext.Current.Response.End();
                    return false;
                }
            }
            return true;
        }
    }
}