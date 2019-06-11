using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Text.RegularExpressions;
using System.Net;
using System.IO;
using System.Drawing;
using Microsoft.VisualBasic;
using System.Security.Cryptography;

namespace QY.Stage.Frameworks.Utility {
    /// <summary>
    /// String类型的扩展方法类
    /// </summary>
    public static class StringExte {
        /// <summary>
        /// 判断对象是否为Int32类型的数字的字符器
        /// </summary>
        /// <param name="s">传入的字符串</param>
        /// <returns>返回 true 表示为Int32类型的字符器，false 表示不是</returns>
        public static bool IsNumeric(this string s) {
            if (s != null) {
                if (s.Length > 0 && s.Length <= 11 && Regex.IsMatch(s, @"^[-]?[0-9]*[.]?[0-9]*$")) {
                    if ((s.Length < 10) || (s.Length == 10 && s[0] == '1') || (s.Length == 11 && s[0] == '-' && s[1] == '1')) {
                        return true;
                    }
                }
            }
            return false;

        }

        /// <summary>
        /// 判断当前字符串是否为Double类型的字符器
        /// </summary>
        /// <param name="s">传入的字符串</param>
        /// <returns>返回true表示是Double类型的字符器</returns>
        public static bool IsDouble(this string s) {
            if (s != null) {
                return Regex.IsMatch(s, @"^([0-9])[0-9]*(\.\w*)?$");
            }
            return false;
        }

        /// <summary>
        /// string型转换为bool型
        /// </summary>
        ///<param name="s">传入的字符串</param>
        /// <param name="defValue">缺省值，如果需要转换对象为 null 类型或是不能转换的则返回缺省值</param>
        /// <returns>转换后的bool类型结果</returns>
        public static bool ToBoolean(this string s, bool defValue) {
            if (s != null) {
                if (string.Compare(s.ToUpper(), "TRUE", true) == 0) {
                    return true;
                } else if (string.Compare(s.ToUpper(), "FALSE", true) == 0) {
                    return false;
                }
            }
            return defValue;
        }

        /// <summary>
        /// 将对象转换为Int32类型
        /// </summary>
        /// <param name="defValue">缺省值，如果需要转换对象为 null 类型或是不能转换的则返回缺省值</param>
        /// <param name="s">传入的字符串</param>
        /// <returns>转换后的Int32类型结果</returns>
        public static Int32 ToInt32(this string s, int defValue) {

            if (s != null) {
                if (s.Length > 0 && s.Length <= 11 && Regex.IsMatch(s, @"^[-]?[0-9]*$")) {
                    if ((s.Length < 10) || (s.Length == 10 && s[0] == '1') || (s.Length == 11 && s[0] == '-' && s[1] == '1')) {
                        return Convert.ToInt32(s);
                    }
                }
            }
            return defValue;
        }

        /// <summary>
        /// 将对象转换为Int16类型
        /// </summary>
        /// <param name="defValue">缺省值，如果需要转换对象为 null 类型或是不能转换的则返回缺省值</param>
        /// <param name="s">传入的字符串</param>
        /// <returns>转换后的Int16类型结果</returns>
        public static Int16 ToInt16(this string s, Int16 defValue) {

            if (s != null) {
                if (s.Length > 0 && s.Length <= 11 && Regex.IsMatch(s, @"^[-]?[0-9]*$")) {
                    if ((s.Length < 10) || (s.Length == 10 && s[0] == '1') || (s.Length == 11 && s[0] == '-' && s[1] == '1')) {
                        return Convert.ToInt16(s);
                    }
                }
            }
            return defValue;
        }

        /// <summary>
        /// string型转换为float型
        /// </summary>
        /// <param name="strValue">要转换的字符串</param>
        /// <param name="defValue">缺省值，如果需要转换对象为 null 类型或是不能转换的则返回缺省值</param>
        /// <returns>转换后的float类型结果</returns>
        public static float ToFloat(this string strValue, float defValue) {
            if ((strValue == null) || (strValue.Length > 10))
                return defValue;

            float floValue = defValue;
            if (strValue != null) {
                bool IsFloat = Regex.IsMatch(strValue, @"^([-]|[0-9])[0-9]*(\.\w*)?$");
                if (IsFloat)
                    float.TryParse(strValue, out floValue);
            }
            return floValue;
        }

        /// <summary>
        /// string型转换为Single型
        /// </summary>
        /// <param name="s">传入的字符串</param>
        /// <param name="defValue">缺省值，如果需要转换对象为 null 类型或是不能转换的则返回缺省值</param>
        /// <returns>转换后的Single类型结果</returns>
        public static Single ToSingle(this string s, Single defValue) {
            if ((s == null) || (s.Length > 10)) {
                return defValue;
            }

            Single value = defValue;
            {
                bool isFloat = Regex.IsMatch(s, @"^([-]|[0-9])[0-9]*(\.\w*)?$");
                if (isFloat) {
                    value = Convert.ToSingle(s);
                }
            }
            return value;
        }

        /// <summary>
        /// string型转换为decimal型
        /// </summary>
        /// <param name="s">传入的字符串</param>
        /// <param name="defValue">缺省值，如果需要转换对象为 null 类型或是不能转换的则返回缺省值</param>
        /// <returns>转换后的decimal类型结果</returns>
        public static decimal ToDecimal(this string s, decimal defValue) {
            if ((s == null)) {
                return defValue;
            }

            decimal value = defValue;

            if (s != null) {
                bool isDecimal = Regex.IsMatch(s, @"^([-]|[0-9])[0-9]*(\.\w*)?$");
                if (isDecimal) {
                    value = Convert.ToDecimal(s);
                }
            }
            return value;
        }


        /// <summary>
        /// string型转换为DateTime类型
        /// </summary>
        /// <param name="s">传入的字符串</param>
        /// <param name="defValue">缺省值，如果需要转换对象为 null 类型或是不能转换的则返回缺省值</param>
        /// <returns>转换后的DateTime类型结果</returns>
        public static DateTime _ToDateTime(this string s, DateTime defValue) {
            if (s == null) {
                return defValue;
            } else {
                try {
                    return Convert.ToDateTime(s);
                } catch {
                    return defValue;
                }
            }
        }

        /// <summary>
        /// string型转换为DateTime类型，如果不能转换则返回 null 
        /// </summary>
        /// <param name="s">传入的字符串</param>
        /// <returns>转换后的DateTime类型结果</returns>
        public static DateTime? _ToDateTime(this string s) {
            if (string.IsNullOrEmpty(s)) {
                return null;
            } else {
                try {
                    return Convert.ToDateTime(s);
                } catch {
                    return null;
                }
            }
        }

        /// <summary>       
        /// 将字符串内容转化为16进制数据编码，其逆过程是Decode 
        /// </summary>         
        /// <param name="strEncode">需要转化的原始字符串        
        /// 转换的过程是直接把字符转换成Unicode字符,比如数字"3"-->0033,汉字"我"-->U+6211         
        /// 函数decode的过程是encode的逆过程.</param>
        /// <returns>返回转化后的结果</returns>         
        public static string EncodeToHex16(this string strEncode) {
            string strReturn = "";//  存储转换后的编码             
            foreach (short shortx in strEncode.ToCharArray()) {
                strReturn += shortx.ToString("X4");
            }
            return strReturn;
        }

        /// <summary>             
        /// 将16进制数据编码转化为字符串，是EncodeToHex16的逆过程         
        /// </summary>         
        /// <param name="strDecode">需要转化的原始字符串</param>         
        /// <returns>返回转化后的结果</returns>         
        public static string Hex16Decode(this string strDecode) {
            string sResult = "";
            for (int i = 0; i < strDecode.Length / 4; i++) {
                sResult += (char)short.Parse(strDecode.Substring(i * 4, 4), global::System.Globalization.NumberStyles.HexNumber);
            }
            return sResult;
        }


        /// <summary>
        /// 返回字符串字符长度, 1个汉字长度为2个长度，英文为1个长度
        /// </summary>
        /// <returns>字符长度</returns>
        public static int GetStringLength(this string str) {
            return Encoding.Default.GetBytes(str).Length;
        }

        /// <summary>
        /// 判断是否为ip
        /// </summary>
        /// <param name="ip">需要判断的字符串</param>
        /// <returns>返回true表示是IP</returns>
        public static bool IsIP(this string ip) {
            return Regex.IsMatch(ip, @"^((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)$");

        }


        /// <summary>
        /// 检测是否符合email格式
        /// </summary>
        /// <param name="strEmail">要判断的email字符串</param>
        /// <returns>true 表示是,false表示不是</returns>
        public static bool IsEmail(this string strEmail) {
            return Regex.IsMatch(strEmail, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }

        /// <summary>
        /// 检测是否是正确的Url
        /// </summary>
        /// <param name="strUrl">要验证的Url</param>
        /// <returns>true 表示是,false表示不是</returns>
        public static bool IsURL(this string strUrl) {
            return Regex.IsMatch(strUrl, @"^(http|https)\://([a-zA-Z0-9\.\-]+(\:[a-zA-Z0-9\.&%\$\-]+)*@)*((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|localhost|([a-zA-Z0-9\-]+\.)*[a-zA-Z0-9\-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{1,10}))(\:[0-9]+)*(/($|[a-zA-Z0-9\.\,\?\'\\\+&%\$#\=~_\-]+))*$");
        }

        /// <summary>
        /// 判断是否为base64字符串
        /// </summary>
        /// <param name="str">需要判断的字符串</param>
        /// <returns>true 表示是,false表示不是</returns>
        public static bool IsBase64String(this string str) {
            //A-Z, a-z, 0-9, +, /, =
            return Regex.IsMatch(str, @"[A-Za-z0-9\+\/\=]");
        }

        /// <summary>
        /// 移除掉字符串第一个指定类型字符，（比如，）如果第一个字符与指定字符不同则返回原字符串，如果为null则返回""字符串
        /// </summary>
        /// <param name="strInput">输入字符null时返回""</param>
        /// <param name="str">要截取的指定字符串</param>
        /// <returns>返回截取后的字符串</returns>
        public static string CutFirstChar(this string strInput, string str) {
            if (!string.IsNullOrEmpty(strInput)) {
                while (strInput.StartsWith(str)) {
                    strInput = strInput.Remove(0, 1);
                }
                return strInput;
            }
            return "";
        }

        /// <summary>
        /// 移除掉字符串最后一个指定类型字符，（比如，）如果最后一个字符与指定字符不同则返回原字符串，如果为null则返回""字符串
        /// </summary>
        /// <param name="strInput">输入字符，null时返回""</param>
        /// <param name="str">要截取的字符串</param>
        /// <returns>返回截取后的字符串</returns>
        public static string CutLastChar(this string strInput, string str) {
            if (!string.IsNullOrEmpty(strInput)) {
                while (strInput.EndsWith(str)) {
                    strInput = strInput.Remove(strInput.Length - 1, 1);
                }
                return strInput;
            }
            return "";
        }

        /// <summary>
        /// 根据指定的长度截取字符串，大于指定长度的部分用...替换
        /// </summary>
        /// <param name="strInput">字符串</param>
        /// <param name="len">长度</param>
        /// <returns>返回截取后的字符串</returns>
        public static string ToCut(this string strInput, int len) {
            if (!string.IsNullOrEmpty(strInput)) {
                strInput = strInput.Trim();
                int byteLen = Encoding.GetEncoding("gb2312").GetByteCount(strInput);
                if (byteLen > len) {
                    string resultStr = "";
                    for (int i = 0; i < strInput.Length; i++) {
                        if (Encoding.GetEncoding("gb2312").GetByteCount(resultStr) < len - 2) {
                            resultStr += strInput.Substring(i, 1);
                        } else {
                            break;
                        }
                    }
                    return resultStr + "...";
                } else {
                    return strInput;
                }
            }
            return "";
        }

        /// <summary>
        /// 截取字符串从指定位置开始，截取后的字符串超过指定长度的部分用，指定参数替换
        /// </summary>
        /// <param name="p_SrcString">要截取的原始字符串</param>
        /// <param name="p_StartIndex">要截取的起始位置</param>
        /// <param name="p_Length">指定长度，超过后的部分用 p_TailString替换</param>
        /// <param name="p_TailString">用于替换的字符串</param>
        /// <returns>返回截取拼接后的字符串</returns>
        public static string ToCut(this string p_SrcString, int p_StartIndex, int p_Length, string p_TailString) {
            string myResult = p_SrcString;

            if (p_Length >= 0) {
                byte[] bsSrcString = Encoding.Default.GetBytes(p_SrcString);

                //当字符串长度大于起始位置
                if (bsSrcString.Length > p_StartIndex) {
                    int p_EndIndex = bsSrcString.Length;

                    //当要截取的长度在字符串的有效长度范围内
                    if (bsSrcString.Length > (p_StartIndex + p_Length)) {
                        p_EndIndex = p_Length + p_StartIndex;
                    } else {   //当不在有效范围内时,只取到字符串的结尾

                        p_Length = bsSrcString.Length - p_StartIndex;
                        p_TailString = "";
                    }



                    int nRealLength = p_Length;
                    int[] anResultFlag = new int[p_Length];
                    byte[] bsResult = null;

                    int nFlag = 0;
                    for (int i = p_StartIndex; i < p_EndIndex; i++) {

                        if (bsSrcString[i] > 127) {
                            nFlag++;
                            if (nFlag == 3) {
                                nFlag = 1;
                            }
                        } else {
                            nFlag = 0;
                        }

                        anResultFlag[i] = nFlag;
                    }

                    if ((bsSrcString[p_EndIndex - 1] > 127) && (anResultFlag[p_Length - 1] == 1)) {
                        nRealLength = p_Length + 1;
                    }

                    bsResult = new byte[nRealLength];

                    Array.Copy(bsSrcString, p_StartIndex, bsResult, 0, nRealLength);

                    myResult = Encoding.Default.GetString(bsResult);

                    myResult = myResult + p_TailString;
                }
            }

            return myResult;
        }

        /// <summary>
        /// 字符串如果超过指定长度则将超出的部分用指定字符串代替
        /// </summary>
        /// <param name="p_SrcString">原始字符串</param>
        /// <param name="p_Length">指定长度</param>
        /// <param name="p_TailString">用于替换的字符串</param>
        /// <returns>截取后的字符串</returns>
        public static string ToCut(this string p_SrcString, int p_Length, string p_TailString) {
            return ToCut(p_SrcString, 0, p_Length, p_TailString);
        }


        /// <summary>
        /// 返回 HTML 字符串的编码结果
        /// </summary>
        /// <param name="str">字符串</param>
        /// <returns>编码结果</returns>
        public static string HtmlEncode(this string str) {
            return HttpUtility.HtmlEncode(str);
        }

        /// <summary>
        /// 返回 HTML 字符串的解码结果
        /// </summary>
        /// <param name="str">字符串</param>
        /// <returns>解码结果</returns>
        public static string HtmlDecode(this string str) {
            return HttpUtility.HtmlDecode(str);
        }

        /// <summary>
        /// 返回 URL 字符串的编码结果
        /// </summary>
        /// <param name="str">字符串</param>
        /// <returns>编码结果</returns>
        public static string UrlEncode(this string str) {
            return HttpUtility.UrlEncode(str);
        }

        /// <summary>
        /// 返回 URL 字符串的编码结果
        /// </summary>
        /// <param name="str">字符串</param>
        /// <returns>解码结果</returns>
        public static string UrlDecode(this string str) {
            return HttpUtility.UrlDecode(str);
        }


        /// <summary>
        /// 获取站点根目录URL
        /// </summary>
        /// <returns>返回获取到的站点根目录URL</returns>
        public static string GetRootUrl(this string forumPath) {
            int port = HttpContext.Current.Request.Url.Port;
            return string.Format("{0}://{1}{2}{3}",
                                 HttpContext.Current.Request.Url.Scheme,
                                 HttpContext.Current.Request.Url.Host.ToString(),
                                 (port == 80 || port == 0) ? "" : ":" + port,
                                 forumPath);
        }


        /// <summary>
        /// 获取指定文件的扩展名,返回最后一个点后面的部分，如果没有点则返回""
        /// </summary>
        /// <param name="fileName">指定文件名</param>
        /// <returns>返回的扩展名</returns>
        public static string GetFileExtName(this string fileName) {
            if (fileName.StrIsNullOrEmpty() || fileName.IndexOf('.') <= 0)
                return "";

            fileName = fileName.ToLower().Trim();

            return fileName.Substring(fileName.LastIndexOf('.'), fileName.Length - fileName.LastIndexOf('.'));
        }

        /// <summary>
        /// 过滤HTML中的不安全标签
        /// </summary>
        /// <param name="content">传入需要过滤的字符串</param>
        /// <returns>返回过滤后的html</returns>
        public static string RemoveUnsafeHtml(this string content) {
            if (content == null || content == "") {
                return "";
            } else {
                content = Regex.Replace(content, @"(\<|\s+)o([a-z]+\s?=)", "$1$2", RegexOptions.IgnoreCase);
                content = Regex.Replace(content, @"(script|frame|form|meta|behavior|style)([\s|:|>])+", "$1.$2", RegexOptions.IgnoreCase);
                return content;
            }

        }


        /// <summary>
        /// 根据Url地址获得页面中的源代码文件内容
        /// </summary>
        /// <param name="url">传入合法的Url地址</param>
        /// <returns>返回页面的代码文件内容</returns>
        public static string GetSourceTextByUrl(this string url) {
            WebRequest request = WebRequest.Create(url);
            request.Timeout = 20000;//20秒超时
            WebResponse response = request.GetResponse();

            Stream resStream = response.GetResponseStream();
            StreamReader sr = new StreamReader(resStream);
            return sr.ReadToEnd();
        }

        /// <summary>
        /// 字段串是否为Null或为""(空)
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool StrIsNullOrEmpty(this string str) {
            if (str == null || str.Trim() == string.Empty)
                return true;

            return false;
        }


        ///// <summary>
        ///// 转换为简体中文
        ///// </summary>
        //public static string ToSChinese(this string str)
        //{
        //    return Strings.StrConv(str, VbStrConv.SimplifiedChinese, 0);
        //}

        ///// <summary>
        ///// 转换为繁体中文
        ///// </summary>
        //public static string ToTChinese(this string str)
        //{
        //    return Strings.StrConv(str, VbStrConv.TraditionalChinese, 0);
        //}

        /// <summary>
        /// MD5函数
        /// </summary>
        /// <param name="str">原始字符串</param>
        /// <returns>MD5结果</returns>
        public static string ToMD5(this string str) {
            string newString = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToLower();
            return newString;
        }

        /// <summary>
        /// 字符串如果操过指定长度则将超出的部分用指定字符串代替
        /// </summary>
        /// <param name="p_SrcString">要检查的字符串</param>
        /// <param name="p_Length">指定长度</param>
        /// <param name="p_TailString">用于替换的字符串</param>
        /// <returns>截取后的字符串</returns>
        public static string GetSubString(string p_SrcString, int p_Length, string p_TailString) {
            return GetSubString(p_SrcString, 0, p_Length, p_TailString);
        }
        /// <summary>
        /// 取指定长度的字符串
        /// </summary>
        /// <param name="p_SrcString">要检查的字符串</param>
        /// <param name="p_StartIndex">起始位置</param>
        /// <param name="p_Length">指定长度</param>
        /// <param name="p_TailString">用于替换的字符串</param>
        /// <returns>截取后的字符串</returns>
        public static string GetSubString(string p_SrcString, int p_StartIndex, int p_Length, string p_TailString) {


            string myResult = p_SrcString;

            //当是日文或韩文时(注:中文的范围:\u4e00 - \u9fa5, 日文在\u0800 - \u4e00, 韩文为\xAC00-\xD7A3)
            if (System.Text.RegularExpressions.Regex.IsMatch(p_SrcString, "[\u0800-\u4e00]+") ||
                System.Text.RegularExpressions.Regex.IsMatch(p_SrcString, "[\xAC00-\xD7A3]+")) {
                //当截取的起始位置超出字段串长度时
                if (p_StartIndex >= p_SrcString.Length) {
                    return "";
                } else {
                    return p_SrcString.Substring(p_StartIndex,
                                                   ((p_Length + p_StartIndex) > p_SrcString.Length) ? (p_SrcString.Length - p_StartIndex) : p_Length);
                }
            }


            if (p_Length >= 0) {
                byte[] bsSrcString = Encoding.Default.GetBytes(p_SrcString);

                //当字符串长度大于起始位置
                if (bsSrcString.Length > p_StartIndex) {
                    int p_EndIndex = bsSrcString.Length;

                    //当要截取的长度在字符串的有效长度范围内
                    if (bsSrcString.Length > (p_StartIndex + p_Length)) {
                        p_EndIndex = p_Length + p_StartIndex;
                    } else {   //当不在有效范围内时,只取到字符串的结尾

                        p_Length = bsSrcString.Length - p_StartIndex;
                        p_TailString = "";
                    }



                    int nRealLength = p_Length;
                    int[] anResultFlag = new int[p_Length];
                    byte[] bsResult = null;

                    int nFlag = 0;
                    for (int i = p_StartIndex; i < p_EndIndex; i++) {

                        if (bsSrcString[i] > 127) {
                            nFlag++;
                            if (nFlag == 3) {
                                nFlag = 1;
                            }
                        } else {
                            nFlag = 0;
                        }

                        anResultFlag[i] = nFlag;
                    }

                    if ((bsSrcString[p_EndIndex - 1] > 127) && (anResultFlag[p_Length - 1] == 1)) {
                        nRealLength = p_Length + 1;
                    }

                    bsResult = new byte[nRealLength];

                    Array.Copy(bsSrcString, p_StartIndex, bsResult, 0, nRealLength);

                    myResult = Encoding.Default.GetString(bsResult);

                    myResult = myResult + p_TailString;
                }
            }

            return myResult;
        }

        private static byte[] Keys = { 0x41, 0x72, 0x65, 0x79, 0x6F, 0x75, 0x6D, 0x79, 0x53, 0x6E, 0x6F, 0x77, 0x6D, 0x61, 0x6E, 0x3F };
        /// <summary>
        /// AES加密字符串
        /// </summary>
        /// <param name="encryptString">待加密的字符串</param>
        /// <param name="encryptKey">加密密钥,要求为8位</param>
        /// <returns>加密成功返回加密后的字符串,失败返回源串</returns>
        public static string AESEncode(string encryptString, string encryptKey) {
            encryptKey = GetSubString(encryptKey, 32, "");
            encryptKey = encryptKey.PadRight(32, ' ');

            RijndaelManaged rijndaelProvider = new RijndaelManaged();
            rijndaelProvider.Key = Encoding.UTF8.GetBytes(encryptKey.Substring(0, 32));
            rijndaelProvider.IV = Keys;
            ICryptoTransform rijndaelEncrypt = rijndaelProvider.CreateEncryptor();

            byte[] inputData = Encoding.UTF8.GetBytes(encryptString);
            byte[] encryptedData = rijndaelEncrypt.TransformFinalBlock(inputData, 0, inputData.Length);

            return Convert.ToBase64String(encryptedData);
        }

        /// <summary>
        /// AES解密字符串
        /// </summary>
        /// <param name="decryptString">待解密的字符串</param>
        /// <param name="decryptKey">解密密钥,要求为8位,和加密密钥相同</param>
        /// <returns>解密成功返回解密后的字符串,失败返源串</returns>
        public static string AESDecode(string decryptString, string decryptKey) {
            try {
                decryptKey = GetSubString(decryptKey, 32, "");
                decryptKey = decryptKey.PadRight(32, ' ');

                RijndaelManaged rijndaelProvider = new RijndaelManaged();
                rijndaelProvider.Key = Encoding.UTF8.GetBytes(decryptKey);
                rijndaelProvider.IV = Keys;
                ICryptoTransform rijndaelDecrypt = rijndaelProvider.CreateDecryptor();

                byte[] inputData = Convert.FromBase64String(decryptString);
                byte[] decryptedData = rijndaelDecrypt.TransformFinalBlock(inputData, 0, inputData.Length);

                return Encoding.UTF8.GetString(decryptedData);
            } catch {
                return "";
            }

        }

        //默认密钥向量
        private static byte[] Keys1 = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };
        /// <summary>
        /// DES加密字符串
        /// </summary>
        /// <param name="encryptString">待加密的字符串</param>
        /// <param name="encryptKey">加密密钥,要求为8位</param>
        /// <returns>加密成功返回加密后的字符串,失败返回源串</returns>
        public static string DESEncode(string encryptString, string encryptKey) {
            encryptKey = GetSubString(encryptKey, 8, "");
            encryptKey = encryptKey.PadRight(8, ' ');
            byte[] rgbKey = Encoding.UTF8.GetBytes(encryptKey.Substring(0, 8));
            byte[] rgbIV = Keys1;
            byte[] inputByteArray = Encoding.UTF8.GetBytes(encryptString);
            DESCryptoServiceProvider dCSP = new DESCryptoServiceProvider();
            MemoryStream mStream = new MemoryStream();
            CryptoStream cStream = new CryptoStream(mStream, dCSP.CreateEncryptor(rgbKey, rgbIV), CryptoStreamMode.Write);
            cStream.Write(inputByteArray, 0, inputByteArray.Length);
            cStream.FlushFinalBlock();
            return Convert.ToBase64String(mStream.ToArray());

        }

        /// <summary>
        /// DES解密字符串
        /// </summary>
        /// <param name="decryptString">待解密的字符串</param>
        /// <param name="decryptKey">解密密钥,要求为8位,和加密密钥相同</param>
        /// <returns>解密成功返回解密后的字符串,失败返源串</returns>
        public static string DESDecode(string decryptString, string decryptKey) {
            try {
                decryptKey = GetSubString(decryptKey, 8, "");
                decryptKey = decryptKey.PadRight(8, ' ');
                byte[] rgbKey = Encoding.UTF8.GetBytes(decryptKey);
                byte[] rgbIV = Keys1;
                byte[] inputByteArray = Convert.FromBase64String(decryptString);
                DESCryptoServiceProvider DCSP = new DESCryptoServiceProvider();

                MemoryStream mStream = new MemoryStream();
                CryptoStream cStream = new CryptoStream(mStream, DCSP.CreateDecryptor(rgbKey, rgbIV), CryptoStreamMode.Write);
                cStream.Write(inputByteArray, 0, inputByteArray.Length);
                cStream.FlushFinalBlock();
                return Encoding.UTF8.GetString(mStream.ToArray());
            } catch {
                return "";
            }

        }


        /// <summary>
        /// SHA256函数
        /// </summary>
        /// /// <param name="str">原始字符串</param>
        /// <returns>SHA256结果</returns>
        public static string ToSHA256(this string str) {
            byte[] SHA256Data = Encoding.UTF8.GetBytes(str);
            SHA256Managed Sha256 = new SHA256Managed();
            byte[] Result = Sha256.ComputeHash(SHA256Data);
            return Convert.ToBase64String(Result);  //返回长度为44字节的字符串
        }

        /// <summary>
        /// 如果输入的字符串时空，就返回缺省字符串
        /// </summary>
        /// <param name="str">输入字符串</param>
        /// <param name="defaultStr">缺省字符串</param>
        /// <returns>返回结果</returns>
        public static string ReturnDefaultRequired(this string str, string defaultStr) {
            if (string.IsNullOrEmpty(str)) {
                return defaultStr.Trim();
            }

            return str.Trim();
        }

        /// <summary>
        /// 检测是否有Sql危险字符
        /// </summary>
        /// <param name="str">要判断字符串</param>
        /// <returns>true表示有，false表示没有</returns>
        public static bool IsSafeSqlString(this string str) {

            return !Regex.IsMatch(str, @"[-|;|,|\/|\(|\)|\[|\]|\}|\{|%|@|\*|!|\']");
        }


        /// <summary>
        /// 查询登陆输入框中过滤SQL语句,防止注入
        /// </summary>
        /// <returns>返回过滤后的字符串 </returns>
        public static string InputFilterSql(this string s) {
            if (s == null || s == "") {
                return "";
            } else {
                s = s.Replace("'", "");
                s = s.Replace("%", "");
                s = s.Replace("[", "");
                s = s.Replace("+", "");
                s = s.Replace("-", "");
                s = s.Replace(" or ", "");
                s = s.Replace(" and ", "");
                s = s.Replace("=", "");
                return s;
            }

        }

        /// <summary>
        /// 检查处理当前字符串中有害的SQL脚本，防止SQL注入
        /// </summary>
        /// <param name="s">传入的字符串</param>
        /// <returns>返回经过过滤处理后的字符串</returns>
        public static string SqlCheck(this string s) {
            //return s;
            return FilterSql(s);
        }



        ///// <summary>
        ///// 针对特殊字符串进行处理
        ///// </summary>
        //public static string sqlencode(string str)
        //{


        //    str = str.Replace("'", "''");
        //    //只在LIKE查询时才用到这些
        //    str = str.Replace("[", "[[]"); //此句一定要在最先

        //    str = str.Replace("_", "[_]");
        //    str = str.Replace("%", "[%]");
        //    str = str.Replace("@#%nbsp", "+");
        //    return str;
        //}



        //  sp_|'|\|xp_|
        //            string SqlStr = @"and|or|exec|execute|insert|select|delete|update|alter|create|drop|count|\*|chr|char|asc|mid|substring|
        //                                master|truncate|declare|xp_cmdshell|restore|backup|net +user|net +localgroup +administrators";


        /// <summary>
        /// 过滤SQL语句,防止注入
        /// </summary>
        /// <param name="sSql">传入需要过滤的字符串</param>
        /// <returns>返回过滤后的字符串 </returns>
        public static string FilterSql(this string sSql) {
            if (sSql != null) {
                sSql = sSql.ToLower().Trim();

                sSql = sSql.Replace("exec", "");
                sSql = sSql.Replace("execute", "");
                sSql = sSql.Replace("insert", "");
                sSql = sSql.Replace("select", "");
                sSql = sSql.Replace("update", "");
                sSql = sSql.Replace("delete", "");
                sSql = sSql.Replace("alter", "");
                sSql = sSql.Replace("create", "");
                sSql = sSql.Replace("drop", "");
                sSql = sSql.Replace("count", "");
                sSql = sSql.Replace("\\", "");
                sSql = sSql.Replace("backup", "");
                sSql = sSql.Replace("chr", "");
                sSql = sSql.Replace("char", "");
                sSql = sSql.Replace("master", "");
                sSql = sSql.Replace("truncate", "");
                sSql = sSql.Replace("declare", "");
                sSql = sSql.Replace("sp_", "");
                sSql = sSql.Replace("xp_", "");
            } else {

            }

            return sSql;

        }





        //        /// 判断字符串中是否有SQL攻击代码
        //        /// 
        //        /// 传入用户提交数据
        //        /// true-安全；false-有注入攻击现有；
        //        public bool ProcessSqlStr(string inputString)
        //        {

        //            //  sp_|'|\|xp_|
        //            string SqlStr = @"and|or|exec|execute|insert|select|delete|update|alter|create|drop|count|\*|chr|char|asc|mid|substring|
        //                                master|truncate|declare|xp_cmdshell|restore|backup|net +user|net +localgroup +administrators";
        //            try
        //            {
        //                if ((inputString != null) && (inputString != String.Empty))
        //                {
        //                    string str_Regex = @"\b(" + SqlStr + @")\b";

        //                    Regex Regex = new Regex(str_Regex, RegexOptions.IgnoreCase);
        //                    //string s = Regex.Match(inputString).Value; 
        //                    if (true == Regex.IsMatch(inputString))
        //                        return false;
        //                }
        //            }
        //            catch
        //            {
        //                return false;
        //            }
        //            return true;
        //        }





        /// <summary>
        /// 去掉数据后面的.00，比如3.00去掉.00得到3
        /// </summary>
        /// <param name="strNumber">传入需要去掉.00的数据</param>
        /// <returns>返回去掉.00后的字符串</returns>
        public static string SubLastThreeZero(this string strNumber) {
            if (strNumber != null && !string.IsNullOrEmpty(strNumber.Trim())) {
                string[] Nums = strNumber.Trim().Split('.');
                if (Nums.Length == 2) {
                    Byte[] NumBytes = Encoding.ASCII.GetBytes(Nums[1]);
                    Char[] NumChars = Encoding.ASCII.GetChars(NumBytes);
                    ArrayList arr = new ArrayList(NumChars);
                    for (int i = arr.Count; i > 0; i--) {
                        if (arr[i - 1].ToString() == "0") {
                            arr.RemoveAt(i - 1);
                        } else {
                            break;
                        }
                    }
                    if (arr.Count > 0) {
                        string Num1 = "";
                        for (int i = 0; i < arr.Count; i++) {
                            Num1 += arr[i];

                        }
                        return Nums[0] + "." + Num1;
                    } else {
                        return Nums[0];
                    }
                }
                return strNumber.ToString();

            }
            return "";
        }


        /// <summary>
        /// 从HTML中获取文本,保留br,p,img
        /// </summary>
        /// <param name="HTML">传入的html字符串</param>
        /// <returns>返回过滤后的文体</returns>
        public static string GetTextFromHTML(this string HTML) {
            Regex regEx = new Regex(@"</?(?!br|/?p|img)[^>]*>", RegexOptions.IgnoreCase);

            return regEx.Replace(HTML, "");
        }

        /////<summary>
        ///// 过滤掉传入的指定的HTML的标签
        ///// </summary>
        ///// <param name="InputHTML">要过滤的HTML标签，以","分割</param>
        ///// <param name="Content">需要过滤的内容</param> 
        //public static string RemoveInputHtml(string Content, string InputHTML)
        //{
        //    Content = Content.ToLower();
        //    Regex regex;
        //    string[] InputHtmls = InputHTML.Split(',');
        //    for (int i = 0; i < InputHtmls.Length; i++)
        //    {
        //        if (!string.IsNullOrEmpty(InputHtmls[i]))
        //        {
        //            regex = new Regex(@InputHtmls[i], RegexOptions.IgnoreCase);
        //            Content = regex.Replace(Content, "");
        //        }
        //    }
        //    Content = Content.Replace(" ", "");
        //    Content = Content.Replace("&nbsp;", "");
        //    Content = Content.Replace("　", "");
        //    return Content;
        //}

        ///// <summary>
        ///// 为脚本替换特殊字符串
        ///// </summary>
        ///// <param name="str"></param>
        ///// <returns></returns>
        //public static string ReplaceStrToScript(string str)
        //{
        //    return str.Replace("\\", "\\\\").Replace("'", "\\'").Replace("\"", "\\\"");
        //}

        /// <summary>
        /// 移除Html中的标签，返回Html中的纯文本内容
        /// </summary>
        /// <param name="html">传入的html字符串</param>
        /// <returns>返回移除后的文本</returns>
        public static string RemoveHtml(this string html) {
            html = html.ToLower();
            Regex regex1 = new Regex(@"<script[\s\S]+</script *>", RegexOptions.IgnoreCase);
            Regex regex2 = new Regex(@" href *= *[\s\S]*script *:", RegexOptions.IgnoreCase);
            Regex regex3 = new Regex(@" no[\s\S]*=", RegexOptions.IgnoreCase);
            Regex regex4 = new Regex(@"<iframe[\s\S]+</iframe *>", RegexOptions.IgnoreCase);
            Regex regex5 = new Regex(@"<frameset[\s\S]+</frameset *>", RegexOptions.IgnoreCase);
            Regex regex6 = new Regex(@"\<img[^\>]+\>", RegexOptions.IgnoreCase);
            Regex regex7 = new Regex(@"</p>", RegexOptions.IgnoreCase);
            Regex regex8 = new Regex(@"<p>", RegexOptions.IgnoreCase);
            Regex regex9 = new Regex(@"<[^>]*>", RegexOptions.IgnoreCase);

            html = regex1.Replace(html, ""); //过滤<script></script>标记 
            html = regex2.Replace(html, ""); //过滤href=javascript: (<A>) 属性 
            html = regex3.Replace(html, " _disibledevent="); //过滤其它控件的on...事件 
            html = regex4.Replace(html, ""); //过滤iframe 
            html = regex5.Replace(html, ""); //过滤frameset 
            html = regex6.Replace(html, ""); //过滤frameset 
            html = regex7.Replace(html, ""); //过滤frameset 
            html = regex8.Replace(html, ""); //过滤frameset 
            html = regex9.Replace(html, "");
            html = html.Replace(" ", "");
            html = html.Replace("</strong>", "");
            html = html.Replace("<strong>", "");
            html = html.Replace("&nbsp;", "");
            html = html.Replace("　", "");
            html = html.Replace("\r", "");
            html = html.Replace("&hellip;", "");
            html = html.Replace("&ldquo;", "");
            html = html.Replace("&rdquo;", "");
            return html;
        }


        /// <summary>
        /// 计算发表时间距离当前时间差
        /// </summary>
        /// <param name="dt">输入发表时间</param>
        /// <returns></returns>
        public static string DateStringFromNow(DateTime dt) {
            TimeSpan span = DateTime.Now - dt;
            if (span.TotalDays > 60) {
                return dt.ToShortDateString();
            } else if (span.TotalDays > 30) {
                return "1个月前";
            } else if (span.TotalDays > 21) {
                return "3周前";
            } else if (span.TotalDays > 14) {
                return "2周前";
            } else if (span.TotalDays > 7) {
                return "1周前";
            } else if (span.TotalDays > 1) {
                return string.Format("{0}天前", (int)Math.Floor(span.TotalDays));
            } else if (span.TotalHours > 1) {
                return string.Format("{0}小时前", (int)Math.Floor(span.TotalHours));
            } else if (span.TotalMinutes > 1) {
                return string.Format("{0}分钟前", (int)Math.Floor(span.TotalMinutes));
            } else if (span.TotalSeconds >= 1) {
                return string.Format("{0}秒前", (int)Math.Floor(span.TotalSeconds));
            } else {
                return "1秒前";
            }
        }

        /// <summary>
        /// 计算发表时间距离当前时间差
        /// </summary>
        /// <param name="dt">输入发表时间</param>
        /// <returns></returns>
        public static string DateStringFromNow(object dtime) {
            if (dtime == null || dtime.ToString() == "") {
                return "本周内";
            }
            DateTime dt = Convert.ToDateTime(dtime);
            TimeSpan span = DateTime.Now - dt;
            if (span.TotalDays > 60) {
                return dt.ToShortDateString();
            } else if (span.TotalDays > 30) {
                return "1个月前";
            } else if (span.TotalDays > 21) {
                return "3周前";
            } else if (span.TotalDays > 14) {
                return "2周前";
            } else if (span.TotalDays > 7) {
                return "1周前";
            } else if (span.TotalDays > 1) {
                return string.Format("{0}天前", (int)Math.Floor(span.TotalDays));
            } else if (span.TotalHours > 1) {
                return string.Format("{0}小时前", (int)Math.Floor(span.TotalHours));
            } else if (span.TotalMinutes > 1) {
                return string.Format("{0}分钟前", (int)Math.Floor(span.TotalMinutes));
            } else if (span.TotalSeconds >= 1) {
                return string.Format("{0}秒前", (int)Math.Floor(span.TotalSeconds));
            } else {
                return "1秒前";
            }
        }

        /// <summary>
        /// 根据身份证获取性别
        /// </summary>
        /// <param name="id">身份证号</param>
        /// <returns>性别false男、true女</returns>
        public static bool GetSexByID(this string id) {
            string sex = "";
            if (id.Length == 15)
                sex = id.Substring(14, 1);
            else
                sex = id.Substring(16, 1);
            if (int.Parse(sex) % 2 == 0)
                return true;
            return false;
        }

        /// <summary>
        /// 根据身份证获取生日
        /// </summary>
        /// <param name="id">身份证号</param>
        /// <returns>生日</returns>
        public static DateTime GetBirthDayByID(this string id) {
            string strDate = "";
            if (id.Length == 15)       //15位身份证号
                strDate = "19" + id.Substring(6, 6);
            else                       //18位身份证号
                strDate = id.Substring(6, 8);
            return DateTime.ParseExact(strDate, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
        }

        public static Int32 GetPasswdSecurityLevel(this string src) {
            int level = 0;
            src = src.Trim();
            if (src.Length < 6) return 0;
            if (Regex.IsMatch(src, @"^\d$")) level++;
            if (Regex.IsMatch(src, @"^[a-z]$")) level++;
            if (Regex.IsMatch(src, @"^[A-Z]$")) level++;
            if (Regex.IsMatch(src, @"^\w$")) level++;
            if (src.Length > 12) return 4;
            return level;
        }

    }
}
