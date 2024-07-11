-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ygt
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT COMMENT '挂号ID',
  `doctor_id` int DEFAULT NULL COMMENT '医生ID',
  `medical_record_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '病历号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `gender` enum('男','女','其他') CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '性别',
  `age` int DEFAULT NULL COMMENT '年龄',
  `dob` date DEFAULT NULL COMMENT '出生日期',
  `id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '身份证号码',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci COMMENT '住址',
  `settlement_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '结算类型',
  `clinic_date` date DEFAULT NULL COMMENT '就诊日期',
  `session` enum('上午','下午') CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '就诊时段',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '就诊科室',
  `registration_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '挂号类型',
  `attending_doctor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '就诊医生',
  `initial_quota` int DEFAULT NULL COMMENT '初始号额',
  `used_quota` int DEFAULT NULL COMMENT '已用号额',
  `medical_record_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '病历状态',
  `receivable_amount` decimal(10,2) DEFAULT NULL COMMENT '应收金额',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '收费方式',
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `unique_medical_record_number` (`medical_record_number`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='挂号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (4,NULL,'hpy','hpy','女',NULL,NULL,'hpy',NULL,NULL,'2024-07-20','上午','1','1',NULL,1,0,'true',50.00,'1'),(5,NULL,'1234','pyh','男',NULL,NULL,'312324141',NULL,NULL,'2024-07-20','上午','1','1',NULL,1,0,'true',50.00,'1'),(20,NULL,'4396','黄玉佩','女',3,'2024-07-04','32312313211',NULL,NULL,'2024-07-20','上午','1','1',NULL,1,0,'true',50.00,'1'),(21,NULL,'243253652','py','女',NULL,NULL,'2432432432432',NULL,NULL,'2024-07-20','上午','1','1',NULL,1,0,'true',50.00,'1'),(23,NULL,'54321','pyh','女',NULL,NULL,'123213214214',NULL,NULL,'2024-07-20','上午','1','1',NULL,1,0,'true',50.00,'1'),(24,NULL,'54452532','234234','女',234324,'2024-07-03','2345325325','4234234234','1','2024-07-20','上午','1','1','1',1,0,'true',50.00,'1'),(25,NULL,'5678','安定区','男',NULL,NULL,'12',NULL,NULL,'2024-07-20','上午','1','1',NULL,1,0,'true',50.00,'1');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charges`
--

DROP TABLE IF EXISTS `charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charges` (
  `charge_id` int NOT NULL AUTO_INCREMENT COMMENT '收费ID',
  `appointment_id` int DEFAULT NULL COMMENT '挂号ID',
  `medical_record_number` int DEFAULT NULL COMMENT '病历号',
  `patient_name` varchar(255) DEFAULT NULL COMMENT '患者姓名',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `age` int DEFAULT NULL COMMENT '患者年龄',
  `gender` varchar(10) DEFAULT NULL COMMENT '患者性别',
  `item_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `category` varchar(50) DEFAULT NULL COMMENT '类型',
  `specification` varchar(100) DEFAULT NULL COMMENT '规格',
  `issue_date` date DEFAULT NULL COMMENT '开立时间',
  `amount` varchar(255) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`charge_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `charges_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='收费表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charges`
--

LOCK TABLES `charges` WRITE;
/*!40000 ALTER TABLE `charges` DISABLE KEYS */;
INSERT INTO `charges` VALUES (2,NULL,4396,'黄玉佩','32312313211',3,'2','门诊挂号',50.00,'挂号','无','2024-07-20',NULL),(3,NULL,243253652,'py','2432432432432',NULL,'2','门诊挂号',50.00,'挂号','无','2024-07-20','1'),(4,NULL,3123213,'131231','13213',NULL,'2','门诊挂号',50.00,'挂号','无','2024-07-20','1'),(5,NULL,54321,'pyh','123213214214',NULL,'2','门诊挂号',50.00,'挂号','无','2024-07-20','1'),(6,NULL,54452532,'234234','2345325325',234324,'2','门诊挂号',50.00,'挂号','无','2024-07-20','1'),(7,NULL,5678,'安定区','12',NULL,'男','门诊挂号',50.00,'挂号','无','2024-07-20','1');
/*!40000 ALTER TABLE `charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `disease_id` int NOT NULL AUTO_INCREMENT COMMENT '疾病ID',
  `disease_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '疾病编码',
  `disease_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '疾病名称',
  `icd_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT 'ICD编码',
  `disease_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '疾病类型',
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='疾病表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'D001','感冒','J00','传染病'),(2,'D002','糖尿病','E14','内分泌、营养及代谢疾病'),(3,'D003','高血压','I10','循环系统疾病'),(4,'D004','冠心病','I25','循环系统疾病'),(5,'D005','哮喘','J45','呼吸系统疾病'),(6,'D006','慢性阻塞性肺病','J44','呼吸系统疾病'),(7,'D007','肝炎','B18','传染病'),(8,'D008','肾衰竭','N17','泌尿系统疾病'),(9,'D009','抑郁症','F32','精神及行为障碍'),(10,'D010','类风湿性关节炎','M06','肌肉骨骼系统及结缔组织疾病');
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `doctor_id` int NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '医生姓名',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '科室',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '职称',
  `specialty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '专业',
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='医生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (101,'张伟','内科','主治医师','心脏病','123-456-7890'),(102,'李静','妇科','主任医师','妇科肿瘤','123-456-7891'),(103,'王磊','外科','副主任医师','骨科','123-456-7892'),(104,'刘芳','儿科','主治医师','儿童生长发育','123-456-7893'),(105,'陈鹏','神经科','主任医师','神经内科','123-456-7894'),(106,'马丽','皮肤科','副主任医师','皮肤性病','123-456-7895'),(107,'赵强','肿瘤科','主治医师','肿瘤治疗','123-456-7896'),(108,'孙华','眼科','主任医师','眼底病','123-456-7897'),(109,'周宇','耳鼻喉科','副主任医师','耳鼻喉科疾病','123-456-7898'),(110,'吴敏','口腔科','主治医师','口腔修复','123-456-7899');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug` (
  `drug_id` int NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `drug_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '药品编码',
  `drug_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '药品名称',
  `drug_specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '药品规格',
  `packaging_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '包装单位',
  `manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '生产厂家',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='药品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (1,'001','阿莫西林','0.5g*100片','盒','辉瑞制药'),(2,'002','布洛芬','100mg*20片','板','拜耳医药'),(3,'003','维生素C','100mg*100片','瓶','中国医药集团'),(4,'004','肝素钠','5000U/支','支','上海医药'),(5,'005','地高辛','0.25mg*100片','盒','北京同仁堂'),(6,'006','头孢拉定','250mg*50片','瓶','云南白药'),(7,'007','阿司匹林','100mg*30片','盒','拜耳医药'),(8,'008','洛伐他汀','20mg*10片','板','辉瑞制药'),(9,'009','氯雷他定','10mg*7片','板','默沙东'),(10,'010','美洛昔康','15mg*10片','板','赛诺菲'),(11,'011','二甲双胍','500mg*60片','瓶','葛兰素史克'),(12,'012','氨茶碱','100mg*50片','瓶','上海医药'),(13,'013','硝苯地平','30mg*15片','盒','华北制药'),(14,'014','地塞米松','0.75mg*100片','瓶','浙江医药'),(15,'015','维生素D3','400IU*60片','瓶','中国医药集团');
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examination` (
  `exam_id` int NOT NULL COMMENT '检查ID（主键）',
  `exam_code` varchar(50) DEFAULT NULL COMMENT '检查编码',
  `exam_name` varchar(100) DEFAULT NULL COMMENT '检查名称',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `fee_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='检查表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES (1,'E001','血常规检查',100.00,'血液检查'),(2,'E002','肝功能检查',150.00,'肝脏检查'),(3,'E003','肾功能检查',120.00,'肾脏检查'),(4,'E004','心电图检查',200.00,'心脏检查'),(5,'E005','胸部X光检查',80.00,'胸部检查'),(6,'E006','腹部B超检查',180.00,'腹部检查'),(7,'E007','骨密度检查',250.00,'骨骼检查'),(8,'E008','血糖检查',50.00,'内分泌检查'),(9,'E009','血脂检查',90.00,'血脂检查'),(10,'E010','肿瘤标志物检查',300.00,'肿瘤检查');
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination_requests`
--

DROP TABLE IF EXISTS `examination_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examination_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `appointment_id` int DEFAULT NULL COMMENT '挂号ID',
  `exam_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '检查项目编码',
  `exam_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '检查项目名称',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `fee_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '费用类别',
  `purpose_requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci COMMENT '目的和要求',
  `exam_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '检查地点',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci COMMENT '备注',
  PRIMARY KEY (`request_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `examination_requests_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='检查申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination_requests`
--

LOCK TABLES `examination_requests` WRITE;
/*!40000 ALTER TABLE `examination_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `examination_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'appointments','患者表',NULL,NULL,'patientCheck','crud','element-plus','com.ygt.patient','patient','patientCheck','患者查看','jzy','0','/','{\"parentMenuId\":\"2012\"}','diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12',NULL),(6,'diseases','疾病表',NULL,NULL,'Diseases','crud','element-plus','com.ygt.diseases','diseases','diseases','疾病','ruoyi','0','/','{\"parentMenuId\":\"\"}','admin','2024-07-09 11:13:56','','2024-07-10 09:37:08',NULL),(7,'medical_records','病历表',NULL,NULL,'MedicalRecords','crud','element-plus','com.ygt.system','system','records','病历','ruoyi','0','/','{\"parentMenuId\":\"\"}','admin','2024-07-09 11:14:08','','2024-07-09 15:43:29',NULL),(8,'refund','退费表',NULL,NULL,'Refund','crud','element-plus','com.ygt.refund','refund','refund','收费','ruoyi','0','/','{\"parentMenuId\":2004}','admin','2024-07-10 20:09:59','','2024-07-10 20:12:20',NULL),(9,'examination_requests','检查申请表',NULL,NULL,'ExaminationRequests','crud','element-plus','com.ygt.requests','requests','requests','检查申请','ruoyi','0','/','{\"parentMenuId\":2012}','admin','2024-07-11 14:48:17','','2024-07-11 14:53:25',NULL),(10,'examination','检查表',NULL,NULL,'Examination','crud','element-plus','com.ygt.examination','examination','examination','检查','ruoyi','0','/','{\"parentMenuId\":\"\"}','admin','2024-07-11 16:14:45','','2024-07-11 16:16:11',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'appointment_id','挂号ID','int','Long','appointmentId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(2,1,'doctor_id','医生ID','int','Long','doctorId','0','0','0','0','0','0','0','EQ','input','',2,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(3,1,'medical_record_number','病历号','varchar(255)','String','medicalRecordNumber','0','0','0','1','0','1','1','EQ','input','',3,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(4,1,'name','姓名','varchar(255)','String','name','0','0','0','1','0','1','1','LIKE','input','',4,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(5,1,'gender','性别','enum(\'男\',\'女\',\'其他\')','String','gender','0','0','0','0','0','0','0','EQ','input','',5,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(6,1,'age','年龄','int','Long','age','0','0','0','1','0','0','0','EQ','input','',6,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(7,1,'dob','出生日期','date','Date','dob','0','0','0','1','0','0','0','EQ','datetime','',7,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(8,1,'id_number','身份证号码','varchar(255)','String','idNumber','0','0','0','1','0','0','0','EQ','input','',8,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(9,1,'address','住址','text','String','address','0','0','0','1','0','0','0','EQ','textarea','',9,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(10,1,'settlement_type','结算类型','varchar(255)','String','settlementType','0','0','0','1','0','0','0','EQ','select','',10,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(11,1,'clinic_date','就诊日期','date','Date','clinicDate','0','0','0','1','0','0','0','EQ','datetime','',11,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(12,1,'session','就诊时段','enum(\'上午\',\'下午\')','String','session','0','0','0','1','0','0','0','EQ',NULL,'',12,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(13,1,'department','就诊科室','varchar(255)','String','department','0','0','0','1','0','0','0','EQ','input','',13,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(14,1,'registration_type','挂号类型','varchar(255)','String','registrationType','0','0','0','1','0','0','0','EQ','select','',14,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(15,1,'attending_doctor','就诊医生','varchar(255)','String','attendingDoctor','0','0','0','1','0','0','0','EQ','input','',15,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(16,1,'initial_quota','初始号额','int','Long','initialQuota','0','0','0','1','0','0','0','EQ','input','',16,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(17,1,'used_quota','已用号额','int','Long','usedQuota','0','0','0','1','0','0','0','EQ','input','',17,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(18,1,'medical_record_status','病历状态','varchar(255)','String','medicalRecordStatus','0','0','0','1','0','0','0','EQ','radio','',18,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(19,1,'receivable_amount','应收金额','decimal(10,2)','BigDecimal','receivableAmount','0','0','0','1','0','0','0','EQ','input','',19,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(20,1,'payment_method','收费方式','varchar(255)','String','paymentMethod','0','0','0','1','0','0','0','EQ','input','',20,'diagnose','2024-07-09 09:39:51','','2024-07-09 09:59:12'),(55,6,'disease_id','疾病ID','int','Long','diseaseId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-09 11:13:56','','2024-07-10 09:37:08'),(56,6,'disease_code','疾病编码','varchar(255)','String','diseaseCode','0','0','0','0','0','0','0','EQ','input','',2,'admin','2024-07-09 11:13:56','','2024-07-10 09:37:08'),(57,6,'disease_name','疾病名称','varchar(255)','String','diseaseName','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2024-07-09 11:13:56','','2024-07-10 09:37:08'),(58,6,'icd_code','疾病ICD','varchar(255)','String','icdCode','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-07-09 11:13:56','','2024-07-10 09:37:08'),(59,6,'disease_type','疾病类型','varchar(255)','String','diseaseType','0','0','0','1','1','1','1','EQ','input','',5,'admin','2024-07-09 11:13:56','','2024-07-10 09:37:08'),(60,7,'medical_record_id','病历ID（主键）','int','Long','medicalRecordId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(61,7,'appointment_id','挂号ID（外键参考挂号表）','int','Long','appointmentId','0','0','0','0','0','0','0','EQ','input','',2,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(62,7,'doctor_id','医生ID（外键参考医生表）','int','Long','doctorId','0','0','0','0','0','0','0','EQ','input','',3,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(63,7,'disease_id','疾病ID（外键参考疾病表）','int','Long','diseaseId','0','0','0','0','0','0','0','EQ','input','',4,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(64,7,'clinic_date','就诊日期','date','Date','clinicDate','0','0','0','0','0','0','0','EQ','datetime','',5,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(65,7,'chief_complaint','主诉','varchar(255)','String','chiefComplaint','0','0','0','0','0','0','0','EQ','input','',6,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(66,7,'present_illness_history','现病史','text','String','presentIllnessHistory','0','0','0','0','0','0','0','EQ','textarea','',7,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(67,7,'treatment_history','现病治疗情况','text','String','treatmentHistory','0','0','0','0','0','0','0','EQ','textarea','',8,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(68,7,'past_history','既往史','text','String','pastHistory','0','0','0','0','0','0','0','EQ','textarea','',9,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(69,7,'allergy_history','过敏史','text','String','allergyHistory','0','0','0','0','0','0','0','EQ','textarea','',10,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(70,7,'physical_examination','体格检查','text','String','physicalExamination','0','0','0','0','0','0','0','EQ','textarea','',11,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(71,7,'notes','注意事项','text','String','notes','0','0','0','0','0','0','0','EQ','textarea','',12,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(72,7,'disease_code','疾病编码','varchar(10)','String','diseaseCode','0','0','0','1','0','1','0','EQ','input','',13,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(73,7,'disease_name','疾病名称','varchar(255)','String','diseaseName','0','0','0','1','0','1','0','LIKE','input','',14,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(74,7,'icd_code','国际ICD编码','varchar(10)','String','icdCode','0','0','0','1','0','1','0','EQ','input','',15,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(75,7,'disease_type','疾病类型','varchar(100)','String','diseaseType','0','0','0','1','0','1','0','EQ','select','',16,'admin','2024-07-09 11:14:08','','2024-07-09 15:43:29'),(76,8,'charge_id','收费ID','int','Long','chargeId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(77,8,'appointment_id','挂号ID','int','Long','appointmentId','0','0','0','0','0','0','0','EQ','input','',2,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(78,8,'medical_record_number','病历号','int','Long','medicalRecordNumber','0','0','0','1','0','0','1','EQ','input','',3,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(79,8,'patient_name','患者姓名','varchar(255)','String','patientName','0','0','0','1','0','0','1','LIKE','input','',4,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(80,8,'id_number','身份证号','varchar(20)','String','idNumber','0','0','0','1','0','0','0','EQ','input','',5,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(81,8,'age','患者年龄','int','Long','age','0','0','0','1','0','0','0','EQ','input','',6,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(82,8,'gender','患者性别','varchar(10)','String','gender','0','0','0','1','0','0','0','EQ','input','',7,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(83,8,'item_name','项目名称','varchar(255)','String','itemName','0','0','0','1','0','1','0','LIKE','input','',8,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(84,8,'unit_price','单价','decimal(10,2)','BigDecimal','unitPrice','0','0','0','1','0','1','0','EQ','input','',9,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(85,8,'category','类型','varchar(50)','String','category','0','0','0','1','0','1','0','EQ','input','',10,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(86,8,'specification','规格','varchar(100)','String','specification','0','0','0','1','0','1','0','EQ','input','',11,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(87,8,'issue_date','开立时间','date','Date','issueDate','0','0','0','1','0','1','0','EQ','datetime','',12,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(88,8,'amount','数量','varchar(255)','String','amount','0','0','0','1','0','1','0','EQ','input','',13,'admin','2024-07-10 20:09:59','','2024-07-10 20:12:20'),(89,9,'request_id','申请ID','int','Long','requestId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:25'),(90,9,'appointment_id','挂号ID','int','Long','appointmentId','0','0','0','0','0','0','0','EQ','input','',2,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:26'),(91,9,'exam_code','检查编码','varchar(255)','String','examCode','0','0','0','1','0','1','0','EQ','input','',3,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:26'),(92,9,'exam_name','检查名称','varchar(255)','String','examName','0','0','0','1','0','1','0','LIKE','input','',4,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:26'),(93,9,'unit_price','单价','decimal(10,2)','BigDecimal','unitPrice','0','0','0','1','0','1','0','EQ','input','',5,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:26'),(94,9,'fee_category','费用分类','varchar(255)','String','feeCategory','0','0','0','1','0','1','0','EQ','input','',6,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:26'),(95,9,'purpose_requirements','目的和要求','text','String','purposeRequirements','0','0','0','0','0','0','0','EQ','textarea','',7,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:26'),(96,9,'exam_location','检查地点','varchar(255)','String','examLocation','0','0','0','0','0','0','0','EQ','input','',8,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:26'),(97,9,'notes','备注','text','String','notes','0','0','0','0','0','0','0','EQ','textarea','',9,'admin','2024-07-11 14:48:17','','2024-07-11 14:53:26'),(98,10,'exam_id','检查ID（主键）','int','Long','examId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-11 16:14:45','','2024-07-11 16:16:11'),(99,10,'exam_code','检查编码','varchar(50)','String','examCode','0','0','0','0','0','1','1','EQ','input','',2,'admin','2024-07-11 16:14:45','','2024-07-11 16:16:11'),(100,10,'exam_name','检查名称','varchar(100)','String','examName','0','0','0','0','0','1','1','LIKE','input','',3,'admin','2024-07-11 16:14:45','','2024-07-11 16:16:11'),(101,10,'unit_price','单价','decimal(10,2)','BigDecimal','unitPrice','0','0','0','0','0','1','0','EQ','input','',4,'admin','2024-07-11 16:14:45','','2024-07-11 16:16:11'),(102,10,'category','类型','varchar(50)','String','category','0','0','0','0','0','1','0','EQ','input','',5,'admin','2024-07-11 16:14:45','','2024-07-11 16:16:11');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_records` (
  `medical_record_id` int NOT NULL AUTO_INCREMENT COMMENT '病历ID（主键）',
  `appointment_id` int DEFAULT NULL COMMENT '挂号ID（外键参考挂号表）',
  `doctor_id` int DEFAULT NULL COMMENT '医生ID（外键参考医生表）',
  `disease_id` int DEFAULT NULL COMMENT '疾病ID（外键参考疾病表）',
  `clinic_date` date DEFAULT NULL COMMENT '就诊日期',
  `chief_complaint` varchar(255) DEFAULT NULL COMMENT '主诉',
  `present_illness_history` text COMMENT '现病史',
  `treatment_history` text COMMENT '现病治疗情况',
  `past_history` text COMMENT '既往史',
  `allergy_history` text COMMENT '过敏史',
  `physical_examination` text COMMENT '体格检查',
  `notes` text COMMENT '注意事项',
  `disease_code` varchar(10) DEFAULT NULL COMMENT '疾病编码',
  `disease_name` varchar(255) DEFAULT NULL COMMENT '疾病名称',
  `icd_code` varchar(10) DEFAULT NULL COMMENT '国际ICD编码',
  `disease_type` varchar(100) DEFAULT NULL COMMENT '疾病类型',
  PRIMARY KEY (`medical_record_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `disease_id` (`disease_id`),
  CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`),
  CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `medical_records_ibfk_3` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='病历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_records`
--

LOCK TABLES `medical_records` WRITE;
/*!40000 ALTER TABLE `medical_records` DISABLE KEYS */;
INSERT INTO `medical_records` VALUES (1,NULL,NULL,NULL,NULL,'1','1','1','1','1','1',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `medical_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `prescription_id` int NOT NULL AUTO_INCREMENT COMMENT '处方ID',
  `appointment_id` int DEFAULT NULL COMMENT '挂号ID',
  `drug_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '药品名称',
  `drug_specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '药品规格',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `usage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci COMMENT '用法',
  `quantity` int DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`prescription_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='处方表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund` (
  `charge_id` int NOT NULL AUTO_INCREMENT COMMENT '收费ID',
  `appointment_id` int DEFAULT NULL COMMENT '挂号ID',
  `medical_record_number` int DEFAULT NULL COMMENT '病历号',
  `patient_name` varchar(255) DEFAULT NULL COMMENT '患者姓名',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `age` int DEFAULT NULL COMMENT '患者年龄',
  `gender` varchar(10) DEFAULT NULL COMMENT '患者性别',
  `item_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `category` varchar(50) DEFAULT NULL COMMENT '类型',
  `specification` varchar(100) DEFAULT NULL COMMENT '规格',
  `issue_date` date DEFAULT NULL COMMENT '开立时间',
  `amount` varchar(255) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`charge_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='收费表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'挂号'),(2,'门诊');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-07-06 08:47:00','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-07-06 08:47:00','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-07-06 08:47:00','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-07-06 08:47:00','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2024-07-06 08:47:00','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-07-06 08:47:00','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-07-06 08:47:00','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-07-06 08:47:00','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-07-06 08:47:00','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-07-06 08:47:00','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-07-06 08:47:00','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-07-06 08:47:00','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-07-06 08:47:00','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-07-06 08:47:00','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-07-06 08:47:00','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-07-06 08:47:00','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-07-06 08:47:00','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-07-06 08:47:00','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-07-06 08:47:00','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-07-06 08:47:00','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-07-06 08:47:00','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-07-06 08:47:00','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-07-06 08:47:00','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-07-06 08:47:00','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-07-06 08:47:00','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-07-06 08:47:00','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-07-06 08:47:00','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-07-06 08:47:00','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-07-06 08:47:00','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-07-06 08:47:00','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-07-06 08:47:00','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-07-06 08:47:00','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-07-06 08:47:00','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-07-06 08:47:00','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-07-06 08:47:00','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-07-06 08:47:00','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-07-06 08:47:00','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-07-06 08:47:00','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-07-06 08:47:01','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-07-06 08:47:01','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-07-06 08:47:01','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 15:20:50'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-06 15:23:04'),(102,'ry','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 15:23:14'),(103,'ry','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-06 15:27:13'),(104,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-07-06 15:27:22'),(105,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 15:27:48'),(106,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-06 15:30:29'),(107,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 15:30:39'),(108,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-06 15:30:51'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 15:31:04'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-06 16:30:54'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 08:28:17'),(112,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 08:43:12'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 08:43:33'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 09:03:29'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 09:10:19'),(116,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 09:10:31'),(117,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 09:13:07'),(118,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 09:13:17'),(119,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 09:13:26'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 09:13:33'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 09:19:43'),(122,'ry','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 09:19:50'),(123,'ry','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 09:21:00'),(124,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 09:21:52'),(125,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 09:32:19'),(126,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 09:32:26'),(127,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 10:27:08'),(128,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 10:43:10'),(129,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 10:53:36'),(130,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 10:56:32'),(131,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-08 10:56:35'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 10:56:40'),(133,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 11:15:47'),(134,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 11:16:15'),(135,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 11:16:53'),(136,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 11:18:50'),(137,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 11:20:10'),(138,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:35:28'),(139,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-08 14:35:42'),(140,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 14:35:54'),(141,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-08 15:29:03'),(142,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 15:29:08'),(143,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-08 16:37:24'),(144,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 08:39:48'),(145,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 08:57:23'),(146,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 08:57:37'),(147,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:08:51'),(148,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:09:02'),(149,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:17:18'),(150,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:17:26'),(151,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:17:31'),(152,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:17:44'),(153,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:19:26'),(154,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:19:35'),(155,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:27:36'),(156,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:27:47'),(157,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:27:52'),(158,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:28:05'),(159,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:31:05'),(160,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:31:16'),(161,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:35:42'),(162,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:35:51'),(163,'appointment','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 09:36:00'),(164,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 09:36:14'),(165,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:05:43'),(166,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:05:50'),(167,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:10:53'),(168,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:11:02'),(169,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:11:17'),(170,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:11:24'),(171,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:12:42'),(172,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:12:53'),(173,'diagnose','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:45:18'),(174,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:45:26'),(175,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:48:31'),(176,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:48:51'),(177,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:48:56'),(178,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:52:43'),(179,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:52:47'),(180,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:52:52'),(181,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 10:52:55'),(182,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-09 10:57:08'),(183,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 10:57:13'),(184,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 14:47:48'),(185,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 15:59:09'),(186,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-09 16:05:29'),(187,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 16:05:33'),(188,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 16:29:24'),(189,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 16:29:36'),(190,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-09 16:29:46'),(191,'woshichy','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-07-09 16:33:34'),(192,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-09 16:34:32'),(193,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 08:35:54'),(194,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 14:27:44'),(195,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 16:51:50'),(196,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-10 18:04:28'),(197,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-11 08:35:15'),(198,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-11 09:18:38'),(199,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-11 09:20:46'),(200,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-11 09:20:58'),(201,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-11 14:29:08');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,2,'system',NULL,'','',1,0,'M','0','0','','system','admin','2024-07-06 08:47:00','diagnose','2024-07-08 09:29:24','系统管理目录'),(2,'系统监控',0,3,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2024-07-06 08:47:00','diagnose','2024-07-08 09:29:28','系统监控目录'),(3,'系统工具',0,4,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2024-07-06 08:47:00','diagnose','2024-07-08 09:29:32','系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2024-07-06 08:47:00','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2024-07-06 08:47:00','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-07-06 08:47:00','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2024-07-06 08:47:00','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2024-07-06 08:47:00','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2024-07-06 08:47:00','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2024-07-06 08:47:00','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2024-07-06 08:47:00','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2024-07-06 08:47:00','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2024-07-06 08:47:00','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2024-07-06 08:47:00','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-07-06 08:47:00','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2024-07-06 08:47:00','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-07-06 08:47:00','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-07-06 08:47:00','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2024-07-06 08:47:00','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2024-07-06 08:47:00','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-07-06 08:47:00','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-07-06 08:47:00','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-07-06 08:47:00','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2024-07-06 08:47:00','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2024-07-06 08:47:00','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-07-06 08:47:00','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2024-07-06 08:47:00','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2024-07-06 08:47:00','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2024-07-06 08:47:00','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2024-07-06 08:47:00','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-07-06 08:47:00','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-07-06 08:47:00','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-07-06 08:47:00','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-07-06 08:47:00','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-07-06 08:47:00','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-07-06 08:47:00','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-07-06 08:47:00','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-07-06 08:47:00','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-07-06 08:47:00','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-07-06 08:47:00','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-07-06 08:47:00','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-07-06 08:47:00','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-07-06 08:47:00','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-07-06 08:47:00','',NULL,''),(2004,'挂号收费',0,1,'appointment',NULL,NULL,'',1,0,'M','0','0',NULL,'log','admin','2024-07-08 10:59:27','',NULL,''),(2005,'挂号',2004,1,'appointment','appointment/appointment/add',NULL,'',1,0,'C','0','0',NULL,'date-range','admin','2024-07-08 11:02:29','',NULL,''),(2006,'退号',2004,1,'cancel_appointment','cancel_appointment/cancel_appointment/index',NULL,'',1,0,'C','0','0','cancel_appointment:cancel_appointment:list','job','admin','2024-07-08 11:10:14','admin','2024-07-08 11:13:19','退号菜单'),(2007,'退号查询',2006,1,'#','',NULL,'',1,0,'F','0','0','cancel_appointment:cancel_appointment:query','#','admin','2024-07-08 11:10:14','',NULL,''),(2008,'退号新增',2006,2,'#','',NULL,'',1,0,'F','0','0','cancel_appointment:cancel_appointment:add','#','admin','2024-07-08 11:10:14','',NULL,''),(2009,'退号修改',2006,3,'#','',NULL,'',1,0,'F','0','0','cancel_appointment:cancel_appointment:edit','#','admin','2024-07-08 11:10:14','',NULL,''),(2010,'退号删除',2006,4,'#','',NULL,'',1,0,'F','0','0','cancel_appointment:cancel_appointment:remove','#','admin','2024-07-08 11:10:14','',NULL,''),(2011,'退号导出',2006,5,'#','',NULL,'',1,0,'F','0','0','cancel_appointment:cancel_appointment:export','#','admin','2024-07-08 11:10:14','',NULL,''),(2012,'医生诊疗',0,1,'diagnose',NULL,NULL,'',1,0,'M','0','0','','logininfor','diagnose','2024-07-09 09:07:54','admin','2024-07-09 09:10:30',''),(2013,'患者查看',2012,1,'patientCheck','patient/patientCheck/index',NULL,'',1,0,'C','0','0','patient:patientCheck:list','monitor','admin','2024-07-09 10:02:58','diagnose','2024-07-09 10:40:38','患者查看菜单'),(2014,'患者查看查询',2013,1,'#','',NULL,'',1,0,'F','0','0','patient:patientCheck:query','#','admin','2024-07-09 10:02:58','',NULL,''),(2015,'患者查看新增',2013,2,'#','',NULL,'',1,0,'F','0','0','patient:patientCheck:add','#','admin','2024-07-09 10:02:58','',NULL,''),(2016,'患者查看修改',2013,3,'#','',NULL,'',1,0,'F','0','0','patient:patientCheck:edit','#','admin','2024-07-09 10:02:58','',NULL,''),(2017,'患者查看删除',2013,4,'#','',NULL,'',1,0,'F','0','0','patient:patientCheck:remove','#','admin','2024-07-09 10:02:58','',NULL,''),(2018,'患者查看导出',2013,5,'#','',NULL,'',1,0,'F','0','0','patient:patientCheck:export','#','admin','2024-07-09 10:02:58','',NULL,''),(2020,'病历首页',2012,2,'records','records/records/add',NULL,'',1,0,'C','0','0','','clipboard','admin','2024-07-09 10:47:24','admin','2024-07-09 10:47:49',''),(2021,'收费',2004,3,'charges','charges/charges/index',NULL,'',1,0,'C','0','0','charges:charges:list','money','admin','2024-07-10 16:18:31','admin','2024-07-10 16:20:52','收费菜单'),(2022,'收费查询',2021,1,'#','',NULL,'',1,0,'F','0','0','charges:charges:query','#','admin','2024-07-10 16:18:31','',NULL,''),(2023,'收费新增',2021,2,'#','',NULL,'',1,0,'F','0','0','charges:charges:add','#','admin','2024-07-10 16:18:31','',NULL,''),(2024,'收费修改',2021,3,'#','',NULL,'',1,0,'F','0','0','charges:charges:edit','#','admin','2024-07-10 16:18:31','',NULL,''),(2025,'收费删除',2021,4,'#','',NULL,'',1,0,'F','0','0','charges:charges:remove','#','admin','2024-07-10 16:18:31','',NULL,''),(2026,'收费导出',2021,5,'#','',NULL,'',1,0,'F','0','0','charges:charges:export','#','admin','2024-07-10 16:18:31','',NULL,''),(2027,'退费',2004,4,'refund','refund/refund/index',NULL,'',1,0,'C','0','0','refund:refund:list','number','admin','2024-07-10 20:17:02','admin','2024-07-10 20:18:17','收费菜单'),(2028,'收费查询',2027,1,'#','',NULL,'',1,0,'F','0','0','refund:refund:query','#','admin','2024-07-10 20:17:02','',NULL,''),(2029,'收费新增',2027,2,'#','',NULL,'',1,0,'F','0','0','refund:refund:add','#','admin','2024-07-10 20:17:02','',NULL,''),(2030,'收费修改',2027,3,'#','',NULL,'',1,0,'F','0','0','refund:refund:edit','#','admin','2024-07-10 20:17:02','',NULL,''),(2031,'收费删除',2027,4,'#','',NULL,'',1,0,'F','0','0','refund:refund:remove','#','admin','2024-07-10 20:17:02','',NULL,''),(2032,'收费导出',2027,5,'#','',NULL,'',1,0,'F','0','0','refund:refund:export','#','admin','2024-07-10 20:17:02','',NULL,''),(2033,'检查申请',2012,3,'requests','requests/requests/index',NULL,'',1,0,'C','0','0','requests:requests:list','link','admin','2024-07-11 15:02:22','admin','2024-07-11 16:04:11','检查申请菜单'),(2034,'检查申请查询',2033,1,'#','',NULL,'',1,0,'F','0','0','requests:requests:query','#','admin','2024-07-11 15:02:22','',NULL,''),(2035,'检查申请新增',2033,2,'#','',NULL,'',1,0,'F','0','0','requests:requests:add','#','admin','2024-07-11 15:02:22','',NULL,''),(2036,'检查申请修改',2033,3,'#','',NULL,'',1,0,'F','0','0','requests:requests:edit','#','admin','2024-07-11 15:02:22','',NULL,''),(2037,'检查申请删除',2033,4,'#','',NULL,'',1,0,'F','0','0','requests:requests:remove','#','admin','2024-07-11 15:02:22','',NULL,''),(2038,'检查申请导出',2033,5,'#','',NULL,'',1,0,'F','0','0','requests:requests:export','#','admin','2024-07-11 15:02:22','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-07-06 08:47:01','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-07-06 08:47:01','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预约\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"node\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:17:23',15),(101,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:17:43',8),(102,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'diagnose','测试部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"diagnose\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"门诊管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"node\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:29:07',6),(103,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'diagnose','测试部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-07-06 08:47:00\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"diagnose\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:29:24',7),(104,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'diagnose','测试部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-07-06 08:47:00\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"diagnose\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:29:28',5),(105,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'diagnose','测试部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-07-06 08:47:00\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"diagnose\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:29:32',5),(106,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'diagnose','测试部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"门诊管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"diagnose\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"新增菜单\'门诊管理\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2024-07-08 09:30:11',2),(107,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'diagnose','测试部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"diagnose\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"门诊\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"diagnose\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:32:02',5),(108,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:32:43',5),(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-07-08 09:29:07\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appointment\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 09:33:02',6),(110,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"挂号\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"node\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 10:31:27',5),(111,'菜单管理',3,'com.ygt.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2001','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-07-08 10:57:15',6),(112,'菜单管理',3,'com.ygt.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2003','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 10:57:21',9),(113,'菜单管理',3,'com.ygt.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2001','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 10:57:25',6),(114,'菜单管理',1,'com.ygt.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"挂号收费\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appointment\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 10:59:27',14),(115,'菜单管理',1,'com.ygt.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"appointment/appointment/add\",\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"挂号\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"appointment\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 11:02:29',6),(116,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"cancel_appointment/cancel_appointment/index\",\"createTime\":\"2024-07-08 11:10:14\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"退号\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"cancel_appointment\",\"perms\":\"cancel_appointment:cancel_appointment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 11:11:28',30),(117,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"cancel_appointment/cancel_appointment/index\",\"createTime\":\"2024-07-08 11:10:14\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"退号\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"cancel_appointment\",\"perms\":\"cancel_appointment:cancel_appointment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 11:11:58',6),(118,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"cancel_appointment/cancel_appointment/index\",\"createTime\":\"2024-07-08 11:10:14\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"退号\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"cancel_appointment\",\"perms\":\"cancel_appointment:cancel_appointment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 11:13:19',7),(119,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2024-07-08 16:40:08',46),(120,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2024-07-08 16:40:15',2),(121,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"address\":\"1\",\"age\":1,\"appointmentId\":1,\"attendingDoctor\":\"1\",\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"dob\":\"2024-07-03 00:00:00\",\"gender\":\"2\",\"idNumber\":\"1\",\"initialQuota\":1,\"medicalRecordStatus\":\"true\",\"name\":\"1\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"settlementType\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 16:56:39',10),(122,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"address\":\"2\",\"age\":2,\"appointmentId\":2,\"attendingDoctor\":\"2\",\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"dob\":\"2024-07-04 00:00:00\",\"gender\":\"2\",\"idNumber\":\"2\",\"initialQuota\":1,\"medicalRecordStatus\":\"true\",\"name\":\"2\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"settlementType\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 16:57:26',6),(123,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"age\":3,\"appointmentId\":3,\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"3\",\"initialQuota\":1,\"medicalRecordStatus\":\"true\",\"name\":\"3\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 16:58:40',4),(124,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"appointmentId\":4,\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"hpy\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"hpy\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-08 17:02:10',5),(125,'用户头像',2,'com.ygt.web.controller.system.SysProfileController.avatar()','POST',1,'diagnose','测试部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/07/09/4cc777380cd791233de445bee8345982b3b780b8_20240709090508A001.jpg\",\"code\":200}',0,NULL,'2024-07-09 09:05:08',66),(126,'个人信息',2,'com.ygt.web.controller.system.SysProfileController.updateProfile()','PUT',1,'diagnose','测试部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"门诊医生\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:05:15',10),(127,'菜单管理',1,'com.ygt.web.controller.system.SysMenuController.add()','POST',1,'diagnose','测试部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"diagnose\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"医生诊疗\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"diagnose\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:07:54',12),(128,'用户管理',2,'com.ygt.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"/profile/avatar/2024/07/09/4cc777380cd791233de445bee8345982b3b780b8_20240709090508A001.jpg\",\"createBy\":\"admin\",\"createTime\":\"2024-07-06 08:47:00\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-07-08 14:35:29\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"门诊医生\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"diagnose\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:09:30',23),(129,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-06 08:47:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:09:46',19),(130,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-07-09 09:07:54\",\"icon\":\"logininfor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"医生诊疗\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"diagnose\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:10:30',7),(131,'用户管理',1,'com.ygt.web.controller.system.SysUserController.add()','POST',1,'diagnose','若依科技','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"diagnose\",\"deptId\":100,\"nickName\":\"挂号收费员\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":101,\"userName\":\"appointment\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:19:18',77),(132,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-06 08:47:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"dia\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:22:38',13),(133,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2005,2006,2007,2008,2009,2010,2011,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"挂号\",\"roleId\":3,\"roleKey\":\"appoint\",\"roleName\":\"挂号员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:22:46',12),(134,'用户头像',2,'com.ygt.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/07/09/Fall Guys Screenshot 2022.07.10 - 17.11.33.05_20240709092554A002.png\",\"code\":200}',0,NULL,'2024-07-09 09:25:54',6),(135,'用户头像',2,'com.ygt.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ygt.system.mapper.SysUserMapper.updateUserAvatar-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user set avatar = ? where user_name = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1\n; Data truncation: Data too long for column \'avatar\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1','2024-07-09 09:26:28',41),(136,'用户头像',2,'com.ygt.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ygt.system.mapper.SysUserMapper.updateUserAvatar-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user set avatar = ? where user_name = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1\n; Data truncation: Data too long for column \'avatar\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1','2024-07-09 09:27:04',4),(137,'个人信息',2,'com.ygt.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"院长\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:27:12',8),(138,'用户头像',2,'com.ygt.web.controller.system.SysProfileController.avatar()','POST',1,'appointment','若依科技','/system/user/profile/avatar','127.0.0.1','内网IP','',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 3\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ygt.system.mapper.SysUserMapper.updateUserAvatar-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user set avatar = ? where user_name = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 3\n; Data truncation: Data too long for column \'avatar\' at row 3; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 3','2024-07-09 09:28:37',3),(139,'用户头像',2,'com.ygt.web.controller.system.SysProfileController.avatar()','POST',1,'appointment','若依科技','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/07/09/微信图片_20240709093009_20240709093038A006.jpg\",\"code\":200}',0,NULL,'2024-07-09 09:30:38',6),(140,'个人信息',2,'com.ygt.web.controller.system.SysProfileController.updateProfile()','PUT',1,'appointment','若依科技','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"1625159433@qq.com\",\"nickName\":\"挂号收费员\",\"params\":{},\"phonenumber\":\"13326134168\",\"sex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:30:55',6),(141,'用户管理',2,'com.ygt.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"/profile/avatar/2024/07/09/微信图片_20240709093009_20240709093038A006.jpg\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:19:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"1625159433@qq.com\",\"loginDate\":\"2024-07-09 09:28:05\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"挂号收费员\",\"params\":{},\"phonenumber\":\"13326134168\",\"postIds\":[],\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"dia\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"appointment\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:32:07',11),(142,'用户头像',2,'com.ygt.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/07/09/微信图片_20240709093419_20240709093536A007.jpg\",\"code\":200}',0,NULL,'2024-07-09 09:35:36',5),(143,'个人信息',2,'com.ygt.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"院长\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:35:37',5),(144,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'diagnose','若依科技','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"appointments\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:39:51',51),(145,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'diagnose','若依科技','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"appointments\",\"className\":\"Appointments\",\"columns\":[{\"capJavaField\":\"AppointmentId\",\"columnComment\":\"挂号ID\",\"columnId\":1,\"columnName\":\"appointment_id\",\"columnType\":\"int\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"appointmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":2,\"columnName\":\"doctor_id\",\"columnType\":\"int\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"doctorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicalRecordNumber\",\"columnComment\":\"病历号\",\"columnId\":3,\"columnName\":\"medical_record_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicalRecordNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInser','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:52:50',38),(146,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'diagnose','若依科技','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"appointmentCheck\",\"className\":\"Appointments\",\"columns\":[{\"capJavaField\":\"AppointmentId\",\"columnComment\":\"挂号ID\",\"columnId\":1,\"columnName\":\"appointment_id\",\"columnType\":\"int\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"appointmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:52:49\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":2,\"columnName\":\"doctor_id\",\"columnType\":\"int\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"doctorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:52:49\",\"usableColumn\":false},{\"capJavaField\":\"MedicalRecordNumber\",\"columnComment\":\"病历号\",\"columnId\":3,\"columnName\":\"medical_record_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicalRecordNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:52:49\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictTyp','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:53:59',28),(147,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'diagnose','若依科技','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"patientCheck\",\"className\":\"patientCheck\",\"columns\":[{\"capJavaField\":\"AppointmentId\",\"columnComment\":\"挂号ID\",\"columnId\":1,\"columnName\":\"appointment_id\",\"columnType\":\"int\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"appointmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:53:59\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":2,\"columnName\":\"doctor_id\",\"columnType\":\"int\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"doctorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:53:59\",\"usableColumn\":false},{\"capJavaField\":\"MedicalRecordNumber\",\"columnComment\":\"病历号\",\"columnId\":3,\"columnName\":\"medical_record_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicalRecordNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:53:59\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:55:18',24),(148,'代码生成',8,'com.ygt.generator.controller.GenController.batchGenCode()','GET',1,'diagnose','若依科技','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"appointments\"}',NULL,0,NULL,'2024-07-09 09:55:54',40),(149,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'diagnose','若依科技','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"patientCheck\",\"className\":\"patientCheck\",\"columns\":[{\"capJavaField\":\"AppointmentId\",\"columnComment\":\"挂号ID\",\"columnId\":1,\"columnName\":\"appointment_id\",\"columnType\":\"int\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"appointmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:55:18\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID\",\"columnId\":2,\"columnName\":\"doctor_id\",\"columnType\":\"int\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"doctorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:55:18\",\"usableColumn\":false},{\"capJavaField\":\"MedicalRecordNumber\",\"columnComment\":\"病历号\",\"columnId\":3,\"columnName\":\"medical_record_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicalRecordNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-07-09 09:55:18\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"diagnose\",\"createTime\":\"2024-07-09 09:39:51\",\"dictType\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 09:59:12',23),(150,'代码生成',8,'com.ygt.generator.controller.GenController.batchGenCode()','GET',1,'diagnose','若依科技','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"appointments\"}',NULL,0,NULL,'2024-07-09 09:59:16',36),(151,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-06 08:47:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:06:50',12),(152,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2005,2006,2007,2008,2009,2010,2011,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"挂号\",\"roleId\":3,\"roleKey\":\"common\",\"roleName\":\"挂号员\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"修改角色\'挂号员\'失败，角色权限已存在\",\"code\":500}',0,NULL,'2024-07-09 10:06:58',3),(153,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2005,2006,2007,2008,2009,2010,2011,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"挂号\",\"roleId\":3,\"roleKey\":\"appointment\",\"roleName\":\"挂号员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:07:06',12),(154,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-06 08:47:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"diagnose\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:07:15',12),(155,'患者查看',3,'com.ygt.patient.controller.patientCheckController.remove()','DELETE',1,'admin','研发部门','/patient/patientCheck/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:09:49',13),(156,'患者查看',3,'com.ygt.patient.controller.patientCheckController.remove()','DELETE',1,'admin','研发部门','/patient/patientCheck/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:10:02',5),(157,'患者查看',3,'com.ygt.patient.controller.patientCheckController.remove()','DELETE',1,'admin','研发部门','/patient/patientCheck/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:10:05',4),(158,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-06 08:47:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,2013,2014,2015,2016,2017,2018,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"diagnose\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:11:45',26),(159,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'diagnose','若依科技','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"patient/patientCheck/index\",\"createTime\":\"2024-07-09 10:02:58\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"患者查看\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"patientCheck\",\"perms\":\"patient:patientCheck:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"diagnose\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:40:38',13),(160,'菜单管理',1,'com.ygt.web.controller.system.SysMenuController.add()','POST',1,'diagnose','若依科技','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"diagnose\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"病历首页\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"record/record\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:42:01',7),(161,'菜单管理',1,'com.ygt.web.controller.system.SysMenuController.add()','POST',1,'diagnose','若依科技','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"病历首页\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"records/records\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"新增菜单\'病历首页\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2024-07-09 10:44:33',3),(162,'菜单管理',3,'com.ygt.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2019','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:46:02',6),(163,'菜单管理',1,'com.ygt.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"records/records/add\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"病历首页\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"records\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:47:24',5),(164,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"records/records/add\",\"createTime\":\"2024-07-09 10:47:24\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"病历首页\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"records\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 10:47:49',6),(165,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"medical_records\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 11:05:09',50),(166,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"diseases\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 11:05:34',14),(167,'代码生成',3,'com.ygt.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/2,3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 11:06:17',5),(168,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"diseases,medical_records\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 11:06:32',37),(169,'代码生成',3,'com.ygt.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/4,5','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 11:07:40',5),(170,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"diseases\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 11:13:56',15),(171,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"medical_records\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 11:14:08',30),(172,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"appointmentId\":5,\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"1\",\"idNumber\":\"312324141\",\"initialQuota\":1,\"medicalRecordNumber\":\"1234\",\"medicalRecordStatus\":\"true\",\"name\":\"pyh\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 14:49:26',44),(173,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"records\",\"className\":\"MedicalRecords\",\"columns\":[{\"capJavaField\":\"MedicalRecordId\",\"columnComment\":\"病历ID（主键）\",\"columnId\":60,\"columnName\":\"medical_record_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:14:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicalRecordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AppointmentId\",\"columnComment\":\"挂号ID（外键参考挂号表）\",\"columnId\":61,\"columnName\":\"appointment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:14:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"appointmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoctorId\",\"columnComment\":\"医生ID（外键参考医生表）\",\"columnId\":62,\"columnName\":\"doctor_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:14:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"doctorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseId\",\"columnComment\":\"疾病ID（外键参考疾病表）\",\"columnId\":63,\"columnName\":\"disease_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:14:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-09 15:43:29',83),(174,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"diseases\",\"className\":\"Diseases\",\"columns\":[{\"capJavaField\":\"DiseaseId\",\"columnComment\":\"疾病ID\",\"columnId\":55,\"columnName\":\"disease_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"diseaseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseCode\",\"columnComment\":\"疾病编码\",\"columnId\":56,\"columnName\":\"disease_code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"diseaseCode\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseName\",\"columnComment\":\"疾病名称\",\"columnId\":57,\"columnName\":\"disease_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"diseaseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IcdCode\",\"columnComment\":\"疾病ICD\",\"columnId\":58,\"columnName\":\"icd_code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 09:25:54',47),(175,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"diseases\",\"className\":\"Diseases\",\"columns\":[{\"capJavaField\":\"DiseaseId\",\"columnComment\":\"疾病ID\",\"columnId\":55,\"columnName\":\"disease_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"diseaseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-10 09:25:54\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseCode\",\"columnComment\":\"疾病编码\",\"columnId\":56,\"columnName\":\"disease_code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"diseaseCode\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-10 09:25:54\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseName\",\"columnComment\":\"疾病名称\",\"columnId\":57,\"columnName\":\"disease_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"diseaseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-10 09:25:54\",\"usableColumn\":false},{\"capJavaField\":\"IcdCode\",\"columnComment\":\"疾病ICD\",\"columnId\":58,\"columnName\":\"icd_code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":true,\"htmlTy','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 09:35:59',16),(176,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"diseases\",\"className\":\"Diseases\",\"columns\":[{\"capJavaField\":\"DiseaseId\",\"columnComment\":\"疾病ID\",\"columnId\":55,\"columnName\":\"disease_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"diseaseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-10 09:35:59\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseCode\",\"columnComment\":\"疾病编码\",\"columnId\":56,\"columnName\":\"disease_code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"diseaseCode\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-10 09:35:59\",\"usableColumn\":false},{\"capJavaField\":\"DiseaseName\",\"columnComment\":\"疾病名称\",\"columnId\":57,\"columnName\":\"disease_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"diseaseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-07-10 09:35:59\",\"usableColumn\":false},{\"capJavaField\":\"IcdCode\",\"columnComment\":\"疾病ICD\",\"columnId\":58,\"columnName\":\"icd_code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-09 11:13:56\",\"dictType\":\"\",\"edit\":true,\"htmlTy','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 09:37:08',15),(177,'代码生成',8,'com.ygt.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"diseases\"}',NULL,0,NULL,'2024-07-10 11:14:56',31),(178,'疾病',5,'com.ygt.diseases.controller.DiseasesController.export()','POST',1,'admin','研发部门','/diseases/diseases/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-07-10 11:20:37',580),(179,'病历',1,'com.ygt.records.controller.MedicalRecordsController.add()','POST',1,'admin','研发部门','/records/records','127.0.0.1','内网IP','{\"allergyHistory\":\"1\",\"chiefComplaint\":\"1\",\"params\":{},\"pastHistory\":\"1\",\"physicalExamination\":\"1\",\"presentIllnessHistory\":\"1\",\"treatmentHistory\":\"1\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'medical_record_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\records\\MedicalRecordsMapper.xml]\r\n### The error may involve com.ygt.records.mapper.MedicalRecordsMapper.insertMedicalRecords-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medical_records          ( chief_complaint,             present_illness_history,             treatment_history,             past_history,             allergy_history,             physical_examination )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'medical_record_id\' doesn\'t have a default value\n; Field \'medical_record_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'medical_record_id\' doesn\'t have a default value','2024-07-10 15:35:25',125),(180,'病历',1,'com.ygt.records.controller.MedicalRecordsController.add()','POST',1,'admin','研发部门','/records/records','127.0.0.1','内网IP','{\"allergyHistory\":\"1\",\"chiefComplaint\":\"1\",\"params\":{},\"pastHistory\":\"1\",\"physicalExamination\":\"1\",\"presentIllnessHistory\":\"1\",\"treatmentHistory\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 15:38:59',8),(181,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"2\",\"gender\":\"2\",\"idNumber\":\"1233\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"jin\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 15:56:00',12),(182,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"2\",\"gender\":\"2\",\"idNumber\":\"1233\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"jin\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:00:35',5),(183,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"2\",\"gender\":\"2\",\"idNumber\":\"1233\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"jin\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:06:43',13),(184,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"2\",\"gender\":\"2\",\"idNumber\":\"1233\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"jin\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:08:06',5),(185,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"2\",\"gender\":\"2\",\"idNumber\":\"1233\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"jin\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:08:57',3),(186,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"2\",\"gender\":\"2\",\"idNumber\":\"1233\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"jin\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:09:01',4),(187,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"2\",\"gender\":\"2\",\"idNumber\":\"1233\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"jin\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:09:10',4),(188,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"2\",\"gender\":\"2\",\"idNumber\":\"1233\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"jin\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:09:30',3),(189,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"2\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"1\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:09:55',3),(190,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"2\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"1\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:09:59',3),(191,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"2\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"1\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:10:03',3),(192,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"2\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"1\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:10:08',3),(193,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"2\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"1\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:10:15',3),(194,'退号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"2\",\"initialQuota\":1,\"medicalRecordNumber\":\"hpy\",\"medicalRecordStatus\":\"true\",\"name\":\"1\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\r\n### The error may exist in file [E:\\GitHub\\HIS\\YGT\\ygt-admin\\target\\classes\\mapper\\appointment\\AppointmentsMapper.xml]\r\n### The error may involve com.ygt.appointment.mapper.AppointmentsMapper.insertAppointments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into appointments          ( medical_record_number,             name,             gender,                                       id_number,                                       clinic_date,             session,             department,             registration_type,                          initial_quota,             used_quota,             medical_record_status,             receivable_amount,             payment_method )           values ( ?,             ?,             ?,                                       ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'\n; Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'hpy\' for key \'appointments.unique_medical_record_number\'','2024-07-10 16:10:41',3),(195,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"charges/charges/index\",\"createTime\":\"2024-07-10 16:18:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"收费\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"charges\",\"perms\":\"charges:charges:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 16:20:14',15),(196,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"charges/charges/index\",\"createTime\":\"2024-07-10 16:18:31\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"收费\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"charges\",\"perms\":\"charges:charges:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 16:20:52',5),(197,'挂号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"age\":3,\"appointmentId\":20,\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"dob\":\"2024-07-04 00:00:00\",\"gender\":\"2\",\"idNumber\":\"32312313211\",\"initialQuota\":1,\"medicalRecordNumber\":\"4396\",\"medicalRecordStatus\":\"true\",\"name\":\"黄玉佩\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 18:05:20',27),(198,'挂号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"appointmentId\":21,\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"2432432432432\",\"initialQuota\":1,\"medicalRecordNumber\":\"243253652\",\"medicalRecordStatus\":\"true\",\"name\":\"py\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 18:07:15',110),(199,'挂号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"appointmentId\":22,\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"13213\",\"initialQuota\":1,\"medicalRecordNumber\":\"3123213\",\"medicalRecordStatus\":\"true\",\"name\":\"131231\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 18:32:46',9),(200,'退号',3,'com.ygt.cancel_appointment.controller.CancelAppointmentsController.remove()','DELETE',1,'admin','研发部门','/cancel_appointment/cancel_appointment/22','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 18:32:59',10),(201,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"refund\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 20:09:59',62),(202,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"refund\",\"className\":\"Refund\",\"columns\":[{\"capJavaField\":\"ChargeId\",\"columnComment\":\"收费ID\",\"columnId\":76,\"columnName\":\"charge_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-10 20:09:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"chargeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AppointmentId\",\"columnComment\":\"挂号ID\",\"columnId\":77,\"columnName\":\"appointment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-10 20:09:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"appointmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicalRecordNumber\",\"columnComment\":\"病历号\",\"columnId\":78,\"columnName\":\"medical_record_number\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-10 20:09:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"medicalRecordNumber\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatientName\",\"columnComment\":\"患者姓名\",\"columnId\":79,\"columnName\":\"patient_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-10 20:09:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isLis','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 20:12:20',31),(203,'代码生成',8,'com.ygt.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"refund\"}',NULL,0,NULL,'2024-07-10 20:12:24',151),(204,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"refund/refund/index\",\"createTime\":\"2024-07-10 20:17:02\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"收费\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2004,\"path\":\"refund\",\"perms\":\"refund:refund:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"修改菜单\'收费\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2024-07-10 20:18:04',7),(205,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"refund/refund/index\",\"createTime\":\"2024-07-10 20:17:02\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"退费\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2004,\"path\":\"refund\",\"perms\":\"refund:refund:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 20:18:17',6),(206,'挂号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"appointmentId\":23,\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"2\",\"idNumber\":\"123213214214\",\"initialQuota\":1,\"medicalRecordNumber\":\"54321\",\"medicalRecordStatus\":\"true\",\"name\":\"pyh\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 20:51:55',117),(207,'挂号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"address\":\"4234234234\",\"age\":234324,\"appointmentId\":24,\"attendingDoctor\":\"1\",\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"dob\":\"2024-07-03 00:00:00\",\"gender\":\"2\",\"idNumber\":\"2345325325\",\"initialQuota\":1,\"medicalRecordNumber\":\"54452532\",\"medicalRecordStatus\":\"true\",\"name\":\"234234\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"settlementType\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 20:57:04',20),(208,'收费',3,'com.ygt.refund.controller.RefundController.remove()','DELETE',1,'admin','研发部门','/refund/refund/5','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-10 20:57:39',5),(209,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-06 08:47:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,2013,2014,2015,2016,2017,2018,2020,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"diagnose\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 09:39:18',38),(210,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2005,2006,2007,2008,2009,2010,2011,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032],\"params\":{},\"remark\":\"挂号\",\"roleId\":3,\"roleKey\":\"appointment\",\"roleName\":\"挂号员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 09:39:33',11),(211,'角色管理',2,'com.ygt.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-06 08:47:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,2013,2014,2015,2016,2017,2018,2020],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"diagnose\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 09:39:42',10),(212,'挂号',1,'com.ygt.appointment.controller.AppointmentsController.add()','POST',1,'admin','研发部门','/appointment/appointment','127.0.0.1','内网IP','{\"appointmentId\":25,\"clinicDate\":\"2024-07-20 00:00:00\",\"department\":\"1\",\"gender\":\"男\",\"idNumber\":\"12\",\"initialQuota\":1,\"medicalRecordNumber\":\"5678\",\"medicalRecordStatus\":\"true\",\"name\":\"安定区\",\"params\":{},\"paymentMethod\":\"1\",\"receivableAmount\":50,\"registrationType\":\"1\",\"session\":\"1\",\"usedQuota\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 14:31:05',28),(213,'收费',3,'com.ygt.refund.controller.RefundController.remove()','DELETE',1,'admin','研发部门','/refund/refund/6','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 14:32:14',5),(214,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"examination_requests\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 14:48:17',46),(215,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"requests\",\"className\":\"ExaminationRequests\",\"columns\":[{\"capJavaField\":\"RequestId\",\"columnComment\":\"申请ID\",\"columnId\":89,\"columnName\":\"request_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 14:48:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requestId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AppointmentId\",\"columnComment\":\"挂号ID\",\"columnId\":90,\"columnName\":\"appointment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 14:48:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"appointmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExamCode\",\"columnComment\":\"检查编码\",\"columnId\":91,\"columnName\":\"exam_code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 14:48:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"examCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExamName\",\"columnComment\":\"检查名称\",\"columnId\":92,\"columnName\":\"exam_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 14:48:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"is','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 14:53:26',30),(216,'代码生成',8,'com.ygt.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"examination_requests\"}',NULL,0,NULL,'2024-07-11 14:53:34',123),(217,'菜单管理',2,'com.ygt.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"requests/requests/index\",\"createTime\":\"2024-07-11 15:02:22\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"检查申请\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2012,\"path\":\"requests\",\"perms\":\"requests:requests:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 16:04:11',19),(218,'代码生成',6,'com.ygt.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"examination\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 16:14:45',32),(219,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"examination\",\"className\":\"Examination\",\"columns\":[{\"capJavaField\":\"ExamId\",\"columnComment\":\"检查ID（主键）\",\"columnId\":98,\"columnName\":\"exam_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 16:14:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExamCode\",\"columnComment\":\"检查编码\",\"columnId\":99,\"columnName\":\"exam_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 16:14:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExamName\",\"columnComment\":\"检查名称\",\"columnId\":100,\"columnName\":\"exam_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 16:14:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UnitPrice\",\"columnComment\":\"单价\",\"columnId\":101,\"columnName\":\"unit_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 16:14:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 16:16:04',22),(220,'代码生成',2,'com.ygt.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"examination\",\"className\":\"Examination\",\"columns\":[{\"capJavaField\":\"ExamId\",\"columnComment\":\"检查ID（主键）\",\"columnId\":98,\"columnName\":\"exam_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 16:14:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-07-11 16:16:04\",\"usableColumn\":false},{\"capJavaField\":\"ExamCode\",\"columnComment\":\"检查编码\",\"columnId\":99,\"columnName\":\"exam_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 16:14:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-07-11 16:16:04\",\"usableColumn\":false},{\"capJavaField\":\"ExamName\",\"columnComment\":\"检查名称\",\"columnId\":100,\"columnName\":\"exam_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 16:14:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"examName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-07-11 16:16:04\",\"usableColumn\":false},{\"capJavaField\":\"UnitPrice\",\"columnComment\":\"单价\",\"columnId\":101,\"columnName\":\"unit_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 16:14:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"inpu','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-11 16:16:11',10),(221,'代码生成',8,'com.ygt.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"examination\"}',NULL,0,NULL,'2024-07-11 16:16:14',38);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-07-06 08:47:00','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-07-06 08:47:00','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-07-06 08:47:00','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-07-06 08:47:00','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-07-06 08:47:00','',NULL,'超级管理员'),(2,'普通角色','diagnose',2,'2',1,1,'0','0','admin','2024-07-06 08:47:00','admin','2024-07-11 09:39:42','普通角色'),(3,'挂号员','appointment',3,'3',1,1,'0','0','',NULL,'admin','2024-07-11 09:39:33','挂号');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,2012),(2,2013),(2,2014),(2,2015),(2,2016),(2,2017),(2,2018),(2,2020),(3,2004),(3,2005),(3,2006),(3,2007),(3,2008),(3,2009),(3,2010),(3,2011),(3,2021),(3,2022),(3,2023),(3,2024),(3,2025),(3,2026),(3,2027),(3,2028),(3,2029),(3,2030),(3,2031),(3,2032);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','院长','00','ry@163.com','15888888888','1','/profile/avatar/2024/07/09/微信图片_20240709093419_20240709093536A007.jpg','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-07-11 14:29:09','admin','2024-07-06 08:47:00','','2024-07-11 14:29:08','管理员'),(2,100,'diagnose','门诊医生','00','ry@qq.com','15666666666','1','/profile/avatar/2024/07/09/4cc777380cd791233de445bee8345982b3b780b8_20240709090508A001.jpg','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-07-09 10:12:54','admin','2024-07-06 08:47:00','admin','2024-07-09 10:12:53','测试员'),(101,100,'appointment','挂号收费员','00','1625159433@qq.com','13326134168','0','/profile/avatar/2024/07/09/微信图片_20240709093009_20240709093038A006.jpg','$2a$10$dLeptVEP2nbE4AtcCi/xOOiyJqJPlaT88w4W1Q/hxoZtSmGoTASYC','0','0','127.0.0.1','2024-07-09 09:35:52','diagnose','2024-07-09 09:19:18','admin','2024-07-09 09:35:51',NULL),(102,NULL,'woshichy','woshichy','00','','','0','','$2a$10$cjP4sxOnBdJIZebUntch8eaxs2ZE1nRqVa7Qkl7RkViLOhrwPUnGO','0','0','',NULL,'','2024-07-09 16:33:34','',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(101,3);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '密码',
  `role_id` int DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'appointment','admin123',1),(2,'diagnose','admin123',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ygt'
--

--
-- Dumping routines for database 'ygt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-11 17:28:04
