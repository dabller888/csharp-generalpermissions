using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("SysDepartment")]
    public partial class SysDepartment {    
        [Key]
        public int DeptId { get; set; }
        public string DepartName { get; set; }
        public int DeptPId { get; set; }
        public string DepartDesc { get; set; }
    }
}    
