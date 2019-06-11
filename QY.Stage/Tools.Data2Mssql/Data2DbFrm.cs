using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using NPOI.HSSF.UserModel;
using QY.Stage.Frameworks.Utility;
using System.Data.SqlClient;

namespace Tools.Data2Mssql {
    public partial class Form1 : Form {
        private string fName = string.Empty;
        private DataTable dt = new DataTable();
        private string msg = string.Empty;

        public Form1() {
            InitializeComponent();

            this.scrollTimer.Enabled = false;
            this.scrollTimer.Interval = 10000;
        }

        #region 打开excel并打入数据到mssql
        private void btnOpen_Click(object sender, EventArgs e) {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Multiselect = true;
            openFileDialog.InitialDirectory = System.IO.Directory.GetCurrentDirectory();
            openFileDialog.Filter = "文本文件|*.*|Excel文件|*.xls|所有文件|*.*";
            openFileDialog.RestoreDirectory = true;
            openFileDialog.FilterIndex = 1;
            if (openFileDialog.ShowDialog() == DialogResult.OK) {
                this.progressBar1.Value = 0;
                this.progressBar1.Minimum = 0;
                this.progressBar1.Maximum = openFileDialog.FileNames.Length;

                btnOpen.Enabled = false;
                string[] fileNames = openFileDialog.FileNames;
                if (fileNames.Length > 0) {
                    for (int i = 0; i <fileNames.Length; i++) {
                        fName = fileNames.GetValue(i).ToString();
                        //fName = openFileDialog.FileName;
                        dt = ImportExcelFile(fName);
                        msg += "总记录数：" + dt.Rows.Count.ToString() + "\r\n";
                        //开始导入DT到DB
                        string[] _area = (fName.Substring(fName.LastIndexOf("\\") + 1, fName.Length - fName.LastIndexOf("\\") - 1)).Split(new char[] { '-' });
                        StartDt2Mssql(_area[0]);
                        msg += "========================================================================\r\n";
                        msg += "导入：" + fName.Substring(fName.LastIndexOf("\\")+1, fName.Length - fName.LastIndexOf("\\")-1) + "完毕！\r\n";
                        msg += "========================================================================\r\n\r\n";
                        richTextBox1.Text = msg;
                        richTextBox1.AppendText("");

                        this.progressBar1.Value = i+1;
                    }
                }
                btnOpen.Enabled = true;
            }
        }

        private void StartDt2Mssql(string AreaName) {
            string sql = @" Insert into Elder (SerialNo,ElderName,CardNo,Sex,Age,Addr,Post,Phone,Content,QRCode,FirstName,FirstSex,FirstAddr,FirstPost,FirstPhone,FirstRelation,SecName,SecSex,SecAddr,SecPost,SecPhone,SecRelation,CreateTime,DataFlag,IsEnable,IsDelete)
values (
    NULL,
    @ElderName,
    @CardNo,
    @Sex,
    @Age,
    @Addr,
    NULL,
    @Phone,
    @Content,
    NULL,
    @FirstName,
    0,
    @FirstAddr,
    NULL,
    @FirstPhone,
    4,
    @SecName,
    0,
    @SecAddr,
    @SecPost,
    @SecPhone,
    4,
    @CreateTime,
    0,
    1,
    0
);";
            SqlParameter[] parameters = new SqlParameter[15];
            int s = 0, e = 0;
            string sn = "";
            foreach (DataRow dr in dt.Rows) {
                if (dr["姓名"].ToString().StrIsNullOrEmpty() 
                    && dr["监护人1姓名"].ToString().StrIsNullOrEmpty()) {
                    continue;
                }
                parameters[0] = new SqlParameter("@ElderName", SqlDbType.VarChar, 64);
                parameters[0].Value = dr["姓名"];
                parameters[1] = new SqlParameter("@CardNo", SqlDbType.VarChar, 18);
                parameters[1].Value = dr["身份证号"];
                parameters[2] = new SqlParameter("@Sex", SqlDbType.Int, 4);
                parameters[2].Value = GetSexByCardNo(dr["身份证号"].ToString());
                parameters[3] = new SqlParameter("@Age", SqlDbType.Int, 4);
                parameters[3].Value = GetAgeByCardNo(dr["身份证号"].ToString());
                parameters[4] = new SqlParameter("@Addr", SqlDbType.VarChar, 1024);
                parameters[4].Value = dr["家庭住址"];
                parameters[5] = new SqlParameter("@Phone", SqlDbType.VarChar, 11);
                parameters[5].Value = FilterPhone(dr["联系电话（手机）"].ToString());
                parameters[6] = new SqlParameter("@Content", SqlDbType.VarChar);
                parameters[6].Value = dr["备注（其他事项备注）"];
                parameters[7] = new SqlParameter("@FirstName", SqlDbType.VarChar, 64);
                parameters[7].Value = dr["监护人1姓名"];
                parameters[8] = new SqlParameter("@FirstAddr", SqlDbType.VarChar, 1024);
                parameters[8].Value = dr["监护人1住址"];
                parameters[9] = new SqlParameter("@FirstPhone", SqlDbType.VarChar, 11);
                parameters[9].Value = FilterPhone(dr["监护人1电话（手机）"].ToString());
                parameters[10] = new SqlParameter("@SecName", SqlDbType.VarChar, 64);
                parameters[10].Value = dr["监护人2姓名"];
                parameters[11] = new SqlParameter("@SecAddr", SqlDbType.VarChar, 1024);
                parameters[11].Value = dr["监护人2住址"];
                parameters[12] = new SqlParameter("@SecPost", SqlDbType.VarChar, 6);
                parameters[12].Value = AreaName;
                parameters[13] = new SqlParameter("@SecPhone", SqlDbType.VarChar, 11);
                parameters[13].Value = FilterPhone(dr["监护人2电话（手机）"].ToString());
                parameters[14] = new SqlParameter("@CreateTime", SqlDbType.DateTime, 16);
                parameters[14].Value = DateTime.Now;
                try {
                    MssqlHelper.ExecuteNoneQuery(sql, parameters);
                    s++;
                } catch (SqlException ex) {
                    msg = ex.Message;
                } catch (Exception ex) {
                    sn += dr["序号"] + ",";
                    e++;
                }
            }
            msg += "成功插入：" + s.ToString() + "条\r\n";
            msg += "失败：" + e.ToString() + "条\r\n";
            msg += ">>" + sn + "\r\n"; ;
        }

        private string FilterPhone(string phone) {
            if (!phone.StrIsNullOrEmpty()) {
                phone = phone.Replace("(", "");
                phone = phone.Replace(")", "");
                phone = phone.Replace("-", "");
                phone = phone.Replace("_", "");
                phone = phone.Replace("—", "");
                phone = phone.Replace("－", "");
                phone = phone.Replace("（", "");
                phone = phone.Replace("）", "");
            }
            return phone;
        }

        private int GetAgeByCardNo(string CardNo) {
            string birthday = string.Empty;
            int age = 0;
            try {
                if (RegExp.IsIdentityCard(CardNo)) {
                    if (CardNo.Length == 15) {
                        birthday = "19" + CardNo.Substring(6, 2) + "-" + CardNo.Substring(8, 2) + "-" + CardNo.Substring(10, 2);
                    }
                    if (CardNo.Length == 18) {
                        birthday = CardNo.Substring(6, 4) + "-" + CardNo.Substring(10, 2) + "-" + CardNo.Substring(12, 2);
                    }
                    TimeSpan ts = DateTime.Now.Subtract(Convert.ToDateTime(birthday));
                    age = ts.Days / 365;
                }
            } catch (Exception ex) {
                return 0;
            }
            return age;
        }

        private int GetSexByCardNo(string CardNo) {
            string sex = "0";
            try {
                if (RegExp.IsIdentityCard(CardNo)) {
                    if (CardNo.Length == 15) {
                        sex = CardNo.Substring(14, 3);
                    }
                    if (CardNo.Length == 18) {
                        sex = CardNo.Substring(12, 3);
                    }
                }
            } catch (Exception ex) {
                //throw ex;
                return 2;
            }
            //偶数为女，奇数为男
            if (int.Parse(sex) % 2 == 0)
                return 1;
            else
                return 0;
        }
        #endregion

        #region NPOI
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
        #endregion

        private void scrollTimer_Tick(object sender, EventArgs e) {
            //if (!this.richTextBox1.Text.StrIsNullOrEmpty()) {
            //    this.richTextBox1.Text = this.richTextBox1.Text.Substring(1) + this.richTextBox1.Text[0];       
            //}
        }

        #region 多线程批次导入目录下所有文件（同步）

        #endregion
    }
}
