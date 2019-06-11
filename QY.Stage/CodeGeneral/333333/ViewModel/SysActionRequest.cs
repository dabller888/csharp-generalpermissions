using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class SysActionRequest : PageRequest {
        public int ActionId { get; set; }
        public int ModuleId { get; set; }
        public string ActionName { get; set; }
        public string ActionCode { get; set; }
        public string ButtonCode { get; set; }
        public string ParaName { get; set; }
        public int ActionType { get; set; }
        public int IsDeleted { get; set; }
    }
}    
