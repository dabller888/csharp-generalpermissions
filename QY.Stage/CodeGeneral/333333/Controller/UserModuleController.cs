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
    public class UserModuleController : Controller {
		private readonly UserModuleService usermoduleService = new UserModuleService();

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

            UserModuleRequest query = new UserModuleRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in usermoduleService.GetPageList(query)
                       select new { UserId=e.UserId,ModuleId=e.ModuleId,ActionId=e.ActionId };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int UserId) {
            var usermodule = usermoduleService.Get(UserId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = usermodule;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(UserModuleRequest query) {
            var result = new ResponseParams();
            var usermodule = new UserModule {
                ActionId = query.ActionId
            };
            if (usermoduleService.Add(usermodule) > 0) {
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
		public ActionResult Save(UserModuleRequest query) {
            var result = new ResponseParams();
            var usermodule = new UserModule {
                UserId = query.UserId,
                ModuleId = query.ModuleId,
                ActionId = query.ActionId
            };
            var _usermodule = usermoduleService.Get(m => m.UserId == query.UserId);
            if (_usermodule != null) { }
            if (usermoduleService.Update(usermodule) > 0) {
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
                if (usermoduleService.Delete(userIds) > 0) {
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
