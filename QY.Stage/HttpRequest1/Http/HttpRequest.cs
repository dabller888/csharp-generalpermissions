using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;

namespace HttpRequest.Http {
    public class HttpRequest : IUrlRequest {
        public string Request(string url, string data,string type) {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = type;
            byte[] buf = System.Text.Encoding.GetEncoding("UTF-8").GetBytes(data);
            request.ContentLength = buf.Length;
            request.Timeout = 60000;
            string result = "";
            try {
                if (data != null) {
                    Stream wr = request.GetRequestStream();
                    wr.Write(buf, 0, buf.Length);
                    if (wr != null) wr.Close();
                }
            } catch (Exception) {

                throw;
            }

            try {
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                StreamReader rl = new StreamReader(response.GetResponseStream());
                result = rl.ReadToEnd();
                if (rl != null) rl.Close();
            } catch (Exception) {

                throw;
            }
            return result;
        }
    }
}
