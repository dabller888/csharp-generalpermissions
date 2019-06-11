namespace Tools.HttpClient {
    partial class frmHttpClient {
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
            this.btnSend = new System.Windows.Forms.Button();
            this.cbType = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.rtbContent = new System.Windows.Forms.RichTextBox();
            this.rtbParams = new System.Windows.Forms.RichTextBox();
            this.tbUrl = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnSend
            // 
            this.btnSend.Location = new System.Drawing.Point(454, 4);
            this.btnSend.Name = "btnSend";
            this.btnSend.Size = new System.Drawing.Size(75, 23);
            this.btnSend.TabIndex = 0;
            this.btnSend.Text = "发送请求";
            this.btnSend.UseVisualStyleBackColor = true;
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
            // 
            // cbType
            // 
            this.cbType.FormattingEnabled = true;
            this.cbType.Items.AddRange(new object[] {
            "POST",
            "GET",
            "PUT"});
            this.cbType.Location = new System.Drawing.Point(385, 6);
            this.cbType.Name = "cbType";
            this.cbType.Size = new System.Drawing.Size(63, 20);
            this.cbType.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 12);
            this.label1.TabIndex = 2;
            this.label1.Text = "地址：";
            // 
            // rtbContent
            // 
            this.rtbContent.Location = new System.Drawing.Point(12, 36);
            this.rtbContent.Name = "rtbContent";
            this.rtbContent.Size = new System.Drawing.Size(509, 307);
            this.rtbContent.TabIndex = 3;
            this.rtbContent.Text = "";
            // 
            // rtbParams
            // 
            this.rtbParams.Location = new System.Drawing.Point(12, 362);
            this.rtbParams.Name = "rtbParams";
            this.rtbParams.Size = new System.Drawing.Size(517, 96);
            this.rtbParams.TabIndex = 4;
            this.rtbParams.Text = "";
            // 
            // tbUrl
            // 
            this.tbUrl.Location = new System.Drawing.Point(86, 9);
            this.tbUrl.Name = "tbUrl";
            this.tbUrl.Size = new System.Drawing.Size(276, 21);
            this.tbUrl.TabIndex = 5;
            // 
            // frmHttpClient
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(533, 470);
            this.Controls.Add(this.tbUrl);
            this.Controls.Add(this.rtbParams);
            this.Controls.Add(this.rtbContent);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cbType);
            this.Controls.Add(this.btnSend);
            this.Name = "frmHttpClient";
            this.Text = "HTTP客户端测试工具";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnSend;
        private System.Windows.Forms.ComboBox cbType;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.RichTextBox rtbContent;
        private System.Windows.Forms.RichTextBox rtbParams;
        private System.Windows.Forms.TextBox tbUrl;
    }
}

