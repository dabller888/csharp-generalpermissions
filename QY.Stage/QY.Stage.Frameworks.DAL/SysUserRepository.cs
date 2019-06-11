using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Data.SqlClient;
using System.Data.Entity;
using QY.Stage.PocoModel;
namespace QY.Stage.Frameworks.DAL {
    public class SysUserRepository : BaseRepository<SysUser> {
        //ÐÞ¸ÄÃÜÂë
        public bool ModifyPasswdByUserName(string UserName, string Passwd) {
            return base.ExcuteNoQuery(@"update BaseSysUser set LoginPass=@LoginPass where LoginName=@LoginName ", new SqlParameter[]{
                new SqlParameter("@LoginName",UserName),
                new SqlParameter("@LoginPass",Passwd)
            });
        }

        //ÊÇ·ñÆôÓÃ
        public bool EnableUser(string UserName, int IsEnable) {
            return base.ExcuteNoQuery(@"update BaseSysUser set IsEnabled=@IsEnabled where LoginName=@LoginName ", new SqlParameter[]{
                new SqlParameter("@LoginName",UserName),
                new SqlParameter("@IsEnabled",IsEnable)
            });
        }

        //ÅúÁ¿Âß¼­É¾³ý
        public bool Delete(List<SysUser> Users) {
            if (Users == null) return false;
            StringBuilder sb = new StringBuilder();
            foreach (var user in Users) {
                sb.AppendFormat("update BaseSysUser set IsDelete=1 where UserId={0} ", user.UserId);
            }
            return base.ExcuteNoQuery(sb.ToString(), new Object[] { });
        }
    }
}    
