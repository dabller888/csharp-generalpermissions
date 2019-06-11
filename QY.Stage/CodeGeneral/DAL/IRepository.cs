using QY.Stage.Model.PocoModel;
namespace QY.Stage.IDAL
{   
    public partial interface ISysDepartmentRepository : IBaseRepository<SysDepartment> { }
    public partial interface ISysLogRepository : IBaseRepository<SysLog> { }
    public partial interface ISysActionRepository : IBaseRepository<SysAction> { }
    public partial interface ISysModuleRepository : IBaseRepository<SysModule> { }
    public partial interface IModuleActionRepository : IBaseRepository<ModuleAction> { }
    public partial interface ISysGroupRepository : IBaseRepository<SysGroup> { }
    public partial interface IGroupUserRepository : IBaseRepository<GroupUser> { }
    public partial interface IGroupRoleRepository : IBaseRepository<GroupRole> { }
    public partial interface IGroupModuleRepository : IBaseRepository<GroupModule> { }
    public partial interface ISysRoleRepository : IBaseRepository<SysRole> { }
    public partial interface IRoleUserRepository : IBaseRepository<RoleUser> { }
    public partial interface IRoleGroupRepository : IBaseRepository<RoleGroup> { }
    public partial interface IRoleModuleRepository : IBaseRepository<RoleModule> { }
    public partial interface ISysUserRepository : IBaseRepository<SysUser> { }
    public partial interface IUserRoleRepository : IBaseRepository<UserRole> { }
    public partial interface IUserGroupRepository : IBaseRepository<UserGroup> { }
    public partial interface IUserModuleRepository : IBaseRepository<UserModule> { }
}