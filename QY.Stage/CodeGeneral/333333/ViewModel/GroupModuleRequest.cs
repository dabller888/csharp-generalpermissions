using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class GroupModuleRequest : PageRequest {
        public int GroupId { get; set; }
        public int ModuleId { get; set; }
        public int ActionId { get; set; }
    }
}    
