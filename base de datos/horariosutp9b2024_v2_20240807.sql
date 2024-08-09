-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: horariosutp9b2024
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB
create database horariosrev2024;
use horariosrev2024;
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
-- Table structure for table `asignacioncuatrimestral`
--

DROP TABLE IF EXISTS `asignacioncuatrimestral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacioncuatrimestral` (
  `idAsignacion` int(11) NOT NULL AUTO_INCREMENT,
  `GrupoID` int(11) NOT NULL,
  `DocenteID` int(11) NOT NULL,
  `AsignaturaID` int(11) NOT NULL,
  PRIMARY KEY (`idAsignacion`),
  KEY `asignaciongrupo_idx` (`GrupoID`),
  KEY `asignaciondocente_idx` (`DocenteID`),
  KEY `asignacionasignatura_idx` (`AsignaturaID`),
  CONSTRAINT `asignacionasignatura` FOREIGN KEY (`AsignaturaID`) REFERENCES `asignaturas` (`idasignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `asignaciondocente` FOREIGN KEY (`DocenteID`) REFERENCES `docentes` (`idDocente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `asignaciongrupo` FOREIGN KEY (`GrupoID`) REFERENCES `grupos` (`Idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacioncuatrimestral`
--

LOCK TABLES `asignacioncuatrimestral` WRITE;
/*!40000 ALTER TABLE `asignacioncuatrimestral` DISABLE KEYS */;
INSERT INTO `asignacioncuatrimestral` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,2,1,1),(5,4,5,4),(6,5,2,4),(7,5,7,5);
/*!40000 ALTER TABLE `asignacioncuatrimestral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaturas` (
  `idasignatura` int(11) NOT NULL AUTO_INCREMENT,
  `NomAsignatura` varchar(255) NOT NULL,
  `DescripcionAsig` varchar(255) NOT NULL,
  `HrsxSemana` int(11) NOT NULL,
  `Cuatrimestre` int(11) NOT NULL,
  PRIMARY KEY (`idasignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (1,'Aplicaciones de IoT','El alumno desarrollará aplicaciones de IoT mediante la',6,5),(2,'Aplicaciones Web para I 4.0','El alumno desarrollará aplicaciones Web empresariales',5,5),(3,'Desarrollo móvil multiplataforma','El alumno desarrollará aplicaciones móviles',7,5),(4,'Bases de Datos para Aplicaciones','consultas avanzadas',7,3),(5,'Aplicaciones Web','desarrollo',6,3);
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulas` (
  `idAula` int(11) NOT NULL AUTO_INCREMENT,
  `NombAula` varchar(40) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `EdificioID` int(11) NOT NULL,
  PRIMARY KEY (`idAula`),
  KEY `aulaEdificios_idx` (`EdificioID`),
  CONSTRAINT `aulaEdificios` FOREIGN KEY (`EdificioID`) REFERENCES `edificios` (`idEdificio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (1,'d5-211','Laboratorio de Software',1),(2,'d5-203','Sala de Juntas',1),(3,'k5-101','Laboratorio de M´viles',2),(4,'k5-102','Laboratorio POO',2),(5,'k5-107','Laboratorio de MAC',2),(6,'d5-206','Salón de clases',1),(7,'d5-205','Salón de clases',1),(8,'d5-202','Salón de clases',1),(9,'k5-108','Laboratorio Web',2),(10,'d5-Electronica','Laboratorio de IOT y electrónica',1),(11,'d5-209','SAlón de clases',1);
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diasemana`
--

DROP TABLE IF EXISTS `diasemana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diasemana` (
  `iddia` int(11) NOT NULL AUTO_INCREMENT,
  `NomDia` varchar(15) NOT NULL,
  PRIMARY KEY (`iddia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diasemana`
--

LOCK TABLES `diasemana` WRITE;
/*!40000 ALTER TABLE `diasemana` DISABLE KEYS */;
INSERT INTO `diasemana` VALUES (1,'Lunes'),(2,'Martes'),(3,'Miércoles'),(4,'Jueves'),(5,'Viernes'),(6,'Sabado');
/*!40000 ALTER TABLE `diasemana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisiones`
--

DROP TABLE IF EXISTS `divisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisiones` (
  `Id_Division` int(11) NOT NULL AUTO_INCREMENT,
  `NombreDivision` varchar(150) NOT NULL,
  `DescripcionDiv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Division`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisiones`
--

LOCK TABLES `divisiones` WRITE;
/*!40000 ALTER TABLE `divisiones` DISABLE KEYS */;
INSERT INTO `divisiones` VALUES (1,'Tecnologías de la Información y Comunicación','DEsarrollo de Software e infraestructura en Redes  y telecomunicaciones');
/*!40000 ALTER TABLE `divisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docentes` (
  `idDocente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `A_Paterno` varchar(150) NOT NULL,
  `A_Materno` varchar(150) NOT NULL,
  `Extra` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idDocente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'ANTONIO','CID','GARCI',NULL),(2,'GUILLERMO','SANCHEZ','FLORES',NULL),(3,'PAULO DANIEL','VAZQUEZ','MORA',NULL),(4,'ENRIQUE','VILLA','RUANO',NULL),(5,'MARIA DEL ROSARIO','SANCHEZ','BAÑUELOS',NULL),(6,'JOSE RUBEN','CABRERA','GUTIERREZ',''),(7,'NORMA ANGELICA','ROLDAN','OROPEZA','');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificios`
--

DROP TABLE IF EXISTS `edificios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edificios` (
  `idEdificio` int(11) NOT NULL AUTO_INCREMENT,
  `NombreEdificio` varchar(45) NOT NULL,
  `DescripcionEdif` varchar(255) DEFAULT NULL,
  `DivisionID` int(11) NOT NULL,
  PRIMARY KEY (`idEdificio`),
  KEY `edificiodivisiones_idx` (`DivisionID`),
  CONSTRAINT `edificiodivisiones` FOREIGN KEY (`DivisionID`) REFERENCES `divisiones` (`Id_Division`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificios`
--

LOCK TABLES `edificios` WRITE;
/*!40000 ALTER TABLE `edificios` DISABLE KEYS */;
INSERT INTO `edificios` VALUES (1,'D5','Salones y 4 laboratorios',1),(2,'K5','Laboratorios de Software',1);
/*!40000 ALTER TABLE `edificios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidades` (
  `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `NombreEsp` varchar(200) NOT NULL,
  `DescripcionEsp` varchar(255) DEFAULT NULL,
  `DivisionID` int(11) NOT NULL,
  `gradoEspecialidad` int(11) NOT NULL,
  PRIMARY KEY (`idEspecialidad`),
  KEY `especialidadesDivisiones_idx` (`DivisionID`),
  KEY `ultima` (`gradoEspecialidad`),
  CONSTRAINT `especialidadesDivisiones` FOREIGN KEY (`DivisionID`) REFERENCES `divisiones` (`Id_Division`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ultima` FOREIGN KEY (`gradoEspecialidad`) REFERENCES `gradosespecialidad` (`idgradosespecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'TSU en Desarrollo de Software Multiplataforma 2018','Desarrollar soluciones tecnológicas para entornos Web',1,1),(2,'TSU en Infraestructura de Redes Digitales 2018','Implmentar servicios de red con esquema básico de seguridad',1,1),(3,'ING en Desarrollo y GEstión de Software',NULL,1,2);
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradosespecialidad`
--

DROP TABLE IF EXISTS `gradosespecialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradosespecialidad` (
  `idgradosespecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `grado` varchar(100) NOT NULL,
  `extra` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idgradosespecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradosespecialidad`
--

LOCK TABLES `gradosespecialidad` WRITE;
/*!40000 ALTER TABLE `gradosespecialidad` DISABLE KEYS */;
INSERT INTO `gradosespecialidad` VALUES (1,'TSU','2018'),(2,'ING',NULL),(3,'LIC',NULL),(4,'MAESTRÍA',NULL);
/*!40000 ALTER TABLE `gradosespecialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `Idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `NomGrupo` varchar(2) NOT NULL,
  `Cuatrimestre` int(11) NOT NULL,
  `Turno` varchar(60) NOT NULL,
  `PeriodoID` int(11) NOT NULL,
  `AulaID` int(11) NOT NULL,
  `TutorID` int(11) NOT NULL,
  `EspecialidadID` int(11) NOT NULL,
  PRIMARY KEY (`Idgrupo`),
  KEY `grupoPeriodo_idx` (`PeriodoID`),
  KEY `grupoaula_idx` (`AulaID`),
  KEY `grupotutor_idx` (`TutorID`),
  KEY `grupoespecialidad_idx` (`EspecialidadID`),
  CONSTRAINT `grupoPeriodo` FOREIGN KEY (`PeriodoID`) REFERENCES `periodos` (`idPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `grupoaula` FOREIGN KEY (`AulaID`) REFERENCES `aulas` (`idAula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `grupoespecialidad` FOREIGN KEY (`EspecialidadID`) REFERENCES `especialidades` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `grupotutor` FOREIGN KEY (`TutorID`) REFERENCES `docentes` (`idDocente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'D',5,'MATUTINO',1,7,2,1),(2,'C',5,'MATUTINO',1,8,4,1),(3,'B',9,'MATUTINO',2,11,5,3),(4,'G',3,'MATUTINO',2,1,6,1),(5,'C',3,'MATUTINO',2,8,7,1);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `AsignacionID` int(11) NOT NULL,
  `DiaID` int(11) NOT NULL,
  `HrInicio` time NOT NULL,
  `HrFinal` time NOT NULL,
  `AulaID` int(11) NOT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `horarioasignacion_idx` (`AsignacionID`),
  KEY `horariodia_idx` (`DiaID`),
  KEY `horarioaula_idx` (`AulaID`),
  CONSTRAINT `horarioasignacion` FOREIGN KEY (`AsignacionID`) REFERENCES `asignacioncuatrimestral` (`idAsignacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `horarioaula` FOREIGN KEY (`AulaID`) REFERENCES `aulas` (`idAula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `horariodia` FOREIGN KEY (`DiaID`) REFERENCES `diasemana` (`iddia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,2,2,'07:00:00','09:00:00',1),(2,2,3,'07:00:00','09:00:00',1),(3,2,5,'13:00:00','14:00:00',9),(4,1,1,'07:00:00','09:00:00',10),(5,1,2,'11:00:00','12:00:00',10),(6,1,3,'11:00:00','12:00:00',10),(7,1,5,'07:00:00','09:00:00',7),(8,5,1,'12:00:00','14:00:00',4),(9,1,3,'13:00:00','14:00:00',6),(10,5,4,'12:00:00','14:00:00',3),(11,5,5,'12:00:00','14:00:00',3),(12,6,1,'09:00:00','11:00:00',3),(13,6,2,'07:00:00','09:00:00',3),(14,6,4,'07:00:00','09:00:00',9),(15,6,5,'10:00:00','11:00:00',9),(16,7,1,'13:00:00','14:00:00',9);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodos` (
  `idPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `NombrePeriodo` varchar(75) NOT NULL,
  `P_inicio` date NOT NULL,
  `P_Fin` date NOT NULL,
  `Año` int(11) NOT NULL,
  `Extra` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idPeriodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (1,'Enero - Abril','2024-01-03','2024-04-26',2024,NULL),(2,'Mayo - Agosto','2024-05-02','2024-08-28',2024,NULL),(3,'Enero - Abril','2023-02-01','2023-04-25',2023,NULL);
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroasistencia`
--

DROP TABLE IF EXISTS `registroasistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registroasistencia` (
  `idRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `HorarioID` int(11) NOT NULL,
  `Tema` varchar(255) NOT NULL,
  `TotalAlumnos` int(11) NOT NULL,
  `Observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRegistro`),
  KEY `asistenciahorario_idx` (`HorarioID`),
  CONSTRAINT `asistenciahorario` FOREIGN KEY (`HorarioID`) REFERENCES `horario` (`idHorario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroasistencia`
--

LOCK TABLES `registroasistencia` WRITE;
/*!40000 ALTER TABLE `registroasistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroasistencia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-07  8:38:57
select * from edificios;
select * from asignaturas;
select * from horario;
select * from asignacioncuatrimestral;
select * from docentes;
select * from periodos;
select * from grupos;

set @perini=3;
set @perfin=1;
set @idprof=2;

select @fechaini:=P_inicio
From periodos where idPeriodo=@perini;

select @fechafin:=P_inicio
From periodos where idPeriodo=@perfin;

select g.Cuatrimestre,g.NomGrupo, g.Turno,
p.NombrePeriodo , p.Año, asig.DocenteID,d.Nombre, d.A_Paterno,d.A_Materno,
mat.NomAsignatura
from grupos as g
inner join periodos as p
on g.PeriodoID=p.idPeriodo
     inner join asignacioncuatrimestral as asig
     on g.Idgrupo=asig.GrupoID
             inner join docentes as d
     on asig.DocenteID=d.idDocente
             inner join asignaturas as mat
    on asig.AsignaturaID=mat.idasignatura
where (p.P_inicio between @fechaini and @fechafin)
and asig.DocenteID=@idprof;


