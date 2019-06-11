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
    public class ElderController : Controller {
		private readonly ElderService elderService = new ElderService();

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

            ElderRequest query = new ElderRequest();
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from u in elderService.GetPageList(query)
                       select new { ElderId=e.ElderId,SerialNo=e.SerialNo,ElderName=e.ElderName,CardNo=e.CardNo,Sex=e.Sex,Age=e.Age,Addr=e.Addr,Post=e.Post,Phone=e.Phone,Content=e.Content,QRCode=e.QRCode,FirstName=e.FirstName,FirstSex=e.FirstSex,FirstAddr=e.FirstAddr,FirstPost=e.FirstPost,FirstPhone=e.FirstPhone,FirstRelation=e.FirstRelation,SecName=e.SecName,SecSex=e.SecSex,SecAddr=e.SecAddr,SecPost=e.SecPost,SecPhone=e.SecPhone,SecRelation=e.SecRelation,CreateTime=e.CreateTime,DataFlag=e.DataFlag,IsEnable=e.IsEnable,IsDelete=e.IsDelete };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        
        }

		[HttpPost]
		public ActionResult Detail(int ElderId) {
            var elder = elderService.Get(ElderId);
            var result = new ResponseParams();
            if (elder == null) {
                result.Code = ResponseCode.ERROR;
                result.Message = string.Empty;
                result.Content = string.Empty;
            } else {
                result.Code = ResponseCode.SUCCESS;
                result.Message = string.Empty;
                result.Content = elder;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

		[HttpPost]
		public ActionResult Add(ElderRequest query) {
            var result = new ResponseParams();
            var elder = new Elder {
                SerialNo = query.SerialNo,
                ElderName = query.ElderName,
                CardNo = query.CardNo,
                Sex = query.Sex,
                Age = query.Age,
                Addr = query.Addr,
                Post = query.Post,
                Phone = query.Phone,
                Content = query.Content,
                QRCode = query.QRCode,
                FirstName = query.FirstName,
                FirstSex = query.FirstSex,
                FirstAddr = query.FirstAddr,
                FirstPost = query.FirstPost,
                FirstPhone = query.FirstPhone,
                FirstRelation = query.FirstRelation,
                SecName = query.SecName,
                SecSex = query.SecSex,
                SecAddr = query.SecAddr,
                SecPost = query.SecPost,
                SecPhone = query.SecPhone,
                SecRelation = query.SecRelation,
                CreateTime = query.CreateTime,
                DataFlag = query.DataFlag,
                IsEnable = query.IsEnable,
                IsDelete = query.IsDelete
            };
            if (elderService.Add(elder) > 0) {
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
		public ActionResult Save(ElderRequest query) {
            var result = new ResponseParams();
            var elder = new Elder {
                ElderId = query.ElderId,
                SerialNo = query.SerialNo,
                ElderName = query.ElderName,
                CardNo = query.CardNo,
                Sex = query.Sex,
                Age = query.Age,
                Addr = query.Addr,
                Post = query.Post,
                Phone = query.Phone,
                Content = query.Content,
                QRCode = query.QRCode,
                FirstName = query.FirstName,
                FirstSex = query.FirstSex,
                FirstAddr = query.FirstAddr,
                FirstPost = query.FirstPost,
                FirstPhone = query.FirstPhone,
                FirstRelation = query.FirstRelation,
                SecName = query.SecName,
                SecSex = query.SecSex,
                SecAddr = query.SecAddr,
                SecPost = query.SecPost,
                SecPhone = query.SecPhone,
                SecRelation = query.SecRelation,
                CreateTime = query.CreateTime,
                DataFlag = query.DataFlag,
                IsEnable = query.IsEnable,
                IsDelete = query.IsDelete
            };
            var _elder = elderService.Get(m => m.ElderId == query.ElderId);
            if (_elder != null) { }
            if (elderService.Update(elder) > 0) {
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
		public ActionResult Delete(string ElderIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(ElderIds)) {
                List<int> _ElderIds = new List<int>();
                if (ElderIds.IndexOf(",") >= 0) {
                    string[] ids = ElderIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        _ElderIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    _ElderIds.Add(Convert.ToInt32(UserIds));
                }
                if (elderService.Delete(userIds) > 0) {
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
