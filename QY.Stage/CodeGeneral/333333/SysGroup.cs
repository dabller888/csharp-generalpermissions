	//控制器
    var SysGroup = new SysGroup {    
        GroupId = query.GroupId,
        GroupName = query.GroupName,
        GroupPId = query.GroupPId,
        CreateTime = query.CreateTime,
        GroupDesc = query.GroupDesc,
        IsDeleted = query.IsDeleted,
    };

	//ui	
	$("#eGroupId").val(data.Content.GroupId);
$("#eGroupName").val(data.Content.GroupName);
$("#eGroupPId").val(data.Content.GroupPId);
$("#eCreateTime").val(data.Content.CreateTime);
$("#eGroupDesc").val(data.Content.GroupDesc);
$("#eIsDeleted").val(data.Content.IsDeleted);

