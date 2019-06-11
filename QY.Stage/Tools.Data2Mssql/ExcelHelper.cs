using NPOI.HSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;

namespace Tools.Data2Mssql {
    /// <summary>
    /// Excel帮助类（NPOI）
    /// </summary>
    public class ExcelHelper {

        /// <summary>
        /// 读取Excel数据到DataTable
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static DataTable ImportExcelFile(string filePath) {
            HSSFWorkbook hssfworkbook;
            try {
                using (FileStream file = new FileStream(filePath, FileMode.Open, FileAccess.Read)) {
                    hssfworkbook = new HSSFWorkbook(file);
                }
            } catch (Exception e) {
                throw e;
            }

            NPOI.SS.UserModel.ISheet sheet = hssfworkbook.GetSheetAt(0);
            System.Collections.IEnumerator rows = sheet.GetRowEnumerator();
            DataTable dt = new DataTable();
            rows.MoveNext();
            HSSFRow row = (HSSFRow)rows.Current;
            for (int j = 0; j < (sheet.GetRow(0).LastCellNum); j++) {
                if (j >= 12) break;
                //dt.Columns.Add(Convert.ToChar(((int)'A') + j).ToString());
                //将第一列作为列表头
                dt.Columns.Add(row.GetCell(j).ToString());
            }
            while (rows.MoveNext()) {
                row = (HSSFRow)rows.Current;
                DataRow dr = dt.NewRow();
                for (int i = 0; i < row.LastCellNum; i++) {
                    if (i >= 12) break;
                    NPOI.SS.UserModel.ICell cell = row.GetCell(i);
                    if (cell == null) {
                        dr[i] = null;
                    } else {
                        dr[i] = cell.ToString();
                    }
                }
                dt.Rows.Add(dr);
            }
            return dt;
        }
    }
}
