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
    public class SysLogController : Controller {
		private readonly SysLogService syslogService = new SysLogService();

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

            SysLogRequest query = new SysLogRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in syslogService.GetPageList(query)
                       select new { LogId=e.LogId,OperType=e.OperType,LogDesc=e.LogDesc,UserId=e.UserId,IPAddress=e.IPAddress,MacAddress=e.MacAddress,OperTime=e.OperTime,IsDeleted=e.IsDeleted };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int LogId) {
            var syslog = syslogService.Get(LogId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = syslog;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(SysLogRequest query) {
            var result = new ResponseParams();
            var syslog = new SysLog {
                OperType = query.OperType,
                LogDesc = query.LogDesc,
                UserId = query.UserId,
                IPAddress = query.IPAddress,
                MacAddress = query.MacAddress,
                OperTime = query.OperTime,
                IsDeleted = query.IsDeleted
            };
            if (syslogService.Add(syslog) > 0) {
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
		public ActionResult Save(SysLogRequest query) {
            var result = new ResponseParams();
            var syslog = new SysLog {
                LogId = query.LogId,
                OperType = query.OperType,
                LogDesc = query.LogDesc,
                UserId = query.UserId,
                IPAddress = query.IPAddress,
                MacAddress = query.MacAddress,
                OperTime = query.OperTime,
                IsDeleted = query.IsDeleted
            };
            var _syslog = syslogService.Get(m => m.LogId == query.LogId);
            if (_syslog != null) { }
            if (syslogService.Update(syslog) > 0) {
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
		public ActionResult Delete(string LogIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(LogIds)) {
                List<int> _LogIds = new List<int>();
                if (LogIds.IndexOf(",") >= 0) {
                    string[] ids = LogIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        _LogIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    _LogIds.Add(Convert.ToInt32(UserIds));
                }
                if (syslogService.Delete(userIds) > 0) {
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
