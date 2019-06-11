# SQL Manager 2005 for MySQL 3.6.5.8
# ---------------------------------------
# Host     : 192.168.1.11
# Port     : 3306
# Database : sztsg


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `sztsg`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

#
# Structure for the `book_address` table : 
#

CREATE TABLE `book_address` (
  `id` int(11) NOT NULL,
  `book_id` int(11) default NULL,
  `book_readAddr` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for the `book_address` table  (LIMIT 0,500)
#

INSERT INTO `book_address` (`id`, `book_id`, `book_readAddr`) VALUES 
  (1,1,'tabiyanhuajimo/1.txt'),
  (2,1,'tabiyanhuajimo/2.txt'),
  (3,1,'tabiyanhuajimo/3.txt'),
  (4,1,'tabiyanhuajimo/4.txt');

COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;