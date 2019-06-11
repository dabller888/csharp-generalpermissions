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
    public class GroupModuleController : Controller {
		private readonly GroupModuleService groupmoduleService = new GroupModuleService();

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

            GroupModuleRequest query = new GroupModuleRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in groupmoduleService.GetPageList(query)
                       select new { GroupId=e.GroupId,ModuleId=e.ModuleId,ActionId=e.ActionId };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int GroupId) {
            var groupmodule = groupmoduleService.Get(GroupId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = groupmodule;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(GroupModuleRequest query) {
            var result = new ResponseParams();
            var groupmodule = new GroupModule {
                            };
            if (groupmoduleService.Add(groupmodule) > 0) {
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
		public ActionResult Save(GroupModuleRequest query) {
            var result = new ResponseParams();
            var groupmodule = new GroupModule {
                GroupId = query.GroupId,
                ModuleId = query.ModuleId,
                ActionId = query.ActionId
            };
            var _groupmodule = groupmoduleService.Get(m => m.GroupId == query.GroupId);
            if (_groupmodule != null) { }
            if (groupmoduleService.Update(groupmodule) > 0) {
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
		public ActionResult Delete(string GroupIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(GroupIds)) {
                List<int> _GroupIds = new List<int>();
                if (GroupIds.IndexOf(",") >= 0) {
                    string[] ids = GroupIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        _GroupIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    _GroupIds.Add(Convert.ToInt32(UserIds));
                }
                if (groupmoduleService.Delete(userIds) > 0) {
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
