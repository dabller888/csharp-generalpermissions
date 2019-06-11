using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Reflection;
using System.Text;

namespace CodeGeneral.mysql {

    public class DBHelper {
        //添加到配置文件的<configuration>节点中
        //   <connectionStrings>
        //       <!--改写数据库名，登陆名，密码-->
        //        <add name="conStr" connectionString="Data Source=.;Initial Catalog=;User ID=;Password="/>
        //  
        //   </connectionStrings>
        //<appSettings>
        //      <add key="dbConnection" value="server=192.168.1.111\SQL2005;database=GCUMS;UID=sa;PWD=sa;max pool size=20000;Pooling=true;"/>
        //  </appSettings>
        //先添加configuration引用，引入命名空间
        //private static readonly string conStr = ConfigurationManager.AppSettings["connstr"]; 
        //private static readonly string conStr = Config.ConnStr;
        /// <summary>
        /// 获得连接字符串
        /// </summary>
        /// <returns></returns>
        public static MySqlConnection getConn() {
            return new MySqlConnection(Config.ConnStr);
        }
        /// <summary>
        /// 查询获得首行首列的值，格式化SQL语句
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static object Scalar(String sql) {
            using (MySqlConnection con = getConn()) {
                try {
                    MySqlCommand com = new MySqlCommand(sql, con);
                    con.Open();
                    return com.ExecuteScalar();
                } catch (Exception ex) {
                    throw ex;
                }
            }
        }
        /// <summary>
        /// 查询获得首行首列的值 参数化sql语句
        /// </summary>
        /// <param name="paras">参数数组</param>
        /// <param name="sql">sql语句</param>
        /// <returns></returns>
        public static object Scalar(string sql, MySqlParameter[] paras) {
            using (MySqlConnection con = getConn()) {
                try {
                    MySqlCommand com = new MySqlCommand(sql, con);
                    con.Open();
                    if (paras != null) //如果参数
                    {
                        com.Parameters.AddRange(paras);
                    }
                    return com.ExecuteScalar();
                } catch (Exception ex) {
                    throw ex;

                }
            }
        }

        /// <summary>
        /// 增删改操作,返回受影响的行数，格式化SQL语句
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static int NoneQuery(String sql) {

            using (MySqlConnection conn = getConn()) {
                conn.Open();
                using (MySqlCommand comm = new MySqlCommand(sql, conn)) {
                    return comm.ExecuteNonQuery();
                }

            }
        }
        /// <summary>
        /// 增删改操作,返回受影响的行数 存储过程
        /// </summary>
        /// <param name="sql">存储过程名称</param>
        /// <param name="paras">参数</param>
        /// <returns></returns>
        public static int NoneQuery(String sql, MySqlParameter[] paras) {
            using (MySqlConnection conn = getConn()) {
                conn.Open();
                using (MySqlCommand comm = new MySqlCommand(sql, conn)) {
                    comm.Parameters.AddRange(paras);
                    return comm.ExecuteNonQuery();
                }

            }
        }
        /// <summary>
        /// 查询操作,返回一个数据表
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static DataTable GetDateTable(String sql) {
            using (MySqlConnection con = getConn()) {
                DataTable dt = new DataTable();
                try {
                    MySqlDataAdapter sda = new MySqlDataAdapter(sql, con);
                    sda.Fill(dt);
                } catch (Exception ex) {
                    throw ex;
                }
                return dt;
            }
        }
        /// <summary>
        ///  查询操作,返回一个数据表,存储过程
        /// </summary>
        /// <param name="sp_Name">存储过程名称</param>
        /// <param name="paras">存储过程参数</param>
        /// <returns></returns>
        public static DataTable GetDateTable(String sql, MySqlParameter[] paras) {
            using (MySqlConnection con = getConn()) {
                DataTable dt = new DataTable();
                try {
                    MySqlCommand com = new MySqlCommand(sql, con);
                    com.Parameters.AddRange(paras);
                    MySqlDataAdapter sda = new MySqlDataAdapter(com);
                    sda.Fill(dt);
                } catch (Exception ex) {
                    throw ex;
                }
                return dt;
            }
        }



    }

    /// <summary>
    /// DataTable与实体类互相转换
    /// </summary>
    /// <typeparam name="T">实体类</typeparam>
    public class DatatableFill<T> where T : new() {
        #region DataTable转换成实体类
        /// <summary>
        /// 填充对象列表：用DataSet的第一个表填充实体类
        /// </summary>
        /// <param name="ds">DataSet</param>
        /// <returns></returns>
        public List<T> FillModel(DataSet ds) {
            if (ds == null || ds.Tables[0] == null || ds.Tables[0].Rows.Count == 0) {
                return new List<T>();
            } else {
                return FillModel(ds.Tables[0]);
            }
        }

        /// <summary>  
        /// 填充对象列表：用DataSet的第index个表填充实体类
        /// </summary>  
        public List<T> FillModel(DataSet ds, int index) {
            if (ds == null || ds.Tables.Count <= index || ds.Tables[index].Rows.Count == 0) {
                return new List<T>();
            } else {
                return FillModel(ds.Tables[index]);
            }
        }



        /// <summary>  
        /// 填充对象列表：用DataTable填充实体类
        /// </summary>  
        public List<T> FillModel(DataTable dt) {
            if (dt == null || dt.Rows.Count == 0) {
                return new List<T>();
            }
            List<T> modelList = new List<T>();
            foreach (DataRow dr in dt.Rows) {
                //T model = (T)Activator.CreateInstance(typeof(T));  
                T model = new T();
                for (int i = 0; i < dr.Table.Columns.Count; i++) {
                    PropertyInfo propertyInfo = model.GetType().GetProperty(ToSplitFirstUpper(dr.Table.Columns[i].ColumnName));
                    if (propertyInfo != null && dr[i] != DBNull.Value)
                        propertyInfo.SetValue(model, dr[i], null);
                }

                modelList.Add(model);
            }
            return modelList;
        }

        /// <summary>  
        /// 填充对象：用DataRow填充实体类
        /// </summary>  
        public T FillModel(DataRow dr) {
            if (dr == null) {
                return default(T);
            }

            //T model = (T)Activator.CreateInstance(typeof(T));  
            T model = new T();

            for (int i = 0; i < dr.Table.Columns.Count; i++) {
                PropertyInfo propertyInfo = model.GetType().GetProperty(ToSplitFirstUpper(dr.Table.Columns[i].ColumnName));
                if (propertyInfo != null && dr[i] != DBNull.Value)
                    propertyInfo.SetValue(model, dr[i], null);
            }
            return model;
        }

        // 去下划线,转大写
        public static string ToSplitFirstUpper(string file) {
            string[] words = file.Split('_');
            StringBuilder firstUpperWorld = new StringBuilder();
            foreach (string word in words) {
                string firstUpper = ToFirstUpper(word);
                firstUpperWorld.Append(firstUpper);
            }
            string firstUpperFile = firstUpperWorld.ToString().TrimEnd(new char[] { '_' });
            return firstUpperFile;
        }

        // 将字符串设置成首字母大写
        public static string ToFirstUpper(string field) {
            string first = field.Substring(0, 1).ToUpperInvariant();
            string result = first;
            if (field.Length > 1) {
                string after = field.Substring(1);
                result = first + after;
            }
            return result;
        }
        #endregion

        #region 实体类转换成DataTable

        /// <summary>
        /// 实体类转换成DataSet
        /// </summary>
        /// <param name="modelList">实体类列表</param>
        /// <returns></returns>
        public DataSet FillDataSet(List<T> modelList) {
            if (modelList == null || modelList.Count == 0) {
                return null;
            } else {
                DataSet ds = new DataSet();
                ds.Tables.Add(FillDataTable(modelList));
                return ds;
            }
        }

        /// <summary>
        /// 实体类转换成DataTable
        /// </summary>
        /// <param name="modelList">实体类列表</param>
        /// <returns></returns>
        public DataTable FillDataTable(List<T> modelList) {
            if (modelList == null || modelList.Count == 0) {
                return null;
            }
            DataTable dt = CreateData(modelList[0]);

            foreach (T model in modelList) {
                DataRow dataRow = dt.NewRow();
                foreach (PropertyInfo propertyInfo in typeof(T).GetProperties()) {
                    dataRow[propertyInfo.Name] = propertyInfo.GetValue(model, null);
                }
                dt.Rows.Add(dataRow);
            }
            return dt;
        }

        /// <summary>
        /// 根据实体类得到表结构
        /// </summary>
        /// <param name="model">实体类</param>
        /// <returns></returns>
        private DataTable CreateData(T model) {
            DataTable dataTable = new DataTable(typeof(T).Name);
            foreach (PropertyInfo propertyInfo in typeof(T).GetProperties()) {
                dataTable.Columns.Add(new DataColumn(propertyInfo.Name, propertyInfo.PropertyType));
            }
            return dataTable;
        }

        #endregion
    }
}