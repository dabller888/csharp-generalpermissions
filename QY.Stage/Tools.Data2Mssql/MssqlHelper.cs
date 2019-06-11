using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Configuration;

namespace Tools.Data2Mssql {
    public class MssqlHelper {
        //private static readonly string constr = @"server=(local);database=hggydb;uid=sa;password=sa123456";

        private static readonly string constr = ConfigurationManager.ConnectionStrings["SqlConnString"].ConnectionString;

        /// <summary>
        ///执行增删改
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="pms"></param>
        /// <returns></returns>
        public static int ExecuteNoneQuery(string sql, params SqlParameter[] pms) {
            using (SqlConnection con = new SqlConnection(constr)) {
                using (SqlCommand cmd = new SqlCommand(sql, con)) {
                    if (pms != null) {
                        cmd.Parameters.AddRange(pms);
                    }
                    con.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }
        /// <summary>
        /// 如果SqlParameter为空则转换为DBNull
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        static public object SqlNull(object obj) {
            if (obj == null) {
                return DBNull.Value;
            }
            return obj;
        }
        /// <summary>
        /// 如果是DBNULL则转换成null
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        static public object DBNullToNull(object obj) {
            if (obj == DBNull.Value) {
                return null;
            }
            return obj;
        }

        /// <summary>
        /// 返回datatable
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="pms"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string sql, params SqlParameter[] pms) {
            DataTable dt = new DataTable();
            using (SqlDataAdapter adapter = new SqlDataAdapter(sql, constr)) {
                if (pms != null) {
                    adapter.SelectCommand.Parameters.AddRange(pms);
                }
                adapter.Fill(dt);
            }
            return dt;
        }
        /// <summary>
        /// 返回单个值
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="pms"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string sql, params SqlParameter[] pms) {
            using (SqlConnection con = new SqlConnection(constr)) {
                using (SqlCommand cmd = new SqlCommand(sql, con)) {
                    if (pms != null) {
                        cmd.Parameters.AddRange(pms);
                    }
                    con.Open();
                    return cmd.ExecuteScalar();
                }
            }
        }

    }
}
