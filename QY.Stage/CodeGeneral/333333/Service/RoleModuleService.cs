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
		private readonly RoleModuleRepository dao = new RoleModuleRepository();

        public int Add(RoleModule model) {
            return dao.Add(model);
        }

        public RoleModule Get(int RoleId) {
            return dao.GetEntity(m => m.RoleId == RoleId);
        }

        public RoleModule Get(Expression<Func<RoleModule,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(RoleModule model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new RoleModule() { RoleId = id });
            }
            return rows;
        }
        public List<RoleModule> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<RoleModule> GetPageList(RoleModuleRequest query) {
            int total = 0;
            List<RoleModule> list = dao.GetListOrder(m => m.RoleId == query.RoleId, m => m.RoleId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
