using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace QY.Stage.PocoModel {
	[Table("Elder")]
    public partial class Elder {    
        [Key]
        public int ElderId { get; set; }
        public string SerialNo { get; set; }
        public string ElderName { get; set; }
        public string CardNo { get; set; }
        public int Sex { get; set; }
        public int Age { get; set; }
        public string Addr { get; set; }
        public string Post { get; set; }
        public string Phone { get; set; }
        public string Content { get; set; }
        public string QRCode { get; set; }
        public string FirstName { get; set; }
        public int FirstSex { get; set; }
        public string FirstAddr { get; set; }
        public string FirstPost { get; set; }
        public string FirstPhone { get; set; }
        public int FirstRelation { get; set; }
        public string SecName { get; set; }
        public int SecSex { get; set; }
        public string SecAddr { get; set; }
        public string SecPost { get; set; }
        public string SecPhone { get; set; }
        public int SecRelation { get; set; }
        public DateTime CreateTime { get; set; }
        public int DataFlag { get; set; }
        public int IsEnable { get; set; }
        public int IsDelete { get; set; }
    }
}    
