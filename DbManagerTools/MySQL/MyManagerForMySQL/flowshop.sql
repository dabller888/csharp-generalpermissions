# SQL Manager 2005 for MySQL 3.6.5.8
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : flowshop


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `flowshop`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

#
# Structure for the `st_object` table : 
#

CREATE TABLE `st_object` (
  `objectName` varchar(20) NOT NULL,
  `objectTitle` varchar(20) NOT NULL,
  `sort_infoName` varchar(20) default NULL,
  `editRole` varchar(50) default NULL,
  `title_infoName` varchar(50) default NULL,
  `systemFlag` int(1) default NULL,
  PRIMARY KEY  (`objectName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Structure for the `st_infostructure` table : 
#

CREATE TABLE `st_infostructure` (
  `objectName` varchar(20) NOT NULL,
  `infoName` varchar(20) NOT NULL,
  `infoTitle` varchar(20) NOT NULL,
  `infoType` varchar(20) NOT NULL,
  `keyFlag` char(1) NOT NULL,
  `blankFlag` char(1) NOT NULL,
  `showFlag` char(1) NOT NULL,
  `sortFlag` int(11) NOT NULL,
  `editRole` varchar(50) default NULL,
  `fieldLen` decimal(10,1) default NULL,
  PRIMARY KEY  (`objectName`,`infoName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for the `st_object` table  (LIMIT 0,500)
#

INSERT INTO `st_object` (`objectName`, `objectTitle`, `sort_infoName`, `editRole`, `title_infoName`, `systemFlag`) VALUES 
  ('all_sql','所有sql','sql_bs','0',NULL,NULL),
  ('busType','业务类型','busTypeId','0',NULL,NULL),
  ('customer','客户/供应商','clientNo','0',NULL,NULL),
  ('function','系统功能','functionId','0',NULL,NULL),
  ('goods','商品','goodsCode','0',NULL,NULL),
  ('goodsUnit','计量单位','unitNo','0',NULL,NULL),
  ('menu','系统菜单','menuName','0',NULL,NULL),
  ('msgType','消息类型','msgtypeId','0',NULL,NULL),
  ('objtestForFlow','对象测试','objtestForFlowId','0',NULL,NULL),
  ('persons','人员','personName','0',NULL,NULL),
  ('preOpenPage','预加载页','pageName','0',NULL,NULL),
  ('preserveDate','保质期规则',NULL,'0',NULL,NULL),
  ('region','行政区域','regionName','0',NULL,NULL),
  ('USERLIST','员工列','1','0',NULL,NULL);

COMMIT;

#
# Data for the `st_infostructure` table  (LIMIT 0,500)
#

INSERT INTO `st_infostructure` (`objectName`, `infoName`, `infoTitle`, `infoType`, `keyFlag`, `blankFlag`, `showFlag`, `sortFlag`, `editRole`, `fieldLen`) VALUES 
  ('all_sql','con_type','连接类型','aggregate','0','1','1',2,'0',NULL),
  ('all_sql','sql_bs','sql标识','string','0','1','1',1,'0',NULL),
  ('all_sql','sql_string','sql','memo','0','1','1',3,'0',NULL),
  ('busType','busName','业务名称','string','0','1','1',1,'0',NULL),
  ('customer','address','送货地址','object','0','1','1',6,'0',NULL),
  ('customer','bank','开户银行','string','0','0','0',7,'0',NULL),
  ('customer','bankAccount','银行账号','string','0','0','0',8,'0',NULL),
  ('customer','capital','注册资本','num','0','0','0',99,'0',NULL),
  ('customer','clientFullName','开票名称','string','0','0','0',3,'0',NULL),
  ('customer','clientName','客户简称','string','1','1','1',1,'0',NULL),
  ('customer','clientNo','客户编号','string','1','1','1',2,'0',NULL),
  ('customer','faxNo','传真','string','0','0','0',99,'0',NULL),
  ('customer','lawMan','法人代表','string','0','0','0',99,'0',NULL),
  ('customer','licenseNumber','酒类许可证','string','0','0','1',99,'0',NULL),
  ('customer','linkAddress','联系地址','string','0','0','0',99,'0',NULL),
  ('customer','linkMan','联系人','string','0','0','1',99,'0',NULL),
  ('customer','region','所属区域','tree','0','0','1',99,'0',NULL),
  ('customer','registAddress','开票地址','string','0','0','0',10,'0',NULL),
  ('customer','taxNo','增值税号','string','0','0','0',9,'0',NULL),
  ('customer','telephone','电话','string','0','0','1',5,'0',NULL),
  ('function','fId','功能ID','string','1','1','1',2,'0',NULL),
  ('function','functionClass','实现类','string','0','0','1',5,'0',NULL),
  ('function','functionName','功能名称','string','1','1','1',1,'0',NULL),
  ('function','functionType','功能类型','aggregate','0','1','1',3,'0',NULL),
  ('function','returnPath','返回地址','string','0','0','1',6,'0',NULL),
  ('function','UIPath','UI地址','string','0','0','1',4,'0',NULL),
  ('goods','goodsCode','商品编码','string','1','0','1',2,'0',NULL),
  ('goods','goodsName','品名','string','1','0','1',1,'0',NULL),
  ('goods','goodsSpec','规格','string','0','1','1',99,'0',NULL),
  ('goods','goodsUnit','计量单位','object','1','0','1',99,'0',NULL),
  ('goods','highQuantity','库存上限','num','0','0','0',99,'0',NULL),
  ('goods','inTaxRate','进项税率','num','0','1','1',99,'0',NULL),
  ('goods','lastInPrice','最后进价','num','0','0','0',99,'0',NULL),
  ('goods','lowQuantity','库存下限','num','0','0','0',99,'0',NULL),
  ('goods','minUnit','最小单位','string','0','0','1',99,'0',NULL),
  ('goods','outTaxRate','销项税率','num','0','1','1',99,'0',NULL),
  ('goods','preserveDate','保质期规则','object','0','0','1',99,'0',NULL),
  ('goods','producingArea','产地','string','0','0','1',99,'0',NULL),
  ('goods','standInPrice','标准进价','num','0','0','1',99,'0',NULL),
  ('goods','standOutPrice','标准售价','num','0','0','1',99,'0',NULL),
  ('goods','standUnit','标准单位','string','0','1','1',99,'0',NULL),
  ('goodsUnit','barCode','包装条码','string','0','0','1',4,'0',NULL),
  ('goodsUnit','unitHeight','包装高度','num','0','0','1',99,'0',NULL),
  ('goodsUnit','unitLength','包装长度','num','0','0','1',99,'0',NULL),
  ('goodsUnit','unitName','单位名称','string','0','1','1',1,'0',NULL),
  ('goodsUnit','unitNo','包装编码','num','0','1','1',2,'0',NULL),
  ('goodsUnit','unitRate','换算率','num','0','1','1',3,'0',NULL),
  ('goodsUnit','unitWeight','单位毛重','num','0','0','1',99,'0',NULL),
  ('goodsUnit','unitWidth','包装宽度','num','0','0','1',99,'0',NULL),
  ('menu','functionId','功能ID','string','0','0','1',2,'0',NULL),
  ('menu','menuName','菜单名称','string','0','1','1',1,'0',NULL),
  ('menu','menuType','打开方式','aggregate','0','0','1',4,'0',NULL),
  ('menu','url','功能URL','string','0','0','1',3,'0',NULL),
  ('msgType','msgName','名称','string','0','1','1',1,'0',NULL),
  ('objtestForFlow','region','行政区域s','tree','1','1','1',2,'0',NULL),
  ('persons','personsName','名称','string','1','1','1',1,'0',NULL),
  ('persons','personsSex','性别','string','0','1','1',2,'0',NULL),
  ('preOpenPage','checker','周期检查类','string','0','0','1',4,'0',NULL),
  ('preOpenPage','forever','周期','aggregate','0','1','1',3,'0',NULL),
  ('preOpenPage','functionId','所属模块','string','0','1','1',2,'0',NULL),
  ('preOpenPage','link','链接标志','aggregate','0','1','1',5,'0',NULL),
  ('preOpenPage','pageName','描述','string','0','0','1',1,'0',NULL),
  ('preserveDate','alertDay','库存报警天数','num','0','1','1',99,'0',NULL),
  ('preserveDate','dateType','标注日期类型','aggregate','0','0','1',1,'0',NULL),
  ('preserveDate','orderDay','终端送货天数','num','0','1','1',99,'0',NULL),
  ('preserveDate','preserveDay','保质天数','num','1','1','1',2,'0',NULL),
  ('preserveDate','purchaseDay','供应商到货天数','num','0','1','1',99,'0',NULL),
  ('preserveDate','returnClientDay','终端退货天数','num','0','1','1',99,'0',NULL),
  ('preserveDate','returnVendorDay','供应商退货天数','num','0','1','1',99,'0',NULL),
  ('region','regionCode','编码','string','1','1','1',2,'0',NULL),
  ('region','regionName','名称','string','1','1','1',1,'0',NULL),
  ('USERLIST','userName','用户名','string','0','0','0',1,'0',NULL);

COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;