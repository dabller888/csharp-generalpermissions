 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using QY.Stage.Model.PocoModel;
using QY.Stage.IBLL;
using QY.Stage.BLL;
namespace QY.Stage.BLL {
    public partial class SysDepartmentService : BaseService<SysDepartment>, ISysDepartmentService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.SysDepartmentRepository;
    	}
    }
    public partial class SysLogService : BaseService<SysLog>, ISysLogService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.SysLogRepository;
    	}
    }
    public partial class SysActionService : BaseService<SysAction>, ISysActionService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.SysActionRepository;
    	}
    }
    public partial class SysModuleService : BaseService<SysModule>, ISysModuleService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.SysModuleRepository;
    	}
    }
    public partial class ModuleActionService : BaseService<ModuleAction>, IModuleActionService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.ModuleActionRepository;
    	}
    }
    public partial class SysGroupService : BaseService<SysGroup>, ISysGroupService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.SysGroupRepository;
    	}
    }
    public partial class GroupUserService : BaseService<GroupUser>, IGroupUserService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.GroupUserRepository;
    	}
    }
    public partial class GroupRoleService : BaseService<GroupRole>, IGroupRoleService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.GroupRoleRepository;
    	}
    }
    public partial class GroupModuleService : BaseService<GroupModule>, IGroupModuleService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.GroupModuleRepository;
    	}
    }
    public partial class SysRoleService : BaseService<SysRole>, ISysRoleService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.SysRoleRepository;
    	}
    }
    public partial class RoleUserService : BaseService<RoleUser>, IRoleUserService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.RoleUserRepository;
    	}
    }
    public partial class RoleGroupService : BaseService<RoleGroup>, IRoleGroupService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.RoleGroupRepository;
    	}
    }
    public partial class RoleModuleService : BaseService<RoleModule>, IRoleModuleService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.RoleModuleRepository;
    	}
    }
    public partial class SysUserService : BaseService<SysUser>, ISysUserService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.SysUserRepository;
    	}
    }
    public partial class UserRoleService : BaseService<UserRole>, IUserRoleService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.UserRoleRepository;
    	}
    }
    public partial class UserGroupService : BaseService<UserGroup>, IUserGroupService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.UserGroupRepository;
    	}
    }
    public partial class UserModuleService : BaseService<UserModule>, IUserModuleService {
    	public override void SetCurrentRepository() {
    		CurrentRepository = _dbSession.UserModuleRepository;
    	}
    }
}