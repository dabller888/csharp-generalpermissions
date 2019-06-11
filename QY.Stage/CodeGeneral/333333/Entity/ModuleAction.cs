using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("ModuleAction")]
    public partial class ModuleAction {    
        [Key]
        public int ModuleActionId { get; set; }
        [Key]
        public int ModuleId { get; set; }
        [Key]
        public int ActionId { get; set; }
    }
}    
