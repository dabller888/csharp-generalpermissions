	//控制器
    var UserModule = new UserModule {    
        UserId = query.UserId,
        ModuleId = query.ModuleId,
        ActionId = query.ActionId,
    };

	//ui	
	$("#eUserId").val(data.Content.UserId);
$("#eModuleId").val(data.Content.ModuleId);
$("#eActionId").val(data.Content.ActionId);

