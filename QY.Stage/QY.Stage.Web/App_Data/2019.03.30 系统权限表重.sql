/*=============================建表=============================*/
use master
go

create database dbTest
go

/*==============================================================*/
/* use database                                                 */
/*==============================================================*/
use dbTest
go

/*==============================================================*/
/* drop tables                                                  */
/*==============================================================*/
if exists(select * from sysobjects where name='BaseSysLog')
	drop table BaseSysLog
if exists(select * from sysobjects where name='BaseSysDepartment')
	drop table BaseSysDepartment
if exists(select * from sysobjects where name='BaseSysUser')
	drop table BaseSysUser
if exists(select * from sysobjects where name='BaseSysRole')
	drop table BaseSysRole
if exists(select * from sysobjects where name='BaseSysGroup')
	drop table BaseSysGroup
if exists(select * from sysobjects where name='BaseSysAction')
	drop table BaseSysAction
if exists(select * from sysobjects where name='BaseSysModule')
	drop table BaseSysModule

if exists(select * from sysobjects where name='BaseModuleAction')
	drop table BaseModuleAction

if exists(select * from sysobjects where name='BaseUserGroup')
	drop table BaseUserGroup
if exists(select * from sysobjects where name='UserRole')
	drop table UserRole
if exists(select * from sysobjects where name='BaseUserModule')
	drop table BaseUserModule

if exists(select * from sysobjects where name='BaseRoleUser')
	drop table BaseRoleUser
if exists(select * from sysobjects where name='BaseRoleGroup')
	drop table BaseRoleGroup
if exists(select * from sysobjects where name='BaseRoleModule')
	drop table BaseRoleModule

if exists(select * from sysobjects where name='BaseGroupUser')
	drop table BaseGroupUser
if exists(select * from sysobjects where name='BaseGroupRole')
	drop table BaseGroupRole
if exists(select * from sysobjects where name='BaseGroupModule')
	drop table BaseGroupModule

if exists(select * from sysobjects where name='UsrSessions')
	drop table UsrSessions
	
--部门表
/*==============================================================*/
/* Table: BaseSysDepartment                                        */
/*==============================================================*/
create table BaseSysDepartment (
   DeptId              int identity(1,1)    not null,
   DepartName      varchar(64)          not null,
   DeptPId             int                  not null,
   DepartDesc      varchar(1024)        null,
   constraint PK_BASEBASESYSDEPARTMENT primary key nonclustered (DeptId)
)
go

--系统日志
/*==============================================================*/
/* Table: BaseSysLog								                  */
/*==============================================================*/
create table BaseSysLog (
   LogId                int   identity(1,1)            not null,
   OperType          int                  not null,--0 登陆日志1 操作日志3异常日志',4 短信
   LogDesc           varchar(200)         null,
   UserId                int                  not null,
   IPAddress         varchar(60)          null,
   MacAddress        varchar(16)          null,
   OperTime          datetime         not null,
   IsDeleted         int                  not null default 0,
   constraint PK_BASESYSLOG primary key nonclustered (LogId)
)
go

--系统动作
/*==============================================================*/
/* Table: BaseSysAction                                            */
/*==============================================================*/
create table BaseSysAction (
   ActionId          int     identity(1,1)          not null,
   ModuleId			 int				  not null,--模块编号
   ActionName        varchar(128)         not null,
   ActionCode        varchar(64)          null,--Action方法名
   ButtonCode        varchar(64)          null,
   ParaName          varchar(64)          null,   
   ActionType        int				  not null default 0,--0视图权限，1-操作权限
   IsDeleted         int                  not null default 0,
   constraint PK_BASESYSACTION primary key nonclustered (ActionId)
)
go

--系统模块
/*==============================================================*/
/* Table: BaseSysModule                                              */
/*==============================================================*/
create table BaseSysModule (
   ModuleId                int    identity(1,1) not null,
   ModuleName          varchar(64)          not null,
   ModuleUrl           varchar(1024)        null,
   ModulePId               int                  not null,
   ModuleLever         int                  not null,
   OrderNo           int                  not null,
   IsDeleted         int                  not null default 0,
   constraint PK_BASESYSMODULE primary key nonclustered (ModuleId)
)
go

--模块动作
/*==============================================================*/
/* Table: BaseModuleAction                                              */
/*==============================================================*/
create table BaseModuleAction (
   ModuleActionId                int    identity(1,1) not null,
   ModuleId               int					 not null,
   --a_cIds               varchar(500)					 not null,
   ActionId               int					 not null,
   constraint PK_BASESYSMODULEACTION primary key nonclustered (ModuleActionId,ModuleId,ActionId)
)
go

/*==============================================================*/
/* Table: BaseSysGroup                                             */
/*==============================================================*/
create table BaseSysGroup (
   GroupId                int   identity(1,1)            not null,
   GroupName         varchar(64)          not null,
   GroupPId               int                  not null,
   CreateTime        datetime             not null,
   GroupDesc         varchar(1024)        null,
   IsDeleted         int                  not null default 0,
   constraint PK_BASESYSGROUP primary key nonclustered (GroupId)
)
go

--组用户
/*==============================================================*/
/* Table: BaseGroupUser                                            */
/*==============================================================*/
create table BaseGroupUser (
   GroupId                int               not null,
   UserId                int               not null,
   constraint PK_BASEGROUPUSER primary key nonclustered (GroupId, UserId)
)
go
--组角色
/*==============================================================*/
/* Table: BaseGroupRole                                            */
/*==============================================================*/
create table BaseGroupRole (
   GroupId                int               not null,
   RoleId                int               not null,
   constraint PK_BASEGROUPROLE primary key nonclustered (GroupId, RoleId)
)
go
--组模块
/*==============================================================*/
/* Table: BaseGroupModule                                            */
/*==============================================================*/
create table BaseGroupModule (
   GroupId                int               not null,
   ModuleId                int               not null,
   ActionId                int               not null,
   constraint PK_BASEGROUPMODULE primary key nonclustered (GroupId, ModuleId,ActionId)
)
go

--系统角色
/*==============================================================*/
/* Table: BaseSysRole                                              */
/*==============================================================*/
create table BaseSysRole (
   RoleId                int    identity(1,1) not null,
   RolePId               int					 not null,
   RoleName          varchar(64)          not null,
   CreateTime        datetime             not null,
   RoleDesc          varchar(200)         null,
   IsDeleted         int                  not null default 0,
   constraint PK_BASESYSROLE primary key nonclustered (RoleId)
)
go

--角色用户
/*==============================================================*/
/* Table: BaseRoleUser                                            */
/*==============================================================*/
create table BaseRoleUser (
   RoleId                int               not null,
   UserId                int               not null,
   constraint PK_BASEROLEUSER primary key nonclustered (RoleId, UserId)
)
go

--角色组
/*==============================================================*/
/* Table: BaseRoleGroup                                            */
/*==============================================================*/
create table BaseRoleGroup (
   RoleId                int               not null,
   GroupId                int               not null,
   constraint PK_BASEROLEGROUP primary key nonclustered (RoleId, GroupId)
)
go

--角色菜单
/*==============================================================*/
/* Table: BaseRoleModule                                            */
/*==============================================================*/
create table BaseRoleModule (
   RoleId                int               not null,
   ModuleId                int               not null,
   --a_cIds                varchar(500)               not null,
   ActionId                int               not null,
   constraint PK_BASEROLEMODULE primary key nonclustered (RoleId, ModuleId,ActionId)
)
go


--系统用户
/*==============================================================*/
/* Table: BaseSysUser                                              */
/*==============================================================*/
create table BaseSysUser (
   UserId            int					 identity(1,1) not null,
   DeptId            int					 not null,
   LoginName         varchar(64)          not null,
   LoginPass         varchar(512)          not null,
   RealName          varchar(20)          not null,
   Sex				 char(2)				 not null,
   BirthDate         datetime			 not null,
   Address			 varchar(200)	     null,
   Phone			 varchar(64)          null,
   Email             varchar(64)          null,
   --u_iPic				image				 not null,--默认给一个图
   CreateTime        datetime             not null default getdate(),
   LoginTime         datetime             not null default getdate(),
   LastLoginTime     datetime             not null default getdate(),
   LoginCount        int					 not null,
   IsEnabled         int                  not null default 0,
   IsDeleted         int                  not null default 0,
   ExtendField1		 int				  not null default 0,--扩展字段1
   ExtendField2		 int				  not null  default 0,--扩展字段2
   ExtendField3		 varchar(64)		  null,--扩展字段3
   ExtendField4		 varchar(64)		  null,--扩展字段4
   ExtendField5		 varchar(200)		  null,--扩展字段5
   constraint PK_BASESYSUSER primary key nonclustered (UserId)
)
go

--用户角色
/*==============================================================*/
/* Table: BaseUserRole                                           */
/*==============================================================*/
create table BaseUserRole (
   UserId                int               not null,
   RoleId                int               not null,
   constraint PK_BASEUSERROLE primary key nonclustered (UserId, RoleId)
)
go

--用户组
/*==============================================================*/
/* Table: BaseUserGroup                                           */
/*==============================================================*/
create table BaseUserGroup (
   UserId                int               not null,
   GroupId                int               not null,
   constraint PK_BASEUSERGROUP primary key nonclustered (UserId, GroupId)
)
go

--用户菜单
/*==============================================================*/
/* Table: BaseUserModule                                           */
/*==============================================================*/
create table BaseUserModule (
   UserId                int               not null,
   ModuleId                int               not null,
   ActionId                int               not null,
   constraint PK_BASEUSERMODULE primary key nonclustered (UserId, ModuleId)
)
go

--用户Session表
/*==============================================================*/
/* Table: UsrSessions                                        */
/*==============================================================*/
create table UsrSessions (
   Id                     varchar(64)		 not null,
   LastTime			      bigint			 not null,
   Content				  varchar(1024)      not null,
   UserId				  int		         not null
   )
go

/*=============================初始化数据=============================*/
/*---------BaseGroupModule-----------*/
/*---------BaseGroupRole-----------*/
/*---------BaseGroupUser-----------*/
/*---------BaseModuleAction-----------*/
/*---------BaseRoleGroup-----------*/
/*---------BaseRoleModule-----------*/
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 1, 0 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 2, 1 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 2, 2 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 2, 3 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 2, 4 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 2, 5 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 2, 6 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 7 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 8 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 3, 9 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 4, 10 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 4, 11 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 4, 12 );
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 5, 13 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 5, 14 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 5, 15 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 6, 16 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 7, 17 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 7, 18 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 8, 19 ); 
 Insert into BaseRoleModule (RoleId,ModuleId,ActionId)
       values ( 1, 8, 20 ); 
/*---------BaseRoleUser-----------*/
/*---------BaseSysAction-----------*/
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 1, 2, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 2, 2, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 3, 2, '修改', NULL, 'btnEdit', 'edit', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 4, 2, '查询', NULL, 'btnSearch', 'search', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 5, 2, '修改密码', NULL, 'btnPasswd', 'passwd', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 6, 2, '启用', NULL, 'btnEnable', 'enable', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 7, 3, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 8, 3, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 9, 3, '修改', NULL, 'btnEdit', 'edit', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 10, 4, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 11, 4, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 12, 4, '修改', NULL, 'btnEdit', 'edit', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 13, 5, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 14, 5, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 15, 5, '修改', NULL, 'btnEdit', 'edit', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 16, 6, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 17, 7, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 18, 7, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 19, 8, '添加', NULL, 'btnAdd', 'add', 0, 0 ); 
 Insert into BaseSysAction (ActionId,ModuleId,ActionName,ActionCode,ButtonCode,ParaName,ActionType,IsDeleted)
       values ( 20, 8, '删除', NULL, 'btnDelete', 'delete', 0, 0 ); 
/*---------BaseSysDepartment-----------*/
/*---------BaseSysGroup-----------*/
/*---------BaseSysLog-----------*/
/*---------BaseSysModule-----------*/
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 1, '系统管理', NULL, 0, 1, 1, 0 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 2, '系统用户管理', '/Back/System/UserList', 1, 1, 1, 0 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 3, '系统角色管理', '/Back/System/RoleList', 1, 2, 2, 0 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 4, '系统模块管理', '/Back/System/ModuleList', 1, 3, 3, 0 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 5, '系统功能管理', '/Back/System/ActionList', 1, 4, 4, 0 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 6, '角色模块管理', '/Back/System/RoleModule', 1, 5, 5, 0 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 7, '模块功能管理', '/Back/System/ModuleAction', 1, 6, 6, 1 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 8, '用户角色管理', '/Back/System/UserRole', 1, 7, 7, 0 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 9, '老人管理', NULL, 0, 2, 2, 0 ); 
 Insert into BaseSysModule (ModuleId,ModuleName,ModuleUrl,ModulePId,ModuleLever,OrderNo,IsDeleted)
       values ( 10, '老人信息管理', '/Back/Elder/ElderList', 9, 1, 1, 0 ); 
/*---------BaseSysRole-----------*/
 Insert into BaseSysRole (RoleId,RolePId,RoleName,CreateTime,RoleDesc,IsDeleted)
       values ( 1, 0, '超级管理员', '2018/2/7 3:28:59', NULL, 0 ); 
 Insert into BaseSysRole (RoleId,RolePId,RoleName,CreateTime,RoleDesc,IsDeleted)
       values ( 2, 0, '普通管理员', '2019/3/30 4:59:42', '普通管理员', 0 ); 
/*---------BaseSysUser-----------*/
 Insert into BaseSysUser (UserId,DeptId,LoginName,LoginPass,RealName,Sex,BirthDate,Address,Phone,Email,CreateTime,LoginTime,LastLoginTime,LoginCount,IsEnabled,IsDeleted,ExtendField1,ExtendField2,ExtendField3,ExtendField4,ExtendField5)
       values ( 1, 0, 'admin', 'rWgvg/EwJAA=', 'admin', '0', '2017/10/9', NULL, '18672981589', 'dabller888@163.com', '2017/10/9', '2017/10/9', '2017/10/9 2:55:12', 0, 1, 0, 0, 0, NULL, NULL, NULL ); 
/*---------BaseUserGroup-----------*/
/*---------BaseUserModule-----------*/
/*---------BaseUserRole-----------*/
 Insert into BaseUserRole (UserId,RoleId)
       values ( 1, 1 ); 

