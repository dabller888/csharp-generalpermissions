using System;

namespace QY.Stage.PocoModel {
    public partial class SysRole {    
        /// <summary>
        /// 
        /// </summary>
        public int RoleId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int RolePId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string RoleName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime CreateTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string RoleDesc { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int IsDeleted { get; set; }
    }
}    
