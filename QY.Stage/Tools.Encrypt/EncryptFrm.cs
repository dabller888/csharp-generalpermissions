using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using Utils = QY.Stage.Frameworks.Utility;

namespace Tools.Encrypt {
    public partial class EncryptFrm : Form {
        public EncryptFrm() {
            InitializeComponent();
            this.tbAESSource.Text = "C#AES加密字符串";
            this.tbAESSecret.Text = "ae125efkk4454eeff444ferfkny6oxi8";
            //生成ID
            this.cbType.Text = "=请选择=";
            this.cbType.Items.Add("生成SessionId");
            this.cbType.Items.Add("生成付款码");

        }

        #region =============AES加密/解密=============
        private void btnAESEncrypt_Click(object sender, EventArgs e) {

            string src = this.tbAESSource.Text;
            string secret = this.tbAESSecret.Text;

            this.rtbAESResult.Text = AES.Encrypt(src, secret);

        }

        private void btnAESDecrypt_Click(object sender, EventArgs e) {
            string src = this.rtbAESResult.Text;
            string secret = this.tbAESSecret.Text;

            this.tbAESDeSourc.Text = AES.Decrypt(src, secret);
        }
        #endregion

        #region =============MD5加密/解密=============
        private void btnMD5Encrypt_Click(object sender, EventArgs e) {
            string src = this.tbMD5Src.Text;
            if (!string.IsNullOrEmpty(src)) {
                this.tbMD5Result.Text = Utils.Encrypt.MD5(src);
            }
        }

        private void btnMD5Decrypt_Click(object sender, EventArgs e) {

        }
        #endregion

        #region =============ID生成规则===============
        private void btnMarkID_Click(object sender, EventArgs e) {
            if (this.cbType.SelectedItem.ToString() == "生成SessionId") {
                this.GeneralSessionID();
            } else if (this.cbType.SelectedItem.ToString() == "生成付款码") {
                this.GeneralPayCode();
            } else { 
                
            }
        }
        private void GeneralSessionID() {
            Random _ran = new Random();
            var lng = (long)Marshal.AllocHGlobal(8);
            var _HostKey = lng.ToString("x");
            this.rtbGeneralID.Text = _HostKey + "_" + (DateTime.Now.Ticks / 1000).ToString("x") + "_" + _ran.Next(1000).ToString("x");

        }

        private void GeneralPayCode() {
            //(1)
            for (int i = 0; i < 1000; i++) {
                this.rtbGeneralID.Text += "开始执行 " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ffffff") + "    " + Snowflake.Instance().GetId() + "\n";
            }
        }

        #endregion
    }
}
