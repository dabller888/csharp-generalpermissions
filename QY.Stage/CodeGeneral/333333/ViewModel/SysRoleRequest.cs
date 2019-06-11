using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class SysRoleRequest : PageRequest {
        public int RoleId { get; set; }
        public int RolePId { get; set; }
        public string RoleName { get; set; }
        public DateTime CreateTime { get; set; }
        public string RoleDesc { get; set; }
        public int IsDeleted { get; set; }
    }
}    
