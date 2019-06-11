using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class UserModuleService {
		private readonly UserModuleRepository dao = new UserModuleRepository();

        public int Add(UserModule model) {
            return dao.Add(model);
        }

        public UserModule Get(int UserId) {
            return dao.GetEntity(m => m.UserId == UserId);
        }

        public UserModule Get(Expression<Func<UserModule,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(UserModule model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new UserModule() { UserId = id });
            }
            return rows;
        }
        public List<UserModule> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<UserModule> GetPageList(UserModuleRequest query) {
            int total = 0;
            List<UserModule> list = dao.GetListOrder(m => m.UserId == query.UserId, m => m.UserId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
