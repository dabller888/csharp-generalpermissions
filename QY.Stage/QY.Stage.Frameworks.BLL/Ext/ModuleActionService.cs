using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class ModuleActionService {
		private readonly ModuleActionRepository moduleActionDao = new ModuleActionRepository();

        
        /*
        //±¨´í
        public int AddModuleAction(List<ModuleAction> models) {
            int rows = 0;
            foreach (var model in models) {
                rows += moduleActionDao.RemoveByWhere(m=> m.ModuleId == model.ModuleId && m.ActionId == model.ActionId );
            }
            if (rows >= 0) {
                rows = 0;
                foreach (var model in models) {
                    rows += moduleActionDao.Add(model);
                }
            }
            return rows;
        }
         * */

        public bool AddModuleAction(List<ModuleAction> models) {
            return moduleActionDao.AddModuleAction(models);
        }

        public bool DeleteModuleAction(string ids) {
            return moduleActionDao.DeleteModuleAction(ids);
        }
    }
}    
