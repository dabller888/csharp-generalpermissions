using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
    [Table("BaseUserGroup")]
    public partial class UserGroup {    
        [Key]
        public int UserId { get; set; }
        [Key]
        public int GroupId { get; set; }
    }
}    
