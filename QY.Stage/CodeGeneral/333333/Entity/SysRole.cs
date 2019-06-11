using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("SysRole")]
    public partial class SysRole {    
        [Key]
        public int RoleId { get; set; }
        public int RolePId { get; set; }
        public string RoleName { get; set; }
        public DateTime CreateTime { get; set; }
        public string RoleDesc { get; set; }
        public int IsDeleted { get; set; }
    }
}    
