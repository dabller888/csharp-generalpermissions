using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace QY.Stage.Frameworks.DAL {
    public class BaseRepository<T> : IDisposable where T : class {
        DbContextBase db = new DbContextBase();

        #region 添加方法

        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="Model"></param>
        public int Add(T Model) {
            db.Set<T>().Add(Model);
            try{
                return db.SaveChanges();
            } catch (DbEntityValidationException ex) {
                throw ex;
            }catch(Exception ex){
                throw ex;
            }
        }

        #endregion

        #region 修改单个实体

        /// <summary>
        /// 修改单个实体
        /// </summary>
        /// <param name="Model">待修改的实体</param>
        /// <param name="modifyCol">修改的列</param>
        public int Update(T Model, List<string> modifyCol) {
            DbEntityEntry entry = db.Entry<T>(Model);

            if (modifyCol == null) {
                entry.State = EntityState.Modified;
            } else {
                entry.State = EntityState.Unchanged;
                foreach (string tempStr in modifyCol) {
                    entry.Property(tempStr).IsModified = true;
                }
            }
            try {
                return db.SaveChanges();
            } catch (DbEntityValidationException ex) {
                throw ex;
            } catch (Exception ex) {
                throw ex;
            }
        }

        #endregion

        #region 批量修改，根据反射

        /// <summary>
        /// 批量修改，根据反射
        /// </summary>
        /// <param name="Model">将值存入属性中</param>
        /// <param name="where">批量修改的条件</param>
        /// <param name="strs">属性</param>
        public void BatchUpdate(T Model, Expression<Func<T, bool>> where, params string[] strs) {
            //先根据条件查出符合要修改的集合
            List<T> tempList = db.Set<T>().Where(where).ToList();
            //获取类型
            Type t = typeof(T);
            //利用反射获取T类型public属性集合
            List<PropertyInfo> tempPro = t.GetProperties(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance).ToList();
            Dictionary<string, PropertyInfo> propertyDic = new Dictionary<string, PropertyInfo>();
            //遍历T的所有属性，将符合修改的存入字典中
            tempPro.ForEach(p => { if (strs.Contains(p.Name)) { propertyDic.Add(p.Name, p); } });
            //遍历要修改的属性
            foreach (string str in strs) {
                if (propertyDic.ContainsKey(str)) {
                    PropertyInfo propertyInfo = propertyDic[str];
                    //获取要修改属性的值
                    object value = propertyInfo.GetValue(Model, null);
                    foreach (T tempData in tempList) {
                        //设置值
                        propertyInfo.SetValue(tempData, value, null);
                    }
                }
            }
        }
        #endregion

        #region 根据实体主键删除操作

        /// <summary>
        /// 根据实体主键删除操作
        /// </summary>
        /// <param name="Model"></param>
        public int Remove(T Model) {
            db.Set<T>().Attach(Model);
            db.Set<T>().Remove(Model);
            return db.SaveChanges();
        }

        #endregion

        #region 根据条件删除操作

        /// <summary>
        /// 根据条件删除操作
        /// </summary>
        /// <param name="remWhere"></param>
        public int RemoveByWhere(Expression<Func<T, bool>> remWhere) {
            List<T> tempList = db.Set<T>().Where(remWhere).ToList();
            tempList.ForEach(t => { db.Set<T>().Attach(t); db.Set<T>().Remove(t); });
            return db.SaveChanges();
        }

        #endregion

        #region 带条件查询

        /// <summary>
        /// 带条件查询
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public List<T> GetList(Expression<Func<T, bool>> where) {
            return db.Set<T>().Where(where).ToList();
        }

        /// <summary>
        /// 带条件查询
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public T GetEntity(Expression<Func<T, bool>> where) {
            //return db.Set<T>().Where(where).FirstOrDefault();
            return db.Set<T>().Where(where).AsNoTracking().FirstOrDefault();
        }

        #endregion

        #region 带条件排序页码页容量查询

        /// <summary>
        /// 带条件排序，页码页容量查询
        /// </summary>
        /// <typeparam name="TKey"></typeparam>
        /// <param name="where"></param>
        /// <param name="orderBy"></param>
        /// <param name="isAsc"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public List<T> GetListOrder<TKey>(Expression<Func<T, bool>> where, Expression<Func<T, TKey>> orderBy, bool isAsc, int pageSize, int pageIndex, out int totalCount) {
            totalCount = 0;
            totalCount = db.Set<T>().Where(where).Count();

            if (isAsc) {
                return db.Set<T>().Where(where).OrderBy(orderBy).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            } else {
                return db.Set<T>().Where(where).OrderByDescending(orderBy).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            }
        }

        #endregion

        #region 执行sql语句
        //增删改
        public bool ExcuteNoQuery(string sql, object[] parameters) {
            return db.Database.ExecuteSqlCommand(sql, parameters) > 0;
        }
        //查询
        public DbRawSqlQuery<T> ExecuteQuery(string sql, object[] parameters) {
            return db.Database.SqlQuery<T>(sql, parameters);
            //return db.Database.SqlQuery(typeof(T), sql, parameters);
        }
        public DbRawSqlQuery<int> ExecuteScale(string sql, object[] parameters) {
            return db.Database.SqlQuery<int>(sql, parameters);
        }
        public void ExecSql(string sql, List<string> parms) {
            db.Database.ExecuteSqlCommand(sql, parms.ToArray());
        }
        #endregion

        public void Dispose() {
            db.Dispose();
        }
    }

    /// <summary>
    /// Lambda表达式字符串拼接
    /// http://www.cnblogs.com/wzxinchen/p/4611592.html
    /// lambda方式条件拼接（注：可以写一个LambdaToSQL方法）
    /// http://www.cnblogs.com/linxingxunyan/p/6245396.html
    /// </summary>
    public static class PredicateBuilder {
        public static Expression<Func<T, bool>> True<T>() { return f => true; }
        public static Expression<Func<T, bool>> False<T>() { return f => false; }
        public static Expression<T> Compose<T>(this Expression<T> first, Expression<T> second, Func<Expression, Expression, Expression> merge) {
            // build parameter map (from parameters of second to parameters of first)  
            var map = first.Parameters.Select((f, i) => new { f, s = second.Parameters[i] }).ToDictionary(p => p.s, p => p.f);

            // replace parameters in the second lambda expression with parameters from the first  
            var secondBody = ParameterRebinder.ReplaceParameters(map, second.Body);

            // apply composition of lambda expression bodies to parameters from the first expression   
            return Expression.Lambda<T>(merge(first.Body, secondBody), first.Parameters);
        }

        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> first, Expression<Func<T, bool>> second) {
            return first.Compose(second, Expression.And);
        }

        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> first, Expression<Func<T, bool>> second) {
            return first.Compose(second, Expression.Or);
        }
    }

    public class ParameterRebinder : ExpressionVisitor {
        private readonly Dictionary<ParameterExpression, ParameterExpression> map;

        public ParameterRebinder(Dictionary<ParameterExpression, ParameterExpression> map) {
            this.map = map ?? new Dictionary<ParameterExpression, ParameterExpression>();
        }

        public static Expression ReplaceParameters(Dictionary<ParameterExpression, ParameterExpression> map, Expression exp) {
            return new ParameterRebinder(map).Visit(exp);
        }

        protected override Expression VisitParameter(ParameterExpression p) {
            ParameterExpression replacement;
            if (map.TryGetValue(p, out replacement)) {
                p = replacement;
            }
            return base.VisitParameter(p);
        }
    }
}
