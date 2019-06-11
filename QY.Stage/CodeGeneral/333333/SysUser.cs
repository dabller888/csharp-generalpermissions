	//控制器
    var SysUser = new SysUser {    
        UserId = query.UserId,
        DeptId = query.DeptId,
        LoginName = query.LoginName,
        LoginPass = query.LoginPass,
        RealName = query.RealName,
        Sex = query.Sex,
        BirthDate = query.BirthDate,
        Address = query.Address,
        Phone = query.Phone,
        Email = query.Email,
        CreateTime = query.CreateTime,
        LoginTime = query.LoginTime,
        LastLoginTime = query.LastLoginTime,
        LoginCount = query.LoginCount,
        IsEnabled = query.IsEnabled,
        IsDeleted = query.IsDeleted,
    };

	//ui	
	$("#eUserId").val(data.Content.UserId);
$("#eDeptId").val(data.Content.DeptId);
$("#eLoginName").val(data.Content.LoginName);
$("#eLoginPass").val(data.Content.LoginPass);
$("#eRealName").val(data.Content.RealName);
$("#eSex").val(data.Content.Sex);
$("#eBirthDate").val(data.Content.BirthDate);
$("#eAddress").val(data.Content.Address);
$("#ePhone").val(data.Content.Phone);
$("#eEmail").val(data.Content.Email);
$("#eCreateTime").val(data.Content.CreateTime);
$("#eLoginTime").val(data.Content.LoginTime);
$("#eLastLoginTime").val(data.Content.LastLoginTime);
$("#eLoginCount").val(data.Content.LoginCount);
$("#eIsEnabled").val(data.Content.IsEnabled);
$("#eIsDeleted").val(data.Content.IsDeleted);

