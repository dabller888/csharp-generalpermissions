using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class UserRoleService {
		private readonly UserRoleRepository dao = new UserRoleRepository();

        public int Add(UserRole model) {
            return dao.Add(model);
        }

        public UserRole Get(int UserId) {
            return dao.GetEntity(m => m.UserId == UserId);
        }

        public UserRole Get(Expression<Func<UserRole,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(UserRole model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new UserRole() { UserId = id });
            }
            return rows;
        }
        public List<UserRole> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<UserRole> GetPageList(UserRoleRequest query) {
            int total = 0;
            List<UserRole> list = dao.GetListOrder(m => m.UserId == query.UserId, m => m.UserId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
