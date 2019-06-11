using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
    [Table("BaseSysGroup")]
    public partial class SysGroup {    
        [Key]
        public int GroupId { get; set; }
        public string GroupName { get; set; }
        public int GroupPId { get; set; }
        public DateTime CreateTime { get; set; }
        public string GroupDesc { get; set; }
        public int IsDeleted { get; set; }
    }
}    
