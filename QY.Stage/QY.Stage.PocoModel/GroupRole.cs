using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
    [Table("BaseGroupRole")]
    public partial class GroupRole {    
        [Key]
        public int GroupId { get; set; }
        [Key]
        public int RoleId { get; set; }
    }
}    
