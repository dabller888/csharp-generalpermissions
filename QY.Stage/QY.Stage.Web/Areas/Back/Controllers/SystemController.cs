using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.Web.Mvc;

using QY.Stage.Frameworks.Utility;
using QY.Stage.ViewModel;
using QY.Stage.PocoModel;
using QY.Stage.Frameworks.BLL;

namespace QY.Stage.Web.Areas.Back.Controllers {
    public class SystemController : Controller {
        #region 变量区
        private readonly SysUserService userService = new SysUserService();
        private readonly SysRoleService roleService = new SysRoleService();
        private readonly SysModuleService moduleService = new SysModuleService();
        private readonly SysActionService actionService = new SysActionService();

        private readonly UserRoleService userroleService = new UserRoleService();
        private readonly ModuleActionService moduleactionService = new ModuleActionService();
        private readonly RoleModuleService rolemoduleService = new RoleModuleService();
        #endregion

        #region 视图渲染
        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult UserList() {
            return View();
        }

        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult RoleList() {
            return View();
        }

        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult ModuleList() {
            return View();
        }

        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult ActionList() {
            return View();
        }

        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult UserRole() {
            return View();
        }

        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult RoleModule() {
            return View();
        }

        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult ModuleAction() {
            return View();
        }
        
        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult UserInfo() {
            return View();
        }
        #endregion

        #region 系统用户
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetUserList() {
            string pageIndex = Request["page"] ?? "1";
            string pageSize = Request["rows"] ?? "10";

            SysUserRequest query = new SysUserRequest();
            query.LoginName = Request["LoginName"] ?? "";
            query.Email = Request["Email"] ?? "";
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in userService.GetPageList(query)
                       select new { UserId = u.UserId, LoginName = u.LoginName, RealName = u.RealName, Sex = u.Sex, Phone = u.Phone, Email = u.Email, CreateTime = u.CreateTime, LoginTime = u.LoginTime, LastLoginTime = u.LastLoginTime, LoginCount = u.LoginCount, IsEnabled = u.IsEnabled };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        }

        [HttpGet]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetCurrentUser() {
            if (Session["UserInfo"] == null) {
                return Redirect("/Back/Login");
            }
            SysUser user = Session["UserInfo"] as SysUser;
            return this.GetUserDetails(user.UserId);
        }

        [HttpGet]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetUserDetails(int UserId) {
            var user = userService.Get(UserId);
            var result = new ResponseParams();
            if (user == null) {
                //return HttpNotFound();
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = user;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult SaveUser(SysUserRequest query) {
            var data = new ResponseParams();
            var user = new SysUser() {
                LoginName = query.LoginName,
                RealName = query.RealName,
                Sex = query.Sex,
                Phone = query.Phone,
                Email = query.Email,
            };
            if (query.UserId > 0) {
                if (userService.Get(m => m.UserId != query.UserId && m.LoginName == query.LoginName) != null) {
                    data.Code = ResponseCode.EXIST;
                    data.Message = "登录名称已存在!";
                    data.Content = null;
                    return Json(data, JsonRequestBehavior.DenyGet);
                }
                var _user = userService.Get(query.UserId);
                user.UserId = _user.UserId;
                user.DeptId = _user.DeptId;
                user.LoginPass = _user.LoginPass;
                user.BirthDate = _user.BirthDate;
                user.Address = _user.Address;
                user.CreateTime = _user.CreateTime;
                user.LoginTime = _user.LoginTime;
                user.LastLoginTime = _user.LastLoginTime;
                user.LoginCount = _user.LoginCount;
                user.IsDeleted = _user.IsDeleted;
                user.IsEnabled = _user.IsEnabled;
                user.ExtendField1 = _user.ExtendField1;
                user.ExtendField2 = _user.ExtendField2;
                user.ExtendField3 = _user.ExtendField3;
                user.ExtendField4 = _user.ExtendField4;
                user.ExtendField5 = _user.ExtendField5;

                if (userService.Update(user) > 0) {
                    data.Code = ResponseCode.SUCCESS;
                    data.Message = "修改用户成功!";
                    data.Content = null;
                } else {
                    data.Code = ResponseCode.ERROR;
                    data.Message = "修改用户失败!";
                    data.Content = null;
                }
            } else {
                var _user = userService.Get(m => m.LoginName == query.LoginName);
                if (_user != null) {
                    data.Code = ResponseCode.EXIST;
                    data.Message = "登录名称已存在!";
                    data.Content = null;
                    return Json(data, JsonRequestBehavior.DenyGet);
                }
                user.LoginPass = Encrypt.Encode(query.LoginPass);
                user.DeptId = 0;
                user.BirthDate = DateTime.Now;
                user.Address = String.Empty;
                user.CreateTime = DateTime.Now;
                user.LoginTime = DateTime.Now;
                user.LastLoginTime = DateTime.Now;
                user.LoginCount = 0;
                user.IsDeleted = 0;
                user.IsEnabled = 1;
                user.ExtendField1 = 0;
                user.ExtendField2 = 0;
                user.ExtendField3 = string.Empty;
                user.ExtendField4 = string.Empty;
                user.ExtendField5 = string.Empty;

                if (userService.Add(user) > 0) {
                    data.Code = ResponseCode.SUCCESS;
                    data.Message = "添加用户成功!";
                    data.Content = null;
                } else {
                    data.Code = ResponseCode.ERROR;
                    data.Message = "添加用户失败!";
                    data.Content = null;
                }
            }
            return Json(data, JsonRequestBehavior.DenyGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult DeleteUsersByPhy(string UserIds) {//物理删除
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(UserIds)) {
                List<int> userIds = new List<int>();
                if (UserIds.IndexOf(",") >= 0) {
                    string[] ids = UserIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        userIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    userIds.Add(Convert.ToInt32(UserIds));
                }
                if (userService.Delete(userIds) > 0) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除用户成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除用户失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult DeleteUsers(string UserIds) {//逻辑删除
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(UserIds)) {
                List<SysUser> users = new List<SysUser>();
                if (UserIds.IndexOf(",") >= 0) {
                    string[] ids = UserIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        users.Add(new SysUser() { UserId = Convert.ToInt32(id) });
                    }
                } else {
                    users.Add(new SysUser() { UserId = Convert.ToInt32(UserIds) });
                }
                if (userService.Delete(users)) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除用户成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除用户失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }
        #endregion

        #region 系统模块
        //模块列表
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetModuleList() {
            var rows = from modules in moduleService.GetAllList()
                       where modules.IsDeleted == 0
                       select modules;
            return Json(rows, JsonRequestBehavior.DenyGet);
        }

        [HttpGet]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetModuleDetails(int ModuleId) {
            var module = moduleService.Get(ModuleId);
            var result = new ResponseParams();
            if (module == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = module;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult SaveModule(SysModuleRequest query) {
            var data = new ResponseParams();
            var module = new SysModule() {
                ModulePId = query.ModulePId,
                ModuleName = query.ModuleName,
                ModuleUrl = query.ModuleUrl,
                ModuleLever = query.ModuleLever,
                OrderNo = query.OrderNo
            };
            if (query.ModuleId > 0) {
                if (moduleService.Get(m => m.ModuleId != query.ModuleId && m.ModuleName == query.ModuleName) != null) {
                    data.Code = ResponseCode.EXIST;
                    data.Message = "模块名称已存在!";
                    data.Content = null;
                    return Json(data, JsonRequestBehavior.DenyGet);
                }
                var _module = moduleService.Get(query.ModuleId);
                module.ModuleId = _module.ModuleId;
                module.IsDeleted = _module.IsDeleted;
                if (moduleService.Update(module) > 0) {
                    data.Code = ResponseCode.SUCCESS;
                    data.Message = "修改模块成功!";
                    data.Content = null;
                } else {
                    data.Code = ResponseCode.ERROR;
                    data.Message = "修改模块失败!";
                    data.Content = null;
                }
            } else {
                var _module = moduleService.Get(m => m.ModuleName == query.ModuleName);
                if (_module != null) {
                    data.Code = ResponseCode.EXIST;
                    data.Message = "模块名称已存在!";
                    data.Content = null;
                    return Json(data, JsonRequestBehavior.DenyGet);
                }
                module.IsDeleted = 0;
                if (moduleService.Add(module) > 0) {
                    data.Code = ResponseCode.SUCCESS;
                    data.Message = "添加模块成功!";
                    data.Content = null;
                } else {
                    data.Code = ResponseCode.ERROR;
                    data.Message = "添加模块失败!";
                    data.Content = null;
                }
            }
            return Json(data, JsonRequestBehavior.DenyGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult DeleteModules(string ModuleIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(ModuleIds)) {
                List<int> moduleIds = new List<int>();
                if (ModuleIds.IndexOf(",") >= 0) {
                    string[] ids = ModuleIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        moduleIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    moduleIds.Add(Convert.ToInt32(ModuleIds));
                }
                if (moduleService.Delete(moduleIds) > 0) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除模块成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除模块失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }
        #endregion

        #region 系统角色
        //角色列表
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetRoleList() {
            return Json(roleService.GetAllList(), JsonRequestBehavior.DenyGet);
        }

        [HttpGet]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetRoleDetails(int RoleId) {
            var role = roleService.Get(RoleId);
            var result = new ResponseParams();
            if (role == null) {
                //return HttpNotFound();
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = role;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult SaveRole(SysRoleRequest query) {
            var data = new ResponseParams();
            var role = new SysRole() {
                RoleName = query.RoleName,
                RoleDesc = query.RoleDesc
            };
            if (query.RoleId > 0) {
                if (roleService.Get(m => m.RoleId != query.RoleId && m.RoleName == query.RoleName) != null) {
                    data.Code = ResponseCode.EXIST;
                    data.Message = "角色名称已存在!";
                    data.Content = null;
                    return Json(data, JsonRequestBehavior.DenyGet);
                }
                var _role = roleService.Get(query.RoleId);
                role.RoleId = query.RoleId;
                role.CreateTime = _role.CreateTime;//如果不修改CreateTime，1，执行sql；2，先查询再赋值
                if (roleService.Update(role) > 0) {
                    data.Code = ResponseCode.SUCCESS;
                    data.Message = "修改角色成功!";
                    data.Content = null;
                } else {
                    data.Code = ResponseCode.ERROR;
                    data.Message = "修改角色失败!";
                    data.Content = null;
                }
            } else {
                var _role = roleService.Get(m => m.RoleName == query.RoleName);
                if (_role != null) {
                    data.Code = ResponseCode.EXIST;
                    data.Message = "角色名称已存在!";
                    data.Content = null;
                    return Json(data, JsonRequestBehavior.DenyGet);
                }
                role.RolePId = 0;
                role.IsDeleted = 0;
                role.CreateTime = DateTime.Now;
                if (roleService.Add(role) > 0) {
                    data.Code = ResponseCode.SUCCESS;
                    data.Message = "添加角色成功!";
                    data.Content = null;
                } else {
                    data.Code = ResponseCode.ERROR;
                    data.Message = "添加角色失败!";
                    data.Content = null;
                }
            }
            return Json(data, JsonRequestBehavior.DenyGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult DeleteRoles(string RoleIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(RoleIds)) {
                List<int> roleIds = new List<int>();
                if (RoleIds.IndexOf(",") >= 0) {
                    string[] ids = RoleIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        roleIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    roleIds.Add(Convert.ToInt32(RoleIds));
                }
                if (roleService.Delete(roleIds) > 0) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除角色成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除角色失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }
        #endregion

        #region 系统功能
        //角色列表
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetActionList() {
            var rows = from actions in actionService.GetAllList()
                       where actions.IsDeleted == 0
                       orderby actions.ActionId ascending
                       select actions;

            return Json(rows, JsonRequestBehavior.DenyGet);
        }

        [HttpGet]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetActionDetails(int ActionId) {
            var action = actionService.Get(ActionId);
            var result = new ResponseParams();
            if (action == null) {
                //return HttpNotFound();
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = action;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult SaveAction(SysActionRequest query) {
            var data = new ResponseParams();
            var action = new SysAction() {
                ActionName = query.ActionName,
                ButtonCode = query.ButtonCode,
                ParaName = query.ParaName
            };
            if (query.ActionId > 0) {
                if (actionService.Get(m => m.ActionId != query.ActionId && m.ActionName == query.ActionName) != null) {
                    data.Code = ResponseCode.EXIST;
                    data.Message = "功能名称已存在!";
                    data.Content = null;
                    return Json(data, JsonRequestBehavior.DenyGet);
                }
                var _action = actionService.Get(query.ActionId);
                action.ActionId = _action.ActionId;
                action.IsDeleted = _action.IsDeleted;
                if (actionService.Update(action) > 0) {
                    data.Code = ResponseCode.SUCCESS;
                    data.Message = "修改功能成功!";
                    data.Content = null;
                } else {
                    data.Code = ResponseCode.ERROR;
                    data.Message = "修改功能失败!";
                    data.Content = null;
                }
            } else {
                var _action = actionService.Get(m => m.ActionName == query.ActionName);
                if (_action != null) {
                    data.Code = ResponseCode.EXIST;
                    data.Message = "功能名称已存在!";
                    data.Content = null;
                    return Json(data, JsonRequestBehavior.DenyGet);
                }
                action.IsDeleted = 0;
                if (actionService.Add(action) > 0) {
                    data.Code = ResponseCode.SUCCESS;
                    data.Message = "添加功能成功!";
                    data.Content = null;
                } else {
                    data.Code = ResponseCode.ERROR;
                    data.Message = "添加功能失败!";
                    data.Content = null;
                }
            }
            return Json(data, JsonRequestBehavior.DenyGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult DeleteActions(string ActionIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(ActionIds)) {
                List<int> actionIds = new List<int>();
                if (ActionIds.IndexOf(",") >= 0) {
                    string[] ids = ActionIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        actionIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    actionIds.Add(Convert.ToInt32(ActionIds));
                }
                if (actionService.Delete(actionIds) > 0) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除功能成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除功能失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }
        #endregion

        #region 用户角色
        //用户角色删除(待修改)
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult DeleteUserRole(string UserIds, string RoleIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(UserIds) && !String.IsNullOrEmpty(RoleIds)) {
                List<UserRole> userrole = new List<UserRole>();
                if (UserIds.IndexOf(",") >= 0 && RoleIds.IndexOf(",") >= 0) {
                    string[] uids = UserIds.Split(new char[] { ',' });
                    string[] rids = RoleIds.Split(new char[] { ',' });
                    int i = 0;
                    for (; i < uids.Length; i++) {
                        userrole.Add(new UserRole {
                            UserId = Convert.ToInt32(uids[i]),
                            RoleId = Convert.ToInt32(rids[i])
                        });
                    }
                } else {
                    userrole.Add(new UserRole {
                        UserId = Convert.ToInt32(UserIds),
                        RoleId = Convert.ToInt32(RoleIds)
                    });
                }
                if (userroleService.DeleteUserRole(userrole) > 0) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除功能成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除功能失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }

        //用户角色添加
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult AddUserRole(int UserId, int RoleId) {
            var result = new ResponseParams();
            var userrole = new UserRole();
            userrole.UserId = UserId;
            userrole.RoleId = RoleId;
            if (userroleService.Get(m => m.UserId == UserId && m.RoleId == RoleId) != null) {
                result.Code = ResponseCode.EXIST;
                result.Message = "用户角色已经分配!";
                result.Content = string.Empty;
                return Json(result, JsonRequestBehavior.DenyGet);
            }
            if (userroleService.Add(userrole) > 0) {
                result.Code = ResponseCode.SUCCESS;
                result.Message = "添加用户角色成功!";
                result.Content = null;
            } else {
                result.Code = ResponseCode.ERROR;
                result.Message = "添加用户角色失败!";
                result.Content = null;
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }

        //不包含用户角色中的用户
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetUsersNotUR() {
            var rows = from users in userService.GetAllList()
                       where !(from userroles in userroleService.GetAllList() select userroles.UserId).Contains(users.UserId)
                       orderby users.UserId ascending
                       select users;
            return Json(rows, JsonRequestBehavior.DenyGet);
        }

        //读取已分配的用户角色信息
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetPatchUserRole(int RoleId) {
            //var rows = userroleService.GetPathUR();
            //return Json(rows, JsonRequestBehavior.DenyGet);

            var rows = from userroles in userroleService.GetAllList()
                       join users in userService.GetAllList() on userroles.UserId equals users.UserId
                       join roles in roleService.GetAllList() on userroles.RoleId equals roles.RoleId
                       orderby userroles.UserId ascending
                       where users.IsDeleted == 0 && roles.IsDeleted == 0 && (RoleId != 0 ? roles.RoleId == RoleId : true)
                       select new {
                           userroles.RoleId,
                           userroles.UserId,
                           roles.RoleName,
                           users.RealName,
                           users.LoginName
                       };
            return Json(rows, JsonRequestBehavior.DenyGet);
        }
        private bool Check(int RoleId, int NewRoleId) {
            if (NewRoleId == 0)
                return true;
            else
                return RoleId == NewRoleId;
        }
        #endregion

        #region 角色模块功能设置
        //获取模块
        //获取功能
        //模块功能（三杈树，传角色为选中）
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetAllModuleActionAndSelected() {
            int RoleId = Int32.Parse(Request["RoleId"] ?? "0");

            //有效的模块
            var a = from modules in moduleService.GetAllList()
                    orderby modules.ModuleLever ascending, modules.OrderNo ascending
                    where modules.IsDeleted == 0 /*&& (from moduleactions in moduleactionService.GetAllList() select moduleactions.ModuleId).Contains(modules.ModuleId)*/
                    select new {
                        ModuleId = modules.ModuleId,
                        ModuleName = modules.ModuleName,
                        ModulePId = modules.ModulePId,
                        ModuleLever = modules.ModuleLever,
                        ModuleUrl = modules.ModuleUrl,
                        OrderNo = modules.OrderNo
                    };

            //有效的模块功能（n:n）
            //var b = from moduleactions in moduleactionService.GetAllList()
            //        join actions in actionService.GetAllList() on moduleactions.ActionId equals actions.ActionId
            //        join modules in moduleService.GetAllList() on moduleactions.ModuleId equals modules.ModuleId
            //        orderby modules.ModuleLever ascending, modules.OrderNo ascending
            //        where actions.IsDeleted == 0 && modules.IsDeleted == 0
            //        select new {
            //            ModuleActionId = moduleactions.ModuleActionId,
            //            ModuleId = moduleactions.ModuleId,
            //            ActionId = moduleactions.ActionId,
            //            ModuleName = modules.ModuleName,
            //            ModulePId = modules.ModulePId,
            //            ModuleLever = modules.ModuleLever,
            //            ModuleUrl = modules.ModuleUrl,
            //            OrderNo = modules.OrderNo,
            //            ActionName = actions.ActionName,
            //            ButtonCode = actions.ButtonCode,
            //            ParaName = actions.ParaName
            //        };

            var b = from modules in moduleService.GetAllList()
                    join actions in actionService.GetAllList() on modules.ModuleId equals actions.ModuleId
                    orderby modules.ModuleLever ascending, modules.OrderNo ascending
                    where actions.IsDeleted == 0 && modules.IsDeleted == 0
                    select new {
                        ModuleId = actions.ModuleId,
                        ActionId = actions.ActionId,
                        ModuleName = modules.ModuleName,
                        ModulePId = modules.ModulePId,
                        ModuleLever = modules.ModuleLever,
                        ModuleUrl = modules.ModuleUrl,
                        OrderNo = modules.OrderNo,
                        ActionName = actions.ActionName,
                        ButtonCode = actions.ButtonCode,
                        ParaName = actions.ParaName
                    };

            //当前角色模块功能
            var c = from rolemodule in rolemoduleService.GetAllList()
                    join role in roleService.GetAllList() on rolemodule.RoleId equals role.RoleId
                    join module in moduleService.GetAllList() on rolemodule.ModuleId equals module.ModuleId
                    join action in actionService.GetAllList() on rolemodule.ActionId equals action.ActionId
                    orderby module.ModuleLever ascending, module.OrderNo ascending
                    where role.IsDeleted == 0 && module.IsDeleted == 0 && action.IsDeleted == 0 && rolemodule.RoleId == RoleId
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

            List<TreeModle> firNodes = new List<TreeModle>();
            List<TreeChildrenModel> secNodes = null;
            List<TreeChildrenAction> thirNodes = null;

            TreeModle firNode = null;
            TreeChildrenModel secNode = null;
            TreeChildrenAction thirNode = null;

            var nodes = from t1 in a where t1.ModulePId == 0 select t1;
            foreach (var r in nodes) {
                secNodes = new List<TreeChildrenModel>();
                firNode = new TreeModle();
                firNode.id = r.ModuleId;
                firNode.text = r.ModuleName;
                firNode.url = "";
                firNode.@checked = false;
                var tmp = from t2 in a
                          where t2.ModulePId == r.ModuleId
                          select t2;
                foreach (var l in tmp) {
                    thirNodes = new List<TreeChildrenAction>();
                    secNode = new TreeChildrenModel();
                    secNode.id = l.ModuleId;
                    secNode.text = l.ModuleName;
                    secNode.url = l.ModuleUrl;
                    secNode.@checked = false;
                    var tmpNodes = from t3 in b
                                   where t3.ModuleId == l.ModuleId
                                   select t3;
                    foreach (var f in tmpNodes) {
                        thirNode = new TreeChildrenAction();
                        thirNode.id = f.ActionId;
                        thirNode.text = f.ActionName;
                        thirNode.@checked = false;
                        //设置checkbox选中
                        var e = from t4 in c
                                where t4.RoleId == RoleId && t4.ModuleId == l.ModuleId && t4.ActionId == f.ActionId
                                select t4;
                        if (e.ToList<Object>().Count > 0) {
                            firNode.@checked = true;
                            secNode.@checked = true;
                            thirNode.@checked = true;
                        }
                        thirNode.url = f.ButtonCode;
                        thirNodes.Add(thirNode);
                    }
                    secNode.children = thirNodes;
                    secNodes.Add(secNode);
                }
                firNode.children = secNodes;
                firNodes.Add(firNode);
            }

            return Json(firNodes, JsonRequestBehavior.DenyGet);
        }

        public class TreeModle {
            public int id { get; set; }
            public string text { get; set; }
            public bool @checked { get; set; }
            public string url { get; set; }
            public List<TreeChildrenModel> children { get; set; }
        }

        public class TreeChildrenModel {
            public int id { get; set; }
            public string text { get; set; }
            public bool @checked { get; set; }
            public string url { get; set; }
            public List<TreeChildrenAction> children { get; set; }
        }

        public class TreeChildrenAction {
            public int id { get; set; }
            public string text { get; set; }
            public bool @checked { get; set; }
            public string url { get; set; }
        }

        //添加模块功能
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult AddRoleModuleAction(string RoleModuleIds) {
            //先删除再添加
            try {
                List<RoleModule> list = JsonHelper.DeserializeJsonToList<RoleModule>(RoleModuleIds);
                var result = new ResponseParams();
                if (rolemoduleService.AddRoleModule(list)) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = string.Empty;
                    result.Content = string.Empty;
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = string.Empty;
                    result.Content = string.Empty;
                }
                return Json(result, JsonRequestBehavior.DenyGet);
            } catch (Exception ex) {
                throw ex;
            }
        }
        #endregion

        #region 模块功能设置
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        //获取未绑定的功能
        public ActionResult GetModuleNotMA() {
            int ModuleId = Int32.Parse(Request["ModuleActionId"] ?? "0");
            //var rows = from actions in actionService.GetAllList()
            //           where !(
            //           (
            //            from moduleactions in moduleactionService.GetAllList() select moduleactions.ActionId).Equals(actions.ActionId) &&
            //            ModuleId == 0 ? true : (from moduleactions in moduleactionService.GetAllList() select moduleactions.ModuleId).Equals(ModuleId)
            //           )

            //           orderby actions.ActionId ascending
            //           select actions;

            var rows = from actions in actionService.GetAllList()
                       where (from moduleactions in moduleactionService.GetAllList()
                              where moduleactions.ActionId == actions.ActionId && moduleactions.ModuleId == ModuleId
                              select moduleactions).ToList<ModuleAction>().Count() <= 0
                       orderby actions.ActionId ascending
                       select actions;
            return Json(rows, JsonRequestBehavior.DenyGet);
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        //获取模块功能
        public ActionResult GetModuleAction() {
            int ModuleActionId = Int32.Parse(Request["ModuleActionId"] ?? "0");
            var rows = from moduleactions in moduleactionService.GetAllList()
                       join actions in actionService.GetAllList() on moduleactions.ActionId equals actions.ActionId
                       join modules in moduleService.GetAllList() on moduleactions.ModuleId equals modules.ModuleId
                       orderby moduleactions.ModuleId ascending
                       where actions.IsDeleted == 0 && modules.IsDeleted == 0 && moduleactions.ModuleId == ModuleActionId
                       select new {
                           ModuleActionId = moduleactions.ModuleActionId,
                           ModuleId = moduleactions.ModuleId,
                           ActionId = moduleactions.ActionId,
                           ModuleName = modules.ModuleName,
                           ActionName = actions.ActionName,
                           ButtonCode = actions.ButtonCode
                       };
            return Json(rows, JsonRequestBehavior.DenyGet);
        }

        //添加模块功能
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult AddModuleAction(string ModuleActionIds) {
            try {
                List<ModuleAction> list = JsonHelper.DeserializeJsonToList<ModuleAction>(ModuleActionIds);
                var result = new ResponseParams();
                if (moduleactionService.AddModuleAction(list)) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = string.Empty;
                    result.Content = string.Empty;
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = string.Empty;
                    result.Content = string.Empty;
                }
                return Json(result, JsonRequestBehavior.DenyGet);
            } catch (Exception ex) {
                throw ex;
            }
        }

        //删除模块功能
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult DeleteModuleAction(string ModuleActionIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(ModuleActionIds)) {
                if (moduleactionService.DeleteModuleAction(ModuleActionIds)) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除模块功能成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除模块功能失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }
        #endregion

        #region 其他
        //修改用户密码
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult ModifyPasswd(string UserName, string Passwd) {
            var result = new ResponseParams();
            if (userService.ModifyPasswdByUserName(UserName, Encrypt.Encode(Passwd))) {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }

        //是否启用
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult EnableUser(string UserName, int IsEnable) {
            var result = new ResponseParams();
            if (userService.EnableUser(UserName, (IsEnable == 1 ? 0 : 1))) {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }

        //修改当前用户密码
        [HttpPost]
        public ActionResult ModifyPasswdByCurrentUserId() {
            return null;
        }
        #endregion
    }
}
