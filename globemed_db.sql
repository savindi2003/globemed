-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: globemed_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `appoinment`
--

DROP TABLE IF EXISTS `appoinment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appoinment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `doctor_app_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `room_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `appoinment_status` varchar(45) NOT NULL,
  `reason_id` int DEFAULT NULL,
  `description` text,
  `appoinment_id` varchar(50) DEFAULT NULL,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appoinment_doctor_app1_idx` (`doctor_app_id`),
  KEY `fk_appoinment_branch1_idx` (`branch_id`),
  KEY `fk_appoinment_room1_idx` (`room_id`),
  KEY `fk_appoinment_patient1_idx` (`patient_id`),
  KEY `FK_appoinment_reasons` (`reason_id`),
  CONSTRAINT `fk_appoinment_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `fk_appoinment_doctor_app1` FOREIGN KEY (`doctor_app_id`) REFERENCES `doctor_app` (`id`),
  CONSTRAINT `fk_appoinment_patient1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `FK_appoinment_reasons` FOREIGN KEY (`reason_id`) REFERENCES `reasons` (`id`),
  CONSTRAINT `fk_appoinment_room1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appoinment`
--

LOCK TABLES `appoinment` WRITE;
/*!40000 ALTER TABLE `appoinment` DISABLE KEYS */;
INSERT INTO `appoinment` VALUES (1,'2025-08-25','07:30:00',1,1,1,4,'BOOKED',1,'Prenatal check-up (second trimester)','44',38000),(2,'2025-08-25','08:00:00',1,1,1,5,'BOOKED',1,'Skin allergy consultation','123445',3000),(3,'2025-08-25','07:00:00',1,1,2,16,'BOOKED',2,'Psychiatry appointment for stress management','44',2000),(4,'2025-08-25','13:15:00',2,1,1,17,'BOOKED',2,'Dermatology check for acne treatment','34',8120),(5,'2025-08-25','13:00:00',2,1,1,17,'BOOKED',2,'ENT consultation for sinus issues','33',6700),(6,'2025-08-25','09:45:00',1,1,1,18,'BOOKED',2,'Orthopedic consultation for knee pain','2',5600),(7,'2025-08-29','07:15:00',1,1,1,19,'BOOKED',1,'Consultation for recurring migraine headaches','123',4000),(8,'2025-08-25','07:15:00',1,1,1,20,'BOOKED',1,'Eye test for new prescription glasses','11',3800),(9,'2025-08-25','08:30:00',1,1,1,21,'BOOKED',1,'Dental cleaning and cavity check','1756032586416',2900),(10,'2025-08-25','08:15:00',1,1,1,21,'BOOKED',1,'Pediatric vaccination - 6 months','1756032605960',4500),(11,'2025-08-25','14:30:00',2,1,1,23,'BOOKED',1,'Routine diabetes management visit','1756055533479',2600),(12,'2025-08-29','07:30:00',1,1,1,24,'BOOKED',1,'General check-up and blood pressure monitoring','1756189596334',2500),(20,'2025-09-29','13:15:00',2,1,1,47,'BOOKED',1,'General check-up and blood pressure monitoring','1758690162086',2700),(21,'2025-09-29','13:00:00',2,1,1,49,'BOOKED',1,'test 2','1758695827476',2700);
/*!40000 ALTER TABLE `appoinment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_amount` varchar(45) NOT NULL,
  `billing_date` date NOT NULL,
  `billing_time` time NOT NULL,
  `status` varchar(45) NOT NULL,
  `appoinment_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `base_amount` double DEFAULT NULL,
  `extra_amount` double DEFAULT NULL,
  `pre_amount` double DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `prescription_id` int DEFAULT NULL,
  `services_id` int DEFAULT NULL,
  `bill_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_billing_appoinment1_idx` (`appoinment_id`),
  KEY `fk_billing_patient1_idx` (`patient_id`),
  KEY `FK_billing_prescription` (`prescription_id`),
  KEY `FK_billing_services` (`services_id`),
  CONSTRAINT `fk_billing_appoinment1` FOREIGN KEY (`appoinment_id`) REFERENCES `appoinment` (`id`),
  CONSTRAINT `fk_billing_patient1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `FK_billing_prescription` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptionitem` (`id`),
  CONSTRAINT `FK_billing_services` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,'10400.00','2025-08-25','12:02:17','Pending',10,21,4500,5300,600,'Insurance Claim',3,3,'1756103477561'),(2,'5810.00','2025-08-25','12:26:51','Pending',10,21,4500,1200,110,'Insurance Claim',4,4,'1756104966997'),(3,'9079.00','2025-08-25','12:33:43','Pending',10,21,4500,399,4180,'Insurance Claim',5,5,'1756105372671'),(4,'5100.00','2025-08-25','13:04:14','SETTLED',11,23,2600,300,2200,'Insurance Claim',6,6,'1756107194892'),(5,'5000.00','2025-08-25','13:08:07','Pending',11,23,2600,200,2200,'Insurance Claim',7,7,'1756107444447'),(6,'7100.00','2025-09-01','23:25:10','Pending',9,21,2900,2000,2200,'Insurance Claim',8,8,'1756749189394'),(7,'8800.00','2025-09-01','23:37:22','Paid',10,21,4500,2300,2000,'Cash or Card',9,9,'1756749976173'),(8,'10900.00','2025-09-01','23:38:27','Pending',12,19,2500,2000,6400,'Insurance Claim',10,10,'1756750045557'),(9,'15400.00','2025-09-02','13:51:13','Pending',7,19,4000,4500,6900,'Insurance Claim',11,11,'1756801188700'),(10,'44880.00','2025-09-02','14:09:14','Pending',10,21,4500,40000,380,'Insurance Claim',12,12,'1756802302234'),(11,'4650.00','2025-09-10','23:34:23','Pending',9,21,2900,1350,400,'Insurance Claim',13,13,'1757527306851'),(12,'9000.00','2025-09-10','23:37:26','Pending',6,5,5600,3000,400,'Insurance Claim',14,14,'1757527600920'),(19,'46300.00','2025-09-12','23:12:06','Paid',1,4,38000,5300,3000,'Cash or Card',21,21,'1757698800822'),(20,'10776.00','2025-09-23','00:34:34','Pending',6,21,5600,5000,176,'Insurance Claim',22,22,'1758567171302'),(21,'11320.00','2025-09-24','10:34:31','Pending',4,17,8120,1000,2200,'Insurance Claim',23,23,'1758690217435'),(22,'5700.00','2025-09-24','12:14:03','Paid',12,24,2500,2000,1200,'Cash or Card',24,24,'1758696112287'),(23,'6300.00','2025-09-24','12:15:50','Pending',2,21,3000,2300,1000,'Insurance Claim',25,25,'1758696272317');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Gampaha'),(2,'Ragama');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'ClinicSchedule'),(2,'DiagnosticsSchedule'),(3,'SurgerySchedule'),(4,'Emergency Department'),(5,'Outpatient Department'),(6,'Inpatient / Wards'),(7,'Internal Medicine'),(8,'General Surgery'),(9,'Pediatrics'),(10,'Obstetrics & Gynecology'),(11,'Cardiology'),(12,'Neurology'),(13,'Orthopedics'),(14,'Ophthalmology'),(15,'ENT (Ear, Nose, Throat)'),(16,'Dermatology'),(17,'Psychiatry'),(18,'Oncology'),(19,'Nephrology'),(20,'Urology'),(21,'Gastroenterology'),(22,'Pulmonology'),(23,'Endocrinology'),(24,'Rheumatology'),(25,'Infectious Diseases');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `patient_id` int NOT NULL DEFAULT '0',
  `testType` varchar(50) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `FK__patient_id_d` (`patient_id`),
  CONSTRAINT `FK__patient_id_d` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'2025-08-27 22:25:34',21,'Blood Pressure Check\'','BP: 145/95 mmHg','Stage 1 hypertension, monitor regularly'),(2,'2025-08-27 22:25:53',21,'Kidney Function Test','Creatinine: 1.8 mg/dL','Mildly elevated, possible renal impairment'),(3,'2025-08-27 22:26:11',4,'Pregnancy Test','Positive','Confirmed pregnancy, recommend ultrasound'),(4,'2025-09-01 22:41:46',23,'Allergy Test','Positive for dust mites','Allergic rhinitis suspected'),(5,'2025-09-01 23:11:05',22,'Vitamin D Test','25(OH)D: 18 ng/mL','Vitamin D deficiency, recommend supplements'),(6,'2025-08-27 09:30:00',21,'Blood Sugar Test','FBS: 110 mg/dL','Slightly above normal fasting blood sugar level'),(7,'2025-08-27 11:00:00',21,'Cholesterol Test','LDL: 130 mg/dL, HDL: 45 mg/dL','Borderline high LDL cholesterol'),(8,'2025-08-28 14:15:00',22,'CBC (Complete Blood Count)','WBC: 7,800 /µL, Hb: 13.5 g/dL','Normal blood count values'),(9,'2025-08-28 16:45:00',23,'X-Ray (Chest)','Mild opacity in right lung','Possible chest infection, recommend antibiotics'),(10,'2025-09-01 10:30:00',22,'ECG (Electrocardiogram)','Normal sinus rhythm','No abnormalities detected'),(11,'2025-09-01 13:00:00',24,'Liver Function Test','ALT: 70 U/L, AST: 65 U/L','Elevated liver enzymes, possible fatty liver'),(12,'2025-09-02 09:45:00',19,'Urine Test','Protein: Negative, Glucose: Negative','No signs of infection or diabetes'),(13,'2025-09-02 15:30:00',21,'COVID-19 PCR Test','Negative','No SARS-CoV-2 detected'),(14,'2025-09-03 12:00:00',21,'MRI (Brain)','Normal scan','No abnormalities detected in brain structure'),(15,'2025-09-04 08:15:00',21,'Thyroid Function Test','TSH: 6.2 µIU/mL','Slightly elevated TSH, possible hypothyroidism'),(17,'2025-09-24 12:00:07',21,'Eye Examination','Gastroenterology','Prescribed Omeprazole 20mg daily, advised to avoid spicy foods');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_item`
--

DROP TABLE IF EXISTS `diagnosis_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  `result` text NOT NULL,
  `diagnosis_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_diagnosis_item_diagnosis` (`diagnosis_id`),
  CONSTRAINT `FK_diagnosis_item_diagnosis` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_item`
--

LOCK TABLES `diagnosis_item` WRITE;
/*!40000 ALTER TABLE `diagnosis_item` DISABLE KEYS */;
INSERT INTO `diagnosis_item` VALUES (1,'s xbs x',' xhsxhs ','sxbs xbs bxs',1),(2,'s xbs x','sb xbsx sbx hsxh','jjjjjjjjjjjjjj jjjjjjjjjjjjj',1),(3,'sx sbjxs','ssssssssssssss','sssssssssssss',2);
/*!40000 ALTER TABLE `diagnosis_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_app`
--

DROP TABLE IF EXISTS `doctor_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_app` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time_to` time NOT NULL,
  `time_from` time NOT NULL,
  `dates` varchar(45) NOT NULL,
  `clinic` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `doc_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctor_app_staff1_idx` (`doc_id`),
  CONSTRAINT `fk_doctor_app_staff1` FOREIGN KEY (`doc_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_app`
--

LOCK TABLES `doctor_app` WRITE;
/*!40000 ALTER TABLE `doctor_app` DISABLE KEYS */;
INSERT INTO `doctor_app` VALUES (1,'07:00:00','12:00:00','MONDAY,FRIDAY','Clinic 3','ACTIVE',2),(2,'13:00:00','17:00:00','MONDAY','Clinic 6','ACTIVE',1);
/*!40000 ALTER TABLE `doctor_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_id` int NOT NULL DEFAULT '0',
  `policy_no` varchar(45) NOT NULL,
  `nic` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_insurance_insurance_providers` (`provider_id`),
  CONSTRAINT `FK_insurance_insurance_providers` FOREIGN KEY (`provider_id`) REFERENCES `insurance_providers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,8,'Hamaka','22'),(6,10,'ff','777');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_claim`
--

DROP TABLE IF EXISTS `insurance_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_claim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `claim_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `insurancepro_id` int NOT NULL,
  `policy_number` varchar(50) NOT NULL DEFAULT '0',
  `billing_id` int NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `p_nic` varchar(50) DEFAULT NULL,
  `p_relationship` varchar(50) DEFAULT NULL,
  `approval_status` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_insurance_claim_billing1_idx` (`billing_id`),
  KEY `fk_insurance_claim_insurance1_idx` (`insurancepro_id`) USING BTREE,
  CONSTRAINT `fk_insurance_claim_billing1` FOREIGN KEY (`billing_id`) REFERENCES `billing` (`id`),
  CONSTRAINT `FK_insurance_claim_insurance_providers` FOREIGN KEY (`insurancepro_id`) REFERENCES `insurance_providers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_claim`
--

LOCK TABLES `insurance_claim` WRITE;
/*!40000 ALTER TABLE `insurance_claim` DISABLE KEYS */;
INSERT INTO `insurance_claim` VALUES (1,'1756107254305',1,'123123123123',4,5100,'2025-08-25 13:04:41','200389922329','Mother','SETTLED'),(2,'1756107487967',2,'123000909',5,5000,'2025-08-25 13:08:43','200399900902','Mkmsk','SETTLED'),(3,'1756749310571',1,'112233',6,7100,'2025-09-01 23:25:33','200389900986',' mxnxjns','MEDICAL_VERIFIED'),(4,'1756750107617',1,'2222',8,10900,'2025-09-01 23:38:51','200389900292','cdbcdbc','SUBMITTED'),(5,'1756801273761',3,'890890',9,15400,'2025-09-02 13:51:49','200212299019','nxjsxjsj','POLICY_VALIDATED'),(6,'1756802354663',8,'MTIwOTAx',10,44880,'2025-09-02 14:09:38','MjAwMzk4ODExOTAy','MWRqYmRj','MEDICAL_VERIFIED'),(7,'1757527646808',1,'MTEyMjMzNDQ=',12,9000,'2025-09-10 23:37:47','MjAwMzIyMjMzMjEy','ampu','FINANCE_APPROVED'),(8,'1758690272149',2,'MTIzNDU2NTI0MjUy',21,11320,'2025-09-24 10:34:59','MjAwMzc1NTAwOTUy','VGVzdA==','MEDICAL_VERIFIED'),(9,'1758696350356',1,'MTIzNDU2Nzg5',23,6300,'2025-09-24 12:16:18','MjAwMzc1NTAwOTUy','VGVzdA==','POLICY_VALIDATED');
/*!40000 ALTER TABLE `insurance_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_providers`
--

DROP TABLE IF EXISTS `insurance_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_providers`
--

LOCK TABLES `insurance_providers` WRITE;
/*!40000 ALTER TABLE `insurance_providers` DISABLE KEYS */;
INSERT INTO `insurance_providers` VALUES (1,'AIA Sri Lanka'),(2,'Allianz Insurance Lanka Ltd'),(3,'Ceylinco Life Insurance Limited'),(4,'Fairfirst Insurance Limited'),(5,'Janashakthi Life'),(6,'LOLC Life Assurance'),(7,'SANASA Life Insurance Co. PLC'),(8,'Union Assurance Ltd.'),(9,'Softlogic Life'),(10,'Sri Lanka Insurance');
/*!40000 ALTER TABLE `insurance_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_role`
--

DROP TABLE IF EXISTS `job_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_job_role_parent_role` (`parent_id`),
  CONSTRAINT `FK_job_role_parent_role` FOREIGN KEY (`parent_id`) REFERENCES `parent_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_role`
--

LOCK TABLES `job_role` WRITE;
/*!40000 ALTER TABLE `job_role` DISABLE KEYS */;
INSERT INTO `job_role` VALUES (1,'Doctor',1),(2,'Nurse',1),(3,'Pharmacist',1),(4,'Admin',2),(5,'Attendent',2),(6,'Medical Staff',NULL),(7,'Other Staff',NULL),(8,'Receptionist',2),(14,'Test',2);
/*!40000 ALTER TABLE `job_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=792 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'LOG] Load all patients at 2025-09-02T23:32:31.319405100','2025-09-02 17:02:20'),(2,'LOG] Load all patients at 2025-09-03 16:36:44','2025-09-03 16:36:44'),(3,'LOG] Load all patients at 2025-09-04 12:43:30','2025-09-04 12:43:30'),(4,'LOG] Load all patients at 2025-09-04 12:59:09','2025-09-04 12:59:09'),(5,'LOG] Load all patients at 2025-09-04 13:16:29','2025-09-04 13:16:29'),(6,'LOG] Load all patients at 2025-09-04 14:01:51','2025-09-04 14:01:51'),(7,'LOG] Load all patients at 2025-09-04 14:18:05','2025-09-04 14:18:05'),(8,'LOG] Load all patients at 2025-09-04 14:20:06','2025-09-04 14:20:06'),(9,'LOG] Load all patients at 2025-09-04 20:06:21','2025-09-04 20:06:21'),(10,'LOG] Load all patients at 2025-09-04 20:08:25','2025-09-04 20:08:25'),(11,'LOG] Load all patients at 2025-09-04 20:09:39','2025-09-04 20:09:39'),(12,'LOG] Load all patients at 2025-09-04 20:10:16','2025-09-04 20:10:16'),(13,'LOG] Load all patients at 2025-09-04 20:12:48','2025-09-04 20:12:48'),(14,'[LOG] Load all patients at 2025-09-04 23:10:26','2025-09-04 23:10:26'),(15,'[LOG] Load diagnoses for patientId = 18 at 2025-09-04 23:10:30','2025-09-04 23:10:30'),(16,'[LOG] Load treatments for patientId = 18 at 2025-09-04 23:10:30','2025-09-04 23:10:30'),(17,'[LOG] Load appointments for patientId = 18 at 2025-09-04 23:10:30','2025-09-04 23:10:30'),(18,'[LOG] Load diagnoses for patientId = 29 at 2025-09-04 23:14:02','2025-09-04 23:14:02'),(19,'[LOG] Load treatments for patientId = 29 at 2025-09-04 23:14:02','2025-09-04 23:14:02'),(20,'[LOG] Load appointments for patientId = 29 at 2025-09-04 23:14:02','2025-09-04 23:14:02'),(21,'[LOG] Update Patient -> �� at 2025-09-04 23:14:09','2025-09-04 23:14:09'),(22,'[LOG] Load all staff at 2025-09-04 23:15:06','2025-09-04 23:15:06'),(23,'[LOG] Update staff -> Kamashi  at 2025-09-04 23:15:20','2025-09-04 23:15:20'),(24,'[LOG] Load all staff at 2025-09-04 23:15:22','2025-09-04 23:15:22'),(25,'[LOG] Load all permissions at 2025-09-04 23:15:33','2025-09-04 23:15:33'),(26,'[LOG] Load permissions for role_id = 8 at 2025-09-04 23:15:41','2025-09-04 23:15:41'),(27,'[LOG] Load permissions for role_id = 8 at 2025-09-04 23:15:41','2025-09-04 23:15:41'),(28,'[LOG] Insert permission 11 for role_id = 8 at 2025-09-04 23:15:52','2025-09-04 23:15:52'),(29,'[LOG] Load all staff at 2025-09-10 11:58:23','2025-09-10 11:58:23'),(30,'[LOG] Load all permissions at 2025-09-10 11:58:39','2025-09-10 11:58:39'),(31,'[LOG] Load all patients at 2025-09-10 12:00:06','2025-09-10 12:00:06'),(32,'[LOG] Load diagnoses for patientId = 30 at 2025-09-10 12:00:11','2025-09-10 12:00:11'),(33,'[LOG] Load treatments for patientId = 30 at 2025-09-10 12:00:11','2025-09-10 12:00:11'),(34,'[LOG] Load appointments for patientId = 30 at 2025-09-10 12:00:11','2025-09-10 12:00:11'),(35,'[LOG] Load diagnoses for patientId = 21 at 2025-09-10 12:00:15','2025-09-10 12:00:15'),(36,'[LOG] Load treatments for patientId = 21 at 2025-09-10 12:00:15','2025-09-10 12:00:15'),(37,'[LOG] Load appointments for patientId = 21 at 2025-09-10 12:00:15','2025-09-10 12:00:15'),(38,'[LOG] Load all appointments at 2025-09-10 12:00:36','2025-09-10 12:00:36'),(39,'[LOG] Load all bills at 2025-09-10 12:00:48','2025-09-10 12:00:48'),(40,'[LOG] Load insurance list at 2025-09-10 12:01:04','2025-09-10 12:01:04'),(41,'[LOG] Load insurance details for id = 3 at 2025-09-10 12:01:09','2025-09-10 12:01:09'),(42,'[LOG] Update claim 3 to status POLICY_VALIDATED at 2025-09-10 12:01:09','2025-09-10 12:01:09'),(43,'[LOG] Update claim 3 to status POLICY_VALIDATED at 2025-09-10 12:01:09','2025-09-10 12:01:09'),(44,'[LOG] Update claim 3 to status MEDICAL_VERIFIED at 2025-09-10 12:01:09','2025-09-10 12:01:09'),(45,'[LOG] Update claim 3 to status MEDICAL_VERIFIED at 2025-09-10 12:01:09','2025-09-10 12:01:09'),(46,'[LOG] Load all patients at 2025-09-10 12:59:07','2025-09-10 12:59:07'),(47,'[LOG] Load all appointments at 2025-09-10 12:59:12','2025-09-10 12:59:12'),(48,'[LOG] Load all appointments at 2025-09-10 13:04:12','2025-09-10 13:04:12'),(49,'[LOG] Search appointments by doctor -> 1 at 2025-09-10 13:04:16','2025-09-10 13:04:16'),(50,'[LOG] Search appointments by doctor -> 1 at 2025-09-10 13:04:16','2025-09-10 13:04:16'),(51,'[LOG] Search appointments by doctor -> 0 at 2025-09-10 13:04:18','2025-09-10 13:04:18'),(52,'[LOG] Search appointments by doctor -> 0 at 2025-09-10 13:04:18','2025-09-10 13:04:18'),(53,'[LOG] Load all appointments at 2025-09-10 13:04:18','2025-09-10 13:04:18'),(54,'[LOG] Search appointments by reason -> 2 at 2025-09-10 13:04:20','2025-09-10 13:04:20'),(55,'[LOG] Search appointments by reason -> 2 at 2025-09-10 13:04:20','2025-09-10 13:04:20'),(56,'[LOG] Search appointments by reason -> 0 at 2025-09-10 13:04:21','2025-09-10 13:04:21'),(57,'[LOG] Search appointments by reason -> 0 at 2025-09-10 13:04:21','2025-09-10 13:04:21'),(58,'[LOG] Load all appointments at 2025-09-10 13:04:21','2025-09-10 13:04:21'),(59,'[LOG] Load all patients at 2025-09-10 13:06:58','2025-09-10 13:06:58'),(60,'[LOG] Search patients by name -> s at 2025-09-10 13:07:04','2025-09-10 13:07:04'),(61,'[LOG] Search patients by name -> ss at 2025-09-10 13:07:04','2025-09-10 13:07:04'),(62,'[LOG] Search patients by name -> sss at 2025-09-10 13:07:04','2025-09-10 13:07:04'),(63,'[LOG] Search patients by name -> ss at 2025-09-10 13:07:05','2025-09-10 13:07:05'),(64,'[LOG] Search patients by name -> s at 2025-09-10 13:07:06','2025-09-10 13:07:06'),(65,'[LOG] Search patients by name ->  at 2025-09-10 13:07:07','2025-09-10 13:07:07'),(66,'[LOG] Search patients by name -> 9 at 2025-09-10 13:07:08','2025-09-10 13:07:08'),(67,'[LOG] Search patients by name -> 9 at 2025-09-10 13:07:09','2025-09-10 13:07:09'),(68,'[LOG] Search patients by name -> 9 at 2025-09-10 13:07:09','2025-09-10 13:07:09'),(69,'[LOG] Search patients by name ->  at 2025-09-10 13:07:09','2025-09-10 13:07:09'),(70,'[LOG] Search patients by name -> i at 2025-09-10 13:07:14','2025-09-10 13:07:14'),(71,'[LOG] Search patients by name ->  at 2025-09-10 13:07:18','2025-09-10 13:07:18'),(72,'[LOG] Search patients by name -> s at 2025-09-10 13:07:21','2025-09-10 13:07:21'),(73,'[LOG] Search patients by name -> ss at 2025-09-10 13:07:21','2025-09-10 13:07:21'),(74,'[LOG] Search patients by name -> ss= at 2025-09-10 13:07:23','2025-09-10 13:07:23'),(75,'[LOG] Search patients by name -> ss at 2025-09-10 13:07:23','2025-09-10 13:07:23'),(76,'[LOG] Search patients by name -> s at 2025-09-10 13:07:24','2025-09-10 13:07:24'),(77,'[LOG] Search patients by name ->  at 2025-09-10 13:07:25','2025-09-10 13:07:25'),(78,'[LOG] Search patients by name -> j at 2025-09-10 13:07:31','2025-09-10 13:07:31'),(79,'[LOG] Search patients by name -> jb at 2025-09-10 13:07:32','2025-09-10 13:07:32'),(80,'[LOG] Search patients by name -> j at 2025-09-10 13:07:33','2025-09-10 13:07:33'),(81,'[LOG] Search patients by name ->  at 2025-09-10 13:07:35','2025-09-10 13:07:35'),(82,'[LOG] Search patients by name -> 6 at 2025-09-10 13:07:37','2025-09-10 13:07:37'),(83,'[LOG] Search patients by name ->  at 2025-09-10 13:07:39','2025-09-10 13:07:39'),(84,'[LOG] Search patients by name -> k at 2025-09-10 13:07:40','2025-09-10 13:07:40'),(85,'[LOG] Search patients by name -> kv at 2025-09-10 13:07:42','2025-09-10 13:07:42'),(86,'[LOG] Search patients by name -> k at 2025-09-10 13:07:43','2025-09-10 13:07:43'),(87,'[LOG] Search patients by name ->  at 2025-09-10 13:07:54','2025-09-10 13:07:54'),(88,'[LOG] Search patients by name -> y at 2025-09-10 13:08:18','2025-09-10 13:08:18'),(89,'[LOG] Search patients by name -> ym at 2025-09-10 13:08:20','2025-09-10 13:08:20'),(90,'[LOG] Search patients by name -> ymh at 2025-09-10 13:08:24','2025-09-10 13:08:24'),(91,'[LOG] Search patients by name -> ymho at 2025-09-10 13:08:25','2025-09-10 13:08:25'),(92,'[LOG] Search patients by name ->  at 2025-09-10 13:08:29','2025-09-10 13:08:29'),(93,'[LOG] Load all patients at 2025-09-10 13:13:45','2025-09-10 13:13:45'),(94,'[LOG] Search patients by name -> Yg== at 2025-09-10 13:13:49','2025-09-10 13:13:49'),(95,'[LOG] Search patients by name -> Ymg= at 2025-09-10 13:13:50','2025-09-10 13:13:50'),(96,'[LOG] Search patients by name -> Yg== at 2025-09-10 13:13:51','2025-09-10 13:13:51'),(97,'[LOG] Search patients by name ->  at 2025-09-10 13:13:51','2025-09-10 13:13:51'),(98,'[LOG] Search patients by name ->  at 2025-09-10 13:13:57','2025-09-10 13:13:57'),(99,'[LOG] Search patients by name -> WQ== at 2025-09-10 13:13:57','2025-09-10 13:13:57'),(100,'[LOG] Search patients by name -> WQ== at 2025-09-10 13:13:58','2025-09-10 13:13:58'),(101,'[LOG] Search patients by name -> WW0= at 2025-09-10 13:13:58','2025-09-10 13:13:58'),(102,'[LOG] Search patients by name -> WQ== at 2025-09-10 13:13:59','2025-09-10 13:13:59'),(103,'[LOG] Search patients by name ->  at 2025-09-10 13:14:00','2025-09-10 13:14:00'),(104,'[LOG] Search patients by name -> bnM= at 2025-09-10 13:14:03','2025-09-10 13:14:03'),(105,'[LOG] Search patients by name -> bnM= at 2025-09-10 13:14:03','2025-09-10 13:14:03'),(106,'[LOG] Search patients by name -> bnNjag== at 2025-09-10 13:14:03','2025-09-10 13:14:03'),(107,'[LOG] Search patients by name -> bnNjam4= at 2025-09-10 13:14:03','2025-09-10 13:14:03'),(108,'[LOG] Search patients by name -> bnNjam4= at 2025-09-10 13:14:03','2025-09-10 13:14:03'),(109,'[LOG] Search patients by name ->  at 2025-09-10 13:14:04','2025-09-10 13:14:04'),(110,'[LOG] Load all patients at 2025-09-10 13:27:20','2025-09-10 13:27:20'),(111,'[LOG] Load diagnoses for patientId = 4 at 2025-09-10 13:27:26','2025-09-10 13:27:26'),(112,'[LOG] Load treatments for patientId = 4 at 2025-09-10 13:27:26','2025-09-10 13:27:26'),(113,'[LOG] Load appointments for patientId = 4 at 2025-09-10 13:27:26','2025-09-10 13:27:26'),(114,'[LOG] Load all patients at 2025-09-10 13:30:47','2025-09-10 13:30:47'),(115,'[LOG] Load diagnoses for patientId = 21 at 2025-09-10 13:31:21','2025-09-10 13:31:21'),(116,'[LOG] Load treatments for patientId = 21 at 2025-09-10 13:31:21','2025-09-10 13:31:21'),(117,'[LOG] Load appointments for patientId = 21 at 2025-09-10 13:31:21','2025-09-10 13:31:21'),(118,'[LOG] Load all patients at 2025-09-10 13:31:40','2025-09-10 13:31:40'),(119,'[LOG] Load all patients at 2025-09-10 13:32:44','2025-09-10 13:32:44'),(120,'[LOG] Search patients by name -> s at 2025-09-10 13:32:48','2025-09-10 13:32:48'),(121,'[LOG] Search patients by name -> sm at 2025-09-10 13:32:48','2025-09-10 13:32:48'),(122,'[LOG] Search patients by name -> sm at 2025-09-10 13:32:49','2025-09-10 13:32:49'),(123,'[LOG] Search patients by name -> smV at 2025-09-10 13:32:49','2025-09-10 13:32:49'),(124,'[LOG] Search patients by name -> smV at 2025-09-10 13:32:50','2025-09-10 13:32:50'),(125,'[LOG] Search patients by name -> smVt at 2025-09-10 13:32:50','2025-09-10 13:32:50'),(126,'[LOG] Search patients by name ->  at 2025-09-10 13:32:51','2025-09-10 13:32:51'),(127,'[LOG] Load diagnoses for patientId = 23 at 2025-09-10 13:33:08','2025-09-10 13:33:08'),(128,'[LOG] Load treatments for patientId = 23 at 2025-09-10 13:33:08','2025-09-10 13:33:08'),(129,'[LOG] Load appointments for patientId = 23 at 2025-09-10 13:33:08','2025-09-10 13:33:08'),(130,'[LOG] Insert Patient -> Shalika Omilika at 2025-09-10 13:34:49','2025-09-10 13:34:49'),(131,'[LOG] Load all patients at 2025-09-10 13:34:51','2025-09-10 13:34:51'),(132,'[LOG] Search patients by name -> s at 2025-09-10 13:35:00','2025-09-10 13:35:00'),(133,'[LOG] Search patients by name -> sh at 2025-09-10 13:35:00','2025-09-10 13:35:00'),(134,'[LOG] Search patients by name -> sha at 2025-09-10 13:35:01','2025-09-10 13:35:01'),(135,'[LOG] Search patients by name -> shal at 2025-09-10 13:35:01','2025-09-10 13:35:01'),(136,'[LOG] Search patients by name -> shali at 2025-09-10 13:35:01','2025-09-10 13:35:01'),(137,'[LOG] Search patients by name -> shalik at 2025-09-10 13:35:02','2025-09-10 13:35:02'),(138,'[LOG] Search patients by name -> shalika at 2025-09-10 13:35:02','2025-09-10 13:35:02'),(139,'[LOG] Search patients by name ->  at 2025-09-10 13:35:03','2025-09-10 13:35:03'),(140,'[LOG] Load diagnoses for patientId = 33 at 2025-09-10 13:35:05','2025-09-10 13:35:05'),(141,'[LOG] Load treatments for patientId = 33 at 2025-09-10 13:35:05','2025-09-10 13:35:05'),(142,'[LOG] Load appointments for patientId = 33 at 2025-09-10 13:35:05','2025-09-10 13:35:05'),(143,'[LOG] Load diagnoses for patientId = 33 at 2025-09-10 13:35:38','2025-09-10 13:35:38'),(144,'[LOG] Load treatments for patientId = 33 at 2025-09-10 13:35:38','2025-09-10 13:35:38'),(145,'[LOG] Load appointments for patientId = 33 at 2025-09-10 13:35:38','2025-09-10 13:35:38'),(146,'[LOG] Load all patients at 2025-09-10 13:36:31','2025-09-10 13:36:31'),(147,'[LOG] Load diagnoses for patientId = 33 at 2025-09-10 13:36:34','2025-09-10 13:36:34'),(148,'[LOG] Load treatments for patientId = 33 at 2025-09-10 13:36:34','2025-09-10 13:36:34'),(149,'[LOG] Load appointments for patientId = 33 at 2025-09-10 13:36:34','2025-09-10 13:36:34'),(150,'[LOG] Update Patient -> Shalika Madushi at 2025-09-10 13:36:49','2025-09-10 13:36:49'),(151,'[LOG] Search patients by name -> b at 2025-09-10 13:37:09','2025-09-10 13:37:09'),(152,'[LOG] Search patients by name ->  at 2025-09-10 13:37:10','2025-09-10 13:37:10'),(153,'[LOG] Search patients by name ->  at 2025-09-10 13:37:10','2025-09-10 13:37:10'),(154,'[LOG] Load diagnoses for patientId = 33 at 2025-09-10 13:37:19','2025-09-10 13:37:19'),(155,'[LOG] Load treatments for patientId = 33 at 2025-09-10 13:37:19','2025-09-10 13:37:19'),(156,'[LOG] Load appointments for patientId = 33 at 2025-09-10 13:37:19','2025-09-10 13:37:19'),(157,'[LOG] Load all patients at 2025-09-10 13:38:10','2025-09-10 13:38:10'),(158,'[LOG] Load diagnoses for patientId = 33 at 2025-09-10 13:38:13','2025-09-10 13:38:13'),(159,'[LOG] Load treatments for patientId = 33 at 2025-09-10 13:38:13','2025-09-10 13:38:13'),(160,'[LOG] Load appointments for patientId = 33 at 2025-09-10 13:38:13','2025-09-10 13:38:13'),(161,'[LOG] Update Patient -> Shalika Madushi at 2025-09-10 13:38:31','2025-09-10 13:38:31'),(162,'[LOG] Search patients by name -> s at 2025-09-10 13:38:46','2025-09-10 13:38:46'),(163,'[LOG] Search patients by name -> sh at 2025-09-10 13:38:47','2025-09-10 13:38:47'),(164,'[LOG] Search patients by name ->  at 2025-09-10 13:38:49','2025-09-10 13:38:49'),(165,'[LOG] Load diagnoses for patientId = 33 at 2025-09-10 13:38:53','2025-09-10 13:38:53'),(166,'[LOG] Load treatments for patientId = 33 at 2025-09-10 13:38:53','2025-09-10 13:38:53'),(167,'[LOG] Load appointments for patientId = 33 at 2025-09-10 13:38:53','2025-09-10 13:38:53'),(168,'[LOG] Search patients by name -> s at 2025-09-10 13:43:26','2025-09-10 13:43:26'),(169,'[LOG] Search patients by name ->  at 2025-09-10 13:43:26','2025-09-10 13:43:26'),(170,'[LOG] Load diagnoses for patientId = 4 at 2025-09-10 13:43:34','2025-09-10 13:43:34'),(171,'[LOG] Load treatments for patientId = 4 at 2025-09-10 13:43:34','2025-09-10 13:43:34'),(172,'[LOG] Load appointments for patientId = 4 at 2025-09-10 13:43:34','2025-09-10 13:43:34'),(173,'[LOG] Update Patient -> Kaveesha Sakuni at 2025-09-10 13:44:02','2025-09-10 13:44:02'),(174,'[LOG] Load diagnoses for patientId = 5 at 2025-09-10 13:44:10','2025-09-10 13:44:10'),(175,'[LOG] Load treatments for patientId = 5 at 2025-09-10 13:44:10','2025-09-10 13:44:10'),(176,'[LOG] Load appointments for patientId = 5 at 2025-09-10 13:44:10','2025-09-10 13:44:10'),(177,'[LOG] Update Patient -> Nethmi Praerthana at 2025-09-10 13:44:40','2025-09-10 13:44:40'),(178,'[LOG] Update Patient -> Nethmi Praerthana at 2025-09-10 13:44:48','2025-09-10 13:44:48'),(179,'[LOG] Search patients by name -> d at 2025-09-10 13:44:54','2025-09-10 13:44:54'),(180,'[LOG] Search patients by name ->  at 2025-09-10 13:44:54','2025-09-10 13:44:54'),(181,'[LOG] Load diagnoses for patientId = 6 at 2025-09-10 13:44:58','2025-09-10 13:44:58'),(182,'[LOG] Load treatments for patientId = 6 at 2025-09-10 13:44:58','2025-09-10 13:44:58'),(183,'[LOG] Load appointments for patientId = 6 at 2025-09-10 13:44:58','2025-09-10 13:44:58'),(184,'[LOG] Update Patient -> Nisal Sachinthana at 2025-09-10 13:46:09','2025-09-10 13:46:09'),(185,'[LOG] Update Patient -> Nisal Sachinthana at 2025-09-10 13:46:25','2025-09-10 13:46:25'),(186,'[LOG] Load diagnoses for patientId = 10 at 2025-09-10 13:46:37','2025-09-10 13:46:37'),(187,'[LOG] Load treatments for patientId = 10 at 2025-09-10 13:46:37','2025-09-10 13:46:37'),(188,'[LOG] Load appointments for patientId = 10 at 2025-09-10 13:46:37','2025-09-10 13:46:37'),(189,'[LOG] Update Patient -> Hiranya Vithanage at 2025-09-10 13:46:44','2025-09-10 13:46:44'),(190,'[LOG] Search patients by name ->  at 2025-09-10 13:46:49','2025-09-10 13:46:49'),(191,'[LOG] Load diagnoses for patientId = 11 at 2025-09-10 13:46:52','2025-09-10 13:46:52'),(192,'[LOG] Load treatments for patientId = 11 at 2025-09-10 13:46:52','2025-09-10 13:46:52'),(193,'[LOG] Load appointments for patientId = 11 at 2025-09-10 13:46:52','2025-09-10 13:46:52'),(194,'[LOG] Update Patient -> Ajitha Heshan at 2025-09-10 13:47:11','2025-09-10 13:47:11'),(195,'[LOG] Load diagnoses for patientId = 12 at 2025-09-10 13:47:22','2025-09-10 13:47:22'),(196,'[LOG] Load treatments for patientId = 12 at 2025-09-10 13:47:22','2025-09-10 13:47:22'),(197,'[LOG] Load appointments for patientId = 12 at 2025-09-10 13:47:22','2025-09-10 13:47:22'),(198,'[LOG] Update Patient -> Schith Jayanath at 2025-09-10 13:47:27','2025-09-10 13:47:27'),(199,'[LOG] Load diagnoses for patientId = 13 at 2025-09-10 13:47:36','2025-09-10 13:47:36'),(200,'[LOG] Load treatments for patientId = 13 at 2025-09-10 13:47:36','2025-09-10 13:47:36'),(201,'[LOG] Load appointments for patientId = 13 at 2025-09-10 13:47:36','2025-09-10 13:47:36'),(202,'[LOG] Update Patient -> Dinesh Perera at 2025-09-10 13:47:40','2025-09-10 13:47:40'),(203,'[LOG] Search patients by name ->  at 2025-09-10 13:47:47','2025-09-10 13:47:47'),(204,'[LOG] Load diagnoses for patientId = 14 at 2025-09-10 13:48:18','2025-09-10 13:48:18'),(205,'[LOG] Load treatments for patientId = 14 at 2025-09-10 13:48:18','2025-09-10 13:48:18'),(206,'[LOG] Load appointments for patientId = 14 at 2025-09-10 13:48:18','2025-09-10 13:48:18'),(207,'[LOG] Update Patient -> Nilantha Prasad at 2025-09-10 13:48:22','2025-09-10 13:48:22'),(208,'[LOG] Load diagnoses for patientId = 15 at 2025-09-10 13:48:36','2025-09-10 13:48:36'),(209,'[LOG] Load treatments for patientId = 15 at 2025-09-10 13:48:36','2025-09-10 13:48:36'),(210,'[LOG] Load appointments for patientId = 15 at 2025-09-10 13:48:36','2025-09-10 13:48:36'),(211,'[LOG] Update Patient -> Ishan Chanuka at 2025-09-10 13:48:42','2025-09-10 13:48:42'),(212,'[LOG] Load diagnoses for patientId = 16 at 2025-09-10 13:48:54','2025-09-10 13:48:54'),(213,'[LOG] Load treatments for patientId = 16 at 2025-09-10 13:48:54','2025-09-10 13:48:54'),(214,'[LOG] Load appointments for patientId = 16 at 2025-09-10 13:48:54','2025-09-10 13:48:54'),(215,'[LOG] Update Patient -> Ysitha Perera at 2025-09-10 13:48:59','2025-09-10 13:48:59'),(216,'[LOG] Load diagnoses for patientId = 17 at 2025-09-10 13:49:10','2025-09-10 13:49:10'),(217,'[LOG] Load treatments for patientId = 17 at 2025-09-10 13:49:10','2025-09-10 13:49:10'),(218,'[LOG] Load appointments for patientId = 17 at 2025-09-10 13:49:10','2025-09-10 13:49:10'),(219,'[LOG] Update Patient -> Achira Lakmal at 2025-09-10 13:49:14','2025-09-10 13:49:14'),(220,'[LOG] Load diagnoses for patientId = 18 at 2025-09-10 13:49:24','2025-09-10 13:49:24'),(221,'[LOG] Load treatments for patientId = 18 at 2025-09-10 13:49:24','2025-09-10 13:49:24'),(222,'[LOG] Load appointments for patientId = 18 at 2025-09-10 13:49:24','2025-09-10 13:49:24'),(223,'[LOG] Update Patient -> Supun Mashushan at 2025-09-10 13:49:29','2025-09-10 13:49:29'),(224,'[LOG] Load diagnoses for patientId = 19 at 2025-09-10 13:49:41','2025-09-10 13:49:41'),(225,'[LOG] Load treatments for patientId = 19 at 2025-09-10 13:49:41','2025-09-10 13:49:41'),(226,'[LOG] Load appointments for patientId = 19 at 2025-09-10 13:49:41','2025-09-10 13:49:41'),(227,'[LOG] Update Patient -> Jeewantha De Silva at 2025-09-10 13:49:46','2025-09-10 13:49:46'),(228,'[LOG] Load diagnoses for patientId = 20 at 2025-09-10 13:49:58','2025-09-10 13:49:58'),(229,'[LOG] Load treatments for patientId = 20 at 2025-09-10 13:49:58','2025-09-10 13:49:58'),(230,'[LOG] Load appointments for patientId = 20 at 2025-09-10 13:49:58','2025-09-10 13:49:58'),(231,'[LOG] Update Patient -> Wasantha Wijendra at 2025-09-10 13:50:04','2025-09-10 13:50:04'),(232,'[LOG] Load diagnoses for patientId = 21 at 2025-09-10 13:50:09','2025-09-10 13:50:09'),(233,'[LOG] Load treatments for patientId = 21 at 2025-09-10 13:50:10','2025-09-10 13:50:10'),(234,'[LOG] Load appointments for patientId = 21 at 2025-09-10 13:50:10','2025-09-10 13:50:10'),(235,'[LOG] Update Patient -> Merian Dilhani at 2025-09-10 13:50:20','2025-09-10 13:50:20'),(236,'[LOG] Load diagnoses for patientId = 22 at 2025-09-10 13:50:31','2025-09-10 13:50:31'),(237,'[LOG] Load treatments for patientId = 22 at 2025-09-10 13:50:31','2025-09-10 13:50:31'),(238,'[LOG] Load appointments for patientId = 22 at 2025-09-10 13:50:31','2025-09-10 13:50:31'),(239,'[LOG] Update Patient -> Kolitha Sirimeyan at 2025-09-10 13:50:35','2025-09-10 13:50:35'),(240,'[LOG] Load diagnoses for patientId = 23 at 2025-09-10 13:50:46','2025-09-10 13:50:46'),(241,'[LOG] Load treatments for patientId = 23 at 2025-09-10 13:50:46','2025-09-10 13:50:46'),(242,'[LOG] Load appointments for patientId = 23 at 2025-09-10 13:50:46','2025-09-10 13:50:46'),(243,'[LOG] Update Patient -> Pethum Vishwajith at 2025-09-10 13:50:51','2025-09-10 13:50:51'),(244,'[LOG] Search patients by name ->  at 2025-09-10 13:50:59','2025-09-10 13:50:59'),(245,'[LOG] Load diagnoses for patientId = 15 at 2025-09-10 13:51:04','2025-09-10 13:51:04'),(246,'[LOG] Load treatments for patientId = 15 at 2025-09-10 13:51:04','2025-09-10 13:51:04'),(247,'[LOG] Load appointments for patientId = 15 at 2025-09-10 13:51:04','2025-09-10 13:51:04'),(248,'[LOG] Load diagnoses for patientId = 24 at 2025-09-10 13:51:28','2025-09-10 13:51:28'),(249,'[LOG] Load treatments for patientId = 24 at 2025-09-10 13:51:28','2025-09-10 13:51:28'),(250,'[LOG] Load appointments for patientId = 24 at 2025-09-10 13:51:28','2025-09-10 13:51:28'),(251,'[LOG] Update Patient -> Sheron Dias at 2025-09-10 13:51:52','2025-09-10 13:51:52'),(252,'[LOG] Load diagnoses for patientId = 31 at 2025-09-10 13:51:57','2025-09-10 13:51:57'),(253,'[LOG] Load treatments for patientId = 31 at 2025-09-10 13:51:57','2025-09-10 13:51:57'),(254,'[LOG] Load appointments for patientId = 31 at 2025-09-10 13:51:57','2025-09-10 13:51:57'),(255,'[LOG] Update Patient -> Eshan Pethum at 2025-09-10 13:52:20','2025-09-10 13:52:20'),(256,'[LOG] Search patients by name ->  at 2025-09-10 13:52:25','2025-09-10 13:52:25'),(257,'[LOG] Load all patients at 2025-09-10 13:57:58','2025-09-10 13:57:58'),(258,'[LOG] Load all patients at 2025-09-10 13:57:58','2025-09-10 13:57:58'),(259,'[LOG] Load diagnoses for patientId = 22 at 2025-09-10 13:58:04','2025-09-10 13:58:04'),(260,'[LOG] Load treatments for patientId = 22 at 2025-09-10 13:58:04','2025-09-10 13:58:04'),(261,'[LOG] Load appointments for patientId = 22 at 2025-09-10 13:58:04','2025-09-10 13:58:04'),(262,'[LOG] Update Patient -> Kolitha Sirimeyan at 2025-09-10 13:58:10','2025-09-10 13:58:10'),(263,'[LOG] Load all patients at 2025-09-10 14:00:43','2025-09-10 14:00:43'),(264,'[LOG] Load all patients at 2025-09-10 14:00:44','2025-09-10 14:00:44'),(265,'[LOG] Search patients by name -> ස් at 2025-09-10 14:00:54','2025-09-10 14:00:54'),(266,'[LOG] Search patients by name -> ස at 2025-09-10 14:00:55','2025-09-10 14:00:55'),(267,'[LOG] Search patients by name ->  at 2025-09-10 14:00:56','2025-09-10 14:00:56'),(268,'[LOG] Search patients by name -> ක් at 2025-09-10 14:00:57','2025-09-10 14:00:57'),(269,'[LOG] Search patients by name -> ක at 2025-09-10 14:00:58','2025-09-10 14:00:58'),(270,'[LOG] Search patients by name ->  at 2025-09-10 14:00:58','2025-09-10 14:00:58'),(271,'[LOG] Search patients by name ->  at 2025-09-10 14:01:06','2025-09-10 14:01:06'),(272,'[LOG] Search patients by name ->  at 2025-09-10 14:01:06','2025-09-10 14:01:06'),(273,'[LOG] Search patients by name ->  at 2025-09-10 14:01:06','2025-09-10 14:01:06'),(274,'[LOG] Search patients by name -> k at 2025-09-10 14:01:08','2025-09-10 14:01:08'),(275,'[LOG] Search patients by name -> ka at 2025-09-10 14:01:08','2025-09-10 14:01:08'),(276,'[LOG] Search patients by name -> kav at 2025-09-10 14:01:08','2025-09-10 14:01:08'),(277,'[LOG] Search patients by name -> kave at 2025-09-10 14:01:09','2025-09-10 14:01:09'),(278,'[LOG] Search patients by name -> kavee at 2025-09-10 14:01:09','2025-09-10 14:01:09'),(279,'[LOG] Search patients by name ->  at 2025-09-10 14:01:10','2025-09-10 14:01:10'),(280,'[LOG] Load diagnoses for patientId = 24 at 2025-09-10 14:01:26','2025-09-10 14:01:26'),(281,'[LOG] Load treatments for patientId = 24 at 2025-09-10 14:01:26','2025-09-10 14:01:26'),(282,'[LOG] Load appointments for patientId = 24 at 2025-09-10 14:01:26','2025-09-10 14:01:26'),(283,'[LOG] Load all patients at 2025-09-10 14:19:54','2025-09-10 14:19:54'),(284,'[LOG] Search patients by name -> n at 2025-09-10 14:20:05','2025-09-10 14:20:05'),(285,'[LOG] Search patients by name -> nd at 2025-09-10 14:20:05','2025-09-10 14:20:05'),(286,'[LOG] Search patients by name ->  at 2025-09-10 14:20:12','2025-09-10 14:20:12'),(287,'[LOG] Search patients by name ->  at 2025-09-10 14:20:13','2025-09-10 14:20:13'),(288,'[LOG] Search patients by name -> S at 2025-09-10 14:20:13','2025-09-10 14:20:13'),(289,'[LOG] Search patients by name -> S at 2025-09-10 14:20:14','2025-09-10 14:20:14'),(290,'[LOG] Search patients by name -> Su at 2025-09-10 14:20:14','2025-09-10 14:20:14'),(291,'[LOG] Search patients by name -> Sup at 2025-09-10 14:20:14','2025-09-10 14:20:14'),(292,'[LOG] Search patients by name -> Supu at 2025-09-10 14:20:15','2025-09-10 14:20:15'),(293,'[LOG] Search patients by name ->  at 2025-09-10 14:20:16','2025-09-10 14:20:16'),(294,'[LOG] Load diagnoses for patientId = 23 at 2025-09-10 14:20:19','2025-09-10 14:20:19'),(295,'[LOG] Load treatments for patientId = 23 at 2025-09-10 14:20:19','2025-09-10 14:20:19'),(296,'[LOG] Load appointments for patientId = 23 at 2025-09-10 14:20:19','2025-09-10 14:20:19'),(297,'[LOG] Update Patient -> Pethum Vishwajith at 2025-09-10 14:20:27','2025-09-10 14:20:27'),(298,'[LOG] Load diagnoses for patientId = 23 at 2025-09-10 14:20:40','2025-09-10 14:20:40'),(299,'[LOG] Insert appointment ID = 1757506727204 at 2025-09-10 17:48:47','2025-09-10 17:48:47'),(300,'[LOG] Insert appointment ID = 1757506748056 at 2025-09-10 17:49:08','2025-09-10 17:49:08'),(301,'[LOG] Insert appointment ID = 1757506757440 at 2025-09-10 17:49:17','2025-09-10 17:49:17'),(302,'[LOG] Insert appointment ID = 1757506902452 at 2025-09-10 17:51:42','2025-09-10 17:51:42'),(303,'[LOG] Insert appointment ID = 1757507094317 at 2025-09-10 17:54:54','2025-09-10 17:54:54'),(304,'[LOG] Insert appointment ID = 1757516447336 at 2025-09-10 20:30:47','2025-09-10 20:30:47'),(305,'[LOG] Insert appointment ID = 1757524850536 at 2025-09-10 22:50:50','2025-09-10 22:50:50'),(306,'[LOG] Insert appointment ID = 1757525152892 at 2025-09-10 22:55:52','2025-09-10 22:55:52'),(307,'[LOG] Insert appointment ID = 1757525400017 at 2025-09-10 23:00:00','2025-09-10 23:00:00'),(308,'[LOG] Insert appointment ID = 1757525493582 at 2025-09-10 23:01:33','2025-09-10 23:01:33'),(309,'[LOG] Load all staff at 2025-09-10 23:07:10','2025-09-10 23:07:10'),(310,'[LOG] Add new staff -> Parami Shakya at 2025-09-10 23:07:57','2025-09-10 23:07:57'),(311,'[LOG] Load all staff at 2025-09-10 23:07:59','2025-09-10 23:07:59'),(312,'[LOG] Update staff -> Kamashi DISANAYAKE at 2025-09-10 23:08:19','2025-09-10 23:08:19'),(313,'[LOG] Load all staff at 2025-09-10 23:08:21','2025-09-10 23:08:21'),(314,'[LOG] Update staff -> Samadhi Kawya at 2025-09-10 23:08:57','2025-09-10 23:08:57'),(315,'[LOG] Load all staff at 2025-09-10 23:08:59','2025-09-10 23:08:59'),(316,'[LOG] Update staff -> Dilrukshi Perera at 2025-09-10 23:09:11','2025-09-10 23:09:11'),(317,'[LOG] Load all staff at 2025-09-10 23:09:13','2025-09-10 23:09:13'),(318,'[LOG] Update staff -> Harini Chathrya at 2025-09-10 23:09:43','2025-09-10 23:09:43'),(319,'[LOG] Load all staff at 2025-09-10 23:09:44','2025-09-10 23:09:44'),(320,'[LOG] Load all staff at 2025-09-10 23:14:15','2025-09-10 23:14:15'),(321,'[LOG] Load all staff at 2025-09-10 23:25:07','2025-09-10 23:25:07'),(322,'[LOG] Load all staff at 2025-09-10 23:25:42','2025-09-10 23:25:42'),(323,'[LOG] Load all staff at 2025-09-10 23:28:51','2025-09-10 23:28:51'),(324,'[LOG] Load all staff at 2025-09-10 23:29:08','2025-09-10 23:29:08'),(325,'[LOG] Load all staff at 2025-09-10 23:29:11','2025-09-10 23:29:11'),(326,'[LOG] Load all staff at 2025-09-10 23:29:15','2025-09-10 23:29:15'),(327,'[LOG] Load all permissions at 2025-09-10 23:29:30','2025-09-10 23:29:30'),(328,'[LOG] Add job role -> bhx x at 2025-09-10 23:29:37','2025-09-10 23:29:37'),(329,'[LOG] Delete job role ID = 13 at 2025-09-10 23:29:42','2025-09-10 23:29:42'),(330,'[LOG] Load permissions for role_id = 8 at 2025-09-10 23:29:49','2025-09-10 23:29:49'),(331,'[LOG] Load permissions for role_id = 8 at 2025-09-10 23:29:49','2025-09-10 23:29:49'),(332,'[LOG] Insert permission 13 for role_id = 8 at 2025-09-10 23:30:03','2025-09-10 23:30:03'),(333,'[LOG] Load all appointments at 2025-09-10 23:31:07','2025-09-10 23:31:07'),(334,'[LOG] Search appointments by ID -> 3 at 2025-09-10 23:31:16','2025-09-10 23:31:16'),(335,'[LOG] Search appointments by ID -> 33 at 2025-09-10 23:31:16','2025-09-10 23:31:16'),(336,'[LOG] Search appointments by ID -> 3 at 2025-09-10 23:31:18','2025-09-10 23:31:18'),(337,'[LOG] Search appointments by ID ->  at 2025-09-10 23:31:18','2025-09-10 23:31:18'),(338,'[LOG] Search appointments by patient name ->  at 2025-09-10 23:31:21','2025-09-10 23:31:21'),(339,'[LOG] Search appointments by patient name -> K at 2025-09-10 23:31:21','2025-09-10 23:31:21'),(340,'[LOG] Search appointments by patient name -> K at 2025-09-10 23:31:21','2025-09-10 23:31:21'),(341,'[LOG] Search appointments by patient name -> Ka at 2025-09-10 23:31:22','2025-09-10 23:31:22'),(342,'[LOG] Search appointments by patient name ->  at 2025-09-10 23:31:23','2025-09-10 23:31:23'),(343,'[LOG] Search appointments by doctor -> 1 at 2025-09-10 23:31:25','2025-09-10 23:31:25'),(344,'[LOG] Search appointments by doctor -> 1 at 2025-09-10 23:31:25','2025-09-10 23:31:25'),(345,'[LOG] Search appointments by doctor -> 0 at 2025-09-10 23:31:27','2025-09-10 23:31:27'),(346,'[LOG] Search appointments by doctor -> 0 at 2025-09-10 23:31:27','2025-09-10 23:31:27'),(347,'[LOG] Load all appointments at 2025-09-10 23:31:29','2025-09-10 23:31:29'),(348,'[LOG] Search appointments by reason -> 1 at 2025-09-10 23:31:31','2025-09-10 23:31:31'),(349,'[LOG] Search appointments by reason -> 1 at 2025-09-10 23:31:31','2025-09-10 23:31:31'),(350,'[LOG] Search appointments by reason -> 0 at 2025-09-10 23:31:32','2025-09-10 23:31:32'),(351,'[LOG] Search appointments by reason -> 0 at 2025-09-10 23:31:32','2025-09-10 23:31:32'),(352,'[LOG] Load all appointments at 2025-09-10 23:31:32','2025-09-10 23:31:32'),(353,'[LOG] Search appointments by date -> 2025-08-25 at 2025-09-10 23:31:41','2025-09-10 23:31:41'),(354,'[LOG] Load all appointments at 2025-09-10 23:31:42','2025-09-10 23:31:42'),(355,'[LOG] Insert bill no = 1757527306851 at 2025-09-10 23:34:23','2025-09-10 23:34:23'),(356,'[LOG] Submit insurance claim = 1757527463208 at 2025-09-10 23:34:53','2025-09-10 23:34:53'),(357,'[LOG] Submit insurance claim = 1757527463208 at 2025-09-10 23:35:01','2025-09-10 23:35:01'),(358,'[LOG] Submit insurance claim = 1757527463208 at 2025-09-10 23:35:33','2025-09-10 23:35:33'),(359,'[LOG] Submit insurance claim = 1757527463208 at 2025-09-10 23:36:15','2025-09-10 23:36:15'),(360,'[LOG] Insert bill no = 1757527600920 at 2025-09-10 23:37:26','2025-09-10 23:37:26'),(361,'[LOG] Submit insurance claim = 1757527646808 at 2025-09-10 23:37:47','2025-09-10 23:37:47'),(362,'[LOG] Load insurance list at 2025-09-10 23:37:54','2025-09-10 23:37:54'),(363,'[LOG] Load insurance details for id = 6 at 2025-09-10 23:38:09','2025-09-10 23:38:09'),(364,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-10 23:38:09','2025-09-10 23:38:09'),(365,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-10 23:38:09','2025-09-10 23:38:09'),(366,'[LOG] Load insurance details for id = 7 at 2025-09-10 23:38:11','2025-09-10 23:38:11'),(367,'[LOG] Update claim 7 to status POLICY_VALIDATED at 2025-09-10 23:38:49','2025-09-10 23:38:49'),(368,'[LOG] Update claim 7 to status POLICY_VALIDATED at 2025-09-10 23:38:49','2025-09-10 23:38:49'),(369,'[LOG] Load insurance list at 2025-09-10 23:38:51','2025-09-10 23:38:51'),(370,'[LOG] Load insurance list at 2025-09-10 23:39:01','2025-09-10 23:39:01'),(371,'[LOG] Load insurance list at 2025-09-10 23:41:08','2025-09-10 23:41:08'),(372,'[LOG] Update claim 7 to status POLICY_REJECTED at 2025-09-10 23:41:10','2025-09-10 23:41:10'),(373,'[LOG] Update claim 7 to status POLICY_REJECTED at 2025-09-10 23:41:10','2025-09-10 23:41:10'),(374,'[LOG] Load insurance list at 2025-09-10 23:41:11','2025-09-10 23:41:11'),(375,'[LOG] Load insurance list at 2025-09-10 23:43:15','2025-09-10 23:43:15'),(376,'[LOG] Load insurance details for id = 6 at 2025-09-10 23:43:17','2025-09-10 23:43:17'),(377,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-10 23:43:17','2025-09-10 23:43:17'),(378,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-10 23:43:17','2025-09-10 23:43:17'),(379,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-10 23:43:20','2025-09-10 23:43:20'),(380,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-10 23:43:20','2025-09-10 23:43:20'),(381,'[LOG] Load insurance list at 2025-09-10 23:43:22','2025-09-10 23:43:22'),(382,'[LOG] Load insurance list at 2025-09-10 23:49:33','2025-09-10 23:49:33'),(383,'[LOG] Load insurance details for id = 6 at 2025-09-10 23:49:36','2025-09-10 23:49:36'),(384,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-10 23:49:36','2025-09-10 23:49:36'),(385,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-10 23:49:36','2025-09-10 23:49:36'),(386,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-10 23:49:43','2025-09-10 23:49:43'),(387,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-10 23:49:43','2025-09-10 23:49:43'),(388,'[LOG] Load insurance list at 2025-09-10 23:49:45','2025-09-10 23:49:45'),(389,'[LOG] Load insurance details for id = 7 at 2025-09-10 23:49:53','2025-09-10 23:49:53'),(390,'[LOG] Load insurance details for id = 6 at 2025-09-10 23:49:55','2025-09-10 23:49:55'),(391,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-10 23:49:55','2025-09-10 23:49:55'),(392,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-10 23:49:55','2025-09-10 23:49:55'),(393,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-10 23:49:55','2025-09-10 23:49:55'),(394,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-10 23:49:55','2025-09-10 23:49:55'),(395,'[LOG] Load insurance details for id = 5 at 2025-09-10 23:50:02','2025-09-10 23:50:02'),(396,'[LOG] Update claim 5 to status POLICY_REJECTED at 2025-09-10 23:50:02','2025-09-10 23:50:02'),(397,'[LOG] Update claim 5 to status POLICY_REJECTED at 2025-09-10 23:50:02','2025-09-10 23:50:02'),(398,'[LOG] Update claim 5 to status POLICY_VALIDATED at 2025-09-10 23:50:05','2025-09-10 23:50:05'),(399,'[LOG] Update claim 5 to status POLICY_VALIDATED at 2025-09-10 23:50:05','2025-09-10 23:50:05'),(400,'[LOG] Load insurance list at 2025-09-10 23:50:07','2025-09-10 23:50:07'),(401,'[LOG] Load insurance list at 2025-09-10 23:50:12','2025-09-10 23:50:12'),(402,'[LOG] Load all bills at 2025-09-10 23:50:20','2025-09-10 23:50:20'),(403,'[LOG] Insert bill no = 1757672802382 at 2025-09-12 16:02:22','2025-09-12 16:02:22'),(404,'[LOG] Insert bill no = 1757696230773 at 2025-09-12 22:29:09','2025-09-12 22:29:09'),(405,'[LOG] Insert bill no = 1757696840452 at 2025-09-12 22:38:40','2025-09-12 22:38:40'),(406,'[LOG] Insert bill no = 1757697158534 at 2025-09-12 22:43:36','2025-09-12 22:43:36'),(407,'[LOG] Insert bill no = 1757697890895 at 2025-09-12 22:55:42','2025-09-12 22:55:42'),(408,'[LOG] Insert bill no = 1757698240860 at 2025-09-12 23:01:32','2025-09-12 23:01:32'),(409,'[LOG] Insert bill no = 1757698800822 at 2025-09-12 23:12:06','2025-09-12 23:12:06'),(410,'[LOG] Load insurance list at 2025-09-12 23:17:08','2025-09-12 23:17:08'),(411,'[LOG] Load insurance details for id = 2 at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(412,'[LOG] Update claim 2 to status POLICY_VALIDATED at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(413,'[LOG] Update claim 2 to status POLICY_VALIDATED at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(414,'[LOG] Update claim 2 to status MEDICAL_VERIFIED at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(415,'[LOG] Update claim 2 to status MEDICAL_VERIFIED at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(416,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(417,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(418,'[LOG] Update claim 2 to status SETTLED at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(419,'[LOG] Update claim 2 to status SETTLED at 2025-09-12 23:17:11','2025-09-12 23:17:11'),(420,'[LOG] Load insurance details for id = 3 at 2025-09-12 23:17:18','2025-09-12 23:17:18'),(421,'[LOG] Load insurance details for id = 7 at 2025-09-12 23:17:20','2025-09-12 23:17:20'),(422,'[LOG] Load insurance details for id = 5 at 2025-09-12 23:17:21','2025-09-12 23:17:21'),(423,'[LOG] Update claim 5 to status POLICY_VALIDATED at 2025-09-12 23:17:21','2025-09-12 23:17:21'),(424,'[LOG] Update claim 5 to status POLICY_VALIDATED at 2025-09-12 23:17:21','2025-09-12 23:17:21'),(425,'[LOG] Load insurance details for id = 6 at 2025-09-12 23:17:22','2025-09-12 23:17:22'),(426,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-12 23:17:22','2025-09-12 23:17:22'),(427,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-12 23:17:22','2025-09-12 23:17:22'),(428,'[LOG] Load insurance list at 2025-09-12 23:17:26','2025-09-12 23:17:26'),(429,'[LOG] Load all staff at 2025-09-15 12:58:22','2025-09-15 12:58:22'),(430,'[LOG] Load all staff at 2025-09-20 11:18:13','2025-09-20 11:18:13'),(431,'[LOG] Load all staff at 2025-09-20 11:58:10','2025-09-20 11:58:10'),(432,'[LOG] Load all staff at 2025-09-20 11:59:42','2025-09-20 11:59:42'),(433,'[LOG] Load all staff at 2025-09-20 12:00:43','2025-09-20 12:00:43'),(434,'[LOG] Load all staff at 2025-09-20 12:02:06','2025-09-20 12:02:06'),(435,'[LOG] Update staff -> Nishan Wikramasinghe at 2025-09-20 12:02:24','2025-09-20 12:02:24'),(436,'[LOG] Load all staff at 2025-09-20 12:02:25','2025-09-20 12:02:25'),(437,'[LOG] Load all staff at 2025-09-20 12:03:36','2025-09-20 12:03:36'),(438,'[LOG] Load all permissions at 2025-09-20 12:03:38','2025-09-20 12:03:38'),(439,'[LOG] Load insurance list at 2025-09-20 12:05:05','2025-09-20 12:05:05'),(440,'[LOG] Load insurance details for id = 6 at 2025-09-20 12:05:17','2025-09-20 12:05:17'),(441,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-20 12:05:17','2025-09-20 12:05:17'),(442,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-20 12:05:17','2025-09-20 12:05:17'),(443,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-20 12:05:17','2025-09-20 12:05:17'),(444,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-20 12:05:17','2025-09-20 12:05:17'),(445,'[LOG] Load insurance details for id = 5 at 2025-09-20 12:05:18','2025-09-20 12:05:18'),(446,'[LOG] Load insurance details for id = 4 at 2025-09-20 12:05:20','2025-09-20 12:05:20'),(447,'[LOG] Load insurance details for id = 3 at 2025-09-20 12:05:22','2025-09-20 12:05:22'),(448,'[LOG] Update claim 3 to status POLICY_VALIDATED at 2025-09-20 12:05:22','2025-09-20 12:05:22'),(449,'[LOG] Update claim 3 to status POLICY_VALIDATED at 2025-09-20 12:05:22','2025-09-20 12:05:22'),(450,'[LOG] Update claim 3 to status MEDICAL_VERIFIED at 2025-09-20 12:05:22','2025-09-20 12:05:22'),(451,'[LOG] Update claim 3 to status MEDICAL_VERIFIED at 2025-09-20 12:05:22','2025-09-20 12:05:22'),(452,'[LOG] Load insurance details for id = 2 at 2025-09-20 12:05:24','2025-09-20 12:05:24'),(453,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-20 12:05:24','2025-09-20 12:05:24'),(454,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-20 12:05:24','2025-09-20 12:05:24'),(455,'[LOG] Update claim 2 to status SETTLED at 2025-09-20 12:05:24','2025-09-20 12:05:24'),(456,'[LOG] Update claim 2 to status SETTLED at 2025-09-20 12:05:24','2025-09-20 12:05:24'),(457,'[LOG] Load insurance details for id = 1 at 2025-09-20 12:05:25','2025-09-20 12:05:25'),(458,'[LOG] Load insurance details for id = 7 at 2025-09-20 12:05:27','2025-09-20 12:05:27'),(459,'[LOG] Load all staff at 2025-09-20 12:15:22','2025-09-20 12:15:22'),(460,'[LOG] Add new staff -> Lakshani Perera at 2025-09-20 12:16:38','2025-09-20 12:16:38'),(461,'[LOG] Load all staff at 2025-09-20 12:16:39','2025-09-20 12:16:39'),(462,'[LOG] Load all staff at 2025-09-20 12:16:52','2025-09-20 12:16:52'),(463,'[LOG] Load all staff at 2025-09-20 12:16:58','2025-09-20 12:16:58'),(464,'[LOG] Load all staff at 2025-09-20 12:17:03','2025-09-20 12:17:03'),(465,'[LOG] Load all staff at 2025-09-20 12:17:07','2025-09-20 12:17:07'),(466,'[LOG] Set inactive staff ID = 8 at 2025-09-20 12:17:11','2025-09-20 12:17:11'),(467,'[LOG] Load all staff at 2025-09-20 12:17:13','2025-09-20 12:17:13'),(468,'[LOG] Load all staff at 2025-09-20 12:17:17','2025-09-20 12:17:17'),(469,'[LOG] Load all permissions at 2025-09-20 12:17:23','2025-09-20 12:17:23'),(470,'[LOG] Load permissions for role_id = 1 at 2025-09-20 12:17:34','2025-09-20 12:17:34'),(471,'[LOG] Load permissions for role_id = 1 at 2025-09-20 12:17:34','2025-09-20 12:17:34'),(472,'[LOG] Load all permissions at 2025-09-20 12:17:48','2025-09-20 12:17:48'),(473,'[LOG] Load all patients at 2025-09-20 12:18:47','2025-09-20 12:18:47'),(474,'[LOG] Load diagnoses for patientId = 5 at 2025-09-20 12:18:55','2025-09-20 12:18:55'),(475,'[LOG] Load treatments for patientId = 5 at 2025-09-20 12:18:55','2025-09-20 12:18:55'),(476,'[LOG] Load appointments for patientId = 5 at 2025-09-20 12:18:55','2025-09-20 12:18:55'),(477,'[LOG] Search patients by name ->  at 2025-09-20 12:19:03','2025-09-20 12:19:03'),(478,'[LOG] Search patients by name -> M at 2025-09-20 12:19:03','2025-09-20 12:19:03'),(479,'[LOG] Search patients by name -> M at 2025-09-20 12:19:03','2025-09-20 12:19:03'),(480,'[LOG] Search patients by name -> Me at 2025-09-20 12:19:03','2025-09-20 12:19:03'),(481,'[LOG] Load diagnoses for patientId = 21 at 2025-09-20 12:19:06','2025-09-20 12:19:06'),(482,'[LOG] Load treatments for patientId = 21 at 2025-09-20 12:19:06','2025-09-20 12:19:06'),(483,'[LOG] Load appointments for patientId = 21 at 2025-09-20 12:19:06','2025-09-20 12:19:06'),(484,'[LOG] Load all appointments at 2025-09-20 12:19:23','2025-09-20 12:19:23'),(485,'[LOG] Search appointments by doctor -> 1 at 2025-09-20 12:19:27','2025-09-20 12:19:27'),(486,'[LOG] Search appointments by doctor -> 1 at 2025-09-20 12:19:27','2025-09-20 12:19:27'),(487,'[LOG] Search appointments by doctor -> 2 at 2025-09-20 12:19:30','2025-09-20 12:19:30'),(488,'[LOG] Search appointments by doctor -> 2 at 2025-09-20 12:19:30','2025-09-20 12:19:30'),(489,'[LOG] Search appointments by doctor -> 0 at 2025-09-20 12:19:32','2025-09-20 12:19:32'),(490,'[LOG] Search appointments by doctor -> 0 at 2025-09-20 12:19:32','2025-09-20 12:19:32'),(491,'[LOG] Load all appointments at 2025-09-20 12:19:32','2025-09-20 12:19:32'),(492,'[LOG] Load all appointments at 2025-09-20 12:19:46','2025-09-20 12:19:46'),(493,'[LOG] Load all bills at 2025-09-20 12:19:58','2025-09-20 12:19:58'),(494,'[LOG] Load insurance list at 2025-09-20 12:20:24','2025-09-20 12:20:24'),(495,'[LOG] Load insurance details for id = 6 at 2025-09-20 12:20:26','2025-09-20 12:20:26'),(496,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-20 12:20:26','2025-09-20 12:20:26'),(497,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-20 12:20:26','2025-09-20 12:20:26'),(498,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-20 12:20:26','2025-09-20 12:20:26'),(499,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-20 12:20:26','2025-09-20 12:20:26'),(500,'[LOG] Load insurance details for id = 2 at 2025-09-20 12:20:28','2025-09-20 12:20:28'),(501,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-20 12:20:28','2025-09-20 12:20:28'),(502,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-20 12:20:28','2025-09-20 12:20:28'),(503,'[LOG] Update claim 2 to status SETTLED at 2025-09-20 12:20:28','2025-09-20 12:20:28'),(504,'[LOG] Update claim 2 to status SETTLED at 2025-09-20 12:20:28','2025-09-20 12:20:28'),(505,'[LOG] Load insurance details for id = 7 at 2025-09-20 12:20:30','2025-09-20 12:20:30'),(506,'[LOG] Update claim 7 to status POLICY_VALIDATED at 2025-09-20 12:20:34','2025-09-20 12:20:34'),(507,'[LOG] Update claim 7 to status POLICY_VALIDATED at 2025-09-20 12:20:34','2025-09-20 12:20:34'),(508,'[LOG] Load insurance list at 2025-09-20 12:20:35','2025-09-20 12:20:35'),(509,'[LOG] Update claim 7 to status FINANCE_APPROVED at 2025-09-20 12:20:40','2025-09-20 12:20:40'),(510,'[LOG] Update claim 7 to status FINANCE_APPROVED at 2025-09-20 12:20:40','2025-09-20 12:20:40'),(511,'[LOG] Load insurance list at 2025-09-20 12:20:43','2025-09-20 12:20:43'),(512,'[LOG] Load insurance list at 2025-09-20 12:20:54','2025-09-20 12:20:54'),(513,'[LOG] Load insurance list at 2025-09-20 12:20:55','2025-09-20 12:20:55'),(514,'[LOG] Load insurance list at 2025-09-20 12:20:55','2025-09-20 12:20:55'),(515,'[LOG] Load insurance details for id = 2 at 2025-09-20 12:21:04','2025-09-20 12:21:04'),(516,'[LOG] Update claim 2 to status MEDICAL_VERIFIED at 2025-09-20 12:21:04','2025-09-20 12:21:04'),(517,'[LOG] Update claim 2 to status MEDICAL_VERIFIED at 2025-09-20 12:21:04','2025-09-20 12:21:04'),(518,'[LOG] Update claim 2 to status SETTLED at 2025-09-20 12:21:04','2025-09-20 12:21:04'),(519,'[LOG] Update claim 2 to status SETTLED at 2025-09-20 12:21:04','2025-09-20 12:21:04'),(520,'[LOG] Load insurance details for id = 1 at 2025-09-20 12:21:05','2025-09-20 12:21:05'),(521,'[LOG] Load insurance details for id = 3 at 2025-09-20 12:21:07','2025-09-20 12:21:07'),(522,'[LOG] Load insurance details for id = 4 at 2025-09-20 12:21:08','2025-09-20 12:21:08'),(523,'[LOG] Load insurance details for id = 5 at 2025-09-20 12:21:09','2025-09-20 12:21:09'),(524,'[LOG] Update claim 5 to status POLICY_VALIDATED at 2025-09-20 12:21:09','2025-09-20 12:21:09'),(525,'[LOG] Update claim 5 to status POLICY_VALIDATED at 2025-09-20 12:21:09','2025-09-20 12:21:09'),(526,'[LOG] Load insurance details for id = 6 at 2025-09-20 12:21:11','2025-09-20 12:21:11'),(527,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-20 12:21:11','2025-09-20 12:21:11'),(528,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-20 12:21:11','2025-09-20 12:21:11'),(529,'[LOG] Load insurance details for id = 7 at 2025-09-20 12:21:12','2025-09-20 12:21:12'),(530,'[LOG] Update claim 7 to status FINANCE_APPROVED at 2025-09-20 12:21:12','2025-09-20 12:21:12'),(531,'[LOG] Update claim 7 to status FINANCE_APPROVED at 2025-09-20 12:21:12','2025-09-20 12:21:12'),(532,'[LOG] Load insurance list at 2025-09-20 12:21:25','2025-09-20 12:21:25'),(533,'[LOG] Load all patients at 2025-09-20 12:22:11','2025-09-20 12:22:11'),(534,'[LOG] Load diagnoses for patientId = 22 at 2025-09-20 12:22:13','2025-09-20 12:22:13'),(535,'[LOG] Load treatments for patientId = 22 at 2025-09-20 12:22:13','2025-09-20 12:22:13'),(536,'[LOG] Load appointments for patientId = 22 at 2025-09-20 12:22:13','2025-09-20 12:22:13'),(537,'[LOG] Load all patients at 2025-09-20 12:26:05','2025-09-20 12:26:05'),(538,'[LOG] Insert appointment ID = 1758352177950 at 2025-09-20 12:39:37','2025-09-20 12:39:37'),(539,'[LOG] Insert appointment ID = 1758352192641 at 2025-09-20 12:39:52','2025-09-20 12:39:52'),(540,'[LOG] Load all patients at 2025-09-20 12:51:12','2025-09-20 12:51:12'),(541,'[LOG] Insert Patient -> NDCJDN at 2025-09-20 12:51:33','2025-09-20 12:51:33'),(542,'[LOG] Load all patients at 2025-09-20 12:51:35','2025-09-20 12:51:35'),(543,'[LOG] Load diagnoses for patientId = 42 at 2025-09-20 12:51:40','2025-09-20 12:51:40'),(544,'[LOG] Load treatments for patientId = 42 at 2025-09-20 12:51:40','2025-09-20 12:51:40'),(545,'[LOG] Load appointments for patientId = 42 at 2025-09-20 12:51:40','2025-09-20 12:51:40'),(546,'[LOG] Load diagnoses for patientId = 14 at 2025-09-20 12:51:57','2025-09-20 12:51:57'),(547,'[LOG] Load treatments for patientId = 14 at 2025-09-20 12:51:57','2025-09-20 12:51:57'),(548,'[LOG] Load appointments for patientId = 14 at 2025-09-20 12:51:57','2025-09-20 12:51:57'),(549,'[LOG] Update Patient -> Nilantha Prasad at 2025-09-20 12:52:10','2025-09-20 12:52:10'),(550,'[LOG] Search patients by name -> N at 2025-09-20 12:52:32','2025-09-20 12:52:32'),(551,'[LOG] Search patients by name ->  at 2025-09-20 12:52:33','2025-09-20 12:52:33'),(552,'[LOG] Insert appointment ID = 1758353132416 at 2025-09-20 12:55:32','2025-09-20 12:55:32'),(553,'[LOG] Load all staff at 2025-09-20 13:25:00','2025-09-20 13:25:00'),(554,'[LOG] Load all staff at 2025-09-20 13:25:05','2025-09-20 13:25:05'),(555,'[LOG] Load all patients at 2025-09-20 13:25:12','2025-09-20 13:25:12'),(556,'[LOG] Load diagnoses for patientId = 4 at 2025-09-20 13:25:17','2025-09-20 13:25:17'),(557,'[LOG] Load treatments for patientId = 4 at 2025-09-20 13:25:17','2025-09-20 13:25:17'),(558,'[LOG] Load appointments for patientId = 4 at 2025-09-20 13:25:17','2025-09-20 13:25:17'),(559,'[LOG] Load all appointments at 2025-09-20 13:38:44','2025-09-20 13:38:44'),(560,'[LOG] Load all bills at 2025-09-20 13:54:22','2025-09-20 13:54:22'),(561,'[LOG] Load all patients at 2025-09-22 14:02:40','2025-09-22 14:02:40'),(562,'[LOG] Load all patients at 2025-09-22 14:02:51','2025-09-22 14:02:51'),(563,'[LOG] Search patients by name -> ම් at 2025-09-22 14:10:10','2025-09-22 14:10:10'),(564,'[LOG] Search patients by name -> මෙ at 2025-09-22 14:10:10','2025-09-22 14:10:10'),(565,'[LOG] Search patients by name -> මෙර් at 2025-09-22 14:10:10','2025-09-22 14:10:10'),(566,'[LOG] Search patients by name ->  at 2025-09-22 14:10:11','2025-09-22 14:10:11'),(567,'[LOG] Search patients by name ->  at 2025-09-22 14:10:27','2025-09-22 14:10:27'),(568,'[LOG] Search patients by name ->  at 2025-09-22 14:10:27','2025-09-22 14:10:27'),(569,'[LOG] Search patients by name ->  at 2025-09-22 14:10:27','2025-09-22 14:10:27'),(570,'[LOG] Search patients by name -> m at 2025-09-22 14:10:28','2025-09-22 14:10:28'),(571,'[LOG] Search patients by name -> me at 2025-09-22 14:10:28','2025-09-22 14:10:28'),(572,'[LOG] Load diagnoses for patientId = 21 at 2025-09-22 14:10:30','2025-09-22 14:10:30'),(573,'[LOG] Load treatments for patientId = 21 at 2025-09-22 14:10:30','2025-09-22 14:10:30'),(574,'[LOG] Load appointments for patientId = 21 at 2025-09-22 14:10:30','2025-09-22 14:10:30'),(575,'[LOG] Update Patient -> Merian Dilhani at 2025-09-22 14:15:43','2025-09-22 14:15:43'),(576,'[LOG] Update Patient -> Merian Dilhani at 2025-09-22 14:15:54','2025-09-22 14:15:54'),(577,'[LOG] Load all patients at 2025-09-22 14:49:30','2025-09-22 14:49:30'),(578,'[LOG] Load diagnoses for patientId = 19 at 2025-09-22 14:49:31','2025-09-22 14:49:31'),(579,'[LOG] Load treatments for patientId = 19 at 2025-09-22 14:49:31','2025-09-22 14:49:31'),(580,'[LOG] Load appointments for patientId = 19 at 2025-09-22 14:49:31','2025-09-22 14:49:31'),(581,'[LOG] Load diagnoses for patientId = 21 at 2025-09-22 14:49:40','2025-09-22 14:49:40'),(582,'[LOG] Load treatments for patientId = 21 at 2025-09-22 14:49:40','2025-09-22 14:49:40'),(583,'[LOG] Load appointments for patientId = 21 at 2025-09-22 14:49:40','2025-09-22 14:49:40'),(584,'[LOG] Load all patients at 2025-09-22 14:53:17','2025-09-22 14:53:17'),(585,'[LOG] Load diagnoses for patientId = 11 at 2025-09-22 14:53:30','2025-09-22 14:53:30'),(586,'[LOG] Load treatments for patientId = 11 at 2025-09-22 14:53:30','2025-09-22 14:53:30'),(587,'[LOG] Load appointments for patientId = 11 at 2025-09-22 14:53:30','2025-09-22 14:53:30'),(588,'[LOG] Load all patients at 2025-09-22 14:53:37','2025-09-22 14:53:37'),(589,'[LOG] Load all patients at 2025-09-22 22:13:46','2025-09-22 22:13:46'),(590,'[LOG] Load diagnoses for patientId = 21 at 2025-09-22 22:17:45','2025-09-22 22:17:45'),(591,'[LOG] Load treatments for patientId = 21 at 2025-09-22 22:17:45','2025-09-22 22:17:45'),(592,'[LOG] Load appointments for patientId = 21 at 2025-09-22 22:17:45','2025-09-22 22:17:45'),(593,'[LOG] Load all appointments at 2025-09-22 23:13:40','2025-09-22 23:13:40'),(594,'[LOG] Load all appointments at 2025-09-22 23:19:30','2025-09-22 23:19:30'),(595,'[LOG] Load all appointments at 2025-09-22 23:48:39','2025-09-22 23:48:39'),(596,'[LOG] Load all staff at 2025-09-22 23:49:41','2025-09-22 23:49:41'),(597,'[LOG] Load all permissions at 2025-09-23 00:12:44','2025-09-23 00:12:44'),(598,'[LOG] Load permissions for role_id = 1 at 2025-09-23 00:14:00','2025-09-23 00:14:00'),(599,'[LOG] Load permissions for role_id = 1 at 2025-09-23 00:14:00','2025-09-23 00:14:00'),(600,'[LOG] Insert bill no = 1758567171302 at 2025-09-23 00:34:34','2025-09-23 00:34:34'),(601,'[LOG] Load all bills at 2025-09-23 00:38:00','2025-09-23 00:38:00'),(602,'[LOG] Load insurance list at 2025-09-23 00:41:21','2025-09-23 00:41:21'),(603,'[LOG] Load insurance details for id = 6 at 2025-09-23 00:45:44','2025-09-23 00:45:44'),(604,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-23 00:45:44','2025-09-23 00:45:44'),(605,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-23 00:45:44','2025-09-23 00:45:44'),(606,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-23 00:45:44','2025-09-23 00:45:44'),(607,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-23 00:45:44','2025-09-23 00:45:44'),(608,'[LOG] Load insurance details for id = 5 at 2025-09-23 00:45:46','2025-09-23 00:45:46'),(609,'[LOG] Load insurance details for id = 4 at 2025-09-23 00:45:48','2025-09-23 00:45:48'),(610,'[LOG] Load insurance details for id = 5 at 2025-09-23 00:48:46','2025-09-23 00:48:46'),(611,'[LOG] Update claim 5 to status POLICY_VALIDATED at 2025-09-23 00:48:46','2025-09-23 00:48:46'),(612,'[LOG] Update claim 5 to status POLICY_VALIDATED at 2025-09-23 00:48:46','2025-09-23 00:48:46'),(613,'[LOG] Load insurance details for id = 6 at 2025-09-23 00:51:39','2025-09-23 00:51:39'),(614,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-23 00:51:39','2025-09-23 00:51:39'),(615,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-23 00:51:39','2025-09-23 00:51:39'),(616,'[LOG] Load insurance details for id = 6 at 2025-09-23 00:51:48','2025-09-23 00:51:48'),(617,'[LOG] Load all patients at 2025-09-23 22:35:49','2025-09-23 22:35:49'),(618,'[LOG] Load diagnoses for patientId = 21 at 2025-09-23 22:35:56','2025-09-23 22:35:56'),(619,'[LOG] Load treatments for patientId = 21 at 2025-09-23 22:35:56','2025-09-23 22:35:56'),(620,'[LOG] Load appointments for patientId = 21 at 2025-09-23 22:35:56','2025-09-23 22:35:56'),(621,'[LOG] Load all patients at 2025-09-23 22:38:09','2025-09-23 22:38:09'),(622,'[LOG] Load all appointments at 2025-09-23 22:39:33','2025-09-23 22:39:33'),(623,'[LOG] Load all staff at 2025-09-23 22:39:58','2025-09-23 22:39:58'),(624,'[LOG] Load all permissions at 2025-09-23 22:40:09','2025-09-23 22:40:09'),(625,'[LOG] Load permissions for role_id = 1 at 2025-09-23 22:40:22','2025-09-23 22:40:22'),(626,'[LOG] Load permissions for role_id = 1 at 2025-09-23 22:40:22','2025-09-23 22:40:22'),(627,'[LOG] Insert permission 3 for role_id = 1 at 2025-09-23 22:40:35','2025-09-23 22:40:35'),(628,'[LOG] Delete permission 3 for role_id = 1 at 2025-09-23 22:40:41','2025-09-23 22:40:41'),(629,'[LOG] Load all permissions at 2025-09-23 22:40:49','2025-09-23 22:40:49'),(630,'[LOG] Load all patients at 2025-09-23 22:41:14','2025-09-23 22:41:14'),(631,'[LOG] Load all appointments at 2025-09-23 22:41:19','2025-09-23 22:41:19'),(632,'[LOG] Load insurance list at 2025-09-23 22:42:11','2025-09-23 22:42:11'),(633,'[LOG] Load insurance details for id = 2 at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(634,'[LOG] Update claim 2 to status POLICY_VALIDATED at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(635,'[LOG] Update claim 2 to status POLICY_VALIDATED at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(636,'[LOG] Update claim 2 to status MEDICAL_VERIFIED at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(637,'[LOG] Update claim 2 to status MEDICAL_VERIFIED at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(638,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(639,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(640,'[LOG] Update claim 2 to status SETTLED at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(641,'[LOG] Update claim 2 to status SETTLED at 2025-09-23 22:42:16','2025-09-23 22:42:16'),(642,'[LOG] Load insurance details for id = 6 at 2025-09-23 22:42:20','2025-09-23 22:42:20'),(643,'[LOG] Load insurance details for id = 2 at 2025-09-23 22:42:31','2025-09-23 22:42:31'),(644,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-23 22:42:31','2025-09-23 22:42:31'),(645,'[LOG] Update claim 2 to status FINANCE_APPROVED at 2025-09-23 22:42:31','2025-09-23 22:42:31'),(646,'[LOG] Update claim 2 to status SETTLED at 2025-09-23 22:42:31','2025-09-23 22:42:31'),(647,'[LOG] Update claim 2 to status SETTLED at 2025-09-23 22:42:31','2025-09-23 22:42:31'),(648,'[LOG] Load insurance details for id = 5 at 2025-09-23 22:42:33','2025-09-23 22:42:33'),(649,'[LOG] Update claim 5 to status MEDICAL_VERIFIED at 2025-09-23 22:42:36','2025-09-23 22:42:36'),(650,'[LOG] Update claim 5 to status MEDICAL_VERIFIED at 2025-09-23 22:42:36','2025-09-23 22:42:36'),(651,'[LOG] Load insurance list at 2025-09-23 22:42:37','2025-09-23 22:42:37'),(652,'[LOG] Load all patients at 2025-09-23 23:12:52','2025-09-23 23:12:52'),(653,'[LOG] Search patients by name -> M at 2025-09-23 23:13:06','2025-09-23 23:13:06'),(654,'[LOG] Search patients by name -> ME at 2025-09-23 23:13:07','2025-09-23 23:13:07'),(655,'[LOG] Search patients by name -> MER at 2025-09-23 23:13:07','2025-09-23 23:13:07'),(656,'[LOG] Search patients by name -> ME at 2025-09-23 23:13:08','2025-09-23 23:13:08'),(657,'[LOG] Search patients by name -> M at 2025-09-23 23:13:08','2025-09-23 23:13:08'),(658,'[LOG] Search patients by name ->  at 2025-09-23 23:13:08','2025-09-23 23:13:08'),(659,'[LOG] Search patients by name ->  at 2025-09-23 23:13:09','2025-09-23 23:13:09'),(660,'[LOG] Load diagnoses for patientId = 21 at 2025-09-23 23:13:35','2025-09-23 23:13:35'),(661,'[LOG] Load treatments for patientId = 21 at 2025-09-23 23:13:35','2025-09-23 23:13:35'),(662,'[LOG] Load appointments for patientId = 21 at 2025-09-23 23:13:35','2025-09-23 23:13:35'),(663,'[LOG] Load all patients at 2025-09-23 23:18:38','2025-09-23 23:18:38'),(664,'[LOG] Load diagnoses for patientId = 21 at 2025-09-23 23:18:53','2025-09-23 23:18:53'),(665,'[LOG] Load treatments for patientId = 21 at 2025-09-23 23:18:53','2025-09-23 23:18:53'),(666,'[LOG] Load appointments for patientId = 21 at 2025-09-23 23:18:53','2025-09-23 23:18:53'),(667,'[LOG] Load all appointments at 2025-09-23 23:22:59','2025-09-23 23:22:59'),(668,'[LOG] Load all staff at 2025-09-23 23:27:33','2025-09-23 23:27:33'),(669,'[LOG] Load all staff at 2025-09-23 23:27:53','2025-09-23 23:27:53'),(670,'[LOG] Load all staff at 2025-09-23 23:28:31','2025-09-23 23:28:31'),(671,'[LOG] Load all permissions at 2025-09-23 23:28:59','2025-09-23 23:28:59'),(672,'[LOG] Load all permissions at 2025-09-23 23:29:15','2025-09-23 23:29:15'),(673,'[LOG] Load permissions for role_id = 1 at 2025-09-23 23:29:25','2025-09-23 23:29:25'),(674,'[LOG] Load permissions for role_id = 1 at 2025-09-23 23:29:25','2025-09-23 23:29:25'),(675,'[LOG] Load all bills at 2025-09-23 23:35:18','2025-09-23 23:35:18'),(676,'[LOG] Load insurance list at 2025-09-23 23:35:51','2025-09-23 23:35:51'),(677,'[LOG] Load insurance details for id = 6 at 2025-09-23 23:36:12','2025-09-23 23:36:12'),(678,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-23 23:36:12','2025-09-23 23:36:12'),(679,'[LOG] Update claim 6 to status POLICY_VALIDATED at 2025-09-23 23:36:12','2025-09-23 23:36:12'),(680,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-23 23:36:12','2025-09-23 23:36:12'),(681,'[LOG] Update claim 6 to status MEDICAL_VERIFIED at 2025-09-23 23:36:12','2025-09-23 23:36:12'),(682,'[LOG] Load all patients at 2025-09-24 10:14:01','2025-09-24 10:14:01'),(683,'[LOG] Search patients by name -> M at 2025-09-24 10:14:15','2025-09-24 10:14:15'),(684,'[LOG] Search patients by name -> M at 2025-09-24 10:14:15','2025-09-24 10:14:15'),(685,'[LOG] Search patients by name -> Mr at 2025-09-24 10:14:16','2025-09-24 10:14:16'),(686,'[LOG] Search patients by name -> Mri at 2025-09-24 10:14:16','2025-09-24 10:14:16'),(687,'[LOG] Search patients by name -> Mr at 2025-09-24 10:14:17','2025-09-24 10:14:17'),(688,'[LOG] Search patients by name -> M at 2025-09-24 10:14:18','2025-09-24 10:14:18'),(689,'[LOG] Search patients by name -> Me at 2025-09-24 10:14:18','2025-09-24 10:14:18'),(690,'[LOG] Search patients by name -> Mer at 2025-09-24 10:14:18','2025-09-24 10:14:18'),(691,'[LOG] Search patients by name ->  at 2025-09-24 10:14:19','2025-09-24 10:14:19'),(692,'[LOG] Load diagnoses for patientId = 21 at 2025-09-24 10:14:31','2025-09-24 10:14:31'),(693,'[LOG] Load treatments for patientId = 21 at 2025-09-24 10:14:31','2025-09-24 10:14:31'),(694,'[LOG] Load appointments for patientId = 21 at 2025-09-24 10:14:31','2025-09-24 10:14:31'),(695,'[LOG] Load all patients at 2025-09-24 10:18:56','2025-09-24 10:18:56'),(696,'[LOG] Load diagnoses for patientId = 21 at 2025-09-24 10:19:13','2025-09-24 10:19:13'),(697,'[LOG] Load treatments for patientId = 21 at 2025-09-24 10:19:13','2025-09-24 10:19:13'),(698,'[LOG] Load appointments for patientId = 21 at 2025-09-24 10:19:13','2025-09-24 10:19:13'),(699,'[LOG] Insert appointment ID = 1758689596179 at 2025-09-24 10:23:16','2025-09-24 10:23:16'),(700,'[LOG] Insert appointment ID = 1758689612686 at 2025-09-24 10:23:32','2025-09-24 10:23:32'),(701,'[LOG] Insert appointment ID = 1758689687769 at 2025-09-24 10:24:47','2025-09-24 10:24:47'),(702,'[LOG] Insert appointment ID = 1758690072388 at 2025-09-24 10:31:12','2025-09-24 10:31:12'),(703,'[LOG] Insert appointment ID = 1758690162086 at 2025-09-24 10:32:42','2025-09-24 10:32:42'),(704,'[LOG] Insert bill no = 1758690217435 at 2025-09-24 10:34:32','2025-09-24 10:34:32'),(705,'[LOG] Submit insurance claim = 1758690272149 at 2025-09-24 10:34:59','2025-09-24 10:34:59'),(706,'[LOG] Load insurance list at 2025-09-24 10:35:05','2025-09-24 10:35:05'),(707,'[LOG] Load insurance details for id = 7 at 2025-09-24 10:35:07','2025-09-24 10:35:07'),(708,'[LOG] Update claim 7 to status POLICY_VALIDATED at 2025-09-24 10:35:07','2025-09-24 10:35:07'),(709,'[LOG] Update claim 7 to status POLICY_VALIDATED at 2025-09-24 10:35:07','2025-09-24 10:35:07'),(710,'[LOG] Update claim 7 to status MEDICAL_VERIFIED at 2025-09-24 10:35:07','2025-09-24 10:35:07'),(711,'[LOG] Update claim 7 to status MEDICAL_VERIFIED at 2025-09-24 10:35:07','2025-09-24 10:35:07'),(712,'[LOG] Update claim 7 to status FINANCE_APPROVED at 2025-09-24 10:35:07','2025-09-24 10:35:07'),(713,'[LOG] Update claim 7 to status FINANCE_APPROVED at 2025-09-24 10:35:07','2025-09-24 10:35:07'),(714,'[LOG] Load insurance details for id = 8 at 2025-09-24 10:35:23','2025-09-24 10:35:23'),(715,'[LOG] Load insurance details for id = 7 at 2025-09-24 10:35:24','2025-09-24 10:35:24'),(716,'[LOG] Update claim 7 to status POLICY_VALIDATED at 2025-09-24 10:35:24','2025-09-24 10:35:24'),(717,'[LOG] Update claim 7 to status POLICY_VALIDATED at 2025-09-24 10:35:24','2025-09-24 10:35:24'),(718,'[LOG] Update claim 7 to status MEDICAL_VERIFIED at 2025-09-24 10:35:24','2025-09-24 10:35:24'),(719,'[LOG] Update claim 7 to status MEDICAL_VERIFIED at 2025-09-24 10:35:24','2025-09-24 10:35:24'),(720,'[LOG] Update claim 7 to status FINANCE_APPROVED at 2025-09-24 10:35:24','2025-09-24 10:35:24'),(721,'[LOG] Update claim 7 to status FINANCE_APPROVED at 2025-09-24 10:35:24','2025-09-24 10:35:24'),(722,'[LOG] Load insurance details for id = 4 at 2025-09-24 10:35:28','2025-09-24 10:35:28'),(723,'[LOG] Load insurance details for id = 8 at 2025-09-24 10:35:30','2025-09-24 10:35:30'),(724,'[LOG] Update claim 8 to status POLICY_VALIDATED at 2025-09-24 10:35:46','2025-09-24 10:35:46'),(725,'[LOG] Update claim 8 to status POLICY_VALIDATED at 2025-09-24 10:35:46','2025-09-24 10:35:46'),(726,'[LOG] Load insurance list at 2025-09-24 10:35:47','2025-09-24 10:35:47'),(727,'[LOG] Load insurance details for id = 8 at 2025-09-24 10:35:50','2025-09-24 10:35:50'),(728,'[LOG] Load all patients at 2025-09-24 11:57:39','2025-09-24 11:57:39'),(729,'[LOG] Search patients by name ->  at 2025-09-24 11:57:51','2025-09-24 11:57:51'),(730,'[LOG] Search patients by name -> m at 2025-09-24 11:57:51','2025-09-24 11:57:51'),(731,'[LOG] Search patients by name -> m at 2025-09-24 11:57:52','2025-09-24 11:57:52'),(732,'[LOG] Search patients by name -> mE at 2025-09-24 11:57:52','2025-09-24 11:57:52'),(733,'[LOG] Search patients by name -> mER at 2025-09-24 11:57:53','2025-09-24 11:57:53'),(734,'[LOG] Search patients by name -> mE at 2025-09-24 11:57:54','2025-09-24 11:57:54'),(735,'[LOG] Search patients by name -> m at 2025-09-24 11:57:54','2025-09-24 11:57:54'),(736,'[LOG] Search patients by name -> m at 2025-09-24 11:57:54','2025-09-24 11:57:54'),(737,'[LOG] Search patients by name -> me at 2025-09-24 11:57:55','2025-09-24 11:57:55'),(738,'[LOG] Search patients by name -> mer at 2025-09-24 11:57:55','2025-09-24 11:57:55'),(739,'[LOG] Search patients by name -> me at 2025-09-24 11:57:56','2025-09-24 11:57:56'),(740,'[LOG] Search patients by name -> m at 2025-09-24 11:57:56','2025-09-24 11:57:56'),(741,'[LOG] Search patients by name ->  at 2025-09-24 11:57:57','2025-09-24 11:57:57'),(742,'[LOG] Insert Patient -> Savindi Dulesha at 2025-09-24 11:58:36','2025-09-24 11:58:36'),(743,'[LOG] Load all patients at 2025-09-24 11:58:38','2025-09-24 11:58:38'),(744,'[LOG] Load diagnoses for patientId = 21 at 2025-09-24 11:58:46','2025-09-24 11:58:46'),(745,'[LOG] Load treatments for patientId = 21 at 2025-09-24 11:58:46','2025-09-24 11:58:46'),(746,'[LOG] Load appointments for patientId = 21 at 2025-09-24 11:58:46','2025-09-24 11:58:46'),(747,'[LOG] Update Patient -> Merian Dilhani at 2025-09-24 11:59:10','2025-09-24 11:59:10'),(748,'[LOG] Load diagnoses for patientId = 21 at 2025-09-24 12:00:08','2025-09-24 12:00:08'),(749,'[LOG] Load treatments for patientId = 21 at 2025-09-24 12:00:46','2025-09-24 12:00:46'),(750,'[LOG] Load all patients at 2025-09-24 12:03:24','2025-09-24 12:03:24'),(751,'[LOG] Load all patients at 2025-09-24 12:03:37','2025-09-24 12:03:37'),(752,'[LOG] Load diagnoses for patientId = 43 at 2025-09-24 12:03:41','2025-09-24 12:03:41'),(753,'[LOG] Load treatments for patientId = 43 at 2025-09-24 12:03:41','2025-09-24 12:03:41'),(754,'[LOG] Load appointments for patientId = 43 at 2025-09-24 12:03:41','2025-09-24 12:03:41'),(755,'[LOG] Load diagnoses for patientId = 21 at 2025-09-24 12:03:45','2025-09-24 12:03:45'),(756,'[LOG] Load treatments for patientId = 21 at 2025-09-24 12:03:45','2025-09-24 12:03:45'),(757,'[LOG] Load appointments for patientId = 21 at 2025-09-24 12:03:45','2025-09-24 12:03:45'),(758,'[LOG] Insert appointment ID = 1758695827476 at 2025-09-24 12:07:07','2025-09-24 12:07:07'),(759,'[LOG] Load all appointments at 2025-09-24 12:07:20','2025-09-24 12:07:20'),(760,'[LOG] Search appointments by ID -> 3 at 2025-09-24 12:07:35','2025-09-24 12:07:35'),(761,'[LOG] Search appointments by ID ->  at 2025-09-24 12:07:50','2025-09-24 12:07:50'),(762,'[LOG] Load all staff at 2025-09-24 12:08:53','2025-09-24 12:08:53'),(763,'[LOG] Add new staff -> Nisal Sachnithana at 2025-09-24 12:09:31','2025-09-24 12:09:31'),(764,'[LOG] Load all staff at 2025-09-24 12:09:33','2025-09-24 12:09:33'),(765,'[LOG] Load all staff at 2025-09-24 12:09:49','2025-09-24 12:09:49'),(766,'[LOG] Load all staff at 2025-09-24 12:09:53','2025-09-24 12:09:53'),(767,'[LOG] Load all staff at 2025-09-24 12:09:57','2025-09-24 12:09:57'),(768,'[LOG] Load all permissions at 2025-09-24 12:10:14','2025-09-24 12:10:14'),(769,'[LOG] Add job role -> Test at 2025-09-24 12:10:24','2025-09-24 12:10:24'),(770,'[LOG] Load permissions for role_id = 1 at 2025-09-24 12:10:41','2025-09-24 12:10:41'),(771,'[LOG] Load permissions for role_id = 1 at 2025-09-24 12:10:41','2025-09-24 12:10:41'),(772,'[LOG] Delete permission 6 for role_id = 1 at 2025-09-24 12:10:52','2025-09-24 12:10:52'),(773,'[LOG] Insert permission 3 for role_id = 1 at 2025-09-24 12:10:58','2025-09-24 12:10:58'),(774,'[LOG] Load all patients at 2025-09-24 12:11:42','2025-09-24 12:11:42'),(775,'[LOG] Load all appointments at 2025-09-24 12:11:48','2025-09-24 12:11:48'),(776,'[LOG] Insert bill no = 1758696112287 at 2025-09-24 12:14:04','2025-09-24 12:14:04'),(777,'[LOG] Insert bill no = 1758696272317 at 2025-09-24 12:15:50','2025-09-24 12:15:50'),(778,'[LOG] Submit insurance claim = 1758696350356 at 2025-09-24 12:16:18','2025-09-24 12:16:18'),(779,'[LOG] Load all bills at 2025-09-24 12:16:40','2025-09-24 12:16:40'),(780,'[LOG] Load insurance list at 2025-09-24 12:17:02','2025-09-24 12:17:02'),(781,'[LOG] Load insurance details for id = 9 at 2025-09-24 12:18:07','2025-09-24 12:18:07'),(782,'[LOG] Update claim 9 to status POLICY_VALIDATED at 2025-09-24 12:19:00','2025-09-24 12:19:00'),(783,'[LOG] Update claim 9 to status POLICY_VALIDATED at 2025-09-24 12:19:00','2025-09-24 12:19:00'),(784,'[LOG] Load insurance list at 2025-09-24 12:19:03','2025-09-24 12:19:03'),(785,'[LOG] Load insurance details for id = 9 at 2025-09-24 12:19:06','2025-09-24 12:19:06'),(786,'[LOG] Load insurance list at 2025-09-29 18:57:41','2025-09-29 18:57:41'),(787,'[LOG] Load insurance details for id = 8 at 2025-09-29 18:57:44','2025-09-29 18:57:44'),(788,'[LOG] Update claim 8 to status POLICY_VALIDATED at 2025-09-29 18:57:44','2025-09-29 18:57:44'),(789,'[LOG] Update claim 8 to status POLICY_VALIDATED at 2025-09-29 18:57:44','2025-09-29 18:57:44'),(790,'[LOG] Update claim 8 to status MEDICAL_VERIFIED at 2025-09-29 18:57:47','2025-09-29 18:57:47'),(791,'[LOG] Update claim 8 to status MEDICAL_VERIFIED at 2025-09-29 18:57:47','2025-09-29 18:57:47');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diagnosis` text NOT NULL,
  `treatment` text NOT NULL,
  `allergies` text NOT NULL,
  `date_recorded` date NOT NULL,
  `patient_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medical_history_patient1_idx` (`patient_id`),
  KEY `FK_medical_history_department` (`department_id`),
  KEY `FK_medical_history_staff` (`staff_id`),
  CONSTRAINT `FK_medical_history_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_medical_history_patient1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `FK_medical_history_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
INSERT INTO `medical_history` VALUES (1,'Type 2 Diabetes','Metformin 500mg daily, diet control, exercise','None','2025-08-23',5,1,1),(2,'Hypertension','Amlodipine 5mg once daily','Penicillin','2025-08-23',4,1,1),(3,'Asthma','Salbutamol inhaler as needed','Dust, Pollen','2025-08-23',5,1,1),(4,'Chronic Kidney Disease','Low-protein diet, ACE inhibitors','Seafood','2025-08-23',4,1,1),(5,'Coronary Artery Disease','Aspirin 75mg daily, Statins','Sulfa drugs','2025-08-23',5,1,1),(6,'Migraine','Sumatriptan 50mg during attacks','No known drug allergies','2025-08-23',4,1,1);
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Gabapentin 300mg'),(2,'Morphine Sulfate 10mg'),(3,'Ranitidine 150mg'),(4,'Amoxicillin 500mg'),(5,'Ibuprofen 400mg'),(6,'Paracetamol 500mg'),(7,'Ciprofloxacin 250mg'),(8,'Azithromycin 500mg'),(9,'Cetirizine 10mg'),(10,'Metformin 500mg'),(11,'Amlodipine 5mg'),(12,'Atorvastatin 20mg'),(13,'Losartan 50mg'),(14,'Omeprazole 20mg'),(15,'Salbutamol Inhaler'),(16,'Prednisolone 5mg'),(17,'Clopidogrel 75mg'),(18,'Levothyroxine 50mcg'),(19,'Insulin Glargine'),(20,'Warfarin 5mg'),(21,'Doxycycline 100mg'),(22,'Furosemide 40mg'),(23,'Hydrochlorothiazide 25mg');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_role`
--

DROP TABLE IF EXISTS `parent_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_role`
--

LOCK TABLES `parent_role` WRITE;
/*!40000 ALTER TABLE `parent_role` DISABLE KEYS */;
INSERT INTO `parent_role` VALUES (1,'Medical Staff'),(2,'Other Staff');
/*!40000 ALTER TABLE `parent_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `registerd_date` datetime NOT NULL,
  `branch_id` int NOT NULL,
  `age` varchar(50) DEFAULT NULL,
  `insurance_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_branch1_idx` (`branch_id`),
  KEY `FK_patient_insurance` (`insurance_id`),
  CONSTRAINT `fk_patient_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_patient_insurance` FOREIGN KEY (`insurance_id`) REFERENCES `insurance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (4,'Kaveesha Sakuni','1987-09-10','Female','MDc3NzMzMzIzMg==','Tm8uIDMzIEhhbWxhIFJkLCBZYXRpeWFuYQ==','2025-08-22 00:00:00',1,'38',1),(5,'Nethmi Praerthana','1975-09-10','Female','MDc3NDQ2NTQzNA==','ODggLyBEICwgR2FtYW5nZWRhcmEgUmQgLCBHYW1wYWhh','2025-08-22 00:00:00',2,'50',NULL),(6,'Nisal Sachinthana','2006-09-10','Male','MDc3NTU2NjU0Mw==','Tm8uIDQ1LCBLYW5keSBSb2FkLCBQZXJhZGVuaXlhLCBLYW5keSwgMjA0MDAsIFNyaSBMYW5rYQ==','2025-08-22 00:00:00',1,'19',NULL),(10,'Hiranya Vithanage','1999-09-10','Male','MDc3NDQ2NjU3Ng==','Tm8uIDEyLCBMYWtlIFZpZXcgQXZlbnVlLCBDb2xvbWJvIDcsIENvbG9tYm8sIDAwNzAwLCBTcmkgTGFua2E=','2025-08-23 00:00:00',1,'26',NULL),(11,'Ajitha Heshan','2004-09-10','Male','MDc3NDQ1NDEzNQ==','Tm8uIDc4LzUsIE1haW4gU3RyZWV0LCBHYWxsZSBGb3J0LCBHYWxsZSwgU3JpIExhbmth','2025-08-23 00:00:00',1,'21',NULL),(12,'Schith Jayanath','1982-09-10','Male','MDc3NDQ1NDY1NA==','Tm8uIDI1NiwgUGFsbSBHYXJkZW4gTGFuZSwgTmF3YWxhLCBSYWphZ2lyaXlhLCBDb2xvbWJv','2025-08-24 00:00:00',1,'43',NULL),(13,'Dinesh Perera','1987-09-10','Male','MDc3NDQ1NDM0Mw==','Tm8uIDksIFNjaG9vbCBSb2FkLCBNYXRhcmEsIDgxMDAwLCBTcmkgTGFua2E=','2025-08-24 00:00:00',1,'38',NULL),(14,'Nilantha Prasad','1984-09-10','Male','MDc3NTU2NTQzMg==','Tm8uIDEwMiwgS290dGUgUm9hZCwgUmFqYWdpcml5YSwgQ29sb21ibw==','2025-08-24 00:00:00',1,'41',NULL),(15,'Ishan Chanuka','1985-09-10','Male','MDc3NDQ1NTY1NA==','Tm8uIDQ1LzIsIEdhbGxlIFJvYWQsIE1vdW50IExhdmluaWEsIENvbG9tYm8=','2025-08-24 00:00:00',1,'40',NULL),(16,'Ysitha Perera','1997-09-10','Male','MDc3NTU2NTQzNQ==','Tm8uIDc4LCBTdGF0aW9uIFJvYWQsIERlaGl3YWxhLCBDb2xvbWJv','2025-08-24 00:00:00',1,'28',NULL),(17,'Achira Lakmal','1990-09-10','Male','MDc3NTU2NTIzNA==','Tm8uIDEyLCBPcmNoaWQgTGFuZSwgTnVnZWdvZGEsIENvbG9tYm8=','2025-08-24 00:00:00',1,'35',NULL),(18,'Supun Mashushan','1984-09-10','Male','MDc3MzM0NDM0Mw==','Tm8uIDU2LCBQYXJrIFN0cmVldCwgTW9yYXR1d2EsIENvbG9tYm8=','2025-08-24 00:00:00',1,'41',NULL),(19,'Jeewantha De Silva','1977-09-10','Male','MDc3NTU2NTQzMg==','Tm8uIDg5LCBMYWtlIFZpZXcgUm9hZCwgTmVnb21ibywgR2FtcGFoYQ==','2025-08-24 00:00:00',1,'48',NULL),(20,'Wasantha Wijendra','1991-09-10','Male','MDc3NTU1NTY1NA==','Tm8uIDM0LCBDb2NvbnV0IEF2ZW51ZSwgV2F0dGFsYSwgR2FtcGFoYQ==','2025-08-24 00:00:00',1,'34',NULL),(21,'Merian Dilhani','1983-09-10','Female','MDc3NTU1NTY1NA==','Tm8uIDIxLCBTZWEgQnJlZXplIExhbmUsIEthbHV0YXJhLCBLYWx1dGFyYQ==','2025-08-24 00:00:00',1,'42',NULL),(22,'Kolitha Sirimeyan','2001-09-10','Male','MDc3MjIyMjEyMQ==','Tm8uIDE1MCwgR2FyZGVuIFJvYWQsIFBhbmFkdXJhLCBLYWx1dGFyYQ==','2025-08-24 00:00:00',1,'24',NULL),(23,'Pethum Vishwajith','1984-09-10','Male','MDc3NDQ1NDEzOQ==','Tm8uIDksIEphc21pbmUgU3RyZWV0LCBLZWxhbml5YSwgR2FtcGFoYQ==','2025-08-24 00:00:00',1,'41',NULL),(24,'Sheron Dias','1975-09-10','Male','MDc3NjY3NjU2Nw==','Tm8gMjMgLCBHYWxrdWRleWEgUm9hZCAsIEphZWxh','2025-08-26 00:00:00',1,'50',NULL),(31,'Eshan Pethum','1983-09-10','Male','MDc3NjY2Njc4Nw==','Tm8uIDMzIFV5YW5nYW11d2EgLCBCaWQgQ2l0eSAsIE1pbnV3YW5nb2Rh','2025-09-01 00:00:00',1,'42',NULL),(33,'Shalika Madushi','1980-09-10','Female','MDc3NDQ2NDEzMw==','MjMvRCAsIENvbG9tYm8gUmQgLCBHYW1wYWhh','2025-09-10 00:00:00',1,'45',NULL),(42,'Nimal Lakkana','2025-09-12','Male','MDc3NDQ2NTE0NQ==','Tm8uIDksIEphc21pbmUgU3RyZWV0LCBLZWxhbml5YSwgR2FtcGFoYQ==','2025-09-20 00:00:00',1,'10',NULL),(43,'Omini Swetha','2025-09-18','Male','MDc3NTU2NjUxNg==','Tm8uIDksIEphc21pbmUgU3RyZWV0LCBLZWxhbml5YSwgR2FtcGFoYQ==','2025-09-20 00:00:00',1,'19',NULL),(44,'Kamala Perera','2000-09-20','Female','MDc3NDQ2NTE0Nw==','Tm8uIDIyIERhbHVnYW1hIFJhZ2FtYQ==','2025-09-24 00:00:00',1,'25',NULL),(45,'Anjali Kawya','2005-09-22','Female','MDc3NTU2NjEyMQ==','Tm8uIDksIEphc21pbmUgU3RyZWV0LCBLZWxhbml5YSwgR2FtcGFoYQ==','2025-09-24 00:00:00',1,'12',NULL),(47,'Savindi Duleesha','2025-09-22','Male','MDc3ODg4ODk4Nw==','Tm8uIDksIEphc21pbmUgU3RyZWV0LCBLZWxhbml5YSwgR2FtcGFoYQ==','2025-09-24 00:00:00',1,'22',NULL),(48,'Savindi Dulesha','2003-09-23','Female','MDc3NDQxMTMyNA==','VGVzdDE=','2025-09-24 00:00:00',1,'22',NULL),(49,'Parami shakya','2011-09-19','Female','MDc3NDQ2NDEzOQ==','VGVzdDI=','2025-09-24 00:00:00',1,'12',NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'MANAGE_STAFF ','Add / Update / Delete staff'),(2,'VIEW_STAFF ','View staff list & details'),(3,'ASSIGN_ROLE','Assign role to staff'),(4,'MANAGE_PERMISSIONS ','Assign/remove permissions to roles'),(5,'VIEW_PATIENT_RECORD ','View patient personal info + medical history'),(6,'EDIT_PATIENT_RECORD ','Update treatment plan, add diagnosis'),(7,'DELETE_PATIENT_RECORD ','Remove record — usually Admin only'),(8,'ADD_MEDICAL_HISTORY ','Add new medical note/history'),(9,'VIEW_VITALS ','View patient vitals like BP, sugar level'),(10,'UPDATE_VITALS ','Enter vitals data — usually Nurse'),(11,'SCHEDULE_APPOINTMENT ','Create a new appointmen'),(12,'UPDATE_APPOINTMENT','Change appointment time/doctor'),(13,'CANCEL_APPOINTMENT','Cancel appointment'),(14,'VIEW_APPOINTMENTS ','View appointment schedule'),(15,'GENERATE_BILL ','Generate patient bill'),(16,'APPROVE_BILLING ','Approve/validate billing transaction'),(17,'PROCESS_PAYMENT ','Cash/Card payment processing'),(18,'INITIATE_INSURANCE_CLAIM ','Submit claim request'),(19,'APPROVE_INSURANCE_CLAIM ','Insurance officer/Admin approval'),(20,'VIEW_BILLING_HISTORY ','Check past billing records'),(21,'GENERATE_MEDICAL_REPORT ','Patient treatment summaries, lab reports'),(22,'GENERATE_FINANCIAL_REPORT ','Billing, income/expense reports'),(23,'VIEW_REPORTS ','Access generated reports'),(24,'VIEW_AUDIT_LOGS','See who accessed/modified records'),(25,'CONFIGURE_SYSTEM ','System settings, backup, restore'),(26,'UPDATE_INSURANCE_STATUS','Update insurance claim status');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_item`
--

DROP TABLE IF EXISTS `prescription_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(45) NOT NULL,
  `dosage` varchar(45) DEFAULT NULL,
  `frequency` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `instructions` varchar(45) DEFAULT NULL,
  `price` varchar(45) NOT NULL,
  `prescription_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prescription_item_prescription1_idx` (`prescription_id`),
  CONSTRAINT `fk_prescription_item_prescription1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptionitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_item`
--

LOCK TABLES `prescription_item` WRITE;
/*!40000 ALTER TABLE `prescription_item` DISABLE KEYS */;
INSERT INTO `prescription_item` VALUES (1,'Paracetamol','500 mg','3 times a day','5 days','Take after meals with water','25.00',1),(2,'Amoxicillin','250 mg','2 times a day','7 days','Take after meals, complete the full course','80.00',2),(3,'Cetirizine','10 mg','Once daily','10 days','Take at night before sleeping','45.00',3),(4,'Ibuprofen','400 mg','3 times a day','7 days','Take after meals with water','60.00',4),(5,'Metformin','500 mg','Twice daily','30 days','Take after meals','150.00',5),(6,'Omeprazole','20 mg','Once daily','14 days','Take before breakfast','100.00',6),(7,'Azithromycin','500 mg','Once daily','3 days','Take before meals with water','250.00',7),(8,'Vitamin C','1000 mg','Once daily','30 days','With water, anytime of day','120.00',8),(9,'Losartan','50 mg','Once daily','30 days','Take at the same time daily','200.00',9),(10,'Aspirin','75 mg','Once daily','30 days','Take after meals with water','60.00',10),(11,'Atorvastatin','20 mg','Once daily','30 days','Take at night before sleep','180.00',10),(12,'Ranitidine','150 mg','Twice daily','14 days','Take before meals','90.00',11),(13,'Prednisolone','5 mg','Once daily (morning)','7 days','Take with food in the morning','140.00',12),(14,'Gabapentin 300mg','300 mg','Every day',NULL,'Take after meals with water','20.0',13),(15,'Ranitidine 150mg','xksn','11',NULL,'ns c cj','20.0',14),(16,'Morphine Sulfate 10mg','12','22',NULL,'22','30.0',15),(17,'Ranitidine 150mg','20mg','kcndknckd',NULL,'nwjdjwd','200.0',16),(18,'Ranitidine 150mg','smkd','22',NULL,'cnd cjdjc','30.0',17),(19,'Amlodipine 5mg','44','44',NULL,'444','500.0',18),(20,'Ciprofloxacin 250mg','44','4',NULL,'ff','400.0',19),(21,'Ibuprofen 400mg','4','40',NULL,'4','400.0',20),(22,'Paracetamol 500mg','10','dc jd cjdw',NULL,'c jcjncj','300.0',21),(23,'Gabapentin 300mg','4','44',NULL,'4','44.0',22),(24,'Ranitidine 150mg','Test','Test',NULL,'Test','200.0',23),(25,'Gabapentin 300mg','10 mg','Once daily (night)',NULL,'Take at night before bed','120.0',24),(26,'Gabapentin 300mg','Test','Test',NULL,'Test','100.0',25);
/*!40000 ALTER TABLE `prescription_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptionitem`
--

DROP TABLE IF EXISTS `prescriptionitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptionitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `staff_id` int DEFAULT NULL,
  `appoinment_id` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prescription_staff1_idx` (`staff_id`),
  KEY `fk_prescription_appoinment1_idx` (`appoinment_id`),
  KEY `fk_prescription_patient1_idx` (`patient_id`),
  CONSTRAINT `fk_prescription_appoinment1` FOREIGN KEY (`appoinment_id`) REFERENCES `appoinment` (`id`),
  CONSTRAINT `fk_prescription_patient1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `fk_prescription_staff1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptionitem`
--

LOCK TABLES `prescriptionitem` WRITE;
/*!40000 ALTER TABLE `prescriptionitem` DISABLE KEYS */;
INSERT INTO `prescriptionitem` VALUES (1,'2025-08-25 00:00:00',NULL,10,21),(2,'2025-08-25 00:00:00',NULL,10,21),(3,'2025-08-25 00:00:00',NULL,10,21),(4,'2025-08-25 00:00:00',NULL,10,21),(5,'2025-08-25 00:00:00',NULL,10,21),(6,'2025-08-25 00:00:00',NULL,11,23),(7,'2025-08-25 00:00:00',NULL,11,23),(8,'2025-09-01 00:00:00',NULL,9,21),(9,'2025-09-01 00:00:00',NULL,10,21),(10,'2025-09-01 00:00:00',NULL,12,19),(11,'2025-09-02 00:00:00',NULL,7,19),(12,'2025-09-02 00:00:00',NULL,10,21),(13,'2025-09-10 00:00:00',NULL,9,21),(14,'2025-09-10 00:00:00',NULL,6,5),(15,'2025-09-12 00:00:00',NULL,7,19),(16,'2025-09-12 00:00:00',NULL,1,4),(17,'2025-09-12 00:00:00',NULL,1,4),(18,'2025-09-12 00:00:00',NULL,1,4),(19,'2025-09-12 00:00:00',NULL,1,4),(20,'2025-09-12 00:00:00',NULL,1,4),(21,'2025-09-12 00:00:00',NULL,1,4),(22,'2025-09-23 00:00:00',NULL,6,21),(23,'2025-09-24 00:00:00',NULL,4,17),(24,'2025-09-24 00:00:00',NULL,12,24),(25,'2025-09-24 00:00:00',NULL,2,21);
/*!40000 ALTER TABLE `prescriptionitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reasons`
--

DROP TABLE IF EXISTS `reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reasons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reasons`
--

LOCK TABLES `reasons` WRITE;
/*!40000 ALTER TABLE `reasons` DISABLE KEYS */;
INSERT INTO `reasons` VALUES (1,'ClinicSchedule'),(2,'DiagnosticsSchedule'),(3,'SurgerySchedule');
/*!40000 ALTER TABLE `reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL DEFAULT '0',
  `permission_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK__job_role` (`role_id`),
  KEY `FK__permissions` (`permission_id`),
  CONSTRAINT `FK__job_role` FOREIGN KEY (`role_id`) REFERENCES `job_role` (`id`),
  CONSTRAINT `FK__permissions` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (2,1,5),(3,1,9),(5,5,11),(6,2,7),(7,3,25),(8,4,21),(9,6,1),(10,7,2),(11,1,8),(13,5,5),(14,1,4),(16,5,16),(18,8,11),(19,8,13),(20,4,26),(22,1,3);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'92'),(2,'22');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_type`
--

DROP TABLE IF EXISTS `service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_type`
--

LOCK TABLES `service_type` WRITE;
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
INSERT INTO `service_type` VALUES (1,'Food & Meals'),(2,'Sanitation & Comfort'),(3,'Nursing & Doctor'),(4,'Reports & Admin'),(5,'Laboratory Tests'),(6,'Radiology'),(7,'Cardiology'),(8,'Health Packages');
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` date NOT NULL,
  `patient_id` int DEFAULT NULL,
  `appoinment_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__patient` (`patient_id`),
  KEY `FK__appoinment` (`appoinment_id`),
  CONSTRAINT `FK__appoinment` FOREIGN KEY (`appoinment_id`) REFERENCES `appoinment` (`id`),
  CONSTRAINT `FK__patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'2025-08-25',21,10),(2,'2025-08-25',21,10),(3,'2025-08-25',21,10),(4,'2025-08-25',21,10),(5,'2025-08-25',21,10),(6,'2025-08-25',23,11),(7,'2025-08-25',23,11),(8,'2025-09-01',21,9),(9,'2025-09-01',21,10),(10,'2025-09-01',19,12),(11,'2025-09-02',19,7),(12,'2025-09-02',21,10),(13,'2025-09-10',21,9),(14,'2025-09-10',5,6),(15,'2025-09-12',19,7),(16,'2025-09-12',4,1),(17,'2025-09-12',4,1),(18,'2025-09-12',4,1),(19,'2025-09-12',4,1),(20,'2025-09-12',4,1),(21,'2025-09-12',4,1),(22,'2025-09-23',21,6),(23,'2025-09-24',17,4),(24,'2025-09-24',24,12),(25,'2025-09-24',21,2);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_item`
--

DROP TABLE IF EXISTS `services_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `service_type_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_services_service_type` (`service_type_id`),
  KEY `FK_services_item_services` (`service_id`),
  CONSTRAINT `FK_services_item_services` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  CONSTRAINT `FK_services_service_type` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_item`
--

LOCK TABLES `services_item` WRITE;
/*!40000 ALTER TABLE `services_item` DISABLE KEYS */;
INSERT INTO `services_item` VALUES (1,'Patient Meal (Breakfast)',800,1,1),(2,'Patient Meal (Lunch)',3000,1,2),(3,'Patient Meal (Dinner)',1500,2,2),(4,'Room Cleaning Service',4000,1,3),(5,'Bed Sheets & Linen Service',1300,2,3),(6,'Nursing Care (Hourly)',1200,1,4),(7,'Doctor Visit Fee',399,1,5),(8,'Medical Report Fee',300,1,6),(9,'Blood Test',200,1,7),(10,'X-Ray Scan',2000,1,8),(11,'MRI Scan',2300,1,9),(12,'Ultrasound Scan',2000,1,10),(13,'ECG Test',4500,1,11),(14,'Full Body Checkup Package',40000,1,12),(15,'Test1',1350,5,13),(16,'nsj',3000,1,14),(17,'test 2',2300,1,15),(18,'Test 3',1000,5,15),(19,'Breakfavgsgsvcg',1200,1,16),(20,'c n cj cdjncdncdjncdj',3500,2,16),(21,'hhs  cb hbc cbhdbchdbc',34000,5,16),(22,'xsc j jdcdjcnjdcjd jd cjdncjdncjdj jnjdncjdjcdjc ncdncjdncjdnc jdjcdjc',3400,1,17),(23,'ckndkcndknkdn k cndcjndjcn',2000,2,17),(24,'nnnnnnn nnnnn nnnnnnnnnn',2000,7,17),(25,'ddddddddddddd',3000,1,18),(26,'dddddddd dddddddddd dneej ',40000,3,18),(27,' gvg  cdcgd gc ccccccccccccccc',4000,1,19),(28,'n ne ce cjeeeeeeeeeeeeeeee',40000,4,19),(29,' jvjfjv vj fjv  jfv jfv jvnjfvjf jfnvjfjvf',2000,1,20),(30,'k dv j vvf vjfv jf vjf',1500,5,20),(31,'Patient Meal (Dinner)',2300,1,21),(32,'Room Cleaning Service',3000,8,21),(33,'44',5000,2,22),(34,'Test 1',1000,1,23),(35,'pecial Diet Meal: This service provides customized meals for patients with specific dietary requirements, such as low-sodium, diabetic-friendly, or gluten-free diSets',2000,1,24),(36,'Test',2300,1,25);
/*!40000 ALTER TABLE `services_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `job_role_id` int NOT NULL,
  `department_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `registerd_date` datetime DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`),
  KEY `fk_staff_job_role_idx` (`job_role_id`),
  KEY `fk_staff_department1_idx` (`department_id`),
  KEY `fk_staff_branch1_idx` (`branch_id`),
  CONSTRAINT `fk_staff_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `fk_staff_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_staff_job_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Samadhi Kawya','0776676156',1,4,1,'RE9DXzAwMg==','2025-02-10 11:23:29','2222','ACTIVE'),(2,'Kamashi DISANAYAKE','0771111212',1,21,2,'RE9DXzAwMQ==','2025-04-10 11:23:30','122','ACTIVE'),(3,'Dilrukshi Perera','0773343434',2,25,2,'TlVSXzAwMQ==','2025-09-10 11:23:31','123','ACTIVE'),(4,'Jamal Perera','0774456543',5,14,2,'Jamal','2025-08-26 12:31:57','111','INACTIVE'),(5,'Harini Chathrya','0771122121',8,12,1,'UkVQXzAwMQ==','2025-08-26 13:09:27','111','ACTIVE'),(6,'Nishan Wikramasinghe','0774465789',4,7,2,'QURNSU5fMDAx','2025-09-02 17:23:51','111','ACTIVE'),(7,'Parami Shakya','0774464138',8,1,1,'UkVQXzAwMg==','2025-09-10 23:07:57','111','ACTIVE'),(8,'Lakshani Perera','0775566545',2,9,1,'TlVSXzAwMQ==','2025-09-20 12:16:38',NULL,'INACTIVE'),(9,'Nisal Sachnithana','0774464138',1,5,1,'RG9jXzAwMw==','2025-09-24 12:09:31',NULL,'ACTIVE');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `patient_id` int NOT NULL DEFAULT '0',
  `doctor_id` int NOT NULL DEFAULT '0',
  `name` text,
  `type` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `FK__patient_id` (`patient_id`),
  KEY `FK_treatment_staff` (`doctor_id`),
  CONSTRAINT `FK__patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `FK_treatment_staff` FOREIGN KEY (`doctor_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,'2025-01-27 22:24:14',21,2,'Fever Management','General Medicine','Paracetamol given, advised rest and hydration'),(3,'2025-05-27 22:24:40',21,1,'Antibiotic Therapy','Infectious Disease','Started Amoxicillin 500mg for bacterial infection'),(4,'2025-08-27 22:25:07',21,2,'Diabetes Treatment','Endocrinology','Prescribed Metformin 500mg, advised diet and exercise'),(5,'2025-09-01 22:48:58',20,2,'Hypertension Treatment','Cardiology','Started Losartan 50mg daily, advised low-salt diet'),(6,'2025-09-01 23:11:18',22,2,'Asthma Treatment','Pulmonology','Inhaler prescribed, patient advised to avoid dust and cold air'),(7,'2025-09-24 12:00:45',21,1,'Gastritis Treatment','Gastroenterology','Prescribed Omeprazole 20mg daily, advised to avoid spicy foods');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_item`
--

DROP TABLE IF EXISTS `treatment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text,
  `treatment_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__treatment` (`treatment_id`),
  CONSTRAINT `FK__treatment` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_item`
--

LOCK TABLES `treatment_item` WRITE;
/*!40000 ALTER TABLE `treatment_item` DISABLE KEYS */;
INSERT INTO `treatment_item` VALUES (1,'jdnjb','s bs ','wwwwwwwwwwww wwwwwwww dddddddddddddd',1),(2,'jdnjb','  cbdcbd','ssssssssssssssssss',1),(3,'bs s ch','sssssssss','ssssssssssssssss',4);
/*!40000 ALTER TABLE `treatment_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-06 15:31:34
