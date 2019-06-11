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
  ('all_sql','����sql','sql_bs','0',NULL,NULL),
  ('busType','ҵ������','busTypeId','0',NULL,NULL),
  ('customer','�ͻ�/��Ӧ��','clientNo','0',NULL,NULL),
  ('function','ϵͳ����','functionId','0',NULL,NULL),
  ('goods','��Ʒ','goodsCode','0',NULL,NULL),
  ('goodsUnit','������λ','unitNo','0',NULL,NULL),
  ('menu','ϵͳ�˵�','menuName','0',NULL,NULL),
  ('msgType','��Ϣ����','msgtypeId','0',NULL,NULL),
  ('objtestForFlow','�������','objtestForFlowId','0',NULL,NULL),
  ('persons','��Ա','personName','0',NULL,NULL),
  ('preOpenPage','Ԥ����ҳ','pageName','0',NULL,NULL),
  ('preserveDate','�����ڹ���',NULL,'0',NULL,NULL),
  ('region','��������','regionName','0',NULL,NULL),
  ('USERLIST','Ա����','1','0',NULL,NULL);

COMMIT;

#
# Data for the `st_infostructure` table  (LIMIT 0,500)
#

INSERT INTO `st_infostructure` (`objectName`, `infoName`, `infoTitle`, `infoType`, `keyFlag`, `blankFlag`, `showFlag`, `sortFlag`, `editRole`, `fieldLen`) VALUES 
  ('all_sql','con_type','��������','aggregate','0','1','1',2,'0',NULL),
  ('all_sql','sql_bs','sql��ʶ','string','0','1','1',1,'0',NULL),
  ('all_sql','sql_string','sql','memo','0','1','1',3,'0',NULL),
  ('busType','busName','ҵ������','string','0','1','1',1,'0',NULL),
  ('customer','address','�ͻ���ַ','object','0','1','1',6,'0',NULL),
  ('customer','bank','��������','string','0','0','0',7,'0',NULL),
  ('customer','bankAccount','�����˺�','string','0','0','0',8,'0',NULL),
  ('customer','capital','ע���ʱ�','num','0','0','0',99,'0',NULL),
  ('customer','clientFullName','��Ʊ����','string','0','0','0',3,'0',NULL),
  ('customer','clientName','�ͻ����','string','1','1','1',1,'0',NULL),
  ('customer','clientNo','�ͻ����','string','1','1','1',2,'0',NULL),
  ('customer','faxNo','����','string','0','0','0',99,'0',NULL),
  ('customer','lawMan','���˴���','string','0','0','0',99,'0',NULL),
  ('customer','licenseNumber','�������֤','string','0','0','1',99,'0',NULL),
  ('customer','linkAddress','��ϵ��ַ','string','0','0','0',99,'0',NULL),
  ('customer','linkMan','��ϵ��','string','0','0','1',99,'0',NULL),
  ('customer','region','��������','tree','0','0','1',99,'0',NULL),
  ('customer','registAddress','��Ʊ��ַ','string','0','0','0',10,'0',NULL),
  ('customer','taxNo','��ֵ˰��','string','0','0','0',9,'0',NULL),
  ('customer','telephone','�绰','string','0','0','1',5,'0',NULL),
  ('function','fId','����ID','string','1','1','1',2,'0',NULL),
  ('function','functionClass','ʵ����','string','0','0','1',5,'0',NULL),
  ('function','functionName','��������','string','1','1','1',1,'0',NULL),
  ('function','functionType','��������','aggregate','0','1','1',3,'0',NULL),
  ('function','returnPath','���ص�ַ','string','0','0','1',6,'0',NULL),
  ('function','UIPath','UI��ַ','string','0','0','1',4,'0',NULL),
  ('goods','goodsCode','��Ʒ����','string','1','0','1',2,'0',NULL),
  ('goods','goodsName','Ʒ��','string','1','0','1',1,'0',NULL),
  ('goods','goodsSpec','���','string','0','1','1',99,'0',NULL),
  ('goods','goodsUnit','������λ','object','1','0','1',99,'0',NULL),
  ('goods','highQuantity','�������','num','0','0','0',99,'0',NULL),
  ('goods','inTaxRate','����˰��','num','0','1','1',99,'0',NULL),
  ('goods','lastInPrice','������','num','0','0','0',99,'0',NULL),
  ('goods','lowQuantity','�������','num','0','0','0',99,'0',NULL),
  ('goods','minUnit','��С��λ','string','0','0','1',99,'0',NULL),
  ('goods','outTaxRate','����˰��','num','0','1','1',99,'0',NULL),
  ('goods','preserveDate','�����ڹ���','object','0','0','1',99,'0',NULL),
  ('goods','producingArea','����','string','0','0','1',99,'0',NULL),
  ('goods','standInPrice','��׼����','num','0','0','1',99,'0',NULL),
  ('goods','standOutPrice','��׼�ۼ�','num','0','0','1',99,'0',NULL),
  ('goods','standUnit','��׼��λ','string','0','1','1',99,'0',NULL),
  ('goodsUnit','barCode','��װ����','string','0','0','1',4,'0',NULL),
  ('goodsUnit','unitHeight','��װ�߶�','num','0','0','1',99,'0',NULL),
  ('goodsUnit','unitLength','��װ����','num','0','0','1',99,'0',NULL),
  ('goodsUnit','unitName','��λ����','string','0','1','1',1,'0',NULL),
  ('goodsUnit','unitNo','��װ����','num','0','1','1',2,'0',NULL),
  ('goodsUnit','unitRate','������','num','0','1','1',3,'0',NULL),
  ('goodsUnit','unitWeight','��λë��','num','0','0','1',99,'0',NULL),
  ('goodsUnit','unitWidth','��װ���','num','0','0','1',99,'0',NULL),
  ('menu','functionId','����ID','string','0','0','1',2,'0',NULL),
  ('menu','menuName','�˵�����','string','0','1','1',1,'0',NULL),
  ('menu','menuType','�򿪷�ʽ','aggregate','0','0','1',4,'0',NULL),
  ('menu','url','����URL','string','0','0','1',3,'0',NULL),
  ('msgType','msgName','����','string','0','1','1',1,'0',NULL),
  ('objtestForFlow','region','��������s','tree','1','1','1',2,'0',NULL),
  ('persons','personsName','����','string','1','1','1',1,'0',NULL),
  ('persons','personsSex','�Ա�','string','0','1','1',2,'0',NULL),
  ('preOpenPage','checker','���ڼ����','string','0','0','1',4,'0',NULL),
  ('preOpenPage','forever','����','aggregate','0','1','1',3,'0',NULL),
  ('preOpenPage','functionId','����ģ��','string','0','1','1',2,'0',NULL),
  ('preOpenPage','link','���ӱ�־','aggregate','0','1','1',5,'0',NULL),
  ('preOpenPage','pageName','����','string','0','0','1',1,'0',NULL),
  ('preserveDate','alertDay','��汨������','num','0','1','1',99,'0',NULL),
  ('preserveDate','dateType','��ע��������','aggregate','0','0','1',1,'0',NULL),
  ('preserveDate','orderDay','�ն��ͻ�����','num','0','1','1',99,'0',NULL),
  ('preserveDate','preserveDay','��������','num','1','1','1',2,'0',NULL),
  ('preserveDate','purchaseDay','��Ӧ�̵�������','num','0','1','1',99,'0',NULL),
  ('preserveDate','returnClientDay','�ն��˻�����','num','0','1','1',99,'0',NULL),
  ('preserveDate','returnVendorDay','��Ӧ���˻�����','num','0','1','1',99,'0',NULL),
  ('region','regionCode','����','string','1','1','1',2,'0',NULL),
  ('region','regionName','����','string','1','1','1',1,'0',NULL),
  ('USERLIST','userName','�û���','string','0','0','0',1,'0',NULL);

COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;