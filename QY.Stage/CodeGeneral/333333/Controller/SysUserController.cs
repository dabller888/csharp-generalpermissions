using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using QY.Stage.Frameworks.Utility;
using QY.Stage.ViewModel;
using QY.Stage.PocoModel;
using QY.Stage.Frameworks.BLL;

namespace QY.Stage.Web.Areas.Back.Controllers {
    public class SysUserController : Controller {
		private readonly SysUserService sysuserService = new SysUserService();

		#region /****View Action****/
        public ActionResult Index() {
            return View();
        }
        #endregion

		#region /****Go Action****/
		[HttpPost]
		public ActionResult List() {
            string pageIndex = Request["page"] ?? "1";
            string pageSize = Request["rows"] ?? "10";

            SysUserRequest query = new SysUserRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in sysuserService.GetPageList(query)
                       select new { UserId=e.UserId,DeptId=e.DeptId,LoginName=e.LoginName,LoginPass=e.LoginPass,RealName=e.RealName,Sex=e.Sex,BirthDate=e.BirthDate,Address=e.Address,Phone=e.Phone,Email=e.Email,CreateTime=e.CreateTime,LoginTime=e.LoginTime,LastLoginTime=e.LastLoginTime,LoginCount=e.LoginCount,IsEnabled=e.IsEnabled,IsDeleted=e.IsDeleted };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int UserId) {
            var sysuser = sysuserService.Get(UserId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = sysuser;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(SysUserRequest query) {
            var result = new ResponseParams();
            var sysuser = new SysUser {
                DeptId = query.DeptId,
                LoginName = query.LoginName,
                LoginPass = query.LoginPass,
                RealName = query.RealName,
                Sex = query.Sex,
                BirthDate = query.BirthDate,
                Address = query.Address,
                Phone = query.Phone,
                Email = query.Email,
                CreateTime = query.CreateTime,
                LoginTime = query.LoginTime,
                LastLoginTime = query.LastLoginTime,
                LoginCount = query.LoginCount,
                IsEnabled = query.IsEnabled,
                IsDeleted = query.IsDeleted
            };
            if (sysuserService.Add(sysuser) > 0) {
                result.Code = ResponseCode.SUCCESS;
                result.Message = "添加成功!";
                result.Content = null;
            } else {
                result.Code = ResponseCode.ERROR;
                result.Message = "添加失败!";
                result.Content = null;
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }

		[HttpPost]
		public ActionResult Save(SysUserRequest query) {
            var result = new ResponseParams();
            var sysuser = new SysUser {
                UserId = query.UserId,
                DeptId = query.DeptId,
                LoginName = query.LoginName,
                LoginPass = query.LoginPass,
                RealName = query.RealName,
                Sex = query.Sex,
                BirthDate = query.BirthDate,
                Address = query.Address,
                Phone = query.Phone,
                Email = query.Email,
                CreateTime = query.CreateTime,
                LoginTime = query.LoginTime,
                LastLoginTime = query.LastLoginTime,
                LoginCount = query.LoginCount,
                IsEnabled = query.IsEnabled,
                IsDeleted = query.IsDeleted
            };
            var _sysuser = sysuserService.Get(m => m.UserId == query.UserId);
            if (_sysuser != null) { }
            if (sysuserService.Update(sysuser) > 0) {
                result.Code = ResponseCode.SUCCESS;
                result.Message = "修改成功!";
                result.Content = null;
            } else {
                result.Code = ResponseCode.ERROR;
                result.Message = "修改失败!";
                result.Content = null;
            }
            return Json(result,JsonRequestBehavior.DenyGet);
        }

		[HttpPost]
		public ActionResult Delete(string UserIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(UserIds)) {
                List<int> _UserIds = new List<int>();
                if (UserIds.IndexOf(",") >= 0) {
                    string[] ids = UserIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        _UserIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    _UserIds.Add(Convert.ToInt32(UserIds));
                }
                if (sysuserService.Delete(userIds) > 0) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }
        #endregion

		#region /****the other****/

		#endregion
    }
}    
