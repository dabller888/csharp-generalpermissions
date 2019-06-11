using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("GroupUser")]
    public partial class GroupUser {    
        [Key]
        public int GroupId { get; set; }
        [Key]
        public int UserId { get; set; }
    }
}    
