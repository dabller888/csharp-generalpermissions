	//控制器
    var SysRole = new SysRole {    
        RoleId = query.RoleId,
        RolePId = query.RolePId,
        RoleName = query.RoleName,
        CreateTime = query.CreateTime,
        RoleDesc = query.RoleDesc,
        IsDeleted = query.IsDeleted,
    };

	//ui	
	$("#eRoleId").val(data.Content.RoleId);
$("#eRolePId").val(data.Content.RolePId);
$("#eRoleName").val(data.Content.RoleName);
$("#eCreateTime").val(data.Content.CreateTime);
$("#eRoleDesc").val(data.Content.RoleDesc);
$("#eIsDeleted").val(data.Content.IsDeleted);

