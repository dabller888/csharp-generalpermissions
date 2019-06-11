using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using QY.Stage.PocoModel;
using QY.Stage.Frameworks.BLL;

namespace QY.Stage.Web.Areas.Back.Filters {
    /// <summary>
    /// 授权过滤器
    /// 1.视图过滤器
    /// 2.操作过滤器
    /// </summary>

    public class LoginAuthFilter : AuthorizeAttribute {
        protected override bool AuthorizeCore(HttpContextBase httpContext) {
            bool result = true;
            if (HttpContext.Current.Session["UserInfo"] == null) {
                //HttpContext.Current.Response.Redirect("/Back/Admin/Login");
                HttpContext.Current.Response.Write("<script>top.location.href='/Back/Login';</script>");
                HttpContext.Current.Response.End();
                result = false;
            } else {
                result = BindUserModuleAction(httpContext);
            }
            return result;
        }

        private bool BindUserModuleAction(HttpContextBase httpContext) {
            SysUser user = HttpContext.Current.Session["UserInfo"] as SysUser;
            UserRoleService userroleService = new UserRoleService();
            RoleModuleService rolemoduleService = new RoleModuleService();
            SysRoleService roleService = new SysRoleService();
            SysModuleService moduleService = new SysModuleService();
            SysActionService actionService = new SysActionService();

            #region
            //登录用户模块
            var a = from rolemodule in rolemoduleService.GetAllList()
                    join userrole in userroleService.GetAllList() on rolemodule.RoleId equals userrole.RoleId
                    join role in roleService.GetAllList() on rolemodule.RoleId equals role.RoleId
                    join module in moduleService.GetAllList() on rolemodule.ModuleId equals module.ModuleId
                    join action in actionService.GetAllList() on rolemodule.ActionId equals action.ActionId
                    where role.IsDeleted == 0 && module.IsDeleted == 0 && action.IsDeleted == 0 && role.RoleId == userrole.RoleId && userrole.UserId == user.UserId
                    select new {
                        RoleId = rolemodule.RoleId,
                        ModuleId = rolemodule.ModuleId,
                        ActionId = rolemodule.ActionId,
                        RoleName = role.RoleName,
                        ModuleName = module.ModuleName,
                        ModulePId = module.ModulePId,
                        ModuleLever = module.ModuleLever,
                        ModuleUrl = module.ModuleUrl,
                        OrderNo = module.OrderNo,
                        ActionName = action.ActionName,
                        ButtonCode = action.ButtonCode,
                        ParaName = action.ParaName
                    };
            #endregion

            string _area = httpContext.Request.RequestContext.RouteData.DataTokens["area"] == null ? "Back" : httpContext.Request.RequestContext.RouteData.DataTokens["area"].ToString();
            string _controller = httpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            string _action = httpContext.Request.RequestContext.RouteData.Values["action"].ToString();
            string _url = string.Format("/{0}/{1}/{2}", _area, _controller, _action);
            if (_url.Contains("/Back/Home/Main")) {
                #region 仅在登录成功进入主页加载模块
                //登录用户模块
                var rm = from rolemodule in rolemoduleService.GetAllList()
                         select new {
                             RoleId = rolemodule.RoleId,
                             ModuleId = rolemodule.ModuleId
                         };
                List<UserRoleModule> b = (from rolemodule in rm.Distinct()
                                          join userrole in userroleService.GetAllList() on rolemodule.RoleId equals userrole.RoleId
                                          join role in roleService.GetAllList() on rolemodule.RoleId equals role.RoleId
                                          join module in moduleService.GetAllList() on rolemodule.ModuleId equals module.ModuleId
                                          where role.IsDeleted == 0 && module.IsDeleted == 0 && role.RoleId == userrole.RoleId && userrole.UserId == user.UserId
                                          select new UserRoleModule {
                                              RoleId = rolemodule.RoleId,
                                              ModuleId = rolemodule.ModuleId,
                                              RoleName = role.RoleName,
                                              ModuleName = module.ModuleName,
                                              ModulePId = module.ModulePId,
                                              ModuleLever = module.ModuleLever,
                                              ModuleUrl = module.ModuleUrl,
                                              OrderNo = module.OrderNo
                                          }).ToList<UserRoleModule>();

                //全部功能
                List<SysAction> d = (from action in actionService.GetAllList()
                                     where action.IsDeleted == 0
                                     select action).ToList<SysAction>();

                HttpContext.Current.Session.Add(user.LoginName + "module", b);
                HttpContext.Current.Session.Add("action", d);
                #endregion
            } else {
                #region 仅视图权限验证
                List<UserRoleModule> bb = HttpContext.Current.Session[user.LoginName + "module"] as List<UserRoleModule>;
                bool allow = false;
                foreach (var module in bb) {
                    if (!string.IsNullOrEmpty(module.ModuleUrl) && module.ModuleUrl.Contains(_url)) allow = true;
                }

                Dictionary<String, String> views = QY.Stage.Web.Areas.Back.Config.RouteDict.GetRouteDict();
                foreach (var view in views) {
                    if (view.Value.Contains(_url)) allow = true;
                }

                if (!allow) {
                    HttpContext.Current.Response.Write("<script>$.messager.alert(\"友情提示\", \"您没有权限访问该页面！\", \"warning\");</script>");
                    HttpContext.Current.Response.End();
                    return false;
                }
                #endregion

                #region 用户模块功能视图渲染
                List<UserModuleAction> c = (from rolemodule in rolemoduleService.GetAllList()
                                            join userrole in userroleService.GetAllList() on rolemodule.RoleId equals userrole.RoleId
                                            join role in roleService.GetAllList() on rolemodule.RoleId equals role.RoleId
                                            join module in moduleService.GetAllList() on rolemodule.ModuleId equals module.ModuleId
                                            join action in actionService.GetAllList() on rolemodule.ActionId equals action.ActionId
                                            where role.IsDeleted == 0 && module.IsDeleted == 0 && action.IsDeleted == 0 && role.RoleId == userrole.RoleId && userrole.UserId == user.UserId && module.ModuleUrl.Contains(_url)
                                            select new UserModuleAction {
                                                RoleId = rolemodule.RoleId,
                                                ModuleId = rolemodule.ModuleId,
                                                ActionId = rolemodule.ActionId,
                                                RoleName = role.RoleName,
                                                ModuleName = module.ModuleName,
                                                ModulePId = module.ModulePId,
                                                ModuleLever = module.ModuleLever,
                                                ModuleUrl = module.ModuleUrl,
                                                OrderNo = module.OrderNo,
                                                ActionName = action.ActionName,
                                                ButtonCode = action.ButtonCode,
                                                ParaName = action.ParaName
                                            }).ToList<UserModuleAction>();
                HttpContext.Current.Session.Add(user.LoginName + "action", c);
                #endregion
            }
            return true;
        }

    }
}