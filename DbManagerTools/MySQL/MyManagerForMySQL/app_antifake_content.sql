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
  `integralMark` int(11) NOT NULL COMMENT '���ּ���',
  `Content` varchar(1500) NOT NULL COMMENT '���ֵ���ü�����ֻ������û����յ��Ķ�������',
  `enabled` int(1) default '1' COMMENT '�Ƿ���',
  `issms` int(11) default '0' COMMENT '�Ƿ��͹����ţ�Ĭ��Ϊ0û�з��ͣ�1Ϊ�Ѿ�����',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_antifake_encourage` table :
#

DROP TABLE IF EXISTS `app_antifake_encourage`;

CREATE TABLE `app_antifake_encourage` (
  `id` int(11) NOT NULL auto_increment,
  `mobile` varchar(20) NOT NULL COMMENT '�ֻ�����',
  `markid` int(11) NOT NULL COMMENT '���ּ�����',
  `issms` int(1) NOT NULL COMMENT '�Ƿ��͹�������0û�з��ͣ�1����',
  `smscontent` varchar(1500) NOT NULL COMMENT '��������',
  `createdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_antifake_functionset` table :
#

DROP TABLE IF EXISTS `app_antifake_functionset`;

CREATE TABLE `app_antifake_functionset` (
  `id` int(11) NOT NULL auto_increment,
  `Defaultintegral` int(11) NOT NULL COMMENT '��ƷĬ�ϻ��ֹ���',
  `Startup` int(1) NOT NULL COMMENT '�Ƿ��������ֻ���',
  `command` varchar(30) NOT NULL COMMENT '���ŷ�α���ж�Ϣָ��',
  `integralMark` int(11) NOT NULL default '500' COMMENT '���ּ���Ĭ��500',
  `Mark_Startup` int(1) NOT NULL default '1' COMMENT '�Ƿ����øû��ּ���Ĭ��Ϊ1���ã�����Ϊ0������',
  `integralMark2` int(11) NOT NULL default '1000' COMMENT '���ּ���Ĭ��1000',
  `Mark_Startup2` int(1) NOT NULL default '1' COMMENT '�Ƿ����øû��ּ���Ĭ��Ϊ1���ã�����Ϊ0������',
  `integralMark3` int(11) NOT NULL default '1500' COMMENT '���ּ���Ĭ��1500',
  `Mark_Startup3` int(1) NOT NULL default '1' COMMENT '�Ƿ����øû��ּ���Ĭ��Ϊ1���ã�����Ϊ0������',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_antifake_productlist` table :
#

DROP TABLE IF EXISTS `app_antifake_productlist`;

CREATE TABLE `app_antifake_productlist` (
  `id` int(11) NOT NULL auto_increment,
  `Code` varchar(30) NOT NULL COMMENT '��Ʒ��α���',
  `Name` varchar(50) NOT NULL COMMENT '��Ʒ����',
  `Integral` int(11) NOT NULL COMMENT '���ֹ���',
  `smsModel` varchar(1500) NOT NULL COMMENT '�ظ�����ģ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_antifake_querylist` table :
#

DROP TABLE IF EXISTS `app_antifake_querylist`;

CREATE TABLE `app_antifake_querylist` (
  `id` int(11) NOT NULL auto_increment,
  `Code` varchar(30) NOT NULL COMMENT 'ȷ�ϲ�Ʒ��α���',
  `mobile` varchar(20) NOT NULL COMMENT '��ѯ�ֻ�����',
  `Querydate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '��ѯʱ��',
  `integral` int(11) default '1' COMMENT '����',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_meeting` table :
#

DROP TABLE IF EXISTS `app_meeting`;

CREATE TABLE `app_meeting` (
  `ID` int(11) NOT NULL auto_increment COMMENT '����',
  `TITLE` varchar(50) default NULL COMMENT '��������',
  `CONTENT` varchar(4000) default NULL COMMENT '��������',
  `TIME` datetime default NULL COMMENT '����ʱ��',
  `ADDRESS` varchar(200) default NULL COMMENT '����ص�',
  `MASTER` varchar(20) default NULL COMMENT '��������',
  `CREATETIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `STATE` varchar(2) default '0' COMMENT '�Ķ�״̬',
  `WAKETIME` datetime default NULL COMMENT '����ʱ��',
  `PHONEMAN` varchar(4000) default NULL COMMENT '������Ա�ֻ���',
  `IsWake` tinyint(1) default '0' COMMENT '����״̬',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����֪ͨ��';

#
# Structure for the `app_meeting_reply` table :
#

DROP TABLE IF EXISTS `app_meeting_reply`;

CREATE TABLE `app_meeting_reply` (
  `id` int(11) NOT NULL auto_increment,
  `meetingId` varchar(20) default NULL COMMENT '����id',
  `mobile` varchar(20) default NULL COMMENT '�ֻ���',
  `replyType` tinyint(4) default '0' COMMENT '�ظ�״̬��0-δ�ظ���1-�μӻ��飬2-���μӻ���',
  `replyTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '�ظ�ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����֪ͨ�ظ���';

#
# Structure for the `app_weblbs_cancel` table :
#

DROP TABLE IF EXISTS `app_weblbs_cancel`;

CREATE TABLE `app_weblbs_cancel` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `APPLICATIONID` varchar(16) default NULL COMMENT 'Ӧ�ñ�ʶ',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '�����ʶ',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web wap lbs ȡ����';

#
# Structure for the `app_weblbs_request` table :
#

DROP TABLE IF EXISTS `app_weblbs_request`;

CREATE TABLE `app_weblbs_request` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `MOBILE` varchar(255) default NULL COMMENT '��λ���ֻ�����',
  `LOCTYPE` int(4) default NULL COMMENT '��λ����\r\n            1-CURRENT\r\n            2-LAST\r\n            3-CURRENT_OR_LAST\r\n            ',
  `PERIODIC` int(4) default NULL COMMENT '1-���ζ�λ\r\n            2-���ڶ�λ',
  `FREQUENCY` int(4) default NULL COMMENT '֪ͨ�����Ƶ�ʣ���λΪ�룩\r\n            ',
  `DURATION` int(4) default NULL COMMENT '���ڶ�λ��ʱ������λΪ�룩',
  `REQUESTEDACCURACY` int(4) default NULL COMMENT '�����λ����Ϣ�ľ�ȷ�ȣ����ױ�ʾ',
  `ACCEPTABLEACCURACY` int(4) default NULL COMMENT '��Ӧ�ɽ��ܵľ�ȷ�ȣ����ױ�ʾ',
  `MAXIMUMAGE` int(4) default NULL COMMENT '���ص�λ����Ϣ�����ɽ���ʱ��,�����ʾ',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `RESPONSETIME` int(4) default NULL COMMENT 'ָʾӦ���ܽ��ܵĵȴ���Ӧ�����ʱ�䣬�����ʾ',
  `APPLICATIONID` varchar(16) default NULL COMMENT 'Ӧ�ñ�ʶ',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '��ʶĳ������',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web wap lbs �����';

#
# Structure for the `app_weblbs_result` table :
#

DROP TABLE IF EXISTS `app_weblbs_result`;

CREATE TABLE `app_weblbs_result` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `MOBILE` varchar(20) default NULL COMMENT '��λ�ֻ�����',
  `ERRORCODE` varchar(10) default NULL COMMENT '������',
  `ERRORMESSAGE` varchar(500) default NULL COMMENT '������Ϣ',
  `LONGTITUDE` varchar(40) default NULL COMMENT '����',
  `LATITUDE` varchar(40) default NULL COMMENT 'γ��',
  `ALTITUDE` varchar(40) default NULL COMMENT '����',
  `ACCURACY` varchar(40) default NULL COMMENT '����(��)',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `UPDATETIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `APPLICATIONID` varchar(16) default NULL COMMENT 'Ӧ�ñ�ʶ',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '�����ʶ',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web wap lbs �����';

#
# Structure for the `app_webmms_material` table :
#

DROP TABLE IF EXISTS `app_webmms_material`;

CREATE TABLE `app_webmms_material` (
  `id` int(11) NOT NULL auto_increment,
  `materialName` varchar(20) default NULL COMMENT '�ز�����',
  `materialType` int(11) default NULL COMMENT '�ز����� 1ͼƬ2����',
  `materialPath` mediumtext COMMENT '·��',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

#
# Structure for the `app_webmms_materialinfo` table :
#

DROP TABLE IF EXISTS `app_webmms_materialinfo`;

CREATE TABLE `app_webmms_materialinfo` (
  `id` int(11) NOT NULL auto_increment,
  `materialName` varchar(20) default NULL COMMENT '�ز�����',
  `materialPath` mediumtext COMMENT '·��',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `materialSize` int(11) default '0' COMMENT '�زĴ�С',
  `materialType` int(11) default NULL COMMENT '1ͼƬ2����3����',
  `parentId` int(11) default NULL COMMENT '�ز����id��',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

#
# Structure for the `app_webmms_mo` table :
#

DROP TABLE IF EXISTS `app_webmms_mo`;

CREATE TABLE `app_webmms_mo` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  `DEST_ADDR` varchar(21) default NULL COMMENT '��չ���루����Ϊ�գ�',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `SUBJECT` varchar(500) default NULL COMMENT '���ű���',
  `MESSAGE_CONTENT` mediumtext COMMENT 'MIME�����SMIL��ʽ�ļ�',
  `MESSAGE_FILES` text COMMENT '���ܵĲ����ļ�����·���б�',
  `RECEIVE_TIME` datetime NOT NULL COMMENT '���Ž���ʱ��',
  `APPLICATION_ID` varchar(21) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS�ڲ����Ž��ܱ�';

#
# Structure for the `app_webmms_model` table :
#

DROP TABLE IF EXISTS `app_webmms_model`;

CREATE TABLE `app_webmms_model` (
  `ID` int(20) NOT NULL auto_increment COMMENT '�Զ����',
  `modelName` varchar(50) NOT NULL COMMENT 'ģ������',
  `modelPath` mediumtext COMMENT '·��',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `mmsSize` float(9,3) NOT NULL default '0.000' COMMENT '���Ŵ�С',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ģ���';

#
# Structure for the `app_webmms_mt` table :
#

DROP TABLE IF EXISTS `app_webmms_mt`;

CREATE TABLE `app_webmms_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `USER_ID` int(11) default NULL COMMENT '�û�id',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '��չ��',
  `DEST_ADDR` mediumtext NOT NULL COMMENT '�����ֻ�MSISDN,������";"�ָ�,��󲻳���50��',
  `REQ_DELIVERY_REPORT` tinyint(4) NOT NULL default '0' COMMENT '�Ƿ���Ҫ���ͱ���(0=����Ҫ 1=��Ҫ)',
  `SUBJECT` varchar(500) default NULL COMMENT '���ű���',
  `MESSAGE_FILES` text COMMENT '���Ͳ����ļ�����·���б�',
  `SEND_TIME` datetime NOT NULL COMMENT '��ʱ����ʱ��',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `APPLICATION_ID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `STATE` int(11) default '1' COMMENT '����״̬ 0.���� 1.�ѷ�',
  `TREEIDS` text COMMENT '���ڵ�IDs',
  `TREECONTEXT` text COMMENT '���ڵ�����',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB�������б�';

#
# Structure for the `app_webmms_status` table :
#

DROP TABLE IF EXISTS `app_webmms_status`;

CREATE TABLE `app_webmms_status` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `STATUS` int(11) NOT NULL COMMENT '����״̬',
  `STATUS_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����״̬ʱ��',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  `MT_ID` bigint(20) NOT NULL COMMENT '����app_webmms_mt��ID�ֶ�',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB��������״̬��';

#
# Structure for the `app_websms_mo` table :
#

DROP TABLE IF EXISTS `app_websms_mo`;

CREATE TABLE `app_websms_mo` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `EX_CODE` varchar(21) default NULL COMMENT '��չ��',
  `CONTENT` text COMMENT '��Ϣ����',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `RECEIVE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS ������ID',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  `sendID` bigint(20) default '0' COMMENT '����id',
  `USER_ID` int(11) default '0' COMMENT '�û�ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_websms_mt` table :
#

DROP TABLE IF EXISTS `app_websms_mt`;

CREATE TABLE `app_websms_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `USER_ID` int(11) default NULL COMMENT '�û�ID',
  `ORG_ID` int(11) default NULL COMMENT '��֯����ID',
  `EX_CODE` varchar(21) default NULL COMMENT '��չ��',
  `DEST_ADDR` mediumtext COMMENT '�����ֻ�MSISDN,������";"�ָ�',
  `STATUS` tinyint(4) default '0' COMMENT '���ŷ���״̬',
  `PRIORITY` tinyint(4) default NULL COMMENT '��Ϣ���ȼ�',
  `REQ_DELIVERY_REPORT` int(11) default '0' COMMENT '�Ƿ���Ҫ״̬����',
  `SUBJECT` varchar(256) default NULL COMMENT '��Ϣ����',
  `CONTENT` text COMMENT '��Ϣ����',
  `SEND_TIME` datetime default NULL COMMENT '��ʱ����ʱ��',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  `TREEIDS` text COMMENT '���ڵ�IDs',
  `TREECONTEXT` text COMMENT '���ڵ�����',
  PRIMARY KEY  (`ID`),
  KEY `app_websms_mt_index` (`REQUEST_TIME`),
  KEY `APP_WEBSMS_MT_STATUS_SEND_TIME` (`STATUS`,`SEND_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB�������б�';

#
# Structure for the `app_websms_status` table :
#

DROP TABLE IF EXISTS `app_websms_status`;

CREATE TABLE `app_websms_status` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `STATUS` int(11) NOT NULL COMMENT '����״̬',
  `STATUS_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����״̬ʱ��',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  `MT_ID` bigint(20) NOT NULL COMMENT '����app_websms_mt��ID�ֶ�',
  PRIMARY KEY  (`ID`),
  KEY `app_websms_status_index` (`MAS_ID`),
  KEY `APP_WEBSMS_STATUS_MTID` (`MT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB��������״̬��';

#
# Structure for the `app_webussd_subject` table :
#

DROP TABLE IF EXISTS `app_webussd_subject`;

CREATE TABLE `app_webussd_subject` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `OP_TYPE` tinyint(4) NOT NULL default '1' COMMENT '�Ի���������0x01��Request����USSR��SP->USSDC��\r\n0x02��Notify����USSN��SP->USSDC��\r\n',
  `OP_CODE` varchar(21) NOT NULL default '#' COMMENT '��������',
  `CONTENT` varchar(200) NOT NULL COMMENT 'USSD��������',
  `MSG_FMT` int(11) NOT NULL default '17' COMMENT 'Ussd�����б���ĸ�ʽ,���õı����ʽ������0x0F��7λ���룩��0x11��16λ���룩��0x44��8λ���룩',
  `DESCRIPTION` varchar(100) default NULL COMMENT '����',
  `PARENT_ID` int(11) NOT NULL default '0' COMMENT '��ID ����app_webussd_subject��ID�ֶ� 0��ʾ�����',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB USSDӦ���������ñ�';

#
# Structure for the `app_webwappush_mt` table :
#

DROP TABLE IF EXISTS `app_webwappush_mt`;

CREATE TABLE `app_webwappush_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '��������',
  `USER_ID` int(11) default NULL COMMENT '�û�ID',
  `ORG_ID` int(11) default NULL COMMENT '��֯�ṹ',
  `EX_CODE` varchar(21) default NULL COMMENT '��չ��',
  `DEST_ADDR` text NOT NULL COMMENT 'Ŀ���ַ',
  `STATUS` bigint(20) default NULL COMMENT '����״̬',
  `PRIORITY` tinyint(4) default NULL COMMENT '���ȼ�',
  `SUBJECT` varchar(256) NOT NULL COMMENT '����',
  `URL` varchar(256) NOT NULL COMMENT '����ĳ�����',
  `SEND_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '��ʱ����ʱ��',
  `REQUEST_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '���ʱ��',
  `UPDATE_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'Ӧ�ñ�ʶ',
  `REQUESTIDENTIFIER` varchar(50) NOT NULL COMMENT '�����ʶ',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS ������ID',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WapPush Web��';

#
# Structure for the `app_wslbs_cancel` table :
#

DROP TABLE IF EXISTS `app_wslbs_cancel`;

CREATE TABLE `app_wslbs_cancel` (
  `ID` int(10) NOT NULL auto_increment,
  `APPLICATIONID` varchar(16) default NULL,
  `REQUESTIDENTIFIER` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservice wap lbs ȡ����';

#
# Structure for the `app_wslbs_request` table :
#

DROP TABLE IF EXISTS `app_wslbs_request`;

CREATE TABLE `app_wslbs_request` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `MOBILE` varchar(255) default NULL COMMENT '��λ���ֻ�����',
  `LOCTYPE` int(4) default NULL COMMENT '��λ����\r\n            1-CURRENT\r\n            2-LAST\r\n            3-CURRENT_OR_LAST\r\n            ',
  `PERIODIC` int(4) default NULL COMMENT '1-���ζ�λ\r\n            2-���ڶ�λ',
  `FREQUENCY` int(4) default NULL COMMENT '֪ͨ�����Ƶ�ʣ���λΪ�룩\r\n            ',
  `DURATION` int(4) default NULL COMMENT '���ڶ�λ��ʱ������λΪ�룩',
  `REQUESTEDACCURACY` int(4) default NULL COMMENT '�����λ����Ϣ�ľ�ȷ�ȣ����ױ�ʾ',
  `ACCEPTABLEACCURACY` int(4) default NULL COMMENT '��Ӧ�ɽ��ܵľ�ȷ�ȣ����ױ�ʾ',
  `MAXIMUMAGE` int(4) default NULL COMMENT '���ص�λ����Ϣ�����ɽ���ʱ��,�����ʾ',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `RESPONSETIME` int(4) default NULL COMMENT 'ָʾӦ���ܽ��ܵĵȴ���Ӧ�����ʱ�䣬�����ʾ',
  `APPLICATIONID` varchar(16) default NULL COMMENT 'Ӧ�ñ�ʶ',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '��ʶĳ������',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservice wap lbs �����';

#
# Structure for the `app_wslbs_result` table :
#

DROP TABLE IF EXISTS `app_wslbs_result`;

CREATE TABLE `app_wslbs_result` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `MOBILE` varchar(20) default NULL COMMENT '��λ�ֻ�����',
  `ERRORCODE` varchar(10) default NULL COMMENT '������',
  `ERRORMESSAGE` varchar(500) default NULL COMMENT '������Ϣ',
  `LONGTITUDE` varchar(40) default NULL COMMENT '����',
  `LATITUDE` varchar(40) default NULL COMMENT 'γ��',
  `ALTITUDE` varchar(40) default NULL COMMENT '����',
  `ACCURACY` varchar(40) default NULL COMMENT '����(��)',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `UPDATETIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `APPLICATIONID` varchar(16) default NULL COMMENT 'Ӧ�ñ�ʶ',
  `REQUESTIDENTIFIER` varchar(50) default NULL COMMENT '�����ʶ',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservice wap lbs �����';

#
# Structure for the `app_wsmms_mo` table :
#

DROP TABLE IF EXISTS `app_wsmms_mo`;

CREATE TABLE `app_wsmms_mo` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `EXTCODE` varchar(21) default NULL COMMENT '��չ����',
  `SOURCEADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `RECEIVETIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '���Ž���ʱ��',
  `SUBJECT` varchar(500) default NULL COMMENT '���ű���',
  `MMSTEXT` text COMMENT '�����ı�����',
  `MESSAGECONTENT` mediumtext COMMENT 'MIME�����SMIL��ʽ�ļ�',
  `REQUESTTIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '���ʱ��',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `PRIORITY` tinyint(4) default NULL COMMENT '���ȼ�',
  `READFlAG` int(1) NOT NULL COMMENT '�Ƿ񱻿ͻ��˶�ȡ��',
  `MASID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���� WebService ���ձ�';

#
# Structure for the `app_wsmms_mt` table :
#

DROP TABLE IF EXISTS `app_wsmms_mt`;

CREATE TABLE `app_wsmms_mt` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `EXTCODE` varchar(21) default NULL COMMENT '��չ��',
  `DESTADDR` varchar(2000) NOT NULL COMMENT '�����ֻ�MSISDN,�����á�;���ָ�,��󲻳���50��',
  `REQDELIVERYREPORT` int(4) NOT NULL COMMENT '�Ƿ���Ҫ״̬���� 0:����Ҫ 1:��Ҫ',
  `SUBJECT` varchar(500) NOT NULL COMMENT '���ű���',
  `MESSAGECONTENT` mediumtext COMMENT 'MIME�����SMIL��ʽ�ļ�',
  `REQUESTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���� WebService ���ͱ�';

#
# Structure for the `app_wsmms_status` table :
#

DROP TABLE IF EXISTS `app_wsmms_status`;

CREATE TABLE `app_wsmms_status` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `GWMMSID` varchar(50) default NULL COMMENT '��ҵ���ز�����MsgID',
  `DESTADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `SENTTIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '�ύ����ҵ���ص�ʱ��',
  `SENTRESULT` int(4) default NULL COMMENT '��ӦSUBMITREQ�ķ���ֵ',
  `MMSSTATUS` varchar(40) default NULL COMMENT '����û���Ҫ״̬���棬���ͳɹ���״̬���汣���ڴ��ֶ�',
  `STATUSTIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '�յ�״̬�����ʱ��',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `REQUESTIDENTIFIER` varchar(50) NOT NULL COMMENT '���ͱ�ʶ',
  `MASID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���� WebService ״̬��';

#
# Structure for the `app_wssms_mo` table :
#

DROP TABLE IF EXISTS `app_wssms_mo`;

CREATE TABLE `app_wssms_mo` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `EX_CODE` varchar(21) default NULL COMMENT '��չ��',
  `CONTENT` text COMMENT '��Ϣ����',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `MSGFMT` int(4) NOT NULL COMMENT '��Ϣ����\r\n            0- ASCII\r\n            4- Binary\r\n            8- usc2\r\n            15- gb2312\r\n            16-gb18030\r\n            ',
  `RECEIVE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `READFlAG` int(1) NOT NULL COMMENT '�Ƿ񱻿ͻ��˶�ȡ��',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS ������ID',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `app_wssms_mt` table :
#

DROP TABLE IF EXISTS `app_wssms_mt`;

CREATE TABLE `app_wssms_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `EX_CODE` varchar(21) default NULL COMMENT '��չ��',
  `DEST_ADDR` text COMMENT '�����ֻ�MSISDN,������";"�ָ�',
  `STATUS` tinyint(4) default '0' COMMENT '���ŷ���״̬',
  `PRIORITY` tinyint(4) default NULL COMMENT '��Ϣ���ȼ�',
  `REQ_DELIVERY_REPORT` int(11) default '0' COMMENT '�Ƿ���Ҫ״̬����',
  `MSGFMT` int(4) NOT NULL COMMENT '��Ϣ����\r\n            0- ASCII\r\n            4- Binary\r\n            8- usc2\r\n            15- gb2312\r\n            16-gb18030\r\n            ',
  `SENDMETHOD` int(4) NOT NULL COMMENT '0-��ͨ����\r\n            1-��ͨ����������ʾ\r\n            2-���������\r\n            3-���ṹ����\r\n            ',
  `SUBJECT` varchar(256) default NULL COMMENT '��Ϣ����',
  `CONTENT` text COMMENT '��Ϣ����',
  `SEND_TIME` datetime default NULL COMMENT '��ʱ����ʱ��',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web service�������б�';

#
# Structure for the `app_wssms_status` table :
#

DROP TABLE IF EXISTS `app_wssms_status`;

CREATE TABLE `app_wssms_status` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `STATUS` int(11) NOT NULL COMMENT '����״̬',
  `STATUS_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����״̬ʱ��',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  `MT_ID` bigint(20) NOT NULL COMMENT '����app_wssms_mt��ID�ֶ�',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `REQUESTIDENTIFIER` varchar(50) NOT NULL COMMENT '���ͱ�ʶ',
  `READFlAG` int(1) NOT NULL COMMENT '�Ƿ񱻿ͻ��˶�ȡ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='web service��������״̬��';

#
# Structure for the `app_wswappush_mt` table :
#

DROP TABLE IF EXISTS `app_wswappush_mt`;

CREATE TABLE `app_wswappush_mt` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '��������',
  `EX_CODE` varchar(21) default NULL COMMENT '��չ��',
  `DEST_ADDR` text NOT NULL COMMENT 'Ŀ���ַ',
  `STATUS` bigint(20) default NULL COMMENT '����״̬',
  `PRIORITY` tinyint(4) default NULL COMMENT '���ȼ�',
  `SUBJECT` varchar(256) NOT NULL COMMENT '����',
  `URL` varchar(256) NOT NULL COMMENT '����ĳ�����',
  `SEND_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '��ʱ����ʱ��',
  `REQUEST_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '���ʱ��',
  `UPDATE_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'Ӧ�ñ�ʶ',
  `REQUESTIDENTIFIER` varchar(50) NOT NULL COMMENT '�����ʶ',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS ������ID',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WapPush Ws��';

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
  `Base_id` int(11) NOT NULL auto_increment COMMENT '�ؼ��֣���������',
  `Base_title` varchar(50) NOT NULL COMMENT '�㲥�������',
  `Base_appid` varchar(16) NOT NULL COMMENT '��Ӧmas_app_info�����ţ��������ý����',
  `Base_extcode` varchar(20) default NULL COMMENT '��չ����',
  `Base_sended` int(11) NOT NULL COMMENT 'ʵ���ѷ�����',
  `Base_sendlimit` int(11) NOT NULL default '-1' COMMENT '���������ƣ�-1��ʾ������',
  `Base_status` int(11) NOT NULL default '0' COMMENT '0-����ʹ��,1-ֹͣʹ��',
  `Base_type` int(11) NOT NULL default '0' COMMENT '0-�㲥����1-��ѯ����',
  `Data_url` varchar(200) NOT NULL COMMENT '����Դ���ʵ�JDBC�����ַ���',
  `Data_usr` varchar(20) default NULL COMMENT '����Դ�����û���',
  `Data_pwd` varchar(30) default NULL COMMENT '����Դ��������',
  `Data_tbl` varchar(30) NOT NULL COMMENT '����Դ���ʵı�',
  `Data_filter` varchar(200) default NULL COMMENT '����Դ���¼��������',
  `Data_sep` varchar(10) default NULL COMMENT '����Դ����ֻ�����֮��ָ���',
  `Data_id` varchar(20) NOT NULL COMMENT '����Դ�����ֶ���',
  `Data_dest` text NOT NULL COMMENT '�ֻ������ֶΣ��ָ���Data_sepָ��',
  `Data_msg` varchar(200) NOT NULL COMMENT '�������ݣ������ö������Դ�ֶΣ�����: "${content}${corp}-${emp}"',
  `Data_rept` varchar(20) default NULL COMMENT '״̬�����д�ֶ���',
  `Data_max_id` varchar(20) default NULL COMMENT '��ǰ�ѷ��͵��������Դ����ֵ',
  `Stg_crontab` varchar(200) default NULL COMMENT 'crontab�Ķ�ʱ��ʽ����ֵ���Ըö�ʱ����',
  `Stg_validdate` varchar(20) default NULL COMMENT '��Ч���ڷ�Χ����ֵ����ʱ�䷶Χ����',
  `Stg_repeat_send` int(11) NOT NULL COMMENT '����Ϊ1ʱ,������Data_max_id���˼�¼���ã���ѯ��������Դ��¼�����Ͷ��š�',
  PRIMARY KEY  (`Base_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Structure for the `fund_extcode` table :
#

DROP TABLE IF EXISTS `fund_extcode`;

CREATE TABLE `fund_extcode` (
  `2m` char(2) default NULL COMMENT '2λ��չ��'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='��չ���';

#
# Structure for the `mas_app_ec` table :
#

DROP TABLE IF EXISTS `mas_app_ec`;

CREATE TABLE `mas_app_ec` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `EC_ID` varchar(12) NOT NULL COMMENT '��ҵ����',
  `EC_NAME` varchar(20) default NULL COMMENT '��ҵ����',
  `SERVICE_CODE` varchar(21) NOT NULL COMMENT '���������(�̷������)',
  `IS_EXPAND_SERVICE_CODE` bit(1) NOT NULL default '\0' COMMENT '�Ƿ�������չ�ĳ��������  0-�� 1-��',
  `IS_MAS_AGENT_DOFORIDDEN` bit(1) NOT NULL default '\0' COMMENT '�Ƿ��ն˷���ļ�����������˳�������������MAS������ֱ�Ӵ���',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `SHORT_SERVICE_CODE` (`SERVICE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ſͻ���Ϣ��';

#
# Structure for the `mas_app_forbidden` table :
#

DROP TABLE IF EXISTS `mas_app_forbidden`;

CREATE TABLE `mas_app_forbidden` (
  `ID` int(11) NOT NULL auto_increment,
  `MOBILE` varchar(50) NOT NULL COMMENT '�û��ֻ�����',
  `MAS_APP_INFO_ID` int(11) NOT NULL COMMENT '���ñ�mas_app_info��id�ֶ�',
  `BLACK` bit(1) NOT NULL default '' COMMENT 'true--������ false--������',
  `EFFECT_TIME` date default NULL COMMENT 'ҵ����Ч����',
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '����ʱ��\r\n',
  `RESERVE` varchar(100) default NULL COMMENT 'Ԥ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û��ڰ������� InnoDB free: 251904 kB';

#
# Structure for the `mas_app_info` table :
#

DROP TABLE IF EXISTS `mas_app_info`;

CREATE TABLE `mas_app_info` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '��ţ�������',
  `MAS_APP_EC_ID` int(11) NOT NULL COMMENT '���ñ�mas_app_ec��id�ֶ�',
  `APPLICATION_ID` varchar(16) NOT NULL default '' COMMENT 'EC/SIӦ��ID',
  `APPLICATION_TYPE` varchar(50) NOT NULL COMMENT 'EC/SIӦ������',
  `CONNECT_TIME` datetime default NULL COMMENT '����ʱ��',
  `CM_ABILITY` varchar(256) NOT NULL default '' COMMENT '�����ͨ������',
  `LONG_SERVICE_CODE` varchar(21) NOT NULL default '' COMMENT '���������',
  `OLD_SERVICE_CODE` varchar(21) NOT NULL default '' COMMENT '�ɷ�����룬�����¾ɷ������ת��',
  `BIZ_CODE` varchar(10) NOT NULL default '' COMMENT 'ҵ�����',
  `BIZ_NAME` varchar(20) NOT NULL default '' COMMENT 'ҵ������',
  `OP_CODE` varchar(70) default NULL COMMENT 'ҵ�����ָ��',
  `IS_AUTO_CONFIG_CODE` bit(1) NOT NULL default '\0' COMMENT '�Ƿ��Զ���ӳ���������ҵ�����  0-�� 1-��',
  `IS_OLD_SERVICE_CONVERT` bit(1) NOT NULL default '\0' COMMENT '�Ƿ����¾ɷ������װ�� 0-�� 1-��',
  `IS_VALUE_SERVICE` bit(1) NOT NULL default '\0' COMMENT '�Ƿ�����ֵҵ��[��ֵ��ǩԼ��ϵ��or����ֵ��������or��������] 0-�� 1-��',
  `IS_BLACKLIST` bit(1) NOT NULL default '' COMMENT '�Ƿ����ú�����',
  `FEE_TYPE` tinyint(4) NOT NULL default '0' COMMENT '�ʷ����\r\n01����"�Ʒ��û�����"���\r\n02����"�Ʒ��û�����"��������Ϣ��\r\n03����"�Ʒ��û�����"��������ȡ��Ϣ��\r\n04����"�Ʒ��û�����"����Ϣ�ѷⶥ\r\n05����"�Ʒ��û�����"���շ�����SPʵ��',
  `FEE_CODE` int(11) NOT NULL default '0' COMMENT '�ʷѴ��루�Է�Ϊ��λ��',
  `FEE_USER_TYPE` tinyint(4) NOT NULL default '0' COMMENT '�Ʒ��û�����\r\n0����Ŀ���ն�MSISDN�Ʒ�\r\n1����Դ�ն�MSISDN�Ʒ�\r\n2����SP�Ʒ�',
  `FEE_TERMINAL_ID` varchar(21) default NULL COMMENT '���Ѻ���',
  `RECEIVE_HANDLER_CLASS` varchar(200) default NULL COMMENT '���д�������(ȫ��)',
  `STATUS_HANDLER_CLASS` varchar(200) default NULL COMMENT '״̬���洦������(ȫ��)',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1\r\n\r\n',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  `ENABLED` bit(1) NOT NULL default '\0' COMMENT '�Ƿ���� 0--������  1--����',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `APPLICATION_ID` (`APPLICATION_ID`),
  KEY `mas_app_info_index` (`APPLICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ӧ�ý�����Ϣ��';

#
# Structure for the `mas_app_order` table :
#

DROP TABLE IF EXISTS `mas_app_order`;

CREATE TABLE `mas_app_order` (
  `ID` int(11) NOT NULL auto_increment,
  `MOBILE` varchar(16) NOT NULL COMMENT '�û��ֻ�����',
  `MAS_APP_INFO_ID` int(11) NOT NULL COMMENT '���ñ�mas_app_info��id�ֶ�',
  `EFFECT_TIME` date default NULL COMMENT 'ҵ����Ч����',
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `RESERVE` varchar(100) default NULL COMMENT 'Ԥ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û�������ϵ�� InnoDB free: 251904 kB';

#
# Structure for the `mas_business_stat` table :
#

DROP TABLE IF EXISTS `mas_business_stat`;

CREATE TABLE `mas_business_stat` (
  `ID` int(11) NOT NULL auto_increment COMMENT '��������',
  `BUSINESS_TYPE` int(2) default NULL COMMENT 'ҵ������',
  `CAPACITY_TYPE` int(2) default NULL COMMENT '��������',
  `SEND_FLAG` int(2) default NULL COMMENT '���л�������',
  `CONTENT` mediumtext COMMENT '���������Ӧ����',
  `RESULT` int(2) default NULL COMMENT '���������Ӧ���',
  `REQUEST_TIME` bigint(20) default NULL COMMENT '����ʱ��',
  `RESPONSE_TIME` bigint(20) default NULL COMMENT '��Ӧʱ��',
  `MASID` varchar(50) default NULL COMMENT 'MASID',
  `ISSTATISTIC` int(1) default '0' COMMENT '�Ƿ�ͳ��',
  `ISABLE` int(1) default '0' COMMENT '�Ƿ���ʱ��',
  `APPLICATIONID` varchar(20) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `mas_business_stat_index` (`MASID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MASҵ��ͳ�Ʊ�';

#
# Structure for the `mas_lbs_tlrsreq` table :
#

DROP TABLE IF EXISTS `mas_lbs_tlrsreq`;

CREATE TABLE `mas_lbs_tlrsreq` (
  `ID` int(11) NOT NULL auto_increment COMMENT '��������',
  `SILBSID` varchar(50) default NULL,
  `REQUESTTIME` datetime default NULL,
  `APPLICATIONID` varchar(16) default NULL COMMENT 'Ӧ�û��߲����ʶ',
  `IDENTIFIER` varchar(50) default NULL COMMENT '�����ʶ��',
  `REQUESTID` varchar(32) default NULL COMMENT '��λ���ط��ر�ʶ',
  `ACTUALCOUNTER` int(11) default '0' COMMENT '���ڶ�λʵ�ʴ���',
  `EXPECTCOUNTER` int(11) default '0' COMMENT '���ڶ�λԤ�ڴ���',
  `MODULE` int(10) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ڶ�λ��ʶ��';

#
# Structure for the `mas_mib_switch` table :
#

DROP TABLE IF EXISTS `mas_mib_switch`;

CREATE TABLE `mas_mib_switch` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ�����-����',
  `IPADDR` varchar(20) default NULL COMMENT 'ϵͳIP��ַ',
  `SYSTEMDESC` varchar(50) NOT NULL COMMENT 'ϵͳ����',
  `SYSTEMTYPE` tinyint(4) default NULL COMMENT 'ϵͳ����,1ͳһ����ƽ̨,2QOS����ϵͳ,3��������ϵͳ,0����ϵͳ',
  `SWITCHTYPE` tinyint(4) default '0' COMMENT '��������,0�ɼ�&TRAP����,1������һ����',
  `READSWITCH` tinyint(4) default '0' COMMENT '���ݲɼ�����,0�ر�1����',
  `TRAPSWITCH` tinyint(4) default '0' COMMENT '����TRAP����,0�ر�1����',
  `TRAPTYPE` tinyint(4) default '0' COMMENT '����TRAP����,0������TRAP,1ֻ����ͨ�ø澯,2ֻ�����ض��澯,3���ָ澯������',
  `OTHERSWITCH` tinyint(4) default '0' COMMENT '������һ����,0�ر�1����',
  `UPDATETIME` datetime default NULL COMMENT '�޸�ʱ��',
  `UPDATEUSER` varchar(20) default NULL COMMENT '�޸���',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS��Χϵͳ��mib���ݲɼ����������õĿ����Լ��������';

#
# Structure for the `mas_mib_upgrade` table :
#

DROP TABLE IF EXISTS `mas_mib_upgrade`;

CREATE TABLE `mas_mib_upgrade` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ�����',
  `UPGRADEINFO` varchar(200) NOT NULL COMMENT 'MAS�������յ�����ƽ̨��������Ϣ',
  `SERVERADDR` varchar(20) default NULL COMMENT '����ά���ķ�������ַ',
  `USERNAME` varchar(30) default NULL COMMENT '�û���',
  `PASSWD` varchar(30) default NULL COMMENT '����',
  `FILEPATH` varchar(100) default NULL COMMENT '���·��',
  `RECEIVETIME` datetime NOT NULL COMMENT '���յ���ʱ��',
  `CONFIRMTIME` datetime default NULL COMMENT 'ȷ�ϵ�ʱ��',
  `CONFIRMSTATUS` int(5) default '0' COMMENT '0����δȷ�ϣ�1������ȷ��',
  `CONFIRMUSER` varchar(50) default NULL COMMENT 'ȷ�ϴ�������Ϣ���û�',
  `FTPINFO` varchar(200) default NULL COMMENT '�ӹ���ƽ̨�յ�������������ά����Ϣ,����',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS��ͳһ����ƽ̨��ȡ������ά����Ϣ����ʷ��¼';

#
# Structure for the `mas_mms_inbox` table :
#

DROP TABLE IF EXISTS `mas_mms_inbox`;

CREATE TABLE `mas_mms_inbox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  `EXT_CODE` varchar(21) default NULL COMMENT '��չ���루����Ϊ�գ�',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `SUBJECT` varchar(500) default NULL COMMENT '���ű���',
  `MESSAGE_CONTENT` mediumtext COMMENT 'MIME�����SMIL��ʽ�ļ�',
  `MESSAGE_FILES` text COMMENT '���ܵĲ����ļ�����·���б�',
  `RECEIVE_TIME` datetime NOT NULL COMMENT '���Ž���ʱ��',
  `PRIORITY` tinyint(4) default NULL COMMENT '���ȼ�',
  `RESERVE1` varchar(20) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(20) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(20) default NULL COMMENT 'Ԥ��3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS�ڲ����Ž��ܱ�';

#
# Structure for the `mas_mms_outbox` table :
#

DROP TABLE IF EXISTS `mas_mms_outbox`;

CREATE TABLE `mas_mms_outbox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  `MSG_ID` varchar(50) default NULL COMMENT '��ҵ���ز�����MsgID',
  `EXT_CODE` varchar(21) default NULL COMMENT '��չ����',
  `BIZ_CODE` varchar(10) NOT NULL COMMENT 'ҵ�����',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `REQ_DELIVERY_REPORT` tinyint(4) NOT NULL default '0' COMMENT '�Ƿ���Ҫ���ͱ���(0=����Ҫ 1=��Ҫ)',
  `SUBJECT` varchar(500) default NULL COMMENT '���ű���',
  `MESSAGE_CONTENT` mediumtext COMMENT 'MIME�����SMIL��ʽ�ļ�',
  `MESSAGE_FILES` text COMMENT '���Ͳ����ļ�����·���б�',
  `PRIORITY` tinyint(4) NOT NULL default '1' COMMENT '��Ϣ�����ȼ�����Ҫ�ԣ���0=������ȼ���1=������2=����',
  `EC_ID` varchar(6) default NULL COMMENT '��ҵ����',
  `CHARGED_PARTY` tinyint(4) NOT NULL default '0' COMMENT '���ѷ�ʽ ����VASP���ύMM�ĸ��ѷ�,���ͷ������շ������ͷ��ͽ��շ��������������ѣ���ѡ��0��Sender��1��Recipients��2��Both��3��Neither��4��ThirdParty',
  `CHARGED_PARTY_ID` varchar(21) NOT NULL COMMENT '���Ѻ���',
  `SENT_TIME` datetime NOT NULL COMMENT '�ύ����ҵ���ص�ʱ��\r\n',
  `READ_STATUS` varchar(50) default '\r\n\r\n' COMMENT '����û���Ҫ��ȡ״̬���棬�ն��յ��󷵻�״̬���汣���ڴ��ֶ�',
  `READ_TIME` datetime default NULL COMMENT '�յ���״̬�����ʱ��',
  `SEND_COUNT` int(11) NOT NULL default '0' COMMENT '���ʹ���',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  PRIMARY KEY  (`ID`),
  KEY `MAS_MMS_OUTBOX_TIME` (`SENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS�ڲ����Ŵ����ͱ�';

#
# Structure for the `mas_mms_sent` table :
#

DROP TABLE IF EXISTS `mas_mms_sent`;

CREATE TABLE `mas_mms_sent` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '�Զ����',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS������ID',
  `MSG_ID` varchar(50) default NULL COMMENT '��ҵ���ز�����MsgID',
  `EXT_CODE` varchar(21) default NULL COMMENT '��չ����',
  `BIZ_CODE` varchar(10) NOT NULL COMMENT 'ҵ�����',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT '�����ֻ�����',
  `REQ_DELIVERY_REPORT` tinyint(4) NOT NULL default '0' COMMENT '�Ƿ���Ҫ���ͱ���(0=����Ҫ 1=��Ҫ)',
  `SUBJECT` varchar(500) default NULL COMMENT '���ű���',
  `MESSAGE_CONTENT` mediumtext COMMENT 'MIME�����SMIL��ʽ�ļ�',
  `MESSAGE_FILES` text COMMENT '���Ͳ����ļ�����·���б�',
  `PRIORITY` tinyint(4) NOT NULL default '1' COMMENT '��Ϣ�����ȼ�����Ҫ�ԣ���0=������ȼ���1=������2=����',
  `EC_ID` varchar(6) default NULL COMMENT '��ҵ����',
  `CHARGED_PARTY` tinyint(4) NOT NULL default '0' COMMENT '���ѷ�ʽ ����VASP���ύMM�ĸ��ѷ�,���ͷ������շ������ͷ��ͽ��շ��������������ѣ���ѡ��0��Sender��1��Recipients��2��Both��3��Neither��4��ThirdParty',
  `CHARGED_PARTY_ID` varchar(21) NOT NULL COMMENT '���Ѻ���',
  `SENT_TIME` datetime NOT NULL COMMENT '�ύ����ҵ���ص�ʱ��\r\n',
  `SENT_RESULT` int(11) NOT NULL COMMENT '��ӦSUBMITREQ�ķ���ֵ',
  `MMS_STATUS` varchar(50) default NULL COMMENT '����û���Ҫ״̬���棬���ͳɹ���״̬���汣���ڴ��ֶ�',
  `STATUS_TIME` datetime default NULL COMMENT '�յ�״̬�����ʱ��',
  `READ_STATUS` varchar(50) default '\r\n\r\n' COMMENT '����û���Ҫ��ȡ״̬���棬�ն��յ��󷵻�״̬���汣���ڴ��ֶ�',
  `READ_TIME` datetime default NULL COMMENT '�յ���״̬�����ʱ��',
  `SEND_COUNT` int(11) NOT NULL default '0' COMMENT '���ʹ���',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAS�ڲ����ŷ����Ѵ����';

#
# Structure for the `mas_reply_checkcount` table :
#

DROP TABLE IF EXISTS `mas_reply_checkcount`;

CREATE TABLE `mas_reply_checkcount` (
  `ID` int(11) NOT NULL auto_increment,
  `FUNNAME` varchar(16) NOT NULL COMMENT '��������',
  `FUNCOUNT` int(11) NOT NULL COMMENT '���ܴ���',
  `MAXNUM` int(11) default '0' COMMENT '�������ֵ',
  `MINNUM` int(11) default '0' COMMENT '������Сֵ',
  `RESERVE` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���Żظ����ձ� InnoDB free: 251904 kB';

#
# Structure for the `mas_reply_record` table :
#

DROP TABLE IF EXISTS `mas_reply_record`;

CREATE TABLE `mas_reply_record` (
  `ID` int(11) NOT NULL auto_increment,
  `RECORDNUM` int(11) NOT NULL COMMENT '�ظ����ŵı��',
  `FUNNAME` varchar(16) NOT NULL COMMENT '��������',
  `FUNNUM` int(11) NOT NULL COMMENT '���ܴ���',
  `FOREIGNNUM` varchar(20) default NULL COMMENT '���ŵ����',
  `USERID` varchar(20) default NULL COMMENT '�û������',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `RESERVE` varchar(20) default NULL COMMENT '����',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���Żظ���¼�� InnoDB free: 251904 kB';

#
# Structure for the `mas_sms_inbox` table :
#

DROP TABLE IF EXISTS `mas_sms_inbox`;

CREATE TABLE `mas_sms_inbox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '���',
  `MSG_ID` bigint(20) NOT NULL COMMENT '��Ϣ��ʶ����SP��������ر������',
  `DEST_ADDR` varchar(21) NOT NULL COMMENT 'Ŀ�ĺ��� \r\nSP�ķ�����룬һ��4--6λ��������ǰ׺Ϊ�������ĳ����룻�ú������ֻ��û�����Ϣ�ı��к���\r\n',
  `SERVICE_ID` varchar(10) NOT NULL COMMENT 'ҵ�����ͣ������֡���ĸ�ͷ��ŵ���ϡ�',
  `TP_PID` tinyint(4) NOT NULL default '0' COMMENT 'GSMЭ������',
  `TP_UDHI` tinyint(4) NOT NULL default '0' COMMENT 'GSMЭ������',
  `MSG_FMT` tinyint(4) NOT NULL default '8' COMMENT '��Ϣ��ʽ\r\n  0��ASCII��\r\n  3������д������\r\n  4����������Ϣ\r\n  8��UCS2����\r\n15����GB����  ������������ \r\n',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT 'Դ�ն�MSISDN����',
  `CONTENT` varchar(200) NOT NULL COMMENT '��Ϣ����',
  `LINK_ID` varchar(21) default NULL COMMENT '�㲥ҵ��ʹ�õ�LinkID���ǵ㲥��ҵ���MT���̲�ʹ�ø��ֶΡ�',
  `RECEIVED_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS ������ID',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_limit` table :
#

DROP TABLE IF EXISTS `mas_sms_limit`;

CREATE TABLE `mas_sms_limit` (
  `id` int(11) NOT NULL auto_increment,
  `userID` int(11) default NULL COMMENT '�û�ID',
  `limitCount` int(11) NOT NULL COMMENT '�����޶�',
  `currentCount` int(11) default NULL COMMENT '��ǰ���Ͷ�����',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_outbox` table :
#

DROP TABLE IF EXISTS `mas_sms_outbox`;

CREATE TABLE `mas_sms_outbox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '���',
  `MSG_ID` bigint(20) NOT NULL default '0' COMMENT '��Ϣ��ʶ����SP��������ر������',
  `PK_TOTAL` tinyint(4) NOT NULL default '1' COMMENT '��ͬMsg_Id����Ϣ����������1��ʼ',
  `PK_NUMBER` tinyint(4) NOT NULL default '1' COMMENT '��ͬMsg_Id����Ϣ��ţ���1��ʼ',
  `REQ_REPORT` bit(1) NOT NULL default '' COMMENT '�Ƿ�Ҫ�󷵻�״̬ȷ�ϱ��棺\r\n0������Ҫ\r\n1����Ҫ\r\n2������SMC����\r\n �������Ͷ��Ž������ؼƷ�ʹ�ã������͸�Ŀ���ն�)',
  `PRIORITY` tinyint(4) NOT NULL default '0' COMMENT '��Ϣ���ȼ�',
  `SERVICE_ID` varchar(10) NOT NULL COMMENT 'ҵ�����ͣ������֡���ĸ�ͷ��ŵ���ϡ�',
  `FEE_USERTYPE` tinyint(4) NOT NULL default '1' COMMENT '�Ʒ��û������ֶ�\r\n0����Ŀ���ն�MSISDN�Ʒѣ�\r\n1����Դ�ն�MSISDN�Ʒѣ�\r\n2����SP�Ʒ�;\r\n3����ʾ���ֶ���Ч����˭�ƷѲμ�Fee_terminal_Id�ֶΡ�\r\n',
  `FEE_TERMINAL_ID` varchar(21) default NULL COMMENT '���Ʒ��û��ĺ��루�籾�ֽ���գ����ʾ���ֶ���Ч����˭�ƷѲμ�Fee_UserType�ֶΣ����ֶ���Fee_UserType�ֶλ��⣩',
  `TP_PID` tinyint(4) NOT NULL default '0' COMMENT 'GSMЭ������',
  `TP_UDHI` tinyint(4) NOT NULL default '0' COMMENT 'GSMЭ������',
  `MSG_FMT` tinyint(4) NOT NULL default '8' COMMENT '��Ϣ��ʽ\r\n  0��ASCII��\r\n  3������д������\r\n  4����������Ϣ\r\n  8��UCS2����\r\n15����GB����  ������������ \r\n',
  `MSG_SRC` varchar(6) default NULL COMMENT '��Ϣ������Դ(SP_Id)',
  `FEE_TYPE` varchar(2) NOT NULL default '' COMMENT '�ʷ����\r\n01����"�Ʒ��û�����"���\r\n02����"�Ʒ��û�����"��������Ϣ��\r\n03����"�Ʒ��û�����"��������ȡ��Ϣ��\r\n04����"�Ʒ��û�����"����Ϣ�ѷⶥ\r\n05����"�Ʒ��û�����"���շ�����SPʵ��\r\n',
  `FEE_CODE` varchar(6) NOT NULL default '' COMMENT '�ʷѴ��루�Է�Ϊ��λ��',
  `SEND_TIME` datetime default NULL COMMENT '��ʱ����ʱ��',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT 'Դ����\r\nSP�ķ�������ǰ׺Ϊ�������ĳ�����, ���ؽ��ú����������SMPPЭ��Submit_SM��Ϣ��Ӧ��source_addr�ֶΣ��ú����������û��ֻ�����ʾΪ����Ϣ�����к���\r\n',
  `DEST_ADDR` text NOT NULL COMMENT '���ն��ŵ�MSISDN����(���������;�ָ�)',
  `CONTENT` varchar(160) NOT NULL COMMENT '��Ϣ����',
  `LINK_ID` varchar(21) default NULL COMMENT '�㲥ҵ��ʹ�õ�LinkID���ǵ㲥��ҵ���MT���̲�ʹ�ø��ֶΡ�',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `SENT_COUNT` tinyint(4) NOT NULL default '0' COMMENT '���ʹ���',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS ������ID\r\n',
  `SEND_METHOD` tinyint(4) NOT NULL default '0' COMMENT '���ͷ��� 0:��ͨ���� 1:��ͨ����������ʾ 2:������ 3�����ṹ����� 4:WAPPUSH',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  `routeID` varchar(50) default NULL COMMENT '·��ID',
  `userName` varchar(50) default NULL COMMENT '�����û���',
  PRIMARY KEY  (`ID`),
  KEY `MAS_SMS_OUTBOX_TIME_ROUTEID` (`SEND_TIME`,`routeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_route` table :
#

DROP TABLE IF EXISTS `mas_sms_route`;

CREATE TABLE `mas_sms_route` (
  `routeID` varchar(64) NOT NULL COMMENT '·��ID',
  `pattern` mediumtext COMMENT '·�ɹ���',
  `serverIP` varchar(32) default NULL COMMENT '����IP',
  `port` int(11) default NULL COMMENT '�˿�',
  `userName` varchar(32) default NULL COMMENT '�û���',
  `password` varchar(32) default NULL COMMENT '����',
  `proxyClass` mediumtext COMMENT '������',
  `isValid` bit(1) default NULL COMMENT '�Ƿ���Ч',
  `sendRate` int(11) default NULL COMMENT '��������',
  `returnPhone` varchar(32) default NULL COMMENT '�����',
  `createTime` datetime default NULL COMMENT '����ʱ��',
  `updateTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY  (`routeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `mas_sms_sent` table :
#

DROP TABLE IF EXISTS `mas_sms_sent`;

CREATE TABLE `mas_sms_sent` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '���',
  `MSG_ID` bigint(20) NOT NULL default '0' COMMENT '��Ϣ��ʶ����SP��������ر������',
  `PK_TOTAL` tinyint(4) NOT NULL default '1' COMMENT '��ͬMsg_Id����Ϣ����������1��ʼ',
  `PK_NUMBER` tinyint(4) NOT NULL default '1' COMMENT '��ͬMsg_Id����Ϣ��ţ���1��ʼ',
  `REQ_REPORT` tinyint(4) NOT NULL default '1' COMMENT '�Ƿ�Ҫ�󷵻�״̬ȷ�ϱ��棺\r\n0������Ҫ\r\n1����Ҫ\r\n2������SMC����\r\n �������Ͷ��Ž������ؼƷ�ʹ�ã������͸�Ŀ���ն�)',
  `PRIORITY` tinyint(4) NOT NULL default '0' COMMENT '��Ϣ���ȼ�',
  `SERVICE_ID` varchar(10) NOT NULL COMMENT 'ҵ�����ͣ������֡���ĸ�ͷ��ŵ���ϡ�',
  `FEE_USERTYPE` tinyint(4) NOT NULL default '1' COMMENT '�Ʒ��û������ֶ�\r\n0����Ŀ���ն�MSISDN�Ʒѣ�\r\n1����Դ�ն�MSISDN�Ʒѣ�\r\n2����SP�Ʒ�;\r\n3����ʾ���ֶ���Ч����˭�ƷѲμ�Fee_terminal_Id�ֶΡ�\r\n',
  `FEE_TERMINAL_ID` varchar(21) default NULL COMMENT '���Ʒ��û��ĺ��루�籾�ֽ���գ����ʾ���ֶ���Ч����˭�ƷѲμ�Fee_UserType�ֶΣ����ֶ���Fee_UserType�ֶλ��⣩',
  `TP_PID` tinyint(4) NOT NULL default '0' COMMENT 'GSMЭ������',
  `TP_UDHI` tinyint(4) NOT NULL default '0' COMMENT 'GSMЭ������',
  `MSG_FMT` tinyint(4) NOT NULL default '8' COMMENT '��Ϣ��ʽ\r\n  0��ASCII��\r\n  3������д������\r\n  4����������Ϣ\r\n  8��UCS2����\r\n15����GB����  ������������ \r\n',
  `MSG_SRC` varchar(6) default NULL COMMENT '��Ϣ������Դ(SP_Id)',
  `FEE_TYPE` varchar(2) default '' COMMENT '�ʷ����\r\n01����"�Ʒ��û�����"���\r\n02����"�Ʒ��û�����"��������Ϣ��\r\n03����"�Ʒ��û�����"��������ȡ��Ϣ��\r\n04����"�Ʒ��û�����"����Ϣ�ѷⶥ\r\n05����"�Ʒ��û�����"���շ�����SPʵ��\r\n',
  `FEE_CODE` varchar(6) default '' COMMENT '�ʷѴ��루�Է�Ϊ��λ��',
  `SEND_TIME` datetime default NULL COMMENT '��ʱ����ʱ��',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT 'Դ����\r\nSP�ķ�������ǰ׺Ϊ�������ĳ�����, ���ؽ��ú����������SMPPЭ��Submit_SM��Ϣ��Ӧ��source_addr�ֶΣ��ú����������û��ֻ�����ʾΪ����Ϣ�����к���\r\n',
  `DEST_ADDR` varchar(256) NOT NULL COMMENT '���ն��ŵ�MSISDN����(���������;�ָ�)',
  `CONTENT` varchar(160) NOT NULL COMMENT '��Ϣ����',
  `LINK_ID` varchar(21) default NULL COMMENT '�㲥ҵ��ʹ�õ�LinkID���ǵ㲥��ҵ���MT���̲�ʹ�ø��ֶΡ�',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `SENT_COUNT` tinyint(4) NOT NULL default '0' COMMENT '���ʹ���',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS ������ID',
  `SEND_RESULT` int(11) NOT NULL default '0' COMMENT 'CMPP_SUBMIT�ķ���ֵ',
  `SMS_STATUS` varchar(20) default NULL COMMENT '����û���Ҫ״̬���棬���ͳɹ���״̬���汣���ڴ��ֶ�',
  `STATUS_TIME` datetime default NULL COMMENT '�յ�״̬�����ʱ��',
  `SEND_METHOD` tinyint(4) NOT NULL default '0' COMMENT '���ͷ��� 0:��ͨ���� 1:��ͨ����������ʾ 2:������ 3�����ṹ����� 4:WAPPUSH',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  `routeID` varchar(50) default NULL COMMENT '·��ID',
  `userName` varchar(50) default NULL COMMENT '�����û���',
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
  `ID` bigint(20) NOT NULL auto_increment COMMENT '���',
  `MSG_ID` bigint(20) NOT NULL default '0' COMMENT '��Ϣ��ʶ����SP��������ر������',
  `PK_TOTAL` tinyint(4) NOT NULL default '1' COMMENT '��ͬMsg_Id����Ϣ����������1��ʼ',
  `PK_NUMBER` tinyint(4) NOT NULL default '1' COMMENT '��ͬMsg_Id����Ϣ��ţ���1��ʼ',
  `REQ_REPORT` tinyint(4) NOT NULL default '1' COMMENT '�Ƿ�Ҫ�󷵻�״̬ȷ�ϱ��棺\r\n0������Ҫ\r\n1����Ҫ\r\n2������SMC����\r\n �������Ͷ��Ž������ؼƷ�ʹ�ã������͸�Ŀ���ն�)',
  `PRIORITY` tinyint(4) NOT NULL default '0' COMMENT '��Ϣ���ȼ�',
  `SERVICE_ID` varchar(10) NOT NULL COMMENT 'ҵ�����ͣ������֡���ĸ�ͷ��ŵ���ϡ�',
  `FEE_USERTYPE` tinyint(4) NOT NULL default '1' COMMENT '�Ʒ��û������ֶ�\r\n0����Ŀ���ն�MSISDN�Ʒѣ�\r\n1����Դ�ն�MSISDN�Ʒѣ�\r\n2����SP�Ʒ�;\r\n3����ʾ���ֶ���Ч����˭�ƷѲμ�Fee_terminal_Id�ֶΡ�\r\n',
  `FEE_TERMINAL_ID` varchar(21) default NULL COMMENT '���Ʒ��û��ĺ��루�籾�ֽ���գ����ʾ���ֶ���Ч����˭�ƷѲμ�Fee_UserType�ֶΣ����ֶ���Fee_UserType�ֶλ��⣩',
  `TP_PID` tinyint(4) NOT NULL default '0' COMMENT 'GSMЭ������',
  `TP_UDHI` tinyint(4) NOT NULL default '0' COMMENT 'GSMЭ������',
  `MSG_FMT` tinyint(4) NOT NULL default '8' COMMENT '��Ϣ��ʽ\r\n  0��ASCII��\r\n  3������д������\r\n  4����������Ϣ\r\n  8��UCS2����\r\n15����GB����  ������������ \r\n',
  `MSG_SRC` varchar(6) default NULL COMMENT '��Ϣ������Դ(SP_Id)',
  `FEE_TYPE` varchar(2) default '' COMMENT '�ʷ����\r\n01����"�Ʒ��û�����"���\r\n02����"�Ʒ��û�����"��������Ϣ��\r\n03����"�Ʒ��û�����"��������ȡ��Ϣ��\r\n04����"�Ʒ��û�����"����Ϣ�ѷⶥ\r\n05����"�Ʒ��û�����"���շ�����SPʵ��\r\n',
  `FEE_CODE` varchar(6) default '' COMMENT '�ʷѴ��루�Է�Ϊ��λ��',
  `SEND_TIME` datetime default NULL COMMENT '��ʱ����ʱ��',
  `SOURCE_ADDR` varchar(21) NOT NULL COMMENT 'Դ����\r\nSP�ķ�������ǰ׺Ϊ�������ĳ�����, ���ؽ��ú����������SMPPЭ��Submit_SM��Ϣ��Ӧ��source_addr�ֶΣ��ú����������û��ֻ�����ʾΪ����Ϣ�����к���\r\n',
  `DEST_ADDR` text NOT NULL COMMENT '���ն��ŵ�MSISDN����(���������;�ָ�)',
  `CONTENT` varchar(160) NOT NULL COMMENT '��Ϣ����',
  `LINK_ID` varchar(21) default NULL COMMENT '�㲥ҵ��ʹ�õ�LinkID���ǵ㲥��ҵ���MT���̲�ʹ�ø��ֶΡ�',
  `REQUEST_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `SENT_COUNT` tinyint(4) NOT NULL default '0' COMMENT '���ʹ���',
  `MAS_ID` varchar(50) NOT NULL COMMENT 'MAS ������ID',
  `SEND_RESULT` int(11) NOT NULL default '0' COMMENT 'CMPP_SUBMIT�ķ���ֵ',
  `SMS_STATUS` varchar(20) default NULL COMMENT '����û���Ҫ״̬���棬���ͳɹ���״̬���汣���ڴ��ֶ�',
  `STATUS_TIME` datetime default NULL COMMENT '�յ�״̬�����ʱ��',
  `SEND_METHOD` tinyint(4) NOT NULL default '0' COMMENT '���ͷ��� 0:��ͨ���� 1:��ͨ����������ʾ 2:������ 3�����ṹ����� 4:WAPPUSH',
  `RESERVE1` varchar(100) default NULL COMMENT 'Ԥ��1',
  `RESERVE2` varchar(100) default NULL COMMENT 'Ԥ��2',
  `RESERVE3` varchar(100) default NULL COMMENT 'Ԥ��3',
  `routeID` varchar(50) default NULL COMMENT '·��ID',
  `userName` varchar(50) default NULL COMMENT '�����û���',
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
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `REQ_KEY` varchar(16) NOT NULL COMMENT '����ؼ��֣�����ƥ����������ĵ�ַ',
  `ADDRESS` varchar(2000) NOT NULL COMMENT '��ҵӦ�õ�ַ',
  `APPLICATION_TYPE` varchar(4) NOT NULL COMMENT 'Ӧ������',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ҵӦ������ת����';

#
# Structure for the `mas_ussd_session` table :
#

DROP TABLE IF EXISTS `mas_ussd_session`;

CREATE TABLE `mas_ussd_session` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `USSD_IDENTITIER` varchar(50) NOT NULL COMMENT '�Ի���ʶһ���ض���USSD����',
  `MSISDN` varchar(21) NOT NULL COMMENT '�ƶ�̨����',
  `SERVICE_CODE` varchar(21) NOT NULL COMMENT 'ҵ�������',
  `CREATOR` tinyint(4) NOT NULL default '1' COMMENT '�Ի����� 1:USSDC->SP 2:SP->USSDC',
  `SENDER_ID` int(11) NOT NULL default '0' COMMENT '��Ϣ�������Ự���Ʊ�ʶ����ΧΪ��0x0h~0x7FFFFFFFh',
  `RECEIVER_ID` int(11) NOT NULL default '0' COMMENT '��Ϣ���շ��Ự���Ʊ�ʶ����Ϊ0xFFFFFFFF',
  `STATUS` tinyint(4) NOT NULL default '1' COMMENT '�Ի�״̬ 0:�ѹر� 1:������',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT 'EC/SIӦ�õ�ID',
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '�����Ի�ʱ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='USSD�Ự��Ϣ��';

#
# Structure for the `mas_ussd_session_data` table :
#

DROP TABLE IF EXISTS `mas_ussd_session_data`;

CREATE TABLE `mas_ussd_session_data` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `USSD_IDENTITIER` varchar(50) NOT NULL COMMENT '�Ի���ʶһ���ض���USSD����',
  `COMMAND_ID` int(11) NOT NULL COMMENT '��Ϣ���ͱ�ʶ',
  `SERVICE_CODE` varchar(21) default NULL COMMENT 'ҵ�������',
  `USSD_CONTENT` varchar(200) default NULL COMMENT 'USSD��������',
  `OP_TYPE` tinyint(4) NOT NULL default '1' COMMENT '�������� 1:USSDC->SP 2:SP->USSDC',
  `STATUS` tinyint(4) NOT NULL default '0' COMMENT '״̬ 0:�Ѵ��� 1���ȴ�����',
  `CREATE_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '�����Ի�ʱ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='USSD�Ự���ݱ�';

#
# Structure for the `mas_web_proxy_relation` table :
#

DROP TABLE IF EXISTS `mas_web_proxy_relation`;

CREATE TABLE `mas_web_proxy_relation` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `SERVICE_NAME` varchar(100) NOT NULL COMMENT '�ն�����ķ���,����ƥ����ҵWEB�Ż�URL',
  `WEB_PORTAL_URL` varchar(200) NOT NULL COMMENT '��ҵWEB�Ż�URL',
  `ENABLED` bit(1) NOT NULL default '\0' COMMENT '�Ƿ����ô˴���',
  `USE_SSL` bit(1) NOT NULL default '\0' COMMENT '�Ƿ������ն˵�MAS��SSL����',
  `APPLICATION_TYPE` varchar(4) NOT NULL COMMENT 'Ӧ������',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB�����ϵ��';

#
# Structure for the `p_bsplug_element_add` table :
#

DROP TABLE IF EXISTS `p_bsplug_element_add`;

CREATE TABLE `p_bsplug_element_add` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `PROXY_ID` int(11) NOT NULL COMMENT 'WEB����ID, ����mas_web_proxy_relation��ID',
  `PAGE` varchar(100) NOT NULL COMMENT 'ҳ��URL',
  `ELEMENT_CONTENT` text NOT NULL COMMENT 'Ԫ������',
  `ELEMENT_TYPE` tinyint(4) NOT NULL default '0' COMMENT 'Ԫ������ 1:ͼƬ 0:�ı�',
  `TARGETTYPE` int(11) NOT NULL default '0' COMMENT 'Ŀ��Ԫ������',
  `TARGET` text COMMENT 'Ŀ��λ��',
  `ISALLTARGET` bit(1) default '' COMMENT '�Ƿ������е�ƥ���λ�����',
  `ISBEFORTARGET` bit(1) default '\0' COMMENT '�Ƿ���Ŀ��λ��֮ǰ���',
  `INDEX` int(11) default '1' COMMENT '���λ�õı��',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S���ҳ�����Ԫ�ر�';

#
# Structure for the `p_bsplug_element_filter` table :
#

DROP TABLE IF EXISTS `p_bsplug_element_filter`;

CREATE TABLE `p_bsplug_element_filter` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `PROXY_ID` int(11) NOT NULL COMMENT 'WEB����ID, ����mas_web_proxy_relation��ID',
  `PAGE` varchar(100) NOT NULL COMMENT 'ҳ��URL',
  `ELEMENT_NAME` varchar(50) NOT NULL COMMENT 'Ԫ������',
  `ELEMENT_TYPE` tinyint(4) NOT NULL default '0' COMMENT 'Ԫ������ 0:��� 1:ͼƬ',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S���ҳ�����Ԫ�ر�';

#
# Structure for the `p_bsplug_element_replace` table :
#

DROP TABLE IF EXISTS `p_bsplug_element_replace`;

CREATE TABLE `p_bsplug_element_replace` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `PROXY_ID` int(11) NOT NULL COMMENT 'WEB����ID, ����mas_web_proxy_relation��ID',
  `PAGE` varchar(100) NOT NULL COMMENT 'ҳ��URL',
  `ELEMENT_CONTENT` text NOT NULL COMMENT 'Ԫ������',
  `ELEMENT_REPLACE_CONTENT` text NOT NULL COMMENT '���Ԫ������',
  `ELEMENT_TYPE` tinyint(4) NOT NULL default '0' COMMENT 'Ԫ������ 0:��� 1:ͼƬ 2:�ı�',
  `INDEX` int(11) default '1' COMMENT 'Ŀ����',
  `ISALLTARGET` bit(1) default '\0' COMMENT '�Ƿ�������ƥ��ĵط��滻',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S���ҳ�����Ԫ�ر�';

#
# Structure for the `p_bsplug_layout` table :
#

DROP TABLE IF EXISTS `p_bsplug_layout`;

CREATE TABLE `p_bsplug_layout` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `LAYOUT_NAME` varchar(50) NOT NULL COMMENT '��������',
  `CSS_CONTENT` text COMMENT '����CSS����',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S���ҳ�沼�ֶ����';

#
# Structure for the `p_bsplug_page_layout` table :
#

DROP TABLE IF EXISTS `p_bsplug_page_layout`;

CREATE TABLE `p_bsplug_page_layout` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�Զ����',
  `PROXY_ID` int(11) NOT NULL COMMENT 'WEB����ID, ����mas_web_proxy_relation��ID',
  `PAGE` varchar(100) NOT NULL COMMENT 'ҳ��URL',
  `LAYOUTCONTENT` text COMMENT '��Ҫ���²��ֵ�����',
  `CONTENTTYPE` int(11) default '0' COMMENT '����Ԫ������',
  `TARGET` text COMMENT 'Ŀ��λ��',
  `TARGETTYPE` int(11) default '0' COMMENT 'Ŀ��Ԫ������',
  `ISBEFORTARGET` bit(1) default '\0' COMMENT '�Ƿ񽫲������ݲ��ֵ�Ŀ��֮ǰ',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B/S������²���ҳ���';

#
# Structure for the `p_cmaurl` table :
#

DROP TABLE IF EXISTS `p_cmaurl`;

CREATE TABLE `p_cmaurl` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '������������ID',
  `APPLICATIONID` varchar(64) default NULL COMMENT '�����ʶ',
  `CMABILITY` varchar(32) default NULL COMMENT 'ͨ������',
  `URL` varchar(128) default NULL COMMENT 'ͨ��������Ӧ��URL',
  `AVAILABILITY` int(2) default NULL COMMENT '�ò��ͨ��������Ӧ��web�����Ƿ���Ч(0:��Ч��1:��Ч)',
  `RESERVE1` varchar(128) default NULL COMMENT '���ֶ�Ŀǰ������ʹ���뱸ע',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ͨ��������WebServiceƥ���';

#
# Structure for the `p_plugin` table :
#

DROP TABLE IF EXISTS `p_plugin`;

CREATE TABLE `p_plugin` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '������������',
  `APPLICATIONID` varchar(64) NOT NULL COMMENT 'Ӧ�û�����ʶ',
  `PROCESSID` bigint(20) default NULL COMMENT '����Ľ���ID',
  `ADDRESS` varchar(128) default NULL COMMENT '������ڵ�����IP��ַ',
  `REGSTATUS` int(3) default NULL COMMENT '���ע��״̬(0:����;1:ע��;2:��ͣ)',
  `REPSTATUS` int(3) default NULL COMMENT '����ϱ���״̬(0:״̬����;1:������Ч��;2:δע�ᣬ��Ҫ��ע��;3:�Ѿ�ע��;4:����ѱ�mas������ǿ�йر�;5:�����ע������ȴ�������)',
  `ACCESSTIME` date default NULL COMMENT '�������ʱ��',
  `PLUGINTYPE` int(1) default NULL COMMENT '�������',
  `URL` varchar(128) default NULL COMMENT '�����ַ',
  `DESCRIPTION` varchar(128) default NULL COMMENT '�������',
  PRIMARY KEY  (`ID`,`APPLICATIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������б�';

#
# Structure for the `p_plugin_valve` table :
#

DROP TABLE IF EXISTS `p_plugin_valve`;

CREATE TABLE `p_plugin_valve` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `APPLICATIONID` varchar(16) NOT NULL COMMENT '���Ӧ�ñ�ʶ',
  `VALVE_GUARD` double(20,3) NOT NULL COMMENT '��������',
  `VALVE_SEVERITY` double(20,3) NOT NULL COMMENT '��������',
  `VALVE_DANGER` double(20,3) NOT NULL COMMENT '��Σ����',
  `TYPE` int(1) NOT NULL COMMENT '1:CPU��2:MEM��3:DISK��4:���磬5:ͨ������ʹ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����ֵ��';

#
# Structure for the `p_pluginmng` table :
#

DROP TABLE IF EXISTS `p_pluginmng`;

CREATE TABLE `p_pluginmng` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `APPLICATIONID` varchar(16) default NULL COMMENT '�����ʶ',
  `DEVELOPER` varchar(32) default NULL COMMENT '������',
  `TYPE` int(2) default NULL COMMENT 'Ӧ�����',
  `PERMIT` int(2) default NULL COMMENT '�����ʶ',
  `STATUS` int(2) default NULL COMMENT '����״̬',
  `NEXTCOMMAND` varchar(16) default NULL COMMENT '��Ҫ���ִ�еĹ������pause������ͣ��recovery����ָ��������ʾ������',
  `NEXTINTERVAL` int(10) default NULL COMMENT '����ĺ����ϱ�ʱ��������λΪ�룩�������ʾͬ�ϴ�ʱ����',
  `LASTINTERVAL` int(10) default NULL COMMENT '����Ĳ���ϴ�״̬�ϱ�ʱ����',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

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
  `awokeType` int(11) default NULL COMMENT '1���� 2�� 3�� 4��',
  `intervalnum` int(11) default NULL,
  `sendflag` int(11) default NULL COMMENT '0δ�� 1�ѷ�',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for the `sys_address_book` table :
#

DROP TABLE IF EXISTS `sys_address_book`;

CREATE TABLE `sys_address_book` (
  `id` int(11) NOT NULL auto_increment COMMENT '����',
  `username` varchar(20) default NULL COMMENT '�ͻ�����',
  `mobilephone` varchar(20) default NULL COMMENT '�ֻ�����',
  `remarks` varchar(20) default NULL COMMENT '��ע',
  `groupID` varchar(20) default '0' COMMENT '����',
  `namelatter` varchar(20) default NULL COMMENT '���ּ�д',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `owner` int(11) default NULL COMMENT '�����û�ID��0:ϵͳ�����顡����:�û�ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Structure for the `sys_address_group` table :
#

DROP TABLE IF EXISTS `sys_address_group`;

CREATE TABLE `sys_address_group` (
  `GROUP_ID` int(11) NOT NULL auto_increment COMMENT '����',
  `parentID` int(11) default NULL COMMENT '��������',
  `GROUP_NAME` varchar(50) default NULL COMMENT '����',
  `OWNER` int(11) default '0' COMMENT '�����û�ID��0:ϵͳ�����顡����:�û�ID',
  PRIMARY KEY  (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ͨѶ¼����';

#
# Structure for the `sys_code` table :
#

DROP TABLE IF EXISTS `sys_code`;

CREATE TABLE `sys_code` (
  `CODE_NAME` varchar(32) NOT NULL COMMENT '��������',
  `CODE_VALUE` varchar(1024) default NULL COMMENT '����ֵ',
  `CODE_DESC` varchar(256) default NULL COMMENT '��������',
  `TYPE_NAME` varchar(16) NOT NULL COMMENT '������������ ����SYS_CODE��TYPE_NAME',
  `SHOW_ORDER` int(11) default NULL COMMENT '��ʾ˳��',
  PRIMARY KEY  (`CODE_NAME`,`TYPE_NAME`),
  KEY `sys_code_index` (`TYPE_NAME`,`SHOW_ORDER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ϵͳ�����';

#
# Structure for the `sys_code_type` table :
#

DROP TABLE IF EXISTS `sys_code_type`;

CREATE TABLE `sys_code_type` (
  `TYPE_NAME` varchar(16) NOT NULL COMMENT '��������',
  `TYPE_DESC` varchar(256) default NULL COMMENT '��������',
  `READ_ONLY` bit(1) NOT NULL default '\0' COMMENT '�����ʹ����Ƿ����'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ϵͳ��������';

#
# Structure for the `sys_group` table :
#

DROP TABLE IF EXISTS `sys_group`;

CREATE TABLE `sys_group` (
  `GROUP_ID` int(11) NOT NULL auto_increment COMMENT '����',
  `GROUP_NAME` varchar(50) default NULL COMMENT '����',
  `OWNER` int(11) default '0' COMMENT '�����û�ID��0:ϵͳ�����顡����:�û�ID',
  PRIMARY KEY  (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ַ��Ⱥ����Ϣ��';

#
# Structure for the `sys_group_user` table :
#

DROP TABLE IF EXISTS `sys_group_user`;

CREATE TABLE `sys_group_user` (
  `EMP_ID` varchar(32) NOT NULL COMMENT 'Ա����� ����SYS_USER_INFO��EMP_ID',
  `GROUP_ID` int(11) NOT NULL COMMENT 'Ⱥ���� ����SYS_GROUP��GROUP_ID',
  PRIMARY KEY  (`EMP_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ⱥ���Ա����Ϣ������';

#
# Structure for the `sys_org` table :
#

DROP TABLE IF EXISTS `sys_org`;

CREATE TABLE `sys_org` (
  `ORG_ID` int(11) NOT NULL auto_increment COMMENT '��֯���',
  `ORG_NAME` varchar(50) default NULL COMMENT '��֯����',
  `PARENT_ORG_ID` int(11) default '0' COMMENT '������֯ID��0:����֯������:����֯',
  PRIMARY KEY  (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��֯������Ϣ��';

#
# Structure for the `sys_org_user` table :
#

DROP TABLE IF EXISTS `sys_org_user`;

CREATE TABLE `sys_org_user` (
  `EMP_ID` varchar(32) NOT NULL COMMENT 'Ա����� ����SYS_USER_INFO��EMP_ID',
  `ORG_ID` int(11) NOT NULL COMMENT '��֯��� ����SYS_ORG��ORG_ID',
  PRIMARY KEY  (`EMP_ID`,`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��֯��Ա����Ϣ������';

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
  `resource_type` varchar(10) NOT NULL default 'URL' COMMENT 'URL�����ַ����Դ, FUNCTION����������Դ\r\nMENU����˵�����Դ',
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
  `updateTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '�û�����ʱ��',
  PRIMARY KEY  (`id`),
  KEY `sys_user_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `sys_user_info` table :
#

DROP TABLE IF EXISTS `sys_user_info`;

CREATE TABLE `sys_user_info` (
  `EMP_ID` varchar(32) NOT NULL COMMENT 'Ա�����',
  `EMP_NAME` varchar(20) default NULL COMMENT 'Ա������',
  `MOBILE_PHONE` varchar(21) default NULL COMMENT '�ֻ�����',
  `USER_ID` int(11) default NULL COMMENT '�û�ID������sys_user��ID',
  `BIRTHDAYDATE` varchar(20) default NULL COMMENT '��������',
  `SENDFLAG` int(1) default '0' COMMENT '���ͱ�ʾ',
  `EMP_NAMELetter` varchar(20) default NULL COMMENT '��ĸ��д',
  PRIMARY KEY  (`EMP_ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���Ա����Ϣ��';

#
# Structure for the `sys_user_logs` table :
#

DROP TABLE IF EXISTS `sys_user_logs`;

CREATE TABLE `sys_user_logs` (
  `id` int(11) NOT NULL auto_increment COMMENT '�ؼ���',
  `username` varchar(20) default NULL COMMENT 'ʹ�õ��û���',
  `userpwd` varchar(20) default NULL COMMENT 'ʹ�õ�����(����)',
  `ip` varchar(20) default NULL COMMENT '��¼IP',
  `logtime` datetime default NULL COMMENT '��¼ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ϵͳ�û���¼��¼';

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
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `ALERTID` varchar(128) default NULL COMMENT '�澯���к�',
  `NODE` varchar(128) default NULL COMMENT '��Ԫ��MASID��',
  `LEVEL` varchar(16) default NULL COMMENT '�澯����',
  `TYPE` varchar(16) default NULL COMMENT '�澯����',
  `CAUSE` int(10) default NULL COMMENT '�澯ԭ��',
  `TITLE` varchar(128) default NULL COMMENT '�澯����',
  `CONTENT` varchar(255) default NULL COMMENT '�澯����',
  `activeStatus` int(1) default NULL COMMENT '�״̬',
  `IS_SPECIAL` bit(1) default NULL COMMENT '�Ƿ��ض��澯',
  `EVENT_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '�澯ʱ��',
  `CONFIRM_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '�澯ȷ��ʱ��',
  `CLEAR_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '���ʱ��',
  PRIMARY KEY  (`ID`),
  KEY `t_alert_active_index` (`IS_SPECIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�澯ʵʱ��';

#
# Structure for the `t_alert_history` table :
#

DROP TABLE IF EXISTS `t_alert_history`;

CREATE TABLE `t_alert_history` (
  `ID` int(10) NOT NULL auto_increment COMMENT '��������',
  `ALERTID` varchar(128) default NULL COMMENT '�澯���к�',
  `NODE` varchar(128) default NULL COMMENT '��Ԫ��MASID��',
  `LEVEL` varchar(16) default NULL COMMENT '�澯����',
  `TYPE` varchar(16) default NULL COMMENT '�澯����',
  `CAUSE` int(10) default NULL COMMENT '�澯ԭ��',
  `TITLE` varchar(128) default NULL COMMENT '�澯����',
  `CONTENT` varchar(255) default NULL COMMENT '�澯����',
  `IS_SPECIAL` bit(1) default NULL COMMENT '�Ƿ��ض��澯',
  `SOLVE_USER` int(1) default NULL COMMENT '�����Ա',
  `SOLUTION` varchar(255) default NULL COMMENT '�澯�������',
  `EVENT_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '�澯ʱ��',
  `SOLVE_TIME` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '���ʱ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�澯��ʷ��';

#
# Structure for the `t_birthday_set` table :
#

DROP TABLE IF EXISTS `t_birthday_set`;

CREATE TABLE `t_birthday_set` (
  `ID` int(11) NOT NULL COMMENT '���',
  `SENDCONTENT` varchar(2000) default NULL COMMENT '���Ͷ�������',
  `SENDTIME` varchar(20) default NULL COMMENT '��������ʱ��',
  `BIRTHDAY_STATUS` bit(1) default '\0' COMMENT '����״̬ 0-���ã�1-����',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ף����Ϣ��';

#
# Structure for the `t_log` table :
#

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '������������',
  `LOGLEVEL` int(1) default NULL COMMENT '��־����',
  `TYPE` int(1) default NULL COMMENT '��־����(������־:1,������־:2,�û���־:3,��ȫ��־:4)',
  `STATUS` int(1) default NULL COMMENT '��־״̬',
  `MESSAGE` text COMMENT '��־����',
  `LOGDATE` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '��¼��־ʱ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��¼MAS�����������ɵ���־(������־��������־���û���־�Ͱ�ȫ';

#
# Structure for the `t_poll_def` table :
#

DROP TABLE IF EXISTS `t_poll_def`;

CREATE TABLE `t_poll_def` (
  `pollid` int(11) NOT NULL COMMENT '�ؼ���',
  `title` varchar(50) default NULL COMMENT '����',
  `tip` varchar(200) default NULL COMMENT '��ʾ',
  `validity` datetime default NULL COMMENT '��Ч��ֹ��',
  `status` int(11) default '0' COMMENT '0-��Ч�ģ�1-��Ч��',
  `attender` text COMMENT '��Ͷ��Ա�ֻ�����,�÷ֺŸ��������"*"��ʾ�������ʵ�ͶƱ����',
  `choosecount` int(11) default '1' COMMENT '����ͶƱ������ÿ�β���Ͷ��ͬ�Ķ���',
  `createtime` date default NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`pollid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `t_poll_object` table :
#

DROP TABLE IF EXISTS `t_poll_object`;

CREATE TABLE `t_poll_object` (
  `pollid` int(11) NOT NULL COMMENT 'ͶƱ��ţ���Ӧt_poll_def����id',
  `candidate` varchar(100) default NULL COMMENT '��ѡ��',
  `letter` varchar(1) default NULL COMMENT '����ͶƱ������ĸ'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ͶƱ�����';

#
# Structure for the `t_poll_record` table :
#

DROP TABLE IF EXISTS `t_poll_record`;

CREATE TABLE `t_poll_record` (
  `pollid` int(11) default NULL COMMENT 'ͶƱ��ţ���Ӧt_poll_def����id',
  `mobile` varchar(20) default NULL COMMENT '����ͶƱ���ֻ�����',
  `letter` varchar(1) default NULL COMMENT 'ͶƱ�������е���ĸ����t_poll_object����letterƥ��',
  `polltime` datetime default NULL COMMENT 'ͶƱʱ��',
  `message` varchar(100) default NULL COMMENT 'ͶƱ��ʵ�����е�����'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ͶƱ��¼��';

#
# Structure for the `t_workplan` table :
#

DROP TABLE IF EXISTS `t_workplan`;

CREATE TABLE `t_workplan` (
  `ID` int(11) NOT NULL auto_increment COMMENT '�������ű��',
  `WORKPLAN_TITLE` varchar(50) default NULL COMMENT '�������ű����',
  `WORKPLAN_CONTENT` varchar(2000) default NULL COMMENT '������������',
  `WORKPLAN_MOBILE` text COMMENT '���������ֻ�����',
  `WORKPLAN_RULE` varchar(20) default NULL COMMENT '�����������ѹ���',
  `WORKPLAN_STATUS` int(11) default '0' COMMENT '����״̬ 0:������ 1:����',
  `WORKPLAN_FLAG` int(11) default '0' COMMENT '���ͱ�ʾ',
  `WORKPLAN_CREATETIME` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `WORKPLAN_STATUS_FLAG` int(11) default '0' COMMENT '���ѱ�ʾ',
  `WORKPLAN_SENDTIME` timestamp NOT NULL default '2000-01-01 00:00:00' COMMENT '���ѷ���ʱ��',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������Ϣ��';



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
  (1,'218.206.178.32','ͳһ����ƽ̨',1,0,1,1,3,0,'2009-07-22 08:47:21','admin'),
  (2,'192.168.18.138','QOS����ϵͳ',2,0,1,1,3,0,'2009-07-22 10:26:16','admin'),
  (3,'192.168.18.86','��������ϵͳ',3,0,1,1,3,0,'2009-07-21 17:42:23','1'),
  (4,'192.168.18.66','����ϵͳ',0,0,1,1,3,0,'2009-07-21 17:42:23','1'),
  (5,'MAINTAINSWITCH','����ά������',0,1,0,0,0,1,'2009-07-21 17:42:23','1');

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
  (1000,'','MENU_SMS','WEB����',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1001,'MENU_SMS','SUBMENU_SMS_SEND','���ŷ���',NULL,'/sms/sendSms.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1002,'MENU_SMS','SUBMENU_SMS_INBOX','�ռ���',NULL,'/sms/listSmsMo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1003,'MENU_SMS','SUBMENU_SMS_OUTBOX','�ѷ�����',NULL,'/sms/listSmsMt.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1004,'MENU_SMS','SUBMENU_SMS_WAITOUTBOX','��������',NULL,'/sms/listWaitSmsMt.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1005,'MENU_SMS','SUBMENU_SMS_DRAFTS','�ݸ���',NULL,'/sms/listDrafts.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1006,'MENU_SMS','SUBMENU_SMS_BATCH','��������',NULL,'/sms/batchSendSms.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2000,'','MENU_MMS','WEB����',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2001,'MENU_MMS','SUBMENU_MMS_SEND','���ŷ���',NULL,'/mms/sendMms.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2002,'MENU_MMS','SUBMENU_MMS_INBOX','�ռ���',NULL,'/mms/listMmsMo.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2003,'MENU_MMS','SUBMENU_MMS_OUTBOX','������',NULL,'/mms/listMmsMt.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2004,'MENU_MMS','SUBMENU_MMS_MODE','����ģ��','','/mms/modelMms.do',NULL,'','','','','',''),
  (2005,'MENU_MMS','SUBMENU_MMS_LIST_DRAFTS','�ݸ���',NULL,'/mms/listDrafts.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3000,'','MENU_WAPPUSH','WAP����',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3001,'MENU_WAPPUSH','SUBMENU_WAPPUSH_SEND','WAP����',NULL,'/wappush/sendWappush.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3002,'MENU_WAPPUSH','SUBMENU_WAPPUSH_STATUS','״̬��ѯ',NULL,'/wappush/wappushlist.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4000,'','MENU_LBS','�ƶ���λ',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4001,'MENU_LBS','SUBMENU_LBS_REQUEST','�ƶ���λ',NULL,'/lbs/lbsRequest.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4002,'MENU_LBS','SUBMENU_LBS_TLRREQUEST','�����ѯ',NULL,'/lbs/lbsTlrsRstList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5000,'','MENU_USSD','USSD����',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5001,'MENU_USSD','SUBMENU_USSD_REQUEST','USSD����',NULL,'/ussd/ussdInfo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5002,'MENU_USSD','SUBMENU_USSD_SESSION','USSD��ѯ',NULL,'/ussd/ussdList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5501,'','MENU_BUSI','ҵ��Ӧ��','','',NULL,'','','','','',''),
  (5502,'MENU_BUSI','SUBMENU_SMS_SECURITY','���ŷ�α','','/smsAntifake/smsAntifake.do',NULL,'','','','','',''),
  (5503,'MENU_BUSI','SUBMENU_METING','����֪ͨ','','/corpsms/meeting.do',NULL,'','','','','',''),
  (5504,'MENU_BUSI','SUBMENU_WORKPLAN','��������','','/workplan/createWorkPlan.do',NULL,'','','','','',''),
  (5505,'MENU_BUSI','SUBMENU_WORKPLAN_MANAGE','��������','','/workplan/workPlanList.do',NULL,'','','','','',''),
  (5506,'MENU_BUSI','SUBMENU_COMPLAINT','�ٱ�Ͷ��','','/complaint.do',NULL,'','','','','',''),
  (5507,'MENU_BUSI','SUBMENU_POLL','ͶƱ����','','/poll/poll.do',NULL,'','','','','',''),
  (5508,'MENU_BUSI','SUBMENU_SCHEDULE_REMINDER','�ճ�����','','/schedule/schedule.do',NULL,'','','','','',''),
  (5509,'MENU_BUSI','SUBMENU_BIRTHDAY_REMINDER','��������','','/birthday/birthdaySet.do',NULL,'','','','','',''),
  (5510,'MENU_BUSI','SUBMENU_BROARDCAST','�㲥���ѯ','','/ServiceDefine/broadcast.do',NULL,'','','','','',''),
  (6000,'','MENU_BUSINESS','��ѯ����',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6001,'MENU_BUSINESS','SUBMENU_LOG','ƽ̨��־��ѯ',NULL,'/log/logList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6002,'MENU_BUSINESS','SUBMENU_BUSINESS_LOG','ҵ����־��ѯ',NULL,'/business/businesslog.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6003,'MENU_BUSINESS','SUBMENU_SMS_QUERY_MO','���ж��Ų�ѯ',NULL,'/sms/querySM.do?act=querymo\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6004,'MENU_BUSINESS','SUBMENU_SMS_QUERY_MT','���ж��Ų�ѯ',NULL,'/sms/querySM.do?act=querymt\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6005,'MENU_BUSINESS','SUBMENU_MMS_QUERY_MO','���в��Ų�ѯ',NULL,'/mms/queryMM.do?act=querymo',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6006,'MENU_BUSINESS','SUBMENU_MMS_QUERY_MT','���в��Ų�ѯ',NULL,'/mms/queryMM.do?act=querymt',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6007,'MENU_BUSINESS','SUBMENU_QUERY','����ҵ��ͳ��',NULL,'/query/queryList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6008,'MENU_BUSINESS','SUBMENU_BUSINESS_FLUX','ҵ������ͳ��',NULL,'/business/businessflux.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (7000,'','MENU_ELEMENT','B/S���',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (7001,'MENU_ELEMENT','SUBMENU_ELEMENT_ADD','�û�����','','/bsplug/elementAdd.do',NULL,'','','','','',''),
  (7002,'MENU_ELEMENT','SUBMENU_ELEMENT_FILTER','��־�鿴','','/bsplug/elementFilter.do',NULL,'','','','','',''),
  (7003,'MENU_ELEMENT','SUBMENU_ELEMENT_REPLACE','�澯�鿴','','/bsplug/elementReplace.do',NULL,'','','','','',''),
  (7005,'MENU_ELEMENT','SUBMENU_ELEMENT_LAYOUTINFO','���ù���','','/bsplug/layoutInfo.do',NULL,'','','','','',''),
  (8000,'','MENU_PLUGIN','�������',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8001,'MENU_PLUGIN','SUBMENU_PLUGIN_PLUGINMNG','�������',NULL,'/plugin/PluginMng.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8002,'MENU_PLUGIN','SUBMENU_PLUGIN_PLUGINLIST','���ע��',NULL,'/plugin/pluginList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8003,'MENU_PLUGIN','SUBMENU_PLUGIN_PLUGINVALVELIST','��ֵ����',NULL,'/plugin/pluginValveList.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8004,'MENU_PLUGIN','SUBMENU_PLUGIN_DBPLUGMNG','DB�������',NULL,'/dbplug/dbplug.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8005,'MENU_PLUGIN','SUBMENU_PLUGIN_PLUGINFLUX','�������',NULL,'/plugin/pluginFlux.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9000,'','MENU_APPCONNCET','Ӧ�ý���',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9001,'MENU_APPCONNCET','SUBMENU_APP_CONNECT','�ͻ���Ϣ',NULL,'/appinfo/appECInfo.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9002,'MENU_APPCONNCET','SUBMENU_APP_RELATION','������Ϣ',NULL,'/appinfo/appConnectInfo.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9003,'MENU_APPCONNCET','SUBMENU_APP_ORDER','������ϵ',NULL,'/appinfo/appOrderRelation.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9004,'MENU_APPCONNCET','SUBMENU_APP_FORBIDDEN','�ڰ�����',NULL,'/appinfo/forbidden.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9006,'MENU_APPCONNCET','SUBMENU_WEBTRANSMIT','HTTP����','','/proxyRelation/ProxyRelation.do',NULL,'','','','','',''),
  (10000,'','MENU_MANAGEMENT','����ƽ̨',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10001,'MENU_MANAGEMENT','SUBMENU_SOAP','ͨѶ����',NULL,'/soap/soap.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10002,'MENU_MANAGEMENT','SUBMENU_SNMP','��Ϣ����',NULL,'/soap/masid.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10003,'MENU_MANAGEMENT','SUBMENU_HOST','�豸����',NULL,'/snmp/host.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10004,'MENU_MANAGEMENT','SUBMENU_TS','ʱ��ͬ��',NULL,'/snmp/ts.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10005,'MENU_MANAGEMENT','SUBMENU_MIB_UPGRADE','����֪ͨ',NULL,'/snmp/mibUpgrade.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10006,'MENU_MANAGEMENT','SUBMENU_MIB_SWITCH','���ƿ���',NULL,'/snmp/mibSwitch.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10007,'MENU_MANAGEMENT','SUBMENU_BIZCONFIG','ҵ������',NULL,'/soap/businessConfigure.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11000,'','MENU_ADDRESS','��ַ��',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11001,'MENU_ADDRESS','SUBMENU_ADDR_ORG','������Ϣ',NULL,'/address/organizeInfo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11002,'MENU_ADDRESS','SUBMENU_ADDR_EMPLOYEE','Ա����Ϣ',NULL,'/address/userInfo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11003,'MENU_ADDRESS','SUBMENU_ADDR_GROUP','Ⱥ����Ϣ',NULL,'/address/groupInfo.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11004,'MENU_ADDRESS','SUBMENU_ADDR_ADDBOOK','ͨѶ¼',NULL,'/address/addbook.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11005,'MENU_ADDRESS','SUBMENU_ADDR_ADDGROUP','ͨѶ¼����',NULL,'/address/addbookGroup.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12000,'','MENU_QOS','QOSͳ��',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12001,'MENU_QOS','SUBMENU_BUSINESS_CONNECTSTATUS','����״̬',NULL,'/qos/connectStatus.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12002,'MENU_QOS','SUBMENU_BUSINESS_MTDELAY','����ʱ��',NULL,'/qos/mtDelay.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12003,'MENU_QOS','SUBMENU_BUSINESS_MTNUM','���гɹ���',NULL,'/qos/mtNum.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (13000,'','MENU_ALERT','�澯����',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (13001,'MENU_ALERT','SUBMENU_ACTIVE_ALERT','ʵʱ�澯',NULL,'/alert/activeAlert.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (13002,'MENU_ALERT','SUBMENU_HISTORY_ALERT','��ʷ�澯',NULL,'/alert/historyAlert.do\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14000,'','MENU_SYSTEM','ϵͳ����',NULL,'\r',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14001,'MENU_SYSTEM','SUBMENU_USER','�û�����',NULL,'/security/sysUser.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14002,'MENU_SYSTEM','SUBMENU_ROLE','��ɫ����',NULL,'/security/sysRole.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14003,'MENU_SYSTEM','SUBMENU_RESOURCE','��Դ����',NULL,'/security/sysResource.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14004,'MENU_SYSTEM','SUBMENU_MENU','�˵�����',NULL,'/menu.do?act=list',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14005,'MENU_SYSTEM','SUBMENU_CODE','��������',NULL,'/code/codeType.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14006,'MENU_PLUGIN','SUBMENU_PLUGIN_PE','PE���','','/plugin/PluginMng.do?act=pushmailMng',NULL,'','','','','',''),
  (14007,'MENU_SYSTEM','SUBMENU_SMS_ROUTE','·������',NULL,'/route.do',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (24001,'MENU_SYSTEM','SMS_LIMIT','�����޶�','','/smslimt/smsLimit.do',NULL,'','','','','',''),
  (24002,'MENU_MMS','SUBMENU_MMS_MATERIAL','�����ز�','','/mms/material.do',NULL,'','','','','',''),
  (24005,'MENU_SYSTEM','BACK_UP_CONFIG','��������','','/db/backUpConfig.do',NULL,'','','','','',''),
  (24006,'MENU_SYSTEM','BACK_UP','���ݱ���','','/db/backUp.do',NULL,'','','','','',''),
  (24007,'MENU_SYSTEM','COME_BACK','���ݻָ�','','/db/comeBack.do',NULL,'','','','','','');

COMMIT;

#
# Data for the `sys_code` table  (LIMIT 0,500)
#

INSERT INTO `sys_code` (`CODE_NAME`, `CODE_VALUE`, `CODE_DESC`, `TYPE_NAME`, `SHOW_ORDER`) VALUES
  ('ALARMSWITCH','true','MAS�澯����','MAS',10),
  ('ALERTSTORMINTERVAL','60','�澯�籩���˵�ʱ��������λ���룩','ALERT',1),
  ('ALLOWMAXCOUNTER','3','��ָ���ĸ澯�籩ʱ�����ڿɸ澯��������(����)','ALERT',2),
  ('APID_BROADCAST','P000000000008001','�㲥��ѯ������','BUSI_APP',10),
  ('APPEMAILUSERLIMIT','100','MAS�ĵ�ǰEMAIL�����û���','MIB-READWRITE',17),
  ('APPINFOSYNCSERVICE','com.royasoft.mas.core.appinfo.AppInfoSyncService','ͬ�����ſͻ�Ӧ����Ϣ','SYSTEM_SERVICE',1),
  ('APPLICATIONMMGWIP','218.206.176.175','��ҵ���ز���ģ��IP','MIB-READWRITE',8),
  ('APPLICATIONSMGWIP','218.206.176.169','��ҵ���ض���ģ��IP','MIB-READWRITE',5),
  ('APPLICATIONUSSDGWIP','218.206.178.41','��ҵ����USSDģ��IP','MIB-READWRITE',9),
  ('APPLICATIONWAPGWIP','192.168.230.8','��ҵ����WAPģ��IP','MIB-READWRITE',10),
  ('APPLICATION_ID','P000000000008001','Ӧ��ID','WEB_LBS',1),
  ('APPLICATION_ID','P000000000008002','Ӧ��ID','WEB_MMS',1),
  ('APPLICATION_ID','P000000000008001','WEB����Ӧ��ID','WEB_SMS',2),
  ('APPLICATION_ID','P000000000008001','Ӧ��ID','WEB_WEBPUSH',1),
  ('APPMMSPCODE','9105','MAS���Ž����SPCODE','MIB-READ',36),
  ('APPMMSSENDSPEEDLIMIT','50','MAS�ĵ�ǰ�����·��ٶ�����','MIB-READWRITE',14),
  ('APPMMSSPID','9105','MAS���Ž���SPID','MIB-READWRITE',7),
  ('APPSMGWLOGINUSER','910055','MAS��¼�����û���','MIB-READWRITE',11),
  ('APPSMGWPASSWD','910055','MAS��¼��������','MIB-READWRITE',12),
  ('APPSMGWPORT','7890','��ҵ���ض���ģ��˿�','MIB-READWRITE',6),
  ('APPSMSSENDSPEEDLIMIT','300','MAS�ĵ�ǰ�����·��ٶ�����','MIB-READWRITE',13),
  ('APPSMSSPCODE','910055','MAS���Ž����SPCODE','MIB-READ',35),
  ('APPSMSSPID','910055','MAS���Ž���SPID','MIB-READWRITE',4),
  ('APPSWNAME','Mobile Agent Server','Ӧ���������','MIB-READ',16),
  ('APPSWVENDOR','RoyaSoft','Ӧ�����������','MIB-READ',18),
  ('APPSWVERSION','2.0','Ӧ������汾','MIB-READ',17),
  ('APPSYSTEMPROCESSSTATE','0','MAS����ģ������״̬','MIB-READ',37),
  ('APPUSSDUSERLIMIT','100','MAS�ĵ�ǰUSSD�����û���','MIB-READWRITE',16),
  ('APPWAPUSERLIMIT','100','MAS�ĵ�ǰWAP�����û���','MIB-READWRITE',15),
  ('AUTHENTICATIONMODE','0','��Ȩ��ʽ','MMS',1),
  ('AUTHFAILDCOUNT','3','MAS��Ȩʧ�ܴ���','MAS',63),
  ('AUTHFAILDINTERVAL','60','��Ȩ����Ӧ�ش�����(��λ��)','MAS',62),
  ('AUTHINTERVAL','3600','MAS��Ȩʱ����(��λ:��)','MAS',7),
  ('AUTHPASSWORD','123456','MASע���Ȩ����','MAS',3),
  ('AUTHSWITCH','true','MASע���Ȩ����','MAS',4),
  ('AUTHURL','http://192.168.18.29:8080/services/MASManagementServiceSoap','MAS��֤url','MAS',2),
  ('AUTH_ID_URL_UPDATE','TRUE','����MASID����URL�Ƿ�����ע��ȥ��Ȩ','MAS',59),
  ('AUTH_PRERIOD_UPDATE','FALSE','����ʱ��������Ƿ�������Ȩ','MAS',58),
  ('B/S���','-','-','RESOURCEGROUP',8),
  ('BACKLOG','50','BackLog','MMS',14),
  ('BACKUP_DIR','/mysql/backup','���ݿⱸ���ļ����Ŀ¼','DB',2),
  ('BACKUP_FLAG','false','���ݿⱸ�ݱ�ʶ','DB',1),
  ('BIRTHDAYREMINSERVICE','com.royasoft.mas.web.birthday.BirthdayReminService','��������','SYSTEM_SERVICE',1),
  ('BIZ_CODE','001','ҵ�����','WEB_MMS',3),
  ('BIZ_CODE','910119','WEB����ҵ�����','WEB_SMS',1),
  ('BIZ_CODE','910119','ҵ�����','WEB_WEBPUSH',3),
  ('BOSS_FTP_CONNECT_MODE','PASV','BOSS�ļ�����������ģʽ','APP_CONNECT',6),
  ('BOSS_FTP_PASSWORD','royasoft','BOSS�ļ�����������','APP_CONNECT',3),
  ('BOSS_FTP_SERVER_IP','192.168.18.158','BOSS�ļ�������IP','APP_CONNECT',4),
  ('BOSS_FTP_SERVER_ROOT_DIR','/appinfo','BOSS�ļ���������Ŀ¼','APP_CONNECT',5),
  ('BOSS_FTP_USERNAME','royasoft','BOSS�ļ��������û���','APP_CONNECT',2),
  ('BROADCASTSERVICE','com.royasoft.mas.core.masoperation.BroadcastService','�㲥','SYSTEM_SERVICE',1),
  ('BROADCAST_SMS_STATUS_HANDLER','com.royasoft.mas.core.sms.handler.BroadcastSMSStatusHandler','�㲥����״̬������','HANDLER',4),
  ('BUSINESSSERVICE','com.royasoft.mas.core.business.BusinessService','ҵ����־','SYSTEM_SERVICE',1),
  ('CAPACITYBREAKOUTINTERVAL','3','�����жϸ澯ʱ����(����)','ALERT',7),
  ('CHARSET','GB2312','����Ϣ������ַ���','MMS',8),
  ('CHECKSCHEDULESERVICE','com.royasoft.mas.web.schedule.CheckScheduleService','�㲥','SYSTEM_SERVICE',0),
  ('COMMIT_INTERVAL','1000','','DBPLUG_SMS',2),
  ('COMMUNICATION','99999999','MASͨѶ����','MAS',8),
  ('CONNECTSTATUS','com.royasoft.mas.service.soap.ConnectStatus','����ƽ̨����״̬����','SYSTEM_SERVICE',1),
  ('CONNECTTIMES','10','����ƽ̨���ӵ�״̬�ж�����','MAS',64),
  ('CONNSTATUSCRM','2','��CRMϵͳ����״̬','MIB-READ',133),
  ('CONNSTATUSDETECT','com.royasoft.mas.core.qos.service.ConnStatusDetect','MAS����������ͨ��״̬�ж�','SYSTEM_SERVICE',1),
  ('CONNSTATUSEMAIL','0','��EMAILϵͳ����״̬','MIB-READ',134),
  ('CONNSTATUSERP','2','��ERPϵͳ����״̬','MIB-READ',130),
  ('CONNSTATUSIA','2','����ҵӦ��ϵͳ����״̬','MIB-READ',135),
  ('CONNSTATUSIAGW','1','����ҵ���ص�����״̬','MIB-READ',125),
  ('CONNSTATUSLSP','0','��LSP����״̬','MIB-READ',128),
  ('CONNSTATUSMAILPUSH','1','���ʼ�������������״̬','MIB-READ',127),
  ('CONNSTATUSMSP','0','��MASͳһ����ƽ̨����״̬','MIB-READ',137),
  ('CONNSTATUSOA','2','��OAϵͳ����״̬','MIB-READ',131),
  ('CONNSTATUSOTHER','2','������Ӧ��ϵͳ����״̬','MIB-READ',136),
  ('CONNSTATUSQOS','0','��QOS���������״̬','MIB-READ',129),
  ('CONNSTATUSSCM','2','��SCMϵͳ����״̬','MIB-READ',132),
  ('CONNSTATUSWAP','0','��WAP���ص�����״̬','MIB-READ',126),
  ('CORPSMSSERVICE','com.royasoft.mas.core.corpsms.CorpSMSService','��ҵ���� ','SYSTEM_SERVICE',1),
  ('CPULIMIT','100','MAS CPU���ʹ��������','MAS',15),
  ('CPULOAD','26','CPUռ����','MIB-READ',38),
  ('CPUNUMBER','2','CPU����','MIB-READ',10),
  ('CPUWORKFREQ','3456','CPU��Ƶ','MIB-READ',9),
  ('CRMEMAIL','1','','MAS',23),
  ('CRMFLAG','1','CRMҵ��ͨ��־','MIB-READ',25),
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
  ('CURR_SMS_LIMT','70','ϵͳ��ǰ���Ͷ�������','SMS',2),
  ('DBPLUGADAPTERSERVICE','com.royasoft.mas.core.dbplug.DBPlugAdapterService','���ݿ���','SYSTEM_SERVICE',1),
  ('DBPLUG_MMS_RECEIVE_HANDLER','com.royasoft.mas.core.mms.handler.DBPlugMMReceiveHandler','DB����������д�����','HANDLER',2),
  ('DBPLUG_MMS_STATUS_HANDLER','com.royasoft.mas.core.mms.handler.DBPlugMMStatusHandler','DB�������״̬������','HANDLER',5),
  ('DBPLUG_SMS_RECEIVE_HANDLER','com.royasoft.mas.core.sms.handler.DBPlugSMSReceiveHandler','DB����������д�����','HANDLER',1),
  ('DBPLUG_SMS_STATUS_HANDLER','com.royasoft.mas.core.sms.handler.DBPlugSMSStatusHandler','DB����״̬������','HANDLER',4),
  ('DBPLUG_WAPPUSH_STATUS_HANDLER','com.royasoft.mas.core.wappush.handler.DbPlugWapPushStatusHandler','DB WapPush״̬������','HANDLER',6),
  ('DBSWNAME','MySQL 5.0.27-community-log','���ݿ����������','MIB-READ',19),
  ('DBSWVENDOR','MySQL','���ݿ�����Ŀ�����','MIB-READ',21),
  ('DBSWVERSION','5.0.27-community-log','���ݿ�����İ汾','MIB-READ',20),
  ('DEVICEIPADDRESS','192.168.0.64','IP��ַ','MIB-READ',8),
  ('DEVICEMACCODE','00-1A-73-EC-27-00','MAC��ַ','MIB-READ',7),
  ('DEVICENAME','user-4b424730f1','�豸����','MIB-READ',5),
  ('DEVICEVENDORNAME','ROYA','�豸����','MIB-READ',6),
  ('DIGEST','','ժҪ','MMS',4),
  ('DISKLIMIT','100','MAS DISK���ʹ��������','MAS',16),
  ('DISKMAXCONTENT','114462','Ӳ������','MIB-READ',12),
  ('DISKUSED','48','����ռ����','MIB-READ',40),
  ('EMAILEMAIL','1','','MAS',28),
  ('EMAILFLAG','1','MAILҵ��ͨ��־','MIB-READ',26),
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
  ('ENABLE_BLACK_LIST','true','�Ƿ����úڰ�����','APP_CONNECT',11),
  ('ERPEMAIL','1','','MAS',33),
  ('ERPFLAG','1','ERPҵ��ͨ��־','MIB-READ',22),
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
  ('EXCEPTION_USER','admin','��̬���������û�','SYS-ADMIN',1),
  ('EXIT_BLACKLIST_RULE','11111','���������/�˳����������Ź����','APP_CONNECT',11),
  ('FAILCOUNT','1440','����ʧ����Ŀ�ɼ�����(����)','MIB-SCANPERIOD',8),
  ('FTPINFO','','MAS����ƽ̨FTP��Ϣ','MIB-READWRITE',21),
  ('FTPSWITCH','true','MAS FTP�ϴ�����','MAS',13),
  ('GET_SMS_AMOUNT','2000','��������ȡ��������','SMS',160),
  ('GPRSONLINEUSER','60','��ǰGPRS�û����ɼ�����(����)','MIB-SCANPERIOD',5),
  ('INDUSTRYEMAIL','1','','MAS',38),
  ('INDUSTRYFLAG','1','��ҵҵ��ͨ��־','MIB-READ',27),
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
  ('INTEGRALREMINDSERVICE','com.royasoft.mas.core.smsAntifake.IntegralRemindService','��������','SYSTEM_SERVICE',1),
  ('ISMG_ACCOUNT','910119','<font color=red>��¼�û���</font>','SMS',70),
  ('ISMG_PASSWORD','910119','<font color=red>��¼����</font>','SMS',80),
  ('ISMG_PORT','7890','<font color=red>�������ط���������˿�</font>','SMS',60),
  ('ISMG_SERVER','127.0.0.1','<font color=red>�������ط�������ַ</font>','SMS',50),
  ('ISTEST','false','����ģʽ','MAS',1),
  ('ISTESTPACKET','FALSE','�Ƿ������ж�ͨѶ�Ƿ�������ֱ�ӽ��м�Ȩ','MAS',60),
  ('IS_AUTO_ADD_BIZCODE','false','���Զ����ҵ����� true��ʾ��ӣ�false��ʾ�����','MAS',61),
  ('IS_AUTO_ADD_BIZCODE','false','IS_AUTO_ADD_BIZCODE ','SMS',200),
  ('IS_NEED_SYNC_TO_BOSS','true','�Ƿ���Ҫ��ǩԼ��Ϣ�ļ�ͬ��BOSS','APP_CONNECT',10),
  ('IS_SERVICECODE_CONVERT','false','�����¾ɺ���ת�����ܿ���','APP_CONNECT',16),
  ('LBSCLIENTID','1000015','��λ�ʺ�','LBS',2),
  ('LBSCLIENTPWD','1000015','��λ����','LBS',3),
  ('LBSCOUNT','60','��λ������Ŀ�ɼ�����(����)','MIB-SCANPERIOD',7),
  ('LBSFLAG','1','LBS������ͨ��־','MIB-READ',33),
  ('LBSPUSHADDR','http://218.206.179.221:8080/LbsRecv','���ڶ�λ�ص���Servlet','LBS',5),
  ('LBSSERVER','http://218.206.176.30:2234','��λ����ƽ̨','LBS',1),
  ('LBSSERVICEID','yewu15','��λ����ID','LBS',4),
  ('LISTENIP','218.206.179.221','���Ž��ܼ���IP��ַ','MMS',12),
  ('LISTENPORT','55604','���Ž��ܼ����˿�','MMS',13),
  ('LOGINTERVAL','120','LogInterval','MMS',18),
  ('LOGLEVEL','6','��־����','MMS',7),
  ('LOGNUM','100','LogNum','MMS',17),
  ('LOGPATH','/home/mas/vas_log','��־�ļ���·��','MMS',6),
  ('LOGSAVESERVICE','com.royasoft.mas.core.log.LogSaveService','ƽ̨��־','SYSTEM_SERVICE',0),
  ('LOGSIZE','1000','LogSize','MMS',19),
  ('LOG_FILTER_WORD','SnmpAgent:*,*��־�ϴ��ɹ�*','��־��Ϣ���˴ʣ��Զ��ŷָ�','MAS',18),
  ('LOG_SAME_INTERVAL','60','ͬ����־��Ϣ��д�������С��(��)','MAS',18),
  ('MASAUTH','com.royasoft.mas.service.soap.MasAuth','MAS��������֤��Ȩ','SYSTEM_SERVICE',1),
  ('MASFTPHOST','218.206.178.32','MAS����ƽ̨FTP��ַ','MAS',18),
  ('MASFTPINTERVAL','3600','MAS FTP����(��λ����)','MAS',18),
  ('MASFTPLEVEL','INFO','MAS FTP�ϴ�����','MAS',18),
  ('MASFTPPASSWORD','ftplog','MAS����ƽ̨FTP����','MAS',20),
  ('MASFTPROOTDIR','/','MAS����ƽ̨FTPĿ¼','MAS',21),
  ('MASFTPTIME','120000','MAS FTPʱ���(��ʽ:HHmmss)','MAS',18),
  ('MASFTPUSERNAME','ftplog','MAS����ƽ̨FTP�û���','MAS',19),
  ('MASID','M01AH154700012','MAS����������','MIB-READ',4),
  ('MASIP','','�����ֶ�����mas������������ip��ַ�����������ж��ip��ʱ�����ȱ������Զ�̽���mas������������ip','MAS',1),
  ('MASREGISTER','com.royasoft.mas.service.soap.MasRegister','MAS������ע��','SYSTEM_SERVICE',1),
  ('MASSYNCTIME','120000','MAS������ʱ��ͬ��','MAS',65),
  ('MAXMSGSIZE','100000','����������Ϣ�Ĵ�С(�ֽ�)','MMS',5),
  ('MAX_COMMIT_COUNT','500','','DBPLUG_SMS',1),
  ('MAX_COMMIT_COUNT','2000','����һ����������ύ��','SMS',165),
  ('MAX_LOGON_FAIL_COUNT','5','�����¼ʧ�ܵĴ���','SYS-ADMIN',4),
  ('MAX_MO_MMCACHE_OVERFLOW','2000','���в��Ż����С','MMS',51),
  ('MAX_MO_SMCACHE_OVERFLOW','2000','����������󻺴�','SMS',145),
  ('MAX_MT_MMCACHE_OVERFLOW','2000','���в��Ż����С','MMS',50),
  ('MAX_MT_SMCACHE_OVERFLOW','2000','����������󻺴�','SMS',140),
  ('MAX_REPORT_UPDATE_COUNT','100','���¶���״̬�������-ʧ��ʱ','SMS',185),
  ('MAX_RESEND_COUNT','3','����ʧ���ط�����','SMS',170),
  ('MEMMAXCONTENT','1014','�ڴ�����','MIB-READ',11),
  ('MEMORYLIMIT','100','MAS MEMORY���ʹ��������','MAS',17),
  ('MMCOMMIT_THREADPOOL_SIZE','5','�ύ�����߳���','MMS',55),
  ('MMDISPATCH_THREADPOOL_SIZE','50','���зַ������߳���','MMS',54),
  ('MMSCIP','192.168.18.138:55603','��������IP','MMS',10),
  ('MMSCOUNT','60','������Ŀ�ɼ�����(����)','MIB-SCANPERIOD',3),
  ('MMSCURL','/vas','�������ĵ�URL','MMS',9),
  ('MMSFLAG','1','����������ͨ��־','MIB-READ',30),
  ('MMSOVERFLOWINTERVAL','3','��������������澯ʱ����(����)','ALERT',5),
  ('MMSTATUS_THREADPOOL_SIZE','10','����״̬�ַ��߳���','MMS',52),
  ('MOBILE_PWD_CHECK','false','MAS��̬���뿪��','SYS-ADMIN',3),
  ('MPWD_MAX_TIME','300','��̬������Чʱ�䣨��λ���룩','SYS-ADMIN',2),
  ('MTDEALYDETECT','com.royasoft.mas.core.qos.service.MtDealyDetect','MAS��ʱͳ��','SYSTEM_SERVICE',1),
  ('MTDELAYMMS','0','MT����ʱ��','MIB-READ',139),
  ('MTDELAYPUSHMAIL','0','MT PUSHMAILʱ��','MIB-READ',142),
  ('MTDELAYSMS','354','MT����ʱ��','MIB-READ',138),
  ('MTDELAYUSSD','0','MT USSDʱ��','MIB-READ',140),
  ('MTDELAYWAPPUSH','0','MT WAP PUSHʱ��','MIB-READ',141),
  ('MTNUMMMS','0','MT��������','MIB-READ',144),
  ('MTNUMPUSHMAIL','0','PUSHMAIL','MIB-READ',146),
  ('MTNUMRSPMMS','0','MT���ųɹ�����','MIB-READ',148),
  ('MTNUMRSPPUSHMAIL','0','MT PUSHMAIL�ɹ�����','MIB-READ',150),
  ('MTNUMRSPSMS','15','MT���ųɹ�����','MIB-READ',147),
  ('MTNUMRSPWAPPUSH','0','MT WAP PUSH�ɹ�����','MIB-READ',149),
  ('MTNUMSMS','42','MT��������','MIB-READ',143),
  ('MTNUMWAPPUSH','0','MT WAP PUSH����','MIB-READ',145),
  ('MYSQL_BIN_DIR','/MAS/mysql/bin','mysql binĿ¼','DB',3),
  ('MYSQL_DB_NAME','mas','��Ҫ���ݵ����ݿ�','DB',6),
  ('MYSQL_PASSWORD','royasoft','mysql����','DB',5),
  ('MYSQL_USER','root','mysql �û�','DB',4),
  ('OAEMAIL','1','','MAS',43),
  ('OAFLAG','1','OAҵ��ͨ��־','MIB-READ',23),
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
  ('OSNAME','Windows XP','����ϵͳ����','MIB-READ',13),
  ('OSVENDOR','Microsoft','����ϵͳ��������','MIB-READ',15),
  ('OSVERSION','5.1','����ϵͳ�汾','MIB-READ',14),
  ('OTHEREMAIL','1','','MAS',48),
  ('OTHERFLAG','1','����ҵ��ͨ��־','MIB-READ',28),
  ('OTHERGPRSONLINEUSERCOUNT','0','','MIB-COUNT',76),
  ('OTHERINTERVAL','3','�����澯ʱ����(����)','ALERT',8),
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
  ('PASSWORD','royasoft','��Ȩ����','MMS',3),
  ('PERFORMANCEINTERVAL','3','���ܸ澯ʱ����(����)','ALERT',3),
  ('PHYMEMUSAGE','83','�ڴ�ռ����','MIB-READ',39),
  ('PLUGINEMAIL','1','','MAS',57),
  ('PLUGINLBS','1','','MAS',57),
  ('PLUGINMMS','1','','MAS',57),
  ('PLUGINSMS','1','','MAS',57),
  ('PLUGINUSSD','1','','MAS',57),
  ('PLUGINWAP','1','PLUGINWAP','MAS',67),
  ('PLUGINWEB','1','','MAS',57),
  ('PROCESSMONITORINTERVAL','60','������̼������(��λ����)','PLUGIN',1),
  ('PUSHMAILFLAG','1','PUSHMAIL������ͨ��־','MIB-READ',34),
  ('PUSHMAILGWURL','http://218.206.176.146:443/gegw/GEGWIServlet','PUSHMAIL�������ص�ַ','MAS',10),
  ('PWD_EXPIRE_DAY','30','���������������','SYS-ADMIN',20),
  ('PWD_EXPIRE_TIP','true','����������ѿ���<br>(on-����,off-������)','SYS-ADMIN',10),
  ('QOSGWSTATUS','120','QOS����״̬ͳ�Ƶ�ʱ�������(����)','MIB-SCANPERIOD',10),
  ('QOSMTDELAY','120','QOS��ʱͳ�Ƶ�ʱ�������(����)','MIB-SCANPERIOD',11),
  ('QOSMTNUM','120','QOS�ɹ���ͳ�Ƶ�ʱ�������(����)','MIB-SCANPERIOD',12),
  ('QOSͳ��','-','-','RESOURCEGROUP',13),
  ('QUERY_SMS_RECEIVE_HANDLER','com.royasoft.mas.core.sms.handler.QuerySMSReceiveHandler','��ѯ����������д�����','HANDLER',1),
  ('READUPGRADEFLAG','1','�Ƿ����µ�����֪ͨ','MAS',20),
  ('READ_REPLY','true','�Ƿ���Ҫ��״̬����','MMS',20),
  ('REGAUTHTIME','094900','MAS��֤��Ȩʱ���(��ʽ:HHmmss)','MAS',5),
  ('REGCOUNT','3','MAS��֤ע��ʧ�ܸ澯����','MAS',6),
  ('REGINTERVAL','120','MASע��ʱ����-ʧ��ʱ(��λ:��)','MAS',5),
  ('RESENDCOUNT','2','�ش�����','MMS',16),
  ('RESEND_INTERVAL','30','����ʧ���ش���ʼ����(��)','MMS',24),
  ('RESEND_INTERVAL','30','����ʧ���ش���ʼ����(��)','SMS',190),
  ('RESETFLAG','0','�����������Ʊ�־','MIB-READWRITE',19),
  ('RESOURCEMONITORINTERVAL','60','���ռ����Դ������ڣ���λ���룩','PLUGIN',2),
  ('SCANBUSICAPDATATIME','000030','ҵ������ɨ��ʱ���','MIB-SCANPERIOD',1),
  ('SCANINTERVAL','1','���ݲɼ�����(��λ:����)','MAS',12),
  ('SCANQOSTIME','000000','QOSɨ��ʱ���','MIB-SCANPERIOD',9),
  ('SCANSWITCH','true','MAS���ܲɼ�����','MAS',11),
  ('SCMEMAIL','1','','MAS',53),
  ('SCMFLAG','1','SCMҵ��ͨ��־','MIB-READ',24),
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
  ('SENSITIVEINTERVAL','3','������Ϣ�澯ʱ����(����)','ALERT',6),
  ('SERVICE_CODE','9109','�������','MMS',21),
  ('SERVICE_CODE','9109001','�������','WEB_MMS',2),
  ('SERVICE_CODE','910119001','WEB���ŷ������','WEB_SMS',1),
  ('SERVICE_CODE','9101190099','�������','WEB_WEBPUSH',2),
  ('SIM_SUBMIT_FAILURE','false','ģ��ʧ���ش�','SMS',195),
  ('SMDELIVER_THREADPOOL_SIZE','10','�������д����̳߳���','SMS',180),
  ('SMROUTE_CLASS','com.royasoft.mas.core.sms.route.Cmpp2Route','<font color=red>����·��ȫ·������</font>','SMS',40),
  ('SMROUTE_LOGON_INTERVAL','60','����·�ɵ�¼ʧ���������ʱ��(��)','SMS',135),
  ('SMROUTE_LOGON_TRY_COUNT','1000','����·�ɵ�¼����Դ���','SMS',130),
  ('SMROUTE_SEND_RATE','3000','���ŷ�������(��/��)','SMS',155),
  ('SMSCOUNT','60','������Ŀ�ɼ�����(����)','MIB-SCANPERIOD',2),
  ('SMSFLAG','1','����������ͨ��־','MIB-READ',29),
  ('SMSMOVESERVICE','com.royasoft.mas.core.sms.SMSMoveService','���Ű��Ʒ���','SYSTEM_SERVICE',0),
  ('SMSOVERFLOWINTERVAL','3','��������������澯ʱ����(����)','ALERT',4),
  ('SMSSIGN','���ƶ�','����ǩ��','WEB_SMS',3),
  ('SMSTATUS_THREADPOOL_SIZE','1000','���Ŵ���״̬�����̳߳���','SMS',175),
  ('SMS_MOVE_INTERVAL','120',' ���Ű���ʱ����(��)','SMS',3),
  ('SNTPINTERVAL','3600','MASʱ��ͬ�����ڣ���λ���룩','MAS',22),
  ('SNTPIP','192.43.244.18','MASʱ��ͬ��������IP','MAS',22),
  ('SYNCBUSINESSCAPDATA','com.royasoft.mas.service.snmp.sync.SyncBusinessCapData','ҵ������ͬ��','SYSTEM_SERVICE',1),
  ('SYNCTIME','com.royasoft.mas.service.soap.SyncTime','MASʱ��ͬ��','SYSTEM_SERVICE',1),
  ('SYNC_TO_BOSS_INTERVAL','300','ǩԼ��Ϣ�ļ�ͬ��BOSS����(��)','APP_CONNECT',11),
  ('SYNC_TO_BOSS_TIME','030000','ǩԼ�����ļ�ͬ��BOSSʱ��(��ʽ:HHMMSS)','APP_CONNECT',15),
  ('SYSCONTACT','8F,No.200,Lane91,Eshan RD,Eshan Rd,Shanghai','����Ա��ϵ��ַ','MIB-READWRITE',1),
  ('SYSDESCR','Microsoft Windows XP','ϵͳ����','MIB-READ',1),
  ('SYSLOCATION','Shanghai_beijing','ϵͳλ��','MIB-READWRITE',3),
  ('SYSNAME','MAS2','����ñ��ܽڵ������','MIB-READWRITE',2),
  ('SYSOBJECTID','1.3.6.1.4.1.28357.1','ϵͳ��ʶ','MIB-READ',2),
  ('SYSSERVICES','0','ϵͳ�ṩ�ķ���','MIB-READ',3),
  ('SYSUPTIME','272420000','ϵͳ����ʱ��','MIB-READ',41),
  ('TIMEOUT','90000','���ӳ�ʱ','MMS',15),
  ('TOTAL_SMS_LIMT','75','ϵͳ���������','SMS',1),
  ('TURNOFFFLAG','0','�ػ����Ʊ�־','MIB-READWRITE',18),
  ('UPGRADEFLAG','1','�汾����֪ͨ��־','MIB-READWRITE',20),
  ('UPLOADLOGFILE','com.royasoft.mas.core.log.UploadLogfile','��־�ϴ�','SYSTEM_SERVICE',1),
  ('USERNAME','royasoft','��Ȩ�û���','MMS',2),
  ('USESSL','true','�Ƿ�����SSL����','MMS',11),
  ('USSDC_ACCOUNT','mascmcc9','USSD���ص�¼�û���','USSD',4),
  ('USSDC_PASSWORD','mascmcc9','USSD���ص�¼����','USSD',5),
  ('USSDC_PORT','4400','USSD���ط���������˿�','USSD',3),
  ('USSDC_SERVER','218.206.178.41','USSD���ط����������ַ','USSD',2),
  ('USSDFLAG','1','USSD������ͨ��־','MIB-READ',31),
  ('USSDONLINEUSER','60','��ǰUSSD�û����ɼ�����(����)','MIB-SCANPERIOD',6),
  ('USSD_ROUTE_CLASS','com.royasoft.mas.core.ussd.SimpleUSSDRoute','USSD·��ȫ·������','USSD',1),
  ('USSD_ROUTE_LOGON_INTERVAL','300','USSD���ص�¼ʧ���������ʱ��(��)','USSD',7),
  ('USSD_ROUTE_LOGON_TRY_COUNT','1','USSD���ص�¼����Դ���','USSD',6),
  ('USSD����','-','-','RESOURCEGROUP',6),
  ('WAITSENDSMSSERVICES','com.royasoft.mas.web.sms.WaitSendSmsServices','WEB��ʱ����ɨ��','SYSTEM_SERVICE',0),
  ('WAIT_SMROUTE_OK','1000','�ȴ�����·��','SMS',150),
  ('WAPFLAG','1','WAP������ͨ��־','MIB-READ',32),
  ('WAPGWADDR','192.168.230.8','WAP���ص�ַ','MAS',10),
  ('WAPONLINEUSER','60','��ǰWAP�û����ɼ�����(����)','MIB-SCANPERIOD',4),
  ('WAP����','-','-','RESOURCEGROUP',4),
  ('WEBSERVICE_MMS_STATUS_HANDLER','com.royasoft.mas.core.mms.handler.WebServiceMMStatusHandler','WebService����','HANDLER',5),
  ('WEBSERVICE_SMS_RECEIVE_HANDLER','com.royasoft.mas.core.sms.handler.WebServiceSMSReceiveHandler','WebService�������д�����','HANDLER',1),
  ('WEBSERVICE_SMS_STATUS_HANDLER','com.royasoft.mas.core.sms.handler.WebServiceSMSStatusHandler','WebService����״̬������','HANDLER',4),
  ('WEB_MMS_RECEIVE_HANDLER','com.royasoft.mas.core.mms.handler.WebMMReceiveHandler','WEB�������д�����','HANDLER',2),
  ('WEB_MMS_STATUS_HANDLER','com.royasoft.mas.core.mms.handler.WebMMStatusHandler','WEB����״̬������','HANDLER',5),
  ('WEB_SERVICE_MMS_RECEIVE_HANDLER','com.royasoft.mas.core.mms.handler.WebServiceMMReceiveHandler','WebService�������д�����','HANDLER',2),
  ('WEB_SMS_RECEIVE_HANDLER','com.royasoft.mas.core.sms.handler.WebSMSReceiveHandler','WEB�������д�����','HANDLER',1),
  ('WEB_SMS_STATUS_HANDLER','com.royasoft.mas.core.sms.handler.WebSMSStatusHandler','WEB����״̬������','HANDLER',4),
  ('WEB_USSD_RECEIVE_HANDLER','com.royasoft.mas.core.ussd.handler.WebUSSDReceiveHandler','WEB USSD���д�����','HANDLER',3),
  ('WEB_WAPPUSH_STATUS_HANDLER','com.royasoft.mas.core.wappush.handler.WebWapPushStatusHandler','WEB WapPush״̬������','HANDLER',6),
  ('WEB����','-','-','RESOURCEGROUP',3),
  ('WEB����','-','-','RESOURCEGROUP',2),
  ('WSPLUG_WAPPUSH_STATUS_HANDLER','com.royasoft.mas.core.wappush.handler.WsPlugWapPushStatusHandler','WebService WapPush״̬������','HANDLER',6),
  ('WS_USSD_RECEIVE_HANDLER','com.royasoft.mas.core.ussd.handler.WsUSSDReceiveHandler','WebService USSD���д�����','HANDLER',3),
  ('����','','','RESOURCEGROUP',1),
  ('�澯����','-','-','RESOURCEGROUP',14),
  ('��ַ��','-','-','RESOURCEGROUP',12),
  ('Ӧ�ý���','-','-','RESOURCEGROUP',10),
  ('�������','-','-','RESOURCEGROUP',9),
  ('��ѯ����','-','-','RESOURCEGROUP',7),
  ('����','����','����','FILTER_WORD',1),
  ('�ƶ���λ','-','-','RESOURCEGROUP',5),
  ('����ƽ̨','-','-','RESOURCEGROUP',11),
  ('ϵͳ����','-','-','RESOURCEGROUP',15);

COMMIT;

#
# Data for the `sys_code_type` table  (LIMIT 0,500)
#

INSERT INTO `sys_code_type` (`TYPE_NAME`, `TYPE_DESC`, `READ_ONLY`) VALUES
  ('SMS','<font color=red>�����ں˲�������</font>',False),
  ('WEB_SMS','<font color=red>WEB������ز���</font>',False),
  ('WEB_WEBPUSH','<font color=red>WEBPUSH��ز���</font>',False),
  ('FILTER_WORD','<font color=red>���д�</font>',False),
  ('MMS','<font color=gold>�����ں˲�������</font>',False),
  ('WEB_MMS','<font color=gold>WEB������ز���</font>',False),
  ('BUSI_APP','<font color=#00ffff>ҵ��Ӧ�ò�������</font>',False),
  ('LBS','��λģ��',False),
  ('WEB_LBS','WEB��λ��ز���',False),
  ('USSD','USSD�ں˲�������',False),
  ('APP_CONNECT','Ӧ�ý����������',False),
  ('MAS','MAS',False),
  ('PLUGIN','�������ģ��',False),
  ('RESOURCEGROUP','��Դ�������',True),
  ('ALERT','�澯ģ��',False),
  ('DBPLUG_SMS','DBPLUG������ز���',False),
  ('MIB-COUNT','MIB-COUNT',False),
  ('MIB-READ','MIB-READ',True),
  ('MIB-READWRITE','MIB-READWRITE',False),
  ('MIB-SCANPERIOD','MIB-SCANPERIOD',False),
  ('SYS-ADMIN','<font color=#074A7D><b>ϵͳ�����������</b></font>',False),
  ('DB','���ݱ���',False),
  ('SYSTEM_SERVICE','ϵͳ����',False),
  ('BACKUP_TABLES','��Ҫ���ݵı�',False),
  ('HANDLER','���С�״̬������',False);

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
  (1,'MENU','MENU_SMS','WEB����','WEB����'),
  (2,'MENU','SUBMENU_SMS_SEND','WEB����','���Ͷ���'),
  (3,'MENU','SUBMENU_SMS_INBOX','WEB����','�ռ���'),
  (4,'MENU','SUBMENU_SMS_OUTBOX','WEB����','�ѷ�����'),
  (5,'URL','/sendSms.do','WEB����','���Ͷ���URL'),
  (6,'URL','/listSmsMo.do','WEB����','�����ռ���URL'),
  (7,'URL','/listSmsMt.do','WEB����','���ŷ�����URL'),
  (8,'MENU','MENU_MMS','WEB����','WEB����'),
  (9,'MENU','SUBMENU_MMS_SEND','WEB����','���Ͳ���'),
  (10,'MENU','SUBMENU_MMS_INBOX','WEB����','�ռ���'),
  (11,'MENU','SUBMENU_MMS_OUTBOX','WEB����','������'),
  (12,'URL','/sendMms.do','WEB����','���Ͳ���URL'),
  (13,'URL','/listMmsMo.do','WEB����','�����ռ���URL'),
  (14,'URL','/listMmsMt.do','WEB����','���ŷ�����URL'),
  (15,'MENU','MENU_WAPPUSH','WAP����','WAP����'),
  (16,'MENU','SUBMENU_WAPPUSH_SEND','WAP����','WAP����'),
  (17,'MENU','SUBMENU_WAPPUSH_STATUS','WAP����','״̬��ѯ'),
  (18,'URL','/sendWappush.do','WAP����','WAP����URL'),
  (19,'URL','/listWappush.do','WAP����','WAP����״̬��ѯURL'),
  (20,'MENU','MENU_LBS','�ƶ���λ','�ƶ���λ'),
  (21,'MENU','SUBMENU_LBS_REQUEST','�ƶ���λ','�ƶ���λ'),
  (22,'MENU','SUBMENU_LBS_TLRREQUEST','�ƶ���λ','�����ѯ'),
  (23,'URL','/lbsRequest.do','�ƶ���λ','��λURL'),
  (24,'URL','/lbsTlrsRstList.do','�ƶ���λ','��λ�����ѯURL'),
  (25,'MENU','MENU_USSD','USSD����','USSD����'),
  (26,'MENU','SUBMENU_USSD_REQUEST','USSD����','USSD����'),
  (27,'MENU','SUBMENU_USSD_SESSION','USSD����','USSD�Ự��ѯ'),
  (28,'MENU','MENU_BUSINESS','��ѯ����','��ѯ����'),
  (29,'MENU','SUBMENU_LOG','��ѯ����','ƽ̨��־��ѯ'),
  (30,'MENU','SUBMENU_BUSINESS_LOG','��ѯ����','ҵ����־��ѯ'),
  (31,'MENU','SUBMENU_SMS_QUERY_MO','��ѯ����','���ж��Ų�ѯ'),
  (32,'MENU','SUBMENU_SMS_QUERY_MT','��ѯ����','���ж��Ų�ѯ'),
  (33,'MENU','SUBMENU_MMS_QUERY_MO','��ѯ����','���в��Ų�ѯ'),
  (34,'MENU','SUBMENU_MMS_QUERY_MT','��ѯ����','���в��Ų�ѯ'),
  (35,'MENU','SUBMENU_QUERY','��ѯ����','����ҵ��ͳ��'),
  (36,'MENU','SUBMENU_BUSINESS_FLUX','��ѯ����','ҵ������ͳ��'),
  (37,'MENU','MENU_ELEMENT','B/S���','B/S���'),
  (38,'MENU','SUBMENU_ELEMENT_ADD','B/S���','�û�����'),
  (39,'MENU','SUBMENU_ELEMENT_FILTER','B/S���','��־�鿴'),
  (40,'MENU','SUBMENU_ELEMENT_REPLACE','B/S���','�澯�鿴'),
  (42,'MENU','SUBMENU_ELEMENT_LAYOUTINFO','B/S���','���ù���'),
  (43,'MENU','MENU_PLUGIN','�������','�������'),
  (44,'MENU','SUBMENU_PLUGIN_PLUGINMNG','�������','�������'),
  (45,'MENU','SUBMENU_PLUGIN_PLUGINLIST','�������','���ע��'),
  (46,'MENU','SUBMENU_PLUGIN_PLUGINVALVELIST','�������','��ֵ����'),
  (47,'MENU','SUBMENU_PLUGIN_DBPLUGMNG','�������','DB�������'),
  (48,'MENU','MENU_APPCONNCET','Ӧ�ý���','Ӧ�ý���'),
  (49,'MENU','SUBMENU_APP_CONNECT','Ӧ�ý���','�ͻ���Ϣ'),
  (50,'MENU','SUBMENU_APP_RELATION','Ӧ�ý���','������Ϣ'),
  (51,'MENU','SUBMENU_APP_ORDER','Ӧ�ý���','������ϵ'),
  (52,'MENU','SUBMENU_APP_FORBIDDEN','Ӧ�ý���','�ڰ�����'),
  (54,'MENU','SUBMENU_WEBTRANSMIT','Ӧ�ý���','HTTP����'),
  (55,'MENU','MENU_MANAGEMENT','����ƽ̨','����ƽ̨'),
  (57,'MENU','SUBMENU_SOAP','����ƽ̨','ͨѶ����'),
  (58,'MENU','SUBMENU_SNMP','����ƽ̨','��Ϣ����'),
  (59,'MENU','SUBMENU_HOST','����ƽ̨','�豸������'),
  (60,'MENU','SUBMENU_TS','����ƽ̨','ʱ��ͬ��'),
  (61,'MENU','MENU_ADDRESS','��ַ��','��ַ��'),
  (62,'MENU','SUBMENU_ADDR_ORG','��ַ��','������Ϣ'),
  (63,'MENU','SUBMENU_ADDR_EMPLOYEE','��ַ��','Ա����Ϣ'),
  (64,'MENU','SUBMENU_ADDR_GROUP','��ַ��','Ⱥ����Ϣ'),
  (65,'MENU','MENU_QOS','QOSͳ��','QOSͳ��'),
  (66,'MENU','SUBMENU_BUSINESS_CONNECTSTATUS','QOSͳ��','����״̬'),
  (67,'MENU','SUBMENU_BUSINESS_MTDELAY','QOSͳ��','����ʱ��'),
  (68,'MENU','SUBMENU_BUSINESS_MTNUM','QOSͳ��','���гɹ���'),
  (69,'MENU','MENU_ALERT','�澯����','�澯����'),
  (70,'MENU','SUBMENU_ACTIVE_ALERT','�澯����','ʵʱ�澯'),
  (71,'MENU','SUBMENU_HISTORY_ALERT','�澯����','��ʷ�澯'),
  (72,'MENU','MENU_SYSTEM','ϵͳ����','ϵͳ����'),
  (73,'MENU','SUBMENU_USER','ϵͳ����','�û�����'),
  (74,'MENU','SUBMENU_ROLE','ϵͳ����','��ɫ����'),
  (75,'MENU','SUBMENU_RESOURCE','ϵͳ����','��Դ����'),
  (76,'MENU','SUBMENU_MENU','ϵͳ����','�˵�����'),
  (77,'MENU','SUBMENU_CODE','ϵͳ����','��������'),
  (78,'MENU','SUBMENU_PLUGIN_PLUGINFLUX','ϵͳ����','�������'),
  (79,'MENU','SUBMENU_MIB_UPGRADE','����ƽ̨','����֪ͨ'),
  (80,'MENU','SUBMENU_MIB_SWITCH','����ƽ̨','���ƿ���'),
  (81,'MENU','SUBMENU_BIZCONFIG','����ƽ̨','ҵ������'),
  (82,'MENU','SUBMENU_PLUGIN_PE','�������','PE���'),
  (88,'MENU','MENU_BUSI','ҵ��Ӧ��','ҵ��Ӧ��'),
  (89,'MENU','SUBMENU_SMS_SECURITY','ҵ��Ӧ��','���ŷ�α'),
  (90,'MENU','SUBMENU_METING','ҵ��Ӧ��','����֪ͨ'),
  (91,'MENU','SUBMENU_WORKPLAN','ҵ��Ӧ��','��������'),
  (92,'MENU','SUBMENU_WORKPLAN_MANAGE','ҵ��Ӧ��','��������'),
  (93,'MENU','SUBMENU_COMPLAINT','ҵ��Ӧ��','�ٱ�Ͷ��'),
  (94,'MENU','SUBMENU_POLL','ҵ��Ӧ��','ͶƱ����'),
  (95,'MENU','SUBMENU_SCHEDULE_REMINDER','ҵ��Ӧ��','�ճ�����'),
  (96,'MENU','SUBMENU_BIRTHDAY_REMINDER','ҵ��Ӧ��','��������'),
  (97,'MENU','SUBMENU_BROARDCAST','ҵ��Ӧ��','�㲥���ѯ'),
  (98,'MENU','SUBMENU_MMS_MODE','WEB����','����ģ��'),
  (99,'MENU','SUBMENU_MMS_MATERIAL','WEB����','�����ز�'),
  (100,'MENU','SUBMENU_SMS_ROUTE','ϵͳ����','·������'),
  (101,'MENU','SUBMENU_MMS_LIST_DRAFTS','WEB����','�ݸ���'),
  (102,'FUNCTION','FN_ALERT_RESOURCE','�澯����','�����澯����ʾ��Դ'),
  (103,'URL','/restar.do','����ƽ̨','������Դ'),
  (104,'MENU','SUBMENU_SMSMMS_EXPECT','ϵͳ����','�̲��Ų�ѯ�����û�'),
  (105,'MENU','SUBMENU_ADDR_ADDBOOK','��ַ��','ͨѶ¼'),
  (106,'MENU','SUBMENU_ADDR_ADDGROUP','��ַ��','ͨѶ¼����'),
  (107,'MENU','BACK_UP_CONFIG','ϵͳ����','��������'),
  (108,'MENU','BACK_UP','ϵͳ����','���ݱ���'),
  (109,'MENU','COME_BACK','ϵͳ����','���ݻָ�'),
  (110,'MENU','SUBMENU_SMS_WAITOUTBOX','WEB����','��������'),
  (111,'MENU','SUBMENU_SMS_DRAFTS','WEB����','�ݸ���'),
  (112,'MENU','SUBMENU_SMS_BATCH','WEB����','��������');

COMMIT;

#
# Data for the `sys_role` table  (LIMIT 0,500)
#

INSERT INTO `sys_role` (`id`, `title`, `description`) VALUES
  (1,'ROLE_ADMIN','ϵͳ����Ա'),
  (3,'NORMAL_USER','��ͨ�û�');

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
