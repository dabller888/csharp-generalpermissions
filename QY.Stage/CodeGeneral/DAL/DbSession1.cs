using QY.Stage.IDAL;
namespace QY.Stage.DAL
{
    public partial interface DbSession : IDbSession
    {
		public ISysDepartmentRepository SysDepartmentRepository{ get { return new SysDepartmentRepository(); } }
		public ISysLogRepository SysLogRepository{ get { return new SysLogRepository(); } }
		public ISysActionRepository SysActionRepository{ get { return new SysActionRepository(); } }
		public ISysModuleRepository SysModuleRepository{ get { return new SysModuleRepository(); } }
		public IModuleActionRepository ModuleActionRepository{ get { return new ModuleActionRepository(); } }
		public ISysGroupRepository SysGroupRepository{ get { return new SysGroupRepository(); } }
		public IGroupUserRepository GroupUserRepository{ get { return new GroupUserRepository(); } }
		public IGroupRoleRepository GroupRoleRepository{ get { return new GroupRoleRepository(); } }
		public IGroupModuleRepository GroupModuleRepository{ get { return new GroupModuleRepository(); } }
		public ISysRoleRepository SysRoleRepository{ get { return new SysRoleRepository(); } }
		public IRoleUserRepository RoleUserRepository{ get { return new RoleUserRepository(); } }
		public IRoleGroupRepository RoleGroupRepository{ get { return new RoleGroupRepository(); } }
		public IRoleModuleRepository RoleModuleRepository{ get { return new RoleModuleRepository(); } }
		public ISysUserRepository SysUserRepository{ get { return new SysUserRepository(); } }
		public IUserRoleRepository UserRoleRepository{ get { return new UserRoleRepository(); } }
		public IUserGroupRepository UserGroupRepository{ get { return new UserGroupRepository(); } }
		public IUserModuleRepository UserModuleRepository{ get { return new UserModuleRepository(); } }
	}
}
