using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class GroupUserRequest : PageRequest {
        public int GroupId { get; set; }
        public int UserId { get; set; }
    }
}    
