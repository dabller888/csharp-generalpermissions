using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Newtonsoft.Json;
using QY.Stage.Frameworks.Utility;
using QY.Stage.PocoModel;
using QY.Stage.Frameworks.BLL;

namespace QY.Stage.Web.Controllers {
    public class HomeController : Controller {
      private readonly ElderService elderService = new ElderService();
        private readonly SysLogService logService = new SysLogService();

        public ActionResult Index() {
            string sn = Request["id"] ?? "";
            sn = sn.InputFilterSql().SqlCheck();
            Elder elder = elderService.Get(m => m.SerialNo == sn && m.IsDelete == 0 && m.IsEnable == 1);
            if (elder!=null && !string.IsNullOrEmpty(elder.FirstPhone)) {
                elder.FirstPhone = elder.FirstPhone.Substring(0, 3) + "****" + elder.FirstPhone.Substring(7, 4);
            }
            ViewBag.elder = elder;
            return View();
        }

        #region 发送短信
        /// <summary>
        /// 发送短信
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SendSMS(string SerialNo) {
            SerialNo = SerialNo.InputFilterSql();
            Elder elder = elderService.Get(m => m.SerialNo == SerialNo);
            if (elder == null) {
                return Json(new { Code = 2, Message = "没有找到对应编号的老人数据！" }, JsonRequestBehavior.DenyGet);
            }
            if (string.IsNullOrEmpty(elder.FirstPhone)) {
                return Json(new { Code = 3, Message = "紧急联系人联系电话不能为空！" }, JsonRequestBehavior.DenyGet);
            }
            //每人当天同一号码同一IP仅能发送5条短信
            DateTime startDate = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd"));
            DateTime endDate = Convert.ToDateTime(DateTime.Now.AddDays(1).ToString("yyyy-MM-dd"));
            var logs = (from s in logService.GetAllList()
                        where s.OperType == 4 && s.IPAddress == RequestG.GetIP() && s.MacAddress == elder.FirstPhone && s.OperTime >= startDate && s.OperTime < endDate
                        select s).ToList<SysLog>();
            int num = AppSettingsHelper.GetIntValue("num");
            if (logs.Count() >= num) {
                return Json(new { Code = 4, Message = "每人每天仅能发送" + num + "条短信！" }, JsonRequestBehavior.DenyGet);
            }

            StringBuilder sbUrl = new StringBuilder();
            sbUrl.Append("http://apis.haoservice.com/sms/sendv2?");
            sbUrl.AppendFormat("mobile={0}", elder.FirstPhone);
            sbUrl.AppendFormat("&tpl_id={0}", "2655");
            sbUrl.AppendFormat("&key={0}", "9f6af3eff4534876bd82d211de6de889");
            sbUrl.AppendFormat("&content={0}", "【武汉侨亚】吃药提醒,尊敬的用户,您现在该吃药了。");
            try {
                SMSResult result = JsonConvert.DeserializeObject<SMSResult>(RequestG.GetHttpJSONResponse(sbUrl.ToString(), "GET", null));
                if (result.error_code == "0") {
                    SysLog log = new SysLog();
                    log.OperType = 4;
                    log.LogDesc = "【武汉侨亚】吃药提醒,尊敬的用户,您现在该吃药了。";
                    log.UserId = 0;
                    log.IPAddress = RequestG.GetIP();
                    log.MacAddress = elder.FirstPhone;
                    log.OperTime = DateTime.Now;
                    log.IsDeleted = 0;
                    logService.Add(log);
                }
                return Json(new { Code = 1, Message = "发送短信", Data = result }, JsonRequestBehavior.DenyGet);
            } catch (Exception ex) {
                return Json(new { Code = 0, Message = ex.Message }, JsonRequestBehavior.DenyGet);
            }
        }
        private class SMSResult {
            public string reason { get; set; }
            public string result { get; set; }
            public string error_code { get; set; }
        }
        #endregion

    }
}
