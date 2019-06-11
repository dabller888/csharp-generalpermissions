

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// SysDepartment 操作类
    /// </summary>
    public partial class SysDepartmentAction
    {
        

        public static SysDepartment Select(Int32 deptId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM SysDepartment WHERE DeptId = @deptid ")
                    .Parameter("deptid", deptId)
                    .QuerySingle<SysDepartment>();
            }
        }

        public static List<SysDepartment> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<SysDepartment> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<SysDepartment> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<SysDepartment>(" * ")
                    .From(" SysDepartment ");

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
                return context.Sql(" SELECT COUNT(*) FROM SysDepartment ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(SysDepartment sysDepartment) 
        {
            using (var context = db.Context())
            {
                int id = context.Insert<SysDepartment>("SysDepartment", sysDepartment)
                    .AutoMap(x => x.DeptId)
                    .ExecuteReturnLastId<int>();

                sysDepartment.DeptId = id;
                return id > 0;
            }
        }
        public static bool Update(SysDepartment sysDepartment)
        {
            using (var context = db.Context())
            {
                return context.Update<SysDepartment>("SysDepartment", sysDepartment)
                    .AutoMap(x => x.DeptId)
                                        .Where("DeptId", sysDepartment.DeptId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(SysDepartment sysDepartment) 
        {
            return Delete(sysDepartment.DeptId);
        }

        public static bool Delete(Int32 deptId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE DeptId = @deptid ")
                    .Parameter("deptid", deptId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
