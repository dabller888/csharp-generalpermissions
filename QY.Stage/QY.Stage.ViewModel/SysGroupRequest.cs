using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class SysGroupRequest : PageRequest {
        public int GroupId { get; set; }
        public string GroupName { get; set; }
        public int GroupPId { get; set; }
        public DateTime CreateTime { get; set; }
        public string GroupDesc { get; set; }
        public int IsDeleted { get; set; }
    }
}    
