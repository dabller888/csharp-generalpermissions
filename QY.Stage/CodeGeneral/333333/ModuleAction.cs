	//控制器
    var ModuleAction = new ModuleAction {    
        ModuleActionId = query.ModuleActionId,
        ModuleId = query.ModuleId,
        ActionId = query.ActionId,
    };

	//ui	
	$("#eModuleActionId").val(data.Content.ModuleActionId);
$("#eModuleId").val(data.Content.ModuleId);
$("#eActionId").val(data.Content.ActionId);

