using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class RoleUserService {
		private readonly RoleUserRepository dao = new RoleUserRepository();

        public int Add(RoleUser model) {
            return dao.Add(model);
        }

        public RoleUser Get(int RoleId) {
            return dao.GetEntity(m => m.RoleId == RoleId);
        }

        public RoleUser Get(Expression<Func<RoleUser,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(RoleUser model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new RoleUser() { RoleId = id });
            }
            return rows;
        }
        public List<RoleUser> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<RoleUser> GetPageList(RoleUserRequest query) {
            int total = 0;
            List<RoleUser> list = dao.GetListOrder(m => m.RoleId == query.RoleId, m => m.RoleId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
