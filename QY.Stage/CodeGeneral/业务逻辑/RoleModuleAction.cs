

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// RoleModule 操作类
    /// </summary>
    public partial class RoleModuleAction
    {
        

        public static RoleModule Select(Int32 roleId, Int32 moduleId, Int32 actionId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM RoleModule WHERE RoleId = @roleid AND ModuleId = @moduleid AND ActionId = @actionid ")
                    .Parameter("roleid", roleId)
.Parameter("moduleid", moduleId)
.Parameter("actionid", actionId)
                    .QuerySingle<RoleModule>();
            }
        }

        public static List<RoleModule> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<RoleModule> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<RoleModule> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<RoleModule>(" * ")
                    .From(" RoleModule ");

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
                return context.Sql(" SELECT COUNT(*) FROM RoleModule ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(RoleModule roleModule) 
        {
            using (var context =db.Context())
            {
                return context.Insert<RoleModule>("RoleModule", roleModule)
                    .Execute() > 0;
            }
        }
        public static bool Update(RoleModule roleModule)
        {
            using (var context = db.Context())
            {
                return context.Update<RoleModule>("RoleModule", roleModule)
                    .AutoMap(x => new { x.RoleId, x.ModuleId, x.ActionId })
                                        .Where("RoleId", roleModule.RoleId)
                                        .Where("ModuleId", roleModule.ModuleId)
                                        .Where("ActionId", roleModule.ActionId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(RoleModule roleModule) 
        {
            return Delete(roleModule.RoleId, roleModule.ModuleId, roleModule.ActionId);
        }

        public static bool Delete(Int32 roleId, Int32 moduleId, Int32 actionId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE RoleId = @roleid AND ModuleId = @moduleid AND ActionId = @actionid ")
                    .Parameter("roleid", roleId)
.Parameter("moduleid", moduleId)
.Parameter("actionid", actionId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
