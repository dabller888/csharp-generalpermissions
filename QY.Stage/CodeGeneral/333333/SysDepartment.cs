	//控制器
    var SysDepartment = new SysDepartment {    
        DeptId = query.DeptId,
        DepartName = query.DepartName,
        DeptPId = query.DeptPId,
        DepartDesc = query.DepartDesc,
    };

	//ui	
	$("#eDeptId").val(data.Content.DeptId);
$("#eDepartName").val(data.Content.DepartName);
$("#eDeptPId").val(data.Content.DeptPId);
$("#eDepartDesc").val(data.Content.DepartDesc);

