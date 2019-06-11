using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("GroupModule")]
    public partial class GroupModule {    
        [Key]
        public int GroupId { get; set; }
        [Key]
        public int ModuleId { get; set; }
        [Key]
        public int ActionId { get; set; }
    }
}    
