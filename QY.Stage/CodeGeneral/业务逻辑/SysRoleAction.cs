

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// SysRole 操作类
    /// </summary>
    public partial class SysRoleAction
    {
        

        public static SysRole Select(Int32 roleId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM SysRole WHERE RoleId = @roleid ")
                    .Parameter("roleid", roleId)
                    .QuerySingle<SysRole>();
            }
        }

        public static List<SysRole> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<SysRole> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<SysRole> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<SysRole>(" * ")
                    .From(" SysRole ");

                if (maximumRows > 0)
                {
                    if (startRowIndex == 0) 
                        startRowIndex = 1;

                    select.Paging(startRowIndex, maximumRows);
                }

                if (!string.IsNullOrEmpty(sortExpression))
                    select.OrderBy(sortExpression);

                return select.QueryMany();
            }
        }

        public static int CountAll()
        {
            using (var context = db.Context())
            {
                return context.Sql(" SELECT COUNT(*) FROM SysRole ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(SysRole sysRole) 
        {
            using (var context = db.Context())
            {
                int id = context.Insert<SysRole>("SysRole", sysRole)
                    .AutoMap(x => x.RoleId)
                    .ExecuteReturnLastId<int>();

                sysRole.RoleId = id;
                return id > 0;
            }
        }
        public static bool Update(SysRole sysRole)
        {
            using (var context = db.Context())
            {
                return context.Update<SysRole>("SysRole", sysRole)
                    .AutoMap(x => x.RoleId)
                                        .Where("RoleId", sysRole.RoleId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(SysRole sysRole) 
        {
            return Delete(sysRole.RoleId);
        }

        public static bool Delete(Int32 roleId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE RoleId = @roleid ")
                    .Parameter("roleid", roleId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
