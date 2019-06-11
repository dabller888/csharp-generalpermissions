using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("UserModule")]
    public partial class UserModule {    
        [Key]
        public int UserId { get; set; }
        [Key]
        public int ModuleId { get; set; }
        public int ActionId { get; set; }
    }
}    
