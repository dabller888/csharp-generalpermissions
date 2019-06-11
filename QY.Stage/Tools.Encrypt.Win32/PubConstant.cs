using System.Configuration;
using System.Web;
using Bocent.Lib;

namespace Bocent.DBUtility
{
    public abstract class PubConstant
    {
        public static string OleDbConnectionString
        {
            get
            {
                object conn = _get_cache("OleDbConnectionString");
                if (conn != null)
                {
                    return conn.ToString();
                }
                else
                {
                    string source = string.Format(Appconfig._ROOT_PATH,
                        Function.GetAppSettings("config.db_Folder", true),
                        Function.GetAppSettings("config.db_Database", true));
                    string mappath = Function.GetMapPath(source);
                    string password = Function.GetAppSettings("config.db_Password", true);
                    string connectionstring = ConfigurationManager.ConnectionStrings["OleDbConnstring"].ConnectionString;
                    _set_cache("OleDbConnectionString", string.Format(connectionstring, mappath, password));
                    return string.Format(connectionstring, mappath, password);
                }
            }
        }

        public static string SqlDbConnectionString
        {
            get
            {
                object conn = _get_cache("SqlDbConnectionString");
                if (conn != null)
                {
                    return conn.ToString();
                }
                else
                {
                    string[] args = new string[4];
                    args[0] = Function.GetAppSettings("config.db_DataSource", true);
                    args[1] = Function.GetAppSettings("config.db_Database", true);
                    args[2] = Function.GetAppSettings("config.db_UID", true);
                    args[3] = Function.GetAppSettings("config.db_Password", true);
                    string connectionstring = ConfigurationManager.ConnectionStrings["SqlDbConnstring"].ConnectionString;
                    _set_cache("SqlDbConnectionString", string.Format(connectionstring, args));
                    return string.Format(connectionstring, args);
                }
            }
        }

        public static object _get_cache(string CacheKey)
        {
            System.Web.Caching.Cache objCache = HttpRuntime.Cache;
            return objCache[CacheKey];
        }

        public static void _set_cache(string CacheKey, object objObject)
        {
            System.Web.Caching.Cache objCache = HttpRuntime.Cache;
            objCache.Insert(CacheKey, objObject);
        }
    }
}
