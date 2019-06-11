# SQL Manager 2005 for MySQL 3.6.5.8
# ---------------------------------------
# Host     : 192.168.1.245
# Port     : 3306
# Database : mccdb


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `mccdb`
    CHARACTER SET 'gbk'
    COLLATE 'gbk_chinese_ci';

#
# Structure for the `fund_bill_report` table : 
#

CREATE TABLE `fund_bill_report` (
  `rpt_id` bigint(20) NOT NULL auto_increment,
  `Sum_id` bigint(20) default NULL,
  `serviceid` int(11) default NULL,
  `Billingid` int(11) default NULL,
  `sms_num` int(11) default NULL,
  `bill_amount` float default NULL,
  `fee_type` tinyint(4) default NULL,
  `Bill_date` datetime default NULL,
  PRIMARY KEY  (`rpt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;