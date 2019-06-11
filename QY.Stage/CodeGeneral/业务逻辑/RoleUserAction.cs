

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// RoleUser 操作类
    /// </summary>
    public partial class RoleUserAction
    {
        

        public static RoleUser Select(Int32 roleId, Int32 userId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM RoleUser WHERE RoleId = @roleid AND UserId = @userid ")
                    .Parameter("roleid", roleId)
.Parameter("userid", userId)
                    .QuerySingle<RoleUser>();
            }
        }

        public static List<RoleUser> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<RoleUser> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<RoleUser> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<RoleUser>(" * ")
                    .From(" RoleUser ");

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
                return context.Sql(" SELECT COUNT(*) FROM RoleUser ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(RoleUser roleUser) 
        {
            using (var context =db.Context())
            {
                return context.Insert<RoleUser>("RoleUser", roleUser)
                    .Execute() > 0;
            }
        }
        public static bool Update(RoleUser roleUser)
        {
            using (var context = db.Context())
            {
                return context.Update<RoleUser>("RoleUser", roleUser)
                    .AutoMap(x => new { x.RoleId, x.UserId })
                                        .Where("RoleId", roleUser.RoleId)
                                        .Where("UserId", roleUser.UserId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(RoleUser roleUser) 
        {
            return Delete(roleUser.RoleId, roleUser.UserId);
        }

        public static bool Delete(Int32 roleId, Int32 userId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE RoleId = @roleid AND UserId = @userid ")
                    .Parameter("roleid", roleId)
.Parameter("userid", userId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
