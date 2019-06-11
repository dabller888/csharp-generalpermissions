 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using QY.Stage.Model.PocoModel;
namespace QY.Stage.IBLL
{
    public partial interface ISysDepartmentService : IBaseService<SysDepartment> { }
    public partial interface ISysLogService : IBaseService<SysLog> { }
    public partial interface ISysActionService : IBaseService<SysAction> { }
    public partial interface ISysModuleService : IBaseService<SysModule> { }
    public partial interface IModuleActionService : IBaseService<ModuleAction> { }
    public partial interface ISysGroupService : IBaseService<SysGroup> { }
    public partial interface IGroupUserService : IBaseService<GroupUser> { }
    public partial interface IGroupRoleService : IBaseService<GroupRole> { }
    public partial interface IGroupModuleService : IBaseService<GroupModule> { }
    public partial interface ISysRoleService : IBaseService<SysRole> { }
    public partial interface IRoleUserService : IBaseService<RoleUser> { }
    public partial interface IRoleGroupService : IBaseService<RoleGroup> { }
    public partial interface IRoleModuleService : IBaseService<RoleModule> { }
    public partial interface ISysUserService : IBaseService<SysUser> { }
    public partial interface IUserRoleService : IBaseService<UserRole> { }
    public partial interface IUserGroupService : IBaseService<UserGroup> { }
    public partial interface IUserModuleService : IBaseService<UserModule> { }
}