using System;

namespace QY.Stage.PocoModel {
    public class UserRoleModule {
        public int RoleId { get; set; }
        public int ModuleId { get; set; }
        public string RoleName { get; set; }
        public string ModuleName { get; set; }
        public int ModulePId { get; set; }
        public int ModuleLever { get; set; }
        public string ModuleUrl { get; set; }
        public int OrderNo { get; set; }
    }

    public class UserModuleAction {
        public int RoleId { get; set; }
        public int ModuleId { get; set; }
        public int ActionId { get; set; }
        public string RoleName { get; set; }
        public string ModuleName { get; set; }
        public int ModulePId { get; set; }
        public int ModuleLever { get; set; }
        public string ModuleUrl { get; set; }
        public int OrderNo { get; set; }
        public string ActionName { get; set; }
        public string ButtonCode { get; set; }
        public string ParaName { get; set; }
    }
}    
