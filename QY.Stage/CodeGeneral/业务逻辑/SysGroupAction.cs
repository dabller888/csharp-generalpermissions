

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// SysGroup 操作类
    /// </summary>
    public partial class SysGroupAction
    {
        

        public static SysGroup Select(Int32 groupId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM SysGroup WHERE GroupId = @groupid ")
                    .Parameter("groupid", groupId)
                    .QuerySingle<SysGroup>();
            }
        }

        public static List<SysGroup> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<SysGroup> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<SysGroup> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<SysGroup>(" * ")
                    .From(" SysGroup ");

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
                return context.Sql(" SELECT COUNT(*) FROM SysGroup ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(SysGroup sysGroup) 
        {
            using (var context = db.Context())
            {
                int id = context.Insert<SysGroup>("SysGroup", sysGroup)
                    .AutoMap(x => x.GroupId)
                    .ExecuteReturnLastId<int>();

                sysGroup.GroupId = id;
                return id > 0;
            }
        }
        public static bool Update(SysGroup sysGroup)
        {
            using (var context = db.Context())
            {
                return context.Update<SysGroup>("SysGroup", sysGroup)
                    .AutoMap(x => x.GroupId)
                                        .Where("GroupId", sysGroup.GroupId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(SysGroup sysGroup) 
        {
            return Delete(sysGroup.GroupId);
        }

        public static bool Delete(Int32 groupId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE GroupId = @groupid ")
                    .Parameter("groupid", groupId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
