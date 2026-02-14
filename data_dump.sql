-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: medportal
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `appointment_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `reason_for_visit` varchar(255) DEFAULT NULL,
  `clinical_notes` text,
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `patient_id` (`patient_id`,`doctor_id`,`appointment_date`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,8,5,'2024-12-04 11:49:06','scheduled','shortness of breath',NULL),(2,41,5,'2025-02-19 12:49:06','completed','spreading redness','Patient complains of red swollen skin ongoing for 1 week. Associated symptoms: fever, skin dimpling, red expanding skin area. Alert and oriented. Working diagnosis: Cellulitis. Start Amoxicillin-clavulanate. Follow up in 1 month.'),(4,49,9,'2025-08-03 15:49:06','scheduled','pneumonia symptoms',NULL),(5,34,10,'2025-09-05 11:04:06','no-show','worsening fatigue',NULL),(7,5,6,'2025-03-30 16:49:06','completed','increased thirst and urination','Patient presents with elevated blood sugar. Reports increased thirst, weight loss, numbness in hands or feet for 1 month. Patient has history of similar symptoms. Assessment: Type 2 Diabetes Mellitus. Plan: Begin treatment with Glipizide. Schedule follow-up in 1 week.'),(9,47,1,'2025-05-25 08:49:06','scheduled','runny nose and cough',NULL),(10,13,9,'2025-03-06 12:19:06','scheduled','angina',NULL),(11,5,8,'2025-11-01 15:34:06','scheduled','hot flashes',NULL),(12,49,4,'2025-08-06 11:19:06','completed','COPD follow-up','Patient presents with chronic cough for 2 weeks. Patient reports chronic cough, shortness of breath, chest tightness. No fever present. Impression: COPD. Recommendation: Continue monitoring. Start Tiotropium.'),(13,10,4,'2025-01-01 16:34:06','completed','stomach pain','Patient complains of burning abdominal pain ongoing for 2 days. Associated symptoms: dark stools, nausea, burning stomach pain. Patient appears uncomfortable but stable. Working diagnosis: Peptic Ulcer Disease. Omeprazole prescribed. Patient education provided. Follow up in 6 months.'),(14,12,2,'2025-04-02 13:34:06','scheduled','eye discharge',NULL),(15,38,10,'2025-07-05 17:04:06','completed','high cholesterol','Patient complains of lipid management ongoing for 2 weeks. Associated symptoms: arcus corneae, usually asymptomatic, xanthomas. Vital signs stable. Working diagnosis: Hyperlipidemia. Prescribe Rosuvastatin. Return if symptoms worsen.'),(17,9,6,'2025-06-10 11:49:06','cancelled','panic symptoms',NULL),(18,35,5,'2025-11-02 15:34:06','no-show','blistering rash',NULL),(20,6,7,'2025-05-22 10:04:06','scheduled','acid reflux',NULL),(21,48,8,'2025-09-16 07:34:06','completed','hot flashes','Patient presents with menopause symptoms for 2 weeks. Patient reports hot flashes, weight gain, night sweats. Patient has history of similar symptoms. Impression: Menopause. Recommendation: Vaginal estrogen prescribed. Patient education provided. Follow up in 1 week.'),(23,50,9,'2025-02-20 10:49:06','no-show','irregular heartbeat',NULL),(24,27,1,'2025-05-22 13:49:06','completed','joint stiffness','Patient complains of hip pain ongoing for a few days. Associated symptoms: decreased range of motion, stiffness, joint pain. No acute distress noted. Working diagnosis: Osteoarthritis. Prescribe Meloxicam. Return if symptoms worsen.'),(26,5,5,'2025-06-25 16:04:06','completed','itchy watery eyes','Patient presents with allergies for 1 month. Patient reports sneezing, postnasal drip, nasal congestion. No acute distress noted. Impression: Allergic Rhinitis. Recommendation: Start Loratadine. Follow up in 6 months.'),(27,47,6,'2025-08-21 09:19:06','completed','shortness of breath','Patient presents with swollen legs. Reports persistent cough, fatigue, swelling in legs for 1 week. No acute distress noted. Assessment: Heart Failure. Plan: Lisinopril prescribed. Patient education provided. Follow up in 3 months.'),(29,40,10,'2024-12-03 12:04:06','completed','stomach cramps','Patient complains of stomach cramps ongoing for several weeks. Associated symptoms: bloating, diarrhea, constipation. Patient has history of similar symptoms. Working diagnosis: Irritable Bowel Syndrome. Continue monitoring. Start Amitriptyline.'),(30,48,3,'2025-11-07 17:04:06','completed','trouble sleeping','Chief complaint: trouble sleeping. Duration: 3 days. Symptoms include difficulty falling asleep, difficulty staying asleep, waking too early. No acute distress noted. Diagnosis: Insomnia. Treatment: Start Trazodone. Follow up in 2 weeks.'),(31,30,7,'2025-11-24 14:19:00','no-show','vitamin D follow-up','None'),(33,45,9,'2025-04-09 09:19:06','scheduled','ear infection',NULL),(34,30,9,'2025-07-17 17:19:06','completed','night sweats','Patient complains of menopause symptoms ongoing for a few days. Associated symptoms: irregular periods, sleep problems, vaginal dryness. No fever present. Working diagnosis: Menopause. Begin treatment with Conjugated estrogens. Schedule follow-up in 3 months.'),(35,50,9,'2025-04-22 14:34:06','completed','eczema flare','Patient presents with itchy dry skin for 3 days. Patient reports raw sensitive skin from scratching, red patches, itching. Patient has history of similar symptoms. Impression: Eczema. Recommendation: Tacrolimus ointment prescribed. Patient education provided. Follow up in 1 month.'),(36,25,3,'2025-06-29 13:19:06','scheduled','joint swelling and redness',NULL),(37,4,4,'2025-09-28 08:19:06','completed','AFib follow-up','Patient complains of irregular heartbeat ongoing for 2 weeks. Associated symptoms: shortness of breath, palpitations, fatigue. Patient has history of similar symptoms. Working diagnosis: Atrial Fibrillation. Apixaban prescribed. Patient education provided. Follow up in 3 months.'),(38,28,8,'2025-11-10 13:49:06','completed','blood sugar management','Patient presents with elevated blood sugar. Reports weight loss, blurred vision, frequent urination for 2 days. No fever present. Assessment: Type 2 Diabetes Mellitus. Plan: Continue monitoring. Start Insulin glargine.'),(39,9,8,'2025-06-15 12:49:06','scheduled','arthritis pain',NULL),(40,21,6,'2025-07-06 11:34:06','completed','rapid heartbeat','Chief complaint: weight loss and anxiety. Duration: a few days. Symptoms include insomnia, weight loss, heat intolerance. No significant past medical history. Diagnosis: Hyperthyroidism. Treatment: Start Methimazole. Follow up in 1 month.'),(41,13,1,'2025-02-05 14:34:06','scheduled','shingles',NULL),(42,30,5,'2025-10-09 08:49:06','scheduled','hypothyroid follow-up',NULL),(43,7,10,'2025-09-23 14:19:06','no-show','diabetes follow-up',NULL),(44,5,10,'2025-05-06 16:34:06','scheduled','severe headache',NULL),(45,23,9,'2025-01-07 16:04:06','completed','heart failure follow-up','Patient presents with swollen legs for 2 weeks. Patient reports shortness of breath, rapid heartbeat, weight gain from fluid. Patient has history of similar symptoms. Impression: Heart Failure. Recommendation: Continue monitoring. Start Lisinopril.'),(46,40,9,'2025-10-02 12:04:06','completed','contact rash','Patient complains of contact rash ongoing for 1 week. Associated symptoms: itching, red rash, dry cracked skin. No significant past medical history. Working diagnosis: Contact Dermatitis. Cetirizine prescribed. Patient education provided. Follow up in 2 weeks.'),(47,21,3,'2025-04-14 13:04:06','completed','eczema flare','Patient presents with chronic skin irritation. Reports thickened skin, red patches, dry skin for 2 weeks. Patient appears uncomfortable but stable. Assessment: Eczema. Plan: Prescribe Moisturizers. Return if symptoms worsen.'),(48,45,8,'2024-12-11 09:04:06','completed','skin rash','Patient presents with skin rash for 2 weeks. Patient reports itching, small raised bumps, raw sensitive skin from scratching. No fever present. Impression: Eczema. Recommendation: Continue monitoring. Start Tacrolimus ointment.'),(49,23,8,'2025-03-31 08:49:06','completed','burning in chest','Chief complaint: burning in chest. Duration: several weeks. Symptoms include difficulty swallowing, heartburn, chronic cough. Patient appears uncomfortable but stable. Diagnosis: GERD. Treatment: Continue monitoring. Start Pantoprazole.'),(50,7,4,'2025-03-04 11:34:06','completed','epigastric pain','Patient presents with ulcer symptoms. Reports dark stools, heartburn, bloating for several weeks. Patient has history of similar symptoms. Assessment: Peptic Ulcer Disease. Plan: Sucralfate prescribed. Patient education provided. Follow up in 1 week.'),(51,7,1,'2025-08-05 15:04:06','completed','vitamin D check','Patient presents with vitamin D follow-up. Reports bone pain, fatigue, muscle weakness for 2 days. Patient appears uncomfortable but stable. Assessment: Vitamin D Deficiency. Plan: Continue monitoring. Start Ergocalciferol.'),(52,10,3,'2025-01-15 10:34:06','no-show','vitamin D follow-up',NULL),(53,39,10,'2025-08-27 14:19:06','completed','shingles','Patient presents with painful rash. Reports fatigue, burning sensation, sensitivity to touch for a few days. Patient has history of similar symptoms. Assessment: Shingles. Plan: Gabapentin prescribed. Patient education provided. Follow up in 1 month.'),(54,17,2,'2025-09-11 08:49:06','completed','chronic cough','Patient presents with worsening shortness of breath for 1 week. Patient reports chronic cough, chest tightness, fatigue. No fever present. Impression: COPD. Recommendation: Start Azithromycin. Follow up in 3 months.'),(55,45,8,'2025-04-17 16:49:06','completed','feeling anxious','Patient presents with anxiety for 2 days. Patient reports difficulty concentrating, excessive worry, irritability. Patient has history of similar symptoms. Impression: Generalized Anxiety Disorder. Recommendation: Prescribe Sertraline. Return if symptoms worsen.'),(56,39,10,'2025-07-30 12:19:06','completed','ulcer symptoms','Patient presents with stomach pain. Reports nausea, heartburn, dark stools for 2 weeks. No fever present. Assessment: Peptic Ulcer Disease. Plan: Amoxicillin prescribed. Patient education provided. Follow up in 3 months.'),(57,39,5,'2025-11-13 16:34:06','scheduled','increased thirst and urination',NULL),(58,37,1,'2025-11-01 15:04:06','completed','joint stiffness','Patient presents with joint stiffness. Reports stiffness, grinding sensation, joint swelling for 2 weeks. Vital signs stable. Assessment: Osteoarthritis. Plan: Continue monitoring. Start Duloxetine.'),(60,33,1,'2024-12-30 11:04:06','completed','sexual dysfunction','Patient presents with ED follow-up for 1 week. Patient reports reduced sexual desire, difficulty maintaining erection, difficulty getting erection. No acute distress noted. Impression: Erectile Dysfunction. Recommendation: Sildenafil prescribed. Patient education provided. Follow up in 2 weeks.'),(61,8,1,'2025-12-01 10:04:06','completed','eye discharge','Chief complaint: itchy red eyes. Duration: 2 days. Symptoms include gritty feeling, red eye, sensitivity to light. No fever present. Diagnosis: Conjunctivitis. Treatment: Start Ketotifen eye drops. Follow up in 1 week.'),(62,32,5,'2025-07-03 15:19:06','completed','spreading redness','Chief complaint: skin infection. Duration: a few days. Symptoms include swelling, tenderness, fever. No significant past medical history. Diagnosis: Cellulitis. Treatment: Dicloxacillin prescribed. Patient education provided. Follow up in 3 months.'),(63,50,7,'2025-08-19 11:34:06','no-show','facial pressure',NULL),(64,47,5,'2025-11-05 14:49:06','completed','weight loss help','Patient complains of obesity follow-up ongoing for a few days. Associated symptoms: fatigue, snoring, difficulty with physical activity. Patient has history of similar symptoms. Working diagnosis: Obesity. Continue monitoring. Start Semaglutide.'),(65,37,7,'2025-07-01 08:04:06','cancelled','chronic back pain',NULL),(66,46,7,'2025-11-01 10:19:06','no-show','weight loss and anxiety',NULL),(67,9,9,'2025-01-23 14:34:06','completed','obesity follow-up','Chief complaint: difficulty losing weight. Duration: a few days. Symptoms include snoring, fatigue, excess body weight. Vital signs stable. Diagnosis: Obesity. Treatment: Start Orlistat. Follow up in 3 months.'),(68,40,7,'2025-11-13 16:19:06','cancelled','cannot fall asleep',NULL),(69,41,8,'2025-01-07 11:04:06','scheduled','ED follow-up',NULL),(70,48,2,'2025-10-23 09:19:06','no-show','swollen legs',NULL),(71,45,5,'2024-12-31 12:04:06','scheduled','increased thirst and urination',NULL),(72,28,3,'2025-09-18 09:49:06','completed','headache with nausea','Chief complaint: migraine. Duration: 3 days. Symptoms include throbbing pain, severe headache, sensitivity to light. No acute distress noted. Diagnosis: Migraine. Treatment: Continue monitoring. Start Propranolol.'),(73,30,5,'2025-07-29 11:49:06','cancelled','high blood pressure',NULL),(74,29,6,'2025-07-08 12:19:06','completed','obesity follow-up','Patient presents with difficulty losing weight. Reports difficulty with physical activity, joint pain, shortness of breath for 1 month. Vital signs stable. Assessment: Obesity. Plan: Prescribe Liraglutide. Return if symptoms worsen.'),(75,45,5,'2025-11-05 14:04:06','no-show','elevated blood sugar',NULL),(76,37,1,'2025-04-28 11:04:06','completed','red eye','Patient presents with pink eye. Reports itchy eyes, crusting of eyelids, sensitivity to light for a few days. No acute distress noted. Assessment: Conjunctivitis. Plan: Start Artificial tears. Follow up in 2 weeks.'),(77,38,6,'2025-05-03 13:19:06','scheduled','difficulty breathing',NULL),(78,13,3,'2025-06-08 16:04:06','cancelled','ED follow-up',NULL),(79,17,8,'2025-05-25 09:19:06','completed','stomach pain','Patient presents with epigastric pain for 2 days. Patient reports burning stomach pain, bloating, dark stools. Vital signs stable. Impression: Peptic Ulcer Disease. Recommendation: Start Amoxicillin. Follow up in 6 months.'),(80,30,6,'2025-10-25 12:34:06','completed','pressure in head','Patient presents with tension headache for several weeks. Patient reports sensation of tightness around head, neck and shoulder muscle tightness, dull aching head pain. No significant past medical history. Impression: Tension Headache. Recommendation: Amitriptyline prescribed. Patient education provided. Follow up in 6 months.'),(81,45,5,'2024-12-26 08:04:06','scheduled','racing heart',NULL),(82,8,2,'2025-02-10 14:19:06','cancelled','headache with nausea',NULL),(84,24,2,'2025-10-29 12:34:06','completed','hypothyroid follow-up','Patient presents with fatigue and weight gain. Reports depression, cold intolerance, weight gain for 2 days. Alert and oriented. Assessment: Hypothyroidism. Plan: Prescribe Levothyroxine. Return if symptoms worsen.'),(86,8,1,'2025-04-03 17:04:06','scheduled','cough and fever',NULL),(87,12,5,'2025-07-06 15:34:06','scheduled','feeling depressed',NULL),(88,31,8,'2025-01-27 14:49:06','completed','feeling cold and tired','Patient complains of fatigue and weight gain ongoing for 2 weeks. Associated symptoms: fatigue, hair loss, depression. Alert and oriented. Working diagnosis: Hypothyroidism. Start Armour Thyroid. Follow up in 1 month.'),(89,28,2,'2025-07-18 08:34:06','completed','skin rash','Patient presents with skin rash for 2 weeks. Patient reports red patches, thickened skin, itching. Patient appears uncomfortable but stable. Impression: Eczema. Recommendation: Hydrocortisone cream prescribed. Patient education provided. Follow up in 2 weeks.'),(90,30,9,'2025-11-27 08:49:06','completed','pink eye','Patient complains of itchy red eyes ongoing for several weeks. Associated symptoms: discharge, sensitivity to light, itchy eyes. No significant past medical history. Working diagnosis: Conjunctivitis. Continue monitoring. Start Ketotifen eye drops.'),(91,28,6,'2025-02-19 14:34:06','completed','head pain','Patient presents with headache for 1 month. Patient reports dull aching head pain, neck and shoulder muscle tightness, tenderness in scalp. Patient appears uncomfortable but stable. Impression: Tension Headache. Recommendation: Prescribe Aspirin. Return if symptoms worsen.'),(93,23,9,'2025-04-24 16:49:06','scheduled','feeling cold and tired',NULL),(94,36,10,'2025-09-14 08:04:06','completed','burning skin pain','Patient presents with shingles for a few days. Patient reports painful rash, blisters, burning sensation. Patient has history of similar symptoms. Impression: Shingles. Recommendation: Start Famciclovir. Follow up in 1 month.'),(95,5,3,'2025-08-31 11:19:06','scheduled','blood sugar management',NULL),(96,30,6,'2025-05-18 16:34:06','completed','COPD follow-up','Patient presents with COPD follow-up. Reports chronic cough, shortness of breath, fatigue for several weeks. No acute distress noted. Assessment: COPD. Plan: Begin treatment with Azithromycin. Schedule follow-up in 1 week.'),(97,39,8,'2025-08-22 09:04:06','completed','racing heart','Patient complains of AFib follow-up ongoing for 2 days. Associated symptoms: shortness of breath, palpitations, fatigue. Patient has history of similar symptoms. Working diagnosis: Atrial Fibrillation. Amiodarone prescribed. Patient education provided. Follow up in 6 months.'),(98,39,1,'2025-03-21 10:04:06','completed','headache with dizziness','Patient complains of headache with dizziness ongoing for 2 weeks. Associated symptoms: blurred vision, fatigue, headache. Patient appears uncomfortable but stable. Working diagnosis: Essential Hypertension. Prescribe Lisinopril. Return if symptoms worsen.'),(99,33,9,'2024-12-24 13:34:06','scheduled','sneezing and runny nose',NULL),(100,5,6,'2025-06-28 14:04:06','completed','vitamin D check','Patient complains of vitamin D check ongoing for 2 weeks. Associated symptoms: fatigue, muscle aches, impaired wound healing. Alert and oriented. Working diagnosis: Vitamin D Deficiency. Begin treatment with Ergocalciferol. Schedule follow-up in 2 weeks.'),(102,50,6,'2025-10-29 09:49:06','completed','sneezing and runny nose','Chief complaint: seasonal allergies. Duration: a few days. Symptoms include sneezing, runny nose, nasal congestion. No fever present. Diagnosis: Allergic Rhinitis. Treatment: Start Loratadine. Follow up in 2 weeks.'),(103,30,10,'2025-09-18 17:04:06','completed','obesity follow-up','Patient presents with difficulty losing weight. Reports difficulty with physical activity, sweating, joint pain for several weeks. Vital signs stable. Assessment: Obesity. Plan: Continue monitoring. Start Orlistat.'),(104,38,1,'2025-05-10 15:19:06','completed','allergies','Patient presents with sneezing and runny nose. Reports sneezing, postnasal drip, nasal congestion for 2 weeks. Patient appears uncomfortable but stable. Assessment: Allergic Rhinitis. Plan: Fexofenadine prescribed. Patient education provided. Follow up in 1 week.'),(105,29,10,'2025-08-03 15:49:06','completed','rheumatoid arthritis follow-up','Chief complaint: morning stiffness. Duration: several weeks. Symptoms include joint pain and swelling, fever, joint deformity. No acute distress noted. Diagnosis: Rheumatoid Arthritis. Treatment: Start Hydroxychloroquine. Follow up in 1 week.'),(106,34,9,'2025-06-11 12:19:06','scheduled','burning skin pain',NULL),(107,50,6,'2025-10-22 12:34:06','scheduled','pink eye',NULL),(108,7,9,'2025-11-04 16:49:06','completed','weight loss and anxiety','Patient presents with rapid heartbeat for 1 month. Patient reports heat intolerance, weight loss, sweating. No fever present. Impression: Hyperthyroidism. Recommendation: Continue monitoring. Start Propylthiouracil.'),(110,13,4,'2025-05-03 08:34:06','scheduled','pneumonia symptoms',NULL),(111,50,10,'2025-02-19 09:49:06','completed','difficulty breathing','Patient presents with pneumonia symptoms. Reports confusion in elderly, fatigue, chest pain with breathing for several weeks. No fever present. Assessment: Community-Acquired Pneumonia. Plan: Continue monitoring. Start Amoxicillin-clavulanate.'),(112,29,10,'2025-07-20 10:49:06','completed','epigastric pain','Patient complains of ulcer symptoms ongoing for a few days. Associated symptoms: nausea, vomiting, bloating. No acute distress noted. Working diagnosis: Peptic Ulcer Disease. Continue monitoring. Start Sucralfate.'),(113,11,4,'2025-04-10 08:19:06','scheduled','pink eye',NULL),(114,36,2,'2025-04-27 08:49:06','cancelled','BPH follow-up',NULL),(115,29,9,'2025-01-18 11:19:06','cancelled','shortness of breath',NULL),(116,2,7,'2025-06-12 11:19:06','completed','depression follow-up','Patient presents with low mood. Reports persistent sadness, sleep disturbances, loss of interest for 3 days. No significant past medical history. Assessment: Major Depressive Disorder. Plan: Begin treatment with Sertraline. Schedule follow-up in 1 month.'),(117,31,3,'2024-12-05 08:34:06','completed','itchy rash','Patient complains of rash from exposure ongoing for 3 days. Associated symptoms: dry cracked skin, itching, swelling. Vital signs stable. Working diagnosis: Contact Dermatitis. Start Prednisone. Follow up in 6 months.'),(118,4,4,'2025-10-17 14:34:06','completed','AFib follow-up','Chief complaint: AFib follow-up. Duration: 2 weeks. Symptoms include palpitations, shortness of breath, dizziness. No significant past medical history. Diagnosis: Atrial Fibrillation. Treatment: Prescribe Warfarin. Return if symptoms worsen.'),(120,34,9,'2025-08-19 15:34:06','completed','spreading redness','Patient presents with spreading redness for a few days. Patient reports tenderness, skin dimpling, red expanding skin area. No significant past medical history. Impression: Cellulitis. Recommendation: Start Trimethoprim-sulfamethoxazole. Follow up in 1 month.'),(122,3,5,'2025-03-15 08:04:06','scheduled','RA flare',NULL),(123,33,7,'2024-12-21 11:04:06','completed','sexual dysfunction','Patient presents with sexual dysfunction for several weeks. Patient reports difficulty maintaining erection, difficulty getting erection, reduced sexual desire. No acute distress noted. Impression: Erectile Dysfunction. Recommendation: Continue monitoring. Start Vardenafil.'),(124,22,3,'2025-06-09 16:04:06','completed','itchy dry skin','Chief complaint: skin rash. Duration: 1 week. Symptoms include dry skin, small raised bumps, raw sensitive skin from scratching. No significant past medical history. Diagnosis: Eczema. Treatment: Cetirizine prescribed. Patient education provided. Follow up in 6 months.'),(125,21,5,'2025-07-09 10:19:06','completed','stomach cramps','Patient complains of abdominal pain and bloating ongoing for 2 days. Associated symptoms: gas, diarrhea, abdominal pain. No fever present. Working diagnosis: Irritable Bowel Syndrome. Begin treatment with Loperamide. Schedule follow-up in 6 months.'),(126,24,9,'2025-02-14 17:19:06','no-show','COPD exacerbation',NULL),(127,9,2,'2025-06-08 13:19:06','completed','migraine','Patient presents with recurring headaches for a few days. Patient reports sensitivity to light, severe headache, aura. No significant past medical history. Impression: Migraine. Recommendation: Begin treatment with Rizatriptan. Schedule follow-up in 3 months.'),(128,34,6,'2025-04-24 10:34:06','completed','feeling tired','Patient complains of fatigue and weakness ongoing for 1 week. Associated symptoms: fatigue, cold hands and feet, weakness. Alert and oriented. Working diagnosis: Iron Deficiency Anemia. Vitamin C prescribed. Patient education provided. Follow up in 6 months.'),(129,46,8,'2025-04-28 14:49:06','no-show','sudden joint pain',NULL),(130,9,2,'2025-11-06 23:34:06','scheduled','CAD follow-up',NULL),(132,32,1,'2025-06-09 14:49:06','completed','fatigue and weight gain','Patient complains of fatigue and weight gain ongoing for 3 days. Associated symptoms: weight gain, fatigue, cold intolerance. Vital signs stable. Working diagnosis: Hypothyroidism. Continue monitoring. Start Liothyronine.'),(133,29,8,'2025-09-11 16:49:06','completed','frequent urination at night','Patient presents with frequent urination at night. Reports dribbling, urgency, difficulty starting urination for 1 week. Patient has history of similar symptoms. Assessment: Benign Prostatic Hyperplasia. Plan: Silodosin prescribed. Patient education provided. Follow up in 1 week.'),(134,21,4,'2025-08-25 11:34:06','no-show','itchy watery eyes',NULL),(135,13,9,'2025-05-07 16:34:06','scheduled','acid reflux',NULL),(136,38,10,'2025-10-18 17:04:06','scheduled','asthma flare',NULL),(137,2,2,'2025-09-24 11:49:06','no-show','abnormal lipid panel',NULL),(138,40,1,'2025-09-08 12:04:06','cancelled','chronic skin irritation',NULL),(140,47,6,'2025-06-10 15:34:06','scheduled','feeling tired',NULL),(142,13,3,'2025-07-30 15:04:06','no-show','chronic skin irritation',NULL),(143,2,2,'2025-04-05 11:04:06','completed','pale and dizzy','Patient complains of fatigue and weakness ongoing for a few days. Associated symptoms: fatigue, brittle nails, pale skin. No significant past medical history. Working diagnosis: Iron Deficiency Anemia. Begin treatment with Vitamin C. Schedule follow-up in 6 months.'),(144,9,5,'2025-06-08 08:19:06','completed','hypothyroid follow-up','Patient presents with feeling cold and tired for 1 month. Patient reports fatigue, dry skin, depression. No acute distress noted. Impression: Hypothyroidism. Recommendation: Start Levothyroxine. Follow up in 1 month.'),(145,40,10,'2025-01-21 14:04:06','scheduled','chest congestion',NULL),(146,36,6,'2025-08-20 13:34:06','scheduled','asthma flare',NULL),(147,3,3,'2025-08-25 14:49:06','cancelled','sinus infection',NULL),(148,21,10,'2025-10-14 12:04:06','scheduled','frequent urination',NULL),(149,46,10,'2024-12-11 13:04:06','completed','IBS symptoms','Patient presents with stomach cramps. Reports alternating bowel habits, abdominal pain, diarrhea for 1 week. No fever present. Assessment: Irritable Bowel Syndrome. Plan: Amitriptyline prescribed. Patient education provided. Follow up in 1 month.'),(150,47,1,'2025-08-28 17:19:06','completed','difficulty losing weight','Patient presents with weight management. Reports shortness of breath, sweating, difficulty with physical activity for 2 weeks. Vital signs stable. Assessment: Obesity. Plan: Prescribe Phentermine. Return if symptoms worsen.'),(151,10,7,'2025-10-12 14:34:06','completed','joint swelling and redness','Patient presents with joint swelling and redness for 1 week. Patient reports limited range of motion, swelling, tenderness. Patient has history of similar symptoms. Impression: Gout. Recommendation: Continue monitoring. Start Indomethacin.'),(152,35,6,'2025-11-16 12:19:06','completed','sexual dysfunction','Patient presents with ED follow-up for several weeks. Patient reports difficulty getting erection, reduced sexual desire, difficulty maintaining erection. No fever present. Impression: Erectile Dysfunction. Recommendation: Begin treatment with Vardenafil. Schedule follow-up in 2 weeks.'),(153,21,8,'2025-04-22 11:34:06','completed','allergies','Chief complaint: allergies. Duration: 1 week. Symptoms include watery eyes, postnasal drip, itchy nose and eyes. No fever present. Diagnosis: Allergic Rhinitis. Treatment: Begin treatment with Fluticasone nasal spray. Schedule follow-up in 1 month.'),(154,23,8,'2025-03-22 11:04:06','completed','tension headache','Chief complaint: headache. Duration: several weeks. Symptoms include tenderness in scalp, dull aching head pain, neck and shoulder muscle tightness. Patient appears uncomfortable but stable. Diagnosis: Tension Headache. Treatment: Prescribe Amitriptyline. Return if symptoms worsen.'),(155,41,4,'2025-05-21 14:34:06','scheduled','low mood',NULL),(157,12,7,'2024-12-21 14:19:06','no-show','hip pain',NULL),(158,48,5,'2025-09-19 16:34:06','scheduled','lipid management',NULL),(159,19,8,'2025-02-09 16:19:06','completed','difficulty with erections','Patient complains of ED follow-up ongoing for 2 days. Associated symptoms: difficulty maintaining erection, difficulty getting erection, reduced sexual desire. No fever present. Working diagnosis: Erectile Dysfunction. Begin treatment with Vardenafil. Schedule follow-up in 2 weeks.'),(160,19,10,'2025-10-26 14:19:06','scheduled','RA flare',NULL),(161,6,7,'2025-02-12 15:04:06','scheduled','runny nose and cough',NULL),(163,44,9,'2025-10-26 12:04:06','completed','stomach cramps','Chief complaint: irregular bowel movements. Duration: 2 weeks. Symptoms include constipation, bloating, alternating bowel habits. No fever present. Diagnosis: Irritable Bowel Syndrome. Treatment: Continue monitoring. Start Hyoscyamine.'),(164,49,9,'2025-11-16 16:34:06','completed','swollen painful big toe','Patient presents with swollen painful big toe. Reports tenderness, warmth, often affects big toe for 1 month. Patient appears uncomfortable but stable. Assessment: Gout. Plan: Start Prednisone. Follow up in 1 week.'),(165,11,6,'2025-11-16 11:19:06','completed','difficulty urinating','Chief complaint: weak urine stream. Duration: 2 weeks. Symptoms include frequent urination, incomplete emptying, difficulty starting urination. Patient appears uncomfortable but stable. Diagnosis: Benign Prostatic Hyperplasia. Treatment: Tamsulosin prescribed. Patient education provided. Follow up in 3 months.'),(166,36,8,'2025-06-23 11:34:06','completed','abdominal pain and bloating','Patient complains of abdominal pain and bloating ongoing for 1 month. Associated symptoms: alternating bowel habits, bloating, constipation. No significant past medical history. Working diagnosis: Irritable Bowel Syndrome. Begin treatment with Dicyclomine. Schedule follow-up in 1 week.'),(167,31,1,'2025-02-10 14:04:06','completed','epigastric pain','Chief complaint: stomach pain. Duration: 3 days. Symptoms include vomiting, weight loss, dark stools. Patient appears uncomfortable but stable. Diagnosis: Peptic Ulcer Disease. Treatment: Begin treatment with Amoxicillin. Schedule follow-up in 1 week.'),(168,34,3,'2024-12-14 12:19:06','cancelled','chronic back pain',NULL),(169,35,7,'2025-05-29 10:04:06','completed','back pain','Patient presents with lower back pain. Reports muscle stiffness, aching pain in lower back, pain radiating to legs for 2 days. No significant past medical history. Assessment: Low Back Pain. Plan: Prescribe Acetaminophen. Return if symptoms worsen.'),(170,29,10,'2024-12-25 14:19:06','completed','depression follow-up','Patient presents with depression follow-up for 1 month. Patient reports loss of interest, difficulty concentrating, feelings of worthlessness. Patient appears uncomfortable but stable. Impression: Major Depressive Disorder. Recommendation: Prescribe Sertraline. Return if symptoms worsen.'),(172,18,1,'2025-03-02 14:19:06','no-show','hot flashes',NULL),(173,23,7,'2025-07-04 13:49:06','completed','frequent urination at night','Chief complaint: BPH follow-up. Duration: a few days. Symptoms include weak urine stream, difficulty starting urination, urgency. No fever present. Diagnosis: Benign Prostatic Hyperplasia. Treatment: Prescribe Silodosin. Return if symptoms worsen.'),(174,30,1,'2025-07-04 15:49:06','completed','menopause symptoms','Patient presents with night sweats. Reports vaginal dryness, night sweats, mood changes for 2 days. Patient appears uncomfortable but stable. Assessment: Menopause. Plan: Continue monitoring. Start Conjugated estrogens.'),(175,4,5,'2025-10-07 07:34:06','completed','rapid heartbeat','Chief complaint: hyperthyroid symptoms. Duration: 2 days. Symptoms include tremor, increased appetite, sweating. Patient has history of similar symptoms. Diagnosis: Hyperthyroidism. Treatment: Begin treatment with Propylthiouracil. Schedule follow-up in 3 months.'),(176,48,2,'2025-11-24 16:49:06','no-show','contact rash',NULL),(178,14,6,'2025-09-17 10:49:06','completed','UTI symptoms','Patient complains of UTI symptoms ongoing for 3 days. Associated symptoms: burning with urination, urgency, blood in urine. Vital signs stable. Working diagnosis: Urinary Tract Infection. Begin treatment with Fosfomycin. Schedule follow-up in 6 months.'),(179,25,10,'2025-11-03 13:04:06','completed','recurring headaches','Patient presents with migraine for several weeks. Patient reports aura, vomiting, sensitivity to sound. Patient appears uncomfortable but stable. Impression: Migraine. Recommendation: Prescribe Propranolol. Return if symptoms worsen.'),(180,12,9,'2025-01-10 07:34:06','completed','sadness and fatigue','Patient presents with sadness and fatigue. Reports fatigue, loss of interest, appetite changes for 1 week. No significant past medical history. Assessment: Major Depressive Disorder. Plan: Prescribe Sertraline. Return if symptoms worsen.'),(182,34,5,'2024-12-11 16:19:06','no-show','ED follow-up',NULL),(183,7,2,'2025-03-11 17:04:06','scheduled','BPH follow-up',NULL),(184,18,7,'2025-06-28 14:49:06','completed','waking up at night','Patient presents with waking up at night. Reports difficulty concentrating, difficulty staying asleep, waking too early for 2 weeks. Patient appears uncomfortable but stable. Assessment: Insomnia. Plan: Continue monitoring. Start Zolpidem.'),(185,4,1,'2025-07-13 12:34:00','no-show','COPD exacerbation','None'),(186,15,4,'2024-12-26 09:04:06','completed','vitamin D follow-up','Patient presents with fatigue and weakness. Reports depression, impaired wound healing, fatigue for a few days. Alert and oriented. Assessment: Vitamin D Deficiency. Plan: Prescribe Cholecalciferol. Return if symptoms worsen.'),(187,5,5,'2025-09-19 14:04:06','completed','COPD exacerbation','Patient presents with COPD exacerbation for 2 weeks. Patient reports chest tightness, fatigue, shortness of breath. Patient has history of similar symptoms. Impression: COPD. Recommendation: Start Tiotropium. Follow up in 6 months.'),(188,22,10,'2025-06-24 12:34:06','no-show','blistering rash',NULL),(189,29,8,'2025-06-13 13:49:06','completed','chronic back pain','Chief complaint: back pain. Duration: 1 week. Symptoms include difficulty standing straight, pain radiating to legs, aching pain in lower back. Patient has history of similar symptoms. Diagnosis: Low Back Pain. Treatment: Start Meloxicam. Follow up in 1 month.'),(190,46,3,'2025-01-26 08:34:06','completed','thyroid follow-up','Chief complaint: rapid heartbeat. Duration: 2 weeks. Symptoms include sweating, tremor, anxiety. No acute distress noted. Diagnosis: Hyperthyroidism. Treatment: Start Propranolol. Follow up in 1 week.'),(191,7,1,'2025-01-19 17:04:06','completed','insomnia','Patient presents with insomnia. Reports daytime fatigue, difficulty falling asleep, waking too early for 1 month. Patient appears uncomfortable but stable. Assessment: Insomnia. Plan: Eszopiclone prescribed. Patient education provided. Follow up in 3 months.'),(192,44,7,'2025-05-06 12:19:06','scheduled','worsening shortness of breath',NULL),(193,5,3,'2025-05-05 14:34:06','completed','shortness of breath','Chief complaint: shortness of breath. Duration: 3 days. Symptoms include swelling in legs, reduced exercise tolerance, fatigue. Vital signs stable. Diagnosis: Heart Failure. Treatment: Continue monitoring. Start Spironolactone.'),(194,26,6,'2025-05-20 15:04:06','completed','shingles','Patient presents with shingles for 2 weeks. Patient reports headache, fatigue, fever. Vital signs stable. Impression: Shingles. Recommendation: Begin treatment with Lidocaine patch. Schedule follow-up in 2 weeks.'),(195,26,6,'2025-10-23 14:49:06','completed','burning abdominal pain','Patient presents with burning abdominal pain. Reports nausea, vomiting, weight loss for 1 month. Patient appears uncomfortable but stable. Assessment: Peptic Ulcer Disease. Plan: Amoxicillin prescribed. Patient education provided. Follow up in 1 month.'),(196,44,9,'2025-07-27 11:19:06','no-show','increased thirst and urination',NULL),(197,45,2,'2025-02-12 11:49:06','completed','racing heart','Patient complains of racing heart ongoing for 1 month. Associated symptoms: fatigue, chest discomfort, irregular heartbeat. No acute distress noted. Working diagnosis: Atrial Fibrillation. Start Amiodarone. Follow up in 3 months.'),(198,35,9,'2025-06-05 15:34:06','completed','racing heart','Patient presents with racing heart. Reports palpitations, irregular heartbeat, fatigue for a few days. Vital signs stable. Assessment: Atrial Fibrillation. Plan: Diltiazem prescribed. Patient education provided. Follow up in 6 months.'),(199,7,1,'2025-08-21 15:49:06','completed','sore throat','Chief complaint: cold symptoms. Duration: 2 weeks. Symptoms include cough, sore throat, malaise. No significant past medical history. Diagnosis: Acute Upper Respiratory Infection. Treatment: Begin treatment with Dextromethorphan. Schedule follow-up in 6 months.'),(200,27,2,'2025-02-13 13:04:06','cancelled','chest congestion',NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_appointment_before_insert` BEFORE INSERT ON `appointment` FOR EACH ROW BEGIN
    IF NEW.status NOT IN ('scheduled', 'completed', 'cancelled', 'no-show') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid appointment status';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_appointment_before_update` BEFORE UPDATE ON `appointment` FOR EACH ROW BEGIN
    IF NEW.status NOT IN ('scheduled', 'completed', 'cancelled', 'no-show') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid appointment status';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `appointment_procedure`
--

DROP TABLE IF EXISTS `appointment_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_procedure` (
  `appointment_id` int NOT NULL,
  `procedure_id` int NOT NULL,
  `performed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`appointment_id`,`procedure_id`),
  KEY `procedure_id` (`procedure_id`),
  CONSTRAINT `appointment_procedure_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_procedure_ibfk_2` FOREIGN KEY (`procedure_id`) REFERENCES `procedure_record` (`procedure_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_procedure`
--

LOCK TABLES `appointment_procedure` WRITE;
/*!40000 ALTER TABLE `appointment_procedure` DISABLE KEYS */;
INSERT INTO `appointment_procedure` VALUES (2,1,'2025-02-19 12:49:06'),(7,2,'2025-03-30 16:49:06'),(12,3,'2025-08-06 11:19:06'),(12,4,'2025-08-06 11:19:06'),(13,5,'2025-01-01 16:34:06'),(13,6,'2025-01-01 16:34:06'),(13,7,'2025-01-01 16:34:06'),(21,11,'2025-09-16 07:34:06'),(21,12,'2025-09-16 07:34:06'),(21,13,'2025-09-16 07:34:06'),(24,14,'2025-05-22 13:49:06'),(24,15,'2025-05-22 13:49:06'),(24,16,'2025-05-22 13:49:06'),(26,17,'2025-06-25 16:04:06'),(26,18,'2025-06-25 16:04:06'),(26,19,'2025-06-25 16:04:06'),(27,20,'2025-08-21 09:19:06'),(27,21,'2025-08-21 09:19:06'),(30,24,'2025-11-07 17:04:06'),(30,25,'2025-11-07 17:04:06'),(34,26,'2025-07-17 17:19:06'),(38,27,'2025-11-10 13:49:06'),(38,28,'2025-11-10 13:49:06'),(40,29,'2025-07-06 11:34:06'),(40,30,'2025-07-06 11:34:06'),(40,31,'2025-07-06 11:34:06'),(46,32,'2025-10-02 12:04:06'),(46,33,'2025-10-02 12:04:06'),(47,34,'2025-04-14 13:04:06'),(48,35,'2024-12-11 09:04:06'),(48,36,'2024-12-11 09:04:06'),(48,37,'2024-12-11 09:04:06'),(49,38,'2025-03-31 08:49:06'),(50,39,'2025-03-04 11:34:06'),(50,40,'2025-03-04 11:34:06'),(50,41,'2025-03-04 11:34:06'),(51,42,'2025-08-05 15:04:06'),(53,43,'2025-08-27 14:19:06'),(54,44,'2025-09-11 08:49:06'),(54,45,'2025-09-11 08:49:06'),(54,46,'2025-09-11 08:49:06'),(55,47,'2025-04-17 16:49:06'),(55,48,'2025-04-17 16:49:06'),(56,49,'2025-07-30 12:19:06'),(56,50,'2025-07-30 12:19:06'),(62,52,'2025-07-03 15:19:06'),(62,53,'2025-07-03 15:19:06'),(62,54,'2025-07-03 15:19:06'),(64,55,'2025-11-05 14:49:06'),(64,56,'2025-11-05 14:49:06'),(64,57,'2025-11-05 14:49:06'),(72,58,'2025-09-18 09:49:06'),(72,59,'2025-09-18 09:49:06'),(72,60,'2025-09-18 09:49:06'),(74,61,'2025-07-08 12:19:06'),(74,62,'2025-07-08 12:19:06'),(74,63,'2025-07-08 12:19:06'),(76,64,'2025-04-28 11:04:06'),(76,65,'2025-04-28 11:04:06'),(76,66,'2025-04-28 11:04:06'),(80,67,'2025-10-25 12:34:06'),(80,68,'2025-10-25 12:34:06'),(84,69,'2025-10-29 12:34:06'),(84,70,'2025-10-29 12:34:06'),(84,71,'2025-10-29 12:34:06'),(88,72,'2025-01-27 14:49:06'),(88,73,'2025-01-27 14:49:06'),(88,74,'2025-01-27 14:49:06'),(89,75,'2025-07-18 08:34:06'),(89,76,'2025-07-18 08:34:06'),(89,77,'2025-07-18 08:34:06'),(90,78,'2025-11-27 08:49:06'),(91,79,'2025-02-19 14:34:06'),(91,80,'2025-02-19 14:34:06'),(91,81,'2025-02-19 14:34:06'),(94,82,'2025-09-14 08:04:06'),(97,83,'2025-08-22 09:04:06'),(97,84,'2025-08-22 09:04:06'),(100,85,'2025-06-28 14:04:06'),(100,86,'2025-06-28 14:04:06'),(100,87,'2025-06-28 14:04:06'),(102,90,'2025-10-29 09:49:06'),(102,91,'2025-10-29 09:49:06'),(102,92,'2025-10-29 09:49:06'),(104,93,'2025-05-10 15:19:06'),(108,94,'2025-11-04 16:49:06'),(108,95,'2025-11-04 16:49:06'),(111,97,'2025-02-19 09:49:06'),(112,98,'2025-07-20 10:49:06'),(112,99,'2025-07-20 10:49:06'),(112,100,'2025-07-20 10:49:06'),(117,101,'2024-12-05 08:34:06'),(117,102,'2024-12-05 08:34:06'),(118,103,'2025-10-17 14:34:06'),(118,104,'2025-10-17 14:34:06'),(118,105,'2025-10-17 14:34:06'),(120,106,'2025-08-19 15:34:06'),(123,109,'2024-12-21 11:04:06'),(123,110,'2024-12-21 11:04:06'),(123,111,'2024-12-21 11:04:06'),(124,112,'2025-06-09 16:04:06'),(124,113,'2025-06-09 16:04:06'),(124,114,'2025-06-09 16:04:06'),(125,115,'2025-07-09 10:19:06'),(128,116,'2025-04-24 10:34:06'),(132,118,'2025-06-09 14:49:06'),(133,119,'2025-09-11 16:49:06'),(133,120,'2025-09-11 16:49:06'),(143,124,'2025-04-05 11:04:06'),(143,125,'2025-04-05 11:04:06'),(143,126,'2025-04-05 11:04:06'),(144,127,'2025-06-08 08:19:06'),(149,128,'2024-12-11 13:04:06'),(152,129,'2025-11-16 12:19:06'),(153,130,'2025-04-22 11:34:06'),(154,131,'2025-03-22 11:04:06'),(154,132,'2025-03-22 11:04:06'),(159,136,'2025-02-09 16:19:06'),(159,137,'2025-02-09 16:19:06'),(159,138,'2025-02-09 16:19:06'),(164,141,'2025-11-16 16:34:06'),(164,142,'2025-11-16 16:34:06'),(165,143,'2025-11-16 11:19:06'),(166,144,'2025-06-23 11:34:06'),(166,145,'2025-06-23 11:34:06'),(166,146,'2025-06-23 11:34:06'),(167,147,'2025-02-10 14:04:06'),(169,148,'2025-05-29 10:04:06'),(170,149,'2024-12-25 14:19:06'),(170,150,'2024-12-25 14:19:06'),(170,151,'2024-12-25 14:19:06'),(174,152,'2025-07-04 15:49:06'),(174,153,'2025-07-04 15:49:06'),(174,154,'2025-07-04 15:49:06'),(175,155,'2025-10-07 07:34:06'),(178,157,'2025-09-17 10:49:06'),(178,158,'2025-09-17 10:49:06'),(179,159,'2025-11-03 13:04:06'),(179,160,'2025-11-03 13:04:06'),(179,161,'2025-11-03 13:04:06'),(180,162,'2025-01-10 07:34:06'),(186,163,'2024-12-26 09:04:06'),(187,164,'2025-09-19 14:04:06'),(187,165,'2025-09-19 14:04:06'),(187,166,'2025-09-19 14:04:06'),(189,167,'2025-06-13 13:49:06'),(189,168,'2025-06-13 13:49:06'),(191,169,'2025-01-19 17:04:06'),(193,170,'2025-05-05 14:34:06'),(193,171,'2025-05-05 14:34:06'),(193,172,'2025-05-05 14:34:06'),(194,173,'2025-05-20 15:04:06'),(194,174,'2025-05-20 15:04:06'),(194,175,'2025-05-20 15:04:06'),(197,176,'2025-02-12 11:49:06'),(197,177,'2025-02-12 11:49:06'),(197,178,'2025-02-12 11:49:06'),(198,179,'2025-06-05 15:34:06'),(198,180,'2025-06-05 15:34:06'),(198,181,'2025-06-05 15:34:06'),(199,182,'2025-08-21 15:49:06'),(199,183,'2025-08-21 15:49:06'),(199,184,'2025-08-21 15:49:06');
/*!40000 ALTER TABLE `appointment_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `license_number` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `license_number` (`license_number`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Jill','Rhodes','Rheumatology','MD104332','658-189-7912','johnsonjeffery@example.net'),(2,'Jeffrey','Lawrence','Internal Medicine','MD908386','928-990-1106','helenpeterson@example.org'),(3,'Michael','Cooper','Family Medicine','MD351161','370-926-1711','yherrera@example.org'),(4,'Janet','Williams','Urology','MD849593','333-891-5741','wyattmichelle@example.com'),(5,'Jason','Adams','Gastroenterology','MD475255','799-763-2169','amandasanchez@example.com'),(6,'Jeremy','Johnson','Pulmonology','MD648350','423-510-5386','clarksherri@example.net'),(7,'Joseph','Wright','Pulmonology','MD537672','674-651-5304','zhurst@example.com'),(8,'Michelle','Hernandez','Cardiology','MD328710','263-911-7916','cruzcaitlin@example.com'),(9,'Karen','Mack','Urology','MD848018','448-214-5808','amoore@example.net'),(10,'Meagan','Romero','Internal Medicine','MD482814','303-256-7126','amberosborne@example.net'),(11,'Jon','Targaryen','Gastrology','123378490','123-736-2332','jt@medportal.com');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_doctor_before_insert` BEFORE INSERT ON `doctor` FOR EACH ROW BEGIN
    IF NEW.phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be 10 digits';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_doctor_before_update` BEFORE UPDATE ON `doctor` FOR EACH ROW BEGIN
    IF NEW.phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be 10 digits';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medical_record`
--

DROP TABLE IF EXISTS `medical_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `visit_date` datetime NOT NULL,
  `chief_complaint` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `treatment_plan` text,
  `follow_up_required` tinyint(1) DEFAULT '0',
  `follow_up_date` date DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `medical_record_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record`
--

LOCK TABLES `medical_record` WRITE;
/*!40000 ALTER TABLE `medical_record` DISABLE KEYS */;
INSERT INTO `medical_record` VALUES (1,2,'2025-02-19 12:49:06','skin infection','Cellulitis','Start Amoxicillin-clavulanate. No acute distress noted.',0,NULL),(2,7,'2025-03-30 16:49:06','blood sugar management','Type 2 Diabetes Mellitus','Start Metformin. No acute distress noted.',0,NULL),(4,12,'2025-08-06 11:19:06','COPD exacerbation','COPD','Start Albuterol. No fever present.',1,'2025-08-27'),(5,13,'2025-01-01 16:34:06','burning abdominal pain','Peptic Ulcer Disease','Start Clarithromycin. Patient has history of similar symptoms.',1,'2025-01-29'),(6,15,'2025-07-05 17:04:06','abnormal lipid panel','Hyperlipidemia','Start Ezetimibe. Patient has history of similar symptoms.',1,'2025-08-23'),(8,21,'2025-09-16 07:34:06','menopausal follow-up','Menopause','Start Estradiol. No fever present.',0,NULL),(9,24,'2025-05-22 13:49:06','arthritis pain','Osteoarthritis','Start Meloxicam. No significant past medical history.',1,'2025-07-25'),(10,26,'2025-06-25 16:04:06','itchy watery eyes','Allergic Rhinitis','Start Cetirizine. Patient appears uncomfortable but stable.',1,'2025-07-28'),(11,27,'2025-08-21 09:19:06','swollen legs','Heart Failure','Start Furosemide. Vital signs stable.',1,'2025-11-04'),(13,29,'2024-12-03 12:04:06','irregular bowel movements','Irritable Bowel Syndrome','Start Amitriptyline. No acute distress noted.',0,NULL),(14,30,'2025-11-07 17:04:06','trouble sleeping','Insomnia','Start Melatonin. Vital signs stable.',0,NULL),(15,34,'2025-07-17 17:19:06','menopause symptoms','Menopause','Start Paroxetine. Patient appears uncomfortable but stable.',0,NULL),(16,35,'2025-04-22 14:34:06','skin rash','Eczema','Start Hydrocortisone cream. Patient has history of similar symptoms.',1,'2025-05-16'),(17,37,'2025-09-28 08:19:06','palpitations','Atrial Fibrillation','Start Diltiazem. Vital signs stable.',0,NULL),(18,38,'2025-11-10 13:49:06','blood sugar management','Type 2 Diabetes Mellitus','Start Empagliflozin. Patient appears uncomfortable but stable.',1,'2026-01-21'),(19,40,'2025-07-06 11:34:06','thyroid follow-up','Hyperthyroidism','Start Atenolol. Patient has history of similar symptoms.',1,'2025-09-24'),(20,45,'2025-01-07 16:04:06','swollen legs','Heart Failure','Start Sacubitril-valsartan. Patient has history of similar symptoms.',0,NULL),(21,46,'2025-10-02 12:04:06','rash from exposure','Contact Dermatitis','Start Triamcinolone cream. Patient has history of similar symptoms.',0,NULL),(22,47,'2025-04-14 13:04:06','chronic skin irritation','Eczema','Start Moisturizers. No significant past medical history.',0,NULL),(23,48,'2024-12-11 09:04:06','itchy dry skin','Eczema','Start Cetirizine. Patient has history of similar symptoms.',0,NULL),(24,49,'2025-03-31 08:49:06','GERD symptoms','GERD','Start Esomeprazole. No fever present.',1,'2025-05-26'),(25,50,'2025-03-04 11:34:06','epigastric pain','Peptic Ulcer Disease','Start Amoxicillin. No acute distress noted.',0,NULL),(26,51,'2025-08-05 15:04:06','vitamin D check','Vitamin D Deficiency','Start Cholecalciferol. Vital signs stable.',1,'2025-08-22'),(27,53,'2025-08-27 14:19:06','shingles','Shingles','Start Lidocaine patch. Vital signs stable.',1,'2025-10-08'),(28,54,'2025-09-11 08:49:06','COPD follow-up','COPD','Start Azithromycin. Patient appears uncomfortable but stable.',1,'2025-11-15'),(29,55,'2025-04-17 16:49:06','anxiety','Generalized Anxiety Disorder','Start Escitalopram. Alert and oriented.',1,'2025-07-06'),(30,56,'2025-07-30 12:19:06','stomach pain','Peptic Ulcer Disease','Start Amoxicillin. Patient appears uncomfortable but stable.',0,NULL),(31,58,'2025-11-01 15:04:06','knee pain','Osteoarthritis','Start Duloxetine. Alert and oriented.',1,'2026-01-01'),(33,60,'2024-12-30 11:04:06','erectile dysfunction','Erectile Dysfunction','Start Avanafil. Alert and oriented.',0,NULL),(34,61,'2025-12-01 10:04:06','eye discharge','Conjunctivitis','Start Artificial tears. Alert and oriented.',1,'2026-01-07'),(35,62,'2025-07-03 15:19:06','skin infection','Cellulitis','Start Amoxicillin-clavulanate. Patient has history of similar symptoms.',0,NULL),(36,64,'2025-11-05 14:49:06','weight management','Obesity','Start Topiramate-phentermine. Vital signs stable.',1,'2025-12-08'),(37,67,'2025-01-23 14:34:06','weight loss help','Obesity','Start Semaglutide. No fever present.',0,NULL),(38,72,'2025-09-18 09:49:06','headache with nausea','Migraine','Start Amitriptyline. Vital signs stable.',0,NULL),(39,74,'2025-07-08 12:19:06','difficulty losing weight','Obesity','Start Phentermine. Vital signs stable.',1,'2025-08-01'),(40,76,'2025-04-28 11:04:06','eye discharge','Conjunctivitis','Start Ofloxacin eye drops. No fever present.',1,'2025-05-21'),(41,79,'2025-05-25 09:19:06','burning abdominal pain','Peptic Ulcer Disease','Start Amoxicillin. No acute distress noted.',0,NULL),(42,80,'2025-10-25 12:34:06','head pain','Tension Headache','Start Aspirin. No acute distress noted.',1,'2026-01-13'),(44,84,'2025-10-29 12:34:06','hypothyroid follow-up','Hypothyroidism','Start Armour Thyroid. Vital signs stable.',1,'2025-12-26'),(46,88,'2025-01-27 14:49:06','feeling cold and tired','Hypothyroidism','Start Armour Thyroid. No fever present.',1,'2025-02-14'),(47,89,'2025-07-18 08:34:06','itchy dry skin','Eczema','Start Moisturizers. No acute distress noted.',0,NULL),(48,90,'2025-11-27 08:49:06','eye discharge','Conjunctivitis','Start Ketotifen eye drops. Vital signs stable.',1,'2026-01-27'),(49,91,'2025-02-19 14:34:06','head pain','Tension Headache','Start Naproxen. Patient appears uncomfortable but stable.',0,NULL),(51,94,'2025-09-14 08:04:06','painful rash','Shingles','Start Gabapentin. No significant past medical history.',1,'2025-09-26'),(52,96,'2025-05-18 16:34:06','COPD follow-up','COPD','Start Prednisone. No significant past medical history.',1,'2025-06-14'),(53,97,'2025-08-22 09:04:06','irregular heartbeat','Atrial Fibrillation','Start Amiodarone. Patient has history of similar symptoms.',0,NULL),(54,98,'2025-03-21 10:04:06','headache with dizziness','Essential Hypertension','Start Losartan. No significant past medical history.',0,NULL),(55,100,'2025-06-28 14:04:06','bone pain','Vitamin D Deficiency','Start Cholecalciferol. Vital signs stable.',0,NULL),(57,102,'2025-10-29 09:49:06','allergies','Allergic Rhinitis','Start Cetirizine. No significant past medical history.',1,'2025-12-29'),(58,103,'2025-09-18 17:04:06','weight management','Obesity','Start Orlistat. Patient appears uncomfortable but stable.',1,'2025-11-25'),(59,104,'2025-05-10 15:19:06','sneezing and runny nose','Allergic Rhinitis','Start Cetirizine. No significant past medical history.',1,'2025-07-22'),(60,105,'2025-08-03 15:49:06','joint pain and swelling','Rheumatoid Arthritis','Start Sulfasalazine. No fever present.',0,NULL),(61,108,'2025-11-04 16:49:06','weight loss and anxiety','Hyperthyroidism','Start Propylthiouracil. No acute distress noted.',1,'2026-01-11'),(63,111,'2025-02-19 09:49:06','difficulty breathing','Community-Acquired Pneumonia','Start Doxycycline. Alert and oriented.',0,NULL),(64,112,'2025-07-20 10:49:06','burning abdominal pain','Peptic Ulcer Disease','Start Omeprazole. Patient appears uncomfortable but stable.',1,'2025-10-17'),(65,116,'2025-06-12 11:19:06','low mood','Major Depressive Disorder','Start Bupropion. Vital signs stable.',1,'2025-09-05'),(66,117,'2024-12-05 08:34:06','skin reaction','Contact Dermatitis','Start Cetirizine. Patient appears uncomfortable but stable.',1,'2025-03-02'),(67,118,'2025-10-17 14:34:06','irregular heartbeat','Atrial Fibrillation','Start Metoprolol. No significant past medical history.',0,NULL),(68,120,'2025-08-19 15:34:06','hot swollen area','Cellulitis','Start Clindamycin. No acute distress noted.',1,'2025-09-10'),(70,123,'2024-12-21 11:04:06','difficulty with erections','Erectile Dysfunction','Start Sildenafil. Alert and oriented.',1,'2025-01-28'),(71,124,'2025-06-09 16:04:06','eczema flare','Eczema','Start Moisturizers. Patient appears uncomfortable but stable.',0,NULL),(72,125,'2025-07-09 10:19:06','irregular bowel movements','Irritable Bowel Syndrome','Start Dicyclomine. Alert and oriented.',1,'2025-09-04'),(73,127,'2025-06-08 13:19:06','recurring headaches','Migraine','Start Sumatriptan. Patient has history of similar symptoms.',1,'2025-08-17'),(74,128,'2025-04-24 10:34:06','fatigue and weakness','Iron Deficiency Anemia','Start Ferrous sulfate. Vital signs stable.',0,NULL),(76,132,'2025-06-09 14:49:06','hypothyroid follow-up','Hypothyroidism','Start Armour Thyroid. No fever present.',0,NULL),(77,133,'2025-09-11 16:49:06','difficulty urinating','Benign Prostatic Hyperplasia','Start Tamsulosin. Patient appears uncomfortable but stable.',1,'2025-11-17'),(80,143,'2025-04-05 11:04:06','pale and dizzy','Iron Deficiency Anemia','Start Vitamin C. No significant past medical history.',0,NULL),(81,144,'2025-06-08 08:19:06','fatigue and weight gain','Hypothyroidism','Start Liothyronine. No significant past medical history.',1,'2025-07-20'),(82,149,'2024-12-11 13:04:06','irregular bowel movements','Irritable Bowel Syndrome','Start Linaclotide. Patient appears uncomfortable but stable.',1,'2025-01-06'),(83,150,'2025-08-28 17:19:06','difficulty losing weight','Obesity','Start Orlistat. No significant past medical history.',1,'2025-10-13'),(84,151,'2025-10-12 14:34:06','joint swelling and redness','Gout','Start Colchicine. No acute distress noted.',1,'2025-10-30'),(85,152,'2025-11-16 12:19:06','ED follow-up','Erectile Dysfunction','Start Sildenafil. No significant past medical history.',1,'2026-01-01'),(86,153,'2025-04-22 11:34:06','seasonal allergies','Allergic Rhinitis','Start Fluticasone nasal spray. Vital signs stable.',1,'2025-04-30'),(87,154,'2025-03-22 11:04:06','tension headache','Tension Headache','Start Naproxen. Patient has history of similar symptoms.',0,NULL),(89,159,'2025-02-09 16:19:06','difficulty with erections','Erectile Dysfunction','Start Sildenafil. Vital signs stable.',0,NULL),(91,163,'2025-10-26 12:04:06','IBS symptoms','Irritable Bowel Syndrome','Start Loperamide. Patient has history of similar symptoms.',0,NULL),(92,164,'2025-11-16 16:34:06','sudden joint pain','Gout','Start Febuxostat. No fever present.',0,NULL),(93,165,'2025-11-16 11:19:06','difficulty urinating','Benign Prostatic Hyperplasia','Start Tamsulosin. Alert and oriented.',1,'2025-12-22'),(94,166,'2025-06-23 11:34:06','abdominal pain and bloating','Irritable Bowel Syndrome','Start Linaclotide. Vital signs stable.',1,'2025-07-31'),(95,167,'2025-02-10 14:04:06','burning abdominal pain','Peptic Ulcer Disease','Start Pantoprazole. Alert and oriented.',0,NULL),(96,169,'2025-05-29 10:04:06','chronic back pain','Low Back Pain','Start Naproxen. Vital signs stable.',1,'2025-08-14'),(97,170,'2024-12-25 14:19:06','depression follow-up','Major Depressive Disorder','Start Fluoxetine. Alert and oriented.',1,'2025-02-23'),(98,173,'2025-07-04 13:49:06','BPH follow-up','Benign Prostatic Hyperplasia','Start Tamsulosin. Patient appears uncomfortable but stable.',1,'2025-09-22'),(99,174,'2025-07-04 15:49:06','menopause symptoms','Menopause','Start Vaginal estrogen. No significant past medical history.',1,'2025-08-02'),(100,175,'2025-10-07 07:34:06','weight loss and anxiety','Hyperthyroidism','Start Atenolol. Alert and oriented.',0,NULL),(102,178,'2025-09-17 10:49:06','burning urination','Urinary Tract Infection','Start Ciprofloxacin. Patient has history of similar symptoms.',0,NULL),(103,179,'2025-11-03 13:04:06','headache with nausea','Migraine','Start Amitriptyline. Patient has history of similar symptoms.',0,NULL),(104,180,'2025-01-10 07:34:06','depression follow-up','Major Depressive Disorder','Start Venlafaxine. No acute distress noted.',0,NULL),(105,184,'2025-06-28 14:49:06','insomnia','Insomnia','Start Trazodone. No significant past medical history.',1,'2025-09-12'),(106,186,'2024-12-26 09:04:06','vitamin D check','Vitamin D Deficiency','Start Cholecalciferol. Patient appears uncomfortable but stable.',0,NULL),(107,187,'2025-09-19 14:04:06','COPD exacerbation','COPD','Start Albuterol. No significant past medical history.',0,NULL),(108,189,'2025-06-13 13:49:06','threw out my back','Low Back Pain','Start Ibuprofen. Patient has history of similar symptoms.',0,NULL),(109,190,'2025-01-26 08:34:06','thyroid follow-up','Hyperthyroidism','Start Methimazole. Patient has history of similar symptoms.',1,'2025-03-27'),(110,191,'2025-01-19 17:04:06','trouble sleeping','Insomnia','Start Zolpidem. Patient has history of similar symptoms.',0,NULL),(111,193,'2025-05-05 14:34:06','heart failure follow-up','Heart Failure','Start Spironolactone. No fever present.',0,NULL),(112,194,'2025-05-20 15:04:06','painful rash','Shingles','Start Lidocaine patch. Patient has history of similar symptoms.',1,'2025-08-09'),(113,195,'2025-10-23 14:49:06','stomach pain','Peptic Ulcer Disease','Start Clarithromycin. Patient appears uncomfortable but stable.',0,NULL),(114,197,'2025-02-12 11:49:06','irregular heartbeat','Atrial Fibrillation','Start Diltiazem. Vital signs stable.',1,'2025-04-15'),(115,198,'2025-06-05 15:34:06','AFib follow-up','Atrial Fibrillation','Start Rivaroxaban. No fever present.',0,NULL),(116,199,'2025-08-21 15:49:06','sore throat','Acute Upper Respiratory Infection','Start Dextromethorphan. Vital signs stable.',0,NULL);
/*!40000 ALTER TABLE `medical_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_medical_record_before_insert` BEFORE INSERT ON `medical_record` FOR EACH ROW BEGIN
    IF NEW.follow_up_required = TRUE AND NEW.follow_up_date IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Follow up date is required when follow up is marked as required';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_medical_record_before_update` BEFORE UPDATE ON `medical_record` FOR EACH ROW BEGIN
    IF NEW.follow_up_required = TRUE AND NEW.follow_up_date IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Follow up date is required when follow up is marked as required';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `emergency_contact_name` varchar(100) DEFAULT NULL,
  `emergency_contact_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (2,'Kevin','Smith','1942-12-06','Male','A+','334-169-1514','chad34@example.net','997 Kristen Valley, Leeville, TN 56999','Jason Shields','155-789-2612'),(3,'Antonio','Chandler','1949-10-15','Male','B-','354-296-4116','ltaylor@example.com','8108 Tanya Terrace, East Richard, NJ 28517','Stephanie Martin','102-499-5345'),(4,'Timothy','Glover','1973-09-27','Male','A+','533-813-8973','jamesrobinson@example.org','500 Shaw Walk, North Susan, CO 24857','Barry Hensley','513-222-5033'),(5,'Kent','Williams','1946-01-28','Male','O+','529-773-9565','sarah35@example.org','475 Albert Road, North Amandahaven, KS 17862','Shirley Suarez','478-391-3584'),(6,'Jeffrey','Daniels','1976-02-03','Male','O-','726-926-9666','contrerasangela@example.net','1182 Campbell Fords, Jamesview, NY 64533','Terry Williams','749-533-5533'),(7,'Amanda','Cook','1952-09-21','Female','A+','752-368-3647','barnold@example.net','280 Aguilar Drive, Andersonport, MN 05730','Christine Wright','205-462-7658'),(8,'William','Brady','1967-02-20','Male','O+','985-266-3900','vjohnson@example.com','342 Patrick Camp Suite 337, Kevinbury, IN 03602','Jennifer Ramirez','171-891-5573'),(9,'Heather','Hicks','2007-11-24','Female','AB+','439-128-2889','gregory40@example.org','569 Paul Ports Apt. 406, New Saraside, TX 94798','Nancy Gonzalez','541-171-6409'),(10,'Marcus','Alvarado','1951-11-18','Male','B-','837-407-9308','elizabeth56@example.net','66299 Sullivan Village, West Justinchester, WY 76520','Erica Ramos','791-318-9375'),(11,'Kara','Santana','1958-01-05','Female','A-','774-186-5649','clarence34@example.org','03791 Perry Roads, Lake Heather, NM 52884','Matthew Smith','868-981-2746'),(12,'Richard','Robinson','2005-05-30','Male','O+','575-151-5082','bryantlaurie@example.net','9868 Merritt Summit Suite 743, Katiehaven, NM 82650','Jeremiah Reeves','340-378-6502'),(13,'Francisco','Fernandez','1953-10-01','Male','AB-','254-336-7275','jasminebrown@example.com','0366 Melissa Track Suite 705, Karenchester, ND 98479','Rebecca Hurst','599-324-5471'),(14,'Jessica','Johnson','1980-08-31','Female','AB+','784-795-7624','marycalhoun@example.net','901 Taylor Mountain Apt. 046, Jasonmouth, MA 50193','Trevor Fisher','954-183-8705'),(15,'Alec','Ryan','1982-07-19','Male','O-','329-765-2124','websterstefanie@example.org','27193 Lyons Trafficway, Garyville, WI 21966','Ashley Johnson','419-689-7149'),(17,'Jeffrey','Gross','1971-09-04','Male','AB+','730-927-9817','umarshall@example.net','47379 Rogers Park, Hunterborough, MI 34363','Spencer Haynes','382-669-1166'),(18,'Kellie','Lee','1967-10-07','Female','B-','837-516-9004','hannahbrewer@example.com','43634 Kennedy Pines, Ronaldside, MA 46613','Denise King','223-838-4155'),(19,'Ethan','Newton','1960-02-12','Male','A+','296-321-8933','jenny89@example.com','Unit 3435 Box 2408, DPO AE 36455','Anthony Carter','229-753-9042'),(21,'James','Kerr','1975-05-22','Male','B-','980-702-8025','ashley09@example.net','341 John Plaza, East Aaronmouth, UT 78333','Andrew Roberts','389-819-8438'),(22,'Benjamin','Hall','1970-12-04','Male','O+','906-910-4241','owilson@example.net','10249 Gonzales Mountain Suite 648, Kimton, FM 57127','Lindsey Johnson','334-790-1339'),(23,'Yvonne','Chambers','1971-08-07','Female','O-','690-141-3870','cstone@example.com','717 Ortiz Islands Apt. 256, Robertsfurt, GU 72603','Brandon King','218-891-7622'),(24,'Sharon','Bryan','1935-01-28','Female','B+','773-990-9889','mgutierrez@example.net','703 Dunn Heights Suite 710, Lake Eric, OH 02293','Anna Gay','216-572-2924'),(25,'Maria','Moore','1974-08-22','Female','AB-','621-822-5479','edavenport@example.org','3982 Joshua Turnpike, Morganhaven, KY 00837','Edwin Matthews','775-601-3434'),(26,'Jeremy','Washington','1980-02-29','Male','AB+','665-881-9903','ugibson@example.org','Unit 3963 Box 6057, DPO AP 50469','Matthew Hoover','255-607-1606'),(27,'Cameron','Sanford','1980-02-07','Male','B+','990-202-8213','foxstephen@example.net','74596 Melissa Walk, Finleyfort, VI 71413','Barry Welch','394-332-2480'),(28,'Jeffrey','Garcia','1948-08-06','Male','B+','554-270-5906','williamslaura@example.com','38692 Gregory Ridge Suite 937, East Steven, KS 60737','Adam Ballard','394-793-9955'),(29,'Brooke','Alexander','1981-12-13','Female','O+','701-406-7951','stephen43@example.com','69594 Johnson Village, Hillshire, VI 90390','Valerie Lozano','863-608-5689'),(30,'Patricia','Hall','1982-11-13','Female','B-','324-751-4115','erica21@example.net','0952 Renee Islands Suite 232, Alyssaview, MP 22068','Roger Olson','925-402-6549'),(31,'Regina','Mcdonald','1945-03-02','Female','A+','244-872-4696','zcoffey@example.net','48175 Richards View Suite 137, New Nicoleside, MD 80465','Arthur Colon','817-409-7689'),(32,'Bruce','Williams','1939-12-25','Male','A+','411-604-2902','youngamanda@example.com','261 Gilbert Harbors Apt. 537, Sampsonstad, CT 90374','Steven Newman','162-507-5520'),(33,'Cheryl','Martinez','1996-10-21','Female','O+','193-778-4475','williamsmatthew@example.org','83933 Schroeder Turnpike, West Micheleberg, DC 71308','Christopher Guerrero','126-234-1243'),(34,'Heather','Kramer','1978-12-25','Female','A-','116-278-5347','martinezrobert@example.org','5891 Gordon Ridges Apt. 847, North Yolandafurt, NE 90429','Micheal Wallace','182-429-3430'),(35,'Austin','Hill','1979-03-06','Male','AB-','490-711-9692','shawn96@example.org','836 Beasley Loop, Mariafurt, MT 96132','Jeffery Ortega','483-256-8770'),(36,'Austin','Decker','1947-08-10','Male','O-','542-198-7105','angelawillis@example.net','5604 Bell Ports, East Diane, IN 14685','Justin Wilson','385-687-4705'),(37,'Renee','Bruce','1938-06-29','Female','O-','723-773-5381','whitejacqueline@example.com','PSC 5022, Box 9612, APO AP 83492','Anna Moreno','485-529-8432'),(38,'Glen','Wood','1979-01-25','Male','AB+','895-681-2391','moorekaren@example.org','6797 Nelson Throughway Apt. 561, Erikashire, NM 69567','Amber Foster','713-156-1125'),(39,'Dan','Dougherty','1953-08-05','Male','B-','882-361-5742','david76@example.org','851 Hensley Canyon, Smithland, VI 41534','Laura Mckinney','527-396-2887'),(40,'Jennifer','Burch','1958-04-23','Female','O+','920-732-8538','christopher13@example.com','4535 Charles Roads, New Williamstad, MI 95840','Maria Hernandez','205-249-5193'),(41,'Christina','Morrison','1945-03-04','Female','AB-','281-891-9095','wwebster@example.net','527 Taylor Roads Suite 490, Williamport, NH 59734','Jacob Mitchell','760-984-2479'),(42,'Lucas','Hunter','1997-11-22','Male','B+','694-667-1672','kstout@example.net','207 Lisa Villages Suite 182, East Jasminemouth, NC 69018','Helen Hardin','496-518-6543'),(44,'Mason','Murphy','1952-04-23','Male','A-','786-819-9624','lucasrodney@example.com','35733 Eric Hill Apt. 888, Lake Matthewberg, PA 49878','Christopher Schwartz','739-928-3712'),(45,'Nathan','Williams','1984-07-01','Male','B+','792-836-4891','wbishop@example.net','347 Micheal Ports, Murrayport, WI 50553','Jennifer Martin','304-920-3267'),(46,'Shelley','Williams','2000-04-29','Female','A-','995-480-2680','mitchellkathryn@example.com','1375 Robert Locks, Joeland, MN 29931','Timothy Combs','765-443-3392'),(47,'Brenda','Mitchell','1999-03-21','Female','O+','812-951-3273','awest@example.org','89861 Young Crossing, East Robertmouth, CA 15031','Kathryn Herrera','747-627-4963'),(48,'Michelle','Carter','1935-02-17','Female','AB+','729-461-4941','qlopez@example.org','88888 Peter Mountains Apt. 654, West Kristinastad, IA 96569','Ashley Perkins','874-440-3185'),(49,'Andrew','Payne','1958-09-30','Male','A-','950-897-8612','zwelch@example.org','43030 Mahoney Passage Suite 874, Port Deborahport, MI 06766','Evelyn Martinez','476-547-7553'),(50,'Natalie','Kline','1987-07-17','Female','AB-','447-291-9129','zrichardson@example.net','616 Amy Islands, North Markport, ME 58948','Jessica Norris','459-557-1693'),(51,'Jon','Snow','2015-01-02','Male','AB+','123-736-2234','jon@example.com','random address','Sansa Stark','453-736-2234'),(52,'Demo','Patient','2025-02-11','Male','A-','123-736-2238','3@example.com','demo address','demo emergency','123-736-2239');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_patient_before_insert` BEFORE INSERT ON `patient` FOR EACH ROW BEGIN
    IF NEW.date_of_birth > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of birth cannot be in the future';
    END IF;
    
    IF NEW.phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be 10 digits';
    END IF;
    
    IF NEW.emergency_contact_phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.emergency_contact_phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Emergency contact phone must be 10 digits';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_patient_before_update` BEFORE UPDATE ON `patient` FOR EACH ROW BEGIN
    IF NEW.date_of_birth > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of birth cannot be in the future';
    END IF;
    
    IF NEW.phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be 10 digits';
    END IF;
    
    IF NEW.emergency_contact_phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.emergency_contact_phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Emergency contact phone must be 10 digits';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `medication_name` varchar(100) NOT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `instructions` text,
  `prescribed_date` datetime NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE CASCADE,
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,2,41,'Cephalexin','25mg','Twice daily','60 days','Take with food.','2025-02-19 12:49:06'),(2,7,5,'Metformin','20mg','Every 8 hours','30 days','Take with water.','2025-03-30 16:49:06'),(5,12,49,'Albuterol','100mg','Twice daily','7 days','Take on empty stomach.','2025-08-06 11:19:06'),(6,12,49,'Tiotropium','100mg','Every 8 hours','60 days','Take with food.','2025-08-06 11:19:06'),(7,12,49,'Prednisone','50mg','Three times daily','10 days','Take with food.','2025-08-06 11:19:06'),(8,13,10,'Amoxicillin','10mg','Every 8 hours','7 days','Take on empty stomach.','2025-01-01 16:34:06'),(9,13,10,'Pantoprazole','10mg','Once daily','7 days','Take on empty stomach.','2025-01-01 16:34:06'),(10,15,38,'Rosuvastatin','200mg','Three times daily','90 days','Take with food.','2025-07-05 17:04:06'),(14,21,48,'Gabapentin','5mg','Every 8 hours','90 days','Take as directed.','2025-09-16 07:34:06'),(15,21,48,'Vaginal estrogen','20mg','Three times daily','10 days','Take on empty stomach.','2025-09-16 07:34:06'),(16,21,48,'Conjugated estrogens','50mg','Three times daily','30 days','Take on empty stomach.','2025-09-16 07:34:06'),(17,24,27,'Diclofenac gel','25mg','At bedtime','14 days','Take as directed.','2025-05-22 13:49:06'),(18,26,5,'Montelukast','5mg','Once daily','14 days','Take as directed.','2025-06-25 16:04:06'),(19,26,5,'Fluticasone nasal spray','20mg','Every 8 hours','10 days','Take on empty stomach.','2025-06-25 16:04:06'),(20,27,47,'Sacubitril-valsartan','100mg','Every 8 hours','60 days','Take as directed.','2025-08-21 09:19:06'),(21,27,47,'Lisinopril','100mg','As needed','60 days','Take with water.','2025-08-21 09:19:06'),(22,27,47,'Carvedilol','200mg','Three times daily','10 days','Take with food.','2025-08-21 09:19:06'),(25,29,40,'Dicyclomine','25mg','At bedtime','10 days','Take with water.','2024-12-03 12:04:06'),(26,30,48,'Zolpidem','200mg','Three times daily','10 days','Take on empty stomach.','2025-11-07 17:04:06'),(27,30,48,'Trazodone','25mg','As needed','14 days','Take with water.','2025-11-07 17:04:06'),(28,30,48,'Melatonin','5mg','At bedtime','90 days','Take with water.','2025-11-07 17:04:06'),(29,34,30,'Vaginal estrogen','25mg','Every 8 hours','60 days','Take with water.','2025-07-17 17:19:06'),(30,34,30,'Conjugated estrogens','20mg','Every 8 hours','7 days','Take with food.','2025-07-17 17:19:06'),(31,34,30,'Paroxetine','5mg','Twice daily','60 days','Take on empty stomach.','2025-07-17 17:19:06'),(32,35,50,'Moisturizers','250mg','Once daily','14 days','Take on empty stomach.','2025-04-22 14:34:06'),(33,37,4,'Apixaban','20mg','Three times daily','7 days','Take with food.','2025-09-28 08:19:06'),(34,38,28,'Insulin glargine','20mg','Once daily','60 days','Take with water.','2025-11-10 13:49:06'),(35,40,21,'Propranolol','200mg','As needed','7 days','Take with water.','2025-07-06 11:34:06'),(36,45,23,'Furosemide','20mg','At bedtime','30 days','Take as directed.','2025-01-07 16:04:06'),(37,45,23,'Carvedilol','100mg','Twice daily','90 days','Take with water.','2025-01-07 16:04:06'),(38,46,40,'Prednisone','20mg','Every 8 hours','14 days','Take with water.','2025-10-02 12:04:06'),(39,47,21,'Triamcinolone cream','5mg','At bedtime','60 days','Take as directed.','2025-04-14 13:04:06'),(40,48,45,'Hydrocortisone cream','100mg','As needed','10 days','Take with food.','2024-12-11 09:04:06'),(41,48,45,'Triamcinolone cream','250mg','Twice daily','14 days','Take with food.','2024-12-11 09:04:06'),(42,48,45,'Tacrolimus ointment','25mg','Three times daily','14 days','Take on empty stomach.','2024-12-11 09:04:06'),(43,49,23,'Omeprazole','5mg','Three times daily','10 days','Take on empty stomach.','2025-03-31 08:49:06'),(44,49,23,'Famotidine','10mg','Three times daily','14 days','Take with food.','2025-03-31 08:49:06'),(45,49,23,'Pantoprazole','5mg','Once daily','30 days','Take as directed.','2025-03-31 08:49:06'),(46,50,7,'Amoxicillin','250mg','Every 8 hours','14 days','Take as directed.','2025-03-04 11:34:06'),(47,50,7,'Pantoprazole','10mg','Every 8 hours','60 days','Take on empty stomach.','2025-03-04 11:34:06'),(48,50,7,'Clarithromycin','20mg','Every 8 hours','7 days','Take with food.','2025-03-04 11:34:06'),(49,51,7,'Cholecalciferol','50mg','Once daily','7 days','Take with water.','2025-08-05 15:04:06'),(50,51,7,'Ergocalciferol','20mg','Every 8 hours','10 days','Take with food.','2025-08-05 15:04:06'),(51,53,39,'Valacyclovir','250mg','At bedtime','7 days','Take as directed.','2025-08-27 14:19:06'),(52,53,39,'Famciclovir','20mg','As needed','30 days','Take on empty stomach.','2025-08-27 14:19:06'),(53,53,39,'Gabapentin','5mg','Once daily','14 days','Take on empty stomach.','2025-08-27 14:19:06'),(54,54,17,'Prednisone','500mg','At bedtime','90 days','Take with water.','2025-09-11 08:49:06'),(55,55,45,'Escitalopram','10mg','Once daily','30 days','Take as directed.','2025-04-17 16:49:06'),(56,55,45,'Hydroxyzine','20mg','Once daily','14 days','Take with food.','2025-04-17 16:49:06'),(57,55,45,'Buspirone','200mg','Once daily','14 days','Take as directed.','2025-04-17 16:49:06'),(58,56,39,'Omeprazole','5mg','Twice daily','10 days','Take with water.','2025-07-30 12:19:06'),(59,58,37,'Meloxicam','10mg','Three times daily','30 days','Take as directed.','2025-11-01 15:04:06'),(62,60,33,'Vardenafil','250mg','Every 8 hours','14 days','Take on empty stomach.','2024-12-30 11:04:06'),(63,61,8,'Erythromycin ophthalmic ointment','10mg','Once daily','90 days','Take with water.','2025-12-01 10:04:06'),(64,61,8,'Ketotifen eye drops','500mg','Every 8 hours','60 days','Take on empty stomach.','2025-12-01 10:04:06'),(65,62,32,'Cephalexin','200mg','As needed','90 days','Take as directed.','2025-07-03 15:19:06'),(66,62,32,'Trimethoprim-sulfamethoxazole','25mg','Every 8 hours','14 days','Take with food.','2025-07-03 15:19:06'),(67,62,32,'Clindamycin','200mg','At bedtime','7 days','Take on empty stomach.','2025-07-03 15:19:06'),(68,64,47,'Liraglutide','20mg','Twice daily','10 days','Take on empty stomach.','2025-11-05 14:49:06'),(69,67,9,'Phentermine','200mg','Once daily','90 days','Take as directed.','2025-01-23 14:34:06'),(70,72,28,'Rizatriptan','50mg','Three times daily','90 days','Take with food.','2025-09-18 09:49:06'),(71,74,29,'Liraglutide','500mg','Every 8 hours','60 days','Take with water.','2025-07-08 12:19:06'),(72,76,37,'Ketotifen eye drops','500mg','Every 8 hours','7 days','Take as directed.','2025-04-28 11:04:06'),(73,76,37,'Erythromycin ophthalmic ointment','20mg','Twice daily','60 days','Take with food.','2025-04-28 11:04:06'),(74,79,17,'Clarithromycin','10mg','Three times daily','60 days','Take with water.','2025-05-25 09:19:06'),(75,80,30,'Naproxen','250mg','As needed','60 days','Take as directed.','2025-10-25 12:34:06'),(76,80,30,'Aspirin','5mg','Twice daily','14 days','Take as directed.','2025-10-25 12:34:06'),(78,84,24,'Levothyroxine','50mg','Three times daily','7 days','Take with water.','2025-10-29 12:34:06'),(79,84,24,'Armour Thyroid','50mg','Three times daily','14 days','Take as directed.','2025-10-29 12:34:06'),(80,84,24,'Liothyronine','10mg','Twice daily','10 days','Take with water.','2025-10-29 12:34:06'),(84,88,31,'Levothyroxine','500mg','Every 8 hours','10 days','Take with food.','2025-01-27 14:49:06'),(85,88,31,'Armour Thyroid','20mg','Twice daily','10 days','Take with food.','2025-01-27 14:49:06'),(86,88,31,'Liothyronine','25mg','Once daily','30 days','Take with food.','2025-01-27 14:49:06'),(87,89,28,'Triamcinolone cream','100mg','Every 8 hours','60 days','Take as directed.','2025-07-18 08:34:06'),(88,89,28,'Tacrolimus ointment','10mg','At bedtime','7 days','Take on empty stomach.','2025-07-18 08:34:06'),(89,90,30,'Ketotifen eye drops','250mg','Twice daily','30 days','Take with water.','2025-11-27 08:49:06'),(90,90,30,'Artificial tears','100mg','Twice daily','14 days','Take with food.','2025-11-27 08:49:06'),(91,91,28,'Acetaminophen','5mg','Twice daily','60 days','Take on empty stomach.','2025-02-19 14:34:06'),(92,91,28,'Aspirin','25mg','At bedtime','10 days','Take on empty stomach.','2025-02-19 14:34:06'),(95,94,36,'Valacyclovir','50mg','At bedtime','90 days','Take with water.','2025-09-14 08:04:06'),(96,94,36,'Acyclovir','200mg','Every 8 hours','14 days','Take as directed.','2025-09-14 08:04:06'),(97,94,36,'Gabapentin','50mg','Twice daily','30 days','Take with water.','2025-09-14 08:04:06'),(98,96,30,'Azithromycin','10mg','Once daily','60 days','Take with water.','2025-05-18 16:34:06'),(99,96,30,'Prednisone','500mg','At bedtime','60 days','Take with water.','2025-05-18 16:34:06'),(100,96,30,'Albuterol','50mg','At bedtime','7 days','Take as directed.','2025-05-18 16:34:06'),(101,97,39,'Apixaban','50mg','At bedtime','14 days','Take with water.','2025-08-22 09:04:06'),(102,98,39,'Losartan','20mg','As needed','10 days','Take with food.','2025-03-21 10:04:06'),(103,98,39,'Amlodipine','200mg','At bedtime','14 days','Take on empty stomach.','2025-03-21 10:04:06'),(104,100,5,'Cholecalciferol','50mg','Every 8 hours','30 days','Take as directed.','2025-06-28 14:04:06'),(105,100,5,'Ergocalciferol','5mg','As needed','90 days','Take on empty stomach.','2025-06-28 14:04:06'),(106,100,5,'Calcium with vitamin D','100mg','At bedtime','90 days','Take on empty stomach.','2025-06-28 14:04:06'),(110,102,50,'Montelukast','100mg','At bedtime','7 days','Take on empty stomach.','2025-10-29 09:49:06'),(111,102,50,'Loratadine','100mg','Twice daily','90 days','Take with water.','2025-10-29 09:49:06'),(112,102,50,'Fexofenadine','200mg','Three times daily','14 days','Take with water.','2025-10-29 09:49:06'),(113,103,30,'Semaglutide','250mg','Once daily','90 days','Take with food.','2025-09-18 17:04:06'),(114,103,30,'Liraglutide','250mg','Twice daily','60 days','Take with food.','2025-09-18 17:04:06'),(115,103,30,'Phentermine','200mg','As needed','14 days','Take as directed.','2025-09-18 17:04:06'),(116,104,38,'Loratadine','20mg','Twice daily','14 days','Take as directed.','2025-05-10 15:19:06'),(117,105,29,'Sulfasalazine','20mg','Once daily','30 days','Take with water.','2025-08-03 15:49:06'),(118,105,29,'Prednisone','20mg','Three times daily','90 days','Take with food.','2025-08-03 15:49:06'),(119,105,29,'Adalimumab','5mg','Every 8 hours','14 days','Take on empty stomach.','2025-08-03 15:49:06'),(120,108,7,'Propylthiouracil','250mg','Once daily','10 days','Take as directed.','2025-11-04 16:49:06'),(124,111,50,'Azithromycin','25mg','Twice daily','90 days','Take with water.','2025-02-19 09:49:06'),(125,112,29,'Pantoprazole','200mg','As needed','60 days','Take with water.','2025-07-20 10:49:06'),(126,112,29,'Omeprazole','20mg','Once daily','7 days','Take with water.','2025-07-20 10:49:06'),(127,116,2,'Bupropion','200mg','At bedtime','10 days','Take with water.','2025-06-12 11:19:06'),(128,116,2,'Fluoxetine','250mg','Three times daily','10 days','Take on empty stomach.','2025-06-12 11:19:06'),(129,117,31,'Hydrocortisone cream','25mg','At bedtime','10 days','Take on empty stomach.','2024-12-05 08:34:06'),(130,117,31,'Triamcinolone cream','5mg','As needed','60 days','Take on empty stomach.','2024-12-05 08:34:06'),(131,118,4,'Apixaban','5mg','Every 8 hours','90 days','Take with water.','2025-10-17 14:34:06'),(132,120,34,'Amoxicillin-clavulanate','5mg','At bedtime','7 days','Take with food.','2025-08-19 15:34:06'),(133,120,34,'Cephalexin','5mg','At bedtime','7 days','Take as directed.','2025-08-19 15:34:06'),(134,120,34,'Clindamycin','250mg','Every 8 hours','7 days','Take with water.','2025-08-19 15:34:06'),(137,123,33,'Sildenafil','10mg','Three times daily','7 days','Take with food.','2024-12-21 11:04:06'),(138,123,33,'Vardenafil','250mg','Twice daily','60 days','Take on empty stomach.','2024-12-21 11:04:06'),(139,124,22,'Moisturizers','100mg','At bedtime','30 days','Take with water.','2025-06-09 16:04:06'),(140,124,22,'Triamcinolone cream','20mg','Once daily','60 days','Take as directed.','2025-06-09 16:04:06'),(141,125,21,'Linaclotide','100mg','Twice daily','7 days','Take with food.','2025-07-09 10:19:06'),(142,127,9,'Sumatriptan','250mg','Twice daily','7 days','Take with food.','2025-06-08 13:19:06'),(143,127,9,'Amitriptyline','10mg','Three times daily','90 days','Take on empty stomach.','2025-06-08 13:19:06'),(144,127,9,'Topiramate','250mg','Three times daily','14 days','Take as directed.','2025-06-08 13:19:06'),(145,128,34,'Ferrous sulfate','20mg','Once daily','14 days','Take with water.','2025-04-24 10:34:06'),(149,132,32,'Levothyroxine','20mg','Once daily','30 days','Take as directed.','2025-06-09 14:49:06'),(150,132,32,'Liothyronine','250mg','Three times daily','30 days','Take as directed.','2025-06-09 14:49:06'),(151,132,32,'Armour Thyroid','200mg','At bedtime','10 days','Take with food.','2025-06-09 14:49:06'),(152,133,29,'Tamsulosin','20mg','Once daily','30 days','Take as directed.','2025-09-11 16:49:06'),(158,143,2,'Ferrous gluconate','100mg','At bedtime','90 days','Take as directed.','2025-04-05 11:04:06'),(159,143,2,'Vitamin C','20mg','As needed','60 days','Take with food.','2025-04-05 11:04:06'),(160,144,9,'Armour Thyroid','20mg','As needed','30 days','Take as directed.','2025-06-08 08:19:06'),(161,149,46,'Dicyclomine','250mg','Three times daily','10 days','Take with water.','2024-12-11 13:04:06'),(162,150,47,'Phentermine','500mg','At bedtime','30 days','Take as directed.','2025-08-28 17:19:06'),(163,150,47,'Orlistat','25mg','Once daily','30 days','Take as directed.','2025-08-28 17:19:06'),(164,151,10,'Allopurinol','250mg','Three times daily','7 days','Take as directed.','2025-10-12 14:34:06'),(165,151,10,'Colchicine','5mg','Once daily','30 days','Take as directed.','2025-10-12 14:34:06'),(166,151,10,'Indomethacin','5mg','As needed','60 days','Take with food.','2025-10-12 14:34:06'),(167,152,35,'Vardenafil','500mg','As needed','10 days','Take as directed.','2025-11-16 12:19:06'),(168,153,21,'Fexofenadine','25mg','Every 8 hours','14 days','Take as directed.','2025-04-22 11:34:06'),(169,153,21,'Cetirizine','100mg','At bedtime','30 days','Take with food.','2025-04-22 11:34:06'),(170,154,23,'Ibuprofen','5mg','Three times daily','14 days','Take with water.','2025-03-22 11:04:06'),(174,159,19,'Sildenafil','200mg','Twice daily','30 days','Take on empty stomach.','2025-02-09 16:19:06'),(178,163,44,'Linaclotide','20mg','At bedtime','60 days','Take on empty stomach.','2025-10-26 12:04:06'),(179,163,44,'Amitriptyline','20mg','Once daily','30 days','Take with water.','2025-10-26 12:04:06'),(180,163,44,'Loperamide','500mg','Every 8 hours','30 days','Take on empty stomach.','2025-10-26 12:04:06'),(181,164,49,'Allopurinol','50mg','Every 8 hours','10 days','Take on empty stomach.','2025-11-16 16:34:06'),(182,164,49,'Prednisone','200mg','As needed','90 days','Take with water.','2025-11-16 16:34:06'),(183,165,11,'Silodosin','500mg','At bedtime','10 days','Take on empty stomach.','2025-11-16 11:19:06'),(184,165,11,'Dutasteride','25mg','As needed','90 days','Take with water.','2025-11-16 11:19:06'),(185,165,11,'Alfuzosin','100mg','At bedtime','10 days','Take on empty stomach.','2025-11-16 11:19:06'),(186,166,36,'Amitriptyline','10mg','Three times daily','60 days','Take as directed.','2025-06-23 11:34:06'),(187,166,36,'Loperamide','200mg','At bedtime','90 days','Take with water.','2025-06-23 11:34:06'),(188,166,36,'Linaclotide','200mg','Once daily','60 days','Take with food.','2025-06-23 11:34:06'),(189,167,31,'Amoxicillin','20mg','Once daily','90 days','Take with food.','2025-02-10 14:04:06'),(190,169,35,'Cyclobenzaprine','20mg','Three times daily','90 days','Take with water.','2025-05-29 10:04:06'),(191,170,29,'Sertraline','50mg','Twice daily','60 days','Take with food.','2024-12-25 14:19:06'),(192,173,23,'Alfuzosin','500mg','Twice daily','90 days','Take as directed.','2025-07-04 13:49:06'),(193,173,23,'Tamsulosin','25mg','As needed','90 days','Take with water.','2025-07-04 13:49:06'),(194,174,30,'Estradiol','200mg','At bedtime','14 days','Take with food.','2025-07-04 15:49:06'),(195,174,30,'Gabapentin','5mg','At bedtime','14 days','Take on empty stomach.','2025-07-04 15:49:06'),(196,174,30,'Conjugated estrogens','250mg','Twice daily','90 days','Take with water.','2025-07-04 15:49:06'),(197,175,4,'Propylthiouracil','50mg','Every 8 hours','10 days','Take with food.','2025-10-07 07:34:06'),(198,175,4,'Propranolol','20mg','Twice daily','90 days','Take with food.','2025-10-07 07:34:06'),(199,175,4,'Methimazole','200mg','Once daily','30 days','Take with water.','2025-10-07 07:34:06'),(203,178,14,'Fosfomycin','10mg','At bedtime','14 days','Take on empty stomach.','2025-09-17 10:49:06'),(204,178,14,'Ciprofloxacin','20mg','As needed','7 days','Take on empty stomach.','2025-09-17 10:49:06'),(205,179,25,'Amitriptyline','10mg','Three times daily','10 days','Take on empty stomach.','2025-11-03 13:04:06'),(206,179,25,'Propranolol','100mg','Three times daily','14 days','Take with water.','2025-11-03 13:04:06'),(207,180,12,'Venlafaxine','500mg','Every 8 hours','60 days','Take with food.','2025-01-10 07:34:06'),(208,184,18,'Melatonin','250mg','Twice daily','90 days','Take on empty stomach.','2025-06-28 14:49:06'),(209,186,15,'Calcium with vitamin D','100mg','Every 8 hours','7 days','Take as directed.','2024-12-26 09:04:06'),(210,187,5,'Azithromycin','5mg','As needed','14 days','Take as directed.','2025-09-19 14:04:06'),(211,187,5,'Albuterol','250mg','Once daily','14 days','Take on empty stomach.','2025-09-19 14:04:06'),(212,189,29,'Meloxicam','10mg','Twice daily','60 days','Take with food.','2025-06-13 13:49:06'),(213,189,29,'Ibuprofen','10mg','Twice daily','90 days','Take on empty stomach.','2025-06-13 13:49:06'),(214,190,46,'Atenolol','500mg','At bedtime','90 days','Take as directed.','2025-01-26 08:34:06'),(215,190,46,'Methimazole','10mg','At bedtime','90 days','Take on empty stomach.','2025-01-26 08:34:06'),(216,190,46,'Propranolol','5mg','Every 8 hours','90 days','Take with water.','2025-01-26 08:34:06'),(217,191,7,'Zolpidem','10mg','Once daily','10 days','Take with water.','2025-01-19 17:04:06'),(218,193,5,'Lisinopril','200mg','Every 8 hours','30 days','Take as directed.','2025-05-05 14:34:06'),(219,193,5,'Carvedilol','200mg','Three times daily','7 days','Take as directed.','2025-05-05 14:34:06'),(220,193,5,'Spironolactone','10mg','As needed','7 days','Take with food.','2025-05-05 14:34:06'),(221,194,26,'Lidocaine patch','10mg','Three times daily','60 days','Take with food.','2025-05-20 15:04:06'),(222,194,26,'Valacyclovir','50mg','At bedtime','14 days','Take with food.','2025-05-20 15:04:06'),(223,194,26,'Famciclovir','50mg','Every 8 hours','30 days','Take as directed.','2025-05-20 15:04:06'),(224,195,26,'Omeprazole','500mg','Twice daily','10 days','Take as directed.','2025-10-23 14:49:06'),(225,195,26,'Amoxicillin','500mg','Three times daily','90 days','Take on empty stomach.','2025-10-23 14:49:06'),(226,195,26,'Clarithromycin','50mg','At bedtime','90 days','Take with water.','2025-10-23 14:49:06'),(227,197,45,'Warfarin','500mg','Twice daily','7 days','Take with food.','2025-02-12 11:49:06'),(228,198,35,'Warfarin','200mg','As needed','60 days','Take with food.','2025-06-05 15:34:06'),(229,199,7,'Ibuprofen','25mg','Every 8 hours','90 days','Take on empty stomach.','2025-08-21 15:49:06'),(230,199,7,'Pseudoephedrine','20mg','Twice daily','10 days','Take with water.','2025-08-21 15:49:06');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure_record`
--

DROP TABLE IF EXISTS `procedure_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedure_record` (
  `procedure_id` int NOT NULL AUTO_INCREMENT,
  `procedure_name` varchar(100) NOT NULL,
  `procedure_type` varchar(50) DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `outcome` varchar(50) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`procedure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure_record`
--

LOCK TABLES `procedure_record` WRITE;
/*!40000 ALTER TABLE `procedure_record` DISABLE KEYS */;
INSERT INTO `procedure_record` VALUES (1,'Mark borders','Diagnostic',59,'requires follow-up','Procedure completed. Normal findings.'),(2,'Lipid panel','Diagnostic',21,'completed','Procedure completed. Patient tolerated well.'),(3,'Pulse oximetry','Therapeutic',11,'abnormal','Procedure completed. No complications.'),(4,'Chest X-ray','Therapeutic',25,'pending review','Procedure completed. Normal findings.'),(5,'CBC','Preventive',56,'abnormal','Procedure completed. Normal findings.'),(6,'Stool guaiac test','Therapeutic',5,'abnormal','Procedure completed. Patient tolerated well.'),(7,'Upper endoscopy','Therapeutic',50,'pending review','Procedure completed. Results pending.'),(8,'Basic metabolic panel','Monitoring',27,'abnormal','Procedure completed. Normal findings.'),(9,'Pulse oximetry','Diagnostic',16,'requires follow-up','Procedure completed. No complications.'),(10,'CBC','Preventive',59,'normal','Procedure completed. Patient tolerated well.'),(11,'FSH level','Diagnostic',57,'requires follow-up','Procedure completed. Normal findings.'),(12,'Thyroid function tests','Therapeutic',7,'requires follow-up','Procedure completed. Results pending.'),(13,'Lipid panel','Monitoring',46,'normal','Procedure completed. Results pending.'),(14,'Range of motion assessment','Diagnostic',30,'abnormal','Procedure completed. No complications.'),(15,'X-ray of affected joint','Therapeutic',59,'requires follow-up','Procedure completed. Patient tolerated well.'),(16,'Joint examination','Therapeutic',33,'normal','Procedure completed. Patient tolerated well.'),(17,'IgE levels','Preventive',7,'normal','Procedure completed. Normal findings.'),(18,'Allergy skin testing','Therapeutic',9,'abnormal','Procedure completed. Results pending.'),(19,'Nasal examination','Therapeutic',7,'normal','Procedure completed. Results pending.'),(20,'Echocardiogram','Preventive',11,'requires follow-up','Procedure completed. Results pending.'),(21,'Basic metabolic panel','Preventive',42,'requires follow-up','Procedure completed. Patient tolerated well.'),(22,'PCR testing','Diagnostic',38,'abnormal','Procedure completed. Normal findings.'),(23,'Tzanck smear','Therapeutic',38,'pending review','Procedure completed. Results pending.'),(24,'Sleep study referral','Therapeutic',33,'normal','Procedure completed. Patient tolerated well.'),(25,'Sleep history assessment','Diagnostic',37,'abnormal','Procedure completed. Patient tolerated well.'),(26,'Bone density scan','Diagnostic',47,'normal','Procedure completed. Normal findings.'),(27,'Comprehensive metabolic panel','Therapeutic',46,'pending review','Procedure completed. No complications.'),(28,'HbA1c test','Therapeutic',7,'normal','Procedure completed. Patient tolerated well.'),(29,'TSH','Therapeutic',21,'normal','Procedure completed. Normal findings.'),(30,'Free T4','Diagnostic',51,'abnormal','Procedure completed. No complications.'),(31,'Thyroid uptake scan','Therapeutic',33,'requires follow-up','Procedure completed. Normal findings.'),(32,'Skin biopsy','Therapeutic',44,'requires follow-up','Procedure completed. Results pending.'),(33,'Skin examination','Therapeutic',51,'abnormal','Procedure completed. Normal findings.'),(34,'Skin examination','Monitoring',29,'normal','Procedure completed. No complications.'),(35,'Skin biopsy','Diagnostic',16,'pending review','Procedure completed. No complications.'),(36,'Allergy testing','Diagnostic',10,'pending review','Procedure completed. Patient tolerated well.'),(37,'Skin examination','Diagnostic',54,'pending review','Procedure completed. Normal findings.'),(38,'H. pylori testing','Therapeutic',56,'pending review','Procedure completed. Normal findings.'),(39,'Upper endoscopy','Preventive',35,'normal','Procedure completed. No complications.'),(40,'H. pylori testing','Preventive',43,'requires follow-up','Procedure completed. Normal findings.'),(41,'Stool guaiac test','Preventive',17,'completed','Procedure completed. No complications.'),(42,'Vitamin D level','Monitoring',46,'normal','Procedure completed. Results pending.'),(43,'Viral culture','Monitoring',46,'requires follow-up','Procedure completed. Results pending.'),(44,'ABG','Preventive',48,'pending review','Procedure completed. Patient tolerated well.'),(45,'Pulse oximetry','Monitoring',40,'requires follow-up','Procedure completed. Normal findings.'),(46,'CT chest','Therapeutic',28,'requires follow-up','Procedure completed. Normal findings.'),(47,'Thyroid function tests','Monitoring',52,'normal','Procedure completed. No complications.'),(48,'Mental status examination','Therapeutic',33,'normal','Procedure completed. No complications.'),(49,'CBC','Diagnostic',15,'pending review','Procedure completed. No complications.'),(50,'Stool guaiac test','Diagnostic',57,'normal','Procedure completed. Normal findings.'),(51,'Pulse oximetry','Therapeutic',28,'completed','Procedure completed. No complications.'),(52,'Mark borders','Diagnostic',54,'normal','Procedure completed. Normal findings.'),(53,'Blood cultures','Monitoring',5,'normal','Procedure completed. Results pending.'),(54,'Wound culture','Therapeutic',7,'requires follow-up','Procedure completed. Patient tolerated well.'),(55,'BMI calculation','Diagnostic',15,'completed','Procedure completed. Results pending.'),(56,'HbA1c','Monitoring',27,'pending review','Procedure completed. Normal findings.'),(57,'Lipid panel','Therapeutic',38,'completed','Procedure completed. No complications.'),(58,'MRI brain','Therapeutic',43,'normal','Procedure completed. Normal findings.'),(59,'CT head','Monitoring',41,'completed','Procedure completed. Results pending.'),(60,'Headache diary review','Therapeutic',31,'requires follow-up','Procedure completed. No complications.'),(61,'HbA1c','Preventive',39,'requires follow-up','Procedure completed. Results pending.'),(62,'Sleep study','Monitoring',29,'requires follow-up','Procedure completed. Normal findings.'),(63,'BMI calculation','Therapeutic',53,'abnormal','Procedure completed. Normal findings.'),(64,'Eye examination','Preventive',9,'pending review','Procedure completed. Patient tolerated well.'),(65,'Conjunctival culture','Therapeutic',56,'abnormal','Procedure completed. Normal findings.'),(66,'Slit lamp examination','Preventive',38,'requires follow-up','Procedure completed. No complications.'),(67,'Physical examination','Preventive',9,'requires follow-up','Procedure completed. Patient tolerated well.'),(68,'Neurological examination','Monitoring',25,'abnormal','Procedure completed. Patient tolerated well.'),(69,'Free T4','Therapeutic',52,'normal','Procedure completed. Results pending.'),(70,'Lipid panel','Therapeutic',19,'normal','Procedure completed. Patient tolerated well.'),(71,'TSH','Preventive',14,'completed','Procedure completed. No complications.'),(72,'Lipid panel','Diagnostic',59,'pending review','Procedure completed. Results pending.'),(73,'Thyroid antibodies','Preventive',36,'requires follow-up','Procedure completed. Results pending.'),(74,'TSH','Monitoring',16,'requires follow-up','Procedure completed. Results pending.'),(75,'Skin examination','Monitoring',39,'completed','Procedure completed. Results pending.'),(76,'Skin biopsy','Monitoring',60,'normal','Procedure completed. Normal findings.'),(77,'Allergy testing','Diagnostic',49,'requires follow-up','Procedure completed. Normal findings.'),(78,'Eye examination','Therapeutic',29,'requires follow-up','Procedure completed. No complications.'),(79,'Neurological examination','Therapeutic',22,'pending review','Procedure completed. Results pending.'),(80,'Physical examination','Preventive',16,'pending review','Procedure completed. Normal findings.'),(81,'Stress assessment','Therapeutic',31,'abnormal','Procedure completed. Results pending.'),(82,'Viral culture','Therapeutic',57,'completed','Procedure completed. Results pending.'),(83,'Echocardiogram','Therapeutic',35,'completed','Procedure completed. Patient tolerated well.'),(84,'CHA2DS2-VASc scoring','Monitoring',36,'normal','Procedure completed. Results pending.'),(85,'Vitamin D level','Therapeutic',8,'normal','Procedure completed. Results pending.'),(86,'Calcium level','Monitoring',58,'completed','Procedure completed. Normal findings.'),(87,'Bone density scan','Preventive',21,'abnormal','Procedure completed. Results pending.'),(88,'HbA1c','Monitoring',12,'abnormal','Procedure completed. Patient tolerated well.'),(89,'BMI calculation','Therapeutic',54,'abnormal','Procedure completed. Results pending.'),(90,'Nasal examination','Monitoring',44,'abnormal','Procedure completed. Normal findings.'),(91,'IgE levels','Therapeutic',60,'normal','Procedure completed. Results pending.'),(92,'Allergy skin testing','Monitoring',45,'requires follow-up','Procedure completed. Normal findings.'),(93,'Nasal examination','Therapeutic',25,'abnormal','Procedure completed. Results pending.'),(94,'Free T3','Preventive',52,'requires follow-up','Procedure completed. Normal findings.'),(95,'Thyroid antibodies','Monitoring',15,'normal','Procedure completed. No complications.'),(96,'Free T3','Diagnostic',18,'normal','Procedure completed. Normal findings.'),(97,'Pulse oximetry','Diagnostic',6,'pending review','Procedure completed. No complications.'),(98,'H. pylori testing','Preventive',19,'normal','Procedure completed. Results pending.'),(99,'Upper endoscopy','Monitoring',45,'normal','Procedure completed. Patient tolerated well.'),(100,'Stool guaiac test','Therapeutic',6,'completed','Procedure completed. Results pending.'),(101,'Patch testing','Monitoring',13,'requires follow-up','Procedure completed. Patient tolerated well.'),(102,'Skin biopsy','Monitoring',45,'requires follow-up','Procedure completed. Normal findings.'),(103,'Thyroid function tests','Monitoring',39,'normal','Procedure completed. No complications.'),(104,'Holter monitor','Monitoring',24,'abnormal','Procedure completed. Normal findings.'),(105,'CHA2DS2-VASc scoring','Preventive',14,'abnormal','Procedure completed. No complications.'),(106,'Blood cultures','Preventive',35,'requires follow-up','Procedure completed. No complications.'),(107,'Liver function tests','Diagnostic',54,'pending review','Procedure completed. Results pending.'),(108,'HbA1c','Therapeutic',55,'completed','Procedure completed. Results pending.'),(109,'HbA1c','Therapeutic',50,'pending review','Procedure completed. Normal findings.'),(110,'Cardiovascular assessment','Therapeutic',21,'completed','Procedure completed. Normal findings.'),(111,'Physical examination','Therapeutic',38,'requires follow-up','Procedure completed. Results pending.'),(112,'Skin biopsy','Therapeutic',59,'completed','Procedure completed. Patient tolerated well.'),(113,'Allergy testing','Therapeutic',23,'completed','Procedure completed. Normal findings.'),(114,'Skin examination','Monitoring',22,'requires follow-up','Procedure completed. Normal findings.'),(115,'CBC','Diagnostic',39,'completed','Procedure completed. Patient tolerated well.'),(116,'Reticulocyte count','Diagnostic',19,'completed','Procedure completed. Patient tolerated well.'),(117,'Mental status examination','Monitoring',24,'pending review','Procedure completed. Results pending.'),(118,'Thyroid antibodies','Diagnostic',58,'normal','Procedure completed. No complications.'),(119,'Digital rectal exam','Therapeutic',17,'abnormal','Procedure completed. Normal findings.'),(120,'Post-void residual','Diagnostic',12,'normal','Procedure completed. Normal findings.'),(121,'Lung auscultation','Diagnostic',38,'normal','Procedure completed. Normal findings.'),(122,'Vital signs','Monitoring',48,'abnormal','Procedure completed. Results pending.'),(123,'Chest X-ray','Therapeutic',45,'completed','Procedure completed. No complications.'),(124,'Ferritin','Diagnostic',60,'normal','Procedure completed. No complications.'),(125,'Iron studies','Therapeutic',45,'pending review','Procedure completed. Results pending.'),(126,'Reticulocyte count','Diagnostic',15,'abnormal','Procedure completed. No complications.'),(127,'TSH','Diagnostic',42,'pending review','Procedure completed. Patient tolerated well.'),(128,'CBC','Therapeutic',36,'completed','Procedure completed. Results pending.'),(129,'Lipid panel','Therapeutic',49,'requires follow-up','Procedure completed. No complications.'),(130,'Nasal examination','Preventive',56,'pending review','Procedure completed. Patient tolerated well.'),(131,'Neurological examination','Preventive',7,'pending review','Procedure completed. Normal findings.'),(132,'Physical examination','Preventive',39,'pending review','Procedure completed. Patient tolerated well.'),(133,'Pulse oximetry','Monitoring',22,'requires follow-up','Procedure completed. Patient tolerated well.'),(134,'CT chest','Diagnostic',38,'normal','Procedure completed. Normal findings.'),(135,'ABG','Preventive',57,'abnormal','Procedure completed. Results pending.'),(136,'Cardiovascular assessment','Therapeutic',6,'requires follow-up','Procedure completed. Results pending.'),(137,'HbA1c','Therapeutic',25,'completed','Procedure completed. Normal findings.'),(138,'Lipid panel','Therapeutic',38,'pending review','Procedure completed. Patient tolerated well.'),(139,'Thyroid antibodies','Diagnostic',11,'requires follow-up','Procedure completed. No complications.'),(140,'Free T3','Diagnostic',58,'normal','Procedure completed. Patient tolerated well.'),(141,'Uric acid level','Diagnostic',41,'pending review','Procedure completed. Normal findings.'),(142,'Joint aspiration','Preventive',8,'abnormal','Procedure completed. Patient tolerated well.'),(143,'Digital rectal exam','Therapeutic',46,'pending review','Procedure completed. No complications.'),(144,'Colonoscopy','Monitoring',57,'abnormal','Procedure completed. No complications.'),(145,'Thyroid function tests','Preventive',38,'completed','Procedure completed. No complications.'),(146,'Stool studies','Preventive',9,'normal','Procedure completed. No complications.'),(147,'Stool guaiac test','Therapeutic',17,'requires follow-up','Procedure completed. Patient tolerated well.'),(148,'Neurological assessment','Diagnostic',54,'requires follow-up','Procedure completed. Results pending.'),(149,'CBC','Therapeutic',40,'pending review','Procedure completed. Results pending.'),(150,'PHQ-9 screening','Therapeutic',39,'requires follow-up','Procedure completed. Normal findings.'),(151,'Thyroid function tests','Preventive',25,'requires follow-up','Procedure completed. Results pending.'),(152,'Lipid panel','Therapeutic',41,'requires follow-up','Procedure completed. Patient tolerated well.'),(153,'Bone density scan','Monitoring',54,'requires follow-up','Procedure completed. Results pending.'),(154,'Thyroid function tests','Preventive',33,'pending review','Procedure completed. Normal findings.'),(155,'Free T3','Diagnostic',38,'normal','Procedure completed. Results pending.'),(156,'Urine culture','Preventive',6,'abnormal','Procedure completed. Patient tolerated well.'),(157,'CBC','Therapeutic',21,'abnormal','Procedure completed. Patient tolerated well.'),(158,'Urinalysis','Therapeutic',21,'abnormal','Procedure completed. No complications.'),(159,'CT head','Preventive',55,'pending review','Procedure completed. Patient tolerated well.'),(160,'MRI brain','Monitoring',57,'requires follow-up','Procedure completed. No complications.'),(161,'Neurological examination','Preventive',7,'requires follow-up','Procedure completed. Normal findings.'),(162,'Thyroid function tests','Preventive',57,'pending review','Procedure completed. Normal findings.'),(163,'Vitamin D level','Monitoring',8,'abnormal','Procedure completed. No complications.'),(164,'Chest X-ray','Therapeutic',14,'completed','Procedure completed. Normal findings.'),(165,'Pulse oximetry','Monitoring',53,'requires follow-up','Procedure completed. No complications.'),(166,'ABG','Therapeutic',32,'abnormal','Procedure completed. Normal findings.'),(167,'Physical examination','Diagnostic',40,'pending review','Procedure completed. Results pending.'),(168,'Lumbar X-ray','Diagnostic',30,'requires follow-up','Procedure completed. Normal findings.'),(169,'Sleep diary review','Therapeutic',36,'pending review','Procedure completed. Patient tolerated well.'),(170,'Basic metabolic panel','Diagnostic',22,'pending review','Procedure completed. Results pending.'),(171,'BNP','Diagnostic',12,'pending review','Procedure completed. Normal findings.'),(172,'Echocardiogram','Preventive',27,'normal','Procedure completed. Results pending.'),(173,'Physical examination','Preventive',44,'pending review','Procedure completed. Patient tolerated well.'),(174,'Viral culture','Monitoring',7,'normal','Procedure completed. Patient tolerated well.'),(175,'Tzanck smear','Preventive',14,'completed','Procedure completed. No complications.'),(176,'Echocardiogram','Preventive',49,'completed','Procedure completed. Results pending.'),(177,'Holter monitor','Monitoring',35,'completed','Procedure completed. Results pending.'),(178,'ECG','Therapeutic',52,'requires follow-up','Procedure completed. Patient tolerated well.'),(179,'Holter monitor','Therapeutic',49,'completed','Procedure completed. Normal findings.'),(180,'Thyroid function tests','Diagnostic',21,'normal','Procedure completed. No complications.'),(181,'CBC','Preventive',17,'requires follow-up','Procedure completed. Results pending.'),(182,'Throat examination','Preventive',47,'abnormal','Procedure completed. No complications.'),(183,'Lung auscultation','Diagnostic',23,'pending review','Procedure completed. Patient tolerated well.'),(184,'Vital signs','Monitoring',37,'completed','Procedure completed. Results pending.');
/*!40000 ALTER TABLE `procedure_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_procedure_before_insert` BEFORE INSERT ON `procedure_record` FOR EACH ROW BEGIN
    IF NEW.duration_minutes IS NOT NULL AND NEW.duration_minutes < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Procedure duration cannot be negative';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_procedure_before_update` BEFORE UPDATE ON `procedure_record` FOR EACH ROW BEGIN
    IF NEW.duration_minutes IS NOT NULL AND NEW.duration_minutes < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Procedure duration cannot be negative';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'medportal'
--

--
-- Dumping routines for database 'medportal'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_patient_age` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_patient_age`(in_patient_id INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE age INT;
    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) INTO age
    FROM patient
    WHERE patient_id = in_patient_id;
    RETURN age;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_patient_appointment_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_patient_appointment_count`(in_patient_id INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM appointment
    WHERE patient_id = in_patient_id;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_appointment`(
    IN in_patient_id INT,
    IN in_doctor_id INT,
    IN in_appointment_date DATETIME,
    IN in_status VARCHAR(20),
    IN in_reason_for_visit VARCHAR(255),
    IN in_clinical_notes TEXT
)
BEGIN
    INSERT INTO appointment (patient_id, doctor_id, appointment_date, status, reason_for_visit, clinical_notes)
    VALUES (in_patient_id, in_doctor_id, in_appointment_date, in_status, in_reason_for_visit, in_clinical_notes);
    SELECT LAST_INSERT_ID() AS appointment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_doctor`(
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_specialization VARCHAR(100),
    IN in_license_number VARCHAR(20),
    IN in_phone VARCHAR(20),
    IN in_email VARCHAR(100)
)
BEGIN
    INSERT INTO doctor (first_name, last_name, specialization, license_number, phone, email)
    VALUES (in_first_name, in_last_name, in_specialization, in_license_number, in_phone, in_email);
    SELECT LAST_INSERT_ID() AS doctor_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_medical_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_medical_record`(
    IN in_appointment_id INT,
    IN in_visit_date DATETIME,
    IN in_chief_complaint VARCHAR(255),
    IN in_diagnosis VARCHAR(255),
    IN in_treatment_plan TEXT,
    IN in_follow_up_required BOOLEAN,
    IN in_follow_up_date DATE
)
BEGIN
    INSERT INTO medical_record (appointment_id, visit_date, chief_complaint, diagnosis, treatment_plan, follow_up_required, follow_up_date)
    VALUES (in_appointment_id, in_visit_date, in_chief_complaint, in_diagnosis, in_treatment_plan, in_follow_up_required, in_follow_up_date);
    SELECT LAST_INSERT_ID() AS record_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_patient`(
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_date_of_birth DATE,
    IN in_gender VARCHAR(10),
    IN in_blood_type VARCHAR(5),
    IN in_phone VARCHAR(20),
    IN in_email VARCHAR(100),
    IN in_address VARCHAR(255),
    IN in_emergency_contact_name VARCHAR(100),
    IN in_emergency_contact_phone VARCHAR(20)
)
BEGIN
    INSERT INTO patient (first_name, last_name, date_of_birth, gender, blood_type, phone, email, address, emergency_contact_name, emergency_contact_phone)
    VALUES (in_first_name, in_last_name, in_date_of_birth, in_gender, in_blood_type, in_phone, in_email, in_address, in_emergency_contact_name, in_emergency_contact_phone);
    SELECT LAST_INSERT_ID() AS patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_prescription`(
    IN in_appointment_id INT,
    IN in_patient_id INT,
    IN in_medication_name VARCHAR(100),
    IN in_dosage VARCHAR(50),
    IN in_frequency VARCHAR(50),
    IN in_duration VARCHAR(50),
    IN in_instructions TEXT,
    IN in_prescribed_date DATETIME
)
BEGIN
    INSERT INTO prescription (appointment_id, patient_id, medication_name, dosage, frequency, duration, instructions, prescribed_date)
    VALUES (in_appointment_id, in_patient_id, in_medication_name, in_dosage, in_frequency, in_duration, in_instructions, in_prescribed_date);
    SELECT LAST_INSERT_ID() AS prescription_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_procedure_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_procedure_record`(
    IN in_procedure_name VARCHAR(100),
    IN in_procedure_type VARCHAR(50),
    IN in_duration_minutes INT,
    IN in_outcome VARCHAR(50),
    IN in_notes TEXT
)
BEGIN
    INSERT INTO procedure_record (procedure_name, procedure_type, duration_minutes, outcome, notes)
    VALUES (in_procedure_name, in_procedure_type, in_duration_minutes, in_outcome, in_notes);
    SELECT LAST_INSERT_ID() AS procedure_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_appointment`(IN in_appointment_id INT)
BEGIN
    DELETE FROM appointment WHERE appointment_id = in_appointment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_medical_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_medical_record`(IN in_record_id INT)
BEGIN
    DELETE FROM medical_record WHERE record_id = in_record_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_patient`(IN in_patient_id INT)
BEGIN
    DELETE FROM patient WHERE patient_id = in_patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_prescription`(IN in_prescription_id INT)
BEGIN
    DELETE FROM prescription WHERE prescription_id = in_prescription_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_procedure_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_procedure_record`(IN in_procedure_id INT)
BEGIN
    DELETE FROM procedure_record WHERE procedure_id = in_procedure_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_appointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_appointments`()
BEGIN
    SELECT a.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name,
           d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
    FROM appointment a
    JOIN patient p ON a.patient_id = p.patient_id
    JOIN doctor d ON a.doctor_id = d.doctor_id
    ORDER BY a.appointment_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_doctors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_doctors`()
BEGIN
    SELECT * FROM doctor ORDER BY last_name, first_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_medical_records` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_medical_records`()
BEGIN
    SELECT mr.*, a.appointment_date, a.reason_for_visit,
           p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM medical_record mr
    JOIN appointment a ON mr.appointment_id = a.appointment_id
    JOIN patient p ON a.patient_id = p.patient_id
    ORDER BY mr.visit_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_patients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_patients`()
BEGIN
    SELECT p.*, 
           calculate_patient_age(p.patient_id) AS age,
           get_patient_appointment_count(p.patient_id) AS appointment_count
    FROM patient p 
    ORDER BY patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_prescriptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_prescriptions`()
BEGIN
    SELECT pr.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM prescription pr
    JOIN patient p ON pr.patient_id = p.patient_id
    ORDER BY pr.prescribed_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_procedures` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_procedures`()
BEGIN
    SELECT pr.*, ap.performed_at, a.appointment_id,
           p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM procedure_record pr
    JOIN appointment_procedure ap ON pr.procedure_id = ap.procedure_id
    JOIN appointment a ON ap.appointment_id = a.appointment_id
    JOIN patient p ON a.patient_id = p.patient_id
    ORDER BY ap.performed_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_appointments_by_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_appointments_by_doctor`(IN in_doctor_id INT)
BEGIN
    SELECT a.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name,
           d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
    FROM appointment a
    JOIN patient p ON a.patient_id = p.patient_id
    JOIN doctor d ON a.doctor_id = d.doctor_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY a.appointment_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_appointment_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_appointment_by_id`(IN in_appointment_id INT)
BEGIN
    SELECT a.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name,
           d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
    FROM appointment a
    JOIN patient p ON a.patient_id = p.patient_id
    JOIN doctor d ON a.doctor_id = d.doctor_id
    WHERE a.appointment_id = in_appointment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_doctor_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_doctor_by_id`(IN in_doctor_id INT)
BEGIN
    SELECT * FROM doctor WHERE doctor_id = in_doctor_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_doctor_dashboard_counts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_doctor_dashboard_counts`(IN in_doctor_id INT)
BEGIN
    SELECT 
        (SELECT COUNT(*) FROM appointment WHERE doctor_id = in_doctor_id) AS my_appointments,
        (SELECT COUNT(DISTINCT patient_id) FROM appointment WHERE doctor_id = in_doctor_id) AS my_patients,
        (SELECT COUNT(*) FROM medical_record mr 
         JOIN appointment a ON mr.appointment_id = a.appointment_id 
         WHERE a.doctor_id = in_doctor_id) AS my_records,
        (SELECT COUNT(*) FROM prescription pr 
         JOIN appointment a ON pr.appointment_id = a.appointment_id 
         WHERE a.doctor_id = in_doctor_id) AS my_prescriptions,
        (SELECT COUNT(*) FROM procedure_record pr 
         JOIN appointment_procedure ap ON pr.procedure_id = ap.procedure_id 
         JOIN appointment a ON ap.appointment_id = a.appointment_id 
         WHERE a.doctor_id = in_doctor_id) AS my_procedures,
        (SELECT COUNT(*) FROM patient) AS total_patients,
        (SELECT COUNT(*) FROM appointment) AS total_appointments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_medical_records_by_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_medical_records_by_doctor`(IN in_doctor_id INT)
BEGIN
    SELECT mr.*, a.appointment_date, a.reason_for_visit,
           p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM medical_record mr
    JOIN appointment a ON mr.appointment_id = a.appointment_id
    JOIN patient p ON a.patient_id = p.patient_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY mr.visit_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_medical_record_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_medical_record_by_id`(IN in_record_id INT)
BEGIN
    SELECT * FROM medical_record WHERE record_id = in_record_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patients_by_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patients_by_doctor`(IN in_doctor_id INT)
BEGIN
    SELECT DISTINCT p.*, 
           calculate_patient_age(p.patient_id) AS age,
           get_patient_appointment_count(p.patient_id) AS appointment_count
    FROM patient p
    JOIN appointment a ON p.patient_id = a.patient_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY p.last_name, p.first_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patient_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patient_by_id`(IN in_patient_id INT)
BEGIN
    SELECT * FROM patient WHERE patient_id = in_patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_prescriptions_by_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_prescriptions_by_doctor`(IN in_doctor_id INT)
BEGIN
    SELECT pr.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM prescription pr
    JOIN patient p ON pr.patient_id = p.patient_id
    JOIN appointment a ON pr.appointment_id = a.appointment_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY pr.prescribed_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_prescription_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_prescription_by_id`(IN in_prescription_id INT)
BEGIN
    SELECT * FROM prescription WHERE prescription_id = in_prescription_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_procedures_by_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_procedures_by_doctor`(IN in_doctor_id INT)
BEGIN
    SELECT pr.*, ap.performed_at, a.appointment_id,
           p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM procedure_record pr
    JOIN appointment_procedure ap ON pr.procedure_id = ap.procedure_id
    JOIN appointment a ON ap.appointment_id = a.appointment_id
    JOIN patient p ON a.patient_id = p.patient_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY ap.performed_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_procedure_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_procedure_by_id`(IN in_procedure_id INT)
BEGIN
    SELECT * FROM procedure_record WHERE procedure_id = in_procedure_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `link_procedure_to_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `link_procedure_to_appointment`(
    IN in_appointment_id INT,
    IN in_procedure_id INT,
    IN in_performed_at DATETIME
)
BEGIN
    INSERT INTO appointment_procedure (appointment_id, procedure_id, performed_at)
    VALUES (in_appointment_id, in_procedure_id, in_performed_at);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_appointment`(
    IN in_appointment_id INT,
    IN in_patient_id INT,
    IN in_doctor_id INT,
    IN in_appointment_date DATETIME,
    IN in_status VARCHAR(20),
    IN in_reason_for_visit VARCHAR(255),
    IN in_clinical_notes TEXT
)
BEGIN
    UPDATE appointment
    SET patient_id = in_patient_id,
        doctor_id = in_doctor_id,
        appointment_date = in_appointment_date,
        status = in_status,
        reason_for_visit = in_reason_for_visit,
        clinical_notes = in_clinical_notes
    WHERE appointment_id = in_appointment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_medical_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_medical_record`(
    IN in_record_id INT,
    IN in_visit_date DATETIME,
    IN in_chief_complaint VARCHAR(255),
    IN in_diagnosis VARCHAR(255),
    IN in_treatment_plan TEXT,
    IN in_follow_up_required BOOLEAN,
    IN in_follow_up_date DATE
)
BEGIN
    UPDATE medical_record
    SET visit_date = in_visit_date,
        chief_complaint = in_chief_complaint,
        diagnosis = in_diagnosis,
        treatment_plan = in_treatment_plan,
        follow_up_required = in_follow_up_required,
        follow_up_date = in_follow_up_date
    WHERE record_id = in_record_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_patient`(
    IN in_patient_id INT,
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_date_of_birth DATE,
    IN in_gender VARCHAR(10),
    IN in_blood_type VARCHAR(5),
    IN in_phone VARCHAR(20),
    IN in_email VARCHAR(100),
    IN in_address VARCHAR(255),
    IN in_emergency_contact_name VARCHAR(100),
    IN in_emergency_contact_phone VARCHAR(20)
)
BEGIN
    UPDATE patient
    SET first_name = in_first_name,
        last_name = in_last_name,
        date_of_birth = in_date_of_birth,
        gender = in_gender,
        blood_type = in_blood_type,
        phone = in_phone,
        email = in_email,
        address = in_address,
        emergency_contact_name = in_emergency_contact_name,
        emergency_contact_phone = in_emergency_contact_phone
    WHERE patient_id = in_patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_prescription`(
    IN in_prescription_id INT,
    IN in_medication_name VARCHAR(100),
    IN in_dosage VARCHAR(50),
    IN in_frequency VARCHAR(50),
    IN in_duration VARCHAR(50),
    IN in_instructions TEXT
)
BEGIN
    UPDATE prescription
    SET medication_name = in_medication_name,
        dosage = in_dosage,
        frequency = in_frequency,
        duration = in_duration,
        instructions = in_instructions
    WHERE prescription_id = in_prescription_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_procedure_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_procedure_record`(
    IN in_procedure_id INT,
    IN in_procedure_name VARCHAR(100),
    IN in_procedure_type VARCHAR(50),
    IN in_duration_minutes INT,
    IN in_outcome VARCHAR(50),
    IN in_notes TEXT
)
BEGIN
    UPDATE procedure_record
    SET procedure_name = in_procedure_name,
        procedure_type = in_procedure_type,
        duration_minutes = in_duration_minutes,
        outcome = in_outcome,
        notes = in_notes
    WHERE procedure_id = in_procedure_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-04 23:11:06
