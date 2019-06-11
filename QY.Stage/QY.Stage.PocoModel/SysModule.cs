using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
    [Table("BaseSysModule")]
    public partial class SysModule {    
        [Key]
        public int ModuleId { get; set; }
        public string ModuleName { get; set; }
        public string ModuleUrl { get; set; }
        public int ModulePId { get; set; }
        public int ModuleLever { get; set; }
        public int OrderNo { get; set; }
        public int IsDeleted { get; set; }
    }
}    
