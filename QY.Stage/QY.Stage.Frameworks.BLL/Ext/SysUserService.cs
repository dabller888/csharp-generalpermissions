using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using QY.Stage.PocoModel;
using QY.Stage.Frameworks.DAL;

namespace QY.Stage.Frameworks.BLL {
    public partial class SysUserService {
        private readonly SysUserRepository userDao = new SysUserRepository();
        //修改密码
        public bool ModifyPasswdByUserName(string UserName,string Passwd) {
            return userDao.ModifyPasswdByUserName(UserName, Passwd);
        }

        //是否启用
        public bool EnableUser(string UserName, int IsEnable) {
            return userDao.EnableUser(UserName,IsEnable);
        }

        //批量逻辑删除
        public bool Delete(List<SysUser> Users) {
            return userDao.Delete(Users);
        }
    }
}
