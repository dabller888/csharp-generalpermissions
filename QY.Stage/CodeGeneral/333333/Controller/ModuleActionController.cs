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
    public class ModuleActionController : Controller {
		private readonly ModuleActionService moduleactionService = new ModuleActionService();

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

            ModuleActionRequest query = new ModuleActionRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in moduleactionService.GetPageList(query)
                       select new { ModuleActionId=e.ModuleActionId,ModuleId=e.ModuleId,ActionId=e.ActionId };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int ModuleId) {
            var moduleaction = moduleactionService.Get(ModuleId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = moduleaction;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(ModuleActionRequest query) {
            var result = new ResponseParams();
            var moduleaction = new ModuleAction {
                            };
            if (moduleactionService.Add(moduleaction) > 0) {
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
		public ActionResult Save(ModuleActionRequest query) {
            var result = new ResponseParams();
            var moduleaction = new ModuleAction {
                ModuleActionId = query.ModuleActionId,
                ModuleId = query.ModuleId,
                ActionId = query.ActionId
            };
            var _moduleaction = moduleactionService.Get(m => m.ModuleId == query.ModuleId);
            if (_moduleaction != null) { }
            if (moduleactionService.Update(moduleaction) > 0) {
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
		public ActionResult Delete(string ModuleIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(ModuleIds)) {
                List<int> _ModuleIds = new List<int>();
                if (ModuleIds.IndexOf(",") >= 0) {
                    string[] ids = ModuleIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        _ModuleIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    _ModuleIds.Add(Convert.ToInt32(UserIds));
                }
                if (moduleactionService.Delete(userIds) > 0) {
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
