using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class GroupModuleService {
		private readonly GroupModuleRepository dao = new GroupModuleRepository();

        public int Add(GroupModule model) {
            return dao.Add(model);
        }

        public GroupModule Get(int GroupId) {
            return dao.GetEntity(m => m.GroupId == GroupId);
        }

        public GroupModule Get(Expression<Func<GroupModule,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(GroupModule model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new GroupModule() { GroupId = id });
            }
            return rows;
        }
        public List<GroupModule> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<GroupModule> GetPageList(GroupModuleRequest query) {
            int total = 0;
            List<GroupModule> list = dao.GetListOrder(m => m.GroupId == query.GroupId, m => m.GroupId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
