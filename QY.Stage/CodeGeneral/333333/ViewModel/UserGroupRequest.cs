using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class UserGroupRequest : PageRequest {
        public int UserId { get; set; }
        public int GroupId { get; set; }
    }
}    
