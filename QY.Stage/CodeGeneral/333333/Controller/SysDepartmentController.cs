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
    public class SysDepartmentController : Controller {
		private readonly SysDepartmentService sysdepartmentService = new SysDepartmentService();

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

            SysDepartmentRequest query = new SysDepartmentRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in sysdepartmentService.GetPageList(query)
                       select new { DeptId=e.DeptId,DepartName=e.DepartName,DeptPId=e.DeptPId,DepartDesc=e.DepartDesc };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int DeptId) {
            var sysdepartment = sysdepartmentService.Get(DeptId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = sysdepartment;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(SysDepartmentRequest query) {
            var result = new ResponseParams();
            var sysdepartment = new SysDepartment {
                DepartName = query.DepartName,
                DeptPId = query.DeptPId,
                DepartDesc = query.DepartDesc
            };
            if (sysdepartmentService.Add(sysdepartment) > 0) {
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
		public ActionResult Save(SysDepartmentRequest query) {
            var result = new ResponseParams();
            var sysdepartment = new SysDepartment {
                DeptId = query.DeptId,
                DepartName = query.DepartName,
                DeptPId = query.DeptPId,
                DepartDesc = query.DepartDesc
            };
            var _sysdepartment = sysdepartmentService.Get(m => m.DeptId == query.DeptId);
            if (_sysdepartment != null) { }
            if (sysdepartmentService.Update(sysdepartment) > 0) {
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
		public ActionResult Delete(string DeptIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(DeptIds)) {
                List<int> _DeptIds = new List<int>();
                if (DeptIds.IndexOf(",") >= 0) {
                    string[] ids = DeptIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        _DeptIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    _DeptIds.Add(Convert.ToInt32(UserIds));
                }
                if (sysdepartmentService.Delete(userIds) > 0) {
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
