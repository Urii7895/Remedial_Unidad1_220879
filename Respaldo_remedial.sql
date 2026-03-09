CREATE DATABASE  IF NOT EXISTS `Hospital_220879` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Hospital_220879`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital_matricula
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `tbb_domicilios_marco`
--

DROP TABLE IF EXISTS `tbb_domicilios_marco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_domicilios_marco` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('Calle','Numero','Colonia') DEFAULT NULL,
  `valor` varchar(250) DEFAULT NULL,
  `estatus` bit(1) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `domicio_superior_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_domiciliosuperior_idx` (`domicio_superior_id`),
  CONSTRAINT `fk_domiciliosuperior` FOREIGN KEY (`domicio_superior_id`) REFERENCES `tbb_domicilios_marco` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_domicilios_marco`
--

LOCK TABLES `tbb_domicilios_marco` WRITE;
/*!40000 ALTER TABLE `tbb_domicilios_marco` DISABLE KEYS */;
INSERT INTO `tbb_domicilios_marco` VALUES (1,'Colonia','La Rivera',NULL,NULL,NULL,NULL),(2,'Calle','21 de Marzo',NULL,NULL,NULL,1),(3,'Numero','114',NULL,NULL,NULL,2),(4,'Numero','116',NULL,NULL,NULL,2),(5,'Calle','Mina',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbb_domicilios_marco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_ge_quejas_sugerencias`
--

DROP TABLE IF EXISTS `tbb_ge_quejas_sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ge_quejas_sugerencias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` enum('queja','sugerencia') NOT NULL,
  `Descripcion` text NOT NULL,
  `Estado` varchar(30) NOT NULL,
  `Persona_Fisica_ID` int unsigned NOT NULL,
  `Departamento_ID` int unsigned NOT NULL,
  `Fecha_Accion` datetime DEFAULT NULL,
  `Personal_Revisor_ID` int unsigned DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_qs_persona` (`Persona_Fisica_ID`),
  KEY `fk_qs_departamento` (`Departamento_ID`),
  KEY `fk_qs_revisor` (`Personal_Revisor_ID`),
  CONSTRAINT `fk_qs_departamento` FOREIGN KEY (`Departamento_ID`) REFERENCES `tbc_hr_departamentos` (`ID`),
  CONSTRAINT `fk_qs_persona` FOREIGN KEY (`Persona_Fisica_ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`),
  CONSTRAINT `fk_qs_revisor` FOREIGN KEY (`Personal_Revisor_ID`) REFERENCES `tbb_hr_personal` (`ID`),
  CONSTRAINT `chk_accion_revisor` CHECK (((`Fecha_Accion` is null) or (`Personal_Revisor_ID` is not null))),
  CONSTRAINT `chk_estado_queja` CHECK (((`Tipo` <> _utf8mb4'queja') or (`Estado` in (_utf8mb4'registrada',_utf8mb4'en_revision',_utf8mb4'en_proceso',_utf8mb4'resuelta',_utf8mb4'cerrada_sin_accion',_utf8mb4'rechazada')))),
  CONSTRAINT `chk_estado_sugerencia` CHECK (((`Tipo` <> _utf8mb4'sugerencia') or (`Estado` in (_utf8mb4'recibida',_utf8mb4'en_revision',_utf8mb4'evaluada',_utf8mb4'implementada',_utf8mb4'descartada'))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Queja y Sugerencia\nPercepción: Conceptual\nJerarquía: Genérica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ge_quejas_sugerencias`
--

LOCK TABLES `tbb_ge_quejas_sugerencias` WRITE;
/*!40000 ALTER TABLE `tbb_ge_quejas_sugerencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ge_quejas_sugerencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_medios_de_contacto`
--

DROP TABLE IF EXISTS `tbb_hr_medios_de_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_medios_de_contacto` (
  `ID` int unsigned NOT NULL,
  ` persona_id` int unsigned NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  ` telefono_casa` varchar(20) DEFAULT NULL,
  `  movil` varchar(20) DEFAULT NULL,
  `  fecha_registro` date NOT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `  estatus` bit(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_medios_de_contacto`
--

LOCK TABLES `tbb_hr_medios_de_contacto` WRITE;
/*!40000 ALTER TABLE `tbb_hr_medios_de_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_medios_de_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_personal`
--

DROP TABLE IF EXISTS `tbb_hr_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `personal_id` int unsigned NOT NULL,
  `departamento_id` int unsigned DEFAULT NULL,
  `numero_empleado` int DEFAULT NULL,
  `puesto` varchar(80) NOT NULL,
  `tipo_contrato` enum('BASE','EVENTUAL','HONORARIOS') NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `numero_empleado_UNIQUE` (`numero_empleado`),
  KEY `fk_personal_persona_idx` (`personal_id`),
  KEY `fk_personal_departamentos_idx` (`departamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personal`
--

LOCK TABLES `tbb_hr_personal` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_personal_medico`
--

DROP TABLE IF EXISTS `tbb_hr_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personal_medico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `personal_id` int unsigned NOT NULL,
  `turno` enum('MATUTINO','VESPERTINO','NOCTURNO','MIXTO') DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `celula_profecional` varchar(30) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `celula_profecional_UNIQUE` (`celula_profecional`),
  KEY `personal_id_idx` (`personal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personal_medico`
--

LOCK TABLES `tbb_hr_personal_medico` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personal_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personal_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_personas`
--

DROP TABLE IF EXISTS `tbb_hr_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('Fisica','Moral') NOT NULL DEFAULT 'Fisica',
  `rfc` varchar(14) DEFAULT NULL,
  `pais_origen` varchar(50) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Persona\nPercepcion: Fisica\nJerarquia: Super Entidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personas`
--

LOCK TABLES `tbb_hr_personas` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personas` DISABLE KEYS */;
INSERT INTO `tbb_hr_personas` VALUES (1,'Moral',NULL,'Colombia','2026-02-13 14:04:57','2026-02-13 14:29:20',_binary '');
/*!40000 ALTER TABLE `tbb_hr_personas` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_INSERT` AFTER INSERT ON `tbb_hr_personas` FOR EACH ROW BEGIN
         INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Insert",
         CONCAT_WS(" ", "Se ha insertado una nueva 
         persona con el ID:", new.id), default );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_hr_personas` FOR EACH ROW BEGIN
    -- Actualiza automáticamente la fecha de modificación
    SET NEW.fecha_actualizacion = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_UPDATE` AFTER UPDATE ON `tbb_hr_personas` FOR EACH ROW BEGIN
   INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Update",
         CONCAT_WS(" ", "Se han actualizado los datos de la 
         persona con  ID:", new.id), default );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_DELETE` AFTER DELETE ON `tbb_hr_personas` FOR EACH ROW BEGIN
   INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Delete",
         CONCAT_WS(" ", "Se borrado la persona con ID:", old.id), default );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_hr_personas_fisicas`
--

DROP TABLE IF EXISTS `tbb_hr_personas_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personas_fisicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo_cortesia` varchar(40) DEFAULT NULL,
  `nombre` varchar(60) NOT NULL,
  `priner_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(60) DEFAULT NULL,
  `genero` enum('M','N','N/B') NOT NULL DEFAULT 'N/B',
  `fecha_nacimineto` date NOT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `grupo_sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `edad` int DEFAULT NULL,
  `tipo_edad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personas_fisicas`
--

LOCK TABLES `tbb_hr_personas_fisicas` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personas_fisicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personas_fisicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_defunciones`
--

DROP TABLE IF EXISTS `tbb_md_defunciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_defunciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_defunciones`
--

LOCK TABLES `tbb_md_defunciones` WRITE;
/*!40000 ALTER TABLE `tbb_md_defunciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_defunciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_diagnosticos`
--

DROP TABLE IF EXISTS `tbb_md_diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_diagnosticos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_diagnosticos`
--

LOCK TABLES `tbb_md_diagnosticos` WRITE;
/*!40000 ALTER TABLE `tbb_md_diagnosticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_documentos_oficiales`
--

DROP TABLE IF EXISTS `tbb_md_documentos_oficiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_documentos_oficiales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_documentos_oficiales`
--

LOCK TABLES `tbb_md_documentos_oficiales` WRITE;
/*!40000 ALTER TABLE `tbb_md_documentos_oficiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_documentos_oficiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_domicilios`
--

DROP TABLE IF EXISTS `tbb_md_domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_domicilios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Calle` varchar(150) NOT NULL,
  `Numero_Exterior` varchar(20) NOT NULL,
  `Numero_Interior` varchar(20) DEFAULT NULL,
  `Colonia` varchar(100) NOT NULL,
  `Codigo_Postal` varchar(10) NOT NULL,
  `Municipio` varchar(100) NOT NULL,
  `Estado` varchar(100) NOT NULL,
  `Referencias` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_domicilios`
--

LOCK TABLES `tbb_md_domicilios` WRITE;
/*!40000 ALTER TABLE `tbb_md_domicilios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_expedientes_medicos`
--

DROP TABLE IF EXISTS `tbb_md_expedientes_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_expedientes_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_expedientes_medicos`
--

LOCK TABLES `tbb_md_expedientes_medicos` WRITE;
/*!40000 ALTER TABLE `tbb_md_expedientes_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_expedientes_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_nacimientos`
--

DROP TABLE IF EXISTS `tbb_md_nacimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_nacimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_nacimientos`
--

LOCK TABLES `tbb_md_nacimientos` WRITE;
/*!40000 ALTER TABLE `tbb_md_nacimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_nacimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_notas_medicas`
--

DROP TABLE IF EXISTS `tbb_md_notas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_notas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_notas_medicas`
--

LOCK TABLES `tbb_md_notas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_md_notas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_notas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_pacientes`
--

DROP TABLE IF EXISTS `tbb_md_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_pacientes` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_pacientes`
--

LOCK TABLES `tbb_md_pacientes` WRITE;
/*!40000 ALTER TABLE `tbb_md_pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_md_tratamientos`
--

DROP TABLE IF EXISTS `tbb_md_tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_tratamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_tratamientos`
--

LOCK TABLES `tbb_md_tratamientos` WRITE;
/*!40000 ALTER TABLE `tbb_md_tratamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_mr_personas_morales`
--

DROP TABLE IF EXISTS `tbb_mr_personas_morales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_mr_personas_morales` (
  `id` int unsigned NOT NULL,
  `razon_social` varchar(200) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_creacion` date NOT NULL DEFAULT (curdate()),
  `estatus` enum('Activa','Inactiva') NOT NULL DEFAULT 'Activa',
  `responsabilidad` varchar(100) DEFAULT NULL,
  `capacidad_juridica` varchar(100) DEFAULT NULL,
  `patrimonio` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `fk_persona_moral_persona` FOREIGN KEY (`id`) REFERENCES `tbb_hr_personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Persona Moral\nPercepcion: Conceptual\nJerarquia: Generica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_mr_personas_morales`
--

LOCK TABLES `tbb_mr_personas_morales` WRITE;
/*!40000 ALTER TABLE `tbb_mr_personas_morales` DISABLE KEYS */;
INSERT INTO `tbb_mr_personas_morales` VALUES (1,'Comercializadora Xicotepec','Privada','2026-02-20 13:54:07','2026-02-20','Activa',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbb_mr_personas_morales` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_morales_after_insert` AFTER INSERT ON `tbb_mr_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una nueva persona moral con el ID:', NEW.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_morales_after_update` AFTER UPDATE ON `tbb_mr_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la persona moral con el ID:', OLD.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_morales_after_delete` AFTER DELETE ON `tbb_mr_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la persona moral con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_mr_proveedores`
--

DROP TABLE IF EXISTS `tbb_mr_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_mr_proveedores` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Nombre` varchar(100) NOT NULL,
  `Contacto` varchar(50) DEFAULT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Proveedor\nPercepcion: Mixto\nJerarquia: Generica\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_mr_proveedores`
--

LOCK TABLES `tbb_mr_proveedores` WRITE;
/*!40000 ALTER TABLE `tbb_mr_proveedores` DISABLE KEYS */;
INSERT INTO `tbb_mr_proveedores` VALUES (1,'2026-02-20 13:54:07',_binary '','Proveedor Médico de la Sierra','Juan Pérez','Insumos Quirúrgicos');
/*!40000 ALTER TABLE `tbb_mr_proveedores` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_proveedores_after_insert` AFTER INSERT ON `tbb_mr_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo proveedor con el ID:', NEW.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_proveedores_after_update` AFTER UPDATE ON `tbb_mr_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el proveedor con el ID:', OLD.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_proveedores_after_delete` AFTER DELETE ON `tbb_mr_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado al proveedor con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_mr_transacciones_financieras`
--

DROP TABLE IF EXISTS `tbb_mr_transacciones_financieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_mr_transacciones_financieras` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Proveedor_ID` int DEFAULT NULL,
  `Tipo_Transacciones` enum('Pago','Abono','Nota de Credito') DEFAULT NULL,
  `Fecha_Transaccion` datetime DEFAULT NULL,
  `Referencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Transaccion Financiera\nPercepcion: Conceptual\nJerarquia: Generica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_mr_transacciones_financieras`
--

LOCK TABLES `tbb_mr_transacciones_financieras` WRITE;
/*!40000 ALTER TABLE `tbb_mr_transacciones_financieras` DISABLE KEYS */;
INSERT INTO `tbb_mr_transacciones_financieras` VALUES (1,'2026-02-20 13:54:08',_binary '',1,'Pago',NULL,'REF-PAGO-001');
/*!40000 ALTER TABLE `tbb_mr_transacciones_financieras` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_transacciones_financieras_after_insert` AFTER INSERT ON `tbb_mr_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una transacción con el ID:', NEW.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_transacciones_financieras_after_update` AFTER UPDATE ON `tbb_mr_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la transacción con el ID:', OLD.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_transacciones_financieras_after_delete` AFTER DELETE ON `tbb_mr_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la transacción con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_ms_citas_medicas`
--

DROP TABLE IF EXISTS `tbb_ms_citas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_citas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` int unsigned NOT NULL,
  `id_personal_medico` int unsigned NOT NULL,
  `id_area` int unsigned DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `tipo_cita` enum('Consulta general','Urgencias','Control','Seguimiento','Primera vez') NOT NULL,
  `estado_cita` enum('Pendiente','En curso','Completada','Cancelada','No asistió') DEFAULT 'Pendiente',
  `observaciones` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ms_citas_medicas`
--

LOCK TABLES `tbb_ms_citas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_ms_citas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_citas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_ms_dietas`
--

DROP TABLE IF EXISTS `tbb_ms_dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_dietas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ms_dietas`
--

LOCK TABLES `tbb_ms_dietas` WRITE;
/*!40000 ALTER TABLE `tbb_ms_dietas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_dietas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_ms_transfusiones_sanguineas`
--

DROP TABLE IF EXISTS `tbb_ms_transfusiones_sanguineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_transfusiones_sanguineas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Cirugia_ID` int unsigned DEFAULT NULL,
  `Valoracion_ID` int unsigned DEFAULT NULL,
  `Medico_ID` int unsigned NOT NULL,
  `Tipo_Sangre` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `Cantidad_ml` int unsigned NOT NULL,
  `Fecha_Transfusion` datetime NOT NULL,
  `Reaccion_Adversa` text,
  `Observaciones` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ms_transfusiones_sanguineas`
--

LOCK TABLES `tbb_ms_transfusiones_sanguineas` WRITE;
/*!40000 ALTER TABLE `tbb_ms_transfusiones_sanguineas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_transfusiones_sanguineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_ms_traslados`
--

DROP TABLE IF EXISTS `tbb_ms_traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_traslados` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Cirugia_ID` int unsigned DEFAULT NULL,
  `Valoracion_ID` int unsigned DEFAULT NULL,
  `Tipo_Traslado` enum('Interno','Externo','Urgente','Programado') NOT NULL,
  `Area_Origen` varchar(120) NOT NULL,
  `Area_Destino` varchar(120) NOT NULL,
  `Responsable_ID` int unsigned NOT NULL,
  `Motivo` text,
  `Fecha_Traslado` datetime NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ms_traslados`
--

LOCK TABLES `tbb_ms_traslados` WRITE;
/*!40000 ALTER TABLE `tbb_ms_traslados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_traslados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_ms_valoraciones`
--

DROP TABLE IF EXISTS `tbb_ms_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_valoraciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Cita_ID` int unsigned NOT NULL,
  `Medico_ID` int unsigned NOT NULL,
  `Diagnostico` text NOT NULL,
  `Presion_Arterial` varchar(20) DEFAULT NULL,
  `Temperatura` decimal(4,2) DEFAULT NULL,
  `Peso` decimal(5,2) DEFAULT NULL,
  `Estatura` decimal(4,2) DEFAULT NULL,
  `Frecuencia_Cardiaca` int unsigned DEFAULT NULL,
  `Saturacion_Oxigeno` int unsigned DEFAULT NULL,
  `Tratamiento` text,
  `Observaciones` text,
  `Fecha_Valoracion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ms_valoraciones`
--

LOCK TABLES `tbb_ms_valoraciones` WRITE;
/*!40000 ALTER TABLE `tbb_ms_valoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_valoraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_ph_recetas_medicas`
--

DROP TABLE IF EXISTS `tbb_ph_recetas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ph_recetas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la receta médica.',
  `Tratamiento_Id` int unsigned DEFAULT NULL COMMENT 'Identificador del tratamiento asociado a la receta.',
  `fecha_emision` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora en que se emitió la receta.',
  `estado_receta` enum('pendiente','surtida','cancelada') NOT NULL DEFAULT 'pendiente' COMMENT 'Estado actual de la receta médica.',
  `requiere_aprobacion` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indica si la receta requiere aprobación previa.',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora en que se registró la receta en el sistema.',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Receta Medica\nEntidad: Receta Medica\nPercepcion: Conceptual\nJerarquia: Super Entidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ph_recetas_medicas`
--

LOCK TABLES `tbb_ph_recetas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_ph_recetas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ph_recetas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_ge_areas`
--

DROP TABLE IF EXISTS `tbc_ge_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_areas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Espacio_ID` int unsigned NOT NULL,
  `Personal_Responsable_ID` int unsigned NOT NULL,
  `Area_Superior_ID` int unsigned DEFAULT NULL,
  `Estatus_Operacion` enum('Activa','Inactiva','Suspendida','Cancelada') DEFAULT 'Activa',
  `Total_Empleados` int unsigned NOT NULL DEFAULT '0',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nombre` (`Nombre`),
  KEY `fk_ge_areas_ge_area_superior` (`Area_Superior_ID`),
  CONSTRAINT `fk_ge_areas_ge_area_superior` FOREIGN KEY (`Area_Superior_ID`) REFERENCES `tbc_ge_areas` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ge_areas`
--

LOCK TABLES `tbc_ge_areas` WRITE;
/*!40000 ALTER TABLE `tbc_ge_areas` DISABLE KEYS */;
INSERT INTO `tbc_ge_areas` VALUES (1,'Gerencia','Principal organo administrativo de la operación del Hospital',0,0,NULL,'Activa',0,'2026-01-13 15:12:36',NULL,_binary ''),(2,'Recursos Humanos','Departamento que controla la información de los trabajadores del Hospital',0,1,NULL,'Activa',0,'2026-01-13 15:14:33',NULL,_binary '');
/*!40000 ALTER TABLE `tbc_ge_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_ge_organos`
--

DROP TABLE IF EXISTS `tbc_ge_organos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_organos` (
  `ID_Organo` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Sistema_Aparato` varchar(100) NOT NULL,
  `Requisitos` text,
  `Stock` int unsigned NOT NULL,
  `Descripcion` text,
  `Funcion` text,
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID_Organo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Órgano\nPercepción: Física\nJerarquía: Primaria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ge_organos`
--

LOCK TABLES `tbc_ge_organos` WRITE;
/*!40000 ALTER TABLE `tbc_ge_organos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ge_organos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_ge_patologias`
--

DROP TABLE IF EXISTS `tbc_ge_patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_patologias` (
  `ID_Patologia` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Nombre_Cientifico` varchar(150) NOT NULL,
  `Nombre_Comun` varchar(150) DEFAULT NULL,
  `Descripcion` text,
  `Fecha_Clasificacion` datetime NOT NULL,
  `Estatus_Patologia` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID_Patologia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Patología\nPercepción: Conceptual\nJerarquía: Genérica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ge_patologias`
--

LOCK TABLES `tbc_ge_patologias` WRITE;
/*!40000 ALTER TABLE `tbc_ge_patologias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ge_patologias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_ge_servicios`
--

DROP TABLE IF EXISTS `tbc_ge_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Area_ID` int unsigned NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` text,
  `tipo_servicio` enum('Médico','Administrativo','Sociales','Apoyo') DEFAULT NULL,
  `nivel` enum('Basico','Especializado','Alta Especialidad') NOT NULL DEFAULT 'Basico',
  `costo` tinyint NOT NULL DEFAULT '0',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_servicio_area_idx` (`Area_ID`),
  CONSTRAINT `fk_servicio_area` FOREIGN KEY (`Area_ID`) REFERENCES `tbc_ge_areas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Servicio\nPercepción: Conceptual\nJerarquía: Genérica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ge_servicios`
--

LOCK TABLES `tbc_ge_servicios` WRITE;
/*!40000 ALTER TABLE `tbc_ge_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ge_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_ge_tipos_patologias`
--

DROP TABLE IF EXISTS `tbc_ge_tipos_patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_tipos_patologias` (
  `ID_Tipo_Patologia` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID_Tipo_Patologia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Tipos Patologías\nPercepción: Conceptual\nJerarquía: Genérica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ge_tipos_patologias`
--

LOCK TABLES `tbc_ge_tipos_patologias` WRITE;
/*!40000 ALTER TABLE `tbc_ge_tipos_patologias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ge_tipos_patologias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_hr_departamentos`
--

DROP TABLE IF EXISTS `tbc_hr_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_hr_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `descripcion` text,
  `area_id` int DEFAULT NULL,
  `responsable_personal_id` int unsigned DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_hr_departamentos`
--

LOCK TABLES `tbc_hr_departamentos` WRITE;
/*!40000 ALTER TABLE `tbc_hr_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_hr_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_md_signos_vitales`
--

DROP TABLE IF EXISTS `tbc_md_signos_vitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_md_signos_vitales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_md_signos_vitales`
--

LOCK TABLES `tbc_md_signos_vitales` WRITE;
/*!40000 ALTER TABLE `tbc_md_signos_vitales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_md_signos_vitales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_mr_equipamientos`
--

DROP TABLE IF EXISTS `tbc_mr_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_mr_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Nombre` varchar(100) NOT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Proveedor_ID` int unsigned NOT NULL,
  `Espacio_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_equipamiento_espacio` (`Espacio_ID`),
  CONSTRAINT `fk_equipamiento_espacio` FOREIGN KEY (`Espacio_ID`) REFERENCES `tbc_mr_espacios` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Equipamiento\nPercepcion: Fisico\nJerarquia: Super Entidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_mr_equipamientos`
--

LOCK TABLES `tbc_mr_equipamientos` WRITE;
/*!40000 ALTER TABLE `tbc_mr_equipamientos` DISABLE KEYS */;
INSERT INTO `tbc_mr_equipamientos` VALUES (1,'2026-02-20 13:54:08',_binary '','Monitor de Signos Vitales','Philips',1,NULL);
/*!40000 ALTER TABLE `tbc_mr_equipamientos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_equipamientos_after_insert` AFTER INSERT ON `tbc_mr_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo equipamiento con el ID:', NEW.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_equipamientos_after_update` AFTER UPDATE ON `tbc_mr_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el equipamiento con el ID:', OLD.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_equipamientos_after_delete` AFTER DELETE ON `tbc_mr_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el equipamiento con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_mr_espacios`
--

DROP TABLE IF EXISTS `tbc_mr_espacios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_mr_espacios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Nombre_Sala` varchar(100) NOT NULL,
  `Piso` int DEFAULT NULL,
  `Capacidad` int DEFAULT NULL,
  `Edificio` varchar(100) DEFAULT NULL,
  `Nombre_Area` varchar(100) DEFAULT NULL,
  `Tipo_Unidad_Fisica` varchar(100) DEFAULT NULL,
  `Clave` varchar(50) DEFAULT NULL,
  `Encargado_Espacio` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Espacio\nPercepcion: Fisico \nJerarquia: Generica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_mr_espacios`
--

LOCK TABLES `tbc_mr_espacios` WRITE;
/*!40000 ALTER TABLE `tbc_mr_espacios` DISABLE KEYS */;
INSERT INTO `tbc_mr_espacios` VALUES (1,'2026-02-20 13:54:08',_binary '','Sala de Urgencias',1,15,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbc_mr_espacios` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_espacios_after_insert` AFTER INSERT ON `tbc_mr_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo espacio con el ID:', NEW.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_espacios_after_update` AFTER UPDATE ON `tbc_mr_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el espacio con el ID:', OLD.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_espacios_after_delete` AFTER DELETE ON `tbc_mr_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el espacio con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_ms_cirugias`
--

DROP TABLE IF EXISTS `tbc_ms_cirugias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ms_cirugias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_oficial` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text,
  `especialidad` varchar(100) NOT NULL,
  `nivel_complejidad` enum('Baja','Media','Alta') NOT NULL,
  `tipo_procedimiento` enum('Electiva','Urgente','Emergente') NOT NULL,
  `clasificacion_asa` enum('I','II','III','IV','V') DEFAULT NULL,
  `tipo_anestesia` enum('Local','Regional','General','Sedacion') NOT NULL,
  `duracion_estimada_min` int unsigned DEFAULT NULL,
  `requiere_hospitalizacion` tinyint(1) NOT NULL DEFAULT '0',
  `requiere_uci` tinyint(1) NOT NULL DEFAULT '0',
  `costo_referencia` decimal(10,2) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ms_cirugias`
--

LOCK TABLES `tbc_ms_cirugias` WRITE;
/*!40000 ALTER TABLE `tbc_ms_cirugias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ms_cirugias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_ms_servicios_medicos`
--

DROP TABLE IF EXISTS `tbc_ms_servicios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ms_servicios_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Medico_ID` int unsigned NOT NULL,
  `Tipo_Servicio` enum('Consulta','Urgencia','Hospitalizacion','Cirugia','Terapia','Diagnostico','Rehabilitacion') NOT NULL,
  `Prioridad` enum('Baja','Media','Alta','Critica') DEFAULT 'Media',
  `Fecha_Inicio` datetime NOT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Observaciones` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Datos Harcodeados : Entidad: Persona Percepcion: Fisica Jeraraquia: Generica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ms_servicios_medicos`
--

LOCK TABLES `tbc_ms_servicios_medicos` WRITE;
/*!40000 ALTER TABLE `tbc_ms_servicios_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ms_servicios_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_ph_medicamentos`
--

DROP TABLE IF EXISTS `tbc_ph_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ph_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del medicamento.',
  `nombre` varchar(150) NOT NULL COMMENT 'Nombre comercial del medicamento.',
  `nombre_cientifico` varchar(150) NOT NULL COMMENT 'Nombre científico o farmacológico del medicamento.',
  `nombre_comun` varchar(150) NOT NULL COMMENT 'Nombre común del medicamento, si lo tiene.',
  `principio_activo` varchar(150) NOT NULL COMMENT 'Sustancia activa principal en el medicamento.',
  `concentracion` varchar(100) NOT NULL COMMENT 'Concentración o dosificación del medicamento.',
  `forma_farmaceutica` varchar(100) NOT NULL COMMENT 'Forma en que se presenta el medicamento (ej. tabletas, suspensión).',
  `via_administracion` varchar(100) NOT NULL COMMENT 'Vía de administración del medicamento (oral, intravenosa, etc.).',
  `tipo_medicamento` enum('normal','controlado','alto_costo') NOT NULL COMMENT 'Tipo de medicamento: normal, controlado o de alto costo.',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que el medicamento fue registrado en el sistema.',
  `estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Indica si el medicamento está activo (1) o inactivo (0).',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Medicamento\nEntidad: Medicamento\nPercepcion: Fisica\nJerarquia: Catalogo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ph_medicamentos`
--

LOCK TABLES `tbc_ph_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbc_ph_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ph_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ge_aprobaciones`
--

DROP TABLE IF EXISTS `tbd_ge_aprobaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ge_aprobaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Personal_ID` int unsigned NOT NULL,
  `Servicio_ID` int unsigned NOT NULL,
  `Estatus_Aprobacion` enum('Registrado','Aprobado','Rechazado','En espera','Cancelado') DEFAULT 'Registrado',
  `fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_Actualizacion` datetime DEFAULT NULL,
  `Servicio_descripcion` int NOT NULL,
  `estatus` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `fk_aprobaciones_descripcion_idx` (`Servicio_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ge_aprobaciones`
--

LOCK TABLES `tbd_ge_aprobaciones` WRITE;
/*!40000 ALTER TABLE `tbd_ge_aprobaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ge_aprobaciones` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_aprobaciones_after_insert` AFTER INSERT ON `tbd_ge_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una nueva aprobación con el ID:', NEW.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_aprobaciones_after_update` AFTER UPDATE ON `tbd_ge_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la aprobación con el ID:', OLD.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_aprobaciones_after_delete` AFTER DELETE ON `tbd_ge_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la aprobación con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_ge_patologias_tipos`
--

DROP TABLE IF EXISTS `tbd_ge_patologias_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ge_patologias_tipos` (
  `ID_Patologia_Tipo` int unsigned NOT NULL AUTO_INCREMENT,
  `Patologia_ID` int unsigned NOT NULL,
  `Tipo_Patologia_ID` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID_Patologia_Tipo`),
  KEY `fk_patologia_maestra` (`Patologia_ID`),
  KEY `fk_tipo_clasificacion` (`Tipo_Patologia_ID`),
  CONSTRAINT `fk_patologia_maestra` FOREIGN KEY (`Patologia_ID`) REFERENCES `tbc_ge_patologias` (`ID_Patologia`) ON DELETE CASCADE,
  CONSTRAINT `fk_tipo_clasificacion` FOREIGN KEY (`Tipo_Patologia_ID`) REFERENCES `tbc_ge_tipos_patologias` (`ID_Tipo_Patologia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Patologías Tipos\nPercepción: Conceptual\nJerarquía: Genérica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ge_patologias_tipos`
--

LOCK TABLES `tbd_ge_patologias_tipos` WRITE;
/*!40000 ALTER TABLE `tbd_ge_patologias_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ge_patologias_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ge_solicitudes_servicios`
--

DROP TABLE IF EXISTS `tbd_ge_solicitudes_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ge_solicitudes_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Servicio_ID` int unsigned NOT NULL,
  `Persona_ID` int unsigned NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_solicitud_servicio` (`Servicio_ID`),
  KEY `fk_solicitud_persona` (`Persona_ID`),
  CONSTRAINT `fk_solicitud_persona` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_hr_personas` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_servicio` FOREIGN KEY (`Servicio_ID`) REFERENCES `tbc_ge_servicios` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Solicitudes de Servicios\nPercepción: Conceptual\nJerarquía: Genérica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ge_solicitudes_servicios`
--

LOCK TABLES `tbd_ge_solicitudes_servicios` WRITE;
/*!40000 ALTER TABLE `tbd_ge_solicitudes_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ge_solicitudes_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_hr_horarios`
--

DROP TABLE IF EXISTS `tbd_hr_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_hr_horarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `personal_id` int unsigned NOT NULL,
  `area_id` int DEFAULT NULL,
  `dia_semana` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO','DOMINGO') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `tipo_turno` enum('MATUTINO','VESPERTINO','NOCTURNO','GUARDIA') DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_hr_horarios`
--

LOCK TABLES `tbd_hr_horarios` WRITE;
/*!40000 ALTER TABLE `tbd_hr_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_hr_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_mr_accesos`
--

DROP TABLE IF EXISTS `tbd_mr_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_mr_accesos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Persona_ID` int unsigned NOT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Espacio_ID` int unsigned NOT NULL,
  `Tipo` enum('Entrada','Salida') NOT NULL DEFAULT 'Entrada',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Personal_ID_autoriza` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_acceso_persona` (`Persona_ID`),
  KEY `fk_acceso_espacio` (`Espacio_ID`),
  CONSTRAINT `fk_acceso_espacio` FOREIGN KEY (`Espacio_ID`) REFERENCES `tbc_mr_espacios` (`ID`),
  CONSTRAINT `fk_acceso_persona` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Acceso\\nPercepcion: Mixto\\nJerarquia: Generica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_mr_accesos`
--

LOCK TABLES `tbd_mr_accesos` WRITE;
/*!40000 ALTER TABLE `tbd_mr_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_mr_accesos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_accesos_after_insert` AFTER INSERT ON `tbd_mr_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo acceso con el ID:', NEW.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_accesos_after_update` AFTER UPDATE ON `tbd_mr_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el acceso con el ID:', OLD.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_accesos_after_delete` AFTER DELETE ON `tbd_mr_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el acceso con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_mr_inventario_equipamientos`
--

DROP TABLE IF EXISTS `tbd_mr_inventario_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_mr_inventario_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Equipamiento_ID` int DEFAULT NULL,
  `Numero_serie` varchar(50) DEFAULT NULL,
  `Codigo_Patrimonial` varchar(50) DEFAULT NULL,
  `Espacio_ID` int DEFAULT NULL,
  `EstatusEquipamiento` enum('Operativo','En uso','Mantenimiento','Almacenado','Baja') DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Adquisicion` date DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Inventario Equipamiento\nPercepcion: Fisico\nJerarquia: Sub Entidad\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_mr_inventario_equipamientos`
--

LOCK TABLES `tbd_mr_inventario_equipamientos` WRITE;
/*!40000 ALTER TABLE `tbd_mr_inventario_equipamientos` DISABLE KEYS */;
INSERT INTO `tbd_mr_inventario_equipamientos` VALUES (1,1,'SN-987654321',NULL,NULL,'Operativo','2026-02-20 13:54:09',NULL,_binary '');
/*!40000 ALTER TABLE `tbd_mr_inventario_equipamientos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_inventario_equipamientos_after_insert` AFTER INSERT ON `tbd_mr_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo registro en inventario con el ID:', NEW.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_inventario_equipamientos_after_update` AFTER UPDATE ON `tbd_mr_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el registro de inventario con el ID:', OLD.id)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_inventario_equipamientos_after_delete` AFTER DELETE ON `tbd_mr_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el registro de inventario con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_ms_campanias`
--

DROP TABLE IF EXISTS `tbd_ms_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ms_campanias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Departamento_ID` int unsigned NOT NULL,
  `Personal_ID_responsable` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Estatus_Realizacion` enum('Programada','Realizada','Finalizada','Cancelada','Aprobada','Activa','Inactiva') DEFAULT 'Programada',
  `Estatus` bit(1) DEFAULT b'1',
  `Tipo` enum('Preventiva','Diagnóstica','Terapéutica','Especializada','General') NOT NULL DEFAULT 'General',
  `Observaciones` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Datos Harcodeados : Entidad: Persona Percepcion: Conceptual Jeraraquia: Generica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ms_campanias`
--

LOCK TABLES `tbd_ms_campanias` WRITE;
/*!40000 ALTER TABLE `tbd_ms_campanias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ms_campanias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ms_recursos_cirugia`
--

DROP TABLE IF EXISTS `tbd_ms_recursos_cirugia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ms_recursos_cirugia` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Cirugia_ID` int unsigned NOT NULL,
  `Tipo_Recurso` enum('Personal','Equipamiento','Medicamento','Espacio') NOT NULL,
  `Personal_ID` int unsigned DEFAULT NULL,
  `Equipamiento_ID` int unsigned DEFAULT NULL,
  `Medicamento_ID` int unsigned DEFAULT NULL,
  `Espacio_ID` int unsigned DEFAULT NULL,
  `Cantidad` decimal(10,2) DEFAULT '1.00',
  `Observaciones` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ms_recursos_cirugia`
--

LOCK TABLES `tbd_ms_recursos_cirugia` WRITE;
/*!40000 ALTER TABLE `tbd_ms_recursos_cirugia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ms_recursos_cirugia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_padecimientos`
--

DROP TABLE IF EXISTS `tbd_padecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_padecimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_padecimientos`
--

LOCK TABLES `tbd_padecimientos` WRITE;
/*!40000 ALTER TABLE `tbd_padecimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_padecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ph_detalle_receta`
--

DROP TABLE IF EXISTS `tbd_ph_detalle_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_detalle_receta` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de la receta.',
  `medicamento_Id` int unsigned NOT NULL COMMENT 'Identificador del medicamento prescrito en la receta.',
  `receta_Id` int unsigned NOT NULL COMMENT 'Identificador de la receta asociada a este detalle.',
  `dosis` varchar(100) NOT NULL COMMENT 'Dosis del medicamento indicada en la receta.',
  `frecuencia` varchar(100) NOT NULL COMMENT 'Frecuencia con la que debe tomarse el medicamento.',
  `duracion` varchar(100) NOT NULL COMMENT 'Duración del tratamiento con el medicamento.',
  `cantidad` int unsigned NOT NULL COMMENT 'Cantidad total de medicamento prescrito.',
  `indicaciones` text COMMENT 'Indicaciones adicionales sobre el medicamento o el tratamiento.',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que el detalle de la receta fue registrado en el sistema.',
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que el detalle de la receta fue actualizado por última vez.',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ph_detalle_receta`
--

LOCK TABLES `tbd_ph_detalle_receta` WRITE;
/*!40000 ALTER TABLE `tbd_ph_detalle_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ph_detalle_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ph_inventario_medicamentos`
--

DROP TABLE IF EXISTS `tbd_ph_inventario_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_inventario_medicamentos` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del medicamento en inventario.',
  `marca` varchar(150) NOT NULL COMMENT 'Marca del medicamento.',
  `empresa` varchar(150) NOT NULL COMMENT 'Empresa que fabrica o distribuye el medicamento.',
  `farmaceutica` varchar(150) NOT NULL COMMENT 'Farmacéutica que produce o distribuye el medicamento.',
  `presentacion` varchar(150) NOT NULL COMMENT 'Presentación del medicamento (ej. tabletas, suspensión, etc.).',
  `efectos_secundarios` text COMMENT 'Efectos secundarios del medicamento.',
  `via_administracion` varchar(150) NOT NULL COMMENT 'Vía de administración del medicamento (oral, intravenosa, etc.).',
  `restricciones` text COMMENT 'Restricciones relacionadas con el uso del medicamento.',
  `aprobacion` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indica si el medicamento tiene aprobación para ser distribuido (1 para aprobado, 0 para no aprobado).',
  `cantidad` int unsigned NOT NULL COMMENT 'Cantidad de unidades del medicamento en inventario.',
  `fecha_movimiento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que ocurrió el último movimiento (ingreso/salida) del medicamento.',
  `motivo` varchar(255) DEFAULT NULL COMMENT 'Motivo del movimiento del medicamento (ej. venta, devolución, etc.).',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que el medicamento fue registrado en el inventario.',
  PRIMARY KEY (`Id`),
  CONSTRAINT `chk_cantidad_mov` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventario Medicamento\nEntidad: Inventario Medicamentos\nPercepcion: Fisica\nJerarquia: Transaccional';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ph_inventario_medicamentos`
--

LOCK TABLES `tbd_ph_inventario_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbd_ph_inventario_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ph_inventario_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ph_lotes_medicamentos`
--

DROP TABLE IF EXISTS `tbd_ph_lotes_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_lotes_medicamentos` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del lote de medicamento.',
  `medicamento_Id` int unsigned NOT NULL COMMENT 'Identificador del medicamento asociado a este lote.',
  `numero_lote` varchar(100) NOT NULL COMMENT 'Número de lote del medicamento.',
  `fecha_fabricacion` date NOT NULL COMMENT 'Fecha de fabricación del lote de medicamento.',
  `fecha_caducidad` date NOT NULL COMMENT 'Fecha de caducidad del lote de medicamento.',
  `cantidad_inicial` int unsigned NOT NULL COMMENT 'Cantidad inicial de unidades en el lote.',
  `cantidad_actual` int unsigned NOT NULL COMMENT 'Cantidad actual de unidades en el lote (puede haberse reducido por ventas o devoluciones).',
  `estado_lote` enum('disponible','bloqueado','vencido') NOT NULL DEFAULT 'disponible' COMMENT 'Estado actual del lote: disponible, bloqueado o vencido.',
  `ubicacion` varchar(150) DEFAULT NULL COMMENT 'Ubicación física del lote de medicamento (almacén, pasillo, etc.).',
  `observaciones` text COMMENT 'Observaciones adicionales relacionadas con el lote (por ejemplo, condiciones especiales de almacenamiento).',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que el lote fue registrado en el sistema.',
  PRIMARY KEY (`Id`),
  CONSTRAINT `chk_fechas_lote` CHECK ((`fecha_caducidad` > `fecha_fabricacion`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lotes Medicamentos\nEntidad: Lotes Medicamentos\nPercepcion: Fisica\nJerarquia: Sub Entidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ph_lotes_medicamentos`
--

LOCK TABLES `tbd_ph_lotes_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbd_ph_lotes_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ph_lotes_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('Insert','Update','Delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbi_bitacora`
--

LOCK TABLES `tbi_bitacora` WRITE;
/*!40000 ALTER TABLE `tbi_bitacora` DISABLE KEYS */;
INSERT INTO `tbi_bitacora` VALUES (1,'tbb_personas','root@localhost','Insert','Se ha insertado una nueva \n         persona con el ID: 1','2026-02-13 14:04:57'),(2,'tbb_personas','jesus.dominguez@DESKTOP-8HTV7C9','Insert','Se ha insertado una nueva \n         persona con el ID: 2','2026-02-13 14:10:04'),(3,'tbb_personas','derek.sesni@10.10.62.20','Insert','Se ha insertado una nueva \n         persona con el ID: 3','2026-02-13 14:10:36'),(4,'tbb_personas','jonathan.lopez@DESKTOP-VU1CL43','Insert','Se ha insertado una nueva \n         persona con el ID: 4','2026-02-13 14:12:46'),(5,'tbb_personas','michelle.castro@DESKTOP-EO8KM61','Insert','Se ha insertado una nueva \n         persona con el ID: 5','2026-02-13 14:13:15'),(6,'tbb_personas','francisco.garcia@DESKTOP-LCCOCUU','Insert','Se ha insertado una nueva \n         persona con el ID: 6','2026-02-13 14:13:20'),(7,'tbb_personas','citlalli.perez@DESKTOP-V03BSD8','Insert','Se ha insertado una nueva \n         persona con el ID: 7','2026-02-13 14:13:27'),(8,'tbb_personas','yazmin.gutierrez@DESKTOP-IKD1HEO','Insert','Se ha insertado una nueva \n         persona con el ID: 8','2026-02-13 14:13:29'),(9,'tbb_personas','obed.guzman@10.10.62.5','Insert','Se ha insertado una nueva \n         persona con el ID: 9','2026-02-13 14:13:48'),(10,'tbb_personas','arturo.garcia@10.10.62.7','Insert','Se ha insertado una nueva \n         persona con el ID: 10','2026-02-13 14:14:10'),(11,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 11','2026-02-13 14:14:40'),(12,'tbb_personas','brisa.garcia@10.10.62.23','Insert','Se ha insertado una nueva \n         persona con el ID: 12','2026-02-13 14:15:54'),(13,'tbb_personas','adrian.perez@10.10.62.18','Insert','Se ha insertado una nueva \n         persona con el ID: 13','2026-02-13 14:16:30'),(14,'tbb_personas','root@localhost','Update','Se han actualizado los datos de la \n         persona con  ID: 1','2026-02-13 14:18:04'),(15,'tbb_personas','matias.granillo@10.10.62.22','Insert','Se ha insertado una nueva \n         persona con el ID: 14','2026-02-13 14:19:34'),(16,'tbb_personas','daniel.garcia@10.10.62.24','Insert','Se ha insertado una nueva \n         persona con el ID: 15','2026-02-13 14:21:18'),(17,'tbb_personas','luis.suarez@EQUIOPO05','Insert','Se ha insertado una nueva \n         persona con el ID: 16','2026-02-13 14:22:26'),(18,'tbb_personas','edwin.hernandez@10.10.62.25','Insert','Se ha insertado una nueva \n         persona con el ID: 17','2026-02-13 14:24:15'),(19,'tbb_personas','luis.suarez@EQUIOPO05','Insert','Se ha insertado una nueva \n         persona con el ID: 18','2026-02-13 14:24:54'),(20,'tbb_personas','yazmin.gutierrez@DESKTOP-IKD1HEO','Update','Se han actualizado los datos de la \n         persona con  ID: 8','2026-02-13 14:25:51'),(21,'tbb_personas','arturo.garcia@10.10.62.7','Update','Se han actualizado los datos de la \n         persona con  ID: 1','2026-02-13 14:25:52'),(22,'tbb_personas','jesus.dominguez@DESKTOP-8HTV7C9','Update','Se han actualizado los datos de la \n         persona con  ID: 3','2026-02-13 14:26:05'),(23,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 19','2026-02-13 14:26:13'),(24,'tbb_personas','jesus.dominguez@DESKTOP-8HTV7C9','Update','Se han actualizado los datos de la \n         persona con  ID: 2','2026-02-13 14:26:21'),(25,'tbb_personas','francisco.garcia@DESKTOP-LCCOCUU','Update','Se han actualizado los datos de la \n         persona con  ID: 6','2026-02-13 14:26:40'),(26,'tbb_personas','obed.guzman@10.10.62.5','Update','Se han actualizado los datos de la \n         persona con  ID: 9','2026-02-13 14:26:47'),(27,'tbb_personas','michelle.castro@DESKTOP-EO8KM61','Update','Se han actualizado los datos de la \n         persona con  ID: 5','2026-02-13 14:27:00'),(28,'tbb_personas','brisa.garcia@10.10.62.23','Update','Se han actualizado los datos de la \n         persona con  ID: 1','2026-02-13 14:27:22'),(29,'tbb_personas','adrian.perez@10.10.62.18','Update','Se han actualizado los datos de la \n         persona con  ID: 13','2026-02-13 14:27:48'),(30,'tbb_personas','citlalli.perez@DESKTOP-V03BSD8','Update','Se han actualizado los datos de la \n         persona con  ID: 7','2026-02-13 14:27:56'),(31,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 20','2026-02-13 14:29:13'),(32,'tbb_personas','luis.suarez@EQUIOPO05','Update','Se han actualizado los datos de la \n         persona con  ID: 18','2026-02-13 14:29:20'),(33,'tbb_personas','matias.granillo@10.10.62.22','Update','Se han actualizado los datos de la \n         persona con  ID: 1','2026-02-13 14:29:20'),(34,'tbb_personas','daniel.garcia@10.10.62.24','Insert','Se ha insertado una nueva \n         persona con el ID: 21','2026-02-13 14:30:24'),(35,'tbb_personas','angel.banos@DESKTOP-LCCOCUU','Insert','Se ha insertado una nueva \n         persona con el ID: 22','2026-02-13 14:31:17'),(36,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 23','2026-02-13 14:31:20'),(37,'tbb_personas','angel.banos@DESKTOP-LCCOCUU','Update','Se han actualizado los datos de la \n         persona con  ID: 7','2026-02-13 14:31:22'),(38,'tbb_personas','al.farias@DESKTOP-LCCOCUU','Insert','Se ha insertado una nueva \n         persona con el ID: 24','2026-02-13 14:32:53'),(39,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 25','2026-02-13 14:32:54'),(40,'tbb_personas','jennifer.bautista@10.10.62.28','Insert','Se ha insertado una nueva \n         persona con el ID: 26','2026-02-13 14:33:35'),(41,'tbb_personas','sayurid.bautista@10.10.62.2','Update','Se han actualizado los datos de la \n         persona con  ID: 20','2026-02-13 14:33:55'),(42,'tbb_personas_morales','arturo.garcia@10.10.62.24','Insert','Se ha insertado una nueva persona moral con el ID: 1','2026-02-20 13:54:07'),(43,'tbb_proveedores','arturo.garcia@10.10.62.24','Insert','Se ha insertado un nuevo proveedor con el ID: 1','2026-02-20 13:54:07'),(44,'tbb_transacciones_financieras','arturo.garcia@10.10.62.24','Insert','Se ha insertado una transacción con el ID: 1','2026-02-20 13:54:08'),(45,'tbc_equipamientos','arturo.garcia@10.10.62.24','Insert','Se ha insertado un nuevo equipamiento con el ID: 1','2026-02-20 13:54:08'),(46,'tbc_espacios','arturo.garcia@10.10.62.24','Insert','Se ha insertado un nuevo espacio con el ID: 1','2026-02-20 13:54:08'),(47,'tbd_inventario_equipamientos','arturo.garcia@10.10.62.24','Insert','Se ha insertado un nuevo registro en inventario con el ID: 1','2026-02-20 13:54:09'),(48,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 10','2026-03-05 15:35:31'),(49,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 16','2026-03-05 15:36:13'),(73,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 26','2026-03-05 15:38:36'),(74,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 25','2026-03-05 15:38:36'),(75,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 24','2026-03-05 15:38:36'),(76,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 23','2026-03-05 15:38:36'),(77,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 22','2026-03-05 15:38:36'),(78,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 21','2026-03-05 15:38:36'),(79,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 20','2026-03-05 15:38:36'),(80,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 19','2026-03-05 15:38:36'),(81,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 18','2026-03-05 15:38:36'),(82,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 17','2026-03-05 15:38:36'),(83,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 15','2026-03-05 15:38:36'),(84,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 14','2026-03-05 15:38:36'),(85,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 13','2026-03-05 15:38:37'),(86,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 12','2026-03-05 15:38:37'),(87,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 11','2026-03-05 15:38:37'),(88,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 9','2026-03-05 15:38:37'),(89,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 8','2026-03-05 15:38:37'),(90,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 7','2026-03-05 15:38:37'),(91,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 6','2026-03-05 15:38:37'),(92,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 5','2026-03-05 15:38:37'),(93,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 4','2026-03-05 15:38:37'),(94,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 3','2026-03-05 15:38:37'),(95,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 2','2026-03-05 15:38:37');
/*!40000 ALTER TABLE `tbi_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_monitoreo_ge`
--

DROP TABLE IF EXISTS `vista_monitoreo_ge`;
/*!50001 DROP VIEW IF EXISTS `vista_monitoreo_ge`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_monitoreo_ge` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `percepcion`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomenclatura`,
 1 AS `dueño`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sin_acceso`,
 1 AS `total_registros`,
 1 AS `tamanio_aproximado_MB`,
 1 AS `total_columnas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monitoreo_bd_md`
--

DROP TABLE IF EXISTS `vw_monitoreo_bd_md`;
/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_md`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monitoreo_bd_md` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `tipo_percepcion`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomeclatura`,
 1 AS `duenio`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sinacceso`,
 1 AS `Total_Registros`,
 1 AS `numero_columnas`,
 1 AS `tamano_mb`,
 1 AS `tamanio_aproximado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_muestra_triggers`
--

DROP TABLE IF EXISTS `vw_muestra_triggers`;
/*!50001 DROP VIEW IF EXISTS `vw_muestra_triggers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_muestra_triggers` AS SELECT 
 1 AS `TRIGGER_NAME`,
 1 AS `EVENT_MANIPULATION`,
 1 AS `EVENT_OBJECT_TABLE`,
 1 AS `ACTION_TIMING`,
 1 AS `ACTION_STATEMENT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_reporte_privilegios`
--

DROP TABLE IF EXISTS `vw_reporte_privilegios`;
/*!50001 DROP VIEW IF EXISTS `vw_reporte_privilegios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_reporte_privilegios` AS SELECT 
 1 AS `mensaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_roles_usuarios`
--

DROP TABLE IF EXISTS `vw_roles_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_roles_usuarios` AS SELECT 
 1 AS `usuario`,
 1 AS `host`,
 1 AS `roles_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hospital_matricula'
--

--
-- Dumping routines for database 'hospital_matricula'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_bandera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera`() RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE v_bandera BOOLEAN DEFAULT false;
    DECLARE v_pivote INT DEFAULT 0;
    
    SET v_pivote = fn_numero_aleatorio_rangos(1,100);
    IF v_pivote <=50 THEN
		SET v_bandera= true;
	ELSE 
		SET v_bandera=false;
	END IF;    
    
RETURN v_bandera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_bandera_porcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera_porcentaje`( v_porcentaje int) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	RETURN rand() < (v_porcentaje/100);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fecha_nacimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fecha_nacimiento`(fecha_inicio DATE, fecha_fin DATE) RETURNS date
    DETERMINISTIC
BEGIN
    DECLARE min_dias INT;
    DECLARE max_dias INT;
    DECLARE dias_aleatorios INT;
    DECLARE fecha_aleatoria DATE;

    SET min_dias = DATEDIFF(fecha_inicio, '1920-01-01');
    SET max_dias = DATEDIFF(fecha_fin, '1920-01-01');
    SET dias_aleatorios = fn_numero_aleatorio_rangos(min_dias, max_dias);
    SET fecha_aleatoria = DATE_ADD('1920-01-01', INTERVAL dias_aleatorios DAY);

    RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_grupo_sanguineo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_grupo_sanguineo`() RETURNS varchar(3) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
 
    DECLARE v_tipo VARCHAR(2);
    DECLARE v_rh CHAR(1);
    -- RH
    SET v_rh = IF(fn_genera_bandera_porcentaje(85), '+', '-');
    -- ABO con probabilidades condicionadas
    IF fn_genera_bandera_porcentaje(45) THEN
        SET v_tipo = 'O';
    ELSEIF bandera_probabilidad(64) THEN -- ajuste proporcional
        SET v_tipo = 'A';
    ELSEIF fn_genera_bandera_porcentaje(43) THEN
        SET v_tipo = 'B';
    ELSE
        SET v_tipo = 'AB';
    END IF;

    RETURN CONCAT(v_tipo, v_rh);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int, v_limite_superior INT) RETURNS int
    DETERMINISTIC
BEGIN
     DECLARE v_numero_generado INT 
     DEFAULT FLOOR(Rand()* (v_limite_superior-v_limite_inferior+1)+v_limite_inferior);
     SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_poblar_pacientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pacientes`(vcantidad int, vgenero varchar(3), vedad_minima int , vedad_maxima int,
vestatus_vida varchar(10), vtipo_edad varchar(10))
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE n_cantidad INT;
    DECLARE v_genero_efectivo VARCHAR(3);

    /* ============================
       HANDLER GLOBAL DE ERRORES
       ============================ */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error del sistema: Fallo no controlado en sp_poblar_pacientes. Revise parámetros o bitácora.';
    END;

    /* ============================
       REGLA DE NEGOCIO #1
       Validación de cantidad
       ============================ */

    IF vcantidad IS NULL OR TRIM(vcantidad) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RB001: La cantidad de pacientes no puede ser NULL o vacía';
    END IF;

    IF TRIM(vcantidad) NOT REGEXP '^[0-9]+$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RB001: La cantidad debe ser un entero positivo (sin decimales ni letras)';
    END IF;

    SET n_cantidad = CAST(TRIM(vcantidad) AS UNSIGNED);

    IF n_cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RB001: La cantidad debe ser mayor a 0';
    END IF;

    /* ============================
       REGLA DE NEGOCIO #2
       Validación de género
       ============================ */

    SET v_genero_efectivo = UPPER(TRIM(vgenero));

    IF vgenero IS NULL THEN
        SET v_genero_efectivo = 'RND';
    ELSEIF v_genero_efectivo NOT IN ('H', 'M', 'N/B') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RB002: Género inválido. Use H, M, N/B o NULL para mezcla aleatoria';
    END IF;

    /* ============================
       Mensaje inicial
       ============================ */
    SELECT CONCAT(
        'Validación exitosa. Se generarán ',
        n_cantidad,
        ' pacientes simulados.'
    ) AS mensaje_sistema;

    /* ============================
       CICLO DEMOSTRATIVO
       ============================ */
    WHILE i < n_cantidad DO

        -- Generación aleatoria si aplica
        IF v_genero_efectivo = 'RND' THEN
            SET @rnd = FLOOR(1 + RAND() * 3);
            CASE @rnd
                WHEN 1 THEN SET v_genero_efectivo = 'H';
                WHEN 2 THEN SET v_genero_efectivo = 'M';
                WHEN 3 THEN SET v_genero_efectivo = 'N/B';
            END CASE;
        END IF;

        SELECT CONCAT_WS(
            ' ',
            '🧪 Generando datos del paciente #',
            i + 1,
            '| Género:',
            v_genero_efectivo
        ) AS mensaje_proceso;

        SET i = i + 1;

        -- Reinicio de modo aleatorio
        IF vgenero IS NULL THEN
            SET v_genero_efectivo = 'RND';
        END IF;

    END WHILE;

    /* ============================
       Mensaje final
       ============================ */
    SELECT CONCAT(
        'Proceso finalizado. Total de pacientes generados: ',
        n_cantidad
    ) AS mensaje_final;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_monitoreo_ge`
--

/*!50001 DROP VIEW IF EXISTS `vista_monitoreo_ge`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_monitoreo_ge` AS with `percepciones` as (select `information_schema`.`t`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`t`.`TABLE_NAME` AS `TABLE_NAME`,(case when (`information_schema`.`t`.`TABLE_NAME` like '%ge_quejas_sugerencias%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%hr_departamentos%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%hr_personal_medico%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%hr_personal%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%hr_personas_fisicas%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%hr_personas%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%md_defunciones%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%md_diagnosticos%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%md_documentos_oficiales%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%md_expedientes_medicos%') then 'Mixta' when (`information_schema`.`t`.`TABLE_NAME` like '%md_nacimientos%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%md_notas_medicas%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%md_pacientes%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%md_tratamientos%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%mr_personas_morales%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%mr_proveedores%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%mr_transacciones_financieras%') then 'Mixta' when (`information_schema`.`t`.`TABLE_NAME` like '%ms_dietas%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ms_transfusiones_sanguineas%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%ms_traslados%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ms_valoraciones%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ph_recetas_medicas%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ge_areas%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ge_organos%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%ge_patologias_tipos%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ge_tipos_patologias%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ge_patologias%') then 'Mixta' when (`information_schema`.`t`.`TABLE_NAME` like '%ge_servicios%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%md_signos_vitales%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%mr_equipamientos%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%mr_espacios%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%ms_cirugias%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%ms_servicios_medicos%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ph_medicamentos%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%ge_aprobaciones%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ge_solicitudes_servicios%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%hr_horarios%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%md_padecimientos%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%mr_accesos%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%mr_inventario_equipamientos%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%ms_campanias%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ms_citas_medicas%') then 'Conceptual' when (`information_schema`.`t`.`TABLE_NAME` like '%ph_inventario_medicamentos%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%ph_lotes_medicamentos%') then 'Fisica' when (`information_schema`.`t`.`TABLE_NAME` like '%bitacora%') then 'Conceptual' end) AS `percepcion` from `information_schema`.`TABLES` `t` where ((`information_schema`.`t`.`TABLE_SCHEMA` = database()) and (`information_schema`.`t`.`TABLE_NAME` like 'tb%_%_%'))) select upper(replace(substr(`information_schema`.`t`.`TABLE_NAME`,(locate('_',`information_schema`.`t`.`TABLE_NAME`,(locate('_',`information_schema`.`t`.`TABLE_NAME`) + 1)) + 1)),'_',' ')) AS `entidad`,`information_schema`.`t`.`TABLE_NAME` AS `tabla`,(case when (exists(select 1 from (`information_schema`.`KEY_COLUMN_USAGE` `k` join `information_schema`.`COLUMNS` `c` on(((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`c`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`c`.`TABLE_NAME`) and (`information_schema`.`k`.`COLUMN_NAME` = `information_schema`.`c`.`COLUMN_NAME`)))) where ((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_KEY` = 'PRI') and (`information_schema`.`k`.`REFERENCED_TABLE_NAME` is not null))) and exists(select 1 from (`information_schema`.`KEY_COLUMN_USAGE` `k` join `information_schema`.`COLUMNS` `c` on(((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`c`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`c`.`TABLE_NAME`) and (`information_schema`.`k`.`COLUMN_NAME` = `information_schema`.`c`.`COLUMN_NAME`)))) where ((`information_schema`.`k`.`REFERENCED_TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`REFERENCED_TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_KEY` = 'PRI')))) then 'Super entidad & Sub entidad' when exists(select 1 from (`information_schema`.`KEY_COLUMN_USAGE` `k` join `information_schema`.`COLUMNS` `c` on(((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`c`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`c`.`TABLE_NAME`) and (`information_schema`.`k`.`COLUMN_NAME` = `information_schema`.`c`.`COLUMN_NAME`)))) where ((`information_schema`.`k`.`REFERENCED_TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`REFERENCED_TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_KEY` = 'PRI'))) then 'Super entidad' when exists(select 1 from (`information_schema`.`KEY_COLUMN_USAGE` `k` join `information_schema`.`COLUMNS` `c` on(((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`c`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`c`.`TABLE_NAME`) and (`information_schema`.`k`.`COLUMN_NAME` = `information_schema`.`c`.`COLUMN_NAME`)))) where ((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_KEY` = 'PRI') and (`information_schema`.`k`.`REFERENCED_TABLE_NAME` is not null))) then 'Sub entidad' else 'Generica' end) AS `tipo_jerarquia`,`p`.`percepcion` AS `percepcion`,(case when exists(select 1 from (`information_schema`.`KEY_COLUMN_USAGE` `k` join `information_schema`.`COLUMNS` `c` on(((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`k`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`k`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_NAME` = `information_schema`.`k`.`COLUMN_NAME`)))) where ((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_KEY` = 'PRI') and (`information_schema`.`k`.`REFERENCED_TABLE_NAME` is not null))) then 'Debil' else 'Fuerte' end) AS `tipo_dependencia`,(case when (`information_schema`.`t`.`TABLE_NAME` like 'tbc_%') then 'Catalogo' when (`information_schema`.`t`.`TABLE_NAME` like 'tbd_%') then 'Derivada' else 'Base' end) AS `tipo_nomenclatura`,(select `p`.`GRANTEE` from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union all select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` group by `p`.`GRANTEE` having ((sum((`p`.`PRIVILEGE_TYPE` = 'SELECT')) > 0) and (sum((`p`.`PRIVILEGE_TYPE` = 'INSERT')) > 0) and (sum((`p`.`PRIVILEGE_TYPE` = 'UPDATE')) > 0) and (sum((`p`.`PRIVILEGE_TYPE` = 'DELETE')) > 0) and (sum((`p`.`PRIVILEGE_TYPE` = 'ALTER')) > 0) and (sum((`p`.`PRIVILEGE_TYPE` = 'REFERENCES')) > 0)) limit 1) AS `dueño`,(select group_concat(`p`.`GRANTEE` separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union all select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` group by `p`.`GRANTEE` having ((sum((`p`.`PRIVILEGE_TYPE` = 'SELECT')) > 0) and (sum((`p`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE','DELETE'))) > 0) and (sum((`p`.`PRIVILEGE_TYPE` = 'ALTER')) = 0))) AS `editor`,(select group_concat(`p`.`GRANTEE` separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union all select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` group by `p`.`GRANTEE` having ((sum((`p`.`PRIVILEGE_TYPE` = 'SELECT')) > 0) and (sum((`p`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE','DELETE','ALTER','REFERENCES'))) = 0))) AS `lector`,(select group_concat(`r`.`role` separator ',') from (select '\'developer\'@\'%\'' AS `role` union select '\'ge_user\'@\'%\'' AS `'ge_user'@'%'` union select '\'hr_user\'@\'%\'' AS `'hr_user'@'%'` union select '\'md_user\'@\'%\'' AS `'md_user'@'%'` union select '\'mr_user\'@\'%\'' AS `'mr_user'@'%'` union select '\'ms_user\'@\'%\'' AS `'ms_user'@'%'` union select '\'ph_user\'@\'%\'' AS `'ph_user'@'%'` union select '\'medic\'@\'%\'' AS `'medic'@'%'` union select '\'nurse\'@\'%\'' AS `'nurse'@'%'` union select '\'patient\'@\'%\'' AS `'patient'@'%'`) `r` where `r`.`role` in (select distinct `p`.`GRANTEE` from (select `sp`.`GRANTEE` AS `GRANTEE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p`) is false) AS `sin_acceso`,`information_schema`.`t`.`TABLE_ROWS` AS `total_registros`,round((((`information_schema`.`t`.`DATA_LENGTH` + `information_schema`.`t`.`INDEX_LENGTH`) / 1024) / 1024),2) AS `tamanio_aproximado_MB`,(select count(0) from `information_schema`.`COLUMNS` `c` where ((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) AS `total_columnas` from (`information_schema`.`TABLES` `t` left join `percepciones` `p` on((`p`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) where ((`information_schema`.`t`.`TABLE_SCHEMA` = 'hospital_matricula') and (`information_schema`.`t`.`TABLE_NAME` like 'tb%_%_%')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monitoreo_bd_md`
--

/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_md`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monitoreo_bd_md` AS with `col_count` as (select `information_schema`.`columns`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`columns`.`TABLE_NAME` AS `TABLE_NAME`,count(0) AS `numero_columnas` from `information_schema`.`COLUMNS` where (`information_schema`.`columns`.`TABLE_SCHEMA` = database()) group by `information_schema`.`columns`.`TABLE_SCHEMA`,`information_schema`.`columns`.`TABLE_NAME`), `fk_tables` as (select distinct `information_schema`.`key_column_usage`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`key_column_usage`.`TABLE_NAME` AS `TABLE_NAME` from `information_schema`.`KEY_COLUMN_USAGE` where ((`information_schema`.`key_column_usage`.`TABLE_SCHEMA` = database()) and (`information_schema`.`key_column_usage`.`REFERENCED_TABLE_NAME` is not null))), `pk_cols` as (select `information_schema`.`kcu`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`kcu`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`kcu`.`COLUMN_NAME` AS `COLUMN_NAME` from (`information_schema`.`TABLE_CONSTRAINTS` `tc` join `information_schema`.`KEY_COLUMN_USAGE` `kcu` on(((`information_schema`.`kcu`.`CONSTRAINT_NAME` = `information_schema`.`tc`.`CONSTRAINT_NAME`) and (`information_schema`.`kcu`.`TABLE_SCHEMA` = `information_schema`.`tc`.`TABLE_SCHEMA`) and (`information_schema`.`kcu`.`TABLE_NAME` = `information_schema`.`tc`.`TABLE_NAME`)))) where ((`information_schema`.`tc`.`TABLE_SCHEMA` = database()) and (`information_schema`.`tc`.`CONSTRAINT_TYPE` = 'PRIMARY KEY'))), `fk_full` as (select `information_schema`.`key_column_usage`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`key_column_usage`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`key_column_usage`.`COLUMN_NAME` AS `COLUMN_NAME`,`information_schema`.`key_column_usage`.`REFERENCED_TABLE_NAME` AS `REFERENCED_TABLE_NAME` from `information_schema`.`KEY_COLUMN_USAGE` where ((`information_schema`.`key_column_usage`.`TABLE_SCHEMA` = database()) and (`information_schema`.`key_column_usage`.`REFERENCED_TABLE_NAME` is not null))), `sub_to_parent` as (select distinct `p`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`p`.`TABLE_NAME` AS `sub_tabla`,`f`.`REFERENCED_TABLE_NAME` AS `super_tabla` from (`pk_cols` `p` join `fk_full` `f` on(((`f`.`TABLE_SCHEMA` = `p`.`TABLE_SCHEMA`) and (`f`.`TABLE_NAME` = `p`.`TABLE_NAME`) and (`f`.`COLUMN_NAME` = `p`.`COLUMN_NAME`))))), `sub_entities` as (select distinct `sub_to_parent`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`sub_to_parent`.`sub_tabla` AS `tabla` from `sub_to_parent`), `super_entities` as (select distinct `sub_to_parent`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`sub_to_parent`.`super_tabla` AS `tabla` from `sub_to_parent`), `privs` as (select `information_schema`.`table_privileges`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` AS `TABLE_NAME`,replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') AS `rol`,`information_schema`.`table_privileges`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` where ((`information_schema`.`table_privileges`.`TABLE_SCHEMA` = database()) and (replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') <> 'developer'))), `priv_score` as (select `privs`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`privs`.`TABLE_NAME` AS `TABLE_NAME`,`privs`.`rol` AS `rol`,sum((`privs`.`PRIVILEGE_TYPE` = 'SELECT')) AS `p_select`,sum((`privs`.`PRIVILEGE_TYPE` = 'INSERT')) AS `p_insert`,sum((`privs`.`PRIVILEGE_TYPE` = 'UPDATE')) AS `p_update`,sum((`privs`.`PRIVILEGE_TYPE` = 'DELETE')) AS `p_delete`,sum((`privs`.`PRIVILEGE_TYPE` = 'ALTER')) AS `p_alter`,sum((`privs`.`PRIVILEGE_TYPE` = 'REFERENCES')) AS `p_references`,(((((sum((`privs`.`PRIVILEGE_TYPE` = 'SELECT')) + sum((`privs`.`PRIVILEGE_TYPE` = 'INSERT'))) + sum((`privs`.`PRIVILEGE_TYPE` = 'UPDATE'))) + sum((`privs`.`PRIVILEGE_TYPE` = 'DELETE'))) + sum((`privs`.`PRIVILEGE_TYPE` = 'ALTER'))) + sum((`privs`.`PRIVILEGE_TYPE` = 'REFERENCES'))) AS `key_priv_count` from `privs` where (`privs`.`PRIVILEGE_TYPE` in ('SELECT','INSERT','UPDATE','DELETE','ALTER','REFERENCES')) group by `privs`.`TABLE_SCHEMA`,`privs`.`TABLE_NAME`,`privs`.`rol`), `owners` as (select `priv_score`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`priv_score`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct `priv_score`.`rol` order by `priv_score`.`rol` ASC separator ',') AS `duenio` from `priv_score` where (`priv_score`.`key_priv_count` >= 5) group by `priv_score`.`TABLE_SCHEMA`,`priv_score`.`TABLE_NAME`), `editors` as (select `priv_score`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`priv_score`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct `priv_score`.`rol` order by `priv_score`.`rol` ASC separator ',') AS `editor` from `priv_score` where ((`priv_score`.`p_select` > 0) and (`priv_score`.`p_insert` > 0) and (`priv_score`.`p_update` > 0)) group by `priv_score`.`TABLE_SCHEMA`,`priv_score`.`TABLE_NAME`), `readers` as (select `priv_score`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`priv_score`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct `priv_score`.`rol` order by `priv_score`.`rol` ASC separator ',') AS `lector` from `priv_score` where (`priv_score`.`p_select` > 0) group by `priv_score`.`TABLE_SCHEMA`,`priv_score`.`TABLE_NAME`), `base_rows` as (select concat(upper(left(replace(replace(replace(replace(`information_schema`.`t`.`TABLE_NAME`,'tbb_',''),'tbc_',''),'tbd_',''),'tbi_',''),1)),lower(substr(replace(replace(replace(replace(`information_schema`.`t`.`TABLE_NAME`,'tbb_',''),'tbc_',''),'tbd_',''),'tbi_',''),2))) AS `entidad`,`information_schema`.`t`.`TABLE_NAME` AS `tabla`,(case when (`se`.`tabla` is not null) then 'Sub Entidad' when (`su`.`tabla` is not null) then 'Super Entidad' else 'Generica' end) AS `tipo_jerarquia`,(case when regexp_like(`information_schema`.`t`.`TABLE_NAME`,'equip|espac|org|medicamento|persona|paciente|personal') then 'Fisica' else 'Conceptual' end) AS `tipo_percepcion`,(case when (`fkt`.`TABLE_NAME` is not null) then 'Debil' else 'Fuerte' end) AS `tipo_dependencia`,(case when (`information_schema`.`t`.`TABLE_NAME` like 'tbc\\_%') then 'Catalogo' when (`information_schema`.`t`.`TABLE_NAME` like 'tbd\\_%') then 'Derivada' else 'Base' end) AS `tipo_nomeclatura`,coalesce(`o`.`duenio`,'N/A') AS `duenio`,coalesce(`e`.`editor`,'N/A') AS `editor`,coalesce(`r`.`lector`,'N/A') AS `lector`,(case when regexp_like(concat(',',coalesce(`r`.`lector`,''),','),',N/A,') then 'N/A' else 'N/A' end) AS `sinacceso`,coalesce(`information_schema`.`t`.`TABLE_ROWS`,0) AS `Total_Registros`,coalesce(`c`.`numero_columnas`,0) AS `numero_columnas`,round((((coalesce(`information_schema`.`t`.`DATA_LENGTH`,0) + coalesce(`information_schema`.`t`.`INDEX_LENGTH`,0)) / 1024) / 1024),2) AS `tamano_mb`,concat(round((((coalesce(`information_schema`.`t`.`DATA_LENGTH`,0) + coalesce(`information_schema`.`t`.`INDEX_LENGTH`,0)) / 1024) / 1024),2),' MB') AS `tamanio_aproximado` from (((((((`information_schema`.`TABLES` `t` left join `col_count` `c` on(((`c`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`c`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `fk_tables` `fkt` on(((`fkt`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`fkt`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `sub_entities` `se` on(((`se`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`se`.`tabla` = `information_schema`.`t`.`TABLE_NAME`)))) left join `super_entities` `su` on(((`su`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`su`.`tabla` = `information_schema`.`t`.`TABLE_NAME`)))) left join `owners` `o` on(((`o`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`o`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `editors` `e` on(((`e`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`e`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `readers` `r` on(((`r`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`r`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) where ((`information_schema`.`t`.`TABLE_SCHEMA` = database()) and (`information_schema`.`t`.`TABLE_TYPE` = 'BASE TABLE'))) select `base_rows`.`entidad` AS `entidad`,`base_rows`.`tabla` AS `tabla`,`base_rows`.`tipo_jerarquia` AS `tipo_jerarquia`,`base_rows`.`tipo_percepcion` AS `tipo_percepcion`,`base_rows`.`tipo_dependencia` AS `tipo_dependencia`,`base_rows`.`tipo_nomeclatura` AS `tipo_nomeclatura`,`base_rows`.`duenio` AS `duenio`,`base_rows`.`editor` AS `editor`,`base_rows`.`lector` AS `lector`,`base_rows`.`sinacceso` AS `sinacceso`,`base_rows`.`Total_Registros` AS `Total_Registros`,`base_rows`.`numero_columnas` AS `numero_columnas`,`base_rows`.`tamano_mb` AS `tamano_mb`,`base_rows`.`tamanio_aproximado` AS `tamanio_aproximado` from `base_rows` union all select 'TOTAL' AS `TOTAL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL`,sum(`base_rows`.`Total_Registros`) AS `SUM(Total_Registros)`,sum(`base_rows`.`numero_columnas`) AS `SUM(numero_columnas)`,round(sum(`base_rows`.`tamano_mb`),2) AS `ROUND(SUM(tamano_mb), 2)`,concat(round(sum(`base_rows`.`tamano_mb`),2),' MB') AS `CONCAT(ROUND(SUM(tamano_mb), 2), ' MB')` from `base_rows` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_muestra_triggers`
--

/*!50001 DROP VIEW IF EXISTS `vw_muestra_triggers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_muestra_triggers` AS select `information_schema`.`triggers`.`TRIGGER_NAME` AS `TRIGGER_NAME`,`information_schema`.`triggers`.`EVENT_MANIPULATION` AS `EVENT_MANIPULATION`,`information_schema`.`triggers`.`EVENT_OBJECT_TABLE` AS `EVENT_OBJECT_TABLE`,`information_schema`.`triggers`.`ACTION_TIMING` AS `ACTION_TIMING`,`information_schema`.`triggers`.`ACTION_STATEMENT` AS `ACTION_STATEMENT` from `information_schema`.`TRIGGERS` where (`information_schema`.`triggers`.`TRIGGER_SCHEMA` = 'hospital_matricula') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reporte_privilegios`
--

/*!50001 DROP VIEW IF EXISTS `vw_reporte_privilegios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reporte_privilegios` AS select `reporte`.`mensaje` AS `mensaje` from (select '-- GERENCIA --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'ge_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- RECURSOS HUMANOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'hr_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- RECURSOS MATERIALES --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'mr_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- REGISTROS MEDICOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'md_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- SERVICIOS MEDICOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'ms_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- FARMACIA --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'ph_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- DEVELOPER --' AS `mensaje` union all select concat('GRANT ',group_concat(`sp`.`PRIVILEGE_TYPE` order by `sp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`sp`.`TABLE_SCHEMA`,'.* TO ',`sp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where ((`sp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`sp`.`GRANTEE` like '\'developer\'@%')) group by `sp`.`GRANTEE`,`sp`.`TABLE_SCHEMA`) `reporte` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_roles_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_roles_usuarios` AS select `u`.`User` AS `usuario`,`u`.`Host` AS `host`,ifnull(group_concat(concat(`r`.`TO_USER`,'@',convert(`r`.`TO_HOST` using utf8mb3)) order by `r`.`TO_USER` ASC separator ', '),'SIN ROLES') AS `roles_asignados` from (`mysql`.`user` `u` left join `mysql`.`role_edges` `r` on(((`u`.`User` = `r`.`FROM_USER`) and (`u`.`Host` = `r`.`FROM_HOST`)))) where ((`u`.`User` like '%user%') or (`u`.`User` = 'developer')) group by `u`.`User`,`u`.`Host` order by `u`.`User`,`u`.`Host` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-05 16:29:20
