using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class SysUserService {
		private readonly SysUserRepository dao = new SysUserRepository();

        public int Add(SysUser model) {
            return dao.Add(model);
        }

        public SysUser Get(int UserId) {
            return dao.GetEntity(m => m.UserId == UserId );
        }

        public SysUser Get(Expression<Func<SysUser,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(SysUser model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new SysUser() { UserId = id });
            }
            return rows;
        }
        public List<SysUser> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<SysUser> GetPageList(SysUserRequest query) {
            int total = 0;
            List<SysUser> list = dao.GetListOrder(m => m.LoginName.Contains(query.LoginName) || m.Email.Contains(query.Email) , 
                                                  m => m.UserId, 
                                                  true, 
                                                  query.PageSize, 
                                                  query.PageIndex, 
                                                  out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
