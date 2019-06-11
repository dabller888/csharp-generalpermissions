using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;
using ThoughtWorks.QRCode.Codec.Util;

using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.BLL;

namespace QY.Stage.Web.Areas.Back.Controllers {
    public class ElderController : Controller {
        private readonly ElderService elderService = new ElderService();

        [QY.Stage.Web.Areas.Back.Filters.LoginAuthFilter]
        public ActionResult ElderList() {
            return View();
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetElderList() {
            string pageIndex = Request["page"] ?? "1";
            string pageSize = Request["rows"] ?? "10";

            ElderRequest query = new ElderRequest();
            query.SerialNo = Request["SerialNo"] ?? "";
            query.ElderName = Request["ElderName"] ?? "";
            query.PageIndex = int.Parse(pageIndex);
            query.PageSize = int.Parse(pageSize);
            query.TotalCount = 0;
            var rows = from e in elderService.GetPageList(query)
                       select new { ElderId = e.ElderId, SerialNo = e.SerialNo, ElderName = e.ElderName, Sex = e.Sex, Age = e.Age, Addr = e.Addr, Post = e.Post, Phone = e.Phone, Content = e.Content, QRCode = e.QRCode, FirstName = e.FirstName, FirstSex = e.FirstSex, FirstRelation = e.FirstRelation, FirstPhone = e.FirstPhone, FirstAddr = e.FirstAddr, FirstPost = e.FirstPost, IsEnable = e.IsEnable, IsDelete = e.IsDelete };
            int total = query.TotalCount;
            return Json(new { total = total, rows = rows }, JsonRequestBehavior.DenyGet);
        }

        //查看老人
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult ShowElder(int ElderId) {

            return null;
        }
        //添加老人
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult AddElder(ElderRequest query) {
            var data = new ResponseParams();
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
                QRCode = null,
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
                CreateTime = DateTime.Now,
                DataFlag = 1,
                IsEnable = query.IsEnable,
                IsDelete = 0
            };
            //http://www.cnblogs.com/daimage/archive/2012/07/04/2575844.html
            if (elderService.Get(m => m.SerialNo == query.SerialNo) != null) {
                data.Code = ResponseCode.EXIST;
                data.Message = "序号已存在!";
                data.Content = null;
                return Json(data, JsonRequestBehavior.DenyGet);
            }
            if (elderService.Add(elder) > 0) {
                data.Code = ResponseCode.SUCCESS;
                data.Message = "添加老人成功!";
                data.Content = null;
            } else {
                data.Code = ResponseCode.ERROR;
                data.Message = "添加老人失败!";
                data.Content = null;
            }
            return Json(data, JsonRequestBehavior.DenyGet);
        }

        //显示老人信息
        [HttpGet]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GetElderDetails(int ElderId) {
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

        //修改老人
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult SaveElder(ElderRequest query) {
            var data = new ResponseParams();
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
                IsEnable = query.IsEnable
            };
            var _elder = elderService.Get(m => m.ElderId == query.ElderId);
            if (_elder != null) {
                elder.QRCode = _elder.QRCode;
                elder.CreateTime = _elder.CreateTime;
                elder.DataFlag = _elder.DataFlag;
                elder.IsDelete = _elder.IsDelete;
            }
            if (elderService.Update(elder) > 0) {
                data.Code = ResponseCode.SUCCESS;
                data.Message = "修改老人信息成功!";
                data.Content = null;
            } else {
                data.Code = ResponseCode.ERROR;
                data.Message = "修改老人信息失败!";
                data.Content = null;
            }
            return Json(data,JsonRequestBehavior.DenyGet);
        }

        //删除老人
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult DeleteElders(string ElderIds) {
            var result = new ResponseParams();
            if (!String.IsNullOrEmpty(ElderIds)) {
                List<int> elderIds = new List<int>();
                if (ElderIds.IndexOf(",") >= 0) {
                    string[] ids = ElderIds.Split(new char[] { ',' });
                    foreach (var id in ids) {
                        elderIds.Add(Convert.ToInt32(id));
                    }
                } else {
                    elderIds.Add(Convert.ToInt32(ElderIds));
                }
                if (elderService.Delete(elderIds) > 0) {
                    result.Code = ResponseCode.SUCCESS;
                    result.Message = "删除老人信息成功!";
                } else {
                    result.Code = ResponseCode.ERROR;
                    result.Message = "删除老人信息失败!";
                }
            }
            return Json(result, JsonRequestBehavior.DenyGet);
        }

        //启用
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult EnableElder(int ElderId) {

            return null;
        }

        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GenerateSN() {
            return Json(new { sn = this.GenerateSerialNo() }, JsonRequestBehavior.DenyGet);
        }

        //生成二维码
        [HttpPost]
        [QY.Stage.Web.Areas.Back.Filters.ActionAuthFilter]
        public ActionResult GenerateQRCode(int ElderId) {
            var _elder = elderService.Get(m => m.ElderId == ElderId);
            QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
            Bitmap qrCode = qrCodeEncoder.Encode(_elder.SerialNo, Encoding.UTF8);
            string path = string.Format("{0}Uploads\\QRCode\\{1}.jpeg", HttpContext.Server.MapPath("\\"),_elder.SerialNo);
            if (System.IO.File.Exists(path)) {
                System.IO.File.Delete(path);
            }
            qrCode.Save(path, ImageFormat.Jpeg);
            elderService.setElderQRCode(ElderId, string.Format("{0}.jpeg", _elder.SerialNo));
            return Json(new {
                path = string.Format("/Uploads/QRCode/{0}.jpeg", _elder.SerialNo)
            },JsonRequestBehavior.DenyGet);

            //return File(Bitmap2Byte(qrCode), @"image/jpeg");
        }

        private byte[] Bitmap2Byte(Bitmap bitmap) {
            using (MemoryStream stream = new MemoryStream()) {
                bitmap.Save(stream, ImageFormat.Jpeg);
                byte[] data = new byte[stream.Length];
                stream.Seek(0, SeekOrigin.Begin);
                stream.Read(data, 0, Convert.ToInt32(stream.Length));
                return data;
            }
        }
        //下载二维码

        #region /****序号生成****/
        private string GenerateSerialNo() {
            string lastSerialNo = string.Empty;
            string baseSN = elderService.GetLastSerialNo();
            string date = DateTime.Now.ToString("yyyyMMdd");
            if (string.IsNullOrEmpty(baseSN)) {
                lastSerialNo = string.Format("{0}00000001", date);
            } else {
                string _sn = baseSN.Substring(8, baseSN.Length - 8);
                int num = Int32.Parse(_sn) + 1;
                int _len0 = 8 - num.ToString().Length;
                string str0 = "";
                while (_len0 > 0) {
                    str0 += "0";
                    _len0--;
                }
                lastSerialNo = string.Format("{0}{1}{2}", date, str0, num);
            }
            return lastSerialNo;
        }
        #endregion
    }
}
