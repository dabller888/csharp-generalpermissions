using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class SysModuleRequest : PageRequest {
        public int ModuleId { get; set; }
        public string ModuleName { get; set; }
        public string ModuleUrl { get; set; }
        public int ModulePId { get; set; }
        public int ModuleLever { get; set; }
        public int OrderNo { get; set; }
        public int IsDeleted { get; set; }
    }
}    
