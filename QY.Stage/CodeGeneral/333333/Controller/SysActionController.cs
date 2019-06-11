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
    public class SysActionController : Controller {
		private readonly SysActionService sysactionService = new SysActionService();

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

            SysActionRequest query = new SysActionRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in sysactionService.GetPageList(query)
                       select new { ActionId=e.ActionId,ActionName=e.ActionName,ButtonCode=e.ButtonCode,ParaName=e.ParaName,IsDeleted=e.IsDeleted };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int ActionId) {
            var sysaction = sysactionService.Get(ActionId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = sysaction;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(SysActionRequest query) {
            var result = new ResponseParams();
            var sysaction = new SysAction {
                ActionName = query.ActionName,
                ButtonCode = query.ButtonCode,
                ParaName = query.ParaName,
                IsDeleted = query.IsDeleted
            };
            if (sysactionService.Add(sysaction) > 0) {
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
		public ActionResult Save(SysActionRequest query) {
            var result = new ResponseParams();
            var sysaction = new SysAction {
                ActionId = query.ActionId,
                ActionName = query.ActionName,
                ButtonCode = query.ButtonCode,
                ParaName = query.ParaName,
                IsDeleted = query.IsDeleted
            };
            var _sysaction = sysactionService.Get(m => m.ActionId == query.ActionId);
            if (_sysaction != null) { }
            if (sysactionService.Update(sysaction) > 0) {
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
		public ActionResult Delete(string ActionIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(ActionIds)) {
                List<int> _ActionIds = new List<int>();
                if (ActionIds.IndexOf(",") >= 0) {
                    string[] ids = ActionIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        _ActionIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    _ActionIds.Add(Convert.ToInt32(UserIds));
                }
                if (sysactionService.Delete(userIds) > 0) {
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
