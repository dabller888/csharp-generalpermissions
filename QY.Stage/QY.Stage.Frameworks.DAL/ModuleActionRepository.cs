using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Data.Entity;
using QY.Stage.PocoModel;
namespace QY.Stage.Frameworks.DAL {
    public class ModuleActionRepository : BaseRepository<ModuleAction> {
        public bool AddModuleAction(List<ModuleAction> ModuleActions) {
            StringBuilder sb = new StringBuilder();
            foreach (var item in ModuleActions) {
                sb.AppendFormat("delete from BaseModuleAction where ModuleId={0} and ActionId={1} ", item.ModuleId, item.ActionId);
            }
            foreach (var item in ModuleActions) {
                sb.AppendFormat("insert into BaseModuleAction(ModuleId,ActionId)values({0},{1}) ", item.ModuleId, item.ActionId);
            }
            return base.ExcuteNoQuery(sb.ToString(), new Object[] { });
        }

        public bool DeleteModuleAction(string ids) {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("delete from BaseModuleAction where ModuleActionId in({0}) ", ids);
            return base.ExcuteNoQuery(sb.ToString(), new Object[] { });
        }
    }
}    
