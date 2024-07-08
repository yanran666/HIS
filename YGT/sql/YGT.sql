-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ry-vue
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
  `medical_record_number` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '病历号',
  `name` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `gender` enum('男','女','其他') COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '性别',
  `age` int DEFAULT NULL COMMENT '年龄',
  `dob` date DEFAULT NULL COMMENT '出生日期',
  `id_number` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '身份证号码',
  `address` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '住址',
  `settlement_type` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '结算类型',
  `clinic_date` date DEFAULT NULL COMMENT '就诊日期',
  `session` enum('上午','下午') COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '就诊时段',
  `department` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '就诊科室',
  `registration_type` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '挂号类型',
  `attending_doctor` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '就诊医生',
  `initial_quota` int DEFAULT NULL COMMENT '初始号额',
  `used_quota` int DEFAULT NULL COMMENT '已用号额',
  `medical_record_status` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '病历状态',
  `receivable_amount` decimal(10,2) DEFAULT NULL COMMENT '应收金额',
  `payment_method` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '收费方式',
  PRIMARY KEY (`appointment_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='挂号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `disease_id` int NOT NULL AUTO_INCREMENT COMMENT '疾病ID',
  `disease_code` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '疾病编码',
  `disease_name` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '疾病名称',
  `icd_code` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT 'ICD编码',
  `disease_type` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '疾病类型',
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
  `name` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '医生姓名',
  `department` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '科室',
  `title` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '职称',
  `specialty` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '专业',
  `contact_number` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
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
  `drug_code` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '药品编码',
  `drug_name` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '药品名称',
  `drug_specification` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '药品规格',
  `packaging_unit` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '包装单位',
  `manufacturer` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '生产厂家',
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
-- Table structure for table `examination_requests`
--

DROP TABLE IF EXISTS `examination_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examination_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `appointment_id` int DEFAULT NULL COMMENT '挂号ID',
  `exam_code` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '检查项目编码',
  `exam_name` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '检查项目名称',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `fee_category` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '费用类别',
  `purpose_requirements` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '目的和要求',
  `exam_location` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '检查地点',
  `notes` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '备注',
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
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_records` (
  `medical_record_id` int NOT NULL AUTO_INCREMENT COMMENT '病历ID',
  `appointment_id` int DEFAULT NULL COMMENT '挂号ID',
  `doctor_id` int DEFAULT NULL COMMENT '医生ID',
  `clinic_date` date DEFAULT NULL COMMENT '就诊日期',
  `chief_complaint` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '主诉',
  `present_illness_history` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '现病史',
  `treatment_history` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '现病治疗情况',
  `past_history` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '既往史',
  `allergy_history` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '过敏史',
  `physical_examination` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '体格检查',
  `diagnosis` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '诊断描述',
  `notes` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '备注',
  PRIMARY KEY (`medical_record_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`),
  CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bg_0900_ai_ci COMMENT='病历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_records`
--

LOCK TABLES `medical_records` WRITE;
/*!40000 ALTER TABLE `medical_records` DISABLE KEYS */;
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
  `drug_name` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '药品名称',
  `drug_specification` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci DEFAULT NULL COMMENT '药品规格',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `usage` text COLLATE utf8mb4_bg_0900_ai_ci COMMENT '用法',
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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '角色名称',
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_bg_0900_ai_ci NOT NULL COMMENT '密码',
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
-- Dumping events for database 'ry-vue'
--

--
-- Dumping routines for database 'ry-vue'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-06 17:44:00
