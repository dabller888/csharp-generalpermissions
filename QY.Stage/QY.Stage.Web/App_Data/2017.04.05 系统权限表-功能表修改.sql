use master
go

create database myoadb
go

use myoadb
go

if exists(select * from sysobjects where name='SysUser')
	drop table SysUser
if exists(select * from sysobjects where name='UsrSessions')
	drop table UsrSessions

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

--系统动作（为兼容视图和操作权限控制，故增加如下字段）
/*==============================================================*/
/* Table: SysAction                                            */
/*==============================================================*/
create table SysAction (
   ActionId          int     identity(1,1)          not null,
   ModuleId			 int				  not null,--模块编号
   ActionName        varchar(128)         not null,
   ActionCode        varchar(64)          null,--Action方法名
   ButtonCode        varchar(64)          null,
   ParaName          varchar(64)          null,   
   ActionType        int				  not null default 0,--0视图权限，1-操作权限
   IsDeleted         int                  not null default 0,
   constraint PK_SYSACTION primary key nonclustered (ActionId)
)
go

--系统用户（增5个扩展字段）
/*==============================================================*/
/* Table: SysUser                                              */
/*==============================================================*/
create table SysUser (
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
   constraint PK_SYSUSER primary key nonclustered (UserId)
)
go


 Insert into SysUser (UserId,DeptId,LoginName,LoginPass,RealName,Sex,BirthDate,Address,Phone,Email,CreateTime,LoginTime,LastLoginTime,LoginCount,IsEnabled,IsDeleted,ExtendField1,ExtendField2,ExtendField3,ExtendField4,ExtendField5)
       values ( 1, 0, 'admin', 'rWgvg/EwJAA=', 'admin', 0, '2017/10/9', NULL, '18672981589', 'dabller888@163.com', '2017/10/9', '2017/10/9', '2017/10/9 2:55:12', 0, 1, 0 ,0,0,'','',''); 
