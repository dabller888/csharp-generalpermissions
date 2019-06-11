using System;

namespace QY.Stage.PocoModel {
    public partial class SysDepartment {    
        /// <summary>
        /// 部门编号
        /// </summary>
        public int DeptId { get; set; }
        /// <summary>
        /// 部门名称
        /// </summary>
        public string DepartName { get; set; }
        /// <summary>
        /// 上级编号
        /// </summary>
        public int DeptPId { get; set; }
        /// <summary>
        /// 部门描述
        /// </summary>
        public string DepartDesc { get; set; }
    }
}    
