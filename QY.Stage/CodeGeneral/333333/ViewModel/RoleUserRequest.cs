using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class RoleUserRequest : PageRequest {
        public int RoleId { get; set; }
        public int UserId { get; set; }
    }
}    
