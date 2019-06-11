using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Data.Entity;
using QY.Stage.PocoModel;
namespace QY.Stage.Frameworks.DAL {
    public class RoleModuleRepository : BaseRepository<RoleModule> {
        public bool AddRoleModule(List<RoleModule> RoleModule) {
            if (RoleModule == null) return false;
            StringBuilder sb = new StringBuilder();
            foreach (var item in RoleModule) {
                sb.AppendFormat("delete from BaseRoleModule where RoleId={0} and ModuleId={1} ", item.RoleId, item.ModuleId);
            }
            foreach (var item in RoleModule) {
                sb.AppendFormat("insert into BaseRoleModule(RoleId,ModuleId,ActionId)values({0},{1},{2}) ", item.RoleId, item.ModuleId, item.ActionId);
            }
            return base.ExcuteNoQuery(sb.ToString(), new Object[] { });
        }

        public bool DeleteRoleModule(List<RoleModule> RoleModule) {
            StringBuilder sb = new StringBuilder();
            foreach (var item in RoleModule) {
                sb.AppendFormat("delete from BaseRoleModule where RoleId={0} and ModuleId={1} and ActionId={2} ", item.RoleId, item.ModuleId, item.ActionId);
            }
            return base.ExcuteNoQuery(sb.ToString(), new Object[] { });
        }
    }
}    
