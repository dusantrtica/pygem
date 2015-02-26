-- MySQL dump 10.10
--
-- Host: localhost    Database: gem
-- ------------------------------------------------------
-- Server version	5.0.18-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseID` int(10) unsigned NOT NULL auto_increment,
  `courseTitle` varchar(255) NOT NULL,
  PRIMARY KEY  USING BTREE (`courseID`),
  UNIQUE KEY `courseTitle` (`courseTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--


/*!40000 ALTER TABLE `course` DISABLE KEYS */;
LOCK TABLES `course` WRITE;
INSERT INTO `course` VALUES (1,'Osnovi programiranja'),(2,'Osnovi racunarskih sistema');
UNLOCK TABLES;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentID` int(10) unsigned NOT NULL auto_increment,
  `departmentTitle` varchar(255) NOT NULL,
  PRIMARY KEY  USING BTREE (`departmentID`),
  UNIQUE KEY `departmentTitle` (`departmentTitle`),
  UNIQUE KEY `departmentTitle_2` (`departmentTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela sa katedrama';

--
-- Dumping data for table `department`
--


/*!40000 ALTER TABLE `department` DISABLE KEYS */;
LOCK TABLES `department` WRITE;
INSERT INTO `department` VALUES (2,'Neka katedra 2'),(1,'Racunarstvo');
UNLOCK TABLES;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

--
-- Table structure for table `educationlevel`
--

DROP TABLE IF EXISTS `educationlevel`;
CREATE TABLE `educationlevel` (
  `EducationLevelID` int(10) unsigned NOT NULL default '0',
  `EducationLevelTitle` text collate utf8_unicode_ci NOT NULL,
  `EducationLevelTag` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`EducationLevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `educationlevel`
--


/*!40000 ALTER TABLE `educationlevel` DISABLE KEYS */;
LOCK TABLES `educationlevel` WRITE;
INSERT INTO `educationlevel` VALUES (0,'Bez škole','/'),(1,'I Stepen četiri razreda osnovne škole','/'),(2,'II Stepen - osnovna škola','/'),(3,'III Stepen - SSS srednja škola','/'),(4,'IV Stepen - SSS srednja škola','/'),(5,'V Stepen - VKV - SSS srednja škola','/'),(6,'VI Stepen - VS viša škola','/'),(7,'VII Stepen - VSS visoka stručna sprema','/'),(8,'VII-1 Stepen - Specijalista','/'),(9,'VII-2 Stepen - Magistratura','/'),(10,'VIII Stepen - Doktorat','/');
UNLOCK TABLES;
/*!40000 ALTER TABLE `educationlevel` ENABLE KEYS */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `EmployeeID` int(10) unsigned NOT NULL default '0',
  `EmployeeFirstName` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `EmployeeSurname` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `EmployeeGender` char(1) character set utf8 collate utf8_unicode_ci default '',
  `EmployeeJMBG` varchar(13) character set utf8 collate utf8_unicode_ci NOT NULL default '0000000000000',
  `EmployeePhoto` blob,
  `EmployeeDateOfBirth` datetime default '0000-00-00 00:00:00',
  `EmployeeCountryOfBirth` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `EmployeeStateOfBirth` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `EmployeeCityOfBirth` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `EmployeeDistrictOfBirth` text NOT NULL,
  `EmployeeStreet` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `EmployeeCountry` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `EmployeeState` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `EmployeeDistrict` text NOT NULL,
  `EmployeeCity` text NOT NULL,
  `EmployeeWorkingYears` int(10) unsigned default '0',
  `EmployeeWorkingMonths` int(10) unsigned default '0',
  `EmployeeEducationLevel` int(10) unsigned NOT NULL,
  `EmployeeJobDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `EmployeeJobStatus` char(1) character set utf8 collate utf8_unicode_ci default 'z',
  `EmployeeJobExpirationDate` datetime default NULL,
  `EmployeeBLK` varchar(15) character set utf8 collate utf8_unicode_ci NOT NULL default '0' COMMENT 'Employee Number of Identity Card',
  `EmployeeLBO` varchar(11) character set utf8 collate utf8_unicode_ci default NULL,
  `EmployeeMidName` text,
  `EmployeeWorkingDays` int(10) unsigned default '0',
  PRIMARY KEY  USING BTREE (`EmployeeID`),
  UNIQUE KEY `unique_Employee_EmployeeJMBG` (`EmployeeJMBG`),
  KEY `index_Employee_EmployeeDateOfBirth` (`EmployeeDateOfBirth`),
  KEY `EmployeeEducationLevel` (`EmployeeEducationLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--


/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
LOCK TABLES `employee` WRITE;
INSERT INTO `employee` VALUES (2,'Aleksandard','Jaksic','m','2810000000000',NULL,'2006-12-31 00:00:00','fgdgdfgdf','jhkljlkuy','tyutyuty','uytuyttyutyuty','iuyiuy','ytutyut','uytutyuty','uyi','uyiuyi',31,0,0,'1998-12-31 00:00:00','n',NULL,'','22222222222','',0),(4,'Djurdja','Tadic','f','1111111111111',NULL,'2006-12-31 00:00:00','trette','terterter','fgdfgdfg','hgfhfghgfg','jhdd','bvcbcvbcx','bcvxbcvbc','jdjd','bcvbcbvc',5,0,1,'2006-12-31 00:00:00','z','2006-12-31 00:00:00','','44444444444','Jelenko',0),(5,'bla bla','Stefanovskii','n','7777777777777',NULL,'2006-12-11 00:00:00','Jugoslavija','Srbija','Beograd','Savski venac','ViÅ¡njiÄki Ð²ÐµÐ½Ð°Ñ† 109','Crna Gora','Crna Gora','ÐŸÐ°Ð»Ð¸Ð»ÑƒÐ»Ð°','Beograd',3,0,0,'2006-12-11 00:00:00','z','2006-12-11 00:00:00','','55555555555','',0),(6,'Katalina','Tomasevic','f','0606198300000',NULL,'1983-12-31 00:00:00','Srbija','Srbija','Beograd','Savski venac','Durmitorska 3','Srbija','Srbija','Savski vvenac','Beograd',10,0,6,'2006-12-31 00:00:00','z',NULL,'','66666666666','',0),(7,'fdsdfsf','fdfsfdsfs','m','4353453453454',NULL,'2010-07-24 00:00:00','yyrtyrt','yryrty','rtyry','tyrtyrt','yrtyrttyry','yrtyrty','rtyrtytr','yrtyrt','yrtyrt',0,0,2,'2009-07-01 00:00:00','z','2009-07-01 00:00:00','0','00000000000','',0),(8,'novi','zaposleni','m','4353453453453',NULL,'1987-05-14 00:00:00','','','','','','','','','',0,0,0,'1970-05-01 00:00:00','z',NULL,'0','00000000000',NULL,0),(9,'pera','peric','f','8888888888888',NULL,'2008-12-31 00:00:00','fddf','','','','','','','','',1,6,3,'2010-01-01 00:00:00','z','2010-08-15 00:00:00','0','00000000000','Julije',1),(10,'zdera','zderic','m','8787686786786',NULL,'2008-12-31 00:00:00','zermlja','drzava','grad','opstina','','','','','',0,0,3,'2010-01-01 00:00:00','z',NULL,'0','00000000000','',0),(12,'Testiramo ćždopš','Latinična slova','','7658796000000',NULL,'2009-07-26 00:00:00','lčćžšđš','žšpžpš','pšžpšž','pšžšžp','žpšžpš','špžpš','','žpš','žpšžšp',1,0,0,'2008-07-05 00:00:00','z',NULL,'0','53453453453','',0),(13,'Dusan','Trtica','m','3001983710074',NULL,'1983-01-30 00:00:00','Srbija','Srbija','Beograd','Savski venac','Mile Jevtovic 20a','Srbija','Srbija','Cukarica','Beograd',0,3,7,'2010-07-01 00:00:00','z','2010-07-16 00:00:00','0','12312312312','Goran',0),(14,'Dušan','Kovačević','m','0101946710074',NULL,'1946-01-01 00:00:00','Srbija','Srbija','Užice','Užice','Pregrevica 176','Srbija','Srbija','Zemun','Beograd',10,6,4,'2007-09-01 00:00:00','',NULL,'0','79837429874','Miodrag',0),(15,'Miodrag','Stankić','m','2423424242424',NULL,'1963-09-01 00:00:00','Srbija','Srbija','Beograd','Novi beograd','','Srbija','Srbija','Zemun','Beograd',15,3,10,'2001-09-01 00:00:00','z','2010-09-30 00:00:00','0','02424242423','Đuro',22);
UNLOCK TABLES;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

--
-- Table structure for table `employeecourse`
--

DROP TABLE IF EXISTS `employeecourse`;
CREATE TABLE `employeecourse` (
  `employeeID` int(10) unsigned NOT NULL,
  `courseID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`employeeID`,`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='koji zaposleni drzi koji predmet';

--
-- Dumping data for table `employeecourse`
--


/*!40000 ALTER TABLE `employeecourse` DISABLE KEYS */;
LOCK TABLES `employeecourse` WRITE;
INSERT INTO `employeecourse` VALUES (7,1),(11,1),(11,2),(12,1),(12,2),(14,1),(14,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeecourse` ENABLE KEYS */;

--
-- Table structure for table `employeeeducation`
--

DROP TABLE IF EXISTS `employeeeducation`;
CREATE TABLE `employeeeducation` (
  `EmployeeID` int(11) NOT NULL,
  `EducationLevelID` int(10) unsigned NOT NULL,
  `EmployeeEducationFacultyTitle` text,
  `EmployeeEducationGraduateDate` date default NULL,
  `EmployeeEducationDepartment` text,
  `EmployeeEducationScienceInterestTitle` text COMMENT 'Oblast naucnog interesovanja, u uzem smislu. Npr. naziv diplomskog, ili doktorske disertacije\n',
  `EmployeeEducationID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`EmployeeEducationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Podaci o obrazovanju zaposlenih';

--
-- Dumping data for table `employeeeducation`
--


/*!40000 ALTER TABLE `employeeeducation` DISABLE KEYS */;
LOCK TABLES `employeeeducation` WRITE;
INSERT INTO `employeeeducation` VALUES (2,2,'dada',NULL,'dada',NULL,5),(8,0,'gfdg fgdkgd',NULL,'gdfg da da',NULL,6),(8,4,'Nikola Tesla',NULL,'Racunarstvo i informatika',NULL,7),(7,2,'gfdgfd',NULL,'gdfgdf',NULL,8),(7,2,'f',NULL,'fgfs',NULL,9),(11,0,'',NULL,'',NULL,10),(11,2,'sdfsd',NULL,'asdfaf',NULL,11),(11,2,'sdfsdsdfasd',NULL,'asdfaf',NULL,12),(12,5,'adfa',NULL,'afa',NULL,13),(12,7,'fsg',NULL,'afadfgsdg',NULL,15),(7,7,'Matematicki fakultet	',NULL,'Racunarstvo i informatika',NULL,16),(7,8,'Matematicki fakultet	',NULL,'Racunarstvo i informatika',NULL,17),(7,10,'Matematicki fakultet',NULL,'Doktorat, oko izrade automobila',NULL,18),(14,1,'jfasldkj		',NULL,'sdfafa',NULL,19),(14,2,'šđšđš',NULL,'šđšđšđšđšđ',NULL,20);
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeeeducation` ENABLE KEYS */;

--
-- Table structure for table `employeeinsurance`
--

DROP TABLE IF EXISTS `employeeinsurance`;
CREATE TABLE `employeeinsurance` (
  `EmployeeLBO` varchar(11) character set latin1 default NULL,
  `EmployeeInsuranceFirstName` text,
  `EmployeeInsuranceSurname` text,
  `EmployeeInsuranceGender` char(1) character set latin1 default NULL,
  `EmployeeInsuranceJMBG` varchar(13) character set latin1 default NULL,
  `EmployeeInsuranceDateOfBirth` datetime default NULL,
  `EmployeeInsuranceCountryOfBirth` text,
  `EmployeeInsuranceStateOfBirth` text,
  `EmployeeInsuranceCityOfBirth` text,
  `EmployeeInsuranceID` int(11) unsigned NOT NULL auto_increment,
  `EmployeeID` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`EmployeeInsuranceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Podaci o licima (deci) koja  su osigurana preko zaposlenog';

--
-- Dumping data for table `employeeinsurance`
--


/*!40000 ALTER TABLE `employeeinsurance` DISABLE KEYS */;
LOCK TABLES `employeeinsurance` WRITE;
INSERT INTO `employeeinsurance` VALUES ('2222222222','Marko','Peric',NULL,NULL,NULL,NULL,NULL,NULL,3,2),('2222222222','Ivan','Jakskhkjhkh','','2103990000000','1990-12-31 00:00:00',NULL,'hgfhfg','hfghfg',8,2),('','Marko','Cukic',NULL,'1231231331232',NULL,NULL,NULL,NULL,9,0),(NULL,'Persid Siptarovic','Stefanovski','f','1102987710074','1987-02-11 00:00:00',NULL,NULL,NULL,13,5),(NULL,'Jasar','Ahmedovski','f','0000000000000',NULL,NULL,NULL,NULL,14,5),(NULL,'Melaheta','Hasanagic','f','1102987710074','1987-02-11 00:00:00',NULL,NULL,NULL,18,5),('55555555555','dfdfshfkj','fdjkhsfdjks','m','4835789345734','0001-12-31 00:00:00',NULL,'fdsfdjfkdh ','jfdhkf dkj',21,5),('','Jasar','Krasnici','m','3113131313131','1992-12-31 00:00:00',NULL,'kosovo','pec',22,9),(NULL,'dada','dada','f','2342343434432','0001-12-31 00:00:00',NULL,'dada','adad',23,2),('','cfdg','cvcvcv','m','0000000000345','0001-12-31 00:00:00',NULL,'vcxvcx','vcxvcx',24,9),('00000000000','asdfa','afafda','m','2342342342342','2010-05-14 00:00:00',NULL,'','',26,11),('79837429874','Natalija','kovačević','f','2803983710074','1983-03-28 00:00:00',NULL,'Srbija','Beograd',27,14);
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeeinsurance` ENABLE KEYS */;

--
-- Table structure for table `employeejobtype`
--

DROP TABLE IF EXISTS `employeejobtype`;
CREATE TABLE `employeejobtype` (
  `EmployeeID` int(10) unsigned NOT NULL,
  `JobTypeID` int(10) unsigned NOT NULL,
  `EmployeeJobTypeStartDate` datetime NOT NULL,
  `EmployeeJobTypeExpirationDate` datetime default NULL,
  `EmployeeJobTypeActive` char(1) NOT NULL,
  `employeejobtypeID` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  USING BTREE (`employeejobtypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeejobtype`
--


/*!40000 ALTER TABLE `employeejobtype` DISABLE KEYS */;
LOCK TABLES `employeejobtype` WRITE;
INSERT INTO `employeejobtype` VALUES (2,2,'2008-07-27 00:00:00','2012-07-27 00:00:00','0',1),(2,6,'2008-07-27 00:00:00',NULL,'0',2),(4,1,'1996-10-12 00:00:00','2000-10-12 00:00:00','0',3),(4,6,'2000-10-10 00:00:00','2000-10-10 00:00:00','0',4),(5,1,'2010-12-31 00:00:00','2014-12-31 00:00:00','1',5),(6,1,'2010-03-20 00:00:00','2014-03-20 00:00:00','0',6),(6,6,'2010-09-10 00:00:00',NULL,'0',7),(8,1,'2006-05-01 00:00:00','2010-05-01 00:00:00','1',9),(8,4,'2008-05-01 00:00:00','2010-05-01 00:00:00','0',10),(9,1,'2010-09-01 00:00:00','2014-09-01 00:00:00','1',11),(10,17,'2009-10-30 00:00:00','2010-10-30 00:00:00','0',12),(12,2,'2010-09-01 00:00:00','2014-09-01 00:00:00','0',14),(13,1,'2010-07-17 00:00:00','2014-07-17 00:00:00','1',15),(13,8,'2010-07-17 00:00:00',NULL,'1',16),(7,11,'2010-09-11 00:00:00',NULL,'0',20),(12,2,'2010-09-26 00:00:00','2014-09-26 00:00:00','0',22),(7,11,'2010-09-10 00:00:00',NULL,'0',23),(9,2,'2006-09-01 00:00:00','2010-09-01 00:00:00','0',24),(14,5,'2000-09-01 00:00:00','2001-09-01 00:00:00','0',25),(14,4,'2002-09-01 00:00:00','2004-09-01 00:00:00','0',26),(14,3,'2006-09-01 00:00:00','2010-09-01 00:00:00','0',27),(14,2,'2010-09-01 00:00:00','2014-09-01 00:00:00','1',28);
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeejobtype` ENABLE KEYS */;

--
-- Table structure for table `employeejobtype_old`
--

DROP TABLE IF EXISTS `employeejobtype_old`;
CREATE TABLE `employeejobtype_old` (
  `EmployeeID` int(10) unsigned NOT NULL default '0',
  `JobTypeID` int(10) unsigned NOT NULL default '0',
  `EmployeeJobTypeStartDate` datetime NOT NULL,
  `EmployeeJobTypeExpirationDate` datetime default NULL,
  `EmployeeJobTypeActive` char(1) collate utf8_unicode_ci NOT NULL default '0',
  PRIMARY KEY  USING BTREE (`EmployeeID`,`JobTypeID`),
  KEY `JobTypeID` (`JobTypeID`),
  CONSTRAINT `EmployeeJobType_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EmployeeJobType_ibfk_2` FOREIGN KEY (`JobTypeID`) REFERENCES `jobtype` (`JobTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employeejobtype_old`
--


/*!40000 ALTER TABLE `employeejobtype_old` DISABLE KEYS */;
LOCK TABLES `employeejobtype_old` WRITE;
INSERT INTO `employeejobtype_old` VALUES (2,2,'2008-07-27 00:00:00','2012-07-27 00:00:00','0'),(2,6,'2008-07-27 00:00:00',NULL,'0'),(4,1,'1996-10-12 00:00:00','2000-10-12 00:00:00','0'),(4,6,'2000-10-10 00:00:00','2000-10-10 00:00:00','0'),(5,1,'2010-12-31 00:00:00','2014-12-31 00:00:00','1'),(6,1,'2010-03-20 00:00:00','2014-03-20 00:00:00','0'),(6,6,'2010-12-31 00:00:00',NULL,'0'),(7,1,'2006-05-13 00:00:00','2010-05-13 00:00:00','1'),(8,1,'2006-05-01 00:00:00','2010-05-01 00:00:00','1'),(8,4,'2008-05-01 00:00:00','2010-05-01 00:00:00','0'),(9,1,'2010-01-01 00:00:00','2014-01-01 00:00:00','0'),(10,17,'2009-10-30 00:00:00','2010-10-30 00:00:00','0'),(12,1,'2010-05-19 00:00:00','2014-05-19 00:00:00','1'),(12,2,'2010-05-19 00:00:00','2014-05-19 00:00:00','0'),(13,1,'2010-07-17 00:00:00','2014-07-17 00:00:00','1'),(13,8,'2010-07-17 00:00:00',NULL,'1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeejobtype_old` ENABLE KEYS */;

--
-- Table structure for table `employeepregnancy`
--

DROP TABLE IF EXISTS `employeepregnancy`;
CREATE TABLE `employeepregnancy` (
  `EmployeeID` int(11) NOT NULL default '0',
  `EmployeePregnancyStartDate` date default NULL,
  `EmployeePregnancyEndDate` date default NULL,
  `EmployeePregnancyID` int(11) NOT NULL default '0' COMMENT 'Redni broj porodiljskog za pojedinactnog zaposlenog',
  PRIMARY KEY  USING BTREE (`EmployeeID`,`EmployeePregnancyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Podaci o porodiljskom';

--
-- Dumping data for table `employeepregnancy`
--


/*!40000 ALTER TABLE `employeepregnancy` DISABLE KEYS */;
LOCK TABLES `employeepregnancy` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeepregnancy` ENABLE KEYS */;

--
-- Table structure for table `employeereportcache`
--

DROP TABLE IF EXISTS `employeereportcache`;
CREATE TABLE `employeereportcache` (
  `EmployeeID` int(10) unsigned NOT NULL default '0',
  `ReportCacheID` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`EmployeeID`,`ReportCacheID`),
  KEY `ReportCacheID` (`ReportCacheID`),
  CONSTRAINT `EmployeeReportCache_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EmployeeReportCache_ibfk_2` FOREIGN KEY (`ReportCacheID`) REFERENCES `reportcache` (`ReportCacheID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employeereportcache`
--


/*!40000 ALTER TABLE `employeereportcache` DISABLE KEYS */;
LOCK TABLES `employeereportcache` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeereportcache` ENABLE KEYS */;

--
-- Table structure for table `employeevacation`
--

DROP TABLE IF EXISTS `employeevacation`;
CREATE TABLE `employeevacation` (
  `EmployeeID` int(11) NOT NULL default '0',
  `EmployeeVacationVacationID` int(11) NOT NULL default '0' COMMENT 'Redni broj godisnjeg odmora za zaposlenog',
  `EmployeeVacationVacationStartDate` date default NULL,
  `EmployeeVacationVacationEndDate` date default NULL,
  PRIMARY KEY  USING BTREE (`EmployeeID`,`EmployeeVacationVacationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Podaci o godisnjim odmorima';

--
-- Dumping data for table `employeevacation`
--


/*!40000 ALTER TABLE `employeevacation` DISABLE KEYS */;
LOCK TABLES `employeevacation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeevacation` ENABLE KEYS */;

--
-- Table structure for table `employeeworkstagnation`
--

DROP TABLE IF EXISTS `employeeworkstagnation`;
CREATE TABLE `employeeworkstagnation` (
  `EmployeeID` int(10) unsigned NOT NULL,
  `EmployeeWorkStagnationStartDate` datetime NOT NULL,
  `EmployeeWorkStagnationEndDate` datetime NOT NULL,
  `EmployeeWorkStagnationID` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  USING BTREE (`EmployeeWorkStagnationID`,`EmployeeWorkStagnationEndDate`,`EmployeeWorkStagnationStartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela sa evidencijom stagnacije staza, tj. pauze staza';

--
-- Dumping data for table `employeeworkstagnation`
--


/*!40000 ALTER TABLE `employeeworkstagnation` DISABLE KEYS */;
LOCK TABLES `employeeworkstagnation` WRITE;
INSERT INTO `employeeworkstagnation` VALUES (0,'2010-07-06 00:00:00','2010-07-06 00:00:00',45),(0,'2010-07-07 00:00:00','2010-07-07 00:00:00',46),(0,'2010-07-08 00:00:00','2010-07-08 00:00:00',47),(0,'2010-07-08 00:00:00','2010-07-08 00:00:00',49),(0,'2010-07-08 00:00:00','2010-07-08 00:00:00',50),(7,'2010-08-05 00:00:00','2010-08-27 00:00:00',52),(9,'2010-09-10 00:00:00','2010-09-30 00:00:00',53),(9,'2010-09-17 00:00:00','2010-09-30 00:00:00',55),(6,'2007-09-01 00:00:00','2008-09-06 00:00:00',56);
UNLOCK TABLES;
/*!40000 ALTER TABLE `employeeworkstagnation` ENABLE KEYS */;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `JobID` int(10) unsigned NOT NULL auto_increment,
  `JobTitle` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job`
--


/*!40000 ALTER TABLE `job` DISABLE KEYS */;
LOCK TABLES `job` WRITE;
INSERT INTO `job` VALUES (1,'Nastavno osoblje'),(2,'Administrativno osoblje'),(3,'Pomocno osoblje'),(4,'Ostalo osoblje');
UNLOCK TABLES;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;

--
-- Table structure for table `jobtype`
--

DROP TABLE IF EXISTS `jobtype`;
CREATE TABLE `jobtype` (
  `JobID` int(10) unsigned default NULL,
  `JobTypeID` int(10) unsigned NOT NULL auto_increment,
  `JobTypeTitle` text collate utf8_unicode_ci NOT NULL,
  `JobTypeDuration` int(10) NOT NULL default '-1',
  `JobTypeBasePoints` int(10) NOT NULL default '0',
  `JobTypeCoeficient` double default '0',
  PRIMARY KEY  (`JobTypeID`),
  KEY `index_JobType_JobID` (`JobID`),
  CONSTRAINT `JobType_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobtype`
--


/*!40000 ALTER TABLE `jobtype` DISABLE KEYS */;
LOCK TABLES `jobtype` WRITE;
INSERT INTO `jobtype` VALUES (1,1,'Redovni profesor',4,0,10),(1,2,'Vanredni profesor',4,0,5),(1,3,'Docent',4,0,3),(1,4,'Asistent',2,0,0),(1,5,'Asistent pripravnik',1,0,0),(2,6,'Sef racunovodstva',0,0,10),(4,7,'Kurir',1,0,0),(2,8,'Računovođa',0,0,0),(2,9,'Sekretar',0,0,0),(3,10,'Domar',0,0,0),(3,11,'Tetkica',0,0,0),(3,12,'Ložač',0,0,0),(4,13,'Bibliotekar',0,0,0),(4,14,'Neka nova pozicija',2,0,0),(4,17,'Neka test pozicija',1,0,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jobtype` ENABLE KEYS */;

--
-- Table structure for table `jobtypereport`
--

DROP TABLE IF EXISTS `jobtypereport`;
CREATE TABLE `jobtypereport` (
  `JobTypeID` int(10) unsigned NOT NULL default '0',
  `ReportID` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`JobTypeID`,`ReportID`),
  KEY `ReportID` (`ReportID`),
  CONSTRAINT `JobTypeReport_ibfk_1` FOREIGN KEY (`JobTypeID`) REFERENCES `jobtype` (`JobTypeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `JobTypeReport_ibfk_2` FOREIGN KEY (`ReportID`) REFERENCES `report` (`ReportID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobtypereport`
--


/*!40000 ALTER TABLE `jobtypereport` DISABLE KEYS */;
LOCK TABLES `jobtypereport` WRITE;
INSERT INTO `jobtypereport` VALUES (6,777),(6,1000);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jobtypereport` ENABLE KEYS */;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `ReportID` int(10) unsigned NOT NULL default '0',
  `ReportTitle` text collate utf8_unicode_ci NOT NULL,
  `ReportDescription` text collate utf8_unicode_ci NOT NULL,
  `ReportFOFile` text collate utf8_unicode_ci NOT NULL,
  `ReportFieldsFile` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report`
--


/*!40000 ALTER TABLE `report` DISABLE KEYS */;
LOCK TABLES `report` WRITE;
INSERT INTO `report` VALUES (777,'OdlukaOZvanju','Ovo je neki opis za ovo','/org/foment/gem/reports/OdlukaOZvanju.fo','/org/foment/gem/reports/OdlukaOZvanju.xml'),(1000,'<joliage3:sql><joliage3:sql.query>SELECT * FROM Employee WHERE EmployeeID = <joliage3:var.EmployeeID /></joliage3:sql.query><joliage3:sql.echo.rows><joliage3:sql.var.EmployeeSurname />, <joliage3:sql.var.EmployeeFirstName /></joliage3:sql.echo.rows></joliage3:sql>: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/org/foment/gem/reports/PodaciOZaposlenom.fo','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

--
-- Table structure for table `reportcache`
--

DROP TABLE IF EXISTS `reportcache`;
CREATE TABLE `reportcache` (
  `ReportCacheID` int(10) unsigned NOT NULL,
  `ReportCacheTimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `ReportCacheTitle` text collate utf8_unicode_ci NOT NULL,
  `ReportCacheDescription` text collate utf8_unicode_ci NOT NULL,
  `ReportCacheFOFile` text collate utf8_unicode_ci NOT NULL,
  `ReportCacheFieldsFile` text collate utf8_unicode_ci NOT NULL,
  `ReportCacheFieldValues` text collate utf8_unicode_ci,
  PRIMARY KEY  (`ReportCacheID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reportcache`
--


/*!40000 ALTER TABLE `reportcache` DISABLE KEYS */;
LOCK TABLES `reportcache` WRITE;
INSERT INTO `reportcache` VALUES (0,'2006-12-09 11:24:44','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.0','',''),(1,'2006-12-09 11:31:32','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.1','',''),(2,'2006-12-09 11:53:45','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.2','',''),(3,'2006-12-09 12:01:27','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.3','',''),(4,'2006-12-09 12:02:41','OdlukaOZvanju','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/OdlukaOZvanju.fo.4','/home/ivan/.foment/Gem/cache/OdlukaOZvanju.xml.4','text2=%D0%98%D0%B7%D0%B1%D0%BE%D1%80%D0%BD%D0%BE+%D0%B2%D0%B5%D1%9B%D0%B5+%D1%98%D0%B5+%D0%BD%D0%B0+%D0%BF%D1%80%D0%B5%D0%B4%D0%BB%D0%BE%D0%B3+%D0%9A%D0%BE%D0%BC%D0%B8%D1%81%D0%B8%D1%98%D0%B5+%D0%B7%D0%B0+%D0%BF%D1%80%D0%B8%D0%BF%D1%80%D0%B5%D0%BC%D1%83+%D0%B8%D0%B7%D0%B2%D0%B5%D1%88%D1%82%D0%B0%D1%98%D0%B0+%D0%BE+%D0%BF%D1%80%D0%B8%D1%98%D0%B0%D0%B2%D1%99%D0%B5%D0%BD%D0%BE%D0%BC+%D0%BA%D0%B0%D0%BD%D0%B4%D0%B8%D0%B4%D0%B0%D1%82%D1%83+%D0%B7%D0%B0+%D0%B8%D0%B7%D0%B1%D0%BE%D1%80+%D1%83+%D0%B7%D0%B2%D0%B0%D1%9A%D0%B5+%22%D0%B4%D0%BE%D1%86%D0%B5%D0%BD%D1%82+%D0%B7%D0%B0+%D1%83%D0%BC%D0%B5%D1%82%D0%BD%D0%B8%D1%87%D0%BA%D1%83+%D0%BE%D0%B1%D0%BB%D0%B0%D1%81%D1%82+%D1%81%D0%BB%D0%B8%D0%BA%D0%B0%D1%80%D1%81%D1%82%D0%B2%D0%BE%22+%D0%B4%D0%BE%D0%BD%D0%B5%D0%BB%D0%BE+%D0%B3%D0%BE%D1%80%D0%B5+%D0%BD%D0%B0%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D1%83+%D0%BE%D0%B4%D0%BB%D1%83%D0%BA%D1%83+%D1%81%D0%B0+%D0%B2%D0%B5%D1%9B%D0%B8%D0%BD%D0%BE%D0%BC+%D0%B3%D0%BB%D0%B0%D1%81%D0%BE%D0%B2%D0%B0+%D1%83%D0%BA%D1%83%D0%BF%D0%BD%D0%BE%D0%B3+%D0%B1%D1%80%D0%BE%D1%98%D0%B0+%D1%87%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B0+%D0%BE%D0%B2%D0%BE%D0%B3+%D0%92%D0%B5%D1%9B%D0%B0+%D0%BA%D0%BE%D1%98%D0%B8+%D0%B8%D0%BC%D0%B0%D1%98%D1%83+%D0%BF%D1%80%D0%B0%D0%B2%D0%BE+%D0%B4%D0%B0+%D0%BE%D0%B4%D0%BB%D1%83%D1%87%D1%83%D1%98%D1%83.+%0A%0A%D0%A1%D0%B5%D0%B4%D0%BD%D0%B8%D1%86%D0%B8+%D1%98%D0%B5%2C+%D0%BE%D0%B4+%D1%83%D0%BA%D1%83%D0%BF%D0%BD%D0%BE+_+%D1%87%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B0%2C+%D0%BA%D0%BE%D1%98%D0%B8+%D0%B8%D0%BC%D0%B0%D1%98%D1%83+%D0%BF%D1%80%D0%B0%D0%B2%D0%BE+%D0%B4%D0%B0+%D0%BE%D0%B4%D0%BB%D1%83%D1%87%D1%83%D1%98%D1%83%2C+%D0%BF%D1%80%D0%B8%D1%81%D1%83%D1%81%D1%82%D0%B2%D0%BE%D0%B2%D0%B0%D0%BB%D0%BE+_+%D1%87%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B0%2C+%D0%BE%D0%B4+%D0%BA%D0%BE%D1%98%D0%B8%D1%85+%D1%98%D0%B5+_+%D0%B3%D0%BB%D0%B0%D1%81%D0%B0%D0%BB%D0%BE+%22%D0%97%D0%90%22.+&title1=%D0%9E%D0%94%D0%9B%D0%A3%D0%9A%D0%A3&sub=%D0%94%D0%95%D0%9A%D0%90%D0%9D%0A%D0%A4%D0%B0%D0%BA%D1%83%D0%BB%D1%82%D0%B5%D1%82%D0%B0+%D0%BB%D0%B8%D0%BA%D0%BE%D0%B2%D0%BD%D0%B8%D1%85+%D1%83%D0%BC%D0%B5%D1%82%D0%BD%D0%BE%D1%81%D1%82%D0%B8%0A%D0%9C%D1%80+%D0%9D%D0%B8%D0%BA%D0%BE%D0%BB%D0%B0+%D0%92%D1%83%D0%BA%D0%BE%D1%81%D0%B0%D0%B2%D1%99%D0%B5%D0%B2%D0%B8%D1%9B%2C+%D1%80%D0%B5%D0%B4.+%D0%BF%D1%80%D0%BE%D1%84&header=%D0%9D%D0%B0+%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D1%83+%D1%87%D0%BB%D0%B0%D0%BD%D0%B0+63%2C+64+%D0%B8+65+%D0%97%D0%B0%D0%BA%D0%BE%D0%BD%D0%B0+%D0%BE+%D1%83%D0%BD%D0%B8%D0%B2%D0%B5%D1%80%D0%B7%D0%B8%D1%82%D0%B5%D1%82%D1%83+%D0%B8+%D1%87%D0%BB%D0%B0%D0%BD%D0%B0+121+%D0%A1%D1%82%D0%B0%D1%82%D1%83%D1%82%D0%B0+%D0%A4%D0%B0%D0%BA%D1%83%D0%BB%D1%82%D0%B5%D1%82%D0%B0+%D0%BB%D0%B8%D0%BA%D0%BE%D0%B2%D0%BD%D0%B8%D1%85+%D1%83%D0%BC%D0%B5%D1%82%D0%BD%D0%BE%D1%81%D1%82%D0%B8+%D1%83+%D0%91%D0%B5%D0%BE%D0%B3%D1%80%D0%B0%D0%B4%D1%83%2C+%D0%98%D0%B7%D0%B1%D0%BE%D1%80%D0%BD%D0%BE+%D0%B2%D0%B5%D1%9B%D0%B5+%D0%A4%D0%B0%D0%BA%D1%83%D0%BB%D1%82%D0%B5%D1%82%D0%B0%2C+%D0%B4%D0%B0%D0%BD%D0%B0+_.+_.+_.+%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B5+%D0%B4%D0%BE%D0%BD%D0%B5%D0%BB%D0%BE+%D1%98%D0%B5+%D1%81%D0%BB%D0%B5%D0%B4%D0%B5%D1%9B%D1%83+&title2=%D0%9E%D0%B1%D1%80%D0%B0%D0%B7%D0%BB%D0%BE%D0%B6%D0%B5%D1%9A%D0%B5&text1=%D0%9C%D1%80+%D0%97%D0%BE%D1%80%D0%B0%D0%BD+%D0%A2%D0%BE%D0%B4%D0%BE%D1%80%D0%BE%D0%B2%D0%B8%D1%9B+%D0%B1%D0%B8%D1%80%D0%B0+%D1%81%D0%B5+%D1%83+%D0%B7%D0%B2%D0%B0%D1%9A%D0%B5+%22%D0%B4%D0%BE%D1%86%D0%B5%D0%BD%D1%82+%D0%B7%D0%B0+%D1%83%D0%BC%D0%B5%D1%82%D0%BD%D0%B8%D1%87%D0%BA%D1%83+%D0%BE%D0%B1%D0%BB%D0%B0%D1%81%D1%82+%D1%81%D0%BB%D0%B8%D0%BA%D0%B0%D1%80%D1%81%D1%82%D0%B2%D0%BE%22+%D0%BD%D0%B0+%D0%BF%D0%B5%D1%80%D0%B8%D0%BE%D0%B4+%D0%BE%D0%B4+%D0%BF%D0%B5%D1%82+%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B0.'),(5,'2006-12-09 12:19:30','OdlukaOZvanju','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/OdlukaOZvanju.fo.5','/home/ivan/.foment/Gem/cache/OdlukaOZvanju.xml.5','text2=%D0%98%D0%B7%D0%B1%D0%BE%D1%80%D0%BD%D0%BE+%D0%B2%D0%B5%D1%9B%D0%B5+%D1%98%D0%B5+%D0%BD%D0%B0+%D0%BF%D1%80%D0%B5%D0%B4%D0%BB%D0%BE%D0%B3+%D0%9A%D0%BE%D0%BC%D0%B8%D1%81%D0%B8%D1%98%D0%B5+%D0%B7%D0%B0+%D0%BF%D1%80%D0%B8%D0%BF%D1%80%D0%B5%D0%BC%D1%83+%D0%B8%D0%B7%D0%B2%D0%B5%D1%88%D1%82%D0%B0%D1%98%D0%B0+%D0%BE+%D0%BF%D1%80%D0%B8%D1%98%D0%B0%D0%B2%D1%99%D0%B5%D0%BD%D0%BE%D0%BC+%D0%BA%D0%B0%D0%BD%D0%B4%D0%B8%D0%B4%D0%B0%D1%82%D1%83+%D0%B7%D0%B0+%D0%B8%D0%B7%D0%B1%D0%BE%D1%80+%D1%83+%D0%B7%D0%B2%D0%B0%D1%9A%D0%B5+%22%D0%B4%D0%BE%D1%86%D0%B5%D0%BD%D1%82+%D0%B7%D0%B0+%D1%83%D0%BC%D0%B5%D1%82%D0%BD%D0%B8%D1%87%D0%BA%D1%83+%D0%BE%D0%B1%D0%BB%D0%B0%D1%81%D1%82+%D1%81%D0%BB%D0%B8%D0%BA%D0%B0%D1%80%D1%81%D1%82%D0%B2%D0%BE%22+%D0%B4%D0%BE%D0%BD%D0%B5%D0%BB%D0%BE+%D0%B3%D0%BE%D1%80%D0%B5+%D0%BD%D0%B0%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D1%83+%D0%BE%D0%B4%D0%BB%D1%83%D0%BA%D1%83+%D1%81%D0%B0+%D0%B2%D0%B5%D1%9B%D0%B8%D0%BD%D0%BE%D0%BC+%D0%B3%D0%BB%D0%B0%D1%81%D0%BE%D0%B2%D0%B0+%D1%83%D0%BA%D1%83%D0%BF%D0%BD%D0%BE%D0%B3+%D0%B1%D1%80%D0%BE%D1%98%D0%B0+%D1%87%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B0+%D0%BE%D0%B2%D0%BE%D0%B3+%D0%92%D0%B5%D1%9B%D0%B0+%D0%BA%D0%BE%D1%98%D0%B8+%D0%B8%D0%BC%D0%B0%D1%98%D1%83+%D0%BF%D1%80%D0%B0%D0%B2%D0%BE+%D0%B4%D0%B0+%D0%BE%D0%B4%D0%BB%D1%83%D1%87%D1%83%D1%98%D1%83.+%0A%0A%D0%A1%D0%B5%D0%B4%D0%BD%D0%B8%D1%86%D0%B8+%D1%98%D0%B5%2C+%D0%BE%D0%B4+%D1%83%D0%BA%D1%83%D0%BF%D0%BD%D0%BE+_+%D1%87%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B0%2C+%D0%BA%D0%BE%D1%98%D0%B8+%D0%B8%D0%BC%D0%B0%D1%98%D1%83+%D0%BF%D1%80%D0%B0%D0%B2%D0%BE+%D0%B4%D0%B0+%D0%BE%D0%B4%D0%BB%D1%83%D1%87%D1%83%D1%98%D1%83%2C+%D0%BF%D1%80%D0%B8%D1%81%D1%83%D1%81%D1%82%D0%B2%D0%BE%D0%B2%D0%B0%D0%BB%D0%BE+_+%D1%87%D0%BB%D0%B0%D0%BD%D0%BE%D0%B2%D0%B0%2C+%D0%BE%D0%B4+%D0%BA%D0%BE%D1%98%D0%B8%D1%85+%D1%98%D0%B5+_+%D0%B3%D0%BB%D0%B0%D1%81%D0%B0%D0%BB%D0%BE+%22%D0%97%D0%90%22.+ppppppppppppppp&title1=%D0%9E%D0%94%D0%9B%D0%A3%D0%9A%D0%A3pppppppppppp&sub=%D0%94%D0%95%D0%9A%D0%90%D0%9D%0A%D0%A4%D0%B0%D0%BA%D1%83%D0%BB%D1%82%D0%B5%D1%82%D0%B0+%D0%BB%D0%B8%D0%BA%D0%BE%D0%B2%D0%BD%D0%B8%D1%85+%D1%83%D0%BC%D0%B5%D1%82%D0%BD%D0%BE%D1%81%D1%82%D0%B8%0A%D0%9C%D1%80+%D0%9D%D0%B8%D0%BA%D0%BE%D0%BB%D0%B0+%D0%92%D1%83%D0%BA%D0%BE%D1%81%D0%B0%D0%B2%D1%99%D0%B5%D0%B2%D0%B8%D1%9B%2C+%D1%80%D0%B5%D0%B4.+%D0%BF%D1%80%D0%BE%D1%84&header=%D0%9D%D0%B0+%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D1%83+%D1%87%D0%BB%D0%B0%D0%BD%D0%B0+63%2C+64+%D0%B8+65+%D0%97%D0%B0%D0%BA%D0%BE%D0%BD%D0%B0+%D0%BE+%D1%83%D0%BD%D0%B8%D0%B2%D0%B5%D1%80%D0%B7%D0%B8%D1%82%D0%B5%D1%82%D1%83+%D0%B8+%D1%87%D0%BB%D0%B0%D0%BD%D0%B0+121+%D0%A1%D1%82%D0%B0%D1%82%D1%83%D1%82%D0%B0+%D0%A4%D0%B0%D0%BA%D1%83%D0%BB%D1%82%D0%B5%D1%82%D0%B0+%D0%BB%D0%B8%D0%BA%D0%BE%D0%B2%D0%BD%D0%B8%D1%85+%D1%83%D0%BC%D0%B5%D1%82%D0%BD%D0%BE%D1%81%D1%82%D0%B8+%D1%83+%D0%91%D0%B5%D0%BE%D0%B3%D1%80%D0%B0%D0%B4%D1%83%2C+%D0%98%D0%B7%D0%B1%D0%BE%D1%80%D0%BD%D0%BE+%D0%B2%D0%B5%D1%9B%D0%B5+%D0%A4%D0%B0%D0%BA%D1%83%D0%BB%D1%82%D0%B5%D1%82%D0%B0%2C+%D0%B4%D0%B0%D0%BD%D0%B0+_.+_.+_.+%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B5+%D0%B4%D0%BE%D0%BD%D0%B5%D0%BB%D0%BE+%D1%98%D0%B5+%D1%81%D0%BB%D0%B5%D0%B4%D0%B5%D1%9B%D1%83+ppppppppppppp&title2=%D0%9E%D0%B1%D1%80%D0%B0%D0%B7%D0%BB%D0%BE%D0%B6%D0%B5%D1%9A%D0%B5pppppppppppp&text1=%D0%9C%D1%80+%D0%97%D0%BE%D1%80%D0%B0%D0%BD+%D0%A2%D0%BE%D0%B4%D0%BE%D1%80%D0%BE%D0%B2%D0%B8%D1%9B+%D0%B1%D0%B8%D1%80%D0%B0+%D1%81%D0%B5+%D1%83+%D0%B7%D0%B2%D0%B0%D1%9A%D0%B5+%22%D0%B4%D0%BE%D1%86%D0%B5%D0%BD%D1%82+%D0%B7%D0%B0+%D1%83%D0%BC%D0%B5%D1%82%D0%BD%D0%B8%D1%87%D0%BA%D1%83+%D0%BE%D0%B1%D0%BB%D0%B0%D1%81%D1%82+%D1%81%D0%BB%D0%B8%D0%BA%D0%B0%D1%80%D1%81%D1%82%D0%B2%D0%BE%22+%D0%BD%D0%B0+%D0%BF%D0%B5%D1%80%D0%B8%D0%BE%D0%B4+%D0%BE%D0%B4+%D0%BF%D0%B5%D1%82+%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B0.ppppppppppppp'),(6,'2006-12-09 01:20:56','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.6','',''),(7,'2006-12-09 01:32:41','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.7','',''),(8,'2006-12-09 01:32:41','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.8','',''),(9,'2006-12-09 01:32:41','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.9','',''),(10,'2006-12-09 01:32:41','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.10','',''),(11,'2006-12-09 01:32:41','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.11','',''),(12,'2006-12-09 01:32:41','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.12','',''),(13,'2006-12-09 01:32:41','ÄŒukiÄ‡, Ivan: Osnovni podaci o zaposlenom','Ovo je neki opis za ovo','/home/ivan/.foment/Gem/cache/PodaciOZaposlenom.fo.13','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `reportcache` ENABLE KEYS */;

--
-- Table structure for table `sciencedomain`
--

DROP TABLE IF EXISTS `sciencedomain`;
CREATE TABLE `sciencedomain` (
  `sciencedomainID` int(10) unsigned NOT NULL auto_increment,
  `sciencedomainTitle` varchar(255) NOT NULL,
  PRIMARY KEY  USING BTREE (`sciencedomainID`),
  UNIQUE KEY `sciencedomainTitle` (`sciencedomainTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Podaci o uzoj naucnoj oblasti';

--
-- Dumping data for table `sciencedomain`
--


/*!40000 ALTER TABLE `sciencedomain` DISABLE KEYS */;
LOCK TABLES `sciencedomain` WRITE;
INSERT INTO `sciencedomain` VALUES (3,'Informacioni Sistemi'),(1,'Programiranje'),(2,'Vestacka inteligencija');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sciencedomain` ENABLE KEYS */;

--
-- Table structure for table `sciencedomaincourses`
--

DROP TABLE IF EXISTS `sciencedomaincourses`;
CREATE TABLE `sciencedomaincourses` (
  `courseID` int(10) unsigned NOT NULL,
  `sciencedomainID` int(10) unsigned NOT NULL,
  `departmentID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`courseID`,`sciencedomainID`,`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='predmet - uza naucna oblast - katedra. Tabela predstavlja re';

--
-- Dumping data for table `sciencedomaincourses`
--


/*!40000 ALTER TABLE `sciencedomaincourses` DISABLE KEYS */;
LOCK TABLES `sciencedomaincourses` WRITE;
INSERT INTO `sciencedomaincourses` VALUES (1,1,1),(2,1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `sciencedomaincourses` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL auto_increment,
  `UserFullName` varchar(255) NOT NULL,
  `UserUsername` varchar(32) NOT NULL,
  `UserPassword` varchar(32) NOT NULL,
  `UserPriv_AllAccess` char(1) NOT NULL default '0',
  `UserPriv_ReadOnly` char(1) NOT NULL default '0',
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela o podacima o korisnicima';

--
-- Dumping data for table `user`
--


/*!40000 ALTER TABLE `user` DISABLE KEYS */;
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'Dusan Trtica','dusan','ab56b4d92b40713acc5af89985d4b786','0','0'),(2,'Aleksandar Jaksic','jaksa','098f6bcd4621d373cade4e832627b4f6','1','1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

