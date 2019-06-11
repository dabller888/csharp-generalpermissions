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
    public class RoleUserController : Controller {
		private readonly RoleUserService roleuserService = new RoleUserService();

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

            RoleUserRequest query = new RoleUserRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in roleuserService.GetPageList(query)
                       select new { RoleId=e.RoleId,UserId=e.UserId };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int RoleId) {
            var roleuser = roleuserService.Get(RoleId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = roleuser;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(RoleUserRequest query) {
            var result = new ResponseParams();
            var roleuser = new RoleUser {
                            };
            if (roleuserService.Add(roleuser) > 0) {
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
		public ActionResult Save(RoleUserRequest query) {
            var result = new ResponseParams();
            var roleuser = new RoleUser {
                RoleId = query.RoleId,
                UserId = query.UserId
            };
            var _roleuser = roleuserService.Get(m => m.RoleId == query.RoleId);
            if (_roleuser != null) { }
            if (roleuserService.Update(roleuser) > 0) {
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
		public ActionResult Delete(string RoleIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(RoleIds)) {
                List<int> _RoleIds = new List<int>();
                if (RoleIds.IndexOf(",") >= 0) {
                    string[] ids = RoleIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        _RoleIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    _RoleIds.Add(Convert.ToInt32(UserIds));
                }
                if (roleuserService.Delete(userIds) > 0) {
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
