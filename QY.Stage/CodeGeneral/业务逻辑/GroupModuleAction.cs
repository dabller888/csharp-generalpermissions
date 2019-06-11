

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// GroupModule 操作类
    /// </summary>
    public partial class GroupModuleAction
    {
        

        public static GroupModule Select(Int32 groupId, Int32 moduleId, Int32 actionId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM GroupModule WHERE GroupId = @groupid AND ModuleId = @moduleid AND ActionId = @actionid ")
                    .Parameter("groupid", groupId)
.Parameter("moduleid", moduleId)
.Parameter("actionid", actionId)
                    .QuerySingle<GroupModule>();
            }
        }

        public static List<GroupModule> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<GroupModule> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<GroupModule> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<GroupModule>(" * ")
                    .From(" GroupModule ");

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
                return context.Sql(" SELECT COUNT(*) FROM GroupModule ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(GroupModule groupModule) 
        {
            using (var context =db.Context())
            {
                return context.Insert<GroupModule>("GroupModule", groupModule)
                    .Execute() > 0;
            }
        }
        public static bool Update(GroupModule groupModule)
        {
            using (var context = db.Context())
            {
                return context.Update<GroupModule>("GroupModule", groupModule)
                    .AutoMap(x => new { x.GroupId, x.ModuleId, x.ActionId })
                                        .Where("GroupId", groupModule.GroupId)
                                        .Where("ModuleId", groupModule.ModuleId)
                                        .Where("ActionId", groupModule.ActionId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(GroupModule groupModule) 
        {
            return Delete(groupModule.GroupId, groupModule.ModuleId, groupModule.ActionId);
        }

        public static bool Delete(Int32 groupId, Int32 moduleId, Int32 actionId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE GroupId = @groupid AND ModuleId = @moduleid AND ActionId = @actionid ")
                    .Parameter("groupid", groupId)
.Parameter("moduleid", moduleId)
.Parameter("actionid", actionId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
