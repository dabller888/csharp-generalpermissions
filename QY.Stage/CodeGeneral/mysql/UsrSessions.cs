using System;
namespace QY.Stage.Frameworks.Model
{    
    /// <summary>
    /// UsrSessions 
    /// </summary>
    public partial class UsrSessions    
    {    
        public Int32 UserId { get; set; }
        public Int32 DeptId { get; set; }
        public String LoginName { get; set; }
        public String LoginPass { get; set; }
        public String RealName { get; set; }
        public String Sex { get; set; }
        public DateTime BirthDate { get; set; }
        public String Address { get; set; }
        public String Phone { get; set; }
        public String Email { get; set; }
        public DateTime CreateTime { get; set; }
        public DateTime LoginTime { get; set; }
        public DateTime LastLoginTime { get; set; }
        public Int32 LoginCount { get; set; }
        public Int32 IsEnabled { get; set; }
        public Int32 IsDeleted { get; set; }
        public Int32 ExtendField1 { get; set; }
        public Int32 ExtendField2 { get; set; }
        public String ExtendField3 { get; set; }
        public String ExtendField4 { get; set; }
        public String ExtendField5 { get; set; }
    }
}
    
