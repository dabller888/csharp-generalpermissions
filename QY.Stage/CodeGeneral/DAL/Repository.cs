using QY.Stage.IDAL;
using QY.Stage.Model.PocoModel;

namespace QY.Stage.DAL
{
    public partial class SysDepartmentRepository : BaseRepository<SysDepartment>,ISysDepartmentRepository { }
    public partial class SysLogRepository : BaseRepository<SysLog>,ISysLogRepository { }
    public partial class SysActionRepository : BaseRepository<SysAction>,ISysActionRepository { }
    public partial class SysModuleRepository : BaseRepository<SysModule>,ISysModuleRepository { }
    public partial class ModuleActionRepository : BaseRepository<ModuleAction>,IModuleActionRepository { }
    public partial class SysGroupRepository : BaseRepository<SysGroup>,ISysGroupRepository { }
    public partial class GroupUserRepository : BaseRepository<GroupUser>,IGroupUserRepository { }
    public partial class GroupRoleRepository : BaseRepository<GroupRole>,IGroupRoleRepository { }
    public partial class GroupModuleRepository : BaseRepository<GroupModule>,IGroupModuleRepository { }
    public partial class SysRoleRepository : BaseRepository<SysRole>,ISysRoleRepository { }
    public partial class RoleUserRepository : BaseRepository<RoleUser>,IRoleUserRepository { }
    public partial class RoleGroupRepository : BaseRepository<RoleGroup>,IRoleGroupRepository { }
    public partial class RoleModuleRepository : BaseRepository<RoleModule>,IRoleModuleRepository { }
    public partial class SysUserRepository : BaseRepository<SysUser>,ISysUserRepository { }
    public partial class UserRoleRepository : BaseRepository<UserRole>,IUserRoleRepository { }
    public partial class UserGroupRepository : BaseRepository<UserGroup>,IUserGroupRepository { }
    public partial class UserModuleRepository : BaseRepository<UserModule>,IUserModuleRepository { }
}