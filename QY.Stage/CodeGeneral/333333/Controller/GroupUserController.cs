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
    public class GroupUserController : Controller {
		private readonly GroupUserService groupuserService = new GroupUserService();

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

            GroupUserRequest query = new GroupUserRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in groupuserService.GetPageList(query)
                       select new { GroupId=e.GroupId,UserId=e.UserId };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int GroupId) {
            var groupuser = groupuserService.Get(GroupId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = groupuser;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(GroupUserRequest query) {
            var result = new ResponseParams();
            var groupuser = new GroupUser {
                            };
            if (groupuserService.Add(groupuser) > 0) {
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
		public ActionResult Save(GroupUserRequest query) {
            var result = new ResponseParams();
            var groupuser = new GroupUser {
                GroupId = query.GroupId,
                UserId = query.UserId
            };
            var _groupuser = groupuserService.Get(m => m.GroupId == query.GroupId);
            if (_groupuser != null) { }
            if (groupuserService.Update(groupuser) > 0) {
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
                if (groupuserService.Delete(userIds) > 0) {
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
