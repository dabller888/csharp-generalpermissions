

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// GroupRole 操作类
    /// </summary>
    public partial class GroupRoleAction
    {
        

        public static GroupRole Select(Int32 groupId, Int32 roleId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM GroupRole WHERE GroupId = @groupid AND RoleId = @roleid ")
                    .Parameter("groupid", groupId)
.Parameter("roleid", roleId)
                    .QuerySingle<GroupRole>();
            }
        }

        public static List<GroupRole> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<GroupRole> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<GroupRole> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<GroupRole>(" * ")
                    .From(" GroupRole ");

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
                return context.Sql(" SELECT COUNT(*) FROM GroupRole ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(GroupRole groupRole) 
        {
            using (var context =db.Context())
            {
                return context.Insert<GroupRole>("GroupRole", groupRole)
                    .Execute() > 0;
            }
        }
        public static bool Update(GroupRole groupRole)
        {
            using (var context = db.Context())
            {
                return context.Update<GroupRole>("GroupRole", groupRole)
                    .AutoMap(x => new { x.GroupId, x.RoleId })
                                        .Where("GroupId", groupRole.GroupId)
                                        .Where("RoleId", groupRole.RoleId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(GroupRole groupRole) 
        {
            return Delete(groupRole.GroupId, groupRole.RoleId);
        }

        public static bool Delete(Int32 groupId, Int32 roleId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE GroupId = @groupid AND RoleId = @roleid ")
                    .Parameter("groupid", groupId)
.Parameter("roleid", roleId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
