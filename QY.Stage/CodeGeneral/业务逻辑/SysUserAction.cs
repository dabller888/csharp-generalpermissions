

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// SysUser 操作类
    /// </summary>
    public partial class SysUserAction
    {
        

        public static SysUser Select(Int32 userId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM SysUser WHERE UserId = @userid ")
                    .Parameter("userid", userId)
                    .QuerySingle<SysUser>();
            }
        }

        public static List<SysUser> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<SysUser> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<SysUser> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<SysUser>(" * ")
                    .From(" SysUser ");

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
                return context.Sql(" SELECT COUNT(*) FROM SysUser ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(SysUser sysUser) 
        {
            using (var context = db.Context())
            {
                int id = context.Insert<SysUser>("SysUser", sysUser)
                    .AutoMap(x => x.UserId)
                    .ExecuteReturnLastId<int>();

                sysUser.UserId = id;
                return id > 0;
            }
        }
        public static bool Update(SysUser sysUser)
        {
            using (var context = db.Context())
            {
                return context.Update<SysUser>("SysUser", sysUser)
                    .AutoMap(x => x.UserId)
                                        .Where("UserId", sysUser.UserId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(SysUser sysUser) 
        {
            return Delete(sysUser.UserId);
        }

        public static bool Delete(Int32 userId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE UserId = @userid ")
                    .Parameter("userid", userId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
