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
    public class SysGroupController : Controller {
		private readonly SysGroupService sysgroupService = new SysGroupService();

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

            SysGroupRequest query = new SysGroupRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in sysgroupService.GetPageList(query)
                       select new { GroupId=e.GroupId,GroupName=e.GroupName,GroupPId=e.GroupPId,CreateTime=e.CreateTime,GroupDesc=e.GroupDesc,IsDeleted=e.IsDeleted };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int GroupId) {
            var sysgroup = sysgroupService.Get(GroupId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = sysgroup;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(SysGroupRequest query) {
            var result = new ResponseParams();
            var sysgroup = new SysGroup {
                GroupName = query.GroupName,
                GroupPId = query.GroupPId,
                CreateTime = query.CreateTime,
                GroupDesc = query.GroupDesc,
                IsDeleted = query.IsDeleted
            };
            if (sysgroupService.Add(sysgroup) > 0) {
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
		public ActionResult Save(SysGroupRequest query) {
            var result = new ResponseParams();
            var sysgroup = new SysGroup {
                GroupId = query.GroupId,
                GroupName = query.GroupName,
                GroupPId = query.GroupPId,
                CreateTime = query.CreateTime,
                GroupDesc = query.GroupDesc,
                IsDeleted = query.IsDeleted
            };
            var _sysgroup = sysgroupService.Get(m => m.GroupId == query.GroupId);
            if (_sysgroup != null) { }
            if (sysgroupService.Update(sysgroup) > 0) {
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
                if (sysgroupService.Delete(userIds) > 0) {
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
