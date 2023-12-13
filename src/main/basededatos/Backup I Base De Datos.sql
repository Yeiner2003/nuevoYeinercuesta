-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: new_tienda
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idcargo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Admin',1),(2,'Cliente',1),(3,'Usuario',1);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` int NOT NULL,
  `idsexo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `idcliente_sexo_idx` (`idsexo`),
  CONSTRAINT `idcliente_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (123,1,'yeiner','312','yeiner@gmail.com','sur',1,'2023-10-29','Cedula');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_com_prod`
--

DROP TABLE IF EXISTS `fact_com_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_com_prod` (
  `idfact_com_prod` int NOT NULL AUTO_INCREMENT,
  `idfact_com` int NOT NULL,
  `idpro` int NOT NULL,
  `cantidad_com` int NOT NULL,
  `pre_uni` int NOT NULL,
  `pre_total` int NOT NULL,
  PRIMARY KEY (`idfact_com_prod`),
  KEY `idproducto_idx` (`idpro`),
  KEY `idfact_comp_idx` (`idfact_com`),
  CONSTRAINT `idfact_comp` FOREIGN KEY (`idfact_com`) REFERENCES `fact_comp` (`idfact_comp`),
  CONSTRAINT `idpro` FOREIGN KEY (`idpro`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_com_prod`
--

LOCK TABLES `fact_com_prod` WRITE;
/*!40000 ALTER TABLE `fact_com_prod` DISABLE KEYS */;
INSERT INTO `fact_com_prod` VALUES (24,16,13,122,122,14884),(25,13,10,8989,7878,70815342),(26,13,13,1,1,1),(27,13,12,800,111,88800),(28,18,12,5,10000,50000),(29,18,12,5,10000,50000),(30,18,17,5,10000,50000),(31,13,13,2,1000,2000),(32,17,13,2,1000,2000),(33,19,17,9999,9999,99980001),(36,13,10,3,29484,88452),(37,29,10,3,4253,12759),(38,28,10,3,3445,10335);
/*!40000 ALTER TABLE `fact_com_prod` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Automatizacion_Total_Compra` BEFORE INSERT ON `fact_com_prod` FOR EACH ROW BEGIN
set new.pre_total = new.cantidad_com * new.pre_uni;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Automatizacion_Cantidad_Precio` AFTER INSERT ON `fact_com_prod` FOR EACH ROW BEGIN
update producto inner join fact_com_prod on fact_com_prod.idpro = producto.idproducto set cantidad = cantidad + new.cantidad_com, precio = new.pre_uni+ (new.pre_uni*0.20) where idpro = producto.idproducto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fact_comp`
--

DROP TABLE IF EXISTS `fact_comp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_comp` (
  `idfact_comp` int NOT NULL AUTO_INCREMENT,
  `idProveedor` int NOT NULL,
  `idusu` int NOT NULL,
  `fecha` date NOT NULL,
  `total_comp` int NOT NULL,
  `descuento` float DEFAULT NULL,
  `tipodepago` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `numerodecomprobante` int NOT NULL,
  PRIMARY KEY (`idfact_comp`),
  KEY `idProveedor_idx` (`idProveedor`),
  KEY `idusuario_idx` (`idusu`),
  CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusu` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_comp`
--

LOCK TABLES `fact_comp` WRITE;
/*!40000 ALTER TABLE `fact_comp` DISABLE KEYS */;
INSERT INTO `fact_comp` VALUES (13,1,2,'2005-12-12',1,1,'Tarjeta',1,1),(14,1,3,'2023-11-19',1,1,'Efectivo',1,1),(15,1,3,'2023-11-19',1,1,'Efectivo',1,1),(16,1,3,'2023-11-19',1,1,'Tarjeta de Credito',1,1),(17,1,3,'2023-11-19',1,1,'Tarjeta de Credito',0,1),(18,1,5,'2023-11-22',0,0,'Tarjeta de Credito',1,0),(19,1,4,'2023-11-22',0,0,'Tarjeta de Credito',1,1),(20,1,5,'2023-11-22',0,0.19,'Tarjeta de Credito',1,0),(21,1,5,'2023-11-22',0,0.19,'Efectivo',1,1),(22,1,4,'2023-11-24',0,0.19,'Tarjeta de Credito',1,2),(23,1,5,'2023-11-24',0,0.19,'Efectivo',0,12),(24,3,5,'2023-11-24',0,0.19,'Tarjeta de Credito',1,0),(25,3,2,'2023-11-24',0,0.19,'Efectivo',1,0),(26,3,3,'2023-11-30',0,0.19,'Tarjeta de Credito',1,2),(28,3,1,'2023-11-30',0,0.19,'Moneda',1,11),(29,2,1,'2023-12-07',0,0.19,'Tarjeta de Credito',1,1234);
/*!40000 ALTER TABLE `fact_comp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `tipopago` varchar(45) NOT NULL,
  `impuesto` float NOT NULL,
  `totalfactura` float NOT NULL,
  `cedula` int NOT NULL,
  `idusuario` int NOT NULL,
  `condicion` tinyint NOT NULL,
  `numerodecomprobante` int NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `cedula_idx` (`cedula`),
  KEY `idusuario_idx` (`idusuario`),
  CONSTRAINT `cedula` FOREIGN KEY (`cedula`) REFERENCES `cliente` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2001-10-12','Efectivo',0.19,1,123,1,1,0),(7,'2023-11-29','tarjeta de credito',0.19,1,123,1,1,0);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mostrar_cargo`
--

DROP TABLE IF EXISTS `mostrar_cargo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cargo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cargo` AS SELECT 
 1 AS `idcargo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_cliente`
--

DROP TABLE IF EXISTS `mostrar_cliente`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cliente` AS SELECT 
 1 AS `Cedula`,
 1 AS `Genero`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `Direccion`,
 1 AS `FechaDeNacimiento`,
 1 AS `TipoDeDocumento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_detalle_factura`
--

DROP TABLE IF EXISTS `mostrar_detalle_factura`;
/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_detalle_factura` AS SELECT 
 1 AS `IdentificadorFacturaCompra`,
 1 AS `Producto`,
 1 AS `CantidadComprada`,
 1 AS `PrecioUnitario`,
 1 AS `PrecioTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_factura_compra`
--

DROP TABLE IF EXISTS `mostrar_factura_compra`;
/*!50001 DROP VIEW IF EXISTS `mostrar_factura_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_factura_compra` AS SELECT 
 1 AS `Identificador`,
 1 AS `IdProveedor`,
 1 AS `IdUsuario`,
 1 AS `Fecha`,
 1 AS `TotalCompra`,
 1 AS `Descuento`,
 1 AS `TipoDePago`,
 1 AS `NumeroDeComprobante`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_producto`
--

DROP TABLE IF EXISTS `mostrar_producto`;
/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_producto` AS SELECT 
 1 AS `Identificador`,
 1 AS `NombreDelProducto`,
 1 AS `DescripcionDelProducto`,
 1 AS `Existencias`,
 1 AS `ImagenDelProducto`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_proveedor`
--

DROP TABLE IF EXISTS `mostrar_proveedor`;
/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_proveedor` AS SELECT 
 1 AS `Identificacion`,
 1 AS `Genero`,
 1 AS `TipoDeDocumento`,
 1 AS `Nombre`,
 1 AS `Correo`,
 1 AS `Telefono`,
 1 AS `Direccion`,
 1 AS `TipoDePersona`,
 1 AS `FechaDeNacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_sexo`
--

DROP TABLE IF EXISTS `mostrar_sexo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_sexo` AS SELECT 
 1 AS `idsexo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_usuario`
--

DROP TABLE IF EXISTS `mostrar_usuario`;
/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_usuario` AS SELECT 
 1 AS `Identificador`,
 1 AS `Genero`,
 1 AS `Cargo`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `Direccion`,
 1 AS `FechaDeNacimiento`,
 1 AS `TipoDeDocumento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_venta`
--

DROP TABLE IF EXISTS `mostrar_venta`;
/*!50001 DROP VIEW IF EXISTS `mostrar_venta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_venta` AS SELECT 
 1 AS `Identificador`,
 1 AS `Fecha`,
 1 AS `TipoDePago`,
 1 AS `Impuesto`,
 1 AS `TotalFactura`,
 1 AS `Cedula`,
 1 AS `IDUsuario`,
 1 AS `NumeroDeComprobante`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `imagen` longblob,
  `precio` float NOT NULL,
  `condicion` tinyint NOT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (10,'TV','Funciona',2345543,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0\�>a\�\0\0\0sBIT|d�\0\0\0	pHYs\0\0�\0\0���\�I\0\0\0tEXtSoftware\0www.inkscape.org�\�<\Z\0\0\n�IDATx�\�[l\����������\��b�H��\�L�\�4)�	+�b�V)��m\��\�(R��ȥ\�C�궲\r/\�l\�\0V.NDHR����IⰴiLU��Vxm�>̚R\�힝�\�9���0s.�9\�眙9;��|�+�\0�\\\0�\�\�?�G���_�\�\\W��\�j\�y�Ny\���i%��\0���ş�N�µ�Q8b=�1�;�\����;���\�ׁ~�\��7Ɓ\\\�\niҸ\��sq\�\\��Ṭx���Ο�Y\�E`q1OX�?*���\�o�W�%E<y-�!\��МG\�ρW�Я�ǀ˹c1��ro\r� pku\���<�*,�B�s�\n��w�S��\�\\N\�|X�G}\n\�l؟E\�oH���@_�L��\�4+$�\�7�po4�\08\�@ǯ��!�tb�\�_\"E\�;г��Z\�\�k\�\�pgQ����\�}��=�n\�<\��s�\�{��\��7�\��9�\�&_x\'�|x9�\�J���ݻ\��2�\��ߋ�\�\\Z;,\�|M�\�f9\n�o1�q��\���\�	|�@fC�3��VT\�,�O\��\�\"��ڝ��\�sy\rx�\�]\0~��\�r�#��N�C�XjwYˊZ\�n\nj\\=E\�\�Bq6��B�+XV�\rS\�E_4}��X\�$pH�?Ε\�׀?�I.w�\0\�\�I.WC�B6\0\�$�{\�@�Pآ��?A7\�1 T\���K\�w�[��\�]܅�\�\\\��W\�3!�\�Y\�r}�\�ik�`v�(;����iu\�,���,D�O���\�:ǁ\�\����h���?�N)��\�ڬSf�\�U>��)�啫�B�����C2ʪ���g2\�mYmmm����}T__�]\����\�C�=�\�]\�\�÷��S]]��ꫯ� �\Z���[�٬���nz\"8�I\"-����,V�^mX��i���\�vY===B\�4\��֮]+M�\�w\�\�z�\�\�|�\�y\����7\�|SZCֵg\�\�\�\�ٳǰ���Ai�_z\�%� \�G~�ݮ8\Z�����Kk\�9���E8�Vϲe\�DwwwA\�UWW_+������طo��F�^\�u\r��U#\�\�q�m\�FE��oDE�Q֭[G$R�}|�\�\'\\�z�5kְlYa�\�?~��n�IJyF\\�|��\�{���	)\�\�\�̐L&9r\�t�2��oz4|�599I8�\"J\�.���V�)\r}(0D\�\�\n��i\�Ϥ�sU���\���Ä\�a\��~���kvӅB91==-���\���G\�\�\�^˔�U�\�\0�v\�l�ݻw{-S*V\��5@&�����\�\�I\�t�H�s\�αdI\�}\�oA\�\Z ǉ\',;�˾\'N��\�\�\0\�\�\�EI[\�\�\0�\�f�����N`�j\�*n��v\�tw\�q�V�rA�?�4Mc\�޽���/^\�޽{]T\�=�1\0@ss3\�d�h4:\�X,#�L�~�z�yG`.�\'�Ns�\�AN�<	@SS�D�\�\�Z��\�\�\�20�\�>�\�e���p��o\r�\�fٹs\'���h��W466�\�O�\�d\�=22B<\'SWWGWW�}f��FGGy衇���&�\�\�w\�=����7o������M\�\�\�ڪ�\�O?�Xl^555bdd\�2��S�D]]ݼ�7\�|�-�ic�}�g���~\�;`�ɤ����a��\�\�\�\r�oٲ�ЦqLI\Z`��\�\�\r�c\�[u/�靋P($\�\�a\�t:-B��a�h4*��lc\�.�]xE6�\�Ʈ;|��\��#G��\��#�4@ss>\�6gÆ\r�\�\�{��KF\r�\r�\�\�{lip\�M\�\�Ӣ��Y\��\�\�\�b{�g__�iY�PH\\�pa^��/�\�\�JӼN��(\�\�?!\�\�Ԕصk�hll̻\�W�X!�z\�)�\�dl\�{\�\�%ˎ\�\�흗���\�\�8f\�bQ�0\�\r��6m2����u^��7�\�ٴi�mN�j/_�����\����c\�H�\�\���t\�\��NAez�2�\�\�q*+�_�\�f\Z\Z����C����2L\n�hoo��Q\�\0�\�,�D�_�[��[ZZ|�\�D�\0�\�@)�P�;��v�\�\�;>>NCC�\�\�\�\�ۋ�\�\�0M(bll̳���\�o\�07\r��4���PS�)v���\�~\�4\�\�?,S�t\�`��i���P�B\�\�Հ~�A��BV�~^�ϡ�\0��0���\n&\�i��P�E>Cy)���\0[8��2����\�t\Z(�\��l\�dH/�\�\�`�Ӏ��PS�4\�N�4��2�#\�\�4�C	N�H\��}\�h���x���6�CN---y�A,���\��xGG��:\�.%�+xddD\�\�\�\�\�Y[[+N�>]��S������W}}�8s\�L\�\�w�U����\�\�ٳ���SD\"�D\�֭[]\��9R��H$b��\�b��墫�K�R)\�\�w�U��\�\Z@ጲ[(\�p��2@�Q8\�\0G \�(e���p��2@�Q8\�\0G \�(�E�\�Fw;?���\'6�nj104\Z�x�\�GI$���Y�\\�r�T*��i�\\����*�%Ieff���~�dc\Z0�_�/�,�)ʕ!\rg��\�(\�\�K\�\�\��	\�Ao�(\\\�g��\���\�\�WQ\�\�T\0/�@��\�\��xC\���>�Bn�\��p�\�\�F\�6�\�#(��\���\�\��^Z�F�7��/���{C剰8�6Q\��2@�Q8\�\0G \�(e���p��2@�Q8\�\0\�\�O�?͒�X\�\n�u��\�X�g\rx\rˊW	\�S\�BI\�}�ɎmR[H~�\�\�\\)�Z�B�\�\0\n���y-��Z@)Q����8�;\'�B�/�/��\�K\�6�<�*I{�\".\��\0\0\0\0IEND�B`�',12345,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\monitor-de-tv (1).png'),(11,'teclado','Funciona',34567,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n\n\Z \"\"\Z�\�\0C\r\r��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0A\0\0\0\0\0\0!1Q\"Aaq2���	$B�#3��\�%RSTdr���\���\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\01\0\0\0\0\0\0\0!1AQaq��\"2���#\�3BS\���\�\0\0\0?\0\�\�\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�+ޮ��\�\�\�K�\�,�)���\�q�\�J�\�W��V��~9\�	Q�\�qDZ�\0h�L\�a2���\"�}��S��\��� p�x\�\��\���\�\�?\�6���@4[�U�r\�p\�P,\�?�*[���\�\��]\�L\rq��v\r]XQ��\�i�s�qN\�\�\�O�.�c�4V~���@@@��\�{`�\�f�mɁy��>�Iq��G�۬����Ql�\�\��JԦA�ϼHP=��l\�\'��\�F�\�/i\��$��\��<x,\�+\'r�ī�1��jeuG�9N\n\�\�͎\�i\�\�B���ȏ%\����_\�\�$\���#�\'\��G#�\�\�\��Y\\mjg\�\�4YRrx<�\�/�tO��ͥ�X�\�sV��7Ku^�˗A�\r�\�T���#\�\�=\�\'��f��E�\�\�\�~�\�=k�{��*\�z\Zg\�	-6טw!\\�\�I\�\�zťv�\�\�\�*J��@@\�\�/\���}\�B\�Dy	R��\r�\�\�Ct�� \�%�9�k�\"$�y���\�RR�\�\n��ʡ\�S\�\�,Qx�\r�6$���m��\��V�u̌�ҳ�	��83O�:3\�ĸ\�\�\�\�\n[#z�ܐS�x\�\�槇�K]�ɏ�O�s\'�\�\�_;Йv�dw\"\\\�S\�(,�RBAU\�~\�ھ���rE\�6=>\nR]\�?Q�E\�}<�B�.K\�}\�m\'\�@9kZ����\0>�\��eQTz��B#\�\Z\�\�Ovߴ:�\0\nB���>�Ǣr��?\��\0+ϽJI�h��\�&�@@@xL�\�ز\�jDg�P\�O -I\�\nO}h\nOY�A\�6�.��6�D�L�3�)�A�\�\��\�^\�6�-��P\�FJc]Y-+\�淐\n�\"�cXt��\Z�x\��\�\�2a�&��Ԗ�>�*Tg,0�\�B�j9���\�\�\�;\�yp�>Z�\nA\�`\�c�\��\n�1\\3����0���]l�-M6\�Ȗ\�O<�b�-�@�\�?*\�6g�\�7Jr�>Mꍊ���hè��\���ڵ������\�p~I5�z\�\�\�}\r�(�(�(�(��(B�����N0>�\ZwM�N\�.w�/\��*:\�@/;���@\'zp��8g���u��}�\\�I�\�\'ۥ\��]�\�f6V����oJ�\�@J�d�־�J�˺.�.�4\�+m*J[a�H\�*R�\��O=\�\r��\n\0�\n\0�\n\"\�\�6\0M\��m��\�˔\�_\�\"�[�u�@]\�\�Z�j\�\\�\������@�\���2\\uU�Υ�}\�U��^���~怯��Vt��?PB�|isd��\�\nm�J	\�v��\�\�Nu�G\�\�d��}\��!��\r�\�\\ۀ@YHX}\�*bL�\0�T-\�V\�#\�O��\�\�Ac.��`\�\�b�L\�/2-Ǐ)�\�\��6��{�6�F3Ae�BB���\�-�~�]�1-�7y\�\�KH\�{\r\� g�����\�ŕ\�,�r��Ң�\�ec)I^2q\� ���W�\�zn3�Z�\�C�fJ#m��!y_\�R�@?�1\�\ng_��WQWjS��rl���\�f8\�\�ܦ�)M��±��9�W�lq���μ<�\\X�.�\'�y�q\��\�2\�L�SNG�\r��\�vu\�X|+At\�;~\'�=�qd�f\�mr���y厓\\ɶ����\�qX\�^�k\�_��ѭ\�%-�}\�\�j<w6���e_w�\���#�I\�r��7�<ܘeӯME���_~�^n�\�\�\�#IdG�&m\�!\�8	J\\)O�R��\�w�W�\�\�Z�T�\�͒n+>�M��ܗr\�P.�qۊ\�8fCĸ\�T�i	\'b\\\�Nw(qްˋ`��m��W��rds\�iy��K5\n<��%q\�w\�B�	�9\�y \� �\�>�\�j����\�z�wmDI\�)u\�\�Q�i=\�~<c=�ڍ��\��\0�-VH\�Wk���`�p\�I=�\n�\�3F��d�\�]�\�KɊȐ������\�X䏖sPj{P\Ze\�]\�lX�s�_�\�)&\�\�\���(R7a��({�HQ9\��j\�\'��Rf^\�2\�2l\�,\�\�%)\�W)8/\�).��uIH\�H\�\�\�O��9�`X�Ro\��cZ]\�1Z-q��\�o�Q،\�J�\�\�\���%	\'8	$w\�W�LOu~�\�y\�\�tuY{��B#~\��Jٚ[w*XJ�NB>��tQFˍ\��\���\�CN\��*BݾG\�ܦ��>е��F<�W���\�S\�k[\�,\��I���V��ī�\�\�Xsa��\�p{3 ��6\�\'q\�)A\\�|\�\�\�#>\�+���]]�\�N��\�y\�\�.wr�)CiB�\0�}ϥ`�<\�\��2�\�V�mtĴh9\�fͺ�\�\�\�\�[|\���\��%)O+\'�Ҷ\�1�<4 �v߆��\�\�5��ml�\�\�E�ŵ\r\�r\r\�\�3�n\r3jG9(�{\��\�\�*���ò�\�3IN.\����:\��\�JX\�V����U�� \�X���9�	\�$��\�\�TzbJ�e\�f\�d���b<:Z�\�#K�\�[cڢ(�\�|��}r�Q�t�NU\'\�΍�dv.8��[�PJ	$�\0�9G\�\�d\�Q��y�7\�o\�yE��T\�q��-�JDsܜ�P̦\�Ѷc.K_\�ZW�\�p��ڬ���\�;��{��LQ�\�Q\�M(G�9�0�y�.e\�c�\0ҁ󧡬|\�\��\r�b��ho-\�G���²�1\�>\�G\�QO�\�2�Z\��\�jѻ+�WjlICE-�?�	O��\�\�-��\"sN�6�\0<\�S��n\�\�\�*M\�kL�,3�:\�@��+\�+\�\�\���υ\�\�+��\�F3U\�0Z/�o�		�&Z#\�@R�����$\'�A%i\�\�\\�\��K\�/D\�\�g,�EMc{Օ�\\f*(Tx�R\�%�3+~]u[Ք�e^�\'\�\�s��JL�M_*\�Fm����F2\������[Kg\� ��U��?�ͮ\'���R�;����t=�ͦt�{S\�Oډ�n��bd-e\�=ӻ��\�j)E.\�}YHJw���zz.�\��g�G�u���\�l\�/3\�YRI�\�a�ʜNr�2��A�5\\\�\�c��\�oOz\�\� ���F�\�7�TI\���6#��)�\�[JRH3�\����-n2�Yq��\�[�!E\�\�Yˋܲq�x\�=V�X���QU\�z����wD\�\�O�l#\�\�����\r⨍�\�{�\�\�h�lJFHq)�B�#;~ \Z��4�kiN\�K���8Z�0�RZ@Q*m��甤��\�\��qU��\0\�\�Ǔ\"I��^,�:6\�\�\�l���8\�\�Jgw��3�\���\�VѴ�:3\�\�\�9�\�N\�M\��\�v�\"cǕ\rl�1�K>[�=��pv6\�8 g�]�fe�i\�D�_\�\�\�nغ\�]A\��m\�\�U\�\�F3\�$7�\�y\\��y\���ŒR�c��7�ߌ\�$\�ܛ\�\�\���_a�11\�\�G�R���o	\nNH8*\nVq�U�\���\�\�^�c���oZ��\�\�\�\�\�~�w\�\�)1������\�@\�\�D�v|���F�v�\�Z�\�\��å\"̷�L9�\�Q�mhq\�\�T�\���08\�e,�\�qN\�p˖W�]z�\�I\�\���Ϩ]\�\�\"\�hzS齨\��iH��`��_�\��ج�\�u\�,WC}*��@)\\:]�n��\�3k[�(�kҕ(��I态�\��\��\0���2G�*�E:�\ZN�RZ�1/\�ɟ��H\�\�\����H��\�}3>n�����[?Ê��i��s-��6J�)Ԕ�ǼG\�Sb�F\��\�t��\���K\�/\�\�k)\�\�T3��#�V�\�O�\�\�1i�o*n3�\�r�n\�\�ϩ��U��x�Ys��:\nb�\�k�!E\�}\0wR!)c�H4\�Q!ӎ�j��j��[\'Z���̙6*\�K\r\�\�\��#\�\���\�D�GH\�\�b\����CQ\�B[m�$%)H\0��*���PX(�(�(�(�0(�P\0P�\�',234567,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\teclado-gamer-esca-gxt-853.jpg'),(12,'PC','Funciona',2345,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0\�>a\�\0\0\0sBIT|d�\0\0\0	pHYs\0\0�\0\0���\�I\0\0\0tEXtSoftware\0www.inkscape.org�\�<\Z\0\0\�IDATx�\�y�\�y�\�s\�=�\�K\��Xt\"�$�@�0��\"�M�I\�r��(bW�\nIL.Sv��|\�\�\�!��\�T6\n11G��p�.@$�{i�\�\�\�\�\�\�}�\������ݙ\�\�ٞ�U]S�\��^=\�\��\�\�P���?~8Q�\0/{\�\�+vV\0\'\�\�0Z?,���+p퍠�����\�\�w\��\�/�\�.i�f�aF���\�V�{�\�\�6\�\�B(L:l(B��\�s�\�y!��b/�RP#֑`|��۞��\�z�\�\�/�\�F\�\��ں\0���\"�ʋ���4\'��6n\�B�E�h0�\�U�]\�\"-\�\�\0)�+I�tr%�H>�z�r�9�N��9\�V	\�	����w!�U\�\n\�`�\�z\r�ʔ�Ό\���g��Ǿ�{\�֪\�����X��+YI\��D$\�\�ġ�!\�\�Z�9\"\��h4@\�\�G2J\�u�$��^/b\�O36x��?���H\�\�8�\nK�	Y6i�MnD�H��x���n�5�\�\0I(Ѡ*���N�\�\�\�H�ܸt\�;�W\�a%\ZȘF/\�\�\�\�\����,�Ua\���x\'\�i�Mn�����d0\� 9�\�\0I\�\�way/��\'��\'5\�h\�Tծ\�(�I,_u/Fs�\�j̛�\�M\�XWg�\� 	sE\�\��FN�\�F}�&6l���d�\" \ruKֱ��\�a������\�\�\�_�\�\�3�\�`d���e;�V#\�\�E@��;@��;@��;@��m%\��\\�-f�%�xG�v1I2`�X��\�\�	!�H��\�b�WV�9�.\�s�\�@Ǽ�R���Ɨ�~\r�����-4�\�F\�\�[@�ۂ,�g�\�\�_�>|�H\��\�ROK�t��fK}\�y�\�d�}\�\�9i�3+5�]\\{�#X�6\�nl� \�>x\Z%\ZJo�X�\�\�S-tq�\��ܮx\�;y�+\��J��R\�\�\�����\�ɚP`�\�+�es֫�\\�3||�\�JxF%\Zd|\�-m;1�kb\�\n�	��\'���v&\�\�\�%V\�^\0�����!�B\�\�}��w6\�t��1B�d���=��ޗ�.Su���/I~#\�4 \�z6\�BZ�z\�a\"ҥ�g\n\�\��(�\�qUtϩg��^3kq\�q�\�q��\�\��d=\��Z>�\�_~\�\�Oz\�q\�CG��\�YhMY�\�@�\�\�n�\�+\�@u\���@�\���jf�\Zڠ�z\�\�\�F�x-\'D�\�\�p\�\'0c\�\�\�\�V�\�j\r�羵\�TǞ\��[K\�M\�Uyz\\}\�7o\�\�6d`3p�J\�\�{���y\���1\�%�A\"��\�Ǒnث:\�q�2>rt\�d\�;�Mq\�t,�`2��\'\Z�g��L�\�7��\��tW\�.�kbN\�\�\�_�:�P��\�哇�{/x���k���\�F8,�Ҵd���X{?�t\�И\�nxt%�X\�\'��ϗ9M�]%R?\�\�\�\�\�C��`� o�\�\�\�\�&l\�(^\�|�lB�\��>t���������K%o�l�ƺ2{u�Nՙ\r�g��\�\0��K\�l���\�����^\�!��\n@\�V��@IY\�^�x&!��V>#���m\�#t�(\�P��j�_s/ݿ���/�\�H��\�I߽��X\�4��Y\'N6>@�	6\�\�;�6~�-V�+��d�\�\�1�zI\�A8\��Q~Ն/Qې�k�y�m,_�7�\\\"2\�\��Y��\�Fؿ��&#pz�9����z��NM\�\�J�s|�O�\�?Nڼ)I\�\�\r��#���H�tK���5�~�i\�gcN\�]�^\�;\�*��q�X�\�\�\�Jxm�Ċ$\�\�>(�׿\�s�E\�`�dݍ�ӹ\�Ƈ�\�s I�\�Vм�6,Us�Ø�T\�\�mRʓR\��ް��騄W\�\��\�;\"�\�MMS�\���?_�j;\�\�\�,�%99@�2b\��\��\�GSӤ+�!f�\�=\"8\�\�Ue\�|�\�{����\'����\�Z�\'+Ѝ�B\�L\��\�E	g5@���E�QJo��pl\�2���H�\�X/����/\�g|��\�]L$�j\�hn���k?�є�@nF�\��Ԧ^��p\�\�\�\�\"\�=\�\����	C\��p�\��\\�_6\�x�\Z\�59囱�Lj����idP��\�g�\�}*\��j��1N�:A\�\�@�dt��Cp\�j\'�3����O(\�\�6�.��ьS�	��\�8!$�x#���`\�۰\�-��i���5> \r_Qm��\�x\'/3\�P\�Op\�Z^{a=���e\�\�JU�m�D#Y�\�]%�~���no�\nPI\�\���i�{\�*\\]%�\��\�i���nÚ*6\�6=�(�ngO\�[\�\�kaH)!�}�\��#a�Ӽ|�9n|�5]�Brx\�\�J\��\0�$��}ԖJu�\�R��Ǧ{#��=uBHES\��\�i0�\�\n\�\�����$\�-T\���\�<x^_��^UwN�-�T[3o\r3E\�P�\��+�r�\�GL\�:��\�\�p\�\��s>�\�O_H\�/ѱ��HR�/����r0>c�s�\�\'�6�1\�u+2\�5�l�\�\��3\�%�����%�i�\�j�`0V�y\�i\\zszIb\�ʻ\�x\�\�s�NVE@9E���\�O\�h�e\�\'�t�c|\�0>O���Y�!\�\�I�jLo�\� \�=\\d�9fA\�\�@\�͕��n\�:ꖬ[��2�m�䍏m\�\�J��0Vw2���]Y\�/\�\�a�s���w\'\��2�\�� �uk\�ۧ%\�\0��\�N	;�\�,R�\�\�4\�-\�s��@\0.��\�\���\�\�,?R�\�\�,��r\0\�\�\����@�8��z/�}��Ly8�m$\�\�+\�\��L��(Q��K\�(�A\�\�u�@ ַ\�\�~vL9Rz ��Q��~��ς\�r�`06�\�ve�\�J\����Q�\�~�\�pn�R�05�SC��H\�:�\�u#�� ���~�Bq9�\0\�N�\�!pO\��N:�\�%6a\�6�\�~L�\��H>o�\�1��\�\�\�r\0qu=�k\"����\�\� ��\�\�\�؀�>L��,�(Q$�\��!��\�q\�O�\�,�(\nD#H�\"��� �:!�\�{�\�\0R\�9$QFB6�$!%nm*\"�\�%fPE�pX\����8H}(\"a��g5�n\�Ҡ<\'�\�\�\��\�\��\�\��\�\��\�Im�^D�;�g�\�n=�H�(���z\�h�^�9��9��9F�\r\�?5���D\�ڙ�f��;�\�AlW�\�a�\�ũÿQ\�\�𱇅@T\�qi�U�R$R\�q�{\�۪ɲ	�y���\�P\��q\�\�IM)e|n�Ɠ��AU8�ś6\�k2�r\�	��\0}�Oh�L)�z	��\�\'��I_k\\v\�b�G~�\���_y���~m4*1l\�e�\��\���xY6\�\���\�V+�A\����J4J\�\�H�̒�\�1��:X�؇p�� ���\�t�<F8�>\�\�u-\�w\�\�����p(��v&\�\�d�\n�*�;ə�&Z:VR]gE\�!KA��{�P0�\�i\'�fZ{�u�\��.ce�<\�\�eǗ�P\�;y�+\�����h�<p\0ؒ(��˙��V��\�ɼ?[;���N\�E�t)ꛮg\�ߣ��EkUR�����\�)`��kT\�Tն�r\�\�ܾ�B�U9S��\�\�c�\�a\�\n��\�^ \�ָ��چ%�\�0\��LXwqO��b�\�n�\�5fC�dL�*�Zhh\�2\�-\��I�Z]�\�P\�\�\�=]��f\�l�_�\�v���t��\�>ƹc�U2�����Q\�\�Ae�\�\0e�\�\0�Pf_)~��HD\�\�Y\0\\�Ӝy\�[�C��u\�G\�\�/\'I\����oa�l⺛����.�D\�\��@\�?\�\��Y�\�OIn)��z��\�_c�XY�\�	��ש\�}\�N}\n�w���\�i_�pF\��7�\�}\�_%\��ŗpO�;\�&l2r�\r����\���s)y�|�,\�(BD��?L\�>RŻ\'.0\��_%B\�o��\�3)y���>\�\0B(�\r��s\�XF\�uX\0>[Rxt\�x�od\�y�\�x�`�Lȟ�;H��4�\'�/F�<D�C���;�\�\'\���w\�u\�H(H$����p�\��K�V��X*�hh\�BK�\'4\�\��v�m�/��(\�\�5�g>\�\�vv\�\Z?6x�Kg��u7�\r-[�\�b�\�\"`�6s0~�\n88u\�L�}�6\�`��=lH�O}��Ȥ�ɜ��$#\'呎|9��7����D8w\�i�h0%��czFOEUkJ�efK}<��#uP\� sE\r�귍��:*�Z\�ʧ\�\�h�\�ڔ����!��\�&�ĩ[\�\�\�\r7`�X�t\����p�\�j\�J4�sl\�z\��[c\�=)i#\�\�i^~FsmJ|(0�}�(5\�hhޜ����x�i\\v抆��p\�\��\�!,�M,i�)m.�i���i\\��PH\�8!$_�4��T����O?��+\n�\"%��\��D�nU\'�\�\�G\�Q��-\�`���i�`Nd3#(_E@�*\�yM@\�\\1]nJ�LC�\�V��\�[)O�H����/p&�C(�Y�d��@JK������\�\�>wJ�ǖ�f\�a\�S׸��\�\�\�-\�1Y2\�L�\"\��ŧ\�+J\�\�P\�J)��*���B�\�!�\0\�\�\�\�1r Y\�P�\�\0\��E`Y��\�Y\�\�g\���m,�� �}3�n\��\"\�\�\�\��c�\�ĺ\�����@ 7���\�*���\�D\��?�����/�\0\0\0\0IEND�B`�',654321,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\ordenador-personal.png'),(13,'Mouse','Funciona',5432,NULL,123456,11,''),(14,'mouse','Funciona',76543,_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B�7\020200721<\0124448+00008BIM%\0\0\0\0\0lD�.w�@q&���\'ǐ8BIM:\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\�\0\0\0\0\0\0\0\0\0Grn doub@o\�\0\0\0\0\0\0\0\0\0Bl  doub@o\�\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\�\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\�\0\0\0\0\0\0�\0\0\0�\0\0\�\0,\0\0\0!�\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\�8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\0(\�\�\0��\�\0(\�\�\0��\�\0(\�\�\0\0�N\�\0,\�\�\0��\�\0(v\'\0��\�\0(v\'\0\0��;\0*��\0��;\0*��\0��;\0*��\0\0�\�N\09��\0�\�N\09��\0�\�N\09��\0\0�؝\09��\0�؝\09��\0�؝\09��\0\0��;\0:\0\0\0��;\0:\0\0\0��;\0:\0\0\0\0�\0\0\0;�;\0�\0\0\0;�;\0�\0\0\0;�;\0\0�;\0=bv\0�;\0=bv\0�;\0=bv\0\0��\0>��\0��\0>��\0��\0>��\0\0�\�N\0?��\0�\�N\0?��\0�\�N\0?��\0\0�؝\0A\�N\0�؝\0A\�N\0�؝\0A\�N\0\0�؝\0F\'b\0�؝\0F\'b\0�؝\0F\'b\0\0\�N\�\0I�\0\�N\�\0I�\0\�N\�\0I�\0\0ű;\0O�;\0ű;\0O�;\0ű;\0O�;\0\0\��\0W�\�\0\��\0W�\�\0\��\0W�\�\0\0\�;\0d��\0\�;\0d��\0\�;\0d��\0\0\�bv\0t��\0\�bv\0t��\0\�bv\0t��\0\0\�N\�\0�bv\0\�N\�\0�bv\0\�N\�\0�bv\0\0\�\�N\0�\'b\0\�\�N\0�\'b\0\�\�N\0�\'b\0\0\�\�N\0�;\0\�\�N\0�;\0\�\�N\0�;\0\0�D\�\0�I\�\0��\�\0�;\0��\�\0�;\0\0�bv\0�\'b\0�bv\0�\'b\0�bv\0�\'b\0\0�؝\0�\�N\0���\0�v\'\0���\0�v\'\0\0�؝\0\�N\�\0��\�\0ǉ\�\0��\�\0ǉ\�\0\0��;\0\�\�\�\0~�\�\0Ɲ�\0~�\�\0Ɲ�\0\0h\�N\0\�\�\�\0b;\0�;\0b;\0�;\0\0Xbv\0���\0T\0\0\0���\0O��\0���\0\0V؝\0y��\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0X؝\0u�\0X؝\0u�\0X؝\0u�\0\0X\0\0\0s�\�\0X\0\0\0s�\�\0X\0\0\0s�\�\0\0Xbv\0q��\0Xbv\0q��\0Xbv\0q��\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h�\�\0I��\0v\0\0\0>\�N\0v\0\0\0>\�N\0\0x�\0>\0\0\0x�\0>\0\0\0x�\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0�\�%\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\01\0\0\0\0\0\0\0�2\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0ipp\0�i\0\0\0\0\0\0(\0\0�\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(��\0\0\0\0\0\0��\0\0\0\0\0\0�\"\0\0\0\0\0\0\0�\'\0\0\0\0�\0\0�\0\0\0\0\00210�\0\0\0\0\0\0�\0\0\0\0\0\02�\0\0\0\0\0�\0\0\0\0\0\0F�\0\n\0\0\0\0\0N�\0\0\0\0\0\0V�\0\n\0\0\0\0\0^�\0\n\0\0\0\0\0f�\0\0\0\0\0\0n�\0\0\0\0\0\0\0�\0\0\0\0\0�\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0v��\0\0\0\0\0\0~��\0\0\0\0\0\0���\0\0\0\0\0\0��\0\0\0\0\00100�\0\0\0\0\0\0\0�\0\0\0\0\0\0 �\0\0\0\0\0\0 �\0\0\0\0\0\0��\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0��\0\0\0\0\0\Z\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0��\0;�\�\0\0\0\0�\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0�\�\0\0\'\0\0\0�\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0�\0\0\0d\0\0$\0\0\�354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!�\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\��http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>�\�\0C\0�\�\0C��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa�Br����\�\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0\0!1A�Qaq�\"2����\��B\�b�\�\0\0\0?\0\�ƀ4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@:�\�ۛ\�\�\�\��\��Ï�%xH�ڼ�\�#\�\�J\n��0Q*�/,.�S\0�,[�W�\�\�t3n\�N\�刢\��\0�Rw\�\�Ydb��i�kN+5\��.u�K�A$zq��$\�s�ͤ����=THcu�p\�/\�\n����75z�~L\'�(���\�\�Q�\\��eZ�\'\0\r\�JV#�#\�zA:~�\0�\��%\r_�	d��\�\�c��Ws\�=2\�64��Q\�1�\�@�\�R]TUn�G��d\�MtWEB*p:j\"r\0\��\0�\�u\�B���E�m\�\�/�\�GQ���%`�A\'r��a=F)�r�\�\r:\�\�U2��� ����\��\0\�� ��\�\�n!\�د:V�Z���.\��N@I(A�\���1T)D�\�\�@�a/�d\�N�%4�C��$4�\r\0hs8nm��#�3�E�\�tjj�I[� �Ւ(\�\�G$u9&n\�4Ee�&\0jKVJM茕\�\�X�I��Uv[U&;�4E\�]\�L�\�F\�\�7�!P�/겭&)����o~\�@J!\�N\0+\�zd���ϟ379�0\�_��ʛ��\�d��rb߽\�r\�[\�bZ��\�|ʹ\�\'(���\�9D�4\�,EA�Ȣf��\n߅�ֺQ=��,$-ƹ\'�)o\�ƭ\�=)��O��\�m��jѬ��n��\�ceY\0*���?;�\�-\�nổOO-�(w/��P���p]Jf�\��+�3lm�\�y^g�i\�/�J\��\�cwN�_g �9��\�*�wmT,��2m��k2�m��-�\�\�C<\\$\�A�\�\�g\ZW\Z:,%\��\�G�N(7;\�TH0�e\�Xܨ�\�vRj�Ԅ�AyJ\�S�|�q�k�\�\�c�\�51IU�²E0O@�LoLJ\0 \" \Z�\�k8�(k{��n�%ę5�Ka��Z(HF�g�����N\�J�Ą\�I��y\�	Nt\�Y2��)�s\�\�O5\�*o~sB�4\�<�\�΀�i\��\�5���\�IIA#-fhf\�ei`TRYE�e�#U��@E�\�m{@����@\Z\0\�1\�\'��0\�\�Ea�Lo[��1Y|�Rz�Uk\�\�]-i$��ʮG\�ǂ��Q4�>�\�Ybbt*_-ߑ�\�\�\�k>n��\�)n�-n�p��DE*�ҭ\�Y�s\nq\�\�4�B5�\0��2�ݾD�=�̦\�\�\��\�\�VU\�\�|�ow�\�c�ig�I���\�Ж\"\�\�p,��@K��k��L዗,n�`2�82e(��\Z\��Qy��o[;\�V1\��s�f<���m�m\�\�\� \�\\��\�\�b$S=\�\"f\\h��3\�D��FB:	*���9\�)ٳ-z�m���.~y�:�b��m.�r\�\�&B\�u0�J�\�lX��\�q$\�뒝H�nV��+�P.\�\"/�d�\�鑓h�m�~\�guٕIA�Y�qV;�㷲�\��,���򈴯B���.\���:�U�e)\nR�ˤǵ4\�1l����U\Z�%���ݥm\�ҙYOt\�-�}3ۭ�\��`XI��[X�\��SP9*\��\0�XJF�\�\�M�rVҵ��,\����4mj�\�\�Eʶu\�&F����+ٵ�/)\"\�)$���1`G\�^$\�4�7ar$�\0$Aѵ��=\�*N\�\�\�\�`O�V8�!�D\��K��f�\�Q�]>\�\�٣,����\�%7\�99U޻+�Q3\�%\�\�.�L\�\�)d�\��ߨ�\�\�roӿ6-�9I��\�nӶ;\�\�e��J�\�l�HJ^6\�o�EAN�\�	��u�e\�1S3�G `)-	�\�N\�!ŧ\�kB.E�\�l|�r\�q&ɤ���ٽn���ϒ�S0���?v�����S�7M�N�\�ď�\����X[����˄DZ�w��\�Ej�1�vr{�@^Er�d`ʊ�\�9\�Ax�F6�{�(e�\�e\�vw\���ܝ~�,�\�\��褐z1�p1i�W�d	���n\0�F\��(eUS��&\�vٲIhy�\�\\\�\�wֻ[\��j��؇1J�\�\� \�H8\�K\�b�����C�C\�+\�\\��I��_\�%�X\��m�j�È�\�\�)J�G(Tb%��RIND��F�h�TT���\�5Pº\��ꔽ�O\\Ģ\�Cr�\���\�f�n\�1\�\n\�k�e8DA^\re��.c?�n\�h�YF-��\��R$�&\����Qk|��\�[�\�qR�	�\�ϕXK\�\'$�\�g\�r\r�5\�6I��Ĭ�\�BW�J]\�\�e\�!�8�v�-)v4\�Q��]\�l�E\�l���qq�{��{]\�vn���JW�\�^=3F\�@x\\��\0\"\Z��H�y;�_��IӇ\n��\�DC�DD\�0�)@90�\0\0<�\Z\�\�K%z��\�R�\�\�\ZZ\�f�\�g~�;��̶\�\�-�=M\�9�*͉\�$�ա��z�l���\�V2�P;:\�jN�\�D^�����K�9߱t�WY\�\�\��H^��\r\�\�c#�w\'s��G䛥��E��U\�\�1�R�Y�k\r�1�r��Lb R�gH%�2�ʛ\�@�����|uM��h��D����\\���\�C�M\�\�\�\�\�]9* �@t\�O\�mʮ\��Ȇ�ﯯ\�\�7L\�]\�ll9X\�w��ƌ e�L&1&�ϟ\�%@\��\�|\�/ߵR�\�^��\�o�r{C\�\�7\'[���g��;��\�S\�H�)���\��MYG\�$u�h/�\�Ң_]F�\�$\�J�\�`��L[։J\�ZY\�+%e����\�t\�~�=�d\�䈾��xI�&�\�\�\�V\�qE0�^�\�3o߄Z�A\�.�\�\�&\�\�\�f����\\5R�[��Z�:�\n��C�\�MW���2L��\0��=3|�iC���4\�:�&֋/\���o��˅�&R���\���Ɵ����klV�%\�a�>\� �� VˮqVI\�`ٲ�ETCH\�N���d&�_9\�{[\�y%n\�5��\\U\n\�:0Y\�K�\ns�\�\Z\�w\'*\"B�ƿ\"\rZ\�ق\�Ag+�\�\�\ZY�l���d��x��1d܍Y4H��\�\"�I��?\�\��\"<��D\�\"#έv�\�y�5^&dG��|��\�\�<~�\0�\�\�OF7��1�nDD�o����j�s7{�U\�W�,\��w!��\�?\'x\�\�L�����]ʣM\�h�;e\��L\\{�)�F�1r\�6c����Z^F���\�а\�\�]\�z�o��\"\�K�u�M�X\r\�Z5d\�S�[��ZfY*\�1l渙���B����70\�D�E��[\�K�׺\�\�]\�9ػ�e�I;:\�:�\�1�V\�Q��\�H�u\�\�#!.TS)J�^ͬ�\��ڸA\0\0M�\n9?$I:\�ۙU6e�\�<\0�Փq}E>\����\�H_�*z%0�\0%UL\�v�\�\��ήJ�JOLבy\�N\�\�=*pJGS\���\�\�Њr&\�o/�~\0\r\�x\�8\�y�`�����lsx5\�ɕVқf\�蘆\�\�O\�] n>\�Uۤ`��P\�U�p��%j�n�\�V݌;�=�\�x\Z\�$g\�ү��ՋQ\"�,�����H�@\�UC�\"�9J<��u\�\��\�\\��nQ:<sI��\�0\�֯2�qU��\���ƚ\�\�!\�6�\�j\'x�D\�\�=�����\�\��+Ћn֞&���%���\�%V��P.4c\�\�J�\�<��Y\�\�\��\�Z1\�e��4R]\�EDǷ;��.Tn��\�˪\�-F#,��\�\�\�O\'	]��rbB`+\�\�\�UaEڎ��,�P*��%1Ψ�0:\�(������wC-ߑ&\�8y�\�<���<��\0���o<�\"Y^\�~�\0>x|}�����w�I=+[��\�d[3d\�ju��t�.�1\\81�\�4?���jq��x�\�\Z\�B7�&8jMW\�\�\�в��[����V!3<w�\�\�ZM~�Y7��\�I-ڽ�Wq|\�#�\�opJ���EQ�Q�&8�@\�28X�\�P�Sz�����N���iFQ�V[�\�\�{;?\�t6�Q��.���4W����r��)8V��\"\�`\"�t�\�9Q�A�&\"a9\�G)K\\\�,�;�3PPNQ\�gm��ew�J\�G6	��8{�`���	H\�%L\�Wi\�U�h�iο�β.\�11ݘ����\�\"\'Pyn3\'L����T�QV\�\��\�<:\��uu��ކ\�:\�K&\Z\�O�\�形�l�j�X�f�5���n6<�\�rrG�Z!�@7�S��5\�P��\�k[\�\�\��PI\��W�c�;�C�Ub�\��\�&P!y�\�iBM\�D�m#�.\�\�\�\�i�\�\�#[��),G�����!Y�u`�h\�S��@�%�a\'%w)$\n���\�aҕe�g\'t\�D\�\�\�\�+k�/\�0.\\�-��Rd\�F���\�\�\�+xɕY4\�ʴ\��R��3r�k%�\�Dj\�X�LX7+�K\�L�;��\�\�^�\�\�R�BΛ�\n|YW�F:>�*$�AT\�,d\�\�yk�X�<�zP\0p\�J�\\3f\�2UE,�\�.\�+TK\�!����\�!\�\��\0�X��+�J �㏁��\�\�\�W�\��Y��)&��\�V���ѩz�*}4SUuD?�\'\�c\�\�\�\Z�j	Y\�,\�~\�\�[V*LZ�qm\�\�٬�䓃&�)$+=�p��� \��c����|�5\�\�M\�m�\�5�ӛ�M\�&.\�\\\�[Q�u�b\�kp0m�E�uaJ�1��IU\\_\�\ZI\�\'PL��x\��d�M\�\���R[�y�\"Y\�\�>v�}u/�<a*�\�\�\�H�?Q�-�v\�x�\�t��@H4ZR\��\�%Z1@��VX��5X\�$|C��OSm�]\��7�\�֎y\�Q\\�\��3R�\�\�r��\�\�I��s�ym�\�;vqE\"�\�ۀ,s^N\0TY Ͳd�R��58��W<^oĈ���b\Z\'n\�}Z:\�\�\�Q�S�\�����,HC92\�jW\�;\�!.�7��dY�6n�10	�yl��9\Z\��UJ�̤�Y�:�\�Ʊ��aɴllc6���̑I�6Y �flZ7D�D\"\�$�L�\0)H�\0\0\0k���\�8�g<ms\�YV�\�\�2\�Ͷ� �����HS]2<`\�\'1\�n\�[�j�.�8E7\r�Id\�r\�I�j\�\0�\��/ۊ\�%��t>�\�8R�\�\�\�ܨ�n����<\�.U�\�C6\�\�(\�\�G3+\"���A�\�\�uu^���sĜ�l\�V-\�\�hЎ�:�\�\� \�\�\�\n�9���v��\�x;�TT\�;8��\"(��7?4\�Ut��ן\"t\�\�9����3(�\��-y\��9zѰ�U`<�\�T$ռ�ی��Uy��\�\�u4�)�0�0r�z�<�D\��\�R�*\��\�\�9]m^�a6�\�M)����\�(������O�(�T\��\07��\�EL�\��\�\�,(��@5u%\nC{�CX�\�Ux\�f����|�E\�(���M4W������\�\�\�И\�->�\��\�wIf�\�T\�@\�F�;�\�1v��<T\�U~U־\�~]�+��	\�ҐE�F\�Ie�ޒ�\�\�\�\�c)�\�-?�K\��(��T;ڞeγ�Jx\�[\"�i\�W[W%+\n!pO\�gA$��/\�90\�\�FGJ�	8t\�\�\�\�\�v\��\�cI\�1\�\\��\�^\�j�{�\�T]\�Xm��-dG\��x\�v�\���w@\�(Xq\�yDѮтX�7D�9 e\�R5\"�zd�\�-:��\�,I;�u>\�\�\��8\�su�цHۥ\�\�\�m$@���Cȳ`\�J�1��\�bm2�}X�&�\"\"\0�r\�Z]�s���\�l��M�10�\\�\"\�\�X�\Z\�\�S������lrըF�͔��\���\�\�\�&Ғ\�P-H\r\0\0���>|����\0�\0MB���u6�쌖Y�C\"\��\�Չ��өU+s\�p�\�K5��#Nz����^�|�.�ȓ\�.)��(\�۪�m�2��o�\�4\�b\�\�Vm\�\�u�:YزuuRcd	&b��S0\�B\�\�\�(tT\n\�\�)�@\��\�(Y* �n>�\�H��X�:\�G�k�ʚe?\�Ls��\0��`Ҿ@��UzϘDG\���G�Cr�\��qǪp��\0�+\�)}*\�f\�\�\�\�@y)�q\�\�@\0D;T\�\���\��A/v����T�\�8\�\"\�\�[_��\�5ko���L\�;�\�4�;�5��Xه�M��-\�ʠ��US/&\n\�.Qq\�>\�M=h\�D��ߺZmf6BE4\�\rX�Ad\\\���,L\�\�JHJJ9\�d\�c+%+$\�E�\\TJ\�Sa�`�p��d���\�!cN��o���-Y��\�mz?Y^��\Z1�� 9��R�A]8�S!  Q��W�E�\�cb\Z0l�Y6\�x�Tq\"��k.��\��N7�u_��\0\�oݝ?ÅJ=�\�Ԭ��m�}�l\�o����8�g�<�],s��u\�3x�\n[[c[�3\�VX�������|���NM��|ı�Q\�\�H��b�Ҧ�g.&\�i]���Դ��\�Ǔq��=\�\�\�~��\Z\�\��\��4�\r\0h@\Z\0\��}[�}B�\�l5��[\�4����\�\�\�9�IѲF-ȱ1�q1W�5�8LF\�hFMK!\�l�=t���Y��CV�\�\n�t\�ꕷ���\�6%\�\��/*l{�\�wq\�E\��\�rW{�\�\�p�9Et��\�d�Tri7эP�+d\����}�-���]\����7�<�jN\�z�2\�\�qN\�i��TR2�Ւ|\��瘱s��M�u\�yKM�\�c�E˅_˶n�3*\�ɚL�5j�h��Ê�tF2���������\r\0h@\Z\0\��4�\r\0p��!�?�\�\�\�\�@\Z\0\���\�',9876540,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\mauseinalam.jpg'),(15,'mouse','Funciona',87654,_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B�7\020200721<\0124448+00008BIM%\0\0\0\0\0lD�.w�@q&���\'ǐ8BIM:\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\�\0\0\0\0\0\0\0\0\0Grn doub@o\�\0\0\0\0\0\0\0\0\0Bl  doub@o\�\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\�\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\�\0\0\0\0\0\0�\0\0\0�\0\0\�\0,\0\0\0!�\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\�8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\0(\�\�\0��\�\0(\�\�\0��\�\0(\�\�\0\0�N\�\0,\�\�\0��\�\0(v\'\0��\�\0(v\'\0\0��;\0*��\0��;\0*��\0��;\0*��\0\0�\�N\09��\0�\�N\09��\0�\�N\09��\0\0�؝\09��\0�؝\09��\0�؝\09��\0\0��;\0:\0\0\0��;\0:\0\0\0��;\0:\0\0\0\0�\0\0\0;�;\0�\0\0\0;�;\0�\0\0\0;�;\0\0�;\0=bv\0�;\0=bv\0�;\0=bv\0\0��\0>��\0��\0>��\0��\0>��\0\0�\�N\0?��\0�\�N\0?��\0�\�N\0?��\0\0�؝\0A\�N\0�؝\0A\�N\0�؝\0A\�N\0\0�؝\0F\'b\0�؝\0F\'b\0�؝\0F\'b\0\0\�N\�\0I�\0\�N\�\0I�\0\�N\�\0I�\0\0ű;\0O�;\0ű;\0O�;\0ű;\0O�;\0\0\��\0W�\�\0\��\0W�\�\0\��\0W�\�\0\0\�;\0d��\0\�;\0d��\0\�;\0d��\0\0\�bv\0t��\0\�bv\0t��\0\�bv\0t��\0\0\�N\�\0�bv\0\�N\�\0�bv\0\�N\�\0�bv\0\0\�\�N\0�\'b\0\�\�N\0�\'b\0\�\�N\0�\'b\0\0\�\�N\0�;\0\�\�N\0�;\0\�\�N\0�;\0\0�D\�\0�I\�\0��\�\0�;\0��\�\0�;\0\0�bv\0�\'b\0�bv\0�\'b\0�bv\0�\'b\0\0�؝\0�\�N\0���\0�v\'\0���\0�v\'\0\0�؝\0\�N\�\0��\�\0ǉ\�\0��\�\0ǉ\�\0\0��;\0\�\�\�\0~�\�\0Ɲ�\0~�\�\0Ɲ�\0\0h\�N\0\�\�\�\0b;\0�;\0b;\0�;\0\0Xbv\0���\0T\0\0\0���\0O��\0���\0\0V؝\0y��\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0X؝\0u�\0X؝\0u�\0X؝\0u�\0\0X\0\0\0s�\�\0X\0\0\0s�\�\0X\0\0\0s�\�\0\0Xbv\0q��\0Xbv\0q��\0Xbv\0q��\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h�\�\0I��\0v\0\0\0>\�N\0v\0\0\0>\�N\0\0x�\0>\0\0\0x�\0>\0\0\0x�\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0�\�%\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\01\0\0\0\0\0\0\0�2\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0ipp\0�i\0\0\0\0\0\0(\0\0�\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(��\0\0\0\0\0\0��\0\0\0\0\0\0�\"\0\0\0\0\0\0\0�\'\0\0\0\0�\0\0�\0\0\0\0\00210�\0\0\0\0\0\0�\0\0\0\0\0\02�\0\0\0\0\0�\0\0\0\0\0\0F�\0\n\0\0\0\0\0N�\0\0\0\0\0\0V�\0\n\0\0\0\0\0^�\0\n\0\0\0\0\0f�\0\0\0\0\0\0n�\0\0\0\0\0\0\0�\0\0\0\0\0�\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0v��\0\0\0\0\0\0~��\0\0\0\0\0\0���\0\0\0\0\0\0��\0\0\0\0\00100�\0\0\0\0\0\0\0�\0\0\0\0\0\0 �\0\0\0\0\0\0 �\0\0\0\0\0\0��\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0��\0\0\0\0\0\Z\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0��\0;�\�\0\0\0\0�\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0�\�\0\0\'\0\0\0�\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0�\0\0\0d\0\0$\0\0\�354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!�\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\��http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>�\�\0C\0�\�\0C��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa�Br����\�\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0\0!1A�Qaq�\"2����\��B\�b�\�\0\0\0?\0\�ƀ4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@:�\�ۛ\�\�\�\��\��Ï�%xH�ڼ�\�#\�\�J\n��0Q*�/,.�S\0�,[�W�\�\�t3n\�N\�刢\��\0�Rw\�\�Ydb��i�kN+5\��.u�K�A$zq��$\�s�ͤ����=THcu�p\�/\�\n����75z�~L\'�(���\�\�Q�\\��eZ�\'\0\r\�JV#�#\�zA:~�\0�\��%\r_�	d��\�\�c��Ws\�=2\�64��Q\�1�\�@�\�R]TUn�G��d\�MtWEB*p:j\"r\0\��\0�\�u\�B���E�m\�\�/�\�GQ���%`�A\'r��a=F)�r�\�\r:\�\�U2��� ����\��\0\�� ��\�\�n!\�د:V�Z���.\��N@I(A�\���1T)D�\�\�@�a/�d\�N�%4�C��$4�\r\0hs8nm��#�3�E�\�tjj�I[� �Ւ(\�\�G$u9&n\�4Ee�&\0jKVJM茕\�\�X�I��Uv[U&;�4E\�]\�L�\�F\�\�7�!P�/겭&)����o~\�@J!\�N\0+\�zd���ϟ379�0\�_��ʛ��\�d��rb߽\�r\�[\�bZ��\�|ʹ\�\'(���\�9D�4\�,EA�Ȣf��\n߅�ֺQ=��,$-ƹ\'�)o\�ƭ\�=)��O��\�m��jѬ��n��\�ceY\0*���?;�\�-\�nổOO-�(w/��P���p]Jf�\��+�3lm�\�y^g�i\�/�J\��\�cwN�_g �9��\�*�wmT,��2m��k2�m��-�\�\�C<\\$\�A�\�\�g\ZW\Z:,%\��\�G�N(7;\�TH0�e\�Xܨ�\�vRj�Ԅ�AyJ\�S�|�q�k�\�\�c�\�51IU�²E0O@�LoLJ\0 \" \Z�\�k8�(k{��n�%ę5�Ka��Z(HF�g�����N\�J�Ą\�I��y\�	Nt\�Y2��)�s\�\�O5\�*o~sB�4\�<�\�΀�i\��\�5���\�IIA#-fhf\�ei`TRYE�e�#U��@E�\�m{@����@\Z\0\�1\�\'��0\�\�Ea�Lo[��1Y|�Rz�Uk\�\�]-i$��ʮG\�ǂ��Q4�>�\�Ybbt*_-ߑ�\�\�\�k>n��\�)n�-n�p��DE*�ҭ\�Y�s\nq\�\�4�B5�\0��2�ݾD�=�̦\�\�\��\�\�VU\�\�|�ow�\�c�ig�I���\�Ж\"\�\�p,��@K��k��L዗,n�`2�82e(��\Z\��Qy��o[;\�V1\��s�f<���m�m\�\�\� \�\\��\�\�b$S=\�\"f\\h��3\�D��FB:	*���9\�)ٳ-z�m���.~y�:�b��m.�r\�\�&B\�u0�J�\�lX��\�q$\�뒝H�nV��+�P.\�\"/�d�\�鑓h�m�~\�guٕIA�Y�qV;�㷲�\��,���򈴯B���.\���:�U�e)\nR�ˤǵ4\�1l����U\Z�%���ݥm\�ҙYOt\�-�}3ۭ�\��`XI��[X�\��SP9*\��\0�XJF�\�\�M�rVҵ��,\����4mj�\�\�Eʶu\�&F����+ٵ�/)\"\�)$���1`G\�^$\�4�7ar$�\0$Aѵ��=\�*N\�\�\�\�`O�V8�!�D\��K��f�\�Q�]>\�\�٣,����\�%7\�99U޻+�Q3\�%\�\�.�L\�\�)d�\��ߨ�\�\�roӿ6-�9I��\�nӶ;\�\�e��J�\�l�HJ^6\�o�EAN�\�	��u�e\�1S3�G `)-	�\�N\�!ŧ\�kB.E�\�l|�r\�q&ɤ���ٽn���ϒ�S0���?v�����S�7M�N�\�ď�\����X[����˄DZ�w��\�Ej�1�vr{�@^Er�d`ʊ�\�9\�Ax�F6�{�(e�\�e\�vw\���ܝ~�,�\�\��褐z1�p1i�W�d	���n\0�F\��(eUS��&\�vٲIhy�\�\\\�\�wֻ[\��j��؇1J�\�\� \�H8\�K\�b�����C�C\�+\�\\��I��_\�%�X\��m�j�È�\�\�)J�G(Tb%��RIND��F�h�TT���\�5Pº\��ꔽ�O\\Ģ\�Cr�\���\�f�n\�1\�\n\�k�e8DA^\re��.c?�n\�h�YF-��\��R$�&\����Qk|��\�[�\�qR�	�\�ϕXK\�\'$�\�g\�r\r�5\�6I��Ĭ�\�BW�J]\�\�e\�!�8�v�-)v4\�Q��]\�l�E\�l���qq�{��{]\�vn���JW�\�^=3F\�@x\\��\0\"\Z��H�y;�_��IӇ\n��\�DC�DD\�0�)@90�\0\0<�\Z\�\�K%z��\�R�\�\�\ZZ\�f�\�g~�;��̶\�\�-�=M\�9�*͉\�$�ա��z�l���\�V2�P;:\�jN�\�D^�����K�9߱t�WY\�\�\��H^��\r\�\�c#�w\'s��G䛥��E��U\�\�1�R�Y�k\r�1�r��Lb R�gH%�2�ʛ\�@�����|uM��h��D����\\���\�C�M\�\�\�\�\�]9* �@t\�O\�mʮ\��Ȇ�ﯯ\�\�7L\�]\�ll9X\�w��ƌ e�L&1&�ϟ\�%@\��\�|\�/ߵR�\�^��\�o�r{C\�\�7\'[���g��;��\�S\�H�)���\��MYG\�$u�h/�\�Ң_]F�\�$\�J�\�`��L[։J\�ZY\�+%e����\�t\�~�=�d\�䈾��xI�&�\�\�\�V\�qE0�^�\�3o߄Z�A\�.�\�\�&\�\�\�f����\\5R�[��Z�:�\n��C�\�MW���2L��\0��=3|�iC���4\�:�&֋/\���o��˅�&R���\���Ɵ����klV�%\�a�>\� �� VˮqVI\�`ٲ�ETCH\�N���d&�_9\�{[\�y%n\�5��\\U\n\�:0Y\�K�\ns�\�\Z\�w\'*\"B�ƿ\"\rZ\�ق\�Ag+�\�\�\ZY�l���d��x��1d܍Y4H��\�\"�I��?\�\��\"<��D\�\"#έv�\�y�5^&dG��|��\�\�<~�\0�\�\�OF7��1�nDD�o����j�s7{�U\�W�,\��w!��\�?\'x\�\�L�����]ʣM\�h�;e\��L\\{�)�F�1r\�6c����Z^F���\�а\�\�]\�z�o��\"\�K�u�M�X\r\�Z5d\�S�[��ZfY*\�1l渙���B����70\�D�E��[\�K�׺\�\�]\�9ػ�e�I;:\�:�\�1�V\�Q��\�H�u\�\�#!.TS)J�^ͬ�\��ڸA\0\0M�\n9?$I:\�ۙU6e�\�<\0�Փq}E>\����\�H_�*z%0�\0%UL\�v�\�\��ήJ�JOLבy\�N\�\�=*pJGS\���\�\�Њr&\�o/�~\0\r\�x\�8\�y�`�����lsx5\�ɕVқf\�蘆\�\�O\�] n>\�Uۤ`��P\�U�p��%j�n�\�V݌;�=�\�x\Z\�$g\�ү��ՋQ\"�,�����H�@\�UC�\"�9J<��u\�\��\�\\��nQ:<sI��\�0\�֯2�qU��\���ƚ\�\�!\�6�\�j\'x�D\�\�=�����\�\��+Ћn֞&���%���\�%V��P.4c\�\�J�\�<��Y\�\�\��\�Z1\�e��4R]\�EDǷ;��.Tn��\�˪\�-F#,��\�\�\�O\'	]��rbB`+\�\�\�UaEڎ��,�P*��%1Ψ�0:\�(������wC-ߑ&\�8y�\�<���<��\0���o<�\"Y^\�~�\0>x|}�����w�I=+[��\�d[3d\�ju��t�.�1\\81�\�4?���jq��x�\�\Z\�B7�&8jMW\�\�\�в��[����V!3<w�\�\�ZM~�Y7��\�I-ڽ�Wq|\�#�\�opJ���EQ�Q�&8�@\�28X�\�P�Sz�����N���iFQ�V[�\�\�{;?\�t6�Q��.���4W����r��)8V��\"\�`\"�t�\�9Q�A�&\"a9\�G)K\\\�,�;�3PPNQ\�gm��ew�J\�G6	��8{�`���	H\�%L\�Wi\�U�h�iο�β.\�11ݘ����\�\"\'Pyn3\'L����T�QV\�\��\�<:\��uu��ކ\�:\�K&\Z\�O�\�形�l�j�X�f�5���n6<�\�rrG�Z!�@7�S��5\�P��\�k[\�\�\��PI\��W�c�;�C�Ub�\��\�&P!y�\�iBM\�D�m#�.\�\�\�\�i�\�\�#[��),G�����!Y�u`�h\�S��@�%�a\'%w)$\n���\�aҕe�g\'t\�D\�\�\�\�+k�/\�0.\\�-��Rd\�F���\�\�\�+xɕY4\�ʴ\��R��3r�k%�\�Dj\�X�LX7+�K\�L�;��\�\�^�\�\�R�BΛ�\n|YW�F:>�*$�AT\�,d\�\�yk�X�<�zP\0p\�J�\\3f\�2UE,�\�.\�+TK\�!����\�!\�\��\0�X��+�J �㏁��\�\�\�W�\��Y��)&��\�V���ѩz�*}4SUuD?�\'\�c\�\�\�\Z�j	Y\�,\�~\�\�[V*LZ�qm\�\�٬�䓃&�)$+=�p��� \��c����|�5\�\�M\�m�\�5�ӛ�M\�&.\�\\\�[Q�u�b\�kp0m�E�uaJ�1��IU\\_\�\ZI\�\'PL��x\��d�M\�\���R[�y�\"Y\�\�>v�}u/�<a*�\�\�\�H�?Q�-�v\�x�\�t��@H4ZR\��\�%Z1@��VX��5X\�$|C��OSm�]\��7�\�֎y\�Q\\�\��3R�\�\�r��\�\�I��s�ym�\�;vqE\"�\�ۀ,s^N\0TY Ͳd�R��58��W<^oĈ���b\Z\'n\�}Z:\�\�\�Q�S�\�����,HC92\�jW\�;\�!.�7��dY�6n�10	�yl��9\Z\��UJ�̤�Y�:�\�Ʊ��aɴllc6���̑I�6Y �flZ7D�D\"\�$�L�\0)H�\0\0\0k���\�8�g<ms\�YV�\�\�2\�Ͷ� �����HS]2<`\�\'1\�n\�[�j�.�8E7\r�Id\�r\�I�j\�\0�\��/ۊ\�%��t>�\�8R�\�\�\�ܨ�n����<\�.U�\�C6\�\�(\�\�G3+\"���A�\�\�uu^���sĜ�l\�V-\�\�hЎ�:�\�\� \�\�\�\n�9���v��\�x;�TT\�;8��\"(��7?4\�Ut��ן\"t\�\�9����3(�\��-y\��9zѰ�U`<�\�T$ռ�ی��Uy��\�\�u4�)�0�0r�z�<�D\��\�R�*\��\�\�9]m^�a6�\�M)����\�(������O�(�T\��\07��\�EL�\��\�\�,(��@5u%\nC{�CX�\�Ux\�f����|�E\�(���M4W������\�\�\�И\�->�\��\�wIf�\�T\�@\�F�;�\�1v��<T\�U~U־\�~]�+��	\�ҐE�F\�Ie�ޒ�\�\�\�\�c)�\�-?�K\��(��T;ڞeγ�Jx\�[\"�i\�W[W%+\n!pO\�gA$��/\�90\�\�FGJ�	8t\�\�\�\�\�v\��\�cI\�1\�\\��\�^\�j�{�\�T]\�Xm��-dG\��x\�v�\���w@\�(Xq\�yDѮтX�7D�9 e\�R5\"�zd�\�-:��\�,I;�u>\�\�\��8\�su�цHۥ\�\�\�m$@���Cȳ`\�J�1��\�bm2�}X�&�\"\"\0�r\�Z]�s���\�l��M�10�\\�\"\�\�X�\Z\�\�S������lrըF�͔��\���\�\�\�&Ғ\�P-H\r\0\0���>|����\0�\0MB���u6�쌖Y�C\"\��\�Չ��өU+s\�p�\�K5��#Nz����^�|�.�ȓ\�.)��(\�۪�m�2��o�\�4\�b\�\�Vm\�\�u�:YزuuRcd	&b��S0\�B\�\�\�(tT\n\�\�)�@\��\�(Y* �n>�\�H��X�:\�G�k�ʚe?\�Ls��\0��`Ҿ@��UzϘDG\���G�Cr�\��qǪp��\0�+\�)}*\�f\�\�\�\�@y)�q\�\�@\0D;T\�\���\��A/v����T�\�8\�\"\�\�[_��\�5ko���L\�;�\�4�;�5��Xه�M��-\�ʠ��US/&\n\�.Qq\�>\�M=h\�D��ߺZmf6BE4\�\rX�Ad\\\���,L\�\�JHJJ9\�d\�c+%+$\�E�\\TJ\�Sa�`�p��d���\�!cN��o���-Y��\�mz?Y^��\Z1�� 9��R�A]8�S!  Q��W�E�\�cb\Z0l�Y6\�x�Tq\"��k.��\��N7�u_��\0\�oݝ?ÅJ=�\�Ԭ��m�}�l\�o����8�g�<�],s��u\�3x�\n[[c[�3\�VX�������|���NM��|ı�Q\�\�H��b�Ҧ�g.&\�i]���Դ��\�Ǔq��=\�\�\�~��\Z\�\��\��4�\r\0h@\Z\0\��}[�}B�\�l5��[\�4����\�\�\�9�IѲF-ȱ1�q1W�5�8LF\�hFMK!\�l�=t���Y��CV�\�\n�t\�ꕷ���\�6%\�\��/*l{�\�wq\�E\��\�rW{�\�\�p�9Et��\�d�Tri7эP�+d\����}�-���]\����7�<�jN\�z�2\�\�qN\�i��TR2�Ւ|\��瘱s��M�u\�yKM�\�c�E˅_˶n�3*\�ɚL�5j�h��Ê�tF2���������\r\0h@\Z\0\��4�\r\0p��!�?�\�\�\�\�@\Z\0\���\�',876543,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\mauseinalam.jpg'),(16,'mouse','Funciona',34567,_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B�7\020200721<\0124448+00008BIM%\0\0\0\0\0lD�.w�@q&���\'ǐ8BIM:\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\�\0\0\0\0\0\0\0\0\0Grn doub@o\�\0\0\0\0\0\0\0\0\0Bl  doub@o\�\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\�\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\�\0\0\0\0\0\0�\0\0\0�\0\0\�\0,\0\0\0!�\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\�8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\0(\�\�\0��\�\0(\�\�\0��\�\0(\�\�\0\0�N\�\0,\�\�\0��\�\0(v\'\0��\�\0(v\'\0\0��;\0*��\0��;\0*��\0��;\0*��\0\0�\�N\09��\0�\�N\09��\0�\�N\09��\0\0�؝\09��\0�؝\09��\0�؝\09��\0\0��;\0:\0\0\0��;\0:\0\0\0��;\0:\0\0\0\0�\0\0\0;�;\0�\0\0\0;�;\0�\0\0\0;�;\0\0�;\0=bv\0�;\0=bv\0�;\0=bv\0\0��\0>��\0��\0>��\0��\0>��\0\0�\�N\0?��\0�\�N\0?��\0�\�N\0?��\0\0�؝\0A\�N\0�؝\0A\�N\0�؝\0A\�N\0\0�؝\0F\'b\0�؝\0F\'b\0�؝\0F\'b\0\0\�N\�\0I�\0\�N\�\0I�\0\�N\�\0I�\0\0ű;\0O�;\0ű;\0O�;\0ű;\0O�;\0\0\��\0W�\�\0\��\0W�\�\0\��\0W�\�\0\0\�;\0d��\0\�;\0d��\0\�;\0d��\0\0\�bv\0t��\0\�bv\0t��\0\�bv\0t��\0\0\�N\�\0�bv\0\�N\�\0�bv\0\�N\�\0�bv\0\0\�\�N\0�\'b\0\�\�N\0�\'b\0\�\�N\0�\'b\0\0\�\�N\0�;\0\�\�N\0�;\0\�\�N\0�;\0\0�D\�\0�I\�\0��\�\0�;\0��\�\0�;\0\0�bv\0�\'b\0�bv\0�\'b\0�bv\0�\'b\0\0�؝\0�\�N\0���\0�v\'\0���\0�v\'\0\0�؝\0\�N\�\0��\�\0ǉ\�\0��\�\0ǉ\�\0\0��;\0\�\�\�\0~�\�\0Ɲ�\0~�\�\0Ɲ�\0\0h\�N\0\�\�\�\0b;\0�;\0b;\0�;\0\0Xbv\0���\0T\0\0\0���\0O��\0���\0\0V؝\0y��\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0X؝\0u�\0X؝\0u�\0X؝\0u�\0\0X\0\0\0s�\�\0X\0\0\0s�\�\0X\0\0\0s�\�\0\0Xbv\0q��\0Xbv\0q��\0Xbv\0q��\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h�\�\0I��\0v\0\0\0>\�N\0v\0\0\0>\�N\0\0x�\0>\0\0\0x�\0>\0\0\0x�\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0�\�%\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\01\0\0\0\0\0\0\0�2\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0ipp\0�i\0\0\0\0\0\0(\0\0�\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(��\0\0\0\0\0\0��\0\0\0\0\0\0�\"\0\0\0\0\0\0\0�\'\0\0\0\0�\0\0�\0\0\0\0\00210�\0\0\0\0\0\0�\0\0\0\0\0\02�\0\0\0\0\0�\0\0\0\0\0\0F�\0\n\0\0\0\0\0N�\0\0\0\0\0\0V�\0\n\0\0\0\0\0^�\0\n\0\0\0\0\0f�\0\0\0\0\0\0n�\0\0\0\0\0\0\0�\0\0\0\0\0�\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0v��\0\0\0\0\0\0~��\0\0\0\0\0\0���\0\0\0\0\0\0��\0\0\0\0\00100�\0\0\0\0\0\0\0�\0\0\0\0\0\0 �\0\0\0\0\0\0 �\0\0\0\0\0\0��\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0��\0\0\0\0\0\Z\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0��\0;�\�\0\0\0\0�\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0�\�\0\0\'\0\0\0�\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0�\0\0\0d\0\0$\0\0\�354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!�\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\��http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>�\�\0C\0�\�\0C��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa�Br����\�\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0\0!1A�Qaq�\"2����\��B\�b�\�\0\0\0?\0\�ƀ4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@:�\�ۛ\�\�\�\��\��Ï�%xH�ڼ�\�#\�\�J\n��0Q*�/,.�S\0�,[�W�\�\�t3n\�N\�刢\��\0�Rw\�\�Ydb��i�kN+5\��.u�K�A$zq��$\�s�ͤ����=THcu�p\�/\�\n����75z�~L\'�(���\�\�Q�\\��eZ�\'\0\r\�JV#�#\�zA:~�\0�\��%\r_�	d��\�\�c��Ws\�=2\�64��Q\�1�\�@�\�R]TUn�G��d\�MtWEB*p:j\"r\0\��\0�\�u\�B���E�m\�\�/�\�GQ���%`�A\'r��a=F)�r�\�\r:\�\�U2��� ����\��\0\�� ��\�\�n!\�د:V�Z���.\��N@I(A�\���1T)D�\�\�@�a/�d\�N�%4�C��$4�\r\0hs8nm��#�3�E�\�tjj�I[� �Ւ(\�\�G$u9&n\�4Ee�&\0jKVJM茕\�\�X�I��Uv[U&;�4E\�]\�L�\�F\�\�7�!P�/겭&)����o~\�@J!\�N\0+\�zd���ϟ379�0\�_��ʛ��\�d��rb߽\�r\�[\�bZ��\�|ʹ\�\'(���\�9D�4\�,EA�Ȣf��\n߅�ֺQ=��,$-ƹ\'�)o\�ƭ\�=)��O��\�m��jѬ��n��\�ceY\0*���?;�\�-\�nổOO-�(w/��P���p]Jf�\��+�3lm�\�y^g�i\�/�J\��\�cwN�_g �9��\�*�wmT,��2m��k2�m��-�\�\�C<\\$\�A�\�\�g\ZW\Z:,%\��\�G�N(7;\�TH0�e\�Xܨ�\�vRj�Ԅ�AyJ\�S�|�q�k�\�\�c�\�51IU�²E0O@�LoLJ\0 \" \Z�\�k8�(k{��n�%ę5�Ka��Z(HF�g�����N\�J�Ą\�I��y\�	Nt\�Y2��)�s\�\�O5\�*o~sB�4\�<�\�΀�i\��\�5���\�IIA#-fhf\�ei`TRYE�e�#U��@E�\�m{@����@\Z\0\�1\�\'��0\�\�Ea�Lo[��1Y|�Rz�Uk\�\�]-i$��ʮG\�ǂ��Q4�>�\�Ybbt*_-ߑ�\�\�\�k>n��\�)n�-n�p��DE*�ҭ\�Y�s\nq\�\�4�B5�\0��2�ݾD�=�̦\�\�\��\�\�VU\�\�|�ow�\�c�ig�I���\�Ж\"\�\�p,��@K��k��L዗,n�`2�82e(��\Z\��Qy��o[;\�V1\��s�f<���m�m\�\�\� \�\\��\�\�b$S=\�\"f\\h��3\�D��FB:	*���9\�)ٳ-z�m���.~y�:�b��m.�r\�\�&B\�u0�J�\�lX��\�q$\�뒝H�nV��+�P.\�\"/�d�\�鑓h�m�~\�guٕIA�Y�qV;�㷲�\��,���򈴯B���.\���:�U�e)\nR�ˤǵ4\�1l����U\Z�%���ݥm\�ҙYOt\�-�}3ۭ�\��`XI��[X�\��SP9*\��\0�XJF�\�\�M�rVҵ��,\����4mj�\�\�Eʶu\�&F����+ٵ�/)\"\�)$���1`G\�^$\�4�7ar$�\0$Aѵ��=\�*N\�\�\�\�`O�V8�!�D\��K��f�\�Q�]>\�\�٣,����\�%7\�99U޻+�Q3\�%\�\�.�L\�\�)d�\��ߨ�\�\�roӿ6-�9I��\�nӶ;\�\�e��J�\�l�HJ^6\�o�EAN�\�	��u�e\�1S3�G `)-	�\�N\�!ŧ\�kB.E�\�l|�r\�q&ɤ���ٽn���ϒ�S0���?v�����S�7M�N�\�ď�\����X[����˄DZ�w��\�Ej�1�vr{�@^Er�d`ʊ�\�9\�Ax�F6�{�(e�\�e\�vw\���ܝ~�,�\�\��褐z1�p1i�W�d	���n\0�F\��(eUS��&\�vٲIhy�\�\\\�\�wֻ[\��j��؇1J�\�\� \�H8\�K\�b�����C�C\�+\�\\��I��_\�%�X\��m�j�È�\�\�)J�G(Tb%��RIND��F�h�TT���\�5Pº\��ꔽ�O\\Ģ\�Cr�\���\�f�n\�1\�\n\�k�e8DA^\re��.c?�n\�h�YF-��\��R$�&\����Qk|��\�[�\�qR�	�\�ϕXK\�\'$�\�g\�r\r�5\�6I��Ĭ�\�BW�J]\�\�e\�!�8�v�-)v4\�Q��]\�l�E\�l���qq�{��{]\�vn���JW�\�^=3F\�@x\\��\0\"\Z��H�y;�_��IӇ\n��\�DC�DD\�0�)@90�\0\0<�\Z\�\�K%z��\�R�\�\�\ZZ\�f�\�g~�;��̶\�\�-�=M\�9�*͉\�$�ա��z�l���\�V2�P;:\�jN�\�D^�����K�9߱t�WY\�\�\��H^��\r\�\�c#�w\'s��G䛥��E��U\�\�1�R�Y�k\r�1�r��Lb R�gH%�2�ʛ\�@�����|uM��h��D����\\���\�C�M\�\�\�\�\�]9* �@t\�O\�mʮ\��Ȇ�ﯯ\�\�7L\�]\�ll9X\�w��ƌ e�L&1&�ϟ\�%@\��\�|\�/ߵR�\�^��\�o�r{C\�\�7\'[���g��;��\�S\�H�)���\��MYG\�$u�h/�\�Ң_]F�\�$\�J�\�`��L[։J\�ZY\�+%e����\�t\�~�=�d\�䈾��xI�&�\�\�\�V\�qE0�^�\�3o߄Z�A\�.�\�\�&\�\�\�f����\\5R�[��Z�:�\n��C�\�MW���2L��\0��=3|�iC���4\�:�&֋/\���o��˅�&R���\���Ɵ����klV�%\�a�>\� �� VˮqVI\�`ٲ�ETCH\�N���d&�_9\�{[\�y%n\�5��\\U\n\�:0Y\�K�\ns�\�\Z\�w\'*\"B�ƿ\"\rZ\�ق\�Ag+�\�\�\ZY�l���d��x��1d܍Y4H��\�\"�I��?\�\��\"<��D\�\"#έv�\�y�5^&dG��|��\�\�<~�\0�\�\�OF7��1�nDD�o����j�s7{�U\�W�,\��w!��\�?\'x\�\�L�����]ʣM\�h�;e\��L\\{�)�F�1r\�6c����Z^F���\�а\�\�]\�z�o��\"\�K�u�M�X\r\�Z5d\�S�[��ZfY*\�1l渙���B����70\�D�E��[\�K�׺\�\�]\�9ػ�e�I;:\�:�\�1�V\�Q��\�H�u\�\�#!.TS)J�^ͬ�\��ڸA\0\0M�\n9?$I:\�ۙU6e�\�<\0�Փq}E>\����\�H_�*z%0�\0%UL\�v�\�\��ήJ�JOLבy\�N\�\�=*pJGS\���\�\�Њr&\�o/�~\0\r\�x\�8\�y�`�����lsx5\�ɕVқf\�蘆\�\�O\�] n>\�Uۤ`��P\�U�p��%j�n�\�V݌;�=�\�x\Z\�$g\�ү��ՋQ\"�,�����H�@\�UC�\"�9J<��u\�\��\�\\��nQ:<sI��\�0\�֯2�qU��\���ƚ\�\�!\�6�\�j\'x�D\�\�=�����\�\��+Ћn֞&���%���\�%V��P.4c\�\�J�\�<��Y\�\�\��\�Z1\�e��4R]\�EDǷ;��.Tn��\�˪\�-F#,��\�\�\�O\'	]��rbB`+\�\�\�UaEڎ��,�P*��%1Ψ�0:\�(������wC-ߑ&\�8y�\�<���<��\0���o<�\"Y^\�~�\0>x|}�����w�I=+[��\�d[3d\�ju��t�.�1\\81�\�4?���jq��x�\�\Z\�B7�&8jMW\�\�\�в��[����V!3<w�\�\�ZM~�Y7��\�I-ڽ�Wq|\�#�\�opJ���EQ�Q�&8�@\�28X�\�P�Sz�����N���iFQ�V[�\�\�{;?\�t6�Q��.���4W����r��)8V��\"\�`\"�t�\�9Q�A�&\"a9\�G)K\\\�,�;�3PPNQ\�gm��ew�J\�G6	��8{�`���	H\�%L\�Wi\�U�h�iο�β.\�11ݘ����\�\"\'Pyn3\'L����T�QV\�\��\�<:\��uu��ކ\�:\�K&\Z\�O�\�形�l�j�X�f�5���n6<�\�rrG�Z!�@7�S��5\�P��\�k[\�\�\��PI\��W�c�;�C�Ub�\��\�&P!y�\�iBM\�D�m#�.\�\�\�\�i�\�\�#[��),G�����!Y�u`�h\�S��@�%�a\'%w)$\n���\�aҕe�g\'t\�D\�\�\�\�+k�/\�0.\\�-��Rd\�F���\�\�\�+xɕY4\�ʴ\��R��3r�k%�\�Dj\�X�LX7+�K\�L�;��\�\�^�\�\�R�BΛ�\n|YW�F:>�*$�AT\�,d\�\�yk�X�<�zP\0p\�J�\\3f\�2UE,�\�.\�+TK\�!����\�!\�\��\0�X��+�J �㏁��\�\�\�W�\��Y��)&��\�V���ѩz�*}4SUuD?�\'\�c\�\�\�\Z�j	Y\�,\�~\�\�[V*LZ�qm\�\�٬�䓃&�)$+=�p��� \��c����|�5\�\�M\�m�\�5�ӛ�M\�&.\�\\\�[Q�u�b\�kp0m�E�uaJ�1��IU\\_\�\ZI\�\'PL��x\��d�M\�\���R[�y�\"Y\�\�>v�}u/�<a*�\�\�\�H�?Q�-�v\�x�\�t��@H4ZR\��\�%Z1@��VX��5X\�$|C��OSm�]\��7�\�֎y\�Q\\�\��3R�\�\�r��\�\�I��s�ym�\�;vqE\"�\�ۀ,s^N\0TY Ͳd�R��58��W<^oĈ���b\Z\'n\�}Z:\�\�\�Q�S�\�����,HC92\�jW\�;\�!.�7��dY�6n�10	�yl��9\Z\��UJ�̤�Y�:�\�Ʊ��aɴllc6���̑I�6Y �flZ7D�D\"\�$�L�\0)H�\0\0\0k���\�8�g<ms\�YV�\�\�2\�Ͷ� �����HS]2<`\�\'1\�n\�[�j�.�8E7\r�Id\�r\�I�j\�\0�\��/ۊ\�%��t>�\�8R�\�\�\�ܨ�n����<\�.U�\�C6\�\�(\�\�G3+\"���A�\�\�uu^���sĜ�l\�V-\�\�hЎ�:�\�\� \�\�\�\n�9���v��\�x;�TT\�;8��\"(��7?4\�Ut��ן\"t\�\�9����3(�\��-y\��9zѰ�U`<�\�T$ռ�ی��Uy��\�\�u4�)�0�0r�z�<�D\��\�R�*\��\�\�9]m^�a6�\�M)����\�(������O�(�T\��\07��\�EL�\��\�\�,(��@5u%\nC{�CX�\�Ux\�f����|�E\�(���M4W������\�\�\�И\�->�\��\�wIf�\�T\�@\�F�;�\�1v��<T\�U~U־\�~]�+��	\�ҐE�F\�Ie�ޒ�\�\�\�\�c)�\�-?�K\��(��T;ڞeγ�Jx\�[\"�i\�W[W%+\n!pO\�gA$��/\�90\�\�FGJ�	8t\�\�\�\�\�v\��\�cI\�1\�\\��\�^\�j�{�\�T]\�Xm��-dG\��x\�v�\���w@\�(Xq\�yDѮтX�7D�9 e\�R5\"�zd�\�-:��\�,I;�u>\�\�\��8\�su�цHۥ\�\�\�m$@���Cȳ`\�J�1��\�bm2�}X�&�\"\"\0�r\�Z]�s���\�l��M�10�\\�\"\�\�X�\Z\�\�S������lrըF�͔��\���\�\�\�&Ғ\�P-H\r\0\0���>|����\0�\0MB���u6�쌖Y�C\"\��\�Չ��өU+s\�p�\�K5��#Nz����^�|�.�ȓ\�.)��(\�۪�m�2��o�\�4\�b\�\�Vm\�\�u�:YزuuRcd	&b��S0\�B\�\�\�(tT\n\�\�)�@\��\�(Y* �n>�\�H��X�:\�G�k�ʚe?\�Ls��\0��`Ҿ@��UzϘDG\���G�Cr�\��qǪp��\0�+\�)}*\�f\�\�\�\�@y)�q\�\�@\0D;T\�\���\��A/v����T�\�8\�\"\�\�[_��\�5ko���L\�;�\�4�;�5��Xه�M��-\�ʠ��US/&\n\�.Qq\�>\�M=h\�D��ߺZmf6BE4\�\rX�Ad\\\���,L\�\�JHJJ9\�d\�c+%+$\�E�\\TJ\�Sa�`�p��d���\�!cN��o���-Y��\�mz?Y^��\Z1�� 9��R�A]8�S!  Q��W�E�\�cb\Z0l�Y6\�x�Tq\"��k.��\��N7�u_��\0\�oݝ?ÅJ=�\�Ԭ��m�}�l\�o����8�g�<�],s��u\�3x�\n[[c[�3\�VX�������|���NM��|ı�Q\�\�H��b�Ҧ�g.&\�i]���Դ��\�Ǔq��=\�\�\�~��\Z\�\��\��4�\r\0h@\Z\0\��}[�}B�\�l5��[\�4����\�\�\�9�IѲF-ȱ1�q1W�5�8LF\�hFMK!\�l�=t���Y��CV�\�\n�t\�ꕷ���\�6%\�\��/*l{�\�wq\�E\��\�rW{�\�\�p�9Et��\�d�Tri7эP�+d\����}�-���]\����7�<�jN\�z�2\�\�qN\�i��TR2�Ւ|\��瘱s��M�u\�yKM�\�c�E˅_˶n�3*\�ɚL�5j�h��Ê�tF2���������\r\0h@\Z\0\��4�\r\0p��!�?�\�\�\�\�@\Z\0\���\�',234567,1,'D:\\2\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\mauseinalam.jpg'),(17,'Laptop','Funciona',87654,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\n�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0A\0\r\0\0\0\0\0!\"1AQ	a�2Bqbr�$��%3CRcs������\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\00\0\0\0\0\0\0\0!1AQ\"aq����#2R\�B���\�\0\0\0?\0\�\0P\0PJ\0�+@@@@@@A��~�^6�b4�\r9w�e�\�/m�Ɂ%l:a\nq\�)+� \��\�gN\�ݧ\Z\�Qn)\�v�T��.V���-iRB�)�/%$k@\�=ee�\�{�\�\�a���\�zԴڵ��\�\�\����:�\�&�\�m��\�8�	U\�ʴ\�\��\�2H\��\��a�隔��Z�r�\0%�{�2bU��EuN/{�\���ٽ\�Z\�;�f�1x	�)O�i\�*?`k\�1�(#@V�(�(�(�(4|i7���i= ˥l\�,\�0\�3\�/\�p���\�ހR�X\�\�%\�I[m\�i33jq\�rI=\0ǹ�OZ��\�:=\�;�\�\�\�&��\�O�MG�/v��]cih\�b2�\��+h)i\�\�O�S\�\��{g�Y�]\Z��r\�~�|��+�s�6\��\0d&\��\�\�M\rI6sRз��Jz��C�޴\�PZ\�\\~��i��{�T�k:P\�l\�\�m-\�\�B��Ƶ�ń�?\������ܒ�\��2��\�S~����L\�\0	T\�#\��\�Zp���M@&\��K�r�-/U�JNp�����d�\0�M�\�	/e�[u\�Znnp�D�o�\�\��)$��\��\0�\n\0�(|�\�;�\�\�Yݪ�3P!\��cxve�c\��!��\�N6ȣ\�ͮ�i�`��/�D������!)\n\nH\'\�y�Es�S\�м��\�c�-t�Z��\�zF�uEU�E\�2{?8\�\�\�K=U�\�\�\�.ʸ����J���\n��$�\��͞�JW�%�����j\��k�6\�Uk4�\�[\����\�un����\�E\�p-.\��Q\�q��\��5\�t?NԵ�ج�m��K�\\T���S�O�>ޫR\�\�r2�6\�vBz��\�]\'K[ҍz^�v|;R	�����\�R\�\��YH��ⲏ\�>uf�c/\�D>�|��}\�Vk}l�\�\Z�[��la�8�2\�\�kQ@<TR�\'�;\�ŭҧ�,�gXj\�\n\0�\n�\Z�\�Me��XBl��S\�U\�\�R�>\�	z\�\�\�=)\�^|�\�\�Y[�R��D\��&�ؿ\r�%ܢ؝���W\�C��Po\� \�\�\��\�j.j��\�f}\�\���zvҔq�Mq\�^s�{�\�Q�F��0��e\�TF�>|E%=x�\0,`�+X�\�k_j4\�[\��ܺ��_s[�}��c(\�\�~~�\Z+���\�Ɲ��9�!�`8!\0d|g��\0\�}�\�\�&\�\�0�Y/rx\�\�/���B�=F���H�.9X\�.W\�jwN�\�n$�ZK�/�¸(\��>��\�/���[J���\����&�uҨ��Ӷ\���dmܘ�\�QV=��Q��zY\�כ�Q\��N\�p�z�\�T7\�.�\�q\�,\�\�Ói�~\�:E�.w\�*�0)8W\'�[�h6?�`6\�m�\�^I5P@PB@M\n�\'��o=��^��ܛ�u��,�\�e\�\�~�+t���$�\�\�h=o~3�J˭���\�q{\�/6�\0V\�e\�\�km\�I\0w\��=@����ΝH��块\�~����9\�Q���ݖwK\�q\�>\�I~+\�\�0� ��\����Gӄ/s]r���\�\�\�R�֬�%�\Z�\�e�4�י=�Z�\���\n	_�\��\0ε\�\�W�\n\�\�P�ϝ\�c\�9UJ\�֭.�Ic\���p4��Q�9R\�@Z�F��sW\�:\��\0MbO�ط8¤*(=�BY�\�ն��(\�jՔ��\�b��O�\�\�m���\�ͣ4{yW틫1�\�3��\\�Wٴ�\�5I�ͣ\"���Kܛ\�\��m�\�b$V�\�fKM6���$a }\0�<\�\"��.dx��%�\�\�hr[��%	䞂�a�#�N�\�\"Tk\"\\\��\�H.*1\��IKp�_\�֘\�\"\�\���ֺ�+�2�-�J��}�]\�~]\\\�_I8\�*\'�Z��23z�\n�Yf\�\�}\�\�4\�.���R��V\n�(\'\0�K5=(�*k=��h}�X��\��\��\0\Z0	��!��\�j�07r��S�\�I���P�z\�-&\\�ISy��\rz\"\�a2�\�K\\^}@��\0�]���;yB�s,��\�\\\��]N�\�%t��(�\�\�\�\��\����#�J�E(	\0����\�\����N�\�J���?s\����kg_ݴY\�]I\�|v��\���\0(c�=\�\�Z\�D��\�\�\����\�\�T\�}\�2����כ)�\��(�چ;��:)��\�A}\�\�I��k�--m⹎�T�<}R\��\0R�\"�\�\�\�\Z�x\�ǈ/\��\0�u�\�ph�B\�ޣڋS��o��w\\\�^X�s�\�	����@B=g���p\�u\��\�(��7�-��z��\0��rk�J$6y2\�]A�I�\0�C\�\�\�\�ی���(c�VR<\�p�d�\\$\�㠪Լ��\�4�iiD�6Q\�^\�$���\�O.i\�:U�vZ�\n�!A�ҷ\�Q\�o��08g)m\�X8$yP�\���!\\P_	-�AjD������蓕?\�P\�%;-n��Q�*�RS�)\'�A���z�\r&ދ!�i\��)\�Nx�@��TC\��Z\�̍\�x\��\\����_OcV\�T.B\�\��d�}+׶�J�T�~Ŏ���\�PD��\�2�\����<�U^��m\ZT�ZK	~��\��ЫV3��O?���;o�\�\�÷]�,�,�WMV��\���9����\r!�Ƶd��kW5\�\�i֗��d��1�o�ܖ\\i\�\�\�N$�hX\�TB>`�PS};\Z�pnU\�o�|nYJ�[Y�,(�A�\�\��)�!m\�\�6�q�\�\�SXYm\�$ �\�(z(����r~�	�&\�T5���\�0\�y2\�$��F�jS�4N�\�\�-�BV$���Ò���\�\��i䧁7p��\�\�!����	m=Nx�]BT�|\�}Gުpk\�m\\4�1�%\�\�\�R��:>\�ǅ$G�d}\�@M��E�bJ ���M��%`��~E�\n\�\Z\�ӨOIR~F�����J���\�x\���\'�\0\�=E`\�$��;gy\�\��ӺJ\�t^n1\�\�ZHi.��@y�*\�>��\�\�N�JI�KM~y=!\�l�4\�\�i�\�b\�Ŏ\��ChHJG\�V\�}\0P\0\�\�\'g�/�\�⛛\'vmcݣ$���W�џʯ��\�M\�\�}M�\�^\���muX�t�	���|Я\�W_l��Uq�\� y\nz\�\�ZT�}\r�WHa�ǜ�=�$!��D.0�*HIG�z�R~H6�W\Z\�$͉!sЦ\�\�LJ����$	\�\0�)\0��~u_$#S~}�>�\�\�\�!ax��Aa�՜\�u����F\�d;3\�7j;\�#i�{��&�Bf]���hG�����d���\�V�\�+c���;+\�\�\�\Z`[��a*\��iL\�\�\���a��|#\�Tz\�<�@@\�\�nԖ�6ˬ&.�(\�ލ%��->\�\Zv�\�)r��]�\0nP�\�\�2�lJ%rX�\�?\�S��\�=9PV�Ӯ�\�ۈQBд���pAȃ\�h̥\��\�6\�պE�֠\�a\�W���\0��p�\0�9�\�ԭ�8�4�8.�\�\\]_�k~4c�ӥdHp��?\���\�\�ƙ�э=�m�R\�\�g�\�n��\�1b�m\0{�\r@64@@@@Gnҽ����G�t�\�M\�$�\�\�ynII���ǧ1\�\�PI�0\�Hۼt��\�29��\�ŭ	υ\����c�0W�ɑ@t{g;5Y�\�qn�y\�]T\�D�\�0�c�b�I\��\0d�U`�O*\0�\n\0�\n\0�\n\0�\n\0�\n��+@@@�\�',876543,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\portatillnovo.jpg'),(18,'Celular','Funciona',34567,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0�iq\�\0\0\0sBIT|d�\0\0\0	pHYs\0\0�\0\0�:\�\�\�\0\0\0tEXtSoftware\0www.inkscape.org�\�<\Z\0\0\�IDATx\�\�\�SW\�u��\�\��Ї��u�\�\�t�/\�i\�\Z�L��P��4��*T\�&��\"8�\\�T墐��Z���\\ \�!	/B\� \� a��[D&��t`\�\�w8���\�=瓓�{v��!b\�b$LL�R��!#\�!E,�\�X28�b뿨NJ\�\�@V\��6|�C�\r�H�����Y�\� \�ȟ�r�c$\�\�\�(D(:>\�\��C;��)�m�\��x�� \0d�@Bf�|�ۺ5\\\�\�\�1lGF�u�=� ga� ���\0x��={\"��8q�+\�&�N\�	\�+w\�F|	<\�Y1\0�F\0,\0p$wHx�ȶ��c��\��\�\���b)\�\0\0\0`\0Ԕ���Q�:��$��|~��&N�?G\�x�*��m\�4j\�wQ�6�̊�\0n���\�4@t�_R\�/ �S�\�\�\"���x��Y\�m �0(��N\�*R*J\�\�m�q��\���\�\�r=\���\�w\n@\�\�\Z\0� \�3�\�\��j*�?0\�5�vL	\0B\�6lU\0�U\�\�\�W����Q�\��\�x\�5\��@\�@�/�\0\\:W�g\0\�|�7Sc�&DnmMMU��Q|jVS=\0HV�w���F\�K{�%�A\�_x�cx��`�rI�&��9�\Zl\�uv�e�À\��q�I�\0`9���]�5\�Cו\�g\\�\�~d�y0h[��\�	�\�1� \�x�\�\�-\rs⥡���\�\�X\r@Po\�-�J��֤�O\�B\�\�8��ו�B,Gs�\Z\�2+o��9�k9Q\ZB�ґjm/{\�\r4\�\�4ό���7z\�zd8Gs\�5��\�\0�e\'K\�J	\�����kٌ\0���\���~6\�2\�&6\�m�z\�\�k$\�؊\�\�\"oz@7��\�*�\�\�?D\�s\�U^	=�_\�\�\0d���lb]�]�TZ��\�j.�\0\�ɭne\Z���\�\�ӌ\0$5�V�`�+j\�\�\�u=�\�p��������l\���b\�A��\�\�zT!R�\�c�t�\�\�\�\�p\�:`Z\�ț].���\��\��\�z)��\\tAlV\�{F%\r=.���^V���O\�+�sGxR\��Qȑ�3Fr`�̝,A<\�9�\�E\���s>^�p\�\�\�d-�}7���\�S\n.\�MO��\�t�a\�ux8��\�1\�h\�R\�81@\�561i	/n\�_0�\�C�ġx���3t2O\�7\0���~���ZcF\0mGg\�/\�\n��@Dqs��;V\�;]:\�u�\�6��P\�\�*��p�\� �\���l줯1`wI�\nr\n\��\�\�\0<ȑ\�UC�d�\�9\�\�\�`X�\�^،е�!\�c\�\�\�:pY��ٔ�\�1� �W�`L\�Bڞ�\�\�\�.pC$\0��D^C\��m\�\� zL$\�q�\0~�_MQU6\�|\nM�P�3>|�D#lsk�^\�@P���\�p#�_�u�ߵ?8&k\0\�M�\�\�t�F�%&NP��s KE\�\0\�k\�G\'&\�AP�X�֩\�	\�}��\�����1����\0\0��D�U����t}ئ\�|W��9_�b\��\��\�\��b\�A\�/ٲ�^^�f\��K+JW�p�}\0�?\�8\0\�\�|i\�]\r9?\�w\0י�\�; (C<ȩO\�G���g\��Y\�6]@0&\0�5N����\�\�l\"�\�%0�!\�ܑ\�0ؗU��=\0_O�!�j\0��=\�\�g\Z\�\�`�c����\�w\0R\�GS6�2�� \�oI.#\0 Y}\�`ԫ\�\�\r]X[-\�^D�\�gd���\�\��b\�A7\�s,Vh�r�]=�:p\0\0�>\0\�ēC�\�gmK)8f`��?8b\����\�\0l\�\�6�Xʫ\n�!aZ\�\�w \�\0ޱpr>m��{��P~\���\'�t��\�\��Re�\\:�\�O��\���汅\�ݶ{\�\0\0\0\0IEND�B`�',23456,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\telefono-inteligente.png');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_factura`
--

DROP TABLE IF EXISTS `producto_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_factura` (
  `idproducto_factura` int NOT NULL AUTO_INCREMENT,
  `idproducto` int NOT NULL,
  `idfactura` int NOT NULL,
  `cantidad` int NOT NULL,
  `descuento` float NOT NULL,
  `totalventas` float unsigned NOT NULL,
  PRIMARY KEY (`idproducto_factura`),
  KEY `idproducto_idx` (`idproducto`),
  KEY `idfactura_idx` (`idfactura`),
  CONSTRAINT `idfactura` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idproducto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_factura`
--

LOCK TABLES `producto_factura` WRITE;
/*!40000 ALTER TABLE `producto_factura` DISABLE KEYS */;
INSERT INTO `producto_factura` VALUES (1,13,1,100,0.19,215),(7,12,7,12,0.19,100000);
/*!40000 ALTER TABLE `producto_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `idsexo` int NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `tipodepersona` varchar(45) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `idproveedor_sexo_idx` (`idsexo`),
  CONSTRAINT `idproveedor_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,2,'CC','jordan','jordan@g.com','3124','sur','Juridica','2000-02-02',1),(2,1,'CC','pedro','pedro@g.com','377','norte','natural','1000-10-11',1),(3,1,'Pasaporte','roberto','rober@g.com','3555','orizonte','Juridica','0500-10-01',1),(4,1,'CC','palacios','pala@g.com','344','las mil','natural','2000-03-05',1),(5,2,'CC','cuesta','cues@g.com','322','las americas','juridica','2002-05-10',1),(6,1,'CC','sofia','sofi@g.com','3111','los castillos','natural','2007-07-12',1),(29,1,'CC','luis','lui@g.com','3222','villa','Natural','2023-12-11',1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `idsexo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idsexo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino',1),(2,'Femenino',1),(3,'Otros',1);
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `idsexo` int NOT NULL,
  `idcargo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `login` varchar(200) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idusario_sexo_idx` (`idsexo`),
  KEY `idusuario_cargo_idx` (`idcargo`),
  CONSTRAINT `idusuario_cargo` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,1,'yeiner','3111','dfhvwcvd@g.com','sur',1,'11','11','2005-12-12','cc'),(2,1,3,'mena','315','vegcjvwjc@g.com','norte',1,'123','123','2023-11-15','cc'),(3,1,3,'palacios','320','dcvwhscdvwu@g.com','orizonte',1,'1111','1111','2023-11-02','cc'),(4,1,1,'roberto','310','jvbcjwbvjwrb@g.com','centro',1,'1233','1233','2023-11-16','cc'),(5,1,3,'carlos','311','gfeigfeygv@g.com','sur',1,'100','100','2023-11-08','cc');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'new_tienda'
--
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Cliente`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int, in tipodedoc varchar(45))
BEGIN
update cliente set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, tipodedocumento = tipodedoc where cedula = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Factura_Compra`(in fact_compa int, in idprov int, in iduser int,in typeofpay varchar(45) )
BEGIN
update fact_comp set idProveedor = idprov, idusu = iduser,tipodepago = typeofpay where idfact_comp = fact_compa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Producto`(in idproduc int, in nombe varchar(45), in descripcin varchar(45), in image longblob, in route varchar(500))
BEGIN
update producto set nombre = nombe, descripcion = descripcin, imagen = image, ruta = route where idproducto = idproduc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Provedor`(in idpro int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int, in tipoofperson varchar(45),in tipodedocu varchar(45))
BEGIN
update proveedor set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, tipodepersona = tipoofperson,tipodedocumento = tipodedocu where idProveedor = idpro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Usuario`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date,in clav varchar(200), in sexo int, in cargo int)
BEGIN
update usuario set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, idcargo = cargo, clave = clav where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Venta`(in idfact int, in tipodepago varchar(45), in identificadorusuario int, in idcliente int)
BEGIN
update factura set tipopago = tipodepago, idusuario = identificadorusuario, cedula = idcliente where idfact = idfactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistroActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistroActualizar`(in idusu int)
BEGIN
select * from usuario where idusuario = idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Cliente`(in idcli int)
BEGIN
select * from cliente where idcli = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Factura_Compra`(in idfactcom int)
BEGIN
select * from fact_comp where idfact_comp = idfactcom;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Producto`(in valor int)
BEGIN
select * from producto where valor = idproducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Provedor`(in idpro int)
BEGIN
select * from proveedor where idpro = idproveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Usuario`(in idusu int)
BEGIN
select * from usuario where idusuario = idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Venta`(in idventa int)
BEGIN
select * from factura where idventa = idfactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Cliente`(in ced int)
BEGIN
update cliente set condicion = '0' where cedula = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Factura_Compra`(in idfactucom int)
BEGIN
update fact_comp set condicion = '0' where idfact_comp = idfactucom;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Producto`(in idproduto int)
BEGIN
update producto set condicion = '0' where idproducto = idproduto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Provedor`(in ced int)
BEGIN
update proveedor set condicion = '0' where idProveedor = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Usuario`(in ced int)
BEGIN
update usuario set condicion = '0' where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Cliente`(in valor varchar(45))
BEGIN
select * from mostrar_cliente where Cedula like concat('%',valor,'%') || Genero like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Factura_Compra`(in valor varchar(45))
BEGIN
select * from mostrar_factura_compra where Identificador like concat('%',valor,'%') || idProveedor like concat('%',valor,'%') || IdUsuario like concat('%',valor,'%') || Fecha like concat('%',valor,'%') || TotalCompra like concat('%',valor,'%') || Descuento like concat('%',valor,'%') || TipoDePago like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Producto`(in valor varchar(45))
BEGIN
select * from mostrar_producto where Identificador like concat('%',valor,'%') || NombreDelProducto like concat('%',valor,'%') || DescripcionDelProducto like concat('%',valor,'%') || Precio like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Provedor`(in valor varchar(50))
BEGIN
select * from mostrar_proveedor where Identificacion like concat('%',valor,'%') || Genero like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || TipoDePersona like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Usuario`(in valor varchar(45))
BEGIN
select * from mostrar_usuario where Identificador like concat('%',valor,'%') || Genero like concat('%',valor,'%') || Cargo like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Cliente`(in cedulaID int, in idsex int, in persons_name varchar(45), in phone_number varchar(15), in gmail varchar(45), in direzion varchar(45), in dateofbirth date, in tipodedoc varchar(45))
BEGIN
insert into cliente values (cedulaID, idsex, persons_name, phone_number, gmail, direzion, '1', dateofbirth, tipodedoc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura`(in tipodepago varchar(45), in CC int, in iduser int, in numerocomprobante int)
BEGIN
insert into factura (fecha, tipopago, impuesto, totalfactura, cedula, idusuario, condicion, numerodecomprobante) values (current_date(),tipodepago, '0.19','1', CC, iduser, '1', numerocomprobante);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra`(in idProve int, in idusuario int, in typeofpayment varchar(45), in numerocomprobante int)
BEGIN
insert into fact_comp (idProveedor, idusu, fecha, total_comp, descuento, tipodepago, condicion, numerodecomprobante) values (idProve, idusuario, current_date(), '0', '0.19', typeofpayment, '1', numerocomprobante);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura_Compra_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra_Producto`(in idfactura_com int, in idprodu int, in cantidad_compr int, in precio_unitario int)
BEGIN
insert into fact_com_prod (idfact_com, idpro, cantidad_com, pre_uni, pre_total) values (idfactura_com, idprodu, cantidad_compr, precio_unitario, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Producto`(in namez varchar(45), in descr varchar(45), in image longblob, in route varchar(500))
BEGIN
insert into producto(nombre, descripcion, cantidad, imagen, precio, condicion, ruta) values (namez,descr,'0',image,'0','1', route);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Producto_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Producto_Factura`(in producto_id int, in factura_id int, in stock int, in discount float)
BEGIN
insert into producto_factura (idproducto, idfactura, cantidad, descuento, totalventas) values (producto_id, factura_id, stock, discount, '0'); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Proveedor`(in idsex int, in typeofdocument varchar(45), in namez varchar(45), in gmail varchar(45), in phone_number varchar(45), in direction varchar(45), in typeofperson varchar(45), in dateofbirth date)
BEGIN
insert into proveedor (idsexo, tipodedocumento, nombre, correo, telefono, direccion, tipodepersona, fechadenacimiento, condicion) values (idsex, typeofdocument, namez, gmail, phone_number, direction, typeofperson, dateofbirth, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Usuario`(in iduser int, in idsex int, in idcarg int, in namez varchar(45), in phone varchar(45), in gmail varchar(45), in direction varchar(45), in loyin varchar(200), in contra varchar(200), in dateofbirth date, in tipodedoc varchar(45))
BEGIN
insert into usuario  values (iduser, idsex, idcarg, namez, phone, gmail, direction, "1", loyin, contra, dateofbirth, tipodedoc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in log varchar(200), in pass varchar(200))
BEGIN
select login, clave from usuario where login = log && clave = pass && condicion = '1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verdetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verdetalle`(in valor int)
BEGIN
select f.idfact_comp, prov.nombre'proveedor', usua.nombre'usuario',f.fecha,f.total_comp,f.descuento,f.tipodepago,f.numerodecomprobante,f.condicion,fc.idpro,prod.nombre'producto',prod.descripcion,f.descuento,fc.cantidad_com,fc.pre_uni,fc.pre_total  from fact_comp f inner join proveedor prov on f.idProveedor=prov.idProveedor inner join usuario usua on f.idusu = usua.idusuario inner join fact_com_prod fc on f.idfact_comp= fc.idfact_com inner join producto prod on fc.idpro=prod.idproducto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `mostrar_cargo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cargo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cargo` AS select `cargo`.`idcargo` AS `idcargo`,`cargo`.`nombre` AS `nombre` from `cargo` where (`cargo`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_cliente`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cliente` AS select `cliente`.`cedula` AS `Cedula`,`sexo`.`nombre` AS `Genero`,`cliente`.`nombre` AS `Nombre`,`cliente`.`telefono` AS `Telefono`,`cliente`.`correo` AS `Correo`,`cliente`.`direccion` AS `Direccion`,`cliente`.`fechadenacimiento` AS `FechaDeNacimiento`,`cliente`.`tipodedocumento` AS `TipoDeDocumento` from (`cliente` join `sexo` on((`cliente`.`idsexo` = `sexo`.`idsexo`))) where (`cliente`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_detalle_factura`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_detalle_factura` AS select `fact_comp`.`idfact_comp` AS `IdentificadorFacturaCompra`,`producto`.`nombre` AS `Producto`,`fact_com_prod`.`cantidad_com` AS `CantidadComprada`,`fact_com_prod`.`pre_uni` AS `PrecioUnitario`,`fact_com_prod`.`pre_uni` AS `PrecioTotal` from ((`fact_com_prod` join `producto` on((`fact_com_prod`.`idpro` = `producto`.`idproducto`))) join `fact_comp` on((`fact_com_prod`.`idfact_com` = `fact_comp`.`idfact_comp`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_factura_compra`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_factura_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_factura_compra` AS select `fact_comp`.`idfact_comp` AS `Identificador`,`proveedor`.`nombre` AS `IdProveedor`,`usuario`.`nombre` AS `IdUsuario`,`fact_comp`.`fecha` AS `Fecha`,`fact_comp`.`total_comp` AS `TotalCompra`,`fact_comp`.`descuento` AS `Descuento`,`fact_comp`.`tipodepago` AS `TipoDePago`,`fact_comp`.`numerodecomprobante` AS `NumeroDeComprobante` from ((`fact_comp` join `proveedor` on((`proveedor`.`idProveedor` = `fact_comp`.`idProveedor`))) join `usuario` on((`fact_comp`.`idusu` = `usuario`.`idusuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_producto`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_producto` AS select `producto`.`idproducto` AS `Identificador`,`producto`.`nombre` AS `NombreDelProducto`,`producto`.`descripcion` AS `DescripcionDelProducto`,`producto`.`cantidad` AS `Existencias`,`producto`.`imagen` AS `ImagenDelProducto`,`producto`.`precio` AS `Precio` from `producto` where (`producto`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_proveedor` AS select `proveedor`.`idProveedor` AS `Identificacion`,`sexo`.`nombre` AS `Genero`,`proveedor`.`tipodedocumento` AS `TipoDeDocumento`,`proveedor`.`nombre` AS `Nombre`,`proveedor`.`correo` AS `Correo`,`proveedor`.`telefono` AS `Telefono`,`proveedor`.`direccion` AS `Direccion`,`proveedor`.`tipodepersona` AS `TipoDePersona`,`proveedor`.`fechadenacimiento` AS `FechaDeNacimiento` from (`proveedor` join `sexo` on((`proveedor`.`idsexo` = `sexo`.`idsexo`))) where (`proveedor`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_sexo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_sexo` AS select `sexo`.`idsexo` AS `idsexo`,`sexo`.`nombre` AS `nombre` from `sexo` where (`sexo`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_usuario`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_usuario` AS select `usuario`.`idusuario` AS `Identificador`,`sexo`.`nombre` AS `Genero`,`cargo`.`nombre` AS `Cargo`,`usuario`.`nombre` AS `Nombre`,`usuario`.`telefono` AS `Telefono`,`usuario`.`correo` AS `Correo`,`usuario`.`direccion` AS `Direccion`,`usuario`.`fechadenacimiento` AS `FechaDeNacimiento`,`usuario`.`tipodedocumento` AS `TipoDeDocumento` from ((`usuario` join `sexo` on((`sexo`.`idsexo` = `usuario`.`idsexo`))) join `cargo` on((`usuario`.`idcargo` = `cargo`.`idcargo`))) where (`usuario`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_venta`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_venta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_venta` AS select `factura`.`idfactura` AS `Identificador`,`factura`.`fecha` AS `Fecha`,`factura`.`tipopago` AS `TipoDePago`,`factura`.`impuesto` AS `Impuesto`,`factura`.`totalfactura` AS `TotalFactura`,`cliente`.`nombre` AS `Cedula`,`usuario`.`nombre` AS `IDUsuario`,`factura`.`numerodecomprobante` AS `NumeroDeComprobante` from ((`factura` join `cliente` on((`factura`.`cedula` = `cliente`.`cedula`))) join `usuario` on((`factura`.`idusuario` = `usuario`.`idusuario`))) where (`factura`.`condicion` = '1') */;
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

-- Dump completed on 2023-12-13 13:58:28
