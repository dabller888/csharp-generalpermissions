namespace Tools.Encrypt {
    partial class EncryptFrm {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent() {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rtbAESResult = new System.Windows.Forms.RichTextBox();
            this.tbAESSecret = new System.Windows.Forms.TextBox();
            this.btnAESDecrypt = new System.Windows.Forms.Button();
            this.btnAESEncrypt = new System.Windows.Forms.Button();
            this.tbAESDeSourc = new System.Windows.Forms.TextBox();
            this.tbAESSource = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.tbMD5Result = new System.Windows.Forms.TextBox();
            this.btnMD5Decrypt = new System.Windows.Forms.Button();
            this.btnMD5Encrypt = new System.Windows.Forms.Button();
            this.tbMD5DeSrc = new System.Windows.Forms.TextBox();
            this.tbMD5Src = new System.Windows.Forms.TextBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.cbType = new System.Windows.Forms.ComboBox();
            this.btnMarkID = new System.Windows.Forms.Button();
            this.rtbGeneralID = new System.Windows.Forms.RichTextBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rtbAESResult);
            this.groupBox1.Controls.Add(this.tbAESSecret);
            this.groupBox1.Controls.Add(this.btnAESDecrypt);
            this.groupBox1.Controls.Add(this.btnAESEncrypt);
            this.groupBox1.Controls.Add(this.tbAESDeSourc);
            this.groupBox1.Controls.Add(this.tbAESSource);
            this.groupBox1.Location = new System.Drawing.Point(3, 3);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(322, 160);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "AES加密/解密";
            // 
            // rtbAESResult
            // 
            this.rtbAESResult.Location = new System.Drawing.Point(9, 98);
            this.rtbAESResult.Name = "rtbAESResult";
            this.rtbAESResult.Size = new System.Drawing.Size(306, 56);
            this.rtbAESResult.TabIndex = 5;
            this.rtbAESResult.Text = "";
            // 
            // tbAESSecret
            // 
            this.tbAESSecret.Location = new System.Drawing.Point(8, 72);
            this.tbAESSecret.Name = "tbAESSecret";
            this.tbAESSecret.Size = new System.Drawing.Size(307, 21);
            this.tbAESSecret.TabIndex = 4;
            // 
            // btnAESDecrypt
            // 
            this.btnAESDecrypt.Location = new System.Drawing.Point(244, 45);
            this.btnAESDecrypt.Name = "btnAESDecrypt";
            this.btnAESDecrypt.Size = new System.Drawing.Size(75, 23);
            this.btnAESDecrypt.TabIndex = 2;
            this.btnAESDecrypt.Text = "AES解密";
            this.btnAESDecrypt.UseVisualStyleBackColor = true;
            this.btnAESDecrypt.Click += new System.EventHandler(this.btnAESDecrypt_Click);
            // 
            // btnAESEncrypt
            // 
            this.btnAESEncrypt.Location = new System.Drawing.Point(244, 19);
            this.btnAESEncrypt.Name = "btnAESEncrypt";
            this.btnAESEncrypt.Size = new System.Drawing.Size(75, 23);
            this.btnAESEncrypt.TabIndex = 1;
            this.btnAESEncrypt.Text = "AES加密";
            this.btnAESEncrypt.UseVisualStyleBackColor = true;
            this.btnAESEncrypt.Click += new System.EventHandler(this.btnAESEncrypt_Click);
            // 
            // tbAESDeSourc
            // 
            this.tbAESDeSourc.Location = new System.Drawing.Point(7, 46);
            this.tbAESDeSourc.Name = "tbAESDeSourc";
            this.tbAESDeSourc.Size = new System.Drawing.Size(231, 21);
            this.tbAESDeSourc.TabIndex = 2;
            // 
            // tbAESSource
            // 
            this.tbAESSource.Location = new System.Drawing.Point(7, 19);
            this.tbAESSource.Name = "tbAESSource";
            this.tbAESSource.Size = new System.Drawing.Size(231, 21);
            this.tbAESSource.TabIndex = 0;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.tbMD5Result);
            this.groupBox2.Controls.Add(this.btnMD5Decrypt);
            this.groupBox2.Controls.Add(this.btnMD5Encrypt);
            this.groupBox2.Controls.Add(this.tbMD5DeSrc);
            this.groupBox2.Controls.Add(this.tbMD5Src);
            this.groupBox2.Location = new System.Drawing.Point(360, 3);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(322, 104);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "MD5加密";
            // 
            // tbMD5Result
            // 
            this.tbMD5Result.Location = new System.Drawing.Point(9, 44);
            this.tbMD5Result.Name = "tbMD5Result";
            this.tbMD5Result.Size = new System.Drawing.Size(307, 21);
            this.tbMD5Result.TabIndex = 3;
            // 
            // btnMD5Decrypt
            // 
            this.btnMD5Decrypt.Location = new System.Drawing.Point(244, 71);
            this.btnMD5Decrypt.Name = "btnMD5Decrypt";
            this.btnMD5Decrypt.Size = new System.Drawing.Size(75, 23);
            this.btnMD5Decrypt.TabIndex = 2;
            this.btnMD5Decrypt.Text = "btnMD5解密";
            this.btnMD5Decrypt.UseVisualStyleBackColor = true;
            this.btnMD5Decrypt.Click += new System.EventHandler(this.btnMD5Decrypt_Click);
            // 
            // btnMD5Encrypt
            // 
            this.btnMD5Encrypt.Location = new System.Drawing.Point(244, 19);
            this.btnMD5Encrypt.Name = "btnMD5Encrypt";
            this.btnMD5Encrypt.Size = new System.Drawing.Size(75, 23);
            this.btnMD5Encrypt.TabIndex = 1;
            this.btnMD5Encrypt.Text = "btnMD5加密";
            this.btnMD5Encrypt.UseVisualStyleBackColor = true;
            this.btnMD5Encrypt.Click += new System.EventHandler(this.btnMD5Encrypt_Click);
            // 
            // tbMD5DeSrc
            // 
            this.tbMD5DeSrc.Location = new System.Drawing.Point(7, 72);
            this.tbMD5DeSrc.Name = "tbMD5DeSrc";
            this.tbMD5DeSrc.Size = new System.Drawing.Size(231, 21);
            this.tbMD5DeSrc.TabIndex = 2;
            // 
            // tbMD5Src
            // 
            this.tbMD5Src.Location = new System.Drawing.Point(7, 19);
            this.tbMD5Src.Name = "tbMD5Src";
            this.tbMD5Src.Size = new System.Drawing.Size(231, 21);
            this.tbMD5Src.TabIndex = 0;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.rtbGeneralID);
            this.groupBox3.Controls.Add(this.cbType);
            this.groupBox3.Controls.Add(this.btnMarkID);
            this.groupBox3.Location = new System.Drawing.Point(7, 179);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(675, 232);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "ID生成规则";
            // 
            // cbType
            // 
            this.cbType.FormattingEnabled = true;
            this.cbType.Location = new System.Drawing.Point(7, 18);
            this.cbType.Name = "cbType";
            this.cbType.Size = new System.Drawing.Size(121, 20);
            this.cbType.TabIndex = 2;
            // 
            // btnMarkID
            // 
            this.btnMarkID.Location = new System.Drawing.Point(163, 16);
            this.btnMarkID.Name = "btnMarkID";
            this.btnMarkID.Size = new System.Drawing.Size(75, 23);
            this.btnMarkID.TabIndex = 1;
            this.btnMarkID.Text = "生成ID";
            this.btnMarkID.UseVisualStyleBackColor = true;
            this.btnMarkID.Click += new System.EventHandler(this.btnMarkID_Click);
            // 
            // rtbGeneralID
            // 
            this.rtbGeneralID.Location = new System.Drawing.Point(7, 42);
            this.rtbGeneralID.Name = "rtbGeneralID";
            this.rtbGeneralID.Size = new System.Drawing.Size(662, 184);
            this.rtbGeneralID.TabIndex = 3;
            this.rtbGeneralID.Text = "";
            // 
            // EncryptFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(694, 514);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "EncryptFrm";
            this.Text = "加解密";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnAESDecrypt;
        private System.Windows.Forms.Button btnAESEncrypt;
        private System.Windows.Forms.TextBox tbAESDeSourc;
        private System.Windows.Forms.TextBox tbAESSource;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox tbMD5Result;
        private System.Windows.Forms.Button btnMD5Decrypt;
        private System.Windows.Forms.Button btnMD5Encrypt;
        private System.Windows.Forms.TextBox tbMD5DeSrc;
        private System.Windows.Forms.TextBox tbMD5Src;
        private System.Windows.Forms.RichTextBox rtbAESResult;
        private System.Windows.Forms.TextBox tbAESSecret;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.ComboBox cbType;
        private System.Windows.Forms.Button btnMarkID;
        private System.Windows.Forms.RichTextBox rtbGeneralID;
    }
}

