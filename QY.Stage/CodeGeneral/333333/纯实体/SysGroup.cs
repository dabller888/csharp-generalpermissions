using System;

namespace QY.Stage.PocoModel {
    public partial class SysGroup {    
        /// <summary>
        /// 
        /// </summary>
        public int GroupId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string GroupName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int GroupPId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime CreateTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string GroupDesc { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int IsDeleted { get; set; }
    }
}    
