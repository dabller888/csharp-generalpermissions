 
namespace QY.Stage.IDAL
{
    public partial interface IDbSession
    {
		ISysDepartmentRepository SysDepartmentRepository{ get; }
		ISysLogRepository SysLogRepository{ get; }
		ISysActionRepository SysActionRepository{ get; }
		ISysModuleRepository SysModuleRepository{ get; }
		IModuleActionRepository ModuleActionRepository{ get; }
		ISysGroupRepository SysGroupRepository{ get; }
		IGroupUserRepository GroupUserRepository{ get; }
		IGroupRoleRepository GroupRoleRepository{ get; }
		IGroupModuleRepository GroupModuleRepository{ get; }
		ISysRoleRepository SysRoleRepository{ get; }
		IRoleUserRepository RoleUserRepository{ get; }
		IRoleGroupRepository RoleGroupRepository{ get; }
		IRoleModuleRepository RoleModuleRepository{ get; }
		ISysUserRepository SysUserRepository{ get; }
		IUserRoleRepository UserRoleRepository{ get; }
		IUserGroupRepository UserGroupRepository{ get; }
		IUserModuleRepository UserModuleRepository{ get; }
	}
}
