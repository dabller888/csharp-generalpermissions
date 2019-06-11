

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// UserRole 操作类
    /// </summary>
    public partial class UserRoleAction
    {
        

        public static UserRole Select(Int32 userId, Int32 roleId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM UserRole WHERE UserId = @userid AND RoleId = @roleid ")
                    .Parameter("userid", userId)
.Parameter("roleid", roleId)
                    .QuerySingle<UserRole>();
            }
        }

        public static List<UserRole> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<UserRole> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<UserRole> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<UserRole>(" * ")
                    .From(" UserRole ");

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
                return context.Sql(" SELECT COUNT(*) FROM UserRole ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(UserRole userRole) 
        {
            using (var context =db.Context())
            {
                return context.Insert<UserRole>("UserRole", userRole)
                    .Execute() > 0;
            }
        }
        public static bool Update(UserRole userRole)
        {
            using (var context = db.Context())
            {
                return context.Update<UserRole>("UserRole", userRole)
                    .AutoMap(x => new { x.UserId, x.RoleId })
                                        .Where("UserId", userRole.UserId)
                                        .Where("RoleId", userRole.RoleId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(UserRole userRole) 
        {
            return Delete(userRole.UserId, userRole.RoleId);
        }

        public static bool Delete(Int32 userId, Int32 roleId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE UserId = @userid AND RoleId = @roleid ")
                    .Parameter("userid", userId)
.Parameter("roleid", roleId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
