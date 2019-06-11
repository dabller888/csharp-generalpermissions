

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// SysAction 操作类
    /// </summary>
    public partial class SysActionAction
    {
        

        public static SysAction Select(Int32 actionId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM SysAction WHERE ActionId = @actionid ")
                    .Parameter("actionid", actionId)
                    .QuerySingle<SysAction>();
            }
        }

        public static List<SysAction> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<SysAction> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<SysAction> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<SysAction>(" * ")
                    .From(" SysAction ");

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
                return context.Sql(" SELECT COUNT(*) FROM SysAction ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(SysAction sysAction) 
        {
            using (var context = db.Context())
            {
                int id = context.Insert<SysAction>("SysAction", sysAction)
                    .AutoMap(x => x.ActionId)
                    .ExecuteReturnLastId<int>();

                sysAction.ActionId = id;
                return id > 0;
            }
        }
        public static bool Update(SysAction sysAction)
        {
            using (var context = db.Context())
            {
                return context.Update<SysAction>("SysAction", sysAction)
                    .AutoMap(x => x.ActionId)
                                        .Where("ActionId", sysAction.ActionId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(SysAction sysAction) 
        {
            return Delete(sysAction.ActionId);
        }

        public static bool Delete(Int32 actionId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE ActionId = @actionid ")
                    .Parameter("actionid", actionId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
