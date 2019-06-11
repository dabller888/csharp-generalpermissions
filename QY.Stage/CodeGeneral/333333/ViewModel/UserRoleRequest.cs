using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class UserRoleRequest : PageRequest {
        public int UserId { get; set; }
        public int RoleId { get; set; }
    }
}    
