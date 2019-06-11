using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class RoleGroupService {
		private readonly RoleGroupRepository dao = new RoleGroupRepository();

        public int Add(RoleGroup model) {
            return dao.Add(model);
        }

        public RoleGroup Get(int RoleId) {
            return dao.GetEntity(m => m.RoleId == RoleId);
        }

        public RoleGroup Get(Expression<Func<RoleGroup,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(RoleGroup model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new RoleGroup() { RoleId = id });
            }
            return rows;
        }
        public List<RoleGroup> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<RoleGroup> GetPageList(RoleGroupRequest query) {
            int total = 0;
            List<RoleGroup> list = dao.GetListOrder(m => m.RoleId == query.RoleId, m => m.RoleId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
