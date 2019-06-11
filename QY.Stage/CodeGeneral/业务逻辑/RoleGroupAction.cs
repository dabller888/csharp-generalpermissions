

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// RoleGroup 操作类
    /// </summary>
    public partial class RoleGroupAction
    {
        

        public static RoleGroup Select(Int32 roleId, Int32 groupId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM RoleGroup WHERE RoleId = @roleid AND GroupId = @groupid ")
                    .Parameter("roleid", roleId)
.Parameter("groupid", groupId)
                    .QuerySingle<RoleGroup>();
            }
        }

        public static List<RoleGroup> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<RoleGroup> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<RoleGroup> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<RoleGroup>(" * ")
                    .From(" RoleGroup ");

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
                return context.Sql(" SELECT COUNT(*) FROM RoleGroup ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(RoleGroup roleGroup) 
        {
            using (var context =db.Context())
            {
                return context.Insert<RoleGroup>("RoleGroup", roleGroup)
                    .Execute() > 0;
            }
        }
        public static bool Update(RoleGroup roleGroup)
        {
            using (var context = db.Context())
            {
                return context.Update<RoleGroup>("RoleGroup", roleGroup)
                    .AutoMap(x => new { x.RoleId, x.GroupId })
                                        .Where("RoleId", roleGroup.RoleId)
                                        .Where("GroupId", roleGroup.GroupId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(RoleGroup roleGroup) 
        {
            return Delete(roleGroup.RoleId, roleGroup.GroupId);
        }

        public static bool Delete(Int32 roleId, Int32 groupId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE RoleId = @roleid AND GroupId = @groupid ")
                    .Parameter("roleid", roleId)
.Parameter("groupid", groupId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
