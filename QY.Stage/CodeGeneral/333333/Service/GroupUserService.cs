using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class GroupUserService {
		private readonly GroupUserRepository dao = new GroupUserRepository();

        public int Add(GroupUser model) {
            return dao.Add(model);
        }

        public GroupUser Get(int GroupId) {
            return dao.GetEntity(m => m.GroupId == GroupId);
        }

        public GroupUser Get(Expression<Func<GroupUser,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(GroupUser model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new GroupUser() { GroupId = id });
            }
            return rows;
        }
        public List<GroupUser> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<GroupUser> GetPageList(GroupUserRequest query) {
            int total = 0;
            List<GroupUser> list = dao.GetListOrder(m => m.GroupId == query.GroupId, m => m.GroupId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
