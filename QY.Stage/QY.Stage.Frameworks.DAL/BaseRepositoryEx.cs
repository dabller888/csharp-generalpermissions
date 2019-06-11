using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Entity;
using System.Text;
using System.Data.Entity.Infrastructure;

namespace QY.Stage.Frameworks.DAL {
    /// <summary>
    /// EF封装基本仓储操作
    /// </summary>
    public class BaseRepositoryEx<T> where T : class {
        public T AddEntities(T entity) {
            using (DbContextBase db = new DbContextBase()) {
                db.Entry<T>(entity).State = EntityState.Added;
                db.SaveChanges();
                return entity;
            }
        }

        //修改
        public bool UpdateEntities(T entity) {
            using (DbContextBase db = new DbContextBase()) {
                db.Set<T>().Attach(entity);
                db.Entry<T>(entity).State = EntityState.Modified;
                //db.Entry<T>(entity).State = EntityState.Unchanged;
                return db.SaveChanges() > 0;
            }
        }

        //修改
        public bool DeleteEntities(T entity) {
            using (DbContextBase db = new DbContextBase()) {
                db.Set<T>().Attach(entity);
                db.Entry<T>(entity).State = EntityState.Deleted;
                return db.SaveChanges() > 0;
            }
        }

        //查询
        public IQueryable<T> LoadEntities(Func<T, bool> wherelambda) {
            using (DbContextBase db = new DbContextBase()) {
                return db.Set<T>().Where<T>(wherelambda).AsQueryable();
            }
        }

        //分页
        public IQueryable<T> LoadPagerEntities<S>(int pageSize,
                                                  int pageIndex,
                                                  out int total,
                                                  Func<T, bool> whereLambda,
                                                  bool isAsc,
                                                  Func<T, S> orderByLambda) {
            using (DbContextBase db = new DbContextBase()) {
                var tempData = db.Set<T>().Where<T>(whereLambda);
                total = tempData.Count();
                //排序获取当前页的数据
                if (isAsc) {
                    tempData = tempData.OrderBy<T, S>(orderByLambda).
                          Skip<T>(pageSize * (pageIndex - 1)).
                          Take<T>(pageSize).AsQueryable();
                } else {
                    tempData = tempData.OrderByDescending<T, S>(orderByLambda).
                         Skip<T>(pageSize * (pageIndex - 1)).
                         Take<T>(pageSize).AsQueryable();
                }
                return tempData.AsQueryable();
            }
        }

        #region 执行sql语句
        //增删改
        public bool ExcuteNoQuery(string sql, object[] parameters) {
            using (DbContextBase db = new DbContextBase()) {
                return db.Database.ExecuteSqlCommand(sql, parameters) > 0;
            }
        }
        //查询
        public DbRawSqlQuery<T> ExecuteQuery(string sql, object[] parameters) {
            using (DbContextBase db = new DbContextBase()) {
                return db.Database.SqlQuery<T>(sql, parameters);
                //return db.Database.SqlQuery(typeof(T), sql, parameters);
            }
        }
        public DbRawSqlQuery<int> ExecuteScale(string sql, object[] parameters) {
            using (DbContextBase db = new DbContextBase()) {
                return db.Database.SqlQuery<int>(sql, parameters);
            }
        }
        public void ExecSql(string sql, List<string> parms) {
            using (DbContextBase db = new DbContextBase()) {
                db.Database.ExecuteSqlCommand(sql, parms.ToArray());
            }
        }
        #endregion

    }
}
