using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
    [Table("BaseGroupUser")]
    public partial class GroupUser {    
        [Key]
        public int GroupId { get; set; }
        [Key]
        public int UserId { get; set; }
    }
}    
