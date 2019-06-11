

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// ModuleAction 操作类
    /// </summary>
    public partial class ModuleActionAction
    {
        

        public static ModuleAction Select(Int32 moduleActionId, Int32 moduleId, Int32 actionId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM ModuleAction WHERE ModuleActionId = @moduleactionid AND ModuleId = @moduleid AND ActionId = @actionid ")
                    .Parameter("moduleactionid", moduleActionId)
.Parameter("moduleid", moduleId)
.Parameter("actionid", actionId)
                    .QuerySingle<ModuleAction>();
            }
        }

        public static List<ModuleAction> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<ModuleAction> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<ModuleAction> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<ModuleAction>(" * ")
                    .From(" ModuleAction ");

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
                return context.Sql(" SELECT COUNT(*) FROM ModuleAction ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(ModuleAction moduleAction) 
        {
            using (var context =db.Context())
            {
                return context.Insert<ModuleAction>("ModuleAction", moduleAction)
                    .Execute() > 0;
            }
        }
        public static bool Update(ModuleAction moduleAction)
        {
            using (var context = db.Context())
            {
                return context.Update<ModuleAction>("ModuleAction", moduleAction)
                    .AutoMap(x => new { x.ModuleActionId, x.ModuleId, x.ActionId })
                                        .Where("ModuleActionId", moduleAction.ModuleActionId)
                                        .Where("ModuleId", moduleAction.ModuleId)
                                        .Where("ActionId", moduleAction.ActionId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(ModuleAction moduleAction) 
        {
            return Delete(moduleAction.ModuleActionId, moduleAction.ModuleId, moduleAction.ActionId);
        }

        public static bool Delete(Int32 moduleActionId, Int32 moduleId, Int32 actionId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE ModuleActionId = @moduleactionid AND ModuleId = @moduleid AND ActionId = @actionid ")
                    .Parameter("moduleactionid", moduleActionId)
.Parameter("moduleid", moduleId)
.Parameter("actionid", actionId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
