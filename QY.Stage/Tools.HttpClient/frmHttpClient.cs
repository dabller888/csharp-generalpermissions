using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Tools.HttpClient {
    public partial class frmHttpClient : Form {
        public frmHttpClient() {
            InitializeComponent();
        }

        private void btnSend_Click(object sender, EventArgs e) {
            string url = this.tbUrl.Text;
            string method = this.cbType.Text;
            string postData = this.rtbParams.Text;
            string content = "";
            try {
                Http.HttpRequest http = new Http.HttpRequest();
                switch (method.ToLower()) { 
                    case "post":
                        content = http.Post(url, postData);
                        break;
                    case "get":
                        content = http.Get(url, postData);
                        break;
                }
                //json格式数据格式化
                this.rtbContent.Text = this.ConvertJsonthisString(content);
            } catch (Exception ex) {
                content = string.Format("错误提示：{0}", ex.Message);
                this.rtbContent.Text = content;
                return;
            }
        }

        private string ConvertJsonthisString(string str) {
            //格式化json字符串
            JsonSerializer serializer = new JsonSerializer();
            TextReader tr = new StringReader(str);
            JsonTextReader jtr = new JsonTextReader(tr);
            object obj = serializer.Deserialize(jtr);
            if (obj != null) {
                StringWriter textWriter = new StringWriter();
                JsonTextWriter jsonWriter = new JsonTextWriter(textWriter) {
                    Formatting = Formatting.Indented,
                    Indentation = 4,
                    IndentChar = ' '
                };
                serializer.Serialize(jsonWriter, obj);
                return textWriter.ToString();
            } else {
                return str;
            }
        }
    }
}
