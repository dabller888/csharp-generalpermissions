using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("RoleUser")]
    public partial class RoleUser {    
        [Key]
        public int RoleId { get; set; }
        [Key]
        public int UserId { get; set; }
    }
}    
