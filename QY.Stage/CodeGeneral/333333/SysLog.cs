	//控制器
    var SysLog = new SysLog {    
        LogId = query.LogId,
        OperType = query.OperType,
        LogDesc = query.LogDesc,
        UserId = query.UserId,
        IPAddress = query.IPAddress,
        MacAddress = query.MacAddress,
        OperTime = query.OperTime,
        IsDeleted = query.IsDeleted,
    };

	//ui	
	$("#eLogId").val(data.Content.LogId);
$("#eOperType").val(data.Content.OperType);
$("#eLogDesc").val(data.Content.LogDesc);
$("#eUserId").val(data.Content.UserId);
$("#eIPAddress").val(data.Content.IPAddress);
$("#eMacAddress").val(data.Content.MacAddress);
$("#eOperTime").val(data.Content.OperTime);
$("#eIsDeleted").val(data.Content.IsDeleted);

