using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QY.Stage.Frameworks.Utility
{
    /// <summary>
    /// Int类型的扩展方法类
    /// </summary>
    public static class IntExte
    {
        /// <summary>
        /// 将Int32?转换成Int32
        /// </summary>
        /// <param name="v">需要转换的Int32?值</param>
        /// <returns>返回转换后的值</returns>
        public static Int32 ToInt32(this Int32? v)
        {
            if(v==null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(v);
            }
        }

        /// <summary>
        /// 将Int16?转换成Int16
        /// </summary>
        /// <param name="v">需要转换的Int16?值</param>
        /// <returns>返回转换后的值</returns>
        public static Int16 ToInt16(this Int16? v)
        {
            if (v == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt16(v);
            }
        }

        ///// <summary>
        ///// 除去0的值
        ///// </summary>
        ///// <param name="input">输入值</param>
        ///// <returns></returns>
        //public static string ToStringNoZero(this int input)
        //{
        //    if (input <= 0)
        //    {
        //        return "";
        //    }

        //    return input.ToString();
        //}

        ///// <summary>
        ///// 除去0的值
        ///// </summary>
        ///// <param name="input">输入值</param>
        ///// <returns></returns>
        //public static string ToStringNoZero(this int? input)
        //{
        //    if (input != null)
        //    {
        //        if (input <= 0)
        //        {
        //            return "";
        //        }

        //        return input.ToString();
        //    }

        //    return null;
        //}

        ///// <summary>
        ///// 除去0的值
        ///// </summary>
        ///// <param name="input">输入值</param>
        ///// <returns></returns>
        //public static string ToStringNoZero(this Int16 input)
        //{
        //    if (input <= 0)
        //    {
        //        return "";
        //    }

        //    return input.ToString();
        //}

        ///// <summary>
        ///// 除去0的值
        ///// </summary>
        ///// <param name="input">输入值</param>
        ///// <returns></returns>
        //public static string ToStringNoZero(this Int16? input)
        //{
        //    if (input != null)
        //    {
        //        if (input <= 0)
        //        {
        //            return "";
        //        }

        //        return input.ToString();
        //    }

        //    return null;
        //}
    }
}
