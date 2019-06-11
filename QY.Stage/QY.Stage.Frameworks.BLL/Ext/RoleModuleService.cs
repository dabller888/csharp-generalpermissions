using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class RoleModuleService {
		private readonly RoleModuleRepository roleModuleDao = new RoleModuleRepository();
        public bool AddRoleModule(List<RoleModule> RoleModule) {
            return roleModuleDao.AddRoleModule(RoleModule);
        }

        public bool DeleteRoleModule(List<RoleModule> RoleModule) {
            return roleModuleDao.DeleteRoleModule(RoleModule);
        }
    }
}    
