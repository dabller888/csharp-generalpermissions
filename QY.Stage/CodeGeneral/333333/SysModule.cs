	//控制器
    var SysModule = new SysModule {    
        ModuleId = query.ModuleId,
        ModuleName = query.ModuleName,
        ModuleUrl = query.ModuleUrl,
        ModulePId = query.ModulePId,
        ModuleLever = query.ModuleLever,
        OrderNo = query.OrderNo,
        IsDeleted = query.IsDeleted,
    };

	//ui	
	$("#eModuleId").val(data.Content.ModuleId);
$("#eModuleName").val(data.Content.ModuleName);
$("#eModuleUrl").val(data.Content.ModuleUrl);
$("#eModulePId").val(data.Content.ModulePId);
$("#eModuleLever").val(data.Content.ModuleLever);
$("#eOrderNo").val(data.Content.OrderNo);
$("#eIsDeleted").val(data.Content.IsDeleted);

