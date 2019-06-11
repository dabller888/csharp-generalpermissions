

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// GroupUser 操作类
    /// </summary>
    public partial class GroupUserAction
    {
        

        public static GroupUser Select(Int32 groupId, Int32 userId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM GroupUser WHERE GroupId = @groupid AND UserId = @userid ")
                    .Parameter("groupid", groupId)
.Parameter("userid", userId)
                    .QuerySingle<GroupUser>();
            }
        }

        public static List<GroupUser> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<GroupUser> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<GroupUser> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<GroupUser>(" * ")
                    .From(" GroupUser ");

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
                return context.Sql(" SELECT COUNT(*) FROM GroupUser ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(GroupUser groupUser) 
        {
            using (var context =db.Context())
            {
                return context.Insert<GroupUser>("GroupUser", groupUser)
                    .Execute() > 0;
            }
        }
        public static bool Update(GroupUser groupUser)
        {
            using (var context = db.Context())
            {
                return context.Update<GroupUser>("GroupUser", groupUser)
                    .AutoMap(x => new { x.GroupId, x.UserId })
                                        .Where("GroupId", groupUser.GroupId)
                                        .Where("UserId", groupUser.UserId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(GroupUser groupUser) 
        {
            return Delete(groupUser.GroupId, groupUser.UserId);
        }

        public static bool Delete(Int32 groupId, Int32 userId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE GroupId = @groupid AND UserId = @userid ")
                    .Parameter("groupid", groupId)
.Parameter("userid", userId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
