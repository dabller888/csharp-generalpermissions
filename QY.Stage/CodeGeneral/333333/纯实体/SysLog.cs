using System;

namespace QY.Stage.PocoModel {
    public partial class SysLog {    
        /// <summary>
        /// 
        /// </summary>
        public int LogId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int OperType { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string LogDesc { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int UserId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string IPAddress { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string MacAddress { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime OperTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int IsDeleted { get; set; }
    }
}    
