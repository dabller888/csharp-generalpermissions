using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class SysLogRequest : PageRequest {
        public int LogId { get; set; }
        public int OperType { get; set; }
        public string LogDesc { get; set; }
        public int UserId { get; set; }
        public string IPAddress { get; set; }
        public string MacAddress { get; set; }
        public DateTime OperTime { get; set; }
        public int IsDeleted { get; set; }
    }
}    
