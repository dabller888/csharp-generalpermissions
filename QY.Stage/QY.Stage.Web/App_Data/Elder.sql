/**
老人数据
编号
序号
姓名
身份证号码
性别(0-男，1-女，2-不详)
年龄
家庭住址
邮编
联系电话
描述
二维码地址
第一联系人姓名
第一联系人性别
第一联系人属性（0-父亲，1-母亲，2-儿子，3-女儿，4-其他）
第一联系人电话
第一联系人住址
第一联系人邮编
第一联系人姓名
第二联系人性别
第二联系人属性（0-父亲，1-母亲，2-儿子，3-女儿，4-其他）
第二联系人电话
第二联系人住址
第二联系人邮编
创建时间
数据标志（0-导入xls，1-后台录入）
启用标志
删除标志
**/

if exists(select * from sysobjects where name='Elder')
	drop table Elder
go
--部门表
/*==============================================================*/
/* Table: Elder                                        */
/*==============================================================*/
create table Elder (
   ElderId              int identity(1,1)    not null,
   SerialNo             varchar(16)			 null,--2017091400000001
   ElderName			varchar(64)          not null,
   CardNo				varchar(18)			 not null,
   Sex					int					 not null default(0),
   Age					int					 not null default(1),
   Addr					varchar(1024)		 null,
   Post					varchar(6)			 null,
   Phone				varchar(11)			 null,
   Content				varchar(max)		 null,
   QRCode				varchar(128)		 null,
   FirstName			varchar(64)			 not null,
   FirstSex				int					 not null default(0),
   FirstAddr			varchar(1024)		 null,
   FirstPost			varchar(6)			 null,
   FirstPhone			varchar(11)			 not null,
   FirstRelation		int					 not null,
   SecName				varchar(64)			 null,
   SecSex				int					 not null default(0),
   SecAddr				varchar(1024)		 null,
   SecPost				varchar(6)			 null,
   SecPhone				varchar(11)			 null,
   SecRelation			int					 null,
   CreateTime			datetime			 not null,
   DataFlag				int					 not null default(1),
   IsEnable				int					 not null default(0),
   IsDelete				int					 not null default(0),
   constraint PK_Elder primary key nonclustered (ElderId)
)
go