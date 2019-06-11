using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
    [Table("BaseRoleGroup")]
    public partial class RoleGroup {    
        [Key]
        public int RoleId { get; set; }
        [Key]
        public int GroupId { get; set; }
    }
}    
