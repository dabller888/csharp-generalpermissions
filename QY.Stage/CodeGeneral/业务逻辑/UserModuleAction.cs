

using System;
using System.Collections.Generic;
using QY.Stage.Model.PocoModel;
using FluentData;
namespace MY.BLL
{    
    
    /// <summary>
    /// UserModule 操作类
    /// </summary>
    public partial class UserModuleAction
    {
        

        public static UserModule Select(Int32 userId, Int32 moduleId)
        {
            using(var context = db.Context())
            {
                return context.Sql(" SELECT * FROM UserModule WHERE UserId = @userid AND ModuleId = @moduleid ")
                    .Parameter("userid", userId)
.Parameter("moduleid", moduleId)
                    .QuerySingle<UserModule>();
            }
        }

        public static List<UserModule> SelectAll()
        {
            return SelectAll(string.Empty);
        }

        public static List<UserModule> SelectAll(string sortExpression)
        {
            return SelectAll(0, 0, sortExpression);
        }

        public static List<UserModule> SelectAll(int startRowIndex, int maximumRows, string sortExpression)
        {
            using (var context = db.Context())
            {
                var select = context.Select<UserModule>(" * ")
                    .From(" UserModule ");

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
                return context.Sql(" SELECT COUNT(*) FROM UserModule ")
                    .QuerySingle<int>();
            }
        }

        
        public static bool Insert(UserModule userModule) 
        {
            using (var context =db.Context())
            {
                return context.Insert<UserModule>("UserModule", userModule)
                    .Execute() > 0;
            }
        }
        public static bool Update(UserModule userModule)
        {
            using (var context = db.Context())
            {
                return context.Update<UserModule>("UserModule", userModule)
                    .AutoMap(x => new { x.UserId, x.ModuleId })
                                        .Where("UserId", userModule.UserId)
                                        .Where("ModuleId", userModule.ModuleId)
                                        .Execute() > 0;
            }
        }

        public static bool Delete(UserModule userModule) 
        {
            return Delete(userModule.UserId, userModule.ModuleId);
        }

        public static bool Delete(Int32 userId, Int32 moduleId)
        {
            using (var context = db.Context())
            {
                return context.Sql(" DELETE FROM Product WHERE UserId = @userid AND ModuleId = @moduleid ")
                    .Parameter("userid", userId)
.Parameter("moduleid", moduleId)
                    .Execute() > 0;
            }
        }
    }
    
}
    
