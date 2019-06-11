using System;
using System.Collections.Generic;
using System.Linq;
using System.Drawing;
using System.Web;
using System.Web.Mvc;

using QY.Stage.Frameworks.BLL;

namespace QY.Stage.Web.Areas.Back.Controllers {
    public class DataDictionaryController : BaseController {
        private readonly SysModuleService moduleService = new SysModuleService();
        private readonly SysRoleService roleService = new SysRoleService();

        [HttpPost]
        public ActionResult GetSysModuleTree() {
            return Json(moduleService.GetModuleTreeList(),JsonRequestBehavior.DenyGet);
        }

        [HttpPost]
        public ActionResult GetSysModule() {
            var modules = (from m in moduleService.GetAllList()
                           orderby m.ModuleLever ascending, m.OrderNo ascending
                           where m.IsDeleted == 0
                           select new TextValuePair {
                               Value = m.ModuleId.ToString(),
                               Text = m.ModuleName
                           }).ToList();
            modules.Insert(0, new TextValuePair() {
                Value = "0",
                Text = "--默认--"
            });
            return Json(modules, JsonRequestBehavior.DenyGet);
        }

        [HttpPost]
        public ActionResult GetSysRole() {
            var roles = (from r in roleService.GetAllList()
                         orderby r.RoleId ascending
                         where r.IsDeleted == 0
                         select new {
                             Value = r.RoleId,
                             Text = r.RoleName
                         }).ToList();
            return Json(roles, JsonRequestBehavior.DenyGet);
        }

        #region key-value键值对类
        public class TextValuePair {
            public string Text { get; set; }
            public string Value { get; set; }
        }
        
        #endregion
    }

}
