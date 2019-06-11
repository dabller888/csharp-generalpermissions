using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class UserModuleRequest : PageRequest {
        public int UserId { get; set; }
        public int ModuleId { get; set; }
        public int ActionId { get; set; }
    }
}    
