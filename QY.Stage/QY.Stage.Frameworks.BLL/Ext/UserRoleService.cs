using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.Frameworks.DAL;

namespace QY.Stage.Frameworks.BLL {
    public partial class UserRoleService {
        private readonly UserRoleRepository userroleDao = new UserRoleRepository();

        //删除
        public int DeleteUserRole(List<UserRole> userrole) {
            int rows = 0;
            foreach (var id in userrole) {
                rows += userroleDao.Remove(new UserRole() { UserId = id.UserId, RoleId = id.RoleId });
            }
            return rows;
        }

        //获取匹配用户角色
        public List<UserRole> GetPathUR() {
            return userroleDao.GetPatchUR();
        }
    }
}
