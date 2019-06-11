using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace QY.Stage.ViewModel {
    public class SysDepartmentRequest : PageRequest {
        public int DeptId { get; set; }
        public string DepartName { get; set; }
        public int DeptPId { get; set; }
        public string DepartDesc { get; set; }
    }
}    
