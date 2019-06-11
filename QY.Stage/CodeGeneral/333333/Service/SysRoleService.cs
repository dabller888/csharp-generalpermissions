using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.ViewModel;
using QY.Stage.Frameworks.DAL;
namespace QY.Stage.Frameworks.BLL {
    public partial class SysRoleService {
		private readonly SysRoleRepository dao = new SysRoleRepository();

        public int Add(SysRole model) {
            return dao.Add(model);
        }

        public SysRole Get(int RoleId) {
            return dao.GetEntity(m => m.RoleId == RoleId );
        }

        public SysRole Get(Expression<Func<SysRole,bool>> query) {
            return dao.GetEntity(query);
        }

        public int Update(SysRole model) {
            return dao.Update(model, null);
        }
        public int Delete(List<int> ids) {
            //改成根据主键一次性删除
            int rows = 0;
            foreach (var id in ids) {
                rows += dao.Remove(new SysRole() { RoleId = id });
            }
            return rows;
        }
        public List<SysRole> GetAllList() {
            return dao.GetList(m => true);
        }

        public List<SysRole> GetPageList(SysRoleRequest query) {
            int total = 0;
            List<SysRole> list = dao.GetListOrder(m => m.RoleId == query.RoleId , m => m.RoleId, true, query.PageSize, query.PageIndex, out total);
            query.TotalCount = total;
            return list;
        }
    }
}    
