/*---------GroupModule-----------*/
/*---------GroupRole-----------*/
/*---------GroupUser-----------*/
/*---------ModuleAction-----------*/
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 1, 2, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 2, 3, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 3, 3, 2 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 4, 3, 3 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 6, 4, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 7, 4, 2 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 9, 4, 3 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 10, 5, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 11, 5, 2 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 12, 5, 3 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 14, 6, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 15, 6, 2 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 16, 6, 3 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 18, 7, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 22, 8, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 23, 8, 2 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 26, 11, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 27, 11, 2 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 30, 12, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 34, 13, 1 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 35, 13, 2 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 36, 13, 3 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 37, 13, 4 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 38, 3, 4 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 39, 3, 6 ); 
 Insert into ModuleAction (ModuleActionId,ModuleId,ActionId)
       values ( 40, 3, 7 ); 
/*---------RoleGroup-----------*/
/*---------RoleModule-----------*/
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 2, 0 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 1 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 2 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 3 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 4 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 6 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 7 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 4, 1 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 4, 2 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 4, 3 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 5, 1 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 5, 2 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 5, 3 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 6, 1 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 6, 2 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 6, 3 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 7, 1 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 8, 1 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 8, 2 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 11, 1 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 11, 2 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 12, 0 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 13, 1 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 13, 2 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 13, 3 ); 
 Insert into RoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 13, 4 ); 
/*---------RoleUser-----------*/

 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 1, 2, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 2, 2, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 3, 2, '修改', NULL, 'btnEdit', 'edit', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 4, 2, '查询', NULL, 'btnSearch', 'search', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 5, 2, '修改密码', NULL, 'btnPasswd', 'passwd', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 6, 2, '启用', NULL, 'btnEnable', 'enable', 0, 0 ); 
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 7, 3, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 8, 3, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 9, 3, '修改', NULL, 'btnEdit', 'edit', 0, 0 ); 	 
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 10, 4, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 11, 4, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 12, 4, '修改', NULL, 'btnEdit', 'edit', 0, 0 ); 	
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 13, 5, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 14, 5, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 15, 5, '修改', NULL, 'btnEdit', 'edit', 0, 0 ); 	
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 16, 6, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 	  
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 17, 7, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 	   
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 18, 7, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 19, 8, '添加', NULL, 'btnAdd', 'add', 0, 0 );
 Insert into SysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 20, 8, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 	




/*---------SysDepartment-----------*/
/*---------SysGroup-----------*/
/*---------SysLog-----------*/
/*---------SysModule-----------*/
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 2, '系统管理', NULL, 0, 1, 1, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 3, '系统用户管理', '/Back/System/UserList', 2, 1, 1, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 4, '系统角色管理', '/Back/System/RoleList', 2, 2, 2, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 5, '系统模块管理', '/Back/System/ModuleList', 2, 3, 3, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 6, '系统功能管理', '/Back/System/ActionList', 2, 4, 4, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 7, '角色模块管理', '/Back/System/RoleModule', 2, 5, 5, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 8, '模块功能管理', '/Back/System/ModuleAction', 2, 6, 6, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 11, '用户角色管理', '/Back/System/UserRole', 2, 7, 7, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 12, '老人管理', NULL, 0, 2, 2, 0 ); 
 Insert into SysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 13, '老人信息管理', '/Back/Elder/ElderList', 12, 1, 1, 0 ); 
/*---------SysRole-----------*/
 Insert into SysRole (RoleId,RolePId,RoleName,CreateTime,RoleDesc,IsDeleted)
       values ( 1, 0, '超级管理员', '2017/10/9', NULL, 0 ); 
/*---------SysUser-----------*/
 Insert into SysUser (UserId,DeptId,LoginName,LoginPass,RealName,Sex,BirthDate,Address,Phone,Email,CreateTime,LoginTime,LastLoginTime,LoginCount,IsEnabled,IsDeleted)
       values ( 1, 0, 'admin', '/qUm9pqRJuk=', 'admin', 0, '2017/10/9', NULL, '18672981589', 'dabller888@163.com', '2017/10/9', '2017/10/9', '2017/10/9 2:55:12', 0, 1, 0 ); 
/*---------UserGroup-----------*/
/*---------UserModule-----------*/
/*---------UserRole-----------*/
 Insert into UserRole (UserId,RoleId)
       values ( 1, 1 ); 