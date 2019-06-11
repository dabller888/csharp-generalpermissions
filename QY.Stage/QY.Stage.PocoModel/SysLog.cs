using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
    [Table("BaseSysLog")]
    public partial class SysLog {    
        [Key]
        public int LogId { get; set; }
        public int OperType { get; set; }
        public string LogDesc { get; set; }
        public int UserId { get; set; }
        public string IPAddress { get; set; }
        public string MacAddress { get; set; }
        public DateTime OperTime { get; set; }
        public int IsDeleted { get; set; }
    }
}    
