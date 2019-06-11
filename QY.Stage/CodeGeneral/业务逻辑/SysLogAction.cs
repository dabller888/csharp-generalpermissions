

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// SysLog 操作类
    /// </summary>
    public partial class SysLogAction
    {
        

        public static SysLog Select(Int32 logId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM SysLog WHERE LogId = @logid ")
                    .Parameter("logid", logId)
                    .QuerySingle<SysLog>();
            }
        }

        public static List<SysLog> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<SysLog> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<SysLog> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<SysLog>(" * ")
                    .From(" SysLog ");

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
                return context.Sql(" SELECT COUNT(*) FROM SysLog ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(SysLog sysLog) 
        {
            using (var context = db.Context())
            {
                int id = context.Insert<SysLog>("SysLog", sysLog)
                    .AutoMap(x => x.LogId)
                    .ExecuteReturnLastId<int>();

                sysLog.LogId = id;
                return id > 0;
            }
        }
        public static bool Update(SysLog sysLog)
        {
            using (var context = db.Context())
            {
                return context.Update<SysLog>("SysLog", sysLog)
                    .AutoMap(x => x.LogId)
                                        .Where("LogId", sysLog.LogId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(SysLog sysLog) 
        {
            return Delete(sysLog.LogId);
        }

        public static bool Delete(Int32 logId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE LogId = @logid ")
                    .Parameter("logid", logId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
