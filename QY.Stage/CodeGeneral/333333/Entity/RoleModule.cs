using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("RoleModule")]
    public partial class RoleModule {    
        [Key]
        public int RoleId { get; set; }
        [Key]
        public int ModuleId { get; set; }
        [Key]
        public int ActionId { get; set; }
    }
}    
