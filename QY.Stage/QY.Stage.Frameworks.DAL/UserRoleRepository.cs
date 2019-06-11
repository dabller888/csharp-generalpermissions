using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Data.Entity;
using QY.Stage.PocoModel;
using System.Data.Entity.Infrastructure;
namespace QY.Stage.Frameworks.DAL {
    public class UserRoleRepository : BaseRepository<UserRole> {
        //获取用户角色信息
        public List<UserRole> GetPatchUR() {
            string sql = @"select t1.RoleId,t1.UserId,t3.RoleName,t2.RealName,t2.LoginName from BaseUserRole t1
                            left join BaseSysUser t2 on t1.UserId=t2.UserId
                            left join BaseSysRole t3 on t1.RoleId=t3.RoleId
                            where t2.IsDeleted=0 and t3.IsDeleted=0 ";
            DbRawSqlQuery<UserRole> userrole = base.ExecuteQuery(sql, new Object[] { });
            return userrole.ToList<UserRole>();
        }

        //批量添加用户角色事务
        public int AddUserRole() {
            //using (IDbTransaction transaction = DB.BeginTransaction()) {
            //    try {
            //        transaction.Commit();
            //    } catch (Exception) {
            //        transaction.Rollback();
            //    }
            //}
            return 0;
        }

        //public int AddUserRole() {
        //    using (BlogDbContext context = new BlogDbContext()) {
        //        using (TransactionScope transaction = new TransactionScope()) //这个事务处理
        //        {
        //            context.BlogPosts.Add(blogPost);
        //            context.SaveChanges();
        //            postBody.ID = blogPost.ID;
        //            context.EntryViewCounts.Add(new EntryViewCount() { EntryID = blogPost.ID });
        //            context.PostBodys.Add(postBody);
        //            context.SaveChanges();
        //            //提交事务
        //            transaction.Complete();
        //        }
        //    }
        //}
    }
}    
