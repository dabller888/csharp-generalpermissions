using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class UserGroupService {
		private readonly UserGroupRepository dao = new UserGroupRepository();

        public int Add(UserGroup model) {
            return dao.Add(model);
        }

        public UserGroup Get(int UserId) {
            return dao.GetEntity(m => m.UserId == UserId);
        }

        public UserGroup Get(Expression<Func<UserGroup,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(UserGroup model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new UserGroup() { UserId = id });
            }
            return rows;
        }
        public List<UserGroup> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<UserGroup> GetPageList(UserGroupRequest query) {
            int total = 0;
            List<UserGroup> list = dao.GetListOrder(m => m.UserId == query.UserId, m => m.UserId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
