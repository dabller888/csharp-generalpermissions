=============================建表=============================
/*==============================================================*/
/* use database                                                 */
/*==============================================================*/
use hggydb
go

/*==============================================================*/
/* drop tables                                                  */
/*==============================================================*/
if exists(select * from sysobjects where name='SysLog')
	drop table SysLog
if exists(select * from sysobjects where name='SysDepartment')
	drop table SysDepartment
if exists(select * from sysobjects where name='SysUser')
	drop table SysUser
if exists(select * from sysobjects where name='SysRole')
	drop table SysRole
if exists(select * from sysobjects where name='SysGroup')
	drop table SysGroup
if exists(select * from sysobjects where name='SysAction')
	drop table SysAction
if exists(select * from sysobjects where name='SysModule')
	drop table SysModule

if exists(select * from sysobjects where name='ModuleAction')
	drop table ModuleAction

if exists(select * from sysobjects where name='UserGroup')
	drop table UserGroup
if exists(select * from sysobjects where name='UserRole')
	drop table UserRole
if exists(select * from sysobjects where name='UserModule')
	drop table UserModule

if exists(select * from sysobjects where name='RoleUser')
	drop table RoleUser
if exists(select * from sysobjects where name='RoleGroup')
	drop table RoleGroup
if exists(select * from sysobjects where name='RoleModule')
	drop table RoleModule

if exists(select * from sysobjects where name='GroupUser')
	drop table GroupUser
if exists(select * from sysobjects where name='GroupRole')
	drop table GroupRole
if exists(select * from sysobjects where name='GroupModule')
	drop table GroupModule


--部门表
/*==============================================================*/
/* Table: SysDepartment                                        */
/*==============================================================*/
create table SysDepartment (
   DeptId              int identity(1,1)    not null,
   DepartName      varchar(64)          not null,
   DeptPId             int                  not null,
   DepartDesc      varchar(1024)        null,
   constraint PK_SYSDEPARTMENT primary key nonclustered (DeptId)
)
go

--系统日志
/*==============================================================*/
/* Table: SysLog								                  */
/*==============================================================*/
create table SysLog (
   LogId                int   identity(1,1)            not null,
   OperType          int                  not null,--0 登陆日志1 操作日志3异常日志',4 短信
   LogDesc           varchar(200)         null,
   UserId                int                  not null,
   IPAddress         varchar(60)          null,
   MacAddress        varchar(16)          null,
   OperTime          datetime         not null,
   IsDeleted         int                  not null default 0,
   constraint PK_SYSLOG primary key nonclustered (LogId)
)
go

--系统动作
/*==============================================================*/
/* Table: SysAction                                            */
/*==============================================================*/
create table SysAction (
   ActionId                int     identity(1,1)          not null,
   ActionName        varchar(128)         not null,
   ButtonCode        varchar(64)          null,
   ParaName          varchar(64)          null,
   IsDeleted         int                  not null default 0,
   constraint PK_SYSACTION primary key nonclustered (ActionId)
)
go

--系统模块
/*==============================================================*/
/* Table: SysModule                                              */
/*==============================================================*/
create table SysModule (
   ModuleId                int    identity(1,1) not null,
   ModuleName          varchar(64)          not null,
   ModuleUrl           varchar(1024)        null,
   ModulePId               int                  not null,
   ModuleLever         int                  not null,
   OrderNo           int                  not null,
   IsDeleted         int                  not null default 0,
   constraint PK_SYSMODULE primary key nonclustered (ModuleId)
)
go

--模块动作
/*==============================================================*/
/* Table: ModuleAction                                              */
/*==============================================================*/
create table ModuleAction (
   ModuleActionId                int    identity(1,1) not null,
   ModuleId               int					 not null,
   --a_cIds               varchar(500)					 not null,
   ActionId               int					 not null,
   constraint PK_SYSMODULEACTION primary key nonclustered (ModuleActionId,ModuleId,ActionId)
)
go

/*==============================================================*/
/* Table: SysGroup                                             */
/*==============================================================*/
create table SysGroup (
   GroupId                int   identity(1,1)            not null,
   GroupName         varchar(64)          not null,
   GroupPId               int                  not null,
   CreateTime        datetime             not null,
   GroupDesc         varchar(1024)        null,
   IsDeleted         int                  not null default 0,
   constraint PK_SYSGROUP primary key nonclustered (GroupId)
)
go

--组用户
/*==============================================================*/
/* Table: GroupUser                                            */
/*==============================================================*/
create table GroupUser (
   GroupId                int               not null,
   UserId                int               not null,
   constraint PK_GROUPUSER primary key nonclustered (GroupId, UserId)
)
go
--组角色
/*==============================================================*/
/* Table: GroupRole                                            */
/*==============================================================*/
create table GroupRole (
   GroupId                int               not null,
   RoleId                int               not null,
   constraint PK_GROUPROLE primary key nonclustered (GroupId, RoleId)
)
go
--组模块
/*==============================================================*/
/* Table: GroupModule                                            */
/*==============================================================*/
create table GroupModule (
   GroupId                int               not null,
   ModuleId                int               not null,
   ActionId                int               not null,
   constraint PK_GROUPMODULE primary key nonclustered (GroupId, ModuleId,ActionId)
)
go

--系统角色
/*==============================================================*/
/* Table: SysRole                                              */
/*==============================================================*/
create table SysRole (
   RoleId                int    identity(1,1) not null,
   RolePId               int					 not null,
   RoleName          varchar(64)          not null,
   CreateTime        datetime             not null,
   RoleDesc          varchar(200)         null,
   IsDeleted         int                  not null default 0,
   constraint PK_SYSROLE primary key nonclustered (RoleId)
)
go

--角色用户
/*==============================================================*/
/* Table: RoleUser                                            */
/*==============================================================*/
create table RoleUser (
   RoleId                int               not null,
   UserId                int               not null,
   constraint PK_ROLEUSER primary key nonclustered (RoleId, UserId)
)
go

--角色组
/*==============================================================*/
/* Table: RoleGroup                                            */
/*==============================================================*/
create table RoleGroup (
   RoleId                int               not null,
   GroupId                int               not null,
   constraint PK_ROLEGROUP primary key nonclustered (RoleId, GroupId)
)
go

--角色菜单
/*==============================================================*/
/* Table: RoleModule                                            */
/*==============================================================*/
create table RoleModule (
   RoleId                int               not null,
   ModuleId                int               not null,
   --a_cIds                varchar(500)               not null,
   ActionId                int               not null,
   constraint PK_ROLEMODULE primary key nonclustered (RoleId, ModuleId,ActionId)
)
go


--系统用户
/*==============================================================*/
/* Table: SysUser                                              */
/*==============================================================*/
create table SysUser (
   UserId                int					 identity(1,1) not null,
   DeptId              int					 not null,
   LoginName         varchar(64)          not null,
   LoginPass         varchar(512)          not null,
   RealName          varchar(20)          not null,
   Sex				char(2)				 not null,
   BirthDate         datetime			 not null,
   Address		varchar(200)	     null,
   Phone          varchar(64)          null,
   Email             varchar(64)          null,
   --u_iPic				image				 not null,--默认给一个图
   CreateTime        datetime             not null default getdate(),
   LoginTime         datetime             not null default getdate(),
   LastLoginTime     datetime             not null default getdate(),
   LoginCount        int					 not null,
   IsEnabled         int                  not null default 0,
   IsDeleted         int                  not null default 0,
   constraint PK_SYSUSER primary key nonclustered (UserId)
)
go

--用户角色
/*==============================================================*/
/* Table: UserRole                                           */
/*==============================================================*/
create table UserRole (
   UserId                int               not null,
   RoleId                int               not null,
   constraint PK_USERROLE primary key nonclustered (UserId, RoleId)
)
go

--用户组
/*==============================================================*/
/* Table: UserGroup                                           */
/*==============================================================*/
create table UserGroup (
   UserId                int               not null,
   GroupId                int               not null,
   constraint PK_USERGROUP primary key nonclustered (UserId, GroupId)
)
go

--用户菜单
/*==============================================================*/
/* Table: UserModule                                           */
/*==============================================================*/
create table UserModule (
   UserId                int               not null,
   ModuleId                int               not null,
   ActionId                int               not null,
   constraint PK_USERMODULE primary key nonclustered (UserId, ModuleId)
)
go

=============================初始化数据=============================
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
/*---------SysAction-----------*/
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 1, '添加', 'btnAdd', 'add', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 2, '删除', 'btnDelete', 'delete', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 3, '修改', 'btnEdit', 'edit', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 4, '查询', 'btnSearch', 'search', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 5, '详情', 'btnShow', 'show', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 6, '启用', 'btnEnable', 'enable', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 7, '修改密码', 'btnPasswd', 'passwd', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 8, '打印', 'btnPrint', 'print', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 9, '导入', 'btnImport', 'import', 0 ); 
 Insert into SysAction (ActionId,ActionName,ButtonCode,ParaName,IsDeleted)
       values ( 10, '导出', 'btnExport', 'export', 0 ); 
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