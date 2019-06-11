

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// UserGroup 操作类
    /// </summary>
    public partial class UserGroupAction
    {
        

        public static UserGroup Select(Int32 userId, Int32 groupId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM UserGroup WHERE UserId = @userid AND GroupId = @groupid ")
                    .Parameter("userid", userId)
.Parameter("groupid", groupId)
                    .QuerySingle<UserGroup>();
            }
        }

        public static List<UserGroup> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<UserGroup> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<UserGroup> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<UserGroup>(" * ")
                    .From(" UserGroup ");

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
                return context.Sql(" SELECT COUNT(*) FROM UserGroup ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(UserGroup userGroup) 
        {
            using (var context =db.Context())
            {
                return context.Insert<UserGroup>("UserGroup", userGroup)
                    .Execute() > 0;
            }
        }
        public static bool Update(UserGroup userGroup)
        {
            using (var context = db.Context())
            {
                return context.Update<UserGroup>("UserGroup", userGroup)
                    .AutoMap(x => new { x.UserId, x.GroupId })
                                        .Where("UserId", userGroup.UserId)
                                        .Where("GroupId", userGroup.GroupId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(UserGroup userGroup) 
        {
            return Delete(userGroup.UserId, userGroup.GroupId);
        }

        public static bool Delete(Int32 userId, Int32 groupId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE UserId = @userid AND GroupId = @groupid ")
                    .Parameter("userid", userId)
.Parameter("groupid", groupId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
