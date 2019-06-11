	//控制器
    var RoleModule = new RoleModule {    
        RoleId = query.RoleId,
        ModuleId = query.ModuleId,
        ActionId = query.ActionId,
    };

	//ui	
	$("#eRoleId").val(data.Content.RoleId);
$("#eModuleId").val(data.Content.ModuleId);
$("#eActionId").val(data.Content.ActionId);

