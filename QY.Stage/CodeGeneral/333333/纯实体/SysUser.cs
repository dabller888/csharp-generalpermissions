using System;

namespace QY.Stage.PocoModel {
    public partial class SysUser {    
        /// <summary>
        /// 
        /// </summary>
        public int UserId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int DeptId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string LoginName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string LoginPass { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string RealName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Sex { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime BirthDate { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Address { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Phone { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime CreateTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime LoginTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime LastLoginTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int LoginCount { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int IsEnabled { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int IsDeleted { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int ExtendField1 { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int ExtendField2 { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string ExtendField3 { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string ExtendField4 { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string ExtendField5 { get; set; }
    }
}    
