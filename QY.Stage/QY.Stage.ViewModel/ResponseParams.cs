using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QY.Stage.ViewModel {
    public class ResponseParams {
        public int Code { get; set; }
        public string Message { get; set; }
        public object Content { get; set; }
    }
    
    public enum ResultCode {

    }

    public static class ResponseCode {
        public static int ERROR = 0;//错误
        public static int SUCCESS = 1;//成功
        public static int EXIST = 2;//存在
        public static int FROZEN = 3;//冻结用户登录

    }
}
