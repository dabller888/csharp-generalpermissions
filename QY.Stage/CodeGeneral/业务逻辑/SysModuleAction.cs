

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// SysModule 操作类
    /// </summary>
    public partial class SysModuleAction
    {
        

        public static SysModule Select(Int32 moduleId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM SysModule WHERE ModuleId = @moduleid ")
                    .Parameter("moduleid", moduleId)
                    .QuerySingle<SysModule>();
            }
        }

        public static List<SysModule> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<SysModule> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<SysModule> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<SysModule>(" * ")
                    .From(" SysModule ");

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
                return context.Sql(" SELECT COUNT(*) FROM SysModule ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(SysModule sysModule) 
        {
            using (var context = db.Context())
            {
                int id = context.Insert<SysModule>("SysModule", sysModule)
                    .AutoMap(x => x.ModuleId)
                    .ExecuteReturnLastId<int>();

                sysModule.ModuleId = id;
                return id > 0;
            }
        }
        public static bool Update(SysModule sysModule)
        {
            using (var context = db.Context())
            {
                return context.Update<SysModule>("SysModule", sysModule)
                    .AutoMap(x => x.ModuleId)
                                        .Where("ModuleId", sysModule.ModuleId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(SysModule sysModule) 
        {
            return Delete(sysModule.ModuleId);
        }

        public static bool Delete(Int32 moduleId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE ModuleId = @moduleid ")
                    .Parameter("moduleid", moduleId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
