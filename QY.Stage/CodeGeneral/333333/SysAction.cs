	//控制器
    var SysAction = new SysAction {    
        ActionId = query.ActionId,
        ActionName = query.ActionName,
        ButtonCode = query.ButtonCode,
        ParaName = query.ParaName,
        IsDeleted = query.IsDeleted,
    };

	//ui	
	$("#eActionId").val(data.Content.ActionId);
$("#eActionName").val(data.Content.ActionName);
$("#eButtonCode").val(data.Content.ButtonCode);
$("#eParaName").val(data.Content.ParaName);
$("#eIsDeleted").val(data.Content.IsDeleted);

