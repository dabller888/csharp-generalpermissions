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
		private readonly ModuleActionRepository dao = new ModuleActionRepository();

        public int Add(ModuleAction model) {
            return dao.Add(model);
        }

        public ModuleAction Get(int ModuleId) {
            return dao.GetEntity(m => m.ModuleId == ModuleId);
        }

        public ModuleAction Get(Expression<Func<ModuleAction,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(ModuleAction model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new ModuleAction() { ModuleId = id });
            }
            return rows;
        }
        public List<ModuleAction> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<ModuleAction> GetPageList(ModuleActionRequest query) {
            int total = 0;
            List<ModuleAction> list = dao.GetListOrder(m => m.ModuleId == query.ModuleId, m => m.ModuleId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
