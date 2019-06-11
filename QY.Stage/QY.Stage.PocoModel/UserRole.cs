using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
    [Table("BaseUserRole")]
    public partial class UserRole {    
        [Key]
        public int UserId { get; set; }
        [Key]
        public int RoleId { get; set; }
    }
}    
