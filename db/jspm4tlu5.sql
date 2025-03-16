-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: jspm4tlu5
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','http://localhost:8080/jspm4tlu5/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/jspm4tlu5/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/jspm4tlu5/upload/picture3.jpg'),(6,'homepage',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616302240914 DEFAULT CHARSET=utf8 COMMENT='试卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1616302240913,'2021-03-21 04:50:39','英语考试',60,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616302307106 DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1616302272747,'2021-03-21 04:51:12',1616302240913,'英语考试','sdgsgsgsg','[{\"text\":\"sd\",\"code\":\"A\"},{\"text\":\"fsdf\",\"code\":\"B\"},{\"text\":\"sfdf\",\"code\":\"C\"},{\"text\":\"sfff\",\"code\":\"D\"}]',5,'A','sdfsfsfsgsg',0,1),(1616302307105,'2021-03-21 04:51:46',1616302240913,'英语考试','sdfsfsgsgg','[{\"text\":\"sdfsf\",\"code\":\"A\"},{\"text\":\"sdfsf\",\"code\":\"B\"},{\"text\":\"sdf\",\"code\":\"C\"},{\"text\":\"sdfsf\",\"code\":\"D\"}]',5,'A,D','sdfssgsgs',1,2);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616302358726 DEFAULT CHARSET=utf8 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
INSERT INTO `examrecord` VALUES (1616302351160,'2021-03-21 04:52:30',11,NULL,1616302240913,'英语考试',1616302272747,'sdgsgsgsg','[{\"text\":\"sd\",\"code\":\"A\"},{\"text\":\"fsdf\",\"code\":\"B\"},{\"text\":\"sfdf\",\"code\":\"C\"},{\"text\":\"sfff\",\"code\":\"D\"}]',5,'A','sdfsfsfsgsg',5,'A'),(1616302358725,'2021-03-21 04:52:38',11,NULL,1616302240913,'英语考试',1616302307105,'sdfsfsgsgg','[{\"text\":\"sdfsf\",\"code\":\"A\"},{\"text\":\"sdfsf\",\"code\":\"B\"},{\"text\":\"sdf\",\"code\":\"C\"},{\"text\":\"sdfsf\",\"code\":\"D\"}]',5,'A,D','sdfssgsgs',0,'A,B');
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gonggaoxinxi`
--

DROP TABLE IF EXISTS `gonggaoxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gonggaoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `gonggaoneirong` longtext COMMENT '公告内容',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='公告信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gonggaoxinxi`
--

LOCK TABLES `gonggaoxinxi` WRITE;
/*!40000 ALTER TABLE `gonggaoxinxi` DISABLE KEYS */;
INSERT INTO `gonggaoxinxi` VALUES (31,'2021-03-21 04:45:59','标题1','http://localhost:8080/jspm4tlu5/upload/gonggaoxinxi_tupian1.jpg','公告内容1','2021-03-21'),(32,'2021-03-21 04:46:00','标题2','http://localhost:8080/jspm4tlu5/upload/gonggaoxinxi_tupian2.jpg','公告内容2','2021-03-21'),(33,'2021-03-21 04:46:00','标题3','http://localhost:8080/jspm4tlu5/upload/gonggaoxinxi_tupian3.jpg','公告内容3','2021-03-21'),(34,'2021-03-21 04:46:00','标题4','http://localhost:8080/jspm4tlu5/upload/gonggaoxinxi_tupian4.jpg','公告内容4','2021-03-21'),(35,'2021-03-21 04:46:00','标题5','http://localhost:8080/jspm4tlu5/upload/gonggaoxinxi_tupian5.jpg','公告内容5','2021-03-21'),(36,'2021-03-21 04:46:00','标题6','http://localhost:8080/jspm4tlu5/upload/gonggaoxinxi_tupian6.jpg','公告内容6','2021-03-21');
/*!40000 ALTER TABLE `gonggaoxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshi`
--

DROP TABLE IF EXISTS `jiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshigonghao` varchar(200) NOT NULL COMMENT '教师工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxifangshi` varchar(200) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshigonghao` (`jiaoshigonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshi`
--

LOCK TABLES `jiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshi` VALUES (21,'2021-03-21 04:45:59','教师1','123456','教师姓名1','http://localhost:8080/jspm4tlu5/upload/jiaoshi_touxiang1.jpg','男','13823888881'),(22,'2021-03-21 04:45:59','教师2','123456','教师姓名2','http://localhost:8080/jspm4tlu5/upload/jiaoshi_touxiang2.jpg','男','13823888882'),(23,'2021-03-21 04:45:59','教师3','123456','教师姓名3','http://localhost:8080/jspm4tlu5/upload/jiaoshi_touxiang3.jpg','男','13823888883'),(24,'2021-03-21 04:45:59','教师4','123456','教师姓名4','http://localhost:8080/jspm4tlu5/upload/jiaoshi_touxiang4.jpg','男','13823888884'),(25,'2021-03-21 04:45:59','教师5','123456','教师姓名5','http://localhost:8080/jspm4tlu5/upload/jiaoshi_touxiang5.jpg','男','13823888885'),(26,'2021-03-21 04:45:59','教师6','123456','教师姓名6','http://localhost:8080/jspm4tlu5/upload/jiaoshi_touxiang6.jpg','男','13823888886');
/*!40000 ALTER TABLE `jiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengxinxi`
--

DROP TABLE IF EXISTS `kechengxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `xueshi` varchar(200) DEFAULT NULL COMMENT '学时',
  `kechengneirong` varchar(200) DEFAULT NULL COMMENT '课程内容',
  `kechengjianjie` longtext COMMENT '课程简介',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616302214414 DEFAULT CHARSET=utf8 COMMENT='课程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengxinxi`
--

LOCK TABLES `kechengxinxi` WRITE;
/*!40000 ALTER TABLE `kechengxinxi` DISABLE KEYS */;
INSERT INTO `kechengxinxi` VALUES (41,'2021-03-21 04:46:00','课程名称1','http://localhost:8080/jspm4tlu5/upload/kechengxinxi_tupian1.jpg','学时1','','课程简介1','教师工号1','教师姓名1'),(42,'2021-03-21 04:46:00','课程名称2','http://localhost:8080/jspm4tlu5/upload/kechengxinxi_tupian2.jpg','学时2','','课程简介2','教师工号2','教师姓名2'),(43,'2021-03-21 04:46:00','课程名称3','http://localhost:8080/jspm4tlu5/upload/kechengxinxi_tupian3.jpg','学时3','','课程简介3','教师工号3','教师姓名3'),(44,'2021-03-21 04:46:00','课程名称4','http://localhost:8080/jspm4tlu5/upload/kechengxinxi_tupian4.jpg','学时4','','课程简介4','教师工号4','教师姓名4'),(45,'2021-03-21 04:46:00','课程名称5','http://localhost:8080/jspm4tlu5/upload/kechengxinxi_tupian5.jpg','学时5','','课程简介5','教师工号5','教师姓名5'),(46,'2021-03-21 04:46:00','课程名称6','http://localhost:8080/jspm4tlu5/upload/kechengxinxi_tupian6.jpg','学时6','','课程简介6','教师工号6','教师姓名6'),(1616302214413,'2021-03-21 04:50:14','英语','http://localhost:8080/jspm4tlu5/upload/1616302196032.jpg','8学时','http://localhost:8080/jspm4tlu5/file/download?fileName=1616302208152.doc','sdsgsgsdgsg','教师1','教师姓名1');
/*!40000 ALTER TABLE `kechengxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '留言人id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616302127984 DEFAULT CHARSET=utf8 COMMENT='留言板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (81,'2021-03-21 04:46:00',1,'用户名1','留言内容1','回复内容1'),(82,'2021-03-21 04:46:00',2,'用户名2','留言内容2','回复内容2'),(83,'2021-03-21 04:46:00',3,'用户名3','留言内容3','回复内容3'),(84,'2021-03-21 04:46:00',4,'用户名4','留言内容4','回复内容4'),(85,'2021-03-21 04:46:00',5,'用户名5','留言内容5','回复内容5'),(86,'2021-03-21 04:46:00',6,'用户名6','留言内容6','回复内容6'),(1616302027668,'2021-03-21 04:47:06',11,'学生1','sdfsf','sdgsgsgg'),(1616302127983,'2021-03-21 04:48:47',11,'学生1','sdsgsg',NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,11,'学生1','xuesheng','学生','7sgkvzjarcs5mugzsgg0w4ex5vxwda80','2021-03-21 04:46:50','2021-03-21 05:47:51'),(2,21,'教师1','jiaoshi','管理员','qf96pl56fes5rqoqzk19nxchfmhnfybg','2021-03-21 04:49:14','2021-03-21 05:55:25'),(3,1,'abo','users','管理员','vpg4aj7bf6elmahh9n7q7c9sja5i9zs1','2021-03-21 04:53:34','2021-03-21 05:53:35');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2021-03-21 04:46:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xueshenghao` varchar(200) NOT NULL COMMENT '学生号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) NOT NULL COMMENT '学生姓名',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xueshenghao` (`xueshenghao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (11,'2021-03-21 04:45:59','学生1','123456','学生姓名1','http://localhost:8080/jspm4tlu5/upload/xuesheng_touxiang1.jpg','男','13823888881','773890001@qq.com'),(12,'2021-03-21 04:45:59','学生2','123456','学生姓名2','http://localhost:8080/jspm4tlu5/upload/xuesheng_touxiang2.jpg','男','13823888882','773890002@qq.com'),(13,'2021-03-21 04:45:59','学生3','123456','学生姓名3','http://localhost:8080/jspm4tlu5/upload/xuesheng_touxiang3.jpg','男','13823888883','773890003@qq.com'),(14,'2021-03-21 04:45:59','学生4','123456','学生姓名4','http://localhost:8080/jspm4tlu5/upload/xuesheng_touxiang4.jpg','男','13823888884','773890004@qq.com'),(15,'2021-03-21 04:45:59','学生5','123456','学生姓名5','http://localhost:8080/jspm4tlu5/upload/xuesheng_touxiang5.jpg','男','13823888885','773890005@qq.com'),(16,'2021-03-21 04:45:59','学生6','123456','学生姓名6','http://localhost:8080/jspm4tlu5/upload/xuesheng_touxiang6.jpg','男','13823888886','773890006@qq.com');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22 14:33:45
