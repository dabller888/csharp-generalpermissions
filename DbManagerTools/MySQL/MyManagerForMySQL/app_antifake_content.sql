# SQL Manager 2005 for MySQL 3.6.5.8
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : mas


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `mas`;

CREATE DATABASE `mas`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `mas`;

#
# Structure for the `app_antifake_content` table :
#

DROP TABLE IF EXISTS `app_antifake_content`;

CREATE TABLE `app_antifake_content` (
  `id` int(11) NOT NULL auto_increment,
  `integralMark` int(11) NOT NULL COMMENT '积分级别',
  `Content` varchar(1500) NOT NULL COMMENT '积分到达该级别的手机号码用户，收到的短信内容',
  `enabled` int(1) default '1' COMMENT '是否开启',
  `issms` int(11) default '0' COMMENT '是否发送过短信，默认为0没有发送，1为已经发送',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_antifake_encourage` table :
#

DROP TABLE IF EXISTS `app_antifake_encourage`;

CREATE TABLE `app_antifake_encourage` (
  `id` int(11) NOT NULL auto_increment,
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `markid` int(11) NOT NULL COMMENT '积分级别编号',
  `issms` int(1) NOT NULL COMMENT '是否发送过奖励，0没有发送，1发送',
  `smscontent` varchar(1500) NOT NULL COMMENT '奖励内容',
  `createdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '奖励时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_antifake_functionset` table :
#

DROP TABLE IF EXISTS `app_antifake_functionset`;

CREATE TABLE `app_antifake_functionset` (
  `id` int(11) NOT NULL auto_increment,
  `Defaultintegral` int(11) NOT NULL COMMENT '产品默认积分规则',
  `Startup` int(1) NOT NULL COMMENT '是否启动积分机制',
  `command` varchar(30) NOT NULL COMMENT '短信防伪上行短息指令',
  `integralMark` int(11) NOT NULL default '500' COMMENT '积分级别，默认500',
  `Mark_Startup` int(1) NOT NULL default '1' COMMENT '是否启用该积分级别，默认为1启用，否则为0不启用',
  `integralMark2` int(11) NOT NULL default '1000' COMMENT '积分级别，默认1000',
  `Mark_Startup2` int(1) NOT NULL default '1' COMMENT '是否启用该积分级别，默认为1启用，否则为0不启用',
  `integralMark3` int(11) NOT NULL default '1500' COMMENT '积分级别，默认1500',
  `Mark_Startup3` int(1) NOT NULL default '1' COMMENT '是否启用该积分级别，默认为1启用，否则为0不启用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_antifake_productlist` table :
#

DROP TABLE IF EXISTS `app_antifake_productlist`;

CREATE TABLE `app_antifake_productlist` (
  `id` int(11) NOT NULL auto_increment,
  `Code` varchar(30) NOT NULL COMMENT '产品防伪编号',
  `Name` varchar(50) NOT NULL COMMENT '产品名称',
  `Integral` int(11) NOT NULL COMMENT '积分规则',
  `smsModel` varchar(1500) NOT NULL COMMENT '回复短信模板',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_antifake_querylist` table :
#

DROP TABLE IF EXISTS `app_antifake_querylist`;

CREATE TABLE `app_antifake_querylist` (
  `id` int(11) NOT NULL auto_increment,
  `Code` varchar(30) NOT NULL COMMENT '确认产品防伪编号',
  `mobile` varchar(20) NOT NULL COMMENT '查询手机号码',
  `Querydate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '查询时间',
  `integral` int(11) default '1' COMMENT '积分',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_meeting` table :
#

DROP TABLE IF EXISTS `app_meeting`;

CREATE TABLE `app_meeting` (
  `ID` int(11) NOT NULL auto_increment COMMENT '主键',
  `TITLE` varchar(50) default NULL COMMENT '会议名称',
  `CONTENT` varchar(4000) default NULL COMMENT '会议内容',
  `TIME` datetime default NULL COMMENT '会议时间',
  `ADDRESS` varchar(200) default NULL COMMENT '会议地点',
  `MASTER` varchar(20) default NULL COMMENT '会议主持',
  `CREATETIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `STATE` varchar(2) default '0' COMMENT '阅读状态',
  `WAKETIME` datetime default NULL COMMENT '提醒时间',
  `PHONEMAN` varchar(4000) default NULL COMMENT '参与人员手机号',
  `IsWake` tinyint(1) default '0' COMMENT '提醒状态',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议通知表';

#
# Structure for the `app_meeting_reply` table :
#

DROP TABLE IF EXISTS `app_meeting_reply`;

CREATE TABLE `app_meeting_reply` (
  `id` int(11) NOT NULL auto_increment,
  `meetingId` varchar(20) default NULL COMMENT '会议id',
  `mobile` varchar(20) default NULL COMMENT '手机号',
  `replyType` tinyint(4) default '0' COMMENT '回复状态，0-未回复，1-参加会议，2-不参加会议',
  `replyTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '回复时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议通知回复表';

#
# Structure for the `app_weblbs_cancel` table :
#

DROP TABLE IF EXISTS `app_weblbs_cancel`;

CREATE TABLE `app_weblbs_cancel` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `APPLICATIONID` varchar(16) default NULL COMMENT '应用标识',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '请求标识',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web wap lbs 取消表';

#
# Structure for the `app_weblbs_request` table :
#

DROP TABLE IF EXISTS `app_weblbs_request`;

CREATE TABLE `app_weblbs_request` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `MOBILE` varchar(255) default NULL COMMENT '定位的手机号码',
  `LOCTYPE` int(4) default NULL COMMENT '定位类型\r\n            1-CURRENT\r\n            2-LAST\r\n            3-CURRENT_OR_LAST\r\n            ',
  `PERIODIC` int(4) default NULL COMMENT '1-单次定位\r\n            2-周期定位',
  `FREQUENCY` int(4) default NULL COMMENT '通知的最大频率（单位为秒）\r\n            ',
  `DURATION` int(4) default NULL COMMENT '周期定位的时长（单位为秒）',
  `REQUESTEDACCURACY` int(4) default NULL COMMENT '请求的位置信息的精确度，用米表示',
  `ACCEPTABLEACCURACY` int(4) default NULL COMMENT '响应可接受的精确度，用米表示',
  `MAXIMUMAGE` int(4) default NULL COMMENT '返回的位置信息的最大可接受时限,用秒表示',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '请求时间',
  `RESPONSETIME` int(4) default NULL COMMENT '指示应用能接受的等待响应的最大时间，用秒表示',
  `APPLICATIONID` varchar(16) default NULL COMMENT '应用标识',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '标识某次请求',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web wap lbs 请求表';

#
# Structure for the `app_weblbs_result` table :
#

DROP TABLE IF EXISTS `app_weblbs_result`;

CREATE TABLE `app_weblbs_result` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `MOBILE` varchar(20) default NULL COMMENT '定位手机号码',
  `ERRORCODE` varchar(10) default NULL COMMENT '错误码',
  `ERRORMESSAGE` varchar(500) default NULL COMMENT '错误消息',
  `LONGTITUDE` varchar(40) default NULL COMMENT '经度',
  `LATITUDE` varchar(40) default NULL COMMENT '纬度',
  `ALTITUDE` varchar(40) default NULL COMMENT '海拔',
  `ACCURACY` varchar(40) default NULL COMMENT '精度(米)',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '请求时间',
  `UPDATETIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '更新时间',
  `APPLICATIONID` varchar(16) default NULL COMMENT '应用标识',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '请求标识',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web wap lbs 结果表';

#
# Structure for the `app_webmms_material` table :
#

DROP TABLE IF EXISTS `app_webmms_material`;

CREATE TABLE `app_webmms_material` (
  `id` int(11) NOT NULL auto_increment,
  `materialName` varchar(20) default NULL COMMENT '素材名称',
  `materialType` int(11) default NULL COMMENT '素材类型 1图片2声音',
  `materialPath` mediumtext COMMENT '路径',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

#
# Structure for the `app_webmms_materialinfo` table :
#

DROP TABLE IF EXISTS `app_webmms_materialinfo`;

CREATE TABLE `app_webmms_materialinfo` (
  `id` int(11) NOT NULL auto_increment,
  `materialName` varchar(20) default NULL COMMENT '素材名称',
  `materialPath` mediumtext COMMENT '路径',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `materialSize` int(11) default '0' COMMENT '素材大小',
  `materialType` int(11) default NULL COMMENT '1图片2声音3文字',
  `parentId` int(11) default NULL COMMENT '素材组的id号',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

#
# Structure for the `app_webmms_mo` table :
#

DROP TABLE IF EXISTS `app_webmms_mo`;

CREATE TABLE `app_webmms_mo` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  `DEST_ADDR` varchar(21) default NULL COMMENT '扩展号码（可以为空）',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `SUBJECT` varchar(500) default NULL COMMENT '彩信标题',
  `MESSAGE_CONTENT` mediumtext COMMENT 'MIME组包或SMIL格式文件',
  `MESSAGE_FILES` text COMMENT '接受的彩信文件所处路径列表',
  `RECEIVE_TIME` datetime NOT NULL COMMENT '彩信接收时间',
  `APPLICATION_ID` varchar(21) NOT NULL COMMENT 'EC/SI应用的ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS内部彩信接受表';

#
# Structure for the `app_webmms_model` table :
#

DROP TABLE IF EXISTS `app_webmms_model`;

CREATE TABLE `app_webmms_model` (
  `ID` int(20) NOT NULL auto_increment COMMENT '自动编号',
  `modelName` varchar(50) NOT NULL COMMENT '模板名称',
  `modelPath` mediumtext COMMENT '路径',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `mmsSize` float(9,3) NOT NULL default '0.000' COMMENT '彩信大小',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='彩信模板表';

#
# Structure for the `app_webmms_mt` table :
#

DROP TABLE IF EXISTS `app_webmms_mt`;

CREATE TABLE `app_webmms_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `USER_ID` int(11) default NULL COMMENT '用户id',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '扩展号',
  `DEST_ADDR` mediumtext NOT NULL COMMENT '接受手机MSISDN,多人用";"分割,最大不超过50人',
  `REQ_DELIVERY_REPORT` tinyint(4) NOT NULL default '0' COMMENT '是否需要发送报告(0=不需要 1=需要)',
  `SUBJECT` varchar(500) default NULL COMMENT '彩信标题',
  `MESSAGE_FILES` text COMMENT '发送彩信文件所处路径列表',
  `SEND_TIME` datetime NOT NULL COMMENT '定时发送时间',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `APPLICATION_ID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `STATE` int(11) default '1' COMMENT '发送状态 0.待发 1.已发',
  `TREEIDS` text COMMENT '树节点IDs',
  `TREECONTEXT` text COMMENT '树节点内容',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB彩信下行表';

#
# Structure for the `app_webmms_status` table :
#

DROP TABLE IF EXISTS `app_webmms_status`;

CREATE TABLE `app_webmms_status` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `STATUS` int(11) NOT NULL COMMENT '发送状态',
  `STATUS_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '接受状态时间',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  `MT_ID` bigint(20) NOT NULL COMMENT '引用app_webmms_mt表ID字段',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB短信下行状态表';

#
# Structure for the `app_websms_mo` table :
#

DROP TABLE IF EXISTS `app_websms_mo`;

CREATE TABLE `app_websms_mo` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `EX_CODE` varchar(21) default NULL COMMENT '扩展号',
  `CONTENT` text COMMENT '信息内容',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `RECEIVE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '接受时间',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS 产生的ID',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  `sendID` bigint(20) default '0' COMMENT '下行id',
  `USER_ID` int(11) default '0' COMMENT '用户ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_websms_mt` table :
#

DROP TABLE IF EXISTS `app_websms_mt`;

CREATE TABLE `app_websms_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `USER_ID` int(11) default NULL COMMENT '用户ID',
  `ORG_ID` int(11) default NULL COMMENT '组织机构ID',
  `EX_CODE` varchar(21) default NULL COMMENT '扩展号',
  `DEST_ADDR` mediumtext COMMENT '接受手机MSISDN,多人用";"分割',
  `STATUS` tinyint(4) default '0' COMMENT '短信发送状态',
  `PRIORITY` tinyint(4) default NULL COMMENT '信息优先级',
  `REQ_DELIVERY_REPORT` int(11) default '0' COMMENT '是否需要状态报告',
  `SUBJECT` varchar(256) default NULL COMMENT '信息主题',
  `CONTENT` text COMMENT '信息内容',
  `SEND_TIME` datetime default NULL COMMENT '定时发送时间',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '入库时间',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  `TREEIDS` text COMMENT '树节点IDs',
  `TREECONTEXT` text COMMENT '树节点内容',
  PRIMARY KEY  (`ID`),
  KEY `app_websms_mt_index` (`REQUEST_TIME`),
  KEY `APP_WEBSMS_MT_STATUS_SEND_TIME` (`STATUS`,`SEND_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB短信下行表';

#
# Structure for the `app_websms_status` table :
#

DROP TABLE IF EXISTS `app_websms_status`;

CREATE TABLE `app_websms_status` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `STATUS` int(11) NOT NULL COMMENT '发送状态',
  `STATUS_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '接受状态时间',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  `MT_ID` bigint(20) NOT NULL COMMENT '引用app_websms_mt表ID字段',
  PRIMARY KEY  (`ID`),
  KEY `app_websms_status_index` (`MAS_ID`),
  KEY `APP_WEBSMS_STATUS_MTID` (`MT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB短信下行状态表';

#
# Structure for the `app_webussd_subject` table :
#

DROP TABLE IF EXISTS `app_webussd_subject`;

CREATE TABLE `app_webussd_subject` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `OP_TYPE` tinyint(4) NOT NULL default '1' COMMENT '对话操作类型0x01（Request）：USSR（SP->USSDC）\r\n0x02（Notify）：USSN（SP->USSDC）\r\n',
  `OP_CODE` varchar(21) NOT NULL default '#' COMMENT '操作代码',
  `CONTENT` varchar(200) NOT NULL COMMENT 'USSD串的内容',
  `MSG_FMT` int(11) NOT NULL default '17' COMMENT 'Ussd串进行编码的格式,常用的编码格式包括：0x0F（7位编码）、0x11（16位编码）、0x44（8位编码）',
  `DESCRIPTION` varchar(100) default NULL COMMENT '描述',
  `PARENT_ID` int(11) NOT NULL default '0' COMMENT '父ID 引用app_webussd_subject的ID字段 0表示最顶层结点',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB USSD应用主题配置表';

#
# Structure for the `app_webwappush_mt` table :
#

DROP TABLE IF EXISTS `app_webwappush_mt`;

CREATE TABLE `app_webwappush_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自增主键',
  `USER_ID` int(11) default NULL COMMENT '用户ID',
  `ORG_ID` int(11) default NULL COMMENT '组织结构',
  `EX_CODE` varchar(21) default NULL COMMENT '扩展码',
  `DEST_ADDR` text NOT NULL COMMENT '目标地址',
  `STATUS` bigint(20) default NULL COMMENT '发送状态',
  `PRIORITY` tinyint(4) default NULL COMMENT '优先级',
  `SUBJECT` varchar(256) NOT NULL COMMENT '主题',
  `URL` varchar(256) NOT NULL COMMENT '主题的超连接',
  `SEND_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '定时发送时间',
  `REQUEST_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '入库时间',
  `UPDATE_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '更新时间',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT '应用标识',
  `REQUESTIDENTIFIER` varchar(50) NOT NULL COMMENT '请求标识',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS 产生的ID',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WapPush Web表';

#
# Structure for the `app_wslbs_cancel` table :
#

DROP TABLE IF EXISTS `app_wslbs_cancel`;

CREATE TABLE `app_wslbs_cancel` (
  `ID` int(10) NOT NULL auto_increment,
  `APPLICATIONID` varchar(16) default NULL,
  `REQUESTIDENTIFIER` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservice wap lbs 取消表';

#
# Structure for the `app_wslbs_request` table :
#

DROP TABLE IF EXISTS `app_wslbs_request`;

CREATE TABLE `app_wslbs_request` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `MOBILE` varchar(255) default NULL COMMENT '定位的手机号码',
  `LOCTYPE` int(4) default NULL COMMENT '定位类型\r\n            1-CURRENT\r\n            2-LAST\r\n            3-CURRENT_OR_LAST\r\n            ',
  `PERIODIC` int(4) default NULL COMMENT '1-单次定位\r\n            2-周期定位',
  `FREQUENCY` int(4) default NULL COMMENT '通知的最大频率（单位为秒）\r\n            ',
  `DURATION` int(4) default NULL COMMENT '周期定位的时长（单位为秒）',
  `REQUESTEDACCURACY` int(4) default NULL COMMENT '请求的位置信息的精确度，用米表示',
  `ACCEPTABLEACCURACY` int(4) default NULL COMMENT '响应可接受的精确度，用米表示',
  `MAXIMUMAGE` int(4) default NULL COMMENT '返回的位置信息的最大可接受时限,用秒表示',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '请求时间',
  `RESPONSETIME` int(4) default NULL COMMENT '指示应用能接受的等待响应的最大时间，用秒表示',
  `APPLICATIONID` varchar(16) default NULL COMMENT '应用标识',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '标识某次请求',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservice wap lbs 请求表';

#
# Structure for the `app_wslbs_result` table :
#

DROP TABLE IF EXISTS `app_wslbs_result`;

CREATE TABLE `app_wslbs_result` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `MOBILE` varchar(20) default NULL COMMENT '定位手机号码',
  `ERRORCODE` varchar(10) default NULL COMMENT '错误码',
  `ERRORMESSAGE` varchar(500) default NULL COMMENT '错误消息',
  `LONGTITUDE` varchar(40) default NULL COMMENT '经度',
  `LATITUDE` varchar(40) default NULL COMMENT '纬度',
  `ALTITUDE` varchar(40) default NULL COMMENT '海拔',
  `ACCURACY` varchar(40) default NULL COMMENT '精度(米)',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '请求时间',
  `UPDATETIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '更新时间',
  `APPLICATIONID` varchar(16) default NULL COMMENT '应用标识',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '请求标识',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservice wap lbs 结果表';

#
# Structure for the `app_wsmms_mo` table :
#

DROP TABLE IF EXISTS `app_wsmms_mo`;

CREATE TABLE `app_wsmms_mo` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `EXTCODE` varchar(21) default NULL COMMENT '扩展号码',
  `SOURCEADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `RECEIVETIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '彩信接收时间',
  `SUBJECT` varchar(500) default NULL COMMENT '彩信标题',
  `MMSTEXT` text COMMENT '彩信文本内容',
  `MESSAGECONTENT` mediumtext COMMENT 'MIME组包或SMIL格式文件',
  `REQUESTTIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '入库时间',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `PRIORITY` tinyint(4) default NULL COMMENT '优先级',
  `READFlAG` int(1) NOT NULL COMMENT '是否被客户端读取过',
  `MASID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='彩信 WebService 接收表';

#
# Structure for the `app_wsmms_mt` table :
#

DROP TABLE IF EXISTS `app_wsmms_mt`;

CREATE TABLE `app_wsmms_mt` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `EXTCODE` varchar(21) default NULL COMMENT '扩展码',
  `DESTADDR` varchar(2000) NOT NULL COMMENT '接受手机MSISDN,多人用“;”分割,最大不超过50人',
  `REQDELIVERYREPORT` int(4) NOT NULL COMMENT '是否需要状态报告 0:不需要 1:需要',
  `SUBJECT` varchar(500) NOT NULL COMMENT '彩信标题',
  `MESSAGECONTENT` mediumtext COMMENT 'MIME组包或SMIL格式文件',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '入库时间',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='彩信 WebService 发送表';

#
# Structure for the `app_wsmms_status` table :
#

DROP TABLE IF EXISTS `app_wsmms_status`;

CREATE TABLE `app_wsmms_status` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `GWMMSID` varchar(50) default NULL COMMENT '行业网关产生的MsgID',
  `DESTADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `SENTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '提交到行业网关的时间',
  `SENTRESULT` int(4) default NULL COMMENT '对应SUBMITREQ的返回值',
  `MMSSTATUS` varchar(40) default NULL COMMENT '如果用户需要状态报告，发送成功后状态报告保存在此字段',
  `STATUSTIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '收到状态报告的时间',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `REQUESTIDENTIFIER` varchar(50) NOT NULL COMMENT '发送标识',
  `MASID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='彩信 WebService 状态表';

#
# Structure for the `app_wssms_mo` table :
#

DROP TABLE IF EXISTS `app_wssms_mo`;

CREATE TABLE `app_wssms_mo` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `EX_CODE` varchar(21) default NULL COMMENT '扩展号',
  `CONTENT` text COMMENT '信息内容',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `MSGFMT` int(4) NOT NULL COMMENT '消息类型\r\n            0- ASCII\r\n            4- Binary\r\n            8- usc2\r\n            15- gb2312\r\n            16-gb18030\r\n            ',
  `RECEIVE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '接受时间',
  `READFlAG` int(1) NOT NULL COMMENT '是否被客户端读取过',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS 产生的ID',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_wssms_mt` table :
#

DROP TABLE IF EXISTS `app_wssms_mt`;

CREATE TABLE `app_wssms_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `EX_CODE` varchar(21) default NULL COMMENT '扩展号',
  `DEST_ADDR` text COMMENT '接受手机MSISDN,多人用";"分割',
  `STATUS` tinyint(4) default '0' COMMENT '短信发送状态',
  `PRIORITY` tinyint(4) default NULL COMMENT '信息优先级',
  `REQ_DELIVERY_REPORT` int(11) default '0' COMMENT '是否需要状态报告',
  `MSGFMT` int(4) NOT NULL COMMENT '消息类型\r\n            0- ASCII\r\n            4- Binary\r\n            8- usc2\r\n            15- gb2312\r\n            16-gb18030\r\n            ',
  `SENDMETHOD` int(4) NOT NULL COMMENT '0-普通短信\r\n            1-普通短信立即显示\r\n            2-长短信组包\r\n            3-带结构短信\r\n            ',
  `SUBJECT` varchar(256) default NULL COMMENT '信息主题',
  `CONTENT` text COMMENT '信息内容',
  `SEND_TIME` datetime default NULL COMMENT '定时发送时间',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '入库时间',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web service短信下行表';

#
# Structure for the `app_wssms_status` table :
#

DROP TABLE IF EXISTS `app_wssms_status`;

CREATE TABLE `app_wssms_status` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `STATUS` int(11) NOT NULL COMMENT '发送状态',
  `STATUS_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '接受状态时间',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  `MT_ID` bigint(20) NOT NULL COMMENT '引用app_wssms_mt表ID字段',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `REQUESTIDENTIFIER` varchar(50) NOT NULL COMMENT '发送标识',
  `READFlAG` int(1) NOT NULL COMMENT '是否被客户端读取过',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web service短信下行状态表';

#
# Structure for the `app_wswappush_mt` table :
#

DROP TABLE IF EXISTS `app_wswappush_mt`;

CREATE TABLE `app_wswappush_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自增主键',
  `EX_CODE` varchar(21) default NULL COMMENT '扩展码',
  `DEST_ADDR` text NOT NULL COMMENT '目标地址',
  `STATUS` bigint(20) default NULL COMMENT '发送状态',
  `PRIORITY` tinyint(4) default NULL COMMENT '优先级',
  `SUBJECT` varchar(256) NOT NULL COMMENT '主题',
  `URL` varchar(256) NOT NULL COMMENT '主题的超连接',
  `SEND_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '定时发送时间',
  `REQUEST_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '入库时间',
  `UPDATE_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '更新时间',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT '应用标识',
  `REQUESTIDENTIFIER` varchar(50) NOT NULL COMMENT '请求标识',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS 产生的ID',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WapPush Ws表';

#
# Structure for the `buss_complaint` table :
#

DROP TABLE IF EXISTS `buss_complaint`;

CREATE TABLE `buss_complaint` (
  `ID` int(11) NOT NULL auto_increment,
  `mobile` varchar(30) default '',
  `compTime` datetime default NULL,
  `compContent` varchar(250) NOT NULL default '',
  `userId` varchar(20) NOT NULL default '0',
  `compType` int(1) NOT NULL default '0',
  `handleTime` datetime default NULL,
  `handleContent` varchar(255) default '',
  `isSms` int(1) NOT NULL default '1',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `fund_broadcast` table :
#

DROP TABLE IF EXISTS `fund_broadcast`;

CREATE TABLE `fund_broadcast` (
  `Base_id` int(11) NOT NULL auto_increment COMMENT '关键字，可自增长',
  `Base_title` varchar(50) NOT NULL COMMENT '广播服务标题',
  `Base_appid` varchar(16) NOT NULL COMMENT '对应mas_app_info插件编号，用于引用接入号',
  `Base_extcode` varchar(20) default NULL COMMENT '扩展号码',
  `Base_sended` int(11) NOT NULL COMMENT '实际已发送量',
  `Base_sendlimit` int(11) NOT NULL default '-1' COMMENT '发送量限制，-1表示不限制',
  `Base_status` int(11) NOT NULL default '0' COMMENT '0-正常使用,1-停止使用',
  `Base_type` int(11) NOT NULL default '0' COMMENT '0-广播服务，1-查询服务',
  `Data_url` varchar(200) NOT NULL COMMENT '数据源访问的JDBC连接字符串',
  `Data_usr` varchar(20) default NULL COMMENT '数据源访问用户名',
  `Data_pwd` varchar(30) default NULL COMMENT '数据源访问密码',
  `Data_tbl` varchar(30) NOT NULL COMMENT '数据源访问的表',
  `Data_filter` varchar(200) default NULL COMMENT '数据源表记录过滤条件',
  `Data_sep` varchar(10) default NULL COMMENT '数据源多个手机号码之间分隔符',
  `Data_id` varchar(20) NOT NULL COMMENT '数据源主键字段名',
  `Data_dest` text NOT NULL COMMENT '手机号码字段，分隔符Data_sep指定',
  `Data_msg` varchar(200) NOT NULL COMMENT '短信内容，可引用多个数据源字段，形如: "${content}${corp}-${emp}"',
  `Data_rept` varchar(20) default NULL COMMENT '状态报告回写字段名',
  `Data_max_id` varchar(20) default NULL COMMENT '当前已发送的最大数据源表编号值',
  `Stg_crontab` varchar(200) default NULL COMMENT 'crontab的定时格式，空值忽略该定时策略',
  `Stg_validdate` varchar(20) default NULL COMMENT '有效日期范围，空值忽略时间范围策略',
  `Stg_repeat_send` int(11) NOT NULL COMMENT '仅当为1时,将忽略Data_max_id过滤记录作用，查询所有数据源记录即发送短信。',
  PRIMARY KEY  (`Base_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Structure for the `fund_extcode` table :
#

DROP TABLE IF EXISTS `fund_extcode`;

CREATE TABLE `fund_extcode` (
  `2m` char(2) default NULL COMMENT '2位扩展码'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展码表';

#
# Structure for the `mas_app_ec` table :
#

DROP TABLE IF EXISTS `mas_app_ec`;

CREATE TABLE `mas_app_ec` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `EC_ID` varchar(12) NOT NULL COMMENT '企业代码',
  `EC_NAME` varchar(20) default NULL COMMENT '企业名称',
  `SERVICE_CODE` varchar(21) NOT NULL COMMENT '基本接入号(短服务号码)',
  `IS_EXPAND_SERVICE_CODE` bit(1) NOT NULL default '\0' COMMENT '是否任意扩展的长服务号码  0-否 1-是',
  `IS_MAS_AGENT_DOFORIDDEN` bit(1) NOT NULL default '\0' COMMENT '是否终端发起的加入白名单或退出黑名单请求由MAS服务器直接处理',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `SHORT_SERVICE_CODE` (`SERVICE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团客户信息表';

#
# Structure for the `mas_app_forbidden` table :
#

DROP TABLE IF EXISTS `mas_app_forbidden`;

CREATE TABLE `mas_app_forbidden` (
  `ID` int(11) NOT NULL auto_increment,
  `MOBILE` varchar(50) NOT NULL COMMENT '用户手机号码',
  `MAS_APP_INFO_ID` int(11) NOT NULL COMMENT '引用表mas_app_info的id字段',
  `BLACK` bit(1) NOT NULL default '' COMMENT 'true--黑名单 false--白名单',
  `EFFECT_TIME` date default NULL COMMENT '业务生效日期',
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '建立时间\r\n',
  `RESERVE` varchar(100) default NULL COMMENT '预留',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户黑白名单表 InnoDB free: 251904 kB';

#
# Structure for the `mas_app_info` table :
#

DROP TABLE IF EXISTS `mas_app_info`;

CREATE TABLE `mas_app_info` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '编号，自增长',
  `MAS_APP_EC_ID` int(11) NOT NULL COMMENT '引用表mas_app_ec的id字段',
  `APPLICATION_ID` varchar(16) NOT NULL default '' COMMENT 'EC/SI应用ID',
  `APPLICATION_TYPE` varchar(50) NOT NULL COMMENT 'EC/SI应用类型',
  `CONNECT_TIME` datetime default NULL COMMENT '接入时间',
  `CM_ABILITY` varchar(256) NOT NULL default '' COMMENT '所需的通信能力',
  `LONG_SERVICE_CODE` varchar(21) NOT NULL default '' COMMENT '长服务号码',
  `OLD_SERVICE_CODE` varchar(21) NOT NULL default '' COMMENT '旧服务代码，用于新旧服务代码转换',
  `BIZ_CODE` varchar(10) NOT NULL default '' COMMENT '业务代码',
  `BIZ_NAME` varchar(20) NOT NULL default '' COMMENT '业务名称',
  `OP_CODE` varchar(70) default NULL COMMENT '业务操作指令',
  `IS_AUTO_CONFIG_CODE` bit(1) NOT NULL default '\0' COMMENT '是否自动添加长服务号码和业务代码  0-否 1-是',
  `IS_OLD_SERVICE_CONVERT` bit(1) NOT NULL default '\0' COMMENT '是否开启新旧服务代码装换 0-否 1-是',
  `IS_VALUE_SERVICE` bit(1) NOT NULL default '\0' COMMENT '是否是增值业务[增值（签约关系）or非增值（黑名单or白名单）] 0-否 1-是',
  `IS_BLACKLIST` bit(1) NOT NULL default '' COMMENT '是否启用黑名单',
  `FEE_TYPE` tinyint(4) NOT NULL default '0' COMMENT '资费类别\r\n01：对"计费用户号码"免费\r\n02：对"计费用户号码"按条计信息费\r\n03：对"计费用户号码"按包月收取信息费\r\n04：对"计费用户号码"的信息费封顶\r\n05：对"计费用户号码"的收费是由SP实现',
  `FEE_CODE` int(11) NOT NULL default '0' COMMENT '资费代码（以分为单位）',
  `FEE_USER_TYPE` tinyint(4) NOT NULL default '0' COMMENT '计费用户类型\r\n0：对目的终端MSISDN计费\r\n1：对源终端MSISDN计费\r\n2：对SP计费',
  `FEE_TERMINAL_ID` varchar(21) default NULL COMMENT '付费号码',
  `RECEIVE_HANDLER_CLASS` varchar(200) default NULL COMMENT '上行处理类名(全名)',
  `STATUS_HANDLER_CLASS` varchar(200) default NULL COMMENT '状态报告处理类名(全名)',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1\r\n\r\n',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  `ENABLED` bit(1) NOT NULL default '\0' COMMENT '是否可用 0--不可用  1--可用',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `APPLICATION_ID` (`APPLICATION_ID`),
  KEY `mas_app_info_index` (`APPLICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用接入信息表';

#
# Structure for the `mas_app_order` table :
#

DROP TABLE IF EXISTS `mas_app_order`;

CREATE TABLE `mas_app_order` (
  `ID` int(11) NOT NULL auto_increment,
  `MOBILE` varchar(16) NOT NULL COMMENT '用户手机号码',
  `MAS_APP_INFO_ID` int(11) NOT NULL COMMENT '引用表mas_app_info的id字段',
  `EFFECT_TIME` date default NULL COMMENT '业务生效日期',
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '建立时间',
  `RESERVE` varchar(100) default NULL COMMENT '预留',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户订购关系表 InnoDB free: 251904 kB';

#
# Structure for the `mas_business_stat` table :
#

DROP TABLE IF EXISTS `mas_business_stat`;

CREATE TABLE `mas_business_stat` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自增主键',
  `BUSINESS_TYPE` int(2) default NULL COMMENT '业务类型',
  `CAPACITY_TYPE` int(2) default NULL COMMENT '能力类型',
  `SEND_FLAG` int(2) default NULL COMMENT '上行还是下行',
  `CONTENT` mediumtext COMMENT '请求或者响应内容',
  `RESULT` int(2) default NULL COMMENT '请求或者响应结果',
  `REQUEST_TIME` bigint(20) default NULL COMMENT '请求时间',
  `RESPONSE_TIME` bigint(20) default NULL COMMENT '响应时间',
  `MASID` varchar(50) default NULL COMMENT 'MASID',
  `ISSTATISTIC` int(1) default '0' COMMENT '是否统计',
  `ISABLE` int(1) default '0' COMMENT '是否处理时延',
  `APPLICATIONID` varchar(20) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `mas_business_stat_index` (`MASID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS业务统计表';

#
# Structure for the `mas_lbs_tlrsreq` table :
#

DROP TABLE IF EXISTS `mas_lbs_tlrsreq`;

CREATE TABLE `mas_lbs_tlrsreq` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自增主键',
  `SILBSID` varchar(50) default NULL,
  `REQUESTTIME` datetime default NULL,
  `APPLICATIONID` varchar(16) default NULL COMMENT '应用或者插件标识',
  `IDENTIFIER` varchar(50) default NULL COMMENT '请求标识符',
  `REQUESTID` varchar(32) default NULL COMMENT '定位网关返回标识',
  `ACTUALCOUNTER` int(11) default '0' COMMENT '周期定位实际次数',
  `EXPECTCOUNTER` int(11) default '0' COMMENT '周期定位预期次数',
  `MODULE` int(10) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='周期定位标识表';

#
# Structure for the `mas_mib_switch` table :
#

DROP TABLE IF EXISTS `mas_mib_switch`;

CREATE TABLE `mas_mib_switch` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动增长-主键',
  `IPADDR` varchar(20) default NULL COMMENT '系统IP地址',
  `SYSTEMDESC` varchar(50) NOT NULL COMMENT '系统描述',
  `SYSTEMTYPE` tinyint(4) default NULL COMMENT '系统类型,1统一服务平台,2QOS管理系统,3集团网关系统,0其他系统',
  `SWITCHTYPE` tinyint(4) default '0' COMMENT '开关类型,0采集&TRAP开关,1其他单一开关',
  `READSWITCH` tinyint(4) default '0' COMMENT '数据采集开关,0关闭1开启',
  `TRAPSWITCH` tinyint(4) default '0' COMMENT '发送TRAP开关,0关闭1开启',
  `TRAPTYPE` tinyint(4) default '0' COMMENT '发送TRAP类型,0不发送TRAP,1只发送通用告警,2只发送特定告警,3两种告警都发送',
  `OTHERSWITCH` tinyint(4) default '0' COMMENT '其他单一开关,0关闭1开启',
  `UPDATETIME` datetime default NULL COMMENT '修改时间',
  `UPDATEUSER` varchar(20) default NULL COMMENT '修改人',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS外围系统的mib数据采集和数据设置的开关以及相关设置';

#
# Structure for the `mas_mib_upgrade` table :
#

DROP TABLE IF EXISTS `mas_mib_upgrade`;

CREATE TABLE `mas_mib_upgrade` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动增长',
  `UPGRADEINFO` varchar(200) NOT NULL COMMENT 'MAS服务器收到管理平台的升级信息',
  `SERVERADDR` varchar(20) default NULL COMMENT '升级维护的服务器地址',
  `USERNAME` varchar(30) default NULL COMMENT '用户名',
  `PASSWD` varchar(30) default NULL COMMENT '密码',
  `FILEPATH` varchar(100) default NULL COMMENT '相对路径',
  `RECEIVETIME` datetime NOT NULL COMMENT '接收到的时间',
  `CONFIRMTIME` datetime default NULL COMMENT '确认的时间',
  `CONFIRMSTATUS` int(5) default '0' COMMENT '0代表未确认，1代表已确认',
  `CONFIRMUSER` varchar(50) default NULL COMMENT '确认此升级信息的用户',
  `FTPINFO` varchar(200) default NULL COMMENT '从管理平台收到的完整的升级维护信息,备份',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS从统一服务平台收取的升级维护信息的历史记录';

#
# Structure for the `mas_mms_inbox` table :
#

DROP TABLE IF EXISTS `mas_mms_inbox`;

CREATE TABLE `mas_mms_inbox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  `EXT_CODE` varchar(21) default NULL COMMENT '扩展号码（可以为空）',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `SUBJECT` varchar(500) default NULL COMMENT '彩信标题',
  `MESSAGE_CONTENT` mediumtext COMMENT 'MIME组包或SMIL格式文件',
  `MESSAGE_FILES` text COMMENT '接受的彩信文件所处路径列表',
  `RECEIVE_TIME` datetime NOT NULL COMMENT '彩信接收时间',
  `PRIORITY` tinyint(4) default NULL COMMENT '优先级',
  `RESERVE1` varchar(20) default NULL COMMENT '预留1',
  `RESERVE2` varchar(20) default NULL COMMENT '预留2',
  `RESERVE3` varchar(20) default NULL COMMENT '预留3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS内部彩信接受表';

#
# Structure for the `mas_mms_outbox` table :
#

DROP TABLE IF EXISTS `mas_mms_outbox`;

CREATE TABLE `mas_mms_outbox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  `MSG_ID` varchar(50) default NULL COMMENT '行业网关产生的MsgID',
  `EXT_CODE` varchar(21) default NULL COMMENT '扩展号码',
  `BIZ_CODE` varchar(10) NOT NULL COMMENT '业务代码',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `REQ_DELIVERY_REPORT` tinyint(4) NOT NULL default '0' COMMENT '是否需要发送报告(0=不需要 1=需要)',
  `SUBJECT` varchar(500) default NULL COMMENT '彩信标题',
  `MESSAGE_CONTENT` mediumtext COMMENT 'MIME组包或SMIL格式文件',
  `MESSAGE_FILES` text COMMENT '发送彩信文件所处路径列表',
  `PRIORITY` tinyint(4) NOT NULL default '1' COMMENT '消息的优先级（重要性）（0=最低优先级，1=正常，2=紧急',
  `EC_ID` varchar(6) default NULL COMMENT '企业代号',
  `CHARGED_PARTY` tinyint(4) NOT NULL default '0' COMMENT '付费方式 设置VASP所提交MM的付费方,发送方、接收方、发送方和接收方或两方均不付费，可选，0：Sender、1：Recipients、2：Both、3：Neither、4：ThirdParty',
  `CHARGED_PARTY_ID` varchar(21) NOT NULL COMMENT '付费号码',
  `SENT_TIME` datetime NOT NULL COMMENT '提交到行业网关的时间\r\n',
  `READ_STATUS` varchar(50) default '\r\n\r\n' COMMENT '如果用户需要读取状态报告，终端收到后返回状态报告保存在此字段',
  `READ_TIME` datetime default NULL COMMENT '收到读状态报告的时间',
  `SEND_COUNT` int(11) NOT NULL default '0' COMMENT '发送次数',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '入库时间',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  PRIMARY KEY  (`ID`),
  KEY `MAS_MMS_OUTBOX_TIME` (`SENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS内部彩信待发送表';

#
# Structure for the `mas_mms_sent` table :
#

DROP TABLE IF EXISTS `mas_mms_sent`;

CREATE TABLE `mas_mms_sent` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自动编号',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS产生的ID',
  `MSG_ID` varchar(50) default NULL COMMENT '行业网关产生的MsgID',
  `EXT_CODE` varchar(21) default NULL COMMENT '扩展号码',
  `BIZ_CODE` varchar(10) NOT NULL COMMENT '业务代码',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '单个手机号码',
  `REQ_DELIVERY_REPORT` tinyint(4) NOT NULL default '0' COMMENT '是否需要发送报告(0=不需要 1=需要)',
  `SUBJECT` varchar(500) default NULL COMMENT '彩信标题',
  `MESSAGE_CONTENT` mediumtext COMMENT 'MIME组包或SMIL格式文件',
  `MESSAGE_FILES` text COMMENT '发送彩信文件所处路径列表',
  `PRIORITY` tinyint(4) NOT NULL default '1' COMMENT '消息的优先级（重要性）（0=最低优先级，1=正常，2=紧急',
  `EC_ID` varchar(6) default NULL COMMENT '企业代号',
  `CHARGED_PARTY` tinyint(4) NOT NULL default '0' COMMENT '付费方式 设置VASP所提交MM的付费方,发送方、接收方、发送方和接收方或两方均不付费，可选，0：Sender、1：Recipients、2：Both、3：Neither、4：ThirdParty',
  `CHARGED_PARTY_ID` varchar(21) NOT NULL COMMENT '付费号码',
  `SENT_TIME` datetime NOT NULL COMMENT '提交到行业网关的时间\r\n',
  `SENT_RESULT` int(11) NOT NULL COMMENT '对应SUBMITREQ的返回值',
  `MMS_STATUS` varchar(50) default NULL COMMENT '如果用户需要状态报告，发送成功后状态报告保存在此字段',
  `STATUS_TIME` datetime default NULL COMMENT '收到状态报告的时间',
  `READ_STATUS` varchar(50) default '\r\n\r\n' COMMENT '如果用户需要读取状态报告，终端收到后返回状态报告保存在此字段',
  `READ_TIME` datetime default NULL COMMENT '收到读状态报告的时间',
  `SEND_COUNT` int(11) NOT NULL default '0' COMMENT '发送次数',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '入库时间',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS内部彩信发送已处理表';

#
# Structure for the `mas_reply_checkcount` table :
#

DROP TABLE IF EXISTS `mas_reply_checkcount`;

CREATE TABLE `mas_reply_checkcount` (
  `ID` int(11) NOT NULL auto_increment,
  `FUNNAME` varchar(16) NOT NULL COMMENT '功能名称',
  `FUNCOUNT` int(11) NOT NULL COMMENT '功能次数',
  `MAXNUM` int(11) default '0' COMMENT '区间最大值',
  `MINNUM` int(11) default '0' COMMENT '区间最小值',
  `RESERVE` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信回复对照表 InnoDB free: 251904 kB';

#
# Structure for the `mas_reply_record` table :
#

DROP TABLE IF EXISTS `mas_reply_record`;

CREATE TABLE `mas_reply_record` (
  `ID` int(11) NOT NULL auto_increment,
  `RECORDNUM` int(11) NOT NULL COMMENT '回复短信的编号',
  `FUNNAME` varchar(16) NOT NULL COMMENT '功能名称',
  `FUNNUM` int(11) NOT NULL COMMENT '功能次数',
  `FOREIGNNUM` varchar(20) default NULL COMMENT '短信的外键',
  `USERID` varchar(20) default NULL COMMENT '用户的外键',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `RESERVE` varchar(20) default NULL COMMENT '保留',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信回复记录表 InnoDB free: 251904 kB';

#
# Structure for the `mas_sms_inbox` table :
#

DROP TABLE IF EXISTS `mas_sms_inbox`;

CREATE TABLE `mas_sms_inbox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '编号',
  `MSG_ID` bigint(20) NOT NULL COMMENT '信息标识，由SP侧短信网关本身产生',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '目的号码 \r\nSP的服务代码，一般4--6位，或者是前缀为服务代码的长号码；该号码是手机用户短消息的被叫号码\r\n',
  `SERVICE_ID` varchar(10) NOT NULL COMMENT '业务类型，是数字、字母和符号的组合。',
  `TP_PID` tinyint(4) NOT NULL default '0' COMMENT 'GSM协议类型',
  `TP_UDHI` tinyint(4) NOT NULL default '0' COMMENT 'GSM协议类型',
  `MSG_FMT` tinyint(4) NOT NULL default '8' COMMENT '信息格式\r\n  0：ASCII串\r\n  3：短信写卡操作\r\n  4：二进制信息\r\n  8：UCS2编码\r\n15：含GB汉字  。。。。。。 \r\n',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '源终端MSISDN号码',
  `CONTENT` varchar(200) NOT NULL COMMENT '信息内容',
  `LINK_ID` varchar(21) default NULL COMMENT '点播业务使用的LinkID，非点播类业务的MT流程不使用该字段。',
  `RECEIVED_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '接受时间',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS 产生的ID',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_limit` table :
#

DROP TABLE IF EXISTS `mas_sms_limit`;

CREATE TABLE `mas_sms_limit` (
  `id` int(11) NOT NULL auto_increment,
  `userID` int(11) default NULL COMMENT '用户ID',
  `limitCount` int(11) NOT NULL COMMENT '短信限额',
  `currentCount` int(11) default NULL COMMENT '当前发送短信数',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_outbox` table :
#

DROP TABLE IF EXISTS `mas_sms_outbox`;

CREATE TABLE `mas_sms_outbox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '编号',
  `MSG_ID` bigint(20) NOT NULL default '0' COMMENT '信息标识，由SP侧短信网关本身产生',
  `PK_TOTAL` tinyint(4) NOT NULL default '1' COMMENT '相同Msg_Id的信息总条数，从1开始',
  `PK_NUMBER` tinyint(4) NOT NULL default '1' COMMENT '相同Msg_Id的信息序号，从1开始',
  `REQ_REPORT` bit(1) NOT NULL default '' COMMENT '是否要求返回状态确认报告：\r\n0：不需要\r\n1：需要\r\n2：产生SMC话单\r\n （该类型短信仅供网关计费使用，不发送给目的终端)',
  `PRIORITY` tinyint(4) NOT NULL default '0' COMMENT '信息优先级',
  `SERVICE_ID` varchar(10) NOT NULL COMMENT '业务类型，是数字、字母和符号的组合。',
  `FEE_USERTYPE` tinyint(4) NOT NULL default '1' COMMENT '计费用户类型字段\r\n0：对目的终端MSISDN计费；\r\n1：对源终端MSISDN计费；\r\n2：对SP计费;\r\n3：表示本字段无效，对谁计费参见Fee_terminal_Id字段。\r\n',
  `FEE_TERMINAL_ID` varchar(21) default NULL COMMENT '被计费用户的号码（如本字节填空，则表示本字段无效，对谁计费参见Fee_UserType字段，本字段与Fee_UserType字段互斥）',
  `TP_PID` tinyint(4) NOT NULL default '0' COMMENT 'GSM协议类型',
  `TP_UDHI` tinyint(4) NOT NULL default '0' COMMENT 'GSM协议类型',
  `MSG_FMT` tinyint(4) NOT NULL default '8' COMMENT '信息格式\r\n  0：ASCII串\r\n  3：短信写卡操作\r\n  4：二进制信息\r\n  8：UCS2编码\r\n15：含GB汉字  。。。。。。 \r\n',
  `MSG_SRC` varchar(6) default NULL COMMENT '信息内容来源(SP_Id)',
  `FEE_TYPE` varchar(2) NOT NULL default '' COMMENT '资费类别\r\n01：对"计费用户号码"免费\r\n02：对"计费用户号码"按条计信息费\r\n03：对"计费用户号码"按包月收取信息费\r\n04：对"计费用户号码"的信息费封顶\r\n05：对"计费用户号码"的收费是由SP实现\r\n',
  `FEE_CODE` varchar(6) NOT NULL default '' COMMENT '资费代码（以分为单位）',
  `SEND_TIME` datetime default NULL COMMENT '定时发送时间',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '源号码\r\nSP的服务代码或前缀为服务代码的长号码, 网关将该号码完整的填到SMPP协议Submit_SM消息相应的source_addr字段，该号码最终在用户手机上显示为短消息的主叫号码\r\n',
  `DEST_ADDR` text NOT NULL COMMENT '接收短信的MSISDN号码(多个号码以;分割)',
  `CONTENT` varchar(160) NOT NULL COMMENT '信息内容',
  `LINK_ID` varchar(21) default NULL COMMENT '点播业务使用的LinkID，非点播类业务的MT流程不使用该字段。',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '入库时间',
  `SENT_COUNT` tinyint(4) NOT NULL default '0' COMMENT '发送次数',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS 产生的ID\r\n',
  `SEND_METHOD` tinyint(4) NOT NULL default '0' COMMENT '发送方法 0:普通短信 1:普通短信立即显示 2:长短信 3：带结构体短信 4:WAPPUSH',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  `routeID` varchar(50) default NULL COMMENT '路由ID',
  `userName` varchar(50) default NULL COMMENT '发送用户名',
  PRIMARY KEY  (`ID`),
  KEY `MAS_SMS_OUTBOX_TIME_ROUTEID` (`SEND_TIME`,`routeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_route` table :
#

DROP TABLE IF EXISTS `mas_sms_route`;

CREATE TABLE `mas_sms_route` (
  `routeID` varchar(64) NOT NULL COMMENT '路由ID',
  `pattern` mediumtext COMMENT '路由规则',
  `serverIP` varchar(32) default NULL COMMENT '网关IP',
  `port` int(11) default NULL COMMENT '端口',
  `userName` varchar(32) default NULL COMMENT '用户名',
  `password` varchar(32) default NULL COMMENT '密码',
  `proxyClass` mediumtext COMMENT '代理类',
  `isValid` bit(1) default NULL COMMENT '是否有效',
  `sendRate` int(11) default NULL COMMENT '发送速率',
  `returnPhone` varchar(32) default NULL COMMENT '接入号',
  `createTime` datetime default NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY  (`routeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_sent` table :
#

DROP TABLE IF EXISTS `mas_sms_sent`;

CREATE TABLE `mas_sms_sent` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '编号',
  `MSG_ID` bigint(20) NOT NULL default '0' COMMENT '信息标识，由SP侧短信网关本身产生',
  `PK_TOTAL` tinyint(4) NOT NULL default '1' COMMENT '相同Msg_Id的信息总条数，从1开始',
  `PK_NUMBER` tinyint(4) NOT NULL default '1' COMMENT '相同Msg_Id的信息序号，从1开始',
  `REQ_REPORT` tinyint(4) NOT NULL default '1' COMMENT '是否要求返回状态确认报告：\r\n0：不需要\r\n1：需要\r\n2：产生SMC话单\r\n （该类型短信仅供网关计费使用，不发送给目的终端)',
  `PRIORITY` tinyint(4) NOT NULL default '0' COMMENT '信息优先级',
  `SERVICE_ID` varchar(10) NOT NULL COMMENT '业务类型，是数字、字母和符号的组合。',
  `FEE_USERTYPE` tinyint(4) NOT NULL default '1' COMMENT '计费用户类型字段\r\n0：对目的终端MSISDN计费；\r\n1：对源终端MSISDN计费；\r\n2：对SP计费;\r\n3：表示本字段无效，对谁计费参见Fee_terminal_Id字段。\r\n',
  `FEE_TERMINAL_ID` varchar(21) default NULL COMMENT '被计费用户的号码（如本字节填空，则表示本字段无效，对谁计费参见Fee_UserType字段，本字段与Fee_UserType字段互斥）',
  `TP_PID` tinyint(4) NOT NULL default '0' COMMENT 'GSM协议类型',
  `TP_UDHI` tinyint(4) NOT NULL default '0' COMMENT 'GSM协议类型',
  `MSG_FMT` tinyint(4) NOT NULL default '8' COMMENT '信息格式\r\n  0：ASCII串\r\n  3：短信写卡操作\r\n  4：二进制信息\r\n  8：UCS2编码\r\n15：含GB汉字  。。。。。。 \r\n',
  `MSG_SRC` varchar(6) default NULL COMMENT '信息内容来源(SP_Id)',
  `FEE_TYPE` varchar(2) default '' COMMENT '资费类别\r\n01：对"计费用户号码"免费\r\n02：对"计费用户号码"按条计信息费\r\n03：对"计费用户号码"按包月收取信息费\r\n04：对"计费用户号码"的信息费封顶\r\n05：对"计费用户号码"的收费是由SP实现\r\n',
  `FEE_CODE` varchar(6) default '' COMMENT '资费代码（以分为单位）',
  `SEND_TIME` datetime default NULL COMMENT '定时发送时间',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '源号码\r\nSP的服务代码或前缀为服务代码的长号码, 网关将该号码完整的填到SMPP协议Submit_SM消息相应的source_addr字段，该号码最终在用户手机上显示为短消息的主叫号码\r\n',
  `DEST_ADDR` varchar(256) NOT NULL COMMENT '接收短信的MSISDN号码(多个号码以;分割)',
  `CONTENT` varchar(160) NOT NULL COMMENT '信息内容',
  `LINK_ID` varchar(21) default NULL COMMENT '点播业务使用的LinkID，非点播类业务的MT流程不使用该字段。',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '入库时间',
  `SENT_COUNT` tinyint(4) NOT NULL default '0' COMMENT '发送次数',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS 产生的ID',
  `SEND_RESULT` int(11) NOT NULL default '0' COMMENT 'CMPP_SUBMIT的返回值',
  `SMS_STATUS` varchar(20) default NULL COMMENT '如果用户需要状态报告，发送成功后状态报告保存在此字段',
  `STATUS_TIME` datetime default NULL COMMENT '收到状态报告的时间',
  `SEND_METHOD` tinyint(4) NOT NULL default '0' COMMENT '发送方法 0:普通短信 1:普通短信立即显示 2:长短信 3：带结构体短信 4:WAPPUSH',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  `routeID` varchar(50) default NULL COMMENT '路由ID',
  `userName` varchar(50) default NULL COMMENT '发送用户名',
  PRIMARY KEY  (`ID`),
  KEY `mas_sms_sent_msgid_index` (`MSG_ID`),
  KEY `mas_sms_sent_masid_index` (`MAS_ID`),
  KEY `MAS_SMS_SENT_REQUEST_TIME` (`REQUEST_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_sent_temp` table :
#

DROP TABLE IF EXISTS `mas_sms_sent_temp`;

CREATE TABLE `mas_sms_sent_temp` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '编号',
  `MSG_ID` bigint(20) NOT NULL default '0' COMMENT '信息标识，由SP侧短信网关本身产生',
  `PK_TOTAL` tinyint(4) NOT NULL default '1' COMMENT '相同Msg_Id的信息总条数，从1开始',
  `PK_NUMBER` tinyint(4) NOT NULL default '1' COMMENT '相同Msg_Id的信息序号，从1开始',
  `REQ_REPORT` tinyint(4) NOT NULL default '1' COMMENT '是否要求返回状态确认报告：\r\n0：不需要\r\n1：需要\r\n2：产生SMC话单\r\n （该类型短信仅供网关计费使用，不发送给目的终端)',
  `PRIORITY` tinyint(4) NOT NULL default '0' COMMENT '信息优先级',
  `SERVICE_ID` varchar(10) NOT NULL COMMENT '业务类型，是数字、字母和符号的组合。',
  `FEE_USERTYPE` tinyint(4) NOT NULL default '1' COMMENT '计费用户类型字段\r\n0：对目的终端MSISDN计费；\r\n1：对源终端MSISDN计费；\r\n2：对SP计费;\r\n3：表示本字段无效，对谁计费参见Fee_terminal_Id字段。\r\n',
  `FEE_TERMINAL_ID` varchar(21) default NULL COMMENT '被计费用户的号码（如本字节填空，则表示本字段无效，对谁计费参见Fee_UserType字段，本字段与Fee_UserType字段互斥）',
  `TP_PID` tinyint(4) NOT NULL default '0' COMMENT 'GSM协议类型',
  `TP_UDHI` tinyint(4) NOT NULL default '0' COMMENT 'GSM协议类型',
  `MSG_FMT` tinyint(4) NOT NULL default '8' COMMENT '信息格式\r\n  0：ASCII串\r\n  3：短信写卡操作\r\n  4：二进制信息\r\n  8：UCS2编码\r\n15：含GB汉字  。。。。。。 \r\n',
  `MSG_SRC` varchar(6) default NULL COMMENT '信息内容来源(SP_Id)',
  `FEE_TYPE` varchar(2) default '' COMMENT '资费类别\r\n01：对"计费用户号码"免费\r\n02：对"计费用户号码"按条计信息费\r\n03：对"计费用户号码"按包月收取信息费\r\n04：对"计费用户号码"的信息费封顶\r\n05：对"计费用户号码"的收费是由SP实现\r\n',
  `FEE_CODE` varchar(6) default '' COMMENT '资费代码（以分为单位）',
  `SEND_TIME` datetime default NULL COMMENT '定时发送时间',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '源号码\r\nSP的服务代码或前缀为服务代码的长号码, 网关将该号码完整的填到SMPP协议Submit_SM消息相应的source_addr字段，该号码最终在用户手机上显示为短消息的主叫号码\r\n',
  `DEST_ADDR` text NOT NULL COMMENT '接收短信的MSISDN号码(多个号码以;分割)',
  `CONTENT` varchar(160) NOT NULL COMMENT '信息内容',
  `LINK_ID` varchar(21) default NULL COMMENT '点播业务使用的LinkID，非点播类业务的MT流程不使用该字段。',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '入库时间',
  `SENT_COUNT` tinyint(4) NOT NULL default '0' COMMENT '发送次数',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS 产生的ID',
  `SEND_RESULT` int(11) NOT NULL default '0' COMMENT 'CMPP_SUBMIT的返回值',
  `SMS_STATUS` varchar(20) default NULL COMMENT '如果用户需要状态报告，发送成功后状态报告保存在此字段',
  `STATUS_TIME` datetime default NULL COMMENT '收到状态报告的时间',
  `SEND_METHOD` tinyint(4) NOT NULL default '0' COMMENT '发送方法 0:普通短信 1:普通短信立即显示 2:长短信 3：带结构体短信 4:WAPPUSH',
  `RESERVE1` varchar(100) default NULL COMMENT '预留1',
  `RESERVE2` varchar(100) default NULL COMMENT '预留2',
  `RESERVE3` varchar(100) default NULL COMMENT '预留3',
  `routeID` varchar(50) default NULL COMMENT '路由ID',
  `userName` varchar(50) default NULL COMMENT '发送用户名',
  PRIMARY KEY  (`ID`),
  KEY `mas_sms_sent_msgid_index` (`MSG_ID`),
  KEY `mas_sms_sent_masid_index` (`MAS_ID`),
  KEY `MAS_SMS_SENT_TEMP_REQUEST_TIME_SEND_RESULT` (`REQUEST_TIME`,`SEND_RESULT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_transmit` table :
#

DROP TABLE IF EXISTS `mas_transmit`;

CREATE TABLE `mas_transmit` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `REQ_KEY` varchar(16) NOT NULL COMMENT '请求关键字，用来匹配真正请求的地址',
  `ADDRESS` varchar(2000) NOT NULL COMMENT '企业应用地址',
  `APPLICATION_TYPE` varchar(4) NOT NULL COMMENT '应用能力',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业应用请求转发表';

#
# Structure for the `mas_ussd_session` table :
#

DROP TABLE IF EXISTS `mas_ussd_session`;

CREATE TABLE `mas_ussd_session` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `USSD_IDENTITIER` varchar(50) NOT NULL COMMENT '对话标识一个特定的USSD交互',
  `MSISDN` varchar(21) NOT NULL COMMENT '移动台号码',
  `SERVICE_CODE` varchar(21) NOT NULL COMMENT '业务接入码',
  `CREATOR` tinyint(4) NOT NULL default '1' COMMENT '对话发起方 1:USSDC->SP 2:SP->USSDC',
  `SENDER_ID` int(11) NOT NULL default '0' COMMENT '消息发出方会话控制标识，范围为：0x0h~0x7FFFFFFFh',
  `RECEIVER_ID` int(11) NOT NULL default '0' COMMENT '消息接收方会话控制标识，置为0xFFFFFFFF',
  `STATUS` tinyint(4) NOT NULL default '1' COMMENT '对话状态 0:已关闭 1:进行中',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SI应用的ID',
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '建立对话时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='USSD会话信息表';

#
# Structure for the `mas_ussd_session_data` table :
#

DROP TABLE IF EXISTS `mas_ussd_session_data`;

CREATE TABLE `mas_ussd_session_data` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `USSD_IDENTITIER` varchar(50) NOT NULL COMMENT '对话标识一个特定的USSD交互',
  `COMMAND_ID` int(11) NOT NULL COMMENT '消息类型标识',
  `SERVICE_CODE` varchar(21) default NULL COMMENT '业务接入码',
  `USSD_CONTENT` varchar(200) default NULL COMMENT 'USSD串的内容',
  `OP_TYPE` tinyint(4) NOT NULL default '1' COMMENT '操作类型 1:USSDC->SP 2:SP->USSDC',
  `STATUS` tinyint(4) NOT NULL default '0' COMMENT '状态 0:已处理 1：等待处理',
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '建立对话时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='USSD会话数据表';

#
# Structure for the `mas_web_proxy_relation` table :
#

DROP TABLE IF EXISTS `mas_web_proxy_relation`;

CREATE TABLE `mas_web_proxy_relation` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `SERVICE_NAME` varchar(100) NOT NULL COMMENT '终端请求的服务,用来匹配企业WEB门户URL',
  `WEB_PORTAL_URL` varchar(200) NOT NULL COMMENT '企业WEB门户URL',
  `ENABLED` bit(1) NOT NULL default '\0' COMMENT '是否启用此代理',
  `USE_SSL` bit(1) NOT NULL default '\0' COMMENT '是否启用终端到MAS的SSL连接',
  `APPLICATION_TYPE` varchar(4) NOT NULL COMMENT '应用能力',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB代理关系表';

#
# Structure for the `p_bsplug_element_add` table :
#

DROP TABLE IF EXISTS `p_bsplug_element_add`;

CREATE TABLE `p_bsplug_element_add` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `PROXY_ID` int(11) NOT NULL COMMENT 'WEB代理ID, 关联mas_web_proxy_relation表ID',
  `PAGE` varchar(100) NOT NULL COMMENT '页面URL',
  `ELEMENT_CONTENT` text NOT NULL COMMENT '元素内容',
  `ELEMENT_TYPE` tinyint(4) NOT NULL default '0' COMMENT '元素类型 1:图片 0:文本',
  `TARGETTYPE` int(11) NOT NULL default '0' COMMENT '目标元素类型',
  `TARGET` text COMMENT '目标位置',
  `ISALLTARGET` bit(1) default '' COMMENT '是否在所有的匹配的位置添加',
  `ISBEFORTARGET` bit(1) default '\0' COMMENT '是否在目标位置之前添加',
  `INDEX` int(11) default '1' COMMENT '添加位置的编号',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S插件页面添加元素表';

#
# Structure for the `p_bsplug_element_filter` table :
#

DROP TABLE IF EXISTS `p_bsplug_element_filter`;

CREATE TABLE `p_bsplug_element_filter` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `PROXY_ID` int(11) NOT NULL COMMENT 'WEB代理ID, 关联mas_web_proxy_relation表ID',
  `PAGE` varchar(100) NOT NULL COMMENT '页面URL',
  `ELEMENT_NAME` varchar(50) NOT NULL COMMENT '元素名称',
  `ELEMENT_TYPE` tinyint(4) NOT NULL default '0' COMMENT '元素类型 0:框架 1:图片',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S插件页面过滤元素表';

#
# Structure for the `p_bsplug_element_replace` table :
#

DROP TABLE IF EXISTS `p_bsplug_element_replace`;

CREATE TABLE `p_bsplug_element_replace` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `PROXY_ID` int(11) NOT NULL COMMENT 'WEB代理ID, 关联mas_web_proxy_relation表ID',
  `PAGE` varchar(100) NOT NULL COMMENT '页面URL',
  `ELEMENT_CONTENT` text NOT NULL COMMENT '元素内容',
  `ELEMENT_REPLACE_CONTENT` text NOT NULL COMMENT '替代元素内容',
  `ELEMENT_TYPE` tinyint(4) NOT NULL default '0' COMMENT '元素类型 0:框架 1:图片 2:文本',
  `INDEX` int(11) default '1' COMMENT '目标编号',
  `ISALLTARGET` bit(1) default '\0' COMMENT '是否在所有匹配的地方替换',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S插件页面过滤元素表';

#
# Structure for the `p_bsplug_layout` table :
#

DROP TABLE IF EXISTS `p_bsplug_layout`;

CREATE TABLE `p_bsplug_layout` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `LAYOUT_NAME` varchar(50) NOT NULL COMMENT '布局名称',
  `CSS_CONTENT` text COMMENT '布局CSS内容',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S插件页面布局定义表';

#
# Structure for the `p_bsplug_page_layout` table :
#

DROP TABLE IF EXISTS `p_bsplug_page_layout`;

CREATE TABLE `p_bsplug_page_layout` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自动编号',
  `PROXY_ID` int(11) NOT NULL COMMENT 'WEB代理ID, 关联mas_web_proxy_relation表ID',
  `PAGE` varchar(100) NOT NULL COMMENT '页面URL',
  `LAYOUTCONTENT` text COMMENT '需要重新布局的内容',
  `CONTENTTYPE` int(11) default '0' COMMENT '布局元素类型',
  `TARGET` text COMMENT '目标位置',
  `TARGETTYPE` int(11) default '0' COMMENT '目标元素类型',
  `ISBEFORTARGET` bit(1) default '\0' COMMENT '是否将布局内容布局到目标之前',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S插件重新布局页面表';

#
# Structure for the `p_cmaurl` table :
#

DROP TABLE IF EXISTS `p_cmaurl`;

CREATE TABLE `p_cmaurl` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '主键，自增长ID',
  `APPLICATIONID` varchar(64) default NULL COMMENT '插件标识',
  `CMABILITY` varchar(32) default NULL COMMENT '通信能力',
  `URL` varchar(128) default NULL COMMENT '通信能力对应的URL',
  `AVAILABILITY` int(2) default NULL COMMENT '该插件通信能力对应的web服务是否有效(0:有效；1:无效)',
  `RESERVE1` varchar(128) default NULL COMMENT '该字段目前保留，使用请备注',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通信能力和WebService匹配表';

#
# Structure for the `p_plugin` table :
#

DROP TABLE IF EXISTS `p_plugin`;

CREATE TABLE `p_plugin` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自增长的主键',
  `APPLICATIONID` varchar(64) NOT NULL COMMENT '应用或插件标识',
  `PROCESSID` bigint(20) default NULL COMMENT '插件的进程ID',
  `ADDRESS` varchar(128) default NULL COMMENT '插件所在的主机IP地址',
  `REGSTATUS` int(3) default NULL COMMENT '插件注册状态(0:正常;1:注销;2:暂停)',
  `REPSTATUS` int(3) default NULL COMMENT '插件上报的状态(0:状态正常;1:超过有效期;2:未注册，需要先注册;3:已经注销;4:插件已被mas服务器强行关闭;5:插件的注册请求等待审批中)',
  `ACCESSTIME` date default NULL COMMENT '插件接入时间',
  `PLUGINTYPE` int(1) default NULL COMMENT '插件类型',
  `URL` varchar(128) default NULL COMMENT '服务地址',
  `DESCRIPTION` varchar(128) default NULL COMMENT '插件描述',
  PRIMARY KEY  (`ID`,`APPLICATIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件管理列表';

#
# Structure for the `p_plugin_valve` table :
#

DROP TABLE IF EXISTS `p_plugin_valve`;

CREATE TABLE `p_plugin_valve` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT '插件应用标识',
  `VALVE_GUARD` double(20,3) NOT NULL COMMENT '警戒门限',
  `VALVE_SEVERITY` double(20,3) NOT NULL COMMENT '严重门限',
  `VALVE_DANGER` double(20,3) NOT NULL COMMENT '高危门限',
  `TYPE` int(1) NOT NULL COMMENT '1:CPU，2:MEM，3:DISK，4:网络，5:通信能力使用',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件阀值表';

#
# Structure for the `p_pluginmng` table :
#

DROP TABLE IF EXISTS `p_pluginmng`;

CREATE TABLE `p_pluginmng` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `APPLICATIONID` varchar(16) default NULL COMMENT '插件标识',
  `DEVELOPER` varchar(32) default NULL COMMENT '开发商',
  `TYPE` int(2) default NULL COMMENT '应用类别',
  `PERMIT` int(2) default NULL COMMENT '允许标识',
  `STATUS` int(2) default NULL COMMENT '接入状态',
  `NEXTCOMMAND` varchar(16) default NULL COMMENT '需要插件执行的管理命令，pause代表暂停，recovery代表恢复，不填表示无命令',
  `NEXTINTERVAL` int(10) default NULL COMMENT '插件的后续上报时间间隔（单位为秒），不填表示同上次时间间隔',
  `LASTINTERVAL` int(10) default NULL COMMENT '保存的插件上次状态上报时间间隔',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件管理表';

#
# Structure for the `sa_menu` table :
#

DROP TABLE IF EXISTS `sa_menu`;

CREATE TABLE `sa_menu` (
  `ID` bigint(20) NOT NULL auto_increment,
  `PARENT_NAME` varchar(30) default NULL,
  `NAME` varchar(30) NOT NULL,
  `TITLE` varchar(30) default NULL,
  `DESCRIPTION` varchar(50) default NULL,
  `LOCATION` varchar(255) default NULL,
  `TARGET` varchar(10) default NULL,
  `ONCLICK` varchar(100) default NULL,
  `ONMOUSEOVER` varchar(100) default NULL,
  `ONMOUSEOUT` varchar(100) default NULL,
  `IMAGE` varchar(50) default NULL,
  `ALTIMAGE` varchar(30) default NULL,
  `TOOLTIP` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `scheduleawoke` table :
#

DROP TABLE IF EXISTS `scheduleawoke`;

CREATE TABLE `scheduleawoke` (
  `id` int(11) NOT NULL auto_increment,
  `awoketime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `createtime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `awokeobject` mediumtext,
  `content` varchar(50) default NULL,
  `awokeType` int(11) default NULL COMMENT '1定期 2天 3周 4月',
  `intervalnum` int(11) default NULL,
  `sendflag` int(11) default NULL COMMENT '0未发 1已发',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for the `sys_address_book` table :
#

DROP TABLE IF EXISTS `sys_address_book`;

CREATE TABLE `sys_address_book` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `username` varchar(20) default NULL COMMENT '客户名称',
  `mobilephone` varchar(20) default NULL COMMENT '手机号码',
  `remarks` varchar(20) default NULL COMMENT '备注',
  `groupID` varchar(20) default '0' COMMENT '分组',
  `namelatter` varchar(20) default NULL COMMENT '名字简写',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `owner` int(11) default NULL COMMENT '所属用户ID　0:系统共享组　其他:用户ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Structure for the `sys_address_group` table :
#

DROP TABLE IF EXISTS `sys_address_group`;

CREATE TABLE `sys_address_group` (
  `GROUP_ID` int(11) NOT NULL auto_increment COMMENT '组编号',
  `parentID` int(11) default NULL COMMENT '所属组编号',
  `GROUP_NAME` varchar(50) default NULL COMMENT '组名',
  `OWNER` int(11) default '0' COMMENT '所属用户ID　0:系统共享组　其他:用户ID',
  PRIMARY KEY  (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人通讯录分组';

#
# Structure for the `sys_code` table :
#

DROP TABLE IF EXISTS `sys_code`;

CREATE TABLE `sys_code` (
  `CODE_NAME` varchar(32) NOT NULL COMMENT '代码名称',
  `CODE_VALUE` varchar(1024) default NULL COMMENT '代码值',
  `CODE_DESC` varchar(256) default NULL COMMENT '代码描述',
  `TYPE_NAME` varchar(16) NOT NULL COMMENT '代码类型名称 关联SYS_CODE表TYPE_NAME',
  `SHOW_ORDER` int(11) default NULL COMMENT '显示顺序',
  PRIMARY KEY  (`CODE_NAME`,`TYPE_NAME`),
  KEY `sys_code_index` (`TYPE_NAME`,`SHOW_ORDER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统代码表';

#
# Structure for the `sys_code_type` table :
#

DROP TABLE IF EXISTS `sys_code_type`;

CREATE TABLE `sys_code_type` (
  `TYPE_NAME` varchar(16) NOT NULL COMMENT '类型名称',
  `TYPE_DESC` varchar(256) default NULL COMMENT '类型描述',
  `READ_ONLY` bit(1) NOT NULL default '\0' COMMENT '此类型代码是否仅读'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统代码类型';

#
# Structure for the `sys_group` table :
#

DROP TABLE IF EXISTS `sys_group`;

CREATE TABLE `sys_group` (
  `GROUP_ID` int(11) NOT NULL auto_increment COMMENT '组编号',
  `GROUP_NAME` varchar(50) default NULL COMMENT '组名',
  `OWNER` int(11) default '0' COMMENT '所属用户ID　0:系统共享组　其他:用户ID',
  PRIMARY KEY  (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地址本群组信息表';

#
# Structure for the `sys_group_user` table :
#

DROP TABLE IF EXISTS `sys_group_user`;

CREATE TABLE `sys_group_user` (
  `EMP_ID` varchar(32) NOT NULL COMMENT '员工编号 关联SYS_USER_INFO表EMP_ID',
  `GROUP_ID` int(11) NOT NULL COMMENT '群组编号 关联SYS_GROUP表GROUP_ID',
  PRIMARY KEY  (`EMP_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群组和员工信息关联表';

#
# Structure for the `sys_org` table :
#

DROP TABLE IF EXISTS `sys_org`;

CREATE TABLE `sys_org` (
  `ORG_ID` int(11) NOT NULL auto_increment COMMENT '组织编号',
  `ORG_NAME` varchar(50) default NULL COMMENT '组织名称',
  `PARENT_ORG_ID` int(11) default '0' COMMENT '所属组织ID　0:根组织　其他:子组织',
  PRIMARY KEY  (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织部门信息表';

#
# Structure for the `sys_org_user` table :
#

DROP TABLE IF EXISTS `sys_org_user`;

CREATE TABLE `sys_org_user` (
  `EMP_ID` varchar(32) NOT NULL COMMENT '员工编号 关联SYS_USER_INFO表EMP_ID',
  `ORG_ID` int(11) NOT NULL COMMENT '组织编号 关联SYS_ORG表ORG_ID',
  PRIMARY KEY  (`EMP_ID`,`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织和员工信息关联表';

#
# Structure for the `sys_privilege` table :
#

DROP TABLE IF EXISTS `sys_privilege`;

CREATE TABLE `sys_privilege` (
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY  (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `sys_resource` table :
#

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `id` int(11) NOT NULL auto_increment,
  `resource_type` varchar(10) NOT NULL default 'URL' COMMENT 'URL代表地址型资源, FUNCTION代表功能型资源\r\nMENU代表菜单型资源',
  `resource_string` varchar(200) NOT NULL,
  `resource_group` varchar(60) default NULL,
  `description` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `sys_role` table :
#

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `sys_user` table :
#

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `userpwd` varchar(50) NOT NULL,
  `enabled` bit(1) NOT NULL default '\0',
  `state` int(11) default '0',
  `updateTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '用户更新时间',
  PRIMARY KEY  (`id`),
  KEY `sys_user_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `sys_user_info` table :
#

DROP TABLE IF EXISTS `sys_user_info`;

CREATE TABLE `sys_user_info` (
  `EMP_ID` varchar(32) NOT NULL COMMENT '员工编号',
  `EMP_NAME` varchar(20) default NULL COMMENT '员工姓名',
  `MOBILE_PHONE` varchar(21) default NULL COMMENT '手机号码',
  `USER_ID` int(11) default NULL COMMENT '用户ID　关联sys_user表ID',
  `BIRTHDAYDATE` varchar(20) default NULL COMMENT '出生年月',
  `SENDFLAG` int(1) default '0' COMMENT '发送标示',
  `EMP_NAMELetter` varchar(20) default NULL COMMENT '字母简写',
  PRIMARY KEY  (`EMP_ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户及员工信息表';

#
# Structure for the `sys_user_logs` table :
#

DROP TABLE IF EXISTS `sys_user_logs`;

CREATE TABLE `sys_user_logs` (
  `id` int(11) NOT NULL auto_increment COMMENT '关键字',
  `username` varchar(20) default NULL COMMENT '使用的用户名',
  `userpwd` varchar(20) default NULL COMMENT '使用的密码(加密)',
  `ip` varchar(20) default NULL COMMENT '登录IP',
  `logtime` datetime default NULL COMMENT '登录时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统用户登录记录';

#
# Structure for the `sys_user_role` table :
#

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `t_alert_active` table :
#

DROP TABLE IF EXISTS `t_alert_active`;

CREATE TABLE `t_alert_active` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `ALERTID` varchar(128) default NULL COMMENT '告警序列号',
  `NODE` varchar(128) default NULL COMMENT '网元（MASID）',
  `LEVEL` varchar(16) default NULL COMMENT '告警级别',
  `TYPE` varchar(16) default NULL COMMENT '告警类型',
  `CAUSE` int(10) default NULL COMMENT '告警原因',
  `TITLE` varchar(128) default NULL COMMENT '告警标题',
  `CONTENT` varchar(255) default NULL COMMENT '告警内容',
  `activeStatus` int(1) default NULL COMMENT '活动状态',
  `IS_SPECIAL` bit(1) default NULL COMMENT '是否特定告警',
  `EVENT_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '告警时间',
  `CONFIRM_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '告警确认时间',
  `CLEAR_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '清除时间',
  PRIMARY KEY  (`ID`),
  KEY `t_alert_active_index` (`IS_SPECIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='告警实时表';

#
# Structure for the `t_alert_history` table :
#

DROP TABLE IF EXISTS `t_alert_history`;

CREATE TABLE `t_alert_history` (
  `ID` int(10) NOT NULL auto_increment COMMENT '自增主键',
  `ALERTID` varchar(128) default NULL COMMENT '告警序列号',
  `NODE` varchar(128) default NULL COMMENT '网元（MASID）',
  `LEVEL` varchar(16) default NULL COMMENT '告警级别',
  `TYPE` varchar(16) default NULL COMMENT '告警类型',
  `CAUSE` int(10) default NULL COMMENT '告警原因',
  `TITLE` varchar(128) default NULL COMMENT '告警标题',
  `CONTENT` varchar(255) default NULL COMMENT '告警内容',
  `IS_SPECIAL` bit(1) default NULL COMMENT '是否特定告警',
  `SOLVE_USER` int(1) default NULL COMMENT '解决人员',
  `SOLUTION` varchar(255) default NULL COMMENT '告警解决方案',
  `EVENT_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '告警时间',
  `SOLVE_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '解决时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='告警历史表';

#
# Structure for the `t_birthday_set` table :
#

DROP TABLE IF EXISTS `t_birthday_set`;

CREATE TABLE `t_birthday_set` (
  `ID` int(11) NOT NULL COMMENT '编号',
  `SENDCONTENT` varchar(2000) default NULL COMMENT '发送短信内容',
  `SENDTIME` varchar(20) default NULL COMMENT '生日提醒时间',
  `BIRTHDAY_STATUS` bit(1) default '\0' COMMENT '提醒状态 0-启用，1-禁用',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生日祝福信息表';

#
# Structure for the `t_log` table :
#

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自增长的主键',
  `LOGLEVEL` int(1) default NULL COMMENT '日志级别',
  `TYPE` int(1) default NULL COMMENT '日志类型(操作日志:1,运行日志:2,用户日志:3,安全日志:4)',
  `STATUS` int(1) default NULL COMMENT '日志状态',
  `MESSAGE` text COMMENT '日志内容',
  `LOGDATE` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '记录日志时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录MAS服务器中生成的日志(操作日志、运行日志、用户日志和安全';

#
# Structure for the `t_poll_def` table :
#

DROP TABLE IF EXISTS `t_poll_def`;

CREATE TABLE `t_poll_def` (
  `pollid` int(11) NOT NULL COMMENT '关键字',
  `title` varchar(50) default NULL COMMENT '标题',
  `tip` varchar(200) default NULL COMMENT '提示',
  `validity` datetime default NULL COMMENT '有效截止期',
  `status` int(11) default '0' COMMENT '0-有效的；1-无效的',
  `attender` text COMMENT '参投人员手机号码,用分号隔开多个。"*"表示公开性质的投票调查',
  `choosecount` int(11) default '1' COMMENT '最多可投票次数，每次不可投相同的对象',
  `createtime` date default NULL COMMENT '创建时间',
  PRIMARY KEY  (`pollid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `t_poll_object` table :
#

DROP TABLE IF EXISTS `t_poll_object`;

CREATE TABLE `t_poll_object` (
  `pollid` int(11) NOT NULL COMMENT '投票编号，对应t_poll_def表中id',
  `candidate` varchar(100) default NULL COMMENT '候选人',
  `letter` varchar(1) default NULL COMMENT '短信投票上行字母'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票对象表';

#
# Structure for the `t_poll_record` table :
#

DROP TABLE IF EXISTS `t_poll_record`;

CREATE TABLE `t_poll_record` (
  `pollid` int(11) default NULL COMMENT '投票编号，对应t_poll_def表中id',
  `mobile` varchar(20) default NULL COMMENT '参与投票的手机号码',
  `letter` varchar(1) default NULL COMMENT '投票对象上行的字母，和t_poll_object表中letter匹配',
  `polltime` datetime default NULL COMMENT '投票时间',
  `message` varchar(100) default NULL COMMENT '投票人实际上行的内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票记录表';

#
# Structure for the `t_workplan` table :
#

DROP TABLE IF EXISTS `t_workplan`;

CREATE TABLE `t_workplan` (
  `ID` int(11) NOT NULL auto_increment COMMENT '工作安排编号',
  `WORKPLAN_TITLE` varchar(50) default NULL COMMENT '工作安排编标题',
  `WORKPLAN_CONTENT` varchar(2000) default NULL COMMENT '工作安排内容',
  `WORKPLAN_MOBILE` text COMMENT '工作安排手机号码',
  `WORKPLAN_RULE` varchar(20) default NULL COMMENT '工作安排提醒规则',
  `WORKPLAN_STATUS` int(11) default '0' COMMENT '提醒状态 0:不提醒 1:提醒',
  `WORKPLAN_FLAG` int(11) default '0' COMMENT '发送标示',
  `WORKPLAN_CREATETIME` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `WORKPLAN_STATUS_FLAG` int(11) default '0' COMMENT '提醒标示',
  `WORKPLAN_SENDTIME` timestamp NOT NULL default '2000-01-01 00:00:00' COMMENT '提醒发送时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作安排信息表';



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
#
# Data for the `fund_extcode` table  (LIMIT 0,500)
#

INSERT INTO `fund_extcode` (`2m`) VALUES
  ('80'),
  ('81'),
  ('82'),
  ('83'),
  ('84'),
  ('85'),
  ('86'),
  ('87'),
  ('88'),
  ('89'),
  ('90'),
  ('91'),
  ('92'),
  ('93'),
  ('94'),
  ('95'),
  ('96'),
  ('97'),
  ('98'),
  ('99');

COMMIT;

#
# Data for the `mas_mib_switch` table  (LIMIT 0,500)
#

INSERT INTO `mas_mib_switch` (`ID`, `IPADDR`, `SYSTEMDESC`, `SYSTEMTYPE`, `SWITCHTYPE`, `READSWITCH`, `TRAPSWITCH`, `TRAPTYPE`, `OTHERSWITCH`, `UPDATETIME`, `UPDATEUSER`) VALUES
  (1,'218.206.178.32','统一服务平台',1,0,1,1,3,0,'2009-07-22 08:47:21','admin'),
  (2,'192.168.18.138','QOS管理系统',2,0,1,1,3,0,'2009-07-22 10:26:16','admin'),
  (3,'192.168.18.86','集团网关系统',3,0,1,1,3,0,'2009-07-21 17:42:23','1'),
  (4,'192.168.18.66','其他系统',0,0,1,1,3,0,'2009-07-21 17:42:23','1'),
  (5,'MAINTAINSWITCH','升级维护开关',0,1,0,0,0,1,'2009-07-21 17:42:23','1');

COMMIT;

#
# Data for the `mas_mib_upgrade` table  (LIMIT 0,500)
#

INSERT INTO `mas_mib_upgrade` (`ID`, `UPGRADEINFO`, `SERVERADDR`, `USERNAME`, `PASSWD`, `FILEPATH`, `RECEIVETIME`, `CONFIRMTIME`, `CONFIRMSTATUS`, `CONFIRMUSER`, `FTPINFO`) VALUES
  (1,'192.168.20.3,username,123456,sss ','192.168.20.3','username','123456','sss ','2009-07-21 22:10:33','2009-07-21 22:10:43',1,'admin','upgrade:192.168.20.3,username,123456,sss '),
  (2,'218.106.177.204,ftplog,ftplog,/','218.106.177.204','ftplog','ftplog','/','2009-07-22 10:03:14','2009-07-22 10:03:26',1,'admin','upgrade:218.106.177.204,ftplog,ftplog,/|log:218.206.178.32,ftplog,ftplog,/,120000,0.1');

COMMIT;

#
# Data for the `mas_reply_checkcount` table  (LIMIT 0,500)
#

INSERT INTO `mas_reply_checkcount` (`ID`, `FUNNAME`, `FUNCOUNT`, `MAXNUM`, `MINNUM`, `RESERVE`) VALUES
  (1,'SMS',1,4000,1,NULL);

COMMIT;

#
# Data for the `mas_sms_limit` table  (LIMIT 0,500)
#

INSERT INTO `mas_sms_limit` (`id`, `userID`, `limitCount`, `currentCount`) VALUES
  (1,-1,0,-1);

COMMIT;

#
# Data for the `sa_menu` table  (LIMIT 0,500)
#

INSERT INTO `sa_menu` (`ID`, `PARENT_NAME`, `NAME`, `TITLE`, `DESCRIPTION`, `LOCATION`, `TARGET`, `ONCLICK`, `ONMOUSEOVER`, `ONMOUSEOUT`, `IMAGE`, `ALTIMAGE`, `TOOLTIP`) VALUES
  (1000,'','MENU_SMS','WEB短信',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1001,'MENU_SMS','SUBMENU_SMS_SEND','短信发送',NULL,'/sms/sendSms.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1002,'MENU_SMS','SUBMENU_SMS_INBOX','收件箱',NULL,'/sms/listSmsMo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1003,'MENU_SMS','SUBMENU_SMS_OUTBOX','已发件箱',NULL,'/sms/listSmsMt.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1004,'MENU_SMS','SUBMENU_SMS_WAITOUTBOX','待发件箱',NULL,'/sms/listWaitSmsMt.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1005,'MENU_SMS','SUBMENU_SMS_DRAFTS','草稿箱',NULL,'/sms/listDrafts.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1006,'MENU_SMS','SUBMENU_SMS_BATCH','批量发送',NULL,'/sms/batchSendSms.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2000,'','MENU_MMS','WEB彩信',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2001,'MENU_MMS','SUBMENU_MMS_SEND','彩信发送',NULL,'/mms/sendMms.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2002,'MENU_MMS','SUBMENU_MMS_INBOX','收件箱',NULL,'/mms/listMmsMo.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2003,'MENU_MMS','SUBMENU_MMS_OUTBOX','发件箱',NULL,'/mms/listMmsMt.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2004,'MENU_MMS','SUBMENU_MMS_MODE','彩信模板','','/mms/modelMms.do',NULL,'','','','','',''),
  (2005,'MENU_MMS','SUBMENU_MMS_LIST_DRAFTS','草稿箱',NULL,'/mms/listDrafts.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3000,'','MENU_WAPPUSH','WAP推送',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3001,'MENU_WAPPUSH','SUBMENU_WAPPUSH_SEND','WAP推送',NULL,'/wappush/sendWappush.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3002,'MENU_WAPPUSH','SUBMENU_WAPPUSH_STATUS','状态查询',NULL,'/wappush/wappushlist.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4000,'','MENU_LBS','移动定位',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4001,'MENU_LBS','SUBMENU_LBS_REQUEST','移动定位',NULL,'/lbs/lbsRequest.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4002,'MENU_LBS','SUBMENU_LBS_TLRREQUEST','结果查询',NULL,'/lbs/lbsTlrsRstList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5000,'','MENU_USSD','USSD管理',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5001,'MENU_USSD','SUBMENU_USSD_REQUEST','USSD配置',NULL,'/ussd/ussdInfo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5002,'MENU_USSD','SUBMENU_USSD_SESSION','USSD查询',NULL,'/ussd/ussdList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5501,'','MENU_BUSI','业务应用','','',NULL,'','','','','',''),
  (5502,'MENU_BUSI','SUBMENU_SMS_SECURITY','短信防伪','','/smsAntifake/smsAntifake.do',NULL,'','','','','',''),
  (5503,'MENU_BUSI','SUBMENU_METING','会议通知','','/corpsms/meeting.do',NULL,'','','','','',''),
  (5504,'MENU_BUSI','SUBMENU_WORKPLAN','工作安排','','/workplan/createWorkPlan.do',NULL,'','','','','',''),
  (5505,'MENU_BUSI','SUBMENU_WORKPLAN_MANAGE','工作管理','','/workplan/workPlanList.do',NULL,'','','','','',''),
  (5506,'MENU_BUSI','SUBMENU_COMPLAINT','举报投诉','','/complaint.do',NULL,'','','','','',''),
  (5507,'MENU_BUSI','SUBMENU_POLL','投票调查','','/poll/poll.do',NULL,'','','','','',''),
  (5508,'MENU_BUSI','SUBMENU_SCHEDULE_REMINDER','日程提醒','','/schedule/schedule.do',NULL,'','','','','',''),
  (5509,'MENU_BUSI','SUBMENU_BIRTHDAY_REMINDER','生日提醒','','/birthday/birthdaySet.do',NULL,'','','','','',''),
  (5510,'MENU_BUSI','SUBMENU_BROARDCAST','广播与查询','','/ServiceDefine/broadcast.do',NULL,'','','','','',''),
  (6000,'','MENU_BUSINESS','查询管理',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6001,'MENU_BUSINESS','SUBMENU_LOG','平台日志查询',NULL,'/log/logList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6002,'MENU_BUSINESS','SUBMENU_BUSINESS_LOG','业务日志查询',NULL,'/business/businesslog.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6003,'MENU_BUSINESS','SUBMENU_SMS_QUERY_MO','上行短信查询',NULL,'/sms/querySM.do?act=querymo\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6004,'MENU_BUSINESS','SUBMENU_SMS_QUERY_MT','下行短信查询',NULL,'/sms/querySM.do?act=querymt\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6005,'MENU_BUSINESS','SUBMENU_MMS_QUERY_MO','上行彩信查询',NULL,'/mms/queryMM.do?act=querymo',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6006,'MENU_BUSINESS','SUBMENU_MMS_QUERY_MT','下行彩信查询',NULL,'/mms/queryMM.do?act=querymt',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6007,'MENU_BUSINESS','SUBMENU_QUERY','部门业务统计',NULL,'/query/queryList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6008,'MENU_BUSINESS','SUBMENU_BUSINESS_FLUX','业务流量统计',NULL,'/business/businessflux.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (7000,'','MENU_ELEMENT','B/S插件',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (7001,'MENU_ELEMENT','SUBMENU_ELEMENT_ADD','用户操作','','/bsplug/elementAdd.do',NULL,'','','','','',''),
  (7002,'MENU_ELEMENT','SUBMENU_ELEMENT_FILTER','日志查看','','/bsplug/elementFilter.do',NULL,'','','','','',''),
  (7003,'MENU_ELEMENT','SUBMENU_ELEMENT_REPLACE','告警查看','','/bsplug/elementReplace.do',NULL,'','','','','',''),
  (7005,'MENU_ELEMENT','SUBMENU_ELEMENT_LAYOUTINFO','配置管理','','/bsplug/layoutInfo.do',NULL,'','','','','',''),
  (8000,'','MENU_PLUGIN','插件管理',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8001,'MENU_PLUGIN','SUBMENU_PLUGIN_PLUGINMNG','插件管理',NULL,'/plugin/PluginMng.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8002,'MENU_PLUGIN','SUBMENU_PLUGIN_PLUGINLIST','插件注册',NULL,'/plugin/pluginList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8003,'MENU_PLUGIN','SUBMENU_PLUGIN_PLUGINVALVELIST','阀值设置',NULL,'/plugin/pluginValveList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8004,'MENU_PLUGIN','SUBMENU_PLUGIN_DBPLUGMNG','DB插件适配',NULL,'/dbplug/dbplug.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8005,'MENU_PLUGIN','SUBMENU_PLUGIN_PLUGINFLUX','插件流量',NULL,'/plugin/pluginFlux.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9000,'','MENU_APPCONNCET','应用接入',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9001,'MENU_APPCONNCET','SUBMENU_APP_CONNECT','客户信息',NULL,'/appinfo/appECInfo.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9002,'MENU_APPCONNCET','SUBMENU_APP_RELATION','接入信息',NULL,'/appinfo/appConnectInfo.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9003,'MENU_APPCONNCET','SUBMENU_APP_ORDER','订购关系',NULL,'/appinfo/appOrderRelation.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9004,'MENU_APPCONNCET','SUBMENU_APP_FORBIDDEN','黑白名单',NULL,'/appinfo/forbidden.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9006,'MENU_APPCONNCET','SUBMENU_WEBTRANSMIT','HTTP代理','','/proxyRelation/ProxyRelation.do',NULL,'','','','','',''),
  (10000,'','MENU_MANAGEMENT','管理平台',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10001,'MENU_MANAGEMENT','SUBMENU_SOAP','通讯能力',NULL,'/soap/soap.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10002,'MENU_MANAGEMENT','SUBMENU_SNMP','信息配置',NULL,'/soap/masid.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10003,'MENU_MANAGEMENT','SUBMENU_HOST','设备配置',NULL,'/snmp/host.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10004,'MENU_MANAGEMENT','SUBMENU_TS','时间同步',NULL,'/snmp/ts.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10005,'MENU_MANAGEMENT','SUBMENU_MIB_UPGRADE','升级通知',NULL,'/snmp/mibUpgrade.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10006,'MENU_MANAGEMENT','SUBMENU_MIB_SWITCH','控制开关',NULL,'/snmp/mibSwitch.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10007,'MENU_MANAGEMENT','SUBMENU_BIZCONFIG','业务配置',NULL,'/soap/businessConfigure.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11000,'','MENU_ADDRESS','地址薄',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11001,'MENU_ADDRESS','SUBMENU_ADDR_ORG','部门信息',NULL,'/address/organizeInfo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11002,'MENU_ADDRESS','SUBMENU_ADDR_EMPLOYEE','员工信息',NULL,'/address/userInfo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11003,'MENU_ADDRESS','SUBMENU_ADDR_GROUP','群组信息',NULL,'/address/groupInfo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11004,'MENU_ADDRESS','SUBMENU_ADDR_ADDBOOK','通讯录',NULL,'/address/addbook.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11005,'MENU_ADDRESS','SUBMENU_ADDR_ADDGROUP','通讯录分组',NULL,'/address/addbookGroup.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12000,'','MENU_QOS','QOS统计',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12001,'MENU_QOS','SUBMENU_BUSINESS_CONNECTSTATUS','连接状态',NULL,'/qos/connectStatus.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12002,'MENU_QOS','SUBMENU_BUSINESS_MTDELAY','下行时延',NULL,'/qos/mtDelay.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12003,'MENU_QOS','SUBMENU_BUSINESS_MTNUM','下行成功率',NULL,'/qos/mtNum.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (13000,'','MENU_ALERT','告警管理',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (13001,'MENU_ALERT','SUBMENU_ACTIVE_ALERT','实时告警',NULL,'/alert/activeAlert.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (13002,'MENU_ALERT','SUBMENU_HISTORY_ALERT','历史告警',NULL,'/alert/historyAlert.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14000,'','MENU_SYSTEM','系统管理',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14001,'MENU_SYSTEM','SUBMENU_USER','用户管理',NULL,'/security/sysUser.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14002,'MENU_SYSTEM','SUBMENU_ROLE','角色管理',NULL,'/security/sysRole.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14003,'MENU_SYSTEM','SUBMENU_RESOURCE','资源管理',NULL,'/security/sysResource.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14004,'MENU_SYSTEM','SUBMENU_MENU','菜单管理',NULL,'/menu.do?act=list',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14005,'MENU_SYSTEM','SUBMENU_CODE','代码设置',NULL,'/code/codeType.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14006,'MENU_PLUGIN','SUBMENU_PLUGIN_PE','PE插件','','/plugin/PluginMng.do?act=pushmailMng',NULL,'','','','','',''),
  (14007,'MENU_SYSTEM','SUBMENU_SMS_ROUTE','路由设置',NULL,'/route.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (24001,'MENU_SYSTEM','SMS_LIMIT','短信限额','','/smslimt/smsLimit.do',NULL,'','','','','',''),
  (24002,'MENU_MMS','SUBMENU_MMS_MATERIAL','彩信素材','','/mms/material.do',NULL,'','','','','',''),
  (24005,'MENU_SYSTEM','BACK_UP_CONFIG','备份配置','','/db/backUpConfig.do',NULL,'','','','','',''),
  (24006,'MENU_SYSTEM','BACK_UP','数据备份','','/db/backUp.do',NULL,'','','','','',''),
  (24007,'MENU_SYSTEM','COME_BACK','数据恢复','','/db/comeBack.do',NULL,'','','','','','');

COMMIT;

#
# Data for the `sys_code` table  (LIMIT 0,500)
#

INSERT INTO `sys_code` (`CODE_NAME`, `CODE_VALUE`, `CODE_DESC`, `TYPE_NAME`, `SHOW_ORDER`) VALUES
  ('ALARMSWITCH','true','MAS告警开关','MAS',10),
  ('ALERTSTORMINTERVAL','60','告警风暴过滤的时间间隔（单位：秒）','ALERT',1),
  ('ALLOWMAXCOUNTER','3','在指定的告警风暴时间间隔内可告警的最大次数(分钟)','ALERT',2),
  ('APID_BROADCAST','P000000000008001','广播查询插件编号','BUSI_APP',10),
  ('APPEMAILUSERLIMIT','100','MAS的当前EMAIL限制用户数','MIB-READWRITE',17),
  ('APPINFOSYNCSERVICE','com.royasoft.mas.core.appinfo.AppInfoSyncService','同步集团客户应用信息','SYSTEM_SERVICE',1),
  ('APPLICATIONMMGWIP','218.206.176.175','行业网关彩信模块IP','MIB-READWRITE',8),
  ('APPLICATIONSMGWIP','218.206.176.169','行业网关短信模块IP','MIB-READWRITE',5),
  ('APPLICATIONUSSDGWIP','218.206.178.41','行业网关USSD模块IP','MIB-READWRITE',9),
  ('APPLICATIONWAPGWIP','192.168.230.8','行业网关WAP模块IP','MIB-READWRITE',10),
  ('APPLICATION_ID','P000000000008001','应用ID','WEB_LBS',1),
  ('APPLICATION_ID','P000000000008002','应用ID','WEB_MMS',1),
  ('APPLICATION_ID','P000000000008001','WEB短信应用ID','WEB_SMS',2),
  ('APPLICATION_ID','P000000000008001','应用ID','WEB_WEBPUSH',1),
  ('APPMMSPCODE','9105','MAS彩信接入号SPCODE','MIB-READ',36),
  ('APPMMSSENDSPEEDLIMIT','50','MAS的当前彩信下发速度限制','MIB-READWRITE',14),
  ('APPMMSSPID','9105','MAS彩信接入SPID','MIB-READWRITE',7),
  ('APPSMGWLOGINUSER','910055','MAS登录网关用户名','MIB-READWRITE',11),
  ('APPSMGWPASSWD','910055','MAS登录网关密码','MIB-READWRITE',12),
  ('APPSMGWPORT','7890','行业网关短信模块端口','MIB-READWRITE',6),
  ('APPSMSSENDSPEEDLIMIT','300','MAS的当前短信下发速度限制','MIB-READWRITE',13),
  ('APPSMSSPCODE','910055','MAS短信接入号SPCODE','MIB-READ',35),
  ('APPSMSSPID','910055','MAS短信接入SPID','MIB-READWRITE',4),
  ('APPSWNAME','Mobile Agent Server','应用软件名称','MIB-READ',16),
  ('APPSWVENDOR','RoyaSoft','应用软件开发商','MIB-READ',18),
  ('APPSWVERSION','2.0','应用软件版本','MIB-READ',17),
  ('APPSYSTEMPROCESSSTATE','0','MAS各个模块运行状态','MIB-READ',37),
  ('APPUSSDUSERLIMIT','100','MAS的当前USSD限制用户数','MIB-READWRITE',16),
  ('APPWAPUSERLIMIT','100','MAS的当前WAP限制用户数','MIB-READWRITE',15),
  ('AUTHENTICATIONMODE','0','鉴权方式','MMS',1),
  ('AUTHFAILDCOUNT','3','MAS鉴权失败次数','MAS',63),
  ('AUTHFAILDINTERVAL','60','鉴权无响应重传周期(单位秒)','MAS',62),
  ('AUTHINTERVAL','3600','MAS鉴权时间间隔(单位:秒)','MAS',7),
  ('AUTHPASSWORD','123456','MAS注册鉴权密码','MAS',3),
  ('AUTHSWITCH','true','MAS注册鉴权开关','MAS',4),
  ('AUTHURL','http://192.168.18.29:8080/services/MASManagementServiceSoap','MAS认证url','MAS',2),
  ('AUTH_ID_URL_UPDATE','TRUE','更改MASID或者URL是否跳过注册去鉴权','MAS',59),
  ('AUTH_PRERIOD_UPDATE','FALSE','更改时间戳周期是否立即鉴权','MAS',58),
  ('B/S插件','-','-','RESOURCEGROUP',8),
  ('BACKLOG','50','BackLog','MMS',14),
  ('BACKUP_DIR','/mysql/backup','数据库备份文件存放目录','DB',2),
  ('BACKUP_FLAG','false','数据库备份标识','DB',1),
  ('BIRTHDAYREMINSERVICE','com.royasoft.mas.web.birthday.BirthdayReminService','生日提醒','SYSTEM_SERVICE',1),
  ('BIZ_CODE','001','业务代码','WEB_MMS',3),
  ('BIZ_CODE','910119','WEB短信业务代码','WEB_SMS',1),
  ('BIZ_CODE','910119','业务代码','WEB_WEBPUSH',3),
  ('BOSS_FTP_CONNECT_MODE','PASV','BOSS文件服务器连接模式','APP_CONNECT',6),
  ('BOSS_FTP_PASSWORD','royasoft','BOSS文件服务器密码','APP_CONNECT',3),
  ('BOSS_FTP_SERVER_IP','192.168.18.158','BOSS文件服务器IP','APP_CONNECT',4),
  ('BOSS_FTP_SERVER_ROOT_DIR','/appinfo','BOSS文件服务器根目录','APP_CONNECT',5),
  ('BOSS_FTP_USERNAME','royasoft','BOSS文件服务器用户名','APP_CONNECT',2),
  ('BROADCASTSERVICE','com.royasoft.mas.core.masoperation.BroadcastService','广播','SYSTEM_SERVICE',1),
  ('BROADCAST_SMS_STATUS_HANDLER','com.royasoft.mas.core.sms.handler.BroadcastSMSStatusHandler','广播短信状态处理类','HANDLER',4),
  ('BUSINESSSERVICE','com.royasoft.mas.core.business.BusinessService','业务日志','SYSTEM_SERVICE',1),
  ('CAPACITYBREAKOUTINTERVAL','3','能力中断告警时间间隔(分钟)','ALERT',7),
  ('CHARSET','GB2312','对消息编码的字符集','MMS',8),
  ('CHECKSCHEDULESERVICE','com.royasoft.mas.web.schedule.CheckScheduleService','广播','SYSTEM_SERVICE',0),
  ('COMMIT_INTERVAL','1000','','DBPLUG_SMS',2),
  ('COMMUNICATION','99999999','MAS通讯能力','MAS',8),
  ('CONNECTSTATUS','com.royasoft.mas.service.soap.ConnectStatus','管理平台连接状态管理','SYSTEM_SERVICE',1),
  ('CONNECTTIMES','10','管理平台连接的状态判断周期','MAS',64),
  ('CONNSTATUSCRM','2','与CRM系统连接状态','MIB-READ',133),
  ('CONNSTATUSDETECT','com.royasoft.mas.core.qos.service.ConnStatusDetect','MAS服务器连接通断状态判断','SYSTEM_SERVICE',1),
  ('CONNSTATUSEMAIL','0','与EMAIL系统连接状态','MIB-READ',134),
  ('CONNSTATUSERP','2','与ERP系统连接状态','MIB-READ',130),
  ('CONNSTATUSIA','2','与行业应用系统连接状态','MIB-READ',135),
  ('CONNSTATUSIAGW','1','与行业网关的连接状态','MIB-READ',125),
  ('CONNSTATUSLSP','0','与LSP连接状态','MIB-READ',128),
  ('CONNSTATUSMAILPUSH','1','与邮件推送网关连接状态','MIB-READ',127),
  ('CONNSTATUSMSP','0','与MAS统一服务平台连接状态','MIB-READ',137),
  ('CONNSTATUSOA','2','与OA系统连接状态','MIB-READ',131),
  ('CONNSTATUSOTHER','2','与其它应用系统连接状态','MIB-READ',136),
  ('CONNSTATUSQOS','0','与QOS管理端连接状态','MIB-READ',129),
  ('CONNSTATUSSCM','2','与SCM系统连接状态','MIB-READ',132),
  ('CONNSTATUSWAP','0','与WAP网关的连接状态','MIB-READ',126),
  ('CORPSMSSERVICE','com.royasoft.mas.core.corpsms.CorpSMSService','企业短信 ','SYSTEM_SERVICE',1),
  ('CPULIMIT','100','MAS CPU最大使用率限制','MAS',15),
  ('CPULOAD','26','CPU占用率','MIB-READ',38),
  ('CPUNUMBER','2','CPU总数','MIB-READ',10),
  ('CPUWORKFREQ','3456','CPU主频','MIB-READ',9),
  ('CRMEMAIL','1','','MAS',23),
  ('CRMFLAG','1','CRM业务开通标志','MIB-READ',25),
  ('CRMGPRSONLINEUSERCOUNT','0','','MIB-COUNT',50),
  ('CRMLBS','1','','MAS',27),
  ('CRMLBSCOUNT','0','','MIB-COUNT',52),
  ('CRMLBSFAILCOUNT','0','','MIB-COUNT',57),
  ('CRMMMS','1','','MAS',24),
  ('CRMMMSMOCOUNT','0','','MIB-COUNT',47),
  ('CRMMMSMTCOUNT','0','','MIB-COUNT',48),
  ('CRMMTMMFAILCOUNT','0','','MIB-COUNT',54),
  ('CRMMTSMFAILCOUNT','0','','MIB-COUNT',53),
  ('CRMSMS','1','','MAS',25),
  ('CRMSMSMOCOUNT','0','','MIB-COUNT',45),
  ('CRMSMSMTCOUNT','0','','MIB-COUNT',46),
  ('CRMUSSD','1','','MAS',26),
  ('CRMUSSDFAILCOUNT','0','','MIB-COUNT',55),
  ('CRMUSSDONLINEUSERCOUNT','0','','MIB-COUNT',51),
  ('CRMWAP','1','','MAS',27),
  ('CRMWAPONLINEUSERCOUNT','0','','MIB-COUNT',49),
  ('CRMWAPPUSHFAILCOUNT','0','','MIB-COUNT',56),
  ('CRMWEB','1','','MAS',27),
  ('CURR_SMS_LIMT','70','系统当前发送短信总数','SMS',2),
  ('DBPLUGADAPTERSERVICE','com.royasoft.mas.core.dbplug.DBPlugAdapterService','数据库插件','SYSTEM_SERVICE',1),
  ('DBPLUG_MMS_RECEIVE_HANDLER','com.royasoft.mas.core.mms.handler.DBPlugMMReceiveHandler','DB插件彩信上行处理类','HANDLER',2),
  ('DBPLUG_MMS_STATUS_HANDLER','com.royasoft.mas.core.mms.handler.DBPlugMMStatusHandler','DB插件彩信状态处理类','HANDLER',5),
  ('DBPLUG_SMS_RECEIVE_HANDLER','com.royasoft.mas.core.sms.handler.DBPlugSMSReceiveHandler','DB插件短信上行处理类','HANDLER',1),
  ('DBPLUG_SMS_STATUS_HANDLER','com.royasoft.mas.core.sms.handler.DBPlugSMSStatusHandler','DB短信状态处理类','HANDLER',4),
  ('DBPLUG_WAPPUSH_STATUS_HANDLER','com.royasoft.mas.core.wappush.handler.DbPlugWapPushStatusHandler','DB WapPush状态处理类','HANDLER',6),
  ('DBSWNAME','MySQL 5.0.27-community-log','数据库软件的类型','MIB-READ',19),
  ('DBSWVENDOR','MySQL','数据库软件的开发商','MIB-READ',21),
  ('DBSWVERSION','5.0.27-community-log','数据库软件的版本','MIB-READ',20),
  ('DEVICEIPADDRESS','192.168.0.64','IP地址','MIB-READ',8),
  ('DEVICEMACCODE','00-1A-73-EC-27-00','MAC地址','MIB-READ',7),
  ('DEVICENAME','user-4b424730f1','设备命名','MIB-READ',5),
  ('DEVICEVENDORNAME','ROYA','设备厂商','MIB-READ',6),
  ('DIGEST','','摘要','MMS',4),
  ('DISKLIMIT','100','MAS DISK最大使用率限制','MAS',16),
  ('DISKMAXCONTENT','114462','硬盘容量','MIB-READ',12),
  ('DISKUSED','48','磁盘占用率','MIB-READ',40),
  ('EMAILEMAIL','1','','MAS',28),
  ('EMAILFLAG','1','MAIL业务开通标志','MIB-READ',26),
  ('EMAILLBS','1','','MAS',32),
  ('EMAILMMS','1','','MAS',29),
  ('EMAILMMSMOCOUNT','0','','MIB-COUNT',42),
  ('EMAILMMSMTCOUNT','0','','MIB-COUNT',43),
  ('EMAILSMS','1','','MAS',30),
  ('EMAILSMSMOCOUNT','0','','MIB-COUNT',40),
  ('EMAILSMSMTCOUNT','0','','MIB-COUNT',41),
  ('EMAILUSSD','1','','MAS',31),
  ('EMAILWAP','1','','MAS',32),
  ('EMAILWAPONLINEUSERCOUNT','0','','MIB-COUNT',44),
  ('EMAILWEB','1','','MAS',32),
  ('ENABLE_BLACK_LIST','true','是否启用黑白名单','APP_CONNECT',11),
  ('ERPEMAIL','1','','MAS',33),
  ('ERPFLAG','1','ERP业务开通标志','MIB-READ',22),
  ('ERPGPRSONLINEUSERCOUNT','0','','MIB-COUNT',6),
  ('ERPLBS','1','','MAS',37),
  ('ERPLBSCOUNT','0','','MIB-COUNT',8),
  ('ERPLBSFAILCOUNT','0','','MIB-COUNT',13),
  ('ERPMMS','1','','MAS',34),
  ('ERPMMSMOCOUNT','0','','MIB-COUNT',3),
  ('ERPMMSMTCOUNT','0','','MIB-COUNT',4),
  ('ERPMTMMFAILCOUNT','0','','MIB-COUNT',10),
  ('ERPMTSMFAILCOUNT','0','','MIB-COUNT',9),
  ('ERPSMS','1','','MAS',35),
  ('ERPSMSMOCOUNT','0','','MIB-COUNT',1),
  ('ERPSMSMTCOUNT','0','','MIB-COUNT',2),
  ('ERPUSSD','1','','MAS',36),
  ('ERPUSSDFAILCOUNT','0','','MIB-COUNT',11),
  ('ERPUSSDONLINEUSERCOUNT','0','','MIB-COUNT',7),
  ('ERPWAP','1','','MAS',37),
  ('ERPWAPONLINEUSERCOUNT','0','','MIB-COUNT',5),
  ('ERPWAPPUSHFAILCOUNT','0','','MIB-COUNT',12),
  ('ERPWEB','1','','MAS',37),
  ('EXCEPTION_USER','admin','动态密码例外用户','SYS-ADMIN',1),
  ('EXIT_BLACKLIST_RULE','11111','加入白名单/退出黑名单短信规则库','APP_CONNECT',11),
  ('FAILCOUNT','1440','所有失败数目采集周期(分钟)','MIB-SCANPERIOD',8),
  ('FTPINFO','','MAS管理平台FTP信息','MIB-READWRITE',21),
  ('FTPSWITCH','true','MAS FTP上传开关','MAS',13),
  ('GET_SMS_AMOUNT','2000','短信最大获取下行条数','SMS',160),
  ('GPRSONLINEUSER','60','当前GPRS用户数采集周期(分钟)','MIB-SCANPERIOD',5),
  ('INDUSTRYEMAIL','1','','MAS',38),
  ('INDUSTRYFLAG','1','行业业务开通标志','MIB-READ',27),
  ('INDUSTRYGPRSONLINEUSERCOUNT','0','','MIB-COUNT',63),
  ('INDUSTRYLBS','1','','MAS',42),
  ('INDUSTRYLBSCOUNT','0','','MIB-COUNT',65),
  ('INDUSTRYLBSFAILCOUNT','0','','MIB-COUNT',70),
  ('INDUSTRYMMS','1','','MAS',39),
  ('INDUSTRYMMSMOCOUNT','0','','MIB-COUNT',60),
  ('INDUSTRYMMSMTCOUNT','0','','MIB-COUNT',61),
  ('INDUSTRYMTMMFAILCOUNT','0','','MIB-COUNT',67),
  ('INDUSTRYMTSMFAILCOUNT','0','','MIB-COUNT',66),
  ('INDUSTRYSMS','1','','MAS',40),
  ('INDUSTRYSMSMOCOUNT','0','','MIB-COUNT',58),
  ('INDUSTRYSMSMTCOUNT','0','','MIB-COUNT',59),
  ('INDUSTRYUSSD','1','','MAS',41),
  ('INDUSTRYUSSDFAILCOUNT','0','','MIB-COUNT',68),
  ('INDUSTRYUSSDONLINEUSERCOUNT','0','','MIB-COUNT',64),
  ('INDUSTRYWAP','1','','MAS',42),
  ('INDUSTRYWAPONLINEUSERCOUNT','0','','MIB-COUNT',62),
  ('INDUSTRYWAPPUSHFAILCOUNT','0','','MIB-COUNT',69),
  ('INDUSTRYWEB','1','','MAS',42),
  ('INTEGRALREMINDSERVICE','com.royasoft.mas.core.smsAntifake.IntegralRemindService','积分提醒','SYSTEM_SERVICE',1),
  ('ISMG_ACCOUNT','910119','<font color=red>登录用户名</font>','SMS',70),
  ('ISMG_PASSWORD','910119','<font color=red>登录密码</font>','SMS',80),
  ('ISMG_PORT','7890','<font color=red>短信网关服务器服务端口</font>','SMS',60),
  ('ISMG_SERVER','127.0.0.1','<font color=red>短信网关服务器地址</font>','SMS',50),
  ('ISTEST','false','测试模式','MAS',1),
  ('ISTESTPACKET','FALSE','是否跳过判断通讯是否正常而直接进行鉴权','MAS',60),
  ('IS_AUTO_ADD_BIZCODE','false','否自动添加业务代码 true表示添加，false表示不添加','MAS',61),
  ('IS_AUTO_ADD_BIZCODE','false','IS_AUTO_ADD_BIZCODE ','SMS',200),
  ('IS_NEED_SYNC_TO_BOSS','true','是否需要将签约信息文件同步BOSS','APP_CONNECT',10),
  ('IS_SERVICECODE_CONVERT','false','启用新旧号码转换功能开关','APP_CONNECT',16),
  ('LBSCLIENTID','1000015','定位帐号','LBS',2),
  ('LBSCLIENTPWD','1000015','定位密码','LBS',3),
  ('LBSCOUNT','60','定位请求数目采集周期(分钟)','MIB-SCANPERIOD',7),
  ('LBSFLAG','1','LBS能力开通标志','MIB-READ',33),
  ('LBSPUSHADDR','http://218.206.179.221:8080/LbsRecv','周期定位回调的Servlet','LBS',5),
  ('LBSSERVER','http://218.206.176.30:2234','定位服务平台','LBS',1),
  ('LBSSERVICEID','yewu15','定位服务ID','LBS',4),
  ('LISTENIP','218.206.179.221','彩信接受监听IP地址','MMS',12),
  ('LISTENPORT','55604','彩信接受监听端口','MMS',13),
  ('LOGINTERVAL','120','LogInterval','MMS',18),
  ('LOGLEVEL','6','日志级别','MMS',7),
  ('LOGNUM','100','LogNum','MMS',17),
  ('LOGPATH','/home/mas/vas_log','日志文件的路径','MMS',6),
  ('LOGSAVESERVICE','com.royasoft.mas.core.log.LogSaveService','平台日志','SYSTEM_SERVICE',0),
  ('LOGSIZE','1000','LogSize','MMS',19),
  ('LOG_FILTER_WORD','SnmpAgent:*,*日志上传成功*','日志信息过滤词，以逗号分割','MAS',18),
  ('LOG_SAME_INTERVAL','60','同类日志信息填写间隔不得小于(秒)','MAS',18),
  ('MASAUTH','com.royasoft.mas.service.soap.MasAuth','MAS服务器认证鉴权','SYSTEM_SERVICE',1),
  ('MASFTPHOST','218.206.178.32','MAS管理平台FTP地址','MAS',18),
  ('MASFTPINTERVAL','3600','MAS FTP周期(单位：秒)','MAS',18),
  ('MASFTPLEVEL','INFO','MAS FTP上传级别','MAS',18),
  ('MASFTPPASSWORD','ftplog','MAS管理平台FTP密码','MAS',20),
  ('MASFTPROOTDIR','/','MAS管理平台FTP目录','MAS',21),
  ('MASFTPTIME','120000','MAS FTP时间戳(格式:HHmmss)','MAS',18),
  ('MASFTPUSERNAME','ftplog','MAS管理平台FTP用户名','MAS',19),
  ('MASID','M01AH154700012','MAS服务器编码','MIB-READ',4),
  ('MASIP','','用来手动配置mas服务器的外网ip地址（当此网卡有多个ip的时候）如空缺程序会自动探测出mas服务器网卡的ip','MAS',1),
  ('MASREGISTER','com.royasoft.mas.service.soap.MasRegister','MAS服务器注册','SYSTEM_SERVICE',1),
  ('MASSYNCTIME','120000','MAS服务器时间同步','MAS',65),
  ('MAXMSGSIZE','100000','允许的最大消息的大小(字节)','MMS',5),
  ('MAX_COMMIT_COUNT','500','','DBPLUG_SMS',1),
  ('MAX_COMMIT_COUNT','2000','短信一次下行最大提交数','SMS',165),
  ('MAX_LOGON_FAIL_COUNT','5','允许登录失败的次数','SYS-ADMIN',4),
  ('MAX_MO_MMCACHE_OVERFLOW','2000','上行彩信缓存大小','MMS',51),
  ('MAX_MO_SMCACHE_OVERFLOW','2000','短信上行最大缓存','SMS',145),
  ('MAX_MT_MMCACHE_OVERFLOW','2000','下行彩信缓存大小','MMS',50),
  ('MAX_MT_SMCACHE_OVERFLOW','2000','短信下行最大缓存','SMS',140),
  ('MAX_REPORT_UPDATE_COUNT','100','更新短信状态报告次数-失败时','SMS',185),
  ('MAX_RESEND_COUNT','3','短信失败重发次数','SMS',170),
  ('MEMMAXCONTENT','1014','内存容量','MIB-READ',11),
  ('MEMORYLIMIT','100','MAS MEMORY最大使用率限制','MAS',17),
  ('MMCOMMIT_THREADPOOL_SIZE','5','提交彩信线程数','MMS',55),
  ('MMDISPATCH_THREADPOOL_SIZE','50','上行分发彩信线程数','MMS',54),
  ('MMSCIP','192.168.18.138:55603','彩信中心IP','MMS',10),
  ('MMSCOUNT','60','彩信数目采集周期(分钟)','MIB-SCANPERIOD',3),
  ('MMSCURL','/vas','彩信中心的URL','MMS',9),
  ('MMSFLAG','1','彩信能力开通标志','MIB-READ',30),
  ('MMSOVERFLOWINTERVAL','3','彩信上下行溢出告警时间间隔(分钟)','ALERT',5),
  ('MMSTATUS_THREADPOOL_SIZE','10','彩信状态分发线程数','MMS',52),
  ('MOBILE_PWD_CHECK','false','MAS动态密码开关','SYS-ADMIN',3),
  ('MPWD_MAX_TIME','300','动态密码有效时间（单位：秒）','SYS-ADMIN',2),
  ('MTDEALYDETECT','com.royasoft.mas.core.qos.service.MtDealyDetect','MAS延时统计','SYSTEM_SERVICE',1),
  ('MTDELAYMMS','0','MT彩信时延','MIB-READ',139),
  ('MTDELAYPUSHMAIL','0','MT PUSHMAIL时延','MIB-READ',142),
  ('MTDELAYSMS','354','MT短信时延','MIB-READ',138),
  ('MTDELAYUSSD','0','MT USSD时延','MIB-READ',140),
  ('MTDELAYWAPPUSH','0','MT WAP PUSH时延','MIB-READ',141),
  ('MTNUMMMS','0','MT彩信数量','MIB-READ',144),
  ('MTNUMPUSHMAIL','0','PUSHMAIL','MIB-READ',146),
  ('MTNUMRSPMMS','0','MT彩信成功数量','MIB-READ',148),
  ('MTNUMRSPPUSHMAIL','0','MT PUSHMAIL成功数量','MIB-READ',150),
  ('MTNUMRSPSMS','15','MT短信成功数量','MIB-READ',147),
  ('MTNUMRSPWAPPUSH','0','MT WAP PUSH成功数量','MIB-READ',149),
  ('MTNUMSMS','42','MT短信数量','MIB-READ',143),
  ('MTNUMWAPPUSH','0','MT WAP PUSH数量','MIB-READ',145),
  ('MYSQL_BIN_DIR','/MAS/mysql/bin','mysql bin目录','DB',3),
  ('MYSQL_DB_NAME','mas','需要备份的数据库','DB',6),
  ('MYSQL_PASSWORD','royasoft','mysql密码','DB',5),
  ('MYSQL_USER','root','mysql 用户','DB',4),
  ('OAEMAIL','1','','MAS',43),
  ('OAFLAG','1','OA业务开通标志','MIB-READ',23),
  ('OAGPRSONLINEUSERCOUNT','0','','MIB-COUNT',19),
  ('OALBS','1','','MAS',47),
  ('OALBSCOUNT','0','','MIB-COUNT',21),
  ('OALBSFAILCOUNT','0','','MIB-COUNT',26),
  ('OAMMS','1','','MAS',44),
  ('OAMMSMOCOUNT','0','','MIB-COUNT',16),
  ('OAMMSMTCOUNT','0','','MIB-COUNT',17),
  ('OAMTMMFAILCOUNT','0','','MIB-COUNT',22),
  ('OAMTSMFAILCOUNT','0','','MIB-COUNT',23),
  ('OASMS','1','','MAS',45),
  ('OASMSMOCOUNT','0','','MIB-COUNT',14),
  ('OASMSMTCOUNT','0','','MIB-COUNT',15),
  ('OAUSSD','1','','MAS',46),
  ('OAUSSDFAILCOUNT','0','','MIB-COUNT',24),
  ('OAUSSDONLINEUSERCOUNT','0','','MIB-COUNT',20),
  ('OAWAP','1','','MAS',47),
  ('OAWAPONLINEUSERCOUNT','0','','MIB-COUNT',18),
  ('OAWAPPUSHFAILCOUNT','0','','MIB-COUNT',25),
  ('OAWEB','1','','MAS',47),
  ('OSNAME','Windows XP','操作系统名称','MIB-READ',13),
  ('OSVENDOR','Microsoft','操作系统开发厂商','MIB-READ',15),
  ('OSVERSION','5.1','操作系统版本','MIB-READ',14),
  ('OTHEREMAIL','1','','MAS',48),
  ('OTHERFLAG','1','其他业务开通标志','MIB-READ',28),
  ('OTHERGPRSONLINEUSERCOUNT','0','','MIB-COUNT',76),
  ('OTHERINTERVAL','3','其他告警时间间隔(分钟)','ALERT',8),
  ('OTHERLBS','1','','MAS',52),
  ('OTHERLBSCOUNT','0','','MIB-COUNT',78),
  ('OTHERLBSFAILCOUNT','0','','MIB-COUNT',83),
  ('OTHERMMS','1','','MAS',49),
  ('OTHERMMSMOCOUNT','0','','MIB-COUNT',73),
  ('OTHERMMSMTCOUNT','0','','MIB-COUNT',74),
  ('OTHERMTMMFAILCOUNT','0','','MIB-COUNT',80),
  ('OTHERMTSMFAILCOUNT','0','','MIB-COUNT',79),
  ('OTHERSMS','1','','MAS',50),
  ('OTHERSMSMOCOUNT','0','','MIB-COUNT',71),
  ('OTHERSMSMTCOUNT','0','','MIB-COUNT',72),
  ('OTHERUSSD','1','','MAS',51),
  ('OTHERUSSDFAILCOUNT','0','','MIB-COUNT',81),
  ('OTHERUSSDONLINEUSERCOUNT','0','','MIB-COUNT',77),
  ('OTHERWAP','1','','MAS',52),
  ('OTHERWAPONLINEUSERCOUNT','0','','MIB-COUNT',75),
  ('OTHERWAPPUSHFAILCOUNT','0','','MIB-COUNT',82),
  ('OTHERWEB','1','','MAS',52),
  ('PASSWORD','royasoft','鉴权口令','MMS',3),
  ('PERFORMANCEINTERVAL','3','性能告警时间间隔(分钟)','ALERT',3),
  ('PHYMEMUSAGE','83','内存占用率','MIB-READ',39),
  ('PLUGINEMAIL','1','','MAS',57),
  ('PLUGINLBS','1','','MAS',57),
  ('PLUGINMMS','1','','MAS',57),
  ('PLUGINSMS','1','','MAS',57),
  ('PLUGINUSSD','1','','MAS',57),
  ('PLUGINWAP','1','PLUGINWAP','MAS',67),
  ('PLUGINWEB','1','','MAS',57),
  ('PROCESSMONITORINTERVAL','60','插件进程监控周期(单位：秒)','PLUGIN',1),
  ('PUSHMAILFLAG','1','PUSHMAIL能力开通标志','MIB-READ',34),
  ('PUSHMAILGWURL','http://218.206.176.146:443/gegw/GEGWIServlet','PUSHMAIL推送网关地址','MAS',10),
  ('PWD_EXPIRE_DAY','30','密码过期天数定义','SYS-ADMIN',20),
  ('PWD_EXPIRE_TIP','true','密码过期提醒开关<br>(on-提醒,off-不提醒)','SYS-ADMIN',10),
  ('QOSGWSTATUS','120','QOS连接状态统计的时间颗粒度(分钟)','MIB-SCANPERIOD',10),
  ('QOSMTDELAY','120','QOS延时统计的时间颗粒度(分钟)','MIB-SCANPERIOD',11),
  ('QOSMTNUM','120','QOS成功率统计的时间颗粒度(分钟)','MIB-SCANPERIOD',12),
  ('QOS统计','-','-','RESOURCEGROUP',13),
  ('QUERY_SMS_RECEIVE_HANDLER','com.royasoft.mas.core.sms.handler.QuerySMSReceiveHandler','查询插件短信上行处理类','HANDLER',1),
  ('READUPGRADEFLAG','1','是否有新的升级通知','MAS',20),
  ('READ_REPLY','true','是否需要读状态报告','MMS',20),
  ('REGAUTHTIME','094900','MAS认证鉴权时间戳(格式:HHmmss)','MAS',5),
  ('REGCOUNT','3','MAS认证注册失败告警次数','MAS',6),
  ('REGINTERVAL','120','MAS注册时间间隔-失败时(单位:秒)','MAS',5),
  ('RESENDCOUNT','2','重传次数','MMS',16),
  ('RESEND_INTERVAL','30','彩信失败重传初始周期(秒)','MMS',24),
  ('RESEND_INTERVAL','30','短信失败重传初始周期(秒)','SMS',190),
  ('RESETFLAG','0','重新启动控制标志','MIB-READWRITE',19),
  ('RESOURCEMONITORINTERVAL','60','插件占用资源监控周期（单位：秒）','PLUGIN',2),
  ('SCANBUSICAPDATATIME','000030','业务性能扫描时间戳','MIB-SCANPERIOD',1),
  ('SCANINTERVAL','1','数据采集周期(单位:分钟)','MAS',12),
  ('SCANQOSTIME','000000','QOS扫描时间戳','MIB-SCANPERIOD',9),
  ('SCANSWITCH','true','MAS性能采集开关','MAS',11),
  ('SCMEMAIL','1','','MAS',53),
  ('SCMFLAG','1','SCM业务开通标志','MIB-READ',24),
  ('SCMGPRSONLINEUSERCOUNT','0','','MIB-COUNT',32),
  ('SCMLBS','1','','MAS',57),
  ('SCMLBSCOUNT','0','','MIB-COUNT',34),
  ('SCMLBSFAILCOUNT','0','','MIB-COUNT',39),
  ('SCMMMS','1','','MAS',54),
  ('SCMMMSMOCOUNT','0','','MIB-COUNT',29),
  ('SCMMMSMTCOUNT','0','','MIB-COUNT',30),
  ('SCMMTMMFAILCOUNT','0','','MIB-COUNT',36),
  ('SCMMTSMFAILCOUNT','0','','MIB-COUNT',35),
  ('SCMSMS','1','','MAS',55),
  ('SCMSMSMOCOUNT','0','','MIB-COUNT',27),
  ('SCMSMSMTCOUNT','0','','MIB-COUNT',28),
  ('SCMUSSD','1','','MAS',56),
  ('SCMUSSDFAILCOUNT','0','','MIB-COUNT',37),
  ('SCMUSSDONLINEUSERCOUNT','0','','MIB-COUNT',33),
  ('SCMWAP','1','','MAS',57),
  ('SCMWAPONLINEUSERCOUNT','0','','MIB-COUNT',31),
  ('SCMWAPPUSHFAILCOUNT','0','','MIB-COUNT',38),
  ('SCMWEB','1','','MAS',57),
  ('SENSITIVEINTERVAL','3','敏感信息告警时间间隔(分钟)','ALERT',6),
  ('SERVICE_CODE','9109','服务代码','MMS',21),
  ('SERVICE_CODE','9109001','服务代码','WEB_MMS',2),
  ('SERVICE_CODE','910119001','WEB短信服务代码','WEB_SMS',1),
  ('SERVICE_CODE','9101190099','服务代码','WEB_WEBPUSH',2),
  ('SIM_SUBMIT_FAILURE','false','模拟失败重传','SMS',195),
  ('SMDELIVER_THREADPOOL_SIZE','10','短信上行处理线程池数','SMS',180),
  ('SMROUTE_CLASS','com.royasoft.mas.core.sms.route.Cmpp2Route','<font color=red>短信路由全路径类名</font>','SMS',40),
  ('SMROUTE_LOGON_INTERVAL','60','短信路由登录失败重连间隔时间(秒)','SMS',135),
  ('SMROUTE_LOGON_TRY_COUNT','1000','短信路由登录最大尝试次数','SMS',130),
  ('SMROUTE_SEND_RATE','3000','短信发送速率(条/秒)','SMS',155),
  ('SMSCOUNT','60','短信数目采集周期(分钟)','MIB-SCANPERIOD',2),
  ('SMSFLAG','1','短信能力开通标志','MIB-READ',29),
  ('SMSMOVESERVICE','com.royasoft.mas.core.sms.SMSMoveService','短信搬移服务','SYSTEM_SERVICE',0),
  ('SMSOVERFLOWINTERVAL','3','短信上下行溢出告警时间间隔(分钟)','ALERT',4),
  ('SMSSIGN','中移动','短信签名','WEB_SMS',3),
  ('SMSTATUS_THREADPOOL_SIZE','1000','短信处理状态报告线程池数','SMS',175),
  ('SMS_MOVE_INTERVAL','120',' 短信搬移时间间隔(秒)','SMS',3),
  ('SNTPINTERVAL','3600','MAS时间同步周期（单位：秒）','MAS',22),
  ('SNTPIP','192.43.244.18','MAS时间同步服务器IP','MAS',22),
  ('SYNCBUSINESSCAPDATA','com.royasoft.mas.service.snmp.sync.SyncBusinessCapData','业务数据同步','SYSTEM_SERVICE',1),
  ('SYNCTIME','com.royasoft.mas.service.soap.SyncTime','MAS时间同步','SYSTEM_SERVICE',1),
  ('SYNC_TO_BOSS_INTERVAL','300','签约信息文件同步BOSS周期(秒)','APP_CONNECT',11),
  ('SYNC_TO_BOSS_TIME','030000','签约对帐文件同步BOSS时间(格式:HHMMSS)','APP_CONNECT',15),
  ('SYSCONTACT','8F,No.200,Lane91,Eshan RD,Eshan Rd,Shanghai','管理员联系地址','MIB-READWRITE',1),
  ('SYSDESCR','Microsoft Windows XP','系统描述','MIB-READ',1),
  ('SYSLOCATION','Shanghai_beijing','系统位置','MIB-READWRITE',3),
  ('SYSNAME','MAS2','给予该被管节点的名称','MIB-READWRITE',2),
  ('SYSOBJECTID','1.3.6.1.4.1.28357.1','系统标识','MIB-READ',2),
  ('SYSSERVICES','0','系统提供的服务','MIB-READ',3),
  ('SYSUPTIME','272420000','系统启动时间','MIB-READ',41),
  ('TIMEOUT','90000','连接超时','MMS',15),
  ('TOTAL_SMS_LIMT','75','系统短信总配额','SMS',1),
  ('TURNOFFFLAG','0','关机控制标志','MIB-READWRITE',18),
  ('UPGRADEFLAG','1','版本升级通知标志','MIB-READWRITE',20),
  ('UPLOADLOGFILE','com.royasoft.mas.core.log.UploadLogfile','日志上传','SYSTEM_SERVICE',1),
  ('USERNAME','royasoft','鉴权用户名','MMS',2),
  ('USESSL','true','是否启用SSL加密','MMS',11),
  ('USSDC_ACCOUNT','mascmcc9','USSD网关登录用户名','USSD',4),
  ('USSDC_PASSWORD','mascmcc9','USSD网关登录密码','USSD',5),
  ('USSDC_PORT','4400','USSD网关服务器服务端口','USSD',3),
  ('USSDC_SERVER','218.206.178.41','USSD网关服务器服务地址','USSD',2),
  ('USSDFLAG','1','USSD能力开通标志','MIB-READ',31),
  ('USSDONLINEUSER','60','当前USSD用户数采集周期(分钟)','MIB-SCANPERIOD',6),
  ('USSD_ROUTE_CLASS','com.royasoft.mas.core.ussd.SimpleUSSDRoute','USSD路由全路径类名','USSD',1),
  ('USSD_ROUTE_LOGON_INTERVAL','300','USSD网关登录失败重连间隔时间(秒)','USSD',7),
  ('USSD_ROUTE_LOGON_TRY_COUNT','1','USSD网关登录最大尝试次数','USSD',6),
  ('USSD管理','-','-','RESOURCEGROUP',6),
  ('WAITSENDSMSSERVICES','com.royasoft.mas.web.sms.WaitSendSmsServices','WEB定时短信扫描','SYSTEM_SERVICE',0),
  ('WAIT_SMROUTE_OK','1000','等待短信路由','SMS',150),
  ('WAPFLAG','1','WAP能力开通标志','MIB-READ',32),
  ('WAPGWADDR','192.168.230.8','WAP网关地址','MAS',10),
  ('WAPONLINEUSER','60','当前WAP用户数采集周期(分钟)','MIB-SCANPERIOD',4),
  ('WAP推送','-','-','RESOURCEGROUP',4),
  ('WEBSERVICE_MMS_STATUS_HANDLER','com.royasoft.mas.core.mms.handler.WebServiceMMStatusHandler','WebService彩信','HANDLER',5),
  ('WEBSERVICE_SMS_RECEIVE_HANDLER','com.royasoft.mas.core.sms.handler.WebServiceSMSReceiveHandler','WebService短信上行处理类','HANDLER',1),
  ('WEBSERVICE_SMS_STATUS_HANDLER','com.royasoft.mas.core.sms.handler.WebServiceSMSStatusHandler','WebService短信状态处理类','HANDLER',4),
  ('WEB_MMS_RECEIVE_HANDLER','com.royasoft.mas.core.mms.handler.WebMMReceiveHandler','WEB彩信上行处理类','HANDLER',2),
  ('WEB_MMS_STATUS_HANDLER','com.royasoft.mas.core.mms.handler.WebMMStatusHandler','WEB彩信状态处理类','HANDLER',5),
  ('WEB_SERVICE_MMS_RECEIVE_HANDLER','com.royasoft.mas.core.mms.handler.WebServiceMMReceiveHandler','WebService彩信上行处理类','HANDLER',2),
  ('WEB_SMS_RECEIVE_HANDLER','com.royasoft.mas.core.sms.handler.WebSMSReceiveHandler','WEB短信上行处理类','HANDLER',1),
  ('WEB_SMS_STATUS_HANDLER','com.royasoft.mas.core.sms.handler.WebSMSStatusHandler','WEB短信状态处理类','HANDLER',4),
  ('WEB_USSD_RECEIVE_HANDLER','com.royasoft.mas.core.ussd.handler.WebUSSDReceiveHandler','WEB USSD上行处理类','HANDLER',3),
  ('WEB_WAPPUSH_STATUS_HANDLER','com.royasoft.mas.core.wappush.handler.WebWapPushStatusHandler','WEB WapPush状态处理类','HANDLER',6),
  ('WEB彩信','-','-','RESOURCEGROUP',3),
  ('WEB短信','-','-','RESOURCEGROUP',2),
  ('WSPLUG_WAPPUSH_STATUS_HANDLER','com.royasoft.mas.core.wappush.handler.WsPlugWapPushStatusHandler','WebService WapPush状态处理类','HANDLER',6),
  ('WS_USSD_RECEIVE_HANDLER','com.royasoft.mas.core.ussd.handler.WsUSSDReceiveHandler','WebService USSD上行处理类','HANDLER',3),
  ('其他','','','RESOURCEGROUP',1),
  ('告警管理','-','-','RESOURCEGROUP',14),
  ('地址薄','-','-','RESOURCEGROUP',12),
  ('应用接入','-','-','RESOURCEGROUP',10),
  ('插件管理','-','-','RESOURCEGROUP',9),
  ('查询管理','-','-','RESOURCEGROUP',7),
  ('法轮','法轮','法轮','FILTER_WORD',1),
  ('移动定位','-','-','RESOURCEGROUP',5),
  ('管理平台','-','-','RESOURCEGROUP',11),
  ('系统管理','-','-','RESOURCEGROUP',15);

COMMIT;

#
# Data for the `sys_code_type` table  (LIMIT 0,500)
#

INSERT INTO `sys_code_type` (`TYPE_NAME`, `TYPE_DESC`, `READ_ONLY`) VALUES
  ('SMS','<font color=red>短信内核参数设置</font>',False),
  ('WEB_SMS','<font color=red>WEB短信相关参数</font>',False),
  ('WEB_WEBPUSH','<font color=red>WEBPUSH相关参数</font>',False),
  ('FILTER_WORD','<font color=red>敏感词</font>',False),
  ('MMS','<font color=gold>彩信内核参数设置</font>',False),
  ('WEB_MMS','<font color=gold>WEB彩信相关参数</font>',False),
  ('BUSI_APP','<font color=#00ffff>业务应用参数设置</font>',False),
  ('LBS','定位模块',False),
  ('WEB_LBS','WEB定位相关参数',False),
  ('USSD','USSD内核参数设置',False),
  ('APP_CONNECT','应用接入参数设置',False),
  ('MAS','MAS',False),
  ('PLUGIN','插件管理模块',False),
  ('RESOURCEGROUP','资源管理分组',True),
  ('ALERT','告警模块',False),
  ('DBPLUG_SMS','DBPLUG短信相关参数',False),
  ('MIB-COUNT','MIB-COUNT',False),
  ('MIB-READ','MIB-READ',True),
  ('MIB-READWRITE','MIB-READWRITE',False),
  ('MIB-SCANPERIOD','MIB-SCANPERIOD',False),
  ('SYS-ADMIN','<font color=#074A7D><b>系统管理参数设置</b></font>',False),
  ('DB','数据备份',False),
  ('SYSTEM_SERVICE','系统服务',False),
  ('BACKUP_TABLES','需要备份的表',False),
  ('HANDLER','上行、状态处理类',False);

COMMIT;

#
# Data for the `sys_privilege` table  (LIMIT 0,500)
#

INSERT INTO `sys_privilege` (`role_id`, `resource_id`) VALUES
  (1,1),
  (1,2),
  (1,3),
  (1,4),
  (1,5),
  (1,6),
  (1,7),
  (1,8),
  (1,9),
  (1,10),
  (1,11),
  (1,12),
  (1,13),
  (1,14),
  (1,15),
  (1,16),
  (1,17),
  (1,18),
  (1,19),
  (1,20),
  (1,21),
  (1,22),
  (1,23),
  (1,24),
  (1,25),
  (1,26),
  (1,27),
  (1,28),
  (1,29),
  (1,30),
  (1,31),
  (1,32),
  (1,33),
  (1,34),
  (1,35),
  (1,36),
  (1,37),
  (1,38),
  (1,39),
  (1,40),
  (1,42),
  (1,43),
  (1,44),
  (1,45),
  (1,46),
  (1,47),
  (1,48),
  (1,49),
  (1,50),
  (1,51),
  (1,52),
  (1,54),
  (1,55),
  (1,57),
  (1,58),
  (1,59),
  (1,60),
  (1,61),
  (1,62),
  (1,63),
  (1,64),
  (1,65),
  (1,66),
  (1,67),
  (1,68),
  (1,69),
  (1,70),
  (1,71),
  (1,72),
  (1,73),
  (1,74),
  (1,75),
  (1,76),
  (1,77),
  (1,78),
  (1,79),
  (1,80),
  (1,81),
  (1,82),
  (1,88),
  (1,89),
  (1,90),
  (1,91),
  (1,92),
  (1,93),
  (1,94),
  (1,95),
  (1,96),
  (1,97),
  (1,98),
  (1,100),
  (1,101),
  (1,102),
  (1,103),
  (1,104),
  (1,105),
  (1,106),
  (1,107),
  (1,108),
  (1,109),
  (1,110),
  (1,111),
  (1,112),
  (3,1),
  (3,2),
  (3,3),
  (3,4),
  (3,5),
  (3,6),
  (3,7),
  (3,8),
  (3,9),
  (3,10),
  (3,11),
  (3,12),
  (3,13),
  (3,14),
  (3,15),
  (3,16),
  (3,17),
  (3,18),
  (3,19),
  (3,20),
  (3,21),
  (3,22),
  (3,23),
  (3,24),
  (3,28),
  (3,29),
  (3,30),
  (3,31),
  (3,32),
  (3,33),
  (3,34),
  (3,35),
  (3,36),
  (3,48),
  (3,49),
  (3,50),
  (3,52),
  (3,61),
  (3,62),
  (3,63),
  (3,64),
  (3,72),
  (3,77),
  (3,88),
  (3,89),
  (3,90),
  (3,91),
  (3,92),
  (3,93),
  (3,94),
  (3,95),
  (3,96),
  (3,97),
  (3,98);

COMMIT;

#
# Data for the `sys_resource` table  (LIMIT 0,500)
#

INSERT INTO `sys_resource` (`id`, `resource_type`, `resource_string`, `resource_group`, `description`) VALUES
  (1,'MENU','MENU_SMS','WEB短信','WEB短信'),
  (2,'MENU','SUBMENU_SMS_SEND','WEB短信','发送短信'),
  (3,'MENU','SUBMENU_SMS_INBOX','WEB短信','收件箱'),
  (4,'MENU','SUBMENU_SMS_OUTBOX','WEB短信','已发件箱'),
  (5,'URL','/sendSms.do','WEB短信','发送短信URL'),
  (6,'URL','/listSmsMo.do','WEB短信','短信收件箱URL'),
  (7,'URL','/listSmsMt.do','WEB短信','短信发件箱URL'),
  (8,'MENU','MENU_MMS','WEB彩信','WEB彩信'),
  (9,'MENU','SUBMENU_MMS_SEND','WEB彩信','发送彩信'),
  (10,'MENU','SUBMENU_MMS_INBOX','WEB彩信','收件箱'),
  (11,'MENU','SUBMENU_MMS_OUTBOX','WEB彩信','发件箱'),
  (12,'URL','/sendMms.do','WEB彩信','发送彩信URL'),
  (13,'URL','/listMmsMo.do','WEB彩信','彩信收件箱URL'),
  (14,'URL','/listMmsMt.do','WEB彩信','彩信发件箱URL'),
  (15,'MENU','MENU_WAPPUSH','WAP推送','WAP推送'),
  (16,'MENU','SUBMENU_WAPPUSH_SEND','WAP推送','WAP推送'),
  (17,'MENU','SUBMENU_WAPPUSH_STATUS','WAP推送','状态查询'),
  (18,'URL','/sendWappush.do','WAP推送','WAP推送URL'),
  (19,'URL','/listWappush.do','WAP推送','WAP推送状态查询URL'),
  (20,'MENU','MENU_LBS','移动定位','移动定位'),
  (21,'MENU','SUBMENU_LBS_REQUEST','移动定位','移动定位'),
  (22,'MENU','SUBMENU_LBS_TLRREQUEST','移动定位','结果查询'),
  (23,'URL','/lbsRequest.do','移动定位','定位URL'),
  (24,'URL','/lbsTlrsRstList.do','移动定位','定位结果查询URL'),
  (25,'MENU','MENU_USSD','USSD管理','USSD管理'),
  (26,'MENU','SUBMENU_USSD_REQUEST','USSD管理','USSD配置'),
  (27,'MENU','SUBMENU_USSD_SESSION','USSD管理','USSD会话查询'),
  (28,'MENU','MENU_BUSINESS','查询管理','查询管理'),
  (29,'MENU','SUBMENU_LOG','查询管理','平台日志查询'),
  (30,'MENU','SUBMENU_BUSINESS_LOG','查询管理','业务日志查询'),
  (31,'MENU','SUBMENU_SMS_QUERY_MO','查询管理','上行短信查询'),
  (32,'MENU','SUBMENU_SMS_QUERY_MT','查询管理','下行短信查询'),
  (33,'MENU','SUBMENU_MMS_QUERY_MO','查询管理','上行彩信查询'),
  (34,'MENU','SUBMENU_MMS_QUERY_MT','查询管理','下行彩信查询'),
  (35,'MENU','SUBMENU_QUERY','查询管理','部门业务统计'),
  (36,'MENU','SUBMENU_BUSINESS_FLUX','查询管理','业务流量统计'),
  (37,'MENU','MENU_ELEMENT','B/S插件','B/S插件'),
  (38,'MENU','SUBMENU_ELEMENT_ADD','B/S插件','用户操作'),
  (39,'MENU','SUBMENU_ELEMENT_FILTER','B/S插件','日志查看'),
  (40,'MENU','SUBMENU_ELEMENT_REPLACE','B/S插件','告警查看'),
  (42,'MENU','SUBMENU_ELEMENT_LAYOUTINFO','B/S插件','配置管理'),
  (43,'MENU','MENU_PLUGIN','插件管理','插件管理'),
  (44,'MENU','SUBMENU_PLUGIN_PLUGINMNG','插件管理','插件管理'),
  (45,'MENU','SUBMENU_PLUGIN_PLUGINLIST','插件管理','插件注册'),
  (46,'MENU','SUBMENU_PLUGIN_PLUGINVALVELIST','插件管理','阀值设置'),
  (47,'MENU','SUBMENU_PLUGIN_DBPLUGMNG','插件管理','DB插件适配'),
  (48,'MENU','MENU_APPCONNCET','应用接入','应用接入'),
  (49,'MENU','SUBMENU_APP_CONNECT','应用接入','客户信息'),
  (50,'MENU','SUBMENU_APP_RELATION','应用接入','接入信息'),
  (51,'MENU','SUBMENU_APP_ORDER','应用接入','订购关系'),
  (52,'MENU','SUBMENU_APP_FORBIDDEN','应用接入','黑白名单'),
  (54,'MENU','SUBMENU_WEBTRANSMIT','应用接入','HTTP代理'),
  (55,'MENU','MENU_MANAGEMENT','管理平台','管理平台'),
  (57,'MENU','SUBMENU_SOAP','管理平台','通讯能力'),
  (58,'MENU','SUBMENU_SNMP','管理平台','信息配置'),
  (59,'MENU','SUBMENU_HOST','管理平台','设备配置理'),
  (60,'MENU','SUBMENU_TS','管理平台','时间同步'),
  (61,'MENU','MENU_ADDRESS','地址薄','地址薄'),
  (62,'MENU','SUBMENU_ADDR_ORG','地址薄','部门信息'),
  (63,'MENU','SUBMENU_ADDR_EMPLOYEE','地址薄','员工信息'),
  (64,'MENU','SUBMENU_ADDR_GROUP','地址薄','群组信息'),
  (65,'MENU','MENU_QOS','QOS统计','QOS统计'),
  (66,'MENU','SUBMENU_BUSINESS_CONNECTSTATUS','QOS统计','连接状态'),
  (67,'MENU','SUBMENU_BUSINESS_MTDELAY','QOS统计','下行时延'),
  (68,'MENU','SUBMENU_BUSINESS_MTNUM','QOS统计','下行成功率'),
  (69,'MENU','MENU_ALERT','告警管理','告警管理'),
  (70,'MENU','SUBMENU_ACTIVE_ALERT','告警管理','实时告警'),
  (71,'MENU','SUBMENU_HISTORY_ALERT','告警管理','历史告警'),
  (72,'MENU','MENU_SYSTEM','系统管理','系统管理'),
  (73,'MENU','SUBMENU_USER','系统管理','用户管理'),
  (74,'MENU','SUBMENU_ROLE','系统管理','角色管理'),
  (75,'MENU','SUBMENU_RESOURCE','系统管理','资源管理'),
  (76,'MENU','SUBMENU_MENU','系统管理','菜单管理'),
  (77,'MENU','SUBMENU_CODE','系统管理','代码设置'),
  (78,'MENU','SUBMENU_PLUGIN_PLUGINFLUX','系统管理','插件流量'),
  (79,'MENU','SUBMENU_MIB_UPGRADE','管理平台','升级通知'),
  (80,'MENU','SUBMENU_MIB_SWITCH','管理平台','控制开关'),
  (81,'MENU','SUBMENU_BIZCONFIG','管理平台','业务配置'),
  (82,'MENU','SUBMENU_PLUGIN_PE','插件管理','PE插件'),
  (88,'MENU','MENU_BUSI','业务应用','业务应用'),
  (89,'MENU','SUBMENU_SMS_SECURITY','业务应用','短信防伪'),
  (90,'MENU','SUBMENU_METING','业务应用','会议通知'),
  (91,'MENU','SUBMENU_WORKPLAN','业务应用','工作安排'),
  (92,'MENU','SUBMENU_WORKPLAN_MANAGE','业务应用','工作管理'),
  (93,'MENU','SUBMENU_COMPLAINT','业务应用','举报投诉'),
  (94,'MENU','SUBMENU_POLL','业务应用','投票调查'),
  (95,'MENU','SUBMENU_SCHEDULE_REMINDER','业务应用','日程提醒'),
  (96,'MENU','SUBMENU_BIRTHDAY_REMINDER','业务应用','生日提醒'),
  (97,'MENU','SUBMENU_BROARDCAST','业务应用','广播与查询'),
  (98,'MENU','SUBMENU_MMS_MODE','WEB彩信','彩信模板'),
  (99,'MENU','SUBMENU_MMS_MATERIAL','WEB彩信','彩信素材'),
  (100,'MENU','SUBMENU_SMS_ROUTE','系统管理','路由设置'),
  (101,'MENU','SUBMENU_MMS_LIST_DRAFTS','WEB彩信','草稿箱'),
  (102,'FUNCTION','FN_ALERT_RESOURCE','告警管理','顶部告警条显示资源'),
  (103,'URL','/restar.do','管理平台','重启资源'),
  (104,'MENU','SUBMENU_SMSMMS_EXPECT','系统管理','短彩信查询例外用户'),
  (105,'MENU','SUBMENU_ADDR_ADDBOOK','地址薄','通讯录'),
  (106,'MENU','SUBMENU_ADDR_ADDGROUP','地址薄','通讯录分组'),
  (107,'MENU','BACK_UP_CONFIG','系统管理','备份配置'),
  (108,'MENU','BACK_UP','系统管理','数据备份'),
  (109,'MENU','COME_BACK','系统管理','数据恢复'),
  (110,'MENU','SUBMENU_SMS_WAITOUTBOX','WEB短信','待发件箱'),
  (111,'MENU','SUBMENU_SMS_DRAFTS','WEB短信','草稿箱'),
  (112,'MENU','SUBMENU_SMS_BATCH','WEB短信','批量发送');

COMMIT;

#
# Data for the `sys_role` table  (LIMIT 0,500)
#

INSERT INTO `sys_role` (`id`, `title`, `description`) VALUES
  (1,'ROLE_ADMIN','系统管理员'),
  (3,'NORMAL_USER','普通用户');

COMMIT;

#
# Data for the `sys_user` table  (LIMIT 0,500)
#

INSERT INTO `sys_user` (`id`, `username`, `userpwd`, `enabled`, `state`, `updateTime`) VALUES
  (1,'admin','admin',True,0,'2010-08-27 14:48:12'),
  (2,'useradmin','useradmin',True,0,'2010-08-27 14:48:12');

COMMIT;

#
# Data for the `sys_user_role` table  (LIMIT 0,500)
#

INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
  (1,1),
  (2,3);

COMMIT;

#
# Data for the `t_birthday_set` table  (LIMIT 0,500)
#

INSERT INTO `t_birthday_set` (`ID`, `SENDCONTENT`, `SENDTIME`, `BIRTHDAY_STATUS`) VALUES
  (1,'','07:00',True);

COMMIT;
