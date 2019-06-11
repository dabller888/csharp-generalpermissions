using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class SysModuleService {
		private readonly SysModuleRepository dao = new SysModuleRepository();

        public int Add(SysModule model) {
            return dao.Add(model);
        }

        public SysModule Get(int ModuleId) {
            return dao.GetEntity(m => m.ModuleId == ModuleId );
        }

        public SysModule Get(Expression<Func<SysModule,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(SysModule model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new SysModule() { ModuleId = id });
            }
            return rows;
        }
        public List<SysModule> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<SysModule> GetPageList(SysModuleRequest query) {
            int total = 0;
            List<SysModule> list = dao.GetListOrder(m => m.ModuleId == query.ModuleId , m => m.ModuleId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
