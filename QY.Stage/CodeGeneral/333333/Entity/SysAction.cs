using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("SysAction")]
    public partial class SysAction {    
        [Key]
        public int ActionId { get; set; }
        public int ModuleId { get; set; }
        public string ActionName { get; set; }
        public string ActionCode { get; set; }
        public string ButtonCode { get; set; }
        public string ParaName { get; set; }
        public int ActionType { get; set; }
        public int IsDeleted { get; set; }
    }
}    
