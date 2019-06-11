using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class SysUserRequest : PageRequest {
        public int UserId { get; set; }
        public int DeptId { get; set; }
        public string LoginName { get; set; }
        public string LoginPass { get; set; }
        public string RealName { get; set; }
        public string Sex { get; set; }
        public DateTime BirthDate { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public DateTime CreateTime { get; set; }
        public DateTime LoginTime { get; set; }
        public DateTime LastLoginTime { get; set; }
        public int LoginCount { get; set; }
        public int IsEnabled { get; set; }
        public int IsDeleted { get; set; }
        public int ExtendField1 { get; set; }
        public int ExtendField2 { get; set; }
        public string ExtendField3 { get; set; }
        public string ExtendField4 { get; set; }
        public string ExtendField5 { get; set; }
    }
}    
