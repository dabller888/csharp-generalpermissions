	//控制器
    var GroupModule = new GroupModule {    
        GroupId = query.GroupId,
        ModuleId = query.ModuleId,
        ActionId = query.ActionId,
    };

	//ui	
	$("#eGroupId").val(data.Content.GroupId);
$("#eModuleId").val(data.Content.ModuleId);
$("#eActionId").val(data.Content.ActionId);

