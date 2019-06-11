using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Tools.Data2Mssql {
    public class Excel2Json {

        public static string ToStrJson() {
            string path = System.Environment.CurrentDirectory;
            string file = string.Format("{0}\\gps-1.xls", path);
            DataTable dt = ExcelHelper.ImportExcelFile(file);
            //获取列名
            string[] columns = null;
            if (dt.Columns.Count > 0) {
                int colCount = dt.Columns.Count;
                columns = new string[colCount];
                for (int j = 0; j < colCount; j++) {
                    columns[j] = dt.Columns[j].ColumnName;
                }
            }

            //获取行数据
            StringBuilder sb = new StringBuilder();
            string str = string.Empty;
            if (dt.Rows.Count > 0) {
                sb.Append("[");
                for (int i = 0; i < dt.Rows.Count; i++) {
                    str = "";
                    sb.Append("{");
                    for (int m = 0; m < columns.Length; m++) {
                        str += string.Format("{0}:{1},", columns[m], dt.Rows[i][columns[m]]);
                    }
                    if (str.LastIndexOf(",") > 0) str = str.TrimEnd(new char[] { ',' });
                    sb.Append(str);
                    sb.Append("},");
                }
                if (sb.ToString().LastIndexOf(",") > 0) sb.Remove(sb.ToString().LastIndexOf(","), 1);
                sb.Append("]");
            }

            return sb.ToString();
        }
    }
}
