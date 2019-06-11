using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class GroupRoleService {
		private readonly GroupRoleRepository dao = new GroupRoleRepository();

        public int Add(GroupRole model) {
            return dao.Add(model);
        }

        public GroupRole Get(int GroupId) {
            return dao.GetEntity(m => m.GroupId == GroupId);
        }

        public GroupRole Get(Expression<Func<GroupRole,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(GroupRole model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new GroupRole() { GroupId = id });
            }
            return rows;
        }
        public List<GroupRole> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<GroupRole> GetPageList(GroupRoleRequest query) {
            int total = 0;
            List<GroupRole> list = dao.GetListOrder(m => m.GroupId == query.GroupId, m => m.GroupId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
