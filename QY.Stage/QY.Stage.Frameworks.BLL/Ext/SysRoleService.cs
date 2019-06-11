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
        /*
        public int AddSysRole(SysRole model) {
            return dao.Add(model);
        }

        public SysRole GetSysRole(int id) {
            return dao.GetEntity(m => m.RoleId == id);
        }

        public SysRole GetSysRole(Expression<Func<SysRole, bool>> query) {
            return dao.GetEntity(query);
        }

        public int UpdateSysRole(SysRole model) {
            return dao.Update(model, null);
        }
        public int DeleteSysRoles(List<int> ids) {
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
            int totle = 0;
            List<SysRole> list = dao.GetListOrder(m => m.RoleId == query.RoleId, m => m.RoleId, true, query.PageSize, query.PageIndex, out totle);
            query.TotalCount = totle;
            return list;
        }
        */
    }
}
