using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Net;
using System.IO;
using System.Net.Security;
using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;

namespace QY.Stage.Frameworks.Utility {
    public class RequestG {
        ///// <summary>
        ///// 判断当前页面是否接收到了Post请求
        ///// </summary>
        ///// <returns>是否接收到了Post请求</returns>
        //public static bool IsPost()
        //{
        //    return HttpContext.Current.Request.HttpMethod.Equals("POST");
        //}

        ///// <summary>
        ///// 判断当前页面是否接收到了Get请求
        ///// </summary>
        ///// <returns>是否接收到了Get请求</returns>
        //public static bool IsGet()
        //{
        //    return HttpContext.Current.Request.HttpMethod.Equals("GET");
        //}
        /// <summary>
        /// 获得指定Url参数的值
        /// </summary>
        /// <param name="_queryKey">url参数</param>
        /// <param name="IsDecode">是否要解编码字符串</param>
        /// <param name="IsRemoveSpace">是否去空格</param>
        /// <returns>返回指定Url参数的值</returns>
        private object GetUrlData(string _queryKey, bool IsDecode, bool IsRemoveSpace) {
            object result = null;
            if (HttpContext.Current.Request.QueryString[_queryKey] != null) {
                result = HttpContext.Current.Request.QueryString[_queryKey];
                //是否要解编码字符串
                if (IsDecode) {
                    result = HttpContext.Current.Server.UrlDecode(result.ToString());
                }
                //是否要去空格
                if (IsRemoveSpace) {
                    result = result.ToString().Replace(" ", "");
                }
            }

            return result;
        }
        /// <summary>
        /// 获取指定Url参数的值（字符串类型）
        /// </summary>
        /// <param name="queryKey">url参数</param>
        /// <param name="Keyval">默认值</param>
        /// <param name="IsDecode">是否要解编码字符串</param>
        /// <param name="IsRemoveSpace">是否去空格</param>
        public void GetQuery(string queryKey, ref string Keyval, bool IsDecode, bool IsRemoveSpace) {
            //先返回数据
            object myvar = GetUrlData(queryKey, IsDecode, IsRemoveSpace);
            //再判断数据类型
            if (myvar != null) {
                Keyval = myvar.ToString();
            }
        }
        /// <summary>
        /// 获取指定Url参数的值（整型）
        /// </summary>
        /// <param name="queryKey">url参数</param>
        /// <param name="Keyval">默认值</param>
        /// <param name="IsDecode">是否要解编码字符串</param>
        /// <param name="IsRemoveSpace">是否去空格</param>
        public void GetQuery(string queryKey, ref int Keyval, bool IsDecode, bool IsRemoveSpace) {
            //先返回数据
            object myvar = GetUrlData(queryKey, IsDecode, IsRemoveSpace);
            //再判断数据类型
            if (myvar != null) {
                try {
                    Keyval = Convert.ToInt32(myvar.ToString());
                } catch (Exception) { }
            }
        }
        /// <summary>
        /// 获取指定Url参数的值（Long整型）
        /// </summary>
        /// <param name="queryKey">url参数</param>
        /// <param name="Keyval">默认值</param>
        /// <param name="IsDecode">是否要解编码字符串</param>
        /// <param name="IsRemoveSpace">是否去空格</param>
        public void GetQuery(string queryKey, ref long Keyval, bool IsDecode, bool IsRemoveSpace) {
            //先返回数据
            object myvar = GetUrlData(queryKey, IsDecode, IsRemoveSpace);
            //再判断数据类型
            if (myvar != null) {
                try {
                    Keyval = Convert.ToInt64(myvar.ToString());
                } catch (System.FormatException) { }
            }
        }
        /// <summary>
        /// 获取指定Url参数的值（float）
        /// </summary>
        /// <param name="queryKey">url参数</param>
        /// <param name="Keyval">默认值</param>
        /// <param name="IsDecode">是否要解编码字符串</param>
        /// <param name="IsRemoveSpace">是否去空格</param>
        public void GetQuery(string queryKey, ref float Keyval, bool IsDecode, bool IsRemoveSpace) {
            //先返回数据
            object myvar = GetUrlData(queryKey, IsDecode, IsRemoveSpace);
            //再判断数据类型
            if (myvar != null) {
                try {
                    Keyval = Convert.ToSingle(myvar.ToString());
                } catch (System.FormatException) { }
            }
        }
        /// <summary>
        /// 获取指定Url参数的值（double）
        /// </summary>
        /// <param name="queryKey">url参数</param>
        /// <param name="Keyval">默认值</param>
        /// <param name="IsDecode">是否要解编码字符串</param>
        /// <param name="IsRemoveSpace">是否去空格</param>
        public void GetQuery(string queryKey, ref double Keyval, bool IsDecode, bool IsRemoveSpace) {
            //先返回数据
            object myvar = GetUrlData(queryKey, IsDecode, IsRemoveSpace);
            //再判断数据类型
            if (myvar != null) {
                try {
                    Keyval = Convert.ToDouble(myvar.ToString());
                } catch (System.FormatException) { }
            }
        }
        /// <summary>
        /// 获取指定Url参数的值（datetime）
        /// </summary>
        /// <param name="queryKey">url参数</param>
        /// <param name="Keyval">默认值</param>
        /// <param name="IsDecode">是否要解编码字符串</param>
        /// <param name="IsRemoveSpace">是否去空格</param>
        public void GetQuery(string queryKey, ref DateTime Keyval, bool IsDecode, bool IsRemoveSpace) {
            //先返回数据
            object myvar = GetUrlData(queryKey, IsDecode, IsRemoveSpace);
            //再判断数据类型
            if (myvar != null) {
                try {
                    Keyval = Convert.ToDateTime(myvar.ToString());
                } catch (System.FormatException) { }
            }
        }
        /// <summary>
        /// 获取指定Url参数的值（布尔值）
        /// </summary>
        /// <param name="queryKey">url参数</param>
        /// <param name="Keyval">默认值</param>
        /// <param name="IsDecode">是否要解编码字符串</param>
        /// <param name="IsRemoveSpace">是否去空格</param>
        public void GetQuery(string queryKey, ref bool Keyval, bool IsDecode, bool IsRemoveSpace) {
            //先返回数据
            object myvar = GetUrlData(queryKey, IsDecode, IsRemoveSpace);
            //再判断数据类型
            if (myvar != null) {
                try {
                    Keyval = Convert.ToBoolean(int.Parse(myvar.ToString()));
                } catch (System.FormatException) { }
            }
        }
        /// <summary>
        /// 返回指定的服务器变量信息
        /// </summary>
        /// <param name="strName">服务器变量名</param>
        /// <returns>服务器变量信息</returns>
        public static string GetServerString(string strName) {
            if (HttpContext.Current.Request.ServerVariables[strName] == null)
                return "";

            return HttpContext.Current.Request.ServerVariables[strName].ToString();
        }

        /// <summary>
        /// 返回上一个页面的地址
        /// </summary>
        /// <returns>上一个页面的地址</returns>
        public static string GetUrlReferrer() {
            string retVal = null;

            try {
                retVal = HttpContext.Current.Request.UrlReferrer.ToString();
            } catch { }

            if (retVal == null)
                return "";

            return retVal;
        }

        /// <summary>
        /// 得到当前完整主机头
        /// </summary>
        /// <returns></returns>
        public static string GetCurrentFullHost() {
            HttpRequest request = System.Web.HttpContext.Current.Request;
            if (!request.Url.IsDefaultPort)
                return string.Format("{0}:{1}", request.Url.Host, request.Url.Port.ToString());

            return request.Url.Host;
        }

        ///// <summary>
        ///// 得到主机头
        ///// </summary>
        ///// <returns></returns>
        //public static string GetHost()
        //{
        //    return HttpContext.Current.Request.Url.Host;
        //}


        ///// <summary>
        ///// 获取当前请求的原始 URL(URL 中域信息之后的部分,包括查询字符串(如果存在))
        ///// </summary>
        ///// <returns>原始 URL</returns>
        //public static string GetRawUrl()
        //{
        //    return HttpContext.Current.Request.RawUrl;
        //}

        /// <summary>
        /// 判断当前访问是否来自浏览器软件
        /// </summary>
        /// <returns>当前访问是否来自浏览器软件</returns>
        public static bool IsBrowserGet() {
            string[] BrowserName = { "ie", "opera", "netscape", "mozilla", "konqueror", "firefox" };
            string curBrowser = HttpContext.Current.Request.Browser.Type.ToLower();
            for (int i = 0; i < BrowserName.Length; i++) {
                if (curBrowser.IndexOf(BrowserName[i]) >= 0)
                    return true;
            }
            return false;
        }

        /// <summary>
        /// 判断是否来自搜索引擎链接
        /// </summary>
        /// <returns>是否来自搜索引擎链接</returns>
        public static bool IsSearchEnginesGet() {
            if (HttpContext.Current.Request.UrlReferrer == null)
                return false;

            string[] SearchEngine = { "google", "yahoo", "msn", "baidu", "sogou", "sohu", "sina", "163", "lycos", "tom", "yisou", "iask", "soso", "gougou", "zhongsou" };
            string tmpReferrer = HttpContext.Current.Request.UrlReferrer.ToString().ToLower();
            for (int i = 0; i < SearchEngine.Length; i++) {
                if (tmpReferrer.IndexOf(SearchEngine[i]) >= 0)
                    return true;
            }
            return false;
        }

        ///// <summary>
        ///// 获得当前完整Url地址
        ///// </summary>
        ///// <returns>当前完整Url地址</returns>
        //public static string GetUrl()
        //{
        //    return HttpContext.Current.Request.Url.ToString();
        //}


        /// <summary>
        /// 获得指定Url参数的值
        /// </summary>
        /// <param name="strName">Url参数</param>
        /// <returns>Url参数的值</returns>
        public static string GetQueryString(string strName) {
            return GetQueryString(strName, false);
        }

        /// <summary>
        /// 获得指定Url参数的值
        /// </summary> 
        /// <param name="strName">Url参数</param>
        /// <param name="sqlSafeCheck">是否进行SQL安全检查</param>
        /// <returns>Url参数的值</returns>
        public static string GetQueryString(string strName, bool sqlSafeCheck) {
            if (HttpContext.Current.Request.QueryString[strName] == null) {
                if (HttpContext.Current.Request.Form[strName] == null) {
                    return "";
                } else {
                    if (sqlSafeCheck == true) {
                        return HttpContext.Current.Request.Form[strName].Trim().InputFilterSql();
                    } else {
                        return HttpContext.Current.Request.Form[strName].Trim();
                    }


                }

            } else {
                return HttpContext.Current.Request.QueryString[strName].Trim();
            }
            //if (sqlSafeCheck && !StringExte.IsSafeSqlString(HttpContext.Current.Request.QueryString[strName]))
            //    return "unsafe string";
        }

        ///// <summary>
        ///// 获得当前页面的名称
        ///// </summary>
        ///// <returns>当前页面的名称</returns>
        //public static string GetPageName()
        //{
        //    string[] urlArr = HttpContext.Current.Request.Url.AbsolutePath.Split('/');
        //    return urlArr[urlArr.Length - 1].ToLower();
        //}

        ///// <summary>
        ///// 返回表单或Url参数的总个数
        ///// </summary>
        ///// <returns></returns>
        //public static int GetParamCount()
        //{
        //    return HttpContext.Current.Request.Form.Count + HttpContext.Current.Request.QueryString.Count;
        //}


        /// <summary>
        /// 获得指定表单参数的值
        /// </summary>
        /// <param name="strName">表单参数</param>
        /// <returns>表单参数的值</returns>
        public static string GetFormString(string strName) {
            return GetFormString(strName, false);
        }

        /// <summary>
        /// 获得指定表单参数的值
        /// </summary>
        /// <param name="strName">表单参数</param>
        /// <param name="sqlSafeCheck">是否进行SQL安全检查</param>
        /// <returns>表单参数的值</returns>
        public static string GetFormString(string strName, bool sqlSafeCheck) {

            if (HttpContext.Current.Request.Form[strName] == null) {
                if (HttpContext.Current.Request.QueryString[strName] == null) {
                    return "";
                } else {
                    if (sqlSafeCheck == true) {
                        return HttpContext.Current.Request.QueryString[strName].Trim().InputFilterSql();
                    } else {
                        return HttpContext.Current.Request.QueryString[strName].Trim();
                    }

                }

            } else {
                if (sqlSafeCheck == true) {
                    return HttpContext.Current.Request.Form[strName].Trim().InputFilterSql();
                } else {
                    return HttpContext.Current.Request.Form[strName].Trim();
                }

            }
            //if (sqlSafeCheck && !Common.Validator.IsSafeSqlString(HttpContext.Current.Request.Form[strName]))
            //    return "unsafe string";


        }

        ///// <summary>
        ///// 获得Url或表单参数的值, 先判断Url参数是否为空字符串, 如为True则返回表单参数的值
        ///// </summary>
        ///// <param name="strName">参数</param>
        ///// <returns>Url或表单参数的值</returns>
        //public static string GetString(string strName)
        //{
        //    return GetString(strName, false);
        //}

        ///// <summary>
        ///// 获得Url或表单参数的值, 先判断Url参数是否为空字符串, 如为True则返回表单参数的值
        ///// </summary>
        ///// <param name="strName">参数</param>
        ///// <param name="sqlSafeCheck">是否进行SQL安全检查</param>
        ///// <returns>Url或表单参数的值</returns>
        //public static string GetString(string strName, bool sqlSafeCheck)
        //{
        //    if ("".Equals(GetQueryString(strName)))
        //        return GetFormString(strName, sqlSafeCheck);
        //    else
        //        return GetQueryString(strName, sqlSafeCheck);
        //}






        /// <summary>
        /// 获得当前页面客户端的IP
        /// </summary>
        /// <returns>当前页面客户端的IP</returns>
        public static string GetIP() {
            string result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            if (string.IsNullOrEmpty(result))
                result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (string.IsNullOrEmpty(result))
                result = HttpContext.Current.Request.UserHostAddress;

            if (string.IsNullOrEmpty(result) || !result.IsIP())
                return "127.0.0.1";

            return result;
        }

        /// <summary>
        /// 获取IP所属地
        /// </summary>
        /// <param name="ip">ip</param>
        /// <returns>返回</returns>
        public static string GetIPSource(string ip) {
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create("http://ip.cn/getip.php?action=queryip&ip_url=" + ip);
            request.Method = "GET";
            request.ContentType = "application/x-www-form-urlencoded";
            request.Timeout = 20000;
            WebResponse response = null;
            string rl;
            try {
                response = (HttpWebResponse)request.GetResponse();

                Stream resStream = response.GetResponseStream();
                StreamReader sr = new StreamReader(resStream, Encoding.Default);
                StringBuilder sb = new StringBuilder();
                while ((rl = sr.ReadLine()) != null) {
                    sb.Append(rl);
                }
                return sb.ToString().Substring(sb.ToString().IndexOf("来自：") + 3, sb.ToString().Length - sb.ToString().IndexOf("来自：") - 3);
            } finally {
                if (response != null)
                    response.Close();
            }
        }

        /// <summary>
        /// http POST请求url
        /// </summary>
        /// <param name="apiUrl"></param>
        /// <param name="method_name"></param>
        /// <param name="postData"></param>
        /// <returns></returns>
        private static string GetHttpWebResponse(string url, string postData) {
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = postData.Length;
            request.Timeout = 20000;

            HttpWebResponse response = null;

            try {
                StreamWriter swRequestWriter = new StreamWriter(request.GetRequestStream());
                swRequestWriter.Write(postData);
                if (swRequestWriter != null)
                    swRequestWriter.Close();

                response = (HttpWebResponse)request.GetResponse();
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8)) {
                    return reader.ReadToEnd();
                }
            } finally {
                if (response != null)
                    response.Close();
            }
        }

        /// <summary>
        /// http POST请求url
        /// </summary>
        /// <param name="url">post请求地址</param>
        /// <param name="postData">请求JSON参数</param>
        /// <returns>请求JSON数据</returns>
        public static string GetHttpJSONResponse(string url, string postData) {
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "POST";
            request.ContentType = "application/json";
            request.ContentLength = Encoding.UTF8.GetBytes(postData).Length;
            request.Timeout = 20000;

            HttpWebResponse response = null;

            try {
                StreamWriter swRequestWriter = new StreamWriter(request.GetRequestStream());
                swRequestWriter.Write(postData);
                if (swRequestWriter != null)
                    swRequestWriter.Close();

                response = (HttpWebResponse)request.GetResponse();
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8)) {
                    return reader.ReadToEnd();
                }
            } finally {
                if (response != null)
                    response.Close();
            }
        }

        #region 带SSL证书请求
        /// <summary>
        /// http POST请求url
        /// </summary>
        /// <param name="url">post请求地址</param>
        /// <param name="postData">请求JSON参数</param>
        /// <param name="httpMethod">"POST"或"GET"</param>
        /// <returns>请求JSON数据</returns>
        public static string GetHttpJSONResponse(string url, string httpMethod, string postData = null) {
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            if (url.StartsWith("https"))
                ServicePointManager.ServerCertificateValidationCallback = ValidateServerCertificate;
            request.Method = httpMethod;
            request.ContentType = "application/json";
            if (postData != null)
                request.ContentLength = postData.Length;
            request.Timeout = 20000;

            HttpWebResponse response = null;

            try {
                if (postData != null) {
                    StreamWriter swRequestWriter = new StreamWriter(request.GetRequestStream());
                    swRequestWriter.Write(postData);
                    if (swRequestWriter != null)
                        swRequestWriter.Close();
                }
                response = (HttpWebResponse)request.GetResponse();
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8)) {
                    return reader.ReadToEnd();
                }
            } finally {
                if (response != null)
                    response.Close();
            }
        }

        private static bool ValidateServerCertificate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) {
            return true;
        }
        #endregion

        /// <summary>
        /// 写cookie值
        /// </summary>
        /// <param name="strName">名称</param>
        /// <param name="strValue">值</param>
        public static void WriteCookie(string strName, string strValue) {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[strName];
            if (cookie == null) {
                cookie = new HttpCookie(strName);
            }
            cookie.Value = strValue;
            HttpContext.Current.Response.AppendCookie(cookie);
        }

        /// <summary>
        /// 写cookie值
        /// </summary>
        /// <param name="strName">名称</param>
        /// <param name="key">名称</param>
        /// <param name="strValue">值</param>
        public static void WriteCookie(string strName, string key, string strValue) {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[strName];
            if (cookie == null) {
                cookie = new HttpCookie(strName);
            }
            cookie[key] = strValue;
            HttpContext.Current.Response.AppendCookie(cookie);
        }

        /// <summary>
        /// 写cookie值
        /// </summary>
        /// <param name="strName">名称</param>
        /// <param name="strValue">值</param>
        /// <param name="expires">过期时间(天)</param>
        public static void WriteCookie(string strName, string strValue, int expires) {
            HttpCookie mCookie = new HttpCookie(strName);
            mCookie.Value = strValue;
            mCookie.Expires = DateTime.Now.AddDays(expires);
            //输出cookie
            HttpContext.Current.Response.Cookies.Add(mCookie);
        }

        /// <summary>
        /// 清除Cookie
        /// </summary>
        /// <param name="strName">名称</param>
        public static void ClearCookie(string strName) {
            if (HttpContext.Current.Request.Cookies[strName] != null) {
                HttpCookie aCookie = HttpContext.Current.Request.Cookies[strName];
                if (aCookie != null) {
                    aCookie.Expires = DateTime.Today.AddYears(-2);
                    HttpContext.Current.Response.Cookies.Add(aCookie);
                }
            }
        }

        /// <summary>
        /// 读cookie值
        /// </summary>
        /// <param name="strName">名称</param>
        /// <returns>cookie值</returns>
        public static string GetCookie(string strName) {
            if (HttpContext.Current.Request.Cookies != null && HttpContext.Current.Request.Cookies[strName] != null) {
                return HttpContext.Current.Request.Cookies[strName].Value;
            }

            return "";
        }

        /// <summary>
        /// 读cookie值
        /// </summary>
        /// <param name="strName">名称</param>
        /// <param name="key">名称</param>
        /// <returns>cookie值</returns>
        public static string GetCookie(string strName, string key) {
            if (HttpContext.Current.Request.Cookies != null && HttpContext.Current.Request.Cookies[strName] != null && HttpContext.Current.Request.Cookies[strName][key] != null) {
                return HttpContext.Current.Request.Cookies[strName][key];
            }

            return "";
        }

        /// <summary>
        /// 以指定的ContentType输出指定文件
        /// </summary>
        /// <param name="filepath">文件路径</param>
        /// <param name="filename">输出的文件名</param>
        /// <param name="filetype">将文件输出时设置的ContentType(就是HTTP MIME类型)</param>
        public static void ResponseFile(string filepath, string filename, string filetype) {
            Stream iStream = null;

            // 缓冲区为10k
            byte[] buffer = new Byte[10000];
            // 文件长度
            int length;
            // 需要读的数据长度
            long dataToRead;

            try {
                // 打开文件
                iStream = new FileStream(filepath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);

                // 需要读的数据长度
                dataToRead = iStream.Length;

                HttpContext.Current.Response.ContentType = filetype;
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + filename.Trim().UrlEncode().Replace("+", " "));

                while (dataToRead > 0) {
                    // 检查客户端是否还处于连接状态
                    if (HttpContext.Current.Response.IsClientConnected) {
                        length = iStream.Read(buffer, 0, 10000);
                        HttpContext.Current.Response.OutputStream.Write(buffer, 0, length);
                        HttpContext.Current.Response.Flush();
                        buffer = new Byte[10000];
                        dataToRead = dataToRead - length;
                    } else {
                        // 如果不再连接则跳出死循环
                        dataToRead = -1;
                    }
                }
            } catch (Exception ex) {
                HttpContext.Current.Response.Write("Error : " + ex.Message);
            } finally {
                if (iStream != null) {
                    // 关闭文件
                    iStream.Close();
                }
            }
            HttpContext.Current.Response.End();
        }

        ///// <summary>
        ///// 判断文件名是否为浏览器可以直接显示的图片文件名
        ///// </summary>
        ///// <param name="filename">文件名</param>
        ///// <returns>是否可以直接显示</returns>
        //public static bool IsImgFilename(string filename)
        //{
        //    filename = filename.Trim();
        //    if (filename.EndsWith(".") || filename.IndexOf(".") == -1)
        //        return false;

        //    string extname = filename.Substring(filename.LastIndexOf(".") + 1).ToLower();
        //    return (extname == "jpg" || extname == "jpeg" || extname == "png" || extname == "bmp" || extname == "gif");
        //}
    }
}
