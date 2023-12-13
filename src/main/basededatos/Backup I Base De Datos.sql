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
INSERT INTO `producto` VALUES (10,'TV','Funciona',2345543,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0€\0\0\0€\0\0\0\Ã>a\Ë\0\0\0sBIT|dˆ\0\0\0	pHYs\0\0±\0\0±õƒ\íI\0\0\0tEXtSoftware\0www.inkscape.org›\î<\Z\0\0\n‚IDATxœ\í[l\×‡¿Á¬ö²»¶‰\İôb©H‚\ÒL…\Ò4)²	+±bºV)‚¨m\Şú\Ö(R›€È¥\íCê¶²\r/\Èl\ì\0V.NDHR•¤„¦Iâ°´iLUÂ‚±ƒVxmŸ>ÌšR\ì¹í™\İ9Ÿô—0s.¿9\ç·çœ™9;«¾|¸+·\0±\\\0Œ\ç\â?ÀGÀ‡À_€\Ï\\Wª\Æj\àyôNy\Æğºi%€´\0¯§ÅŸ€N Âµ³Q8b=ğ1ò;ş\Æøø¡;§¤°\Ã×~Š\ßñ7Æ\\\İ\niÒ¸\ßùsq\Ø\\ô³TÌ£x˜Á»ÎŸ‹Y\àE`q1OXñ?*—ñ¾\ãoŒW€%E<ï¢ y-À!\ÕÀĞœG\ŞÏWĞ¯õÇ€Ë¹c1 ıro\rğ pku\âÀ•<ò*,¨B¿sò©¼\nô wªSš€\Ş\\N\ê|XšG}\n\álØŸE\ï¼oH¨û›@_®L»õ\æ4+$ñ\ì7şpo4ü\08\í@Ç¯‹ !tb¿\Ñ_\"E\Ô;Ğ³µˆZ\Ã\Øk\ì\çpgQ«¿²©\é}ô”=±n\è<\Ğõsº\Î{ «\ìø7ş\ëü9¬\Ö&_x\'­|x9«\íJ ı®İ»\è÷2¹\Ëıß‹À\Æ\\Z;,\Â|M°\Ûf9\n–o1¿q¢\ß°¢\Ø	|¹@fC÷3¹¼VT\å´,¤O\İ\Ä\" ıÚû·\Õsy\rx‚\Â]\0~Œõ\ârğ#ô›N¿C¿XjwYËŠZ\än\nj\\=E\Ş\ÜBq6†œB¿+XV˜\rS\ßE_4}¨—X\ç$pH¢?Î•\É×€?·I.w\0\ß\ÎI.WCŸB6\0\Ë$–{\Ş@ÿPØ¢øò?A7\Æ1 T\ØùıK\Ñwò[÷û\È]Ü…€\×\\\ĞıW\à3!‹\ÑY\År}ü\Òik™`v¹(;•¨ûiu\à·, ÷¹,D O²ø§\Í:Ç\ß\íÀ¹hşˆ¾?ÀN)‰º\ÏÚ¬Sfô\ÍU>·ø)úå•«„B¡™©©©C2ÊªªªŠg2\ÓmYmmmŸ÷õõ}T__Ÿ]\èøùó\çC=ö\Ø]\Ã\ÃÃ·š•S]]ıê«¯ ÷\Z•••[³Ù¬‚nz\"8»I\"-ššš„,V¯^mX¦i¢¯¯\ÏvY===B\Ó4\ÃòÖ®]+M÷\İw\ß\íz»\ç\â|®\ïy\Âš¦‰7\ß|SZCÖµg\Ï\Ç\å\íÙ³Ç°¼ÁÁAiº_z\é%¯ \ĞG~†İ®8\ZŠıû÷Kk\Ä9º»»E8¾VÏ²e\ËDwwwA\åUWW_+¯¦¦¦ òŒØ·oŸˆF£^\àu\rı‰U#\Ä\ãq¶m\ÛFE…œoDE£QÖ­[G$Rœ}|ò\É\'\\½z•5kÖ°lYa—\Õ?~œ›nºIJyF\\¾|™÷\Ş{‰‰	)\å\Í\ÌÌL&9r\Ät©2ª¡oz4|ú599I8–\"J\á.“““V´)\r}(0D\Ó\Ã\nŸ£i\æÏ¤·sUÁ¸\ï¾û‡Ã„\Ãa\î¿ÿ~úûûkvÓ…B91==-ººº\Ïõ‘G\Ó\Ó\Ó^Ë”ŠUÿ\Ê\0»v\í²lİ»w{-S*V\ç˜5@&“¡¡¡\É\ÉI\Ót‘H„s\çÎ±dI\É}\ÍoA\Ô\Z Ç‰\',;ôË¾\'N¸ \È\Æ\0\ã\ã\ãEI[\ê\Æ\0·\İfˆ“´¥N`°j\Õ*n¿ıv\Ëtw\Üq«V­rA‘?Œ4Mc\ïŞ½¦·´/^\ÌŞ½{]T\å=1\0@ss3\Éd’h4:\ïX,#™L²~ız”yG`.¯\'Nsğ\àAN<	@SS‰D‚\Ú\ÚZ•\É\Ç\ê20\ê>€\Âe€€£p”o\r\ÍfÙ¹s\'hš–W466ò\ä“O’\Éd\Õ=22B<\'SWWGWWŸ}fÿ§FGGyè¡‡¨®®&\Ç\åw\ß=›7o–¶ù±­­M\Ì\Î\ÎÚªû\ÓO?±Xl^555bdd\Ä2ÿ©S§D]]İ¼ü7\ß|³-´ic£}üg€şş~\é;`“É¤­º‰„a–ù\Û\Û\Û\róoÙ²¥Ğ¦qLI\Z`ûö\í\Ò\r°c\Ç[u/ôé‹P($\Ò\é´a\Şt:-B¡aşh4*«‰lc\Õ.¾]xE6»\à·Æ®;|ø°\áñ#G˜\æ÷#¾4@ss>\ï‚6gÃ†\r¶\Ò\İ{¯ùKF\r\r˜\æ½\ç{lip\ßM\Ó\ÓÓ¢¹¹Y\Úğ\ß\Ò\Òb{³g__ŸiY¡PH\\¸pa^¾‹/Š\Ê\ÊJÓ¼N¾Ÿ(\í\ã?!\Ä\ÔÔ”Øµk—hllÌ»\ãW¬X!z\ê)‘\Édl\×{\é\Ò%Ë\ì\íí—¯§§\Ç\Ò8f\ë‡bQ²0\Â\r½›6m2­£µµu^7š\æÙ´i“mN±j/_®¼¦³³\Óôø±c\ÇH§\Ó\×ş¾t\é\ï¼óNAez…2À\Ä\ãq*+_š\Íf\Z\Zºö÷¡C‡˜šš2L\n…hoo—ªQ\Ê\0‹\Å,¯D®_ñ[­ş[ZZ|»\ÙDÀ\0»\Ó@)ÿP‚;‚¬v¸\È\Ò;>>NCCƒ\é\Ğ\Ş\ÛÛ‹‚\Ç\Ü0M(bllÌ³Àª½\Ôo\İ07\r¦°4œŸ‡PS€)v¦·\ß~\Û4\Í\Ã?,S’t\Ô`‚iÀ¯‡P›B\Â\ÎÕ€~şAÀ’BVğ~^ıÏ¡¦\0òü0üƒš\n&\ßi †P°E>Cy)ÿ ¦\0[8ü2üƒš¤\àt\Z(•\á”l\ãdH/•\á\Ô`»Ó€Ÿ†PS€4\ìN¥4üƒ2€#\ì\í¥4üC	N‘H\Äğ}\Ñh´¨¯x³šü6üCN---y“A,£££\ÃğxGG‡¯:\ß.%µ+xddD\Ô\Ö\Ö\Î\ÓY[[+NŸ>]ôúS©”¨¯¯ŸW}}½8s\æL\Ñ\ëwŠUÿ–œ„\â\ìÙ³¢³³SD\"‰D\ÄÖ­[]\éü9R©”H$bùò\åbùòå¢««K¤R)\×\êw‚Uÿ–\Ü\Z@áŒ²[(\ä¢p”2@ÀQ8\Ê\0G \à(e€€£p”2@ÀQ8\Ê\0G \à(œE€\éFw;?¸¬ğ\'6únj104\Z¥xô\ÑGI$¦¿¸YŠ\\¹r…T*…¦i¬\\¹’ªª*¯%Ieff†şş~«dc\Z0´_’Â‡/†,“)Ê•!\rg€\Å(\Ü\åK\à\Û\è‹À	\àAoõ(\\\ægÀñ\ëÿ£\ï\àWQ\Ñ\ÃT\0/ø@œŠ\â\Æ°xC\ìÀ‡>ªBnœ\æıp’\Ù\×F\î6¢\ß#(§¢\Õ÷·\Í\ßı^ZœF7€¿/”Àü{Cå‰°8¨6Q\Ï2@ÀQ8\Ê\0G \à(e€€£p”2@ÀQ8\Ê\0\Ç\ÏO£?Í’ùX\Ô\n™u¢\ï±Xšg\rx\rïŸ¡ËŠW	\ØS\ÆBI\à}§ÉmR[H~\æ\í\\)ğZÀBø\Õ\0\n—ğ«y- õZ@)Q¼…÷ó¶¬8š;\'…BÀ/€/ğ¾ó\ÏK\ä6<ş*I{·\".\Íù\0\0\0\0IEND®B`‚',12345,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\monitor-de-tv (1).png'),(11,'teclado','Funciona',34567,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\Z \"\"\Zÿ\Û\0C\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0A\0\0\0\0\0\0!1Q\"Aaq2‘¡	$B’#3±²\Â%RSTdr¢³Á\áñÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\01\0\0\0\0\0\0\0!1AQaq‘\"2¡±ğ#\Ñ3BS\áÁÿ\Ú\0\0\0?\0\ß\ê\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 +Ş®õ‚\Í\Ñ\ËK¥\æ,¹)˜ùŒ\Ãq”\ÒJœ\ØW‚§V„~9\ãµ	Q´\ßqDZÿ\0hL\æa2¬ºª\"ı}•—Sù¥\Üş” p·x\İ\èô\à’õ\ê\å?\ï6™Š¡@4[üUôr\äp\ÏP,\è?ñ*[÷š¶\Û\ÖŸ]\ÂL\rq¦¥v\r]XQü·\æ€i‡s…qN\è’\ã\ÈO«.¥cô4V~¿•û@@@©ş\Ğ{`\Ğf¤mÉyŠñ>Iq¿óŠG¡Û¬’­ö÷QlŠ\Ú\ĞÀJÔ¦AóÏ¼HP=ˆl\Õ\'“•\ÒFñ\á/i\Ìõ$½Š\Ş¶<x,\Ç+\'rüÄ«¼1úüjeuGŸ9N\n\Ù\âÍ\Ùi\Ø\ÊB¶ùÈ%\ã´‘´¥_\Ô\İ$\Îú¬#ó\'\êŸğG#¡\Ó\ï\åõY\\mjg\Æ\å4YRrx<÷\ì/tO±¥Í¥Xø\ìsV¶µ7Ku^…Ë—A‡\r‰\ÖT”¨#\Ï\Ã=\ë\'ˆfŒôE½\á\Ò\é~‘\×=k{»¦*\î¹z\Zg\É	-6×˜w!\\ñ\ÎI\ïƒ\ÇzÅ¥v¬\ê\à\ì*JŸ´@@\ã\È/\ŞµŒ}\éB\ÚDy	R»‰\rŸ\î\ÍCt¬´ \ç%»9¯k¹\"$£yñ’„\íRRš\É\nÁ·Ê¡\ãS\Ö\Í,Qx¥\r‰6$¸³—m²™\ãûV€uÌŒŸÒ³–	­µ83O™:3\íÄ¸\İ\Ğ\Ê\ä¡\n[#zÀÜS“Âx\È\ãæ§‡K]É¦O…s\'õ\Ó\Ã_;Ğ™v›dw\"\\\ßS\Ê(,—RBAU\ê~\áÚ¾“†”rE\ãœ6=>\nR]\Ä?QõE\Í}<¿B™.K\È}\èm\'\Ï@9kZ°­ ÿ\0>•\çñ±ŒeQTzù±B#\É\Z\Ò\ÉOvß´:ÿ\0\nBƒ‹û>—Ç¢r™?\Ìÿ\0+Ï½JI¾h£ª\Õ&@@@xL…\áØ²\ØjDg’P\ãO -I\î\nO}h\nOYøA\é6³.¸­6›D·L‹3†)şA–\Ï\âšŠ\Ô^\ï6…-ı­P\êFJc]Y-+\éæ·\n›\"ŠcXt‹¬\Z·x\Ñò\î\Û2a¶&µ·Ô–ò >©*Tg,0–\èB¶j9‹„ó\É\Ó\×;\Øyp‰>ZÀ\nA\ä`\Ücš\è‡’\n“1\\3Œ¹ õ0µ··]lò-M6\ãÈ–\ãO<©b›-‚@¹\É?*\Ï6g‘\Û7Jr—>MêŠıöhÃ¨š¢\á¢–Úµ†ŠŠ‰÷”\êp~I5ˆz\Ï\Ğ\è}\r€(€(€(€(•©(B–¢”Œ’N0>´\ZwMõN\È.w­/\Èó·*:\ß@/;ğ…©@\'zp­¹8gœ€©u·‚}©\\¹I¶\Ü\'Û¥\Ü§]ó\Âf6V¡‚¡¼oJ¸\î@JødğÖ¾‚JüËº.“.®4\Û+m*J[a°H\â*R‰\ïÀO=\è\rƒ \n\0 \n\0 \n\"\ïª\ì6\0M\Úõm·\ÜË”\Û_\â\"€[·u§@]\î\ÍZ j\Ë\\©\Ï­¡‡·…@¡\îş´2\\uUÎ¥¦}\âU£º^„¨~æ€¯µ÷Vt“ú?PB‰|isdÀ\Ë\nm—J	\Âvƒ\Ü\ĞNuG\é\Ëdˆ¨}\×´!¶—\r¶\Â\\Û€@YHX}\Ò*bLÿ\0ñT-\ÚV\á#\ÑO¼–\Ç\èAc.ñ`\Ô\ËbõL\Ø/2-Ç)ñ\å\Éù6³{6œF3Ae¿BB€À»\ß-š~¶]®1-ñ7y\Ò\ŞKH\Ü{\r\Ê gŠ¥¼ø¨\éÅ•\Ù,¹r’ó‘Ò¢ \Ôec)I^2q\İ Ÿ¥´W÷\ïzn3²Zµ\ÅCŠfJ#m’¥!y_\ÜR†@?ó1\È\ng_ø¬WQWjS¶™rlğ™ö·\íf8\Ç\ÚÜ¦ö)M’ Â±“€9ÁW–lqù¤½Î¼<Ÿ\\X¥.º\'·y“q\êö\Ã2\åLôSNGŸ\r”\ëvu\ÌX|+At\ã;~\'¹=ªqdf\ãmrı„yå“\\É¶•®õ¯\ÓqX\ê^¬k\ë¬_´­Ñ­\é%-Á}\æ£\Åj<w6”´•e_w±\ìšô#ÁI\Ûr7ö<Ü˜eÓ¯ME‹ü_~¹^nª\Ô\Ö\Ö#IdG&m\Ü!\ä8	J\\)O¾R€®\Üw­WŠ\é\åZ«TŸ\ç©Í’n+>­M¨Ü—r\ÔP.·qÛŠ\ä8fCÄ¸\â’Tó¥i	\'b\\\ÆNw(qŞ°Ë‹`¥Šm¾ºW±”rds\å”iyŒõK5\n<¶—%q\Şw\ÉB‘	ó9\Ây \ç ƒ\Æ>µ\Èjœ¹š­\Çz±wmDI\Û)u\â\â‚Q·i=\Æ~<c=‘Ú™ú\îÿ\0¥-VH\åWk‚¿¨`¬p\â”I=€\n³\è3F¨¬d¤\Ú]¤\ÄKÉŠÈ¤©ğ„‡\ÅXä–sPj{P\Ze\ã›]\ÆlXôsö_´\ã)&\è\ê\Ğû‰(R7aµ„({ªHQ9\Çj\Å\'ª£Rf^\Ñ2\í2l\İ,\Ü\É%)\×W)8/\ì).„uIH\îH\ìš\Å\áO«÷9ğ`X´Ro\ÌùcZ]\ã1Z-q£°\ãoùQØŒ\ÚJü\Â\Ò\È’¬%	\'8	$w\ÍWúLOu~¬\ï†y\Ã\åtuY{B#~\ìúJÙš[Âšw*XJNB>¦¯tQFË\Ïş\Çùù\êCN\Õ•*Bİ¾G\ÜÜ¦¤ù>Ğµ‚·F<¾W‚”ı\åS\Ík[\Ë,\åóI¾ƒVŒÄ«õ\Å\é·XsaÀ¶\Èp{3 ¼¬6\Ñ\'q\ä)A\\ú|\ë\Õ\à#>\Ë+‚»¥]]³\ÚN„”\Ây\æ\Ú.wr©)CiB§\0}Ï¥`¸<\ê¯\îõ2”\ÔV¬mtÄ´h9\ÒfÍº¡\Ë\Í\Õ\ç[|\îº˜\í£%)O+\'·Ò¶\â1¼<4 ÷vß†¿ğ\ä\Ç5“ˆml—\ç\ÜEŒÅµ\r\Ør\r\Å\Å3—n\r3jG9(·{\Éõ\ä\×*Œ”ŸÃ²ö\Ó3IN.\ãù:\íù\æJX\íV»„‹©U¯÷ \îXö”¨9À	\ç$ù\ã\çTzbJ·e\ã®f\ïd—»³b<:Z“\â#K°\Û[cÚ¢(€\Â|¸¤}r¡Q—t¼NU\'\âÎdv.8–›[‹PJ	$ü\0 9G\×\Íd\ÏQºy¾7\ìo\ÂyE˜‹T\Ùq„©-¶JDsÜœPÌ¦\ÊÑ¶c.K_\ÔZW¹\Äp©«Ú¬¾¿‰\ì;ü’{ªªLQ\ÓQ\ÃM(G³9„0¬y‡.e\åcÿ\0Òó§¡¬|\ë\Ğú\r£b“ho-\ÊGš”ñÂ²§1\è>\êG\ãQO¸\Ş2ŠZ\Íû\ÒjÑ»+”WjlICE-¸?²	Oùœ\äš\×-ôò\"sNş6ÿ\0<\ËS§ñn\Ì\ë\î*M\ÆkL©,3´:\Û@½¸+\Ğ+\Ê\ã\çšôó®Ï…\Ç\ï+•õ\îF3U\â0Z/±o—		&Z#\Â@Rœöµœ¬$\'¾A%i\ã\ë\\ñ\áòK\â/D\ë\ég,²EMc{Õ•·\\f*(TxòR\Û%”3+~]u[Õ”„e^™\'\á\Ís¦›JLºM_*\ÔFm»‡ôºF2\íğˆ €[Kg\İ ’®U·?ñÍ®\'¯‡¿Rµ;†Šºût=ôÍ¦t›{S\áOÚ‰¯n§bd-e\Â=Ó»Œ\ê¦j)E.\í}YHJw‘´´zz.¦\Ùøg»G·u‡½\Él\Ü/3\àYRIŠ\áa¢ÊœNr¤2ø¶Aô5\\\Ë\ãcƒ³\ŞoOz\È\ë µ­šF¢\Ò7»TI\ÏÀ“6#Œ·)„\î[JRH3ô\Èúô-n2œYq¶¦\Â[ª!E\È\ŞYË‹Ü²qx\Ú=V¼X©¹üQU\ßzı¿ôøwD\Ü\ÆO‘l#\ç\Ç÷¢¢¼\râ¨¸\è{³\Ñ\Ëh‰lJFHq)÷B#;~ \Zšğ4‹kiN\èK¼–§8Z´0©RZ@Q*m´„ç”¤„ƒ\È\ïüqU¤ÿ\0\Ä\éÇ“\"Iöµ^,ô:6\à\İ\Îl¥Á³8\Ë\ÈJgwº€3\éù\ÈVÑ´©:3\È\æ\Õ9§\êN\ÜM\î˜\Óv«\"cÇ•\rl©1K>[®=—’pv6\ß8 gó]œfeši\ÃD’_\Ï\Ô\ÆnØº\Ì]A\Ûóm\í\ÃU\Å\æ‹F3\í$7´\çy\\œ’y\Èô¨Å’R”c•ü7®ßŒ\ç$\ÚÜ›\×\â\İõ™_a½11\×\äGšR•‡›o	\nNH8*\nVqüU”\åû\ã\Ñ^cı´²oZˆ­\é\Ç\Ğ\Õ\ã~šw\Ø\Ü)1ˆÀ’´ ı\â@\ç\éDòv|µ§‘Fñv¼\îZ¥\Ş\ë¸Ã¥\"Ì·›L9¶\ÙQŸmhq\ï\İT†\Ğ³08\Íe,Š\×qN\ÓpË–W¿]z›\áI\Ş\ïú¦Ï¨]\Ó\Í\"\ËhzSé½¨\ÖòiHòû`­Á_Á\ïûØ¬¤\í¶u\â,WC}*†¡@)\\:]£n¸\ì­3k[®(©kÒ•(“’Iæ€•\Ğ\Êı\0–«2G÷*–E:¢\ZN¦RZ²1/\ÚÉŸûÁH\ï\Î\Ñô©±H÷•\Ñ}3>n”µóş£[?ÃŠ‹ˆi¾ºs-µ¥6J±)Ô”üÇ¼G\éSb‘F\Üü\êt¼÷\Ù÷ûK\ì/\Ú\ãk)\Ï\ÂT3Š›#”VŸ\áO¨\Ì\å1i”o*n3ü\Ér±n\á\áÏ©ğòU¥x‹Ysüõ:\nb´\îkø!E\í}\0wR!)cóH4\ĞQ!Ó‡j®¡j†­[\'Z ·…Ì™6*\ÛK\r\ç\à\åÁ#\ã\ÉÀ¦\èD÷GH\à\Âb\İˆ‘šCQ\ØB[m´$%)H\0Àü*¥‘“PX(€(€(€(€0( P\0Pÿ\Ù',234567,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\teclado-gamer-esca-gxt-853.jpg'),(12,'PC','Funciona',2345,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0€\0\0\0€\0\0\0\Ã>a\Ë\0\0\0sBIT|dˆ\0\0\0	pHYs\0\0±\0\0±õƒ\íI\0\0\0tEXtSoftware\0www.inkscape.org›\î<\Z\0\0\ßIDATxœ\íy\ÕyÀ\İs\í=»\ÚK\Ò’Xt\"„$@€0¶„\"—M°I\ìrˆ«(bWŠ\nIL.Sv¨¤|\å²\ã\Ø!¦\íT6\n11G…€p°.@$¡{iµ\ç\ì\Î\ì\Ì\Î}õ\Ë£™İ™\Ù\İÙ£U]S¯\ß÷^=\ß\×ı\î\×P¾˜?~8QÂ‡Œ\0/{\â\Ï+vV\0\'\Ğ\Ş0Z?,óş‹+pí õñ³ùş‘\Å\Êw\Ñş\Ï/”\ã.if±aF†©\æŠV¬{ˆ\Ê\ê6\í´\ÊB(L:l(B€ˆ\âs÷\ày!¢‰b/µRP#Ö‘`|€õÛ ¾\éz\Ô\É/²\ÉF\Ğ\ç Úº\0ûğ‰\"·Ê‹¯–¦4\'Ÿ°6n\ĞBEÁh0¨\ÂUµ]\É\"-\å\æ\0)÷+I†tr%H>‘z¯r¹9€Nº”9\åV	\Ì	«€w!­U\É\n\Ù`¢\Æz\r–Ê”ªÎŒ\è¿gˆ³Ç¾ƒ{\â¢Öª\Ì‰¥»X½ù+YI\ëD$\ì\åÄ¡¿!\è\ÓZ•9\"\é“h4@\Ç\ÚG2J\ëu€$†û^/b\ãO36x¿§?£œşH\Â\å8£\nK²	Y6i¤MnD£H¨¯xœ¨¶n›5\î\0I(Ñ *¼¤õNš\Û\ï\ÓH›Ü¸t\æ;¼W\âa%\ZÈ˜F/\Ê\İ\Ê\İ\Ê½„,›Ua\×ø»x\'\Ïi¤Mn„ü£ª°d0\Ï 9\î\0I\Ô\Ôway/„\'‰„\'5\Ôh\îTÕ®\Ê(£I,_u/Fs­\ÖjÌ›ú\æM\ÔXWg”\Ó 	sE\×\ïøFNı\é…F}ó&6lû«¬dõ\" \ruKÖ±ı®\Åaû€€§˜ƒ\Ì\Ô\Ô_Ÿ\ä\Ø3¦\Ñ`dƒ™¦e;´V#\ï\èE@™£;@™£;@™£;@™“m%\Ğ´\\ı-f–%ŸxGòv1I2`²X‘³\è‘\Ë	!H’Œ\ÉbWV³9À.\àsÀ\İ@Ç¼®RÀ¼ûÆ—ó~\r³¥ú–-4·\İF\Ó\Ò[@šÛ‚,¿gˆ\Ë\ç_À>|”H\Ø€\ÉROKût®ıfK}\Îy¦\Ódğ}\à\Î9i©3+5õ]\\{ı#X›6\æ”nlğ \ç>x\Z%\ZJo²X¹\î\æ¿S-tq»\ìøÜ®x\Ø;y+\ç¨J—¼R\à\à\×Àšœ´\ÓÉšP`‚\Ñ+esÖ«’\\ö3||ô\ïJxF%\Zd|\è-m;1škb\×\nú	‡¦\'¸„ƒv&\í\ï©\Ò%V\ï^\0ª³½¹!„B\ï\é}öüw6\ÒtŸø1B‰d”Œ„=ôŞ—“.Su€µÀ/I~#\Ô4 \íz6\íBZ²z\Ça\"Ò¥ğºg\n\Â\ë€ş(½\îqUtÏ©g©±^3kq\àqö\âqõª\Î\íùd=\ßüZ>¿\Â_~\ã\ÇOz\ãq\ãCGˆ„\ÜYhMYô\Û@\ê\ænº\é+\Ï@u\î‹²@‰\Âğ˜jf“\ZÚ ız\Û\å\ÍFœx-\'D”\î“\Ïp\ã\'0c\Å\Ğ\í\ìV…\ëj\rüç¾µ\ÔTÇ\ÕŸ[K\×M\ÇUyz\\}\Ô7o\Ê\ê6d`3p¿J\é\Í{şüy\İø³1\é%‡A\"£ù\îÇ‘nØ«:\íqõ2>rt\Æd\É;›Mq\ãt,·`2©\'\Zõg­–L¬\â7¹\é‘¹tW\Í.’kbN\é\ä\İ_…:õPóø\à¡å“‡¥{/xóÿ¦köûş\ÃF8,’Ò´d­‘X{?t\ëĞ˜\Ûnxt%´X\à\'— Ï—9M«]%R?\î\ç\Ì\Ü\ÂC˜£`´ oº\å\à\Ï\ã§&l\Î(^\ß|²lB¹\Úö>t†½»ğú¢¼õK%o©l¢Æº2{u€NÕ™\r·g \Ê\0û·K\ìlŒ…¿\Ğ›³´£^\İ!±ª\n@\âV¸ó @IY\Ğ^ x&!’¹V>#›‰m\Ô#t¡(\á´PŒ¦j–_s/İ¿ŠŸ‡/¿\îHŸõ\ÚIß½“™X\ï4õ­Y\'N6>@ƒ	6\Í\Ò;©6~Œ-V¨+¢†dŸ\ß\Ò1©zI\ÒA8\àœQ~Õ†/QÛ¹k¦yùm,_µ7£\\\"2\É\İÁY–ı\ÕFØ¿•ñ&#pz†9”•ğz’ñNM\Æ\ÒJœs|ıO‘\æ?NÚ¼)I\Ü\Ì\r·ÿ#­»H÷tK²‘5°~ûi\ãgcN\Ï]µ^\Ü;\Õ*ğğqÁXš\Ş\Ê\ÎJxm‡ÄŠ$\ã\á>(¢×¿\Ãs‚E\Æ`¬dİÓ¹\æÆ‡\âs Iª\ëVĞ¼ü6,Us›Ã˜³T\à\ÅmRÊ“R\à‹Ş°¥¦é¨„W\Ò\ß„\ß;\"¸\àMMS°\Ìóõ?_ªj;\é¬\í\Ì,˜%99@º2b\Æÿ\Â‚\×GSÓ¤+ó!fü\ß=\"8\ë\ÉUe\í|\Ù{şŠ¬\'„”»ñ\ÖZƒ\'+Ğ„B\àL\ßô\ÒE	g5@”‰ŒE€QJoü pl\æ2¿¤ŒH¶\áX/Œ†„ú/\ìg|øğ\Õ]L$ªj\Úhn¿ƒök?Ñ”û@nFø\ÌòÔ¦^¹Ÿp\Æ\Ó\Ü\ì\"\â=\Î\Ù÷¿Ÿ	C\àópù\ÜóŒ\\ş_6\îx’\Z\ë59å›±¨Lj²–ñidP“¦\ßg§\ß}*\Éøj‚ş1Nú:A\æ\Õ@‰dt€ıCp\ìj\'•3Ÿ¿¼ŒO(\ã\Ú6ı.øÑŒSÁ	ô\å8!$£x#°û`\ËÛ°\î-Á›iş‹’5> \r_Qm¼´\Øx\'/3\éP\ïOp\ë¶Z^{a=û÷­e\İ\êJUœmğ·D#YŒ\Æ]%«~€¨€noú\nPI\ß\ç‰õüiˆ{\â¼*\\]%ó\Êó\ëi¨™nÃš*6\Ü6=š(”ngO\Ö[\à\ÏkaH)!ı}š\×ü#aõÓ¼|©9n|€5]©Brx\Ì\ÙJ\Úø\0¶$Ÿö}Ô–Ju¬\çR€£Ç¦{#ù²=uBHES\Öù\Ïi0¨\ä\n\Æ\Êş ¾ù$\É-T\Øõ™\Ó<x^_”—^UwN™-õT[3o\r3E\ÎPò\Æ¤+—r›\ï—GL\æ:–®\Ü\Ãp\ß\ëñs>¿\ÂO_H\ß/Ñ±ú³HRö/öœŠ€r0>c£sŸ\î•\'º6ş1\Õu+2\Ê5´l¥\í\Úû3\Ê%’µ”ƒñ%¿iğ²\Öj¤`0V±y\ç·i\\zszIb\ÙÊ»\Ùx\Ë\×sşNVE@9E¾ó\êO\Æh®e\ã\'™tœc|\è0>OÂ„¶Y½!\Ò\æ›IÀjLoü\Ñ \ì=\\d“9fA\ê\ï…@\æÍ•µ¦n\É:ê–¬[°ü2Ÿm£äm\ã™\åJŒ0Vw2”œñ]Y\î/\à\åaÁs—Áw\'\à2¾\äó õuk\ŞÛ§%\ë\0Š€\ÇN	;µ\ê,RÀ\İ\ç4\æ-\Ês“¨@\0.›\ß\ê¡ˆ\Ö\ã,?R÷\Ù\Ø,òr\0\É\ç…\î³ú“Ÿ@ù8À¤z/–}™ŸLy8€m$\Ö\Ô+\ã\ÚşL”¶(Q¤şK\à(şA\æ‹\Òu€@ Ö·\ï\Ï~vL9Rz €ñQ¤Á~½¼Ï‚\Òr€`06¨\ãve–\ÕJ\Å„€±Q¤\á~ˆ\æpn¡Rü05˜SC¹…H\Ñ:€\äu#†® ¹‹ó›~…Bq9€\0\ÜN¤\Ñ!pO\æ¸N:Š\Ã%6a\Ã6Œ\È~L\Ì´H>o¬\Ç1®÷\ß\ç‰\Âr\0qu=k\"¶‡ş´\ç\í Š•\ç\î\ÉØ€>L»¨,®(Q$¿\áó!ù½\àq\ëO¹\Æ,¬(\nD#H‘\"Œ­± Œ:!ô\Ú{‘\â\0R\Ï9$QFB6€$!%nm*\"ö\Ù%fPEpX\Õ÷®¹8H}(\"aˆ„g5¢n\àÒ <\'…\ê\Ä\Ñ \Ì\Ñ \Ì\Ñ \Ì\Ñ \ÌImŒ^DŸ;›g¼\Ún=—HŠ(¿ù‰z\èh„^”9º”9º”9FÀ\r\Ä?5ı©¿D\çÚ™¿f­“;ö\áAlWú\âaŸ\ÛÅ©Ã¿Q\É\æğ±‡…@T\ÂqiüU¬R$R\Ïqğ{\ÕÛªÉ²	“yö¯\çP\íıq\é\ÌIM)e|nõÆ“‘AU8¶Å›6\Ãk2ğr\â	ûğ\0}§Oh¢L)ğz	ø¦\×\'ºI_k\\v\Ëb«G~¨\Şû‡_y‘±Á~m4*1l\ÓeÀ\ç¥û\ÄûªxY6\Ñ\Úù©\ÅV+A\à©“J4J\ï©\ãH²Ì’¥\Ë1´Ÿ:XŒØ‡p …±\ËtŸ<F8©>\Ğ\Öu-\íw\ä\åú¡ Ÿp(‡ƒv&\í\ï©d¦\nğ*ğ;É™Œ&Z:VR]gE\Ö!KAŸ¿{’P0ˆ\Ûi\'šfZ{u›\ïø.ceš<\æ\ÛeÇ—°P\Ö;y+\ç¨’™²hø<p\0Ø’(„î»˜Ë™ŠªV®»\åÉ¼?[;‚œÀN\àEt)ê›®g\ëß£¢ªEkURƒ¼ÀƒÀ\à)`û¢kT\ÂTÕ¶³r\İ\ÒÜ¾“B™U9S¡ş\Æ\Õc±\Êa\Ğ\n˜ó¨\Ë^ \ŞÖ¸¬Ú†%ó\Ê0\èóLXwqO¨‡b›\ÛnŸ\×5fC’dL–*ªZhh\Ù2\ç-\İóI¦Z]ğ£\ÅP\è\â\ß=]»õf\Öl_û\Øv¥ûğt§‹\Ë>Æ¹c‡U2¶ÿõ¼®Q\ì\èƒAe\î\0e\î\0ˆPf_Â)~±òHD\ï\ÙY\0\\öÓœy\ï[„C“´u\İG\×\Æ/\'I\Îÿ£ıoa©lâº›ÿ–šú.•D\ì\áÿ@\Ğ?\Î\Ò»Y³\åOIn)ôœz–Á\Ş_c¶XY¿\í	¬×©\â}\îN}\n¿wˆ¦¶\Ûi_ıpF\İõ7À\Ğ}\â_%\ÂÀÅ—pO¨;\Î&l2rù\r„ˆğ\Òûñs)yô|ü,\ß(BD¾ô?L\Ø>RÅ»\'.0\Ğı_%B\Ğo§û\ä3)yôù>\Ï\0B(Œ\r¼ƒs\ìXF\İuX\0>[Rxt\Öx¿od\Şy¼\êx€`’LÈŸù;Hº”4™\'ø/FÀ<D¬C©ƒ™;“\Ú\'\àüñw\çu\áH(H$‡£‘pŠ\Ìñ·K›V’X*›hh\ÙBKû\'4\ï³\Ïùv€mÀ/ˆõ(\æ„\Ç5g>\á\êvv\Ï\Z?6xKgÿu7ş\r-[ó®\Ïb“\Ï\"`ğ6s0~¡\n88u\ä›LŒ}”6\Ş`¬˜=lHO}›¤È¤¤Éœ‡œ$#\'å‘|9€ø7úö‹¡D8w\ìi”h0%®µczFOEUkJó¬¡efK}<¼´#uP\â¬ sE\r­ê·µñ:*ªZ\ÓÊ§\Ó\Ãhª\ÆÚ”ù•¯!©½\Ä&˜Ä©[\Ò\Ä\Ê\r7`²Xòt\Éùôûp\Çj\ÒJ4Šsl\ï¤z\çñµ[c\éŠ=)i#\ï\Øi^~FsmJ|(0}ø(5\ËhhŞœöú¶x‡i\\væŠ†”øp\È\Íø\Ğ!,•M,i½)m.ûi¼“—i\\ºPH\Î8!$_ğ4ğøT ª¶O?ú˜+\n½\"%¸ø\áûD®nU\'„\Â\ÇG\ŞQı‰-\íŸ`ı¶¯i¥`Nd3#(_E@«*\ĞyM@\Â\\1]nJ’LC³\êV‡Š\ç[)O·Hù€†’/p&£C(úYöd›@JK¤˜šƒ‘¨\Ú\à>wJ‹Ç–¯f\àa\à«S×¸¿\Ø\Ç\ê-\Û1Y2\×Lµ\"\ä÷Å§\Ã+J\Ç\ÈP\ÊJ)ƒ±*¥›¶BÁ\å°!„\0\Å\ç\î\Æ1r Y\ìP¾\ê\0\ÕÀE`Yò\×Y\î\Êg\æ÷›m,ô£ }3›n\áø\"\à\×\à\æôcö\ã§Äº\è…À÷@ 7£™…\Ø*ğıÀ\îD\ãü?Š˜ú¾/±\0\0\0\0IEND®B`‚',654321,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\ordenador-personal.png'),(13,'Mouse','Funciona',5432,NULL,123456,11,''),(14,'mouse','Funciona',76543,_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\í/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B®7\020200721<\0124448+00008BIM%\0\0\0\0\0lD©.w@q&ô ò¼\'Ç8BIM:\0\0\0\0\0\ï\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\à\0\0\0\0\0\0\0\0\0Grn doub@o\à\0\0\0\0\0\0\0\0\0Bl  doub@o\à\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\í\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\Î\0\0\0\0\0\0 \0\0\0 \0\0\à\0,\0\0\0!²\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\İ\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sğ\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñğ3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ı¸ZÚ¿ğD”ôi.J\Ïñ‘\Ñ\Zğ\ÖS{¿”C\0ÿ\0ÏV©úù\Ğ\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\İm\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECş*½wı.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯ş3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Şû­¯ı* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ı&\Ï\Ñ\Õú\ç2^\ë®õ\0e-\İmÑ¬o\Ñoª\ï\Í\Ş\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛ\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikİ\Ã÷9µ\İ]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½ş1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\İ\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\İ{ƒkiš\èfŒoş”³şêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ıÂ·1\ÃV´º;ğ?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ğ\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ĞS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\şqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉıŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4şšªı\"×‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ı`\éØ´\Ô:vef±¯Ä²\Ému\Öğc+;\Ûú-‘±¸ÿ\0Î¾\ïğI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™işß§\ÓşWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹Áş\Æfd»ù5S]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Ş\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœİ”\×ş†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wş	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\İ\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYşfıkÀ»#\ÑSœ30^2ñ-i÷‡05\ŞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\İBğF.4ò\Ó]C¿\Ïıÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ğ/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»ş\ëZ\ßğu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»ş¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôş‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îş\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êşc¶’—\å0\ÒHû3\\\\N\Ğ\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyıo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ĞWÿ\0^»üJwş£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadıg\êG­õzºn\â\á¼\×N\İ[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×²:?Mf	mYù\íô©\Ó\Ğ\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\İ¬ls\Âk\ŞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\İõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\İÿ\0A%<o\ÕN Şõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’J¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñğ\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\î\Ç>\ËK$ÿ\0„w\î=\Íı\ï\èô«\İc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïğ§şut?Rş«;§cı»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgı\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜIı\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElşQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØğZ\ÇX\ç82ª\Ú%\Ï{\Ê\ëcG\ç9\î\Ø\Å\ì¤\àıNú³eıE\ík\Øß´õ›\Ş\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kş5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsş…_Î —‰\ÂfWÖ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Ş}\Ö\ä?ùW]µŞŸıÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yş¾õ_­g\\,œ®\Øô\Ù`øµ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èşS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ğ§şšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzı:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Şv\ì\ì±\íşE–û?\ÒZ’œµ1˜\ìc9¿§xŸcHşd8…±®÷ş\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àı¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷ş\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Ş\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zş±ş\Ú\Ê\â’:f3‰ =Wı™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶ş\é{\ïs?ı\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çşúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúY\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦ş»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\İt §‡7\'m-ö6\Z\Ğtc=­u¯ü\İ\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwıcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\İ\0öˆğÑŸõ\Î\Æh·©c\à4\é‰_«güeğ\æÿ\0›Ê¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrİA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ĞûÛ²ŸıŸ\Õ\ë\İÿ\0½Efı]\è\Õt>‹‰\Ò\ë;ş\Í\\Xÿ\0ß±\ÇÔ¾\İ\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@İ¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿ~¶}S\ëı-\Öõ\Z·Qc¢¬\Êd\Ğd{+iúT9¿CÒ·ı\èıO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rı\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ıö\ê·û\ĞSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëW\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®İ«5ù¹on\Óaku\Ñÿ\0By\äø¡J{P98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ı3¾\Ñwúk?Eü\Ê\Ş\é8W\ç\ÜpºSM•Wı#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\İ-\İfŒ\\\Ò\ìzŸ\Õ3\ãP\Ğ>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»ó\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­şm ~\å\rİ»ù?\Ï[şk\á\ä\âecW~•İŒñ5\ÙQaOc™\í^[ş0óz\ÏY\êV\ã\áş±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñú¢\äºG\\\ê½ó‘Ò²\ç\Ò1º\Öò;dc¿ôo~¿\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\İNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlşÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\İ\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ŞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaş-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ı‡oş–Mÿ\0Œ_ùr\ïı‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½ş&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^;	tIq.w\Ò{\Şò\ç½\îX?Yºõ·\ä_\Ñ:s\ËûJö¯h±¢Ê±¨}~µn\İvgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\İs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-İ³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvM\"¼ê™º«Kˆ.±õ\×\ìµ\Îu\ë0\İÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘ş‘»›ÿ\0^\ĞıRšş\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ıfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ğö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ù8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0\0 N\Ä\0,\Ä\ì\0¯‰\Ø\0(v\'\0¯‰\Ø\0(v\'\0\0±±;\0*‰\0±±;\0*‰\0±±;\0*‰\0\0º\ìN\09‰\0º\ìN\09‰\0º\ìN\09‰\0\0»Ø\09‰\0»Ø\09‰\0»Ø\09‰\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0\0¾\0\0\0;±;\0¾\0\0\0;±;\0¾\0\0\0;±;\0\0¾;\0=bv\0¾;\0=bv\0¾;\0=bv\0\0¿±\0>‰\0¿±\0>‰\0¿±\0>‰\0\0À\ìN\0?‰\0À\ìN\0?‰\0À\ìN\0?‰\0\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0\0ÁØ\0F\'b\0ÁØ\0F\'b\0ÁØ\0F\'b\0\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\0Å±;\0O±;\0Å±;\0O±;\0Å±;\0O±;\0\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\0\Æ;\0d‰\0\Æ;\0d‰\0\Æ;\0d‰\0\0\Æbv\0t‰\0\Æbv\0t‰\0\Æbv\0t‰\0\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\0«D\ì\0œI\Û\0¯‰\Ø\0¶;\0¯‰\Ø\0¶;\0\0°bv\0»\'b\0°bv\0»\'b\0°bv\0»\'b\0\0¯Ø\0¾\ìN\0­‰\0¿v\'\0­‰\0¿v\'\0\0Ø\0\ÇN\Ä\0—‰\Ø\0Ç‰\Ø\0—‰\Ø\0Ç‰\Ø\0\0ƒ±;\0\È\Ä\ì\0~‰\Ø\0Æ‰\0~‰\Ø\0Æ‰\0\0h\ìN\0\Ã\Ä\ì\0b;\0º;\0b;\0º;\0\0Xbv\0²‰\0T\0\0\0‰\0O‰\0Š‰\0\0VØ\0y‰\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0XØ\0u±\0XØ\0u±\0XØ\0u±\0\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0\0Xbv\0q‰\0Xbv\0q‰\0Xbv\0q‰\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h‰\Ø\0I‰\0v\0\0\0>\ìN\0v\0\0\0>\ìN\0\0x±\0>\0\0\0x±\0>\0\0\0x±\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿ\á%\ÔExif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\Î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ô\0\0\0\0\0\0\0\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\ã\0\0\0\0\0\0\0\ë(\0\0\0\0\0\0\01\0\0\0\0\0\0\0ó2\0\0\0\0\0\0\0\0\0\0\0\0\0¤\0\0\0\0ipp\0‡i\0\0\0\0\0\0(\0\0¼\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(‚š\0\0\0\0\0\0‚\0\0\0\0\0\0ˆ\"\0\0\0\0\0\0\0ˆ\'\0\0\0\0€\0\0\0\0\0\0\00210\0\0\0\0\0\0\0\0\0\0\0\02‘\0\0\0\0\0‘\0\0\0\0\0\0F’\0\n\0\0\0\0\0N’\0\0\0\0\0\0V’\0\n\0\0\0\0\0^’\0\n\0\0\0\0\0f’\0\0\0\0\0\0n’\0\0\0\0\0\0\0’\0\0\0\0\0ÿ\0\0’	\0\0\0\0\0\0\0\0’\n\0\0\0\0\0\0v’\0\0\0\0\0\0~’‘\0\0\0\0\0\0…’’\0\0\0\0\0\0Œ \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0  \0\0\0\0\0\0  \0\0\0\0\0\0œ¢\0\0\0\0\0\0\0£\0\0\0\0\0\0\0\0£\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0“¤\0\0\0\0\0\Z\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤	\0\0\0\0\0\0\0\0¤\n\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0\0\0\0\0“‡\0;š\Ê\0\0\0\0´\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0\İ\0\0\'\0\0\0©\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0©\0\0\0d\0\0$\0\0\è354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!²\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\İ\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sğ\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñğ3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ı¸ZÚ¿ğD”ôi.J\Ïñ‘\Ñ\Zğ\ÖS{¿”C\0ÿ\0ÏV©úù\Ğ\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\İm\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECş*½wı.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯ş3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Şû­¯ı* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ı&\Ï\Ñ\Õú\ç2^\ë®õ\0e-\İmÑ¬o\Ñoª\ï\Í\Ş\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛ\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikİ\Ã÷9µ\İ]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½ş1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\İ\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\İ{ƒkiš\èfŒoş”³şêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ıÂ·1\ÃV´º;ğ?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ğ\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ĞS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\şqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉıŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4şšªı\"×‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ı`\éØ´\Ô:vef±¯Ä²\Ému\Öğc+;\Ûú-‘±¸ÿ\0Î¾\ïğI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™işß§\ÓşWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹Áş\Æfd»ù5S]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Ş\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœİ”\×ş†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wş	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\İ\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYşfıkÀ»#\ÑSœ30^2ñ-i÷‡05\ŞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\İBğF.4ò\Ó]C¿\Ïıÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ğ/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»ş\ëZ\ßğu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»ş¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôş‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îş\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êşc¶’—\å0\ÒHû3\\\\N\Ğ\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyıo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ĞWÿ\0^»üJwş£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadıg\êG­õzºn\â\á¼\×N\İ[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×²:?Mf	mYù\íô©\Ó\Ğ\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\İ¬ls\Âk\ŞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\İõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\İÿ\0A%<o\ÕN Şõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’J¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñğ\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\î\Ç>\ËK$ÿ\0„w\î=\Íı\ï\èô«\İc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïğ§şut?Rş«;§cı»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgı\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜIı\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElşQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØğZ\ÇX\ç82ª\Ú%\Ï{\Ê\ëcG\ç9\î\Ø\Å\ì¤\àıNú³eıE\ík\Øß´õ›\Ş\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kş5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsş…_Î —‰\ÂfWÖ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Ş}\Ö\ä?ùW]µŞŸıÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yş¾õ_­g\\,œ®\Øô\Ù`øµ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èşS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ğ§şšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzı:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Şv\ì\ì±\íşE–û?\ÒZ’œµ1˜\ìc9¿§xŸcHşd8…±®÷ş\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àı¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷ş\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Ş\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zş±ş\Ú\Ê\â’:f3‰ =Wı™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶ş\é{\ïs?ı\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çşúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúY\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦ş»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\İt §‡7\'m-ö6\Z\Ğtc=­u¯ü\İ\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwıcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\İ\0öˆğÑŸõ\Î\Æh·©c\à4\é‰_«güeğ\æÿ\0›Ê¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrİA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ĞûÛ²ŸıŸ\Õ\ë\İÿ\0½Efı]\è\Õt>‹‰\Ò\ë;ş\Í\\Xÿ\0ß±\ÇÔ¾\İ\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@İ¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿ~¶}S\ëı-\Öõ\Z·Qc¢¬\Êd\Ğd{+iúT9¿CÒ·ı\èıO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rı\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ıö\ê·û\ĞSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëW\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®İ«5ù¹on\Óaku\Ñÿ\0By\äø¡J{P98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ı3¾\Ñwúk?Eü\Ê\Ş\é8W\ç\ÜpºSM•Wı#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\İ-\İfŒ\\\Ò\ìzŸ\Õ3\ãP\Ğ>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»ó\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­şm ~\å\rİ»ù?\Ï[şk\á\ä\âecW~•İŒñ5\ÙQaOc™\í^[ş0óz\ÏY\êV\ã\áş±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñú¢\äºG\\\ê½ó‘Ò²\ç\Ò1º\Öò;dc¿ôo~¿\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\İNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlşÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\İ\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ŞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaş-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ı‡oş–Mÿ\0Œ_ùr\ïı‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½ş&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^;	tIq.w\Ò{\Şò\ç½\îX?Yºõ·\ä_\Ñ:s\ËûJö¯h±¢Ê±¨}~µn\İvgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\İs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-İ³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvM\"¼ê™º«Kˆ.±õ\×\ìµ\Îu\ë0\İÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘ş‘»›ÿ\0^\ĞıRšş\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ıfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ğö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ùÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\áŠhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa‘Br¡±Á\Ñ\áğÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AğQaq\"2‘¡±Á\ÑñB\ábÿ\Ú\0\0\0?\0\ßÆ€4 \r\0h@\Z\0\Ğ€4 \r\0h@\Z\0\Ğ€4 \r\0h@\Z\0\Ğ€4 \r\0h@:‹\ÎÛ›\Û\î\Ø\ë¸\çüÃ±%xH±Ú¼»\Ù#\á\ÜJ\n¢²0Q*¨/,.ŠS\0Š,[¸W€\í\àt3n\êN\éåˆ¢\Úÿ\0…Rw\İ\ËYdb’“ikN+5\Èó.u–K–A$zq®…$\Ês¢Í¤“„ˆ±=THcu¤p\å/\â\n˜šú¦75z–~L\'³(À¦º\Ì\ÓQ£\\£™eZ»\'\0\r\İJV#¢#\ÓzA:~¢\0‰\ÌÀ%\r_£	dñš\ì\Úc¯ªWs\Ï=2\Æ64›»Q\Ù1­\Ê@¨\ÌR]TUnªG±d\×MtWEB*p:j\"r\0\åÿ\0•\Æu\ÏB­´şEªm\Ï\ê/¨\äGQ¬²¾%`¯A\'r•‹a=F)¨r”\î\r:\Ü\ÅU2€ˆ‰ ğ§‘ñ¬\å‚ÿ\0\Ñõ ¦·\È\Ğn!\ÎØ¯:V™Z±¥º.\ÅôN@I(Aº\Éª¦1T)D½\ä\à@Àa/d\ÓNš%4óC½¨$4 \r\0hs8nm¶#’3†E¬\ãŠtjj™I[ò £Õ’(\Ø\ÃG$u9&n\â4EeŒ&\0jKVJMèŒ•\ï·\êX·I¶°Uv[U&;«4E\Ù]\çL—\ÒF\Ü\å’7«!P¡/ê²­&)‚‚“‰o~\è@J!\İN\0+\Õzd‰¤µÏŸ379“0\Ù_¸Ê›‘³\Îdüırbß½\Êr\Ë[\ÜbZ»¦\å|Í´\Ñ\'(ƒœ \î9Dœ4\Ä,EA’È¢f¿\nß…ºÖºQ=¨ƒ,$-Æ¹\')o\ÖÆ­\Ï=)™O¸ª\Ümµ‡jÑ¬½n‰\ÒceY\0*‚ş?;•\Ò-\Ğná»•OO-‹(w/¬Pöù†p]Jf\Åó+°3lm\Óy^g¬i\Ì/‰J\×‰\ØcwN…_g ş9¤´\é›*ñ‹wmT,¡¢2m«¯k2ƒm¹”-÷\ë\ÆC<\\$\ÆAµ\Ë\Üg\ZW\Z:,%\çû\âG³N(7;\ÅTH0e\ÕXÜ¨©\ÄvRj÷Ô„¯AyJ\ÌS„|‚q•k…\Ñ\Êc¤\Ö51IU˜Â²E0O@´LoLJ\0 \" \Z²\Åk8‘(k{û±n %Ä™5¦KañZ(HFg¬ô°ñN\ÜJÁÄ„\ÔIˆ­y\Ğ	Nt\ÕY2¥)s\á\ÔO5\ï*o~sBª4\í<¹\ÍÎ€»i\Ï“\ë5öó›\ÊIIA#-fhf\Æei`TRYEöe˜#U›¬@E³\Äm{@«¢³@\Z\0\Ğ1\Õ\'ª0\é\ÛEaŠLo[½1Y|ŒRz™Uk\Ü\å¨]-i$§ªÊ®G\èÇ‚µQ4Œ>‘\ÃYbbt*_-ß‘„\İ\Â\îk>nòò\ï)nñ-n—p¢ªDE*¡Ò­\ÖY®s\nq\Õ\Ø4¸B5©\0¼‘2˜İ¾D =¡Ì¦\Û\ê•\Ûğ\å\ÍVU\Õ\Î|ˆow»\Âc¯ig–I‚«\ÒĞ–\"\Ç\Ép,¥œ@K°›kõ”Lá‹—,nº`2©82e(˜À\Z\ÚôQy·±o[;\ØV1\Üşs°f<¹ğmŠm\ä\Ë\ë¦ \Ù\\û‹\ì¹\Øb$S=\Ê\"f\\h„ú3\ÒDŒFB:	*ª¸•9\é„)Ù³-z²m¦’.~y©:‰bı°m.ör\ãˆ\Ë&B\Îu0¥Jô\älXú€\îq$\İë’H·nVµù+¶P.\Ô\"/¹d§\Êé‘“hşmº~\éguÙ•IAÀY“qV;­ã·²‰\Òö,’¬òˆ´¯B¤©Š.\ìŒ:ªUöe)\nR™Ë¤Çµ4\Û1l •ú¹U\Z·%ùööİ¥m\èÒ™YOt\Ù-¡}3Û­‰\ÊÀ`XI€«[X\æò¡SP9*\Ïÿ\0ŠXJF\ã\ÊM²rVÒµóœ,\Â÷˜ó4mj…\İ\îEÊ¶u\Û&F“ˆŒ+Ùµ–/)\"\Ú)$’ˆª1`G\ï^$\İ4›7ar$˜\0$AÑµ–¥=\é*N\Í\Ñ\í\Û`O·V8Ÿ!ÀD\ÜñK„ f¡\ìQ­]>\Ê\ÖÙ£,¤¬›ô\Ì%7\æ99UŞ»+ Q3\Æ%\Û\é.ŠL\Ó\å)d›\É¢ß¨\Ú\ŞroÓ¿6-µ9I›¾\İnÓ¶;\Æ\Îe®¯Jú\áˆl•HJ^6\ÅoEANÁ\î	û÷u§e\í1S3–G `)-	¦\ÒN\Ó!Å§\äkB.Eœ\Äl|´r\Åq&É¤ƒş…Ù½n›¦«Ï’™S0½­ˆ?v€ª®©ıS±7MŒN‹\ÇÄ¾\îşÁúX[‘ø¢¼Ë„DZ­w»¬\ÔEjö1vr{§@^Er„d`ÊŠ¨\Û9\ÍAx½F6ü{ù(e­\Íe\Ëvw\Î÷÷Ü~‘,”\ì\ëò•è¤z1°p1i£Wd	µn\0ƒF\è…(eUS‘·&\ÛvÙ²Ihyù\Õ\\\Å\ÔwÖ»[\Ä°j’ÀØ‡1J³\å\Ò \ĞH8\îK\Üb€ö÷”¹C¦C\Õ+\Ñ\\ŠªIµ©_\Ó%ºX\ìœm±jŒÃˆô\ß\Õ)J‘G(Tb%™™RIND¤˜Fğh¥TT­Š©\Ä5PÂº\Şğê”½šO\\Ä¢\åCr•\Õõ¾\Ñf…n\Â1\Õ\n\ák¯e8DA^\reö.c?˜n\èh‹YF-œ¤\Ä¢R$ &\í»•ªªûQk|µû\Ú[„\ÎqR¶	¸\ìÏ•XK\Ú\'$¬\Ög\ír\r­5\ì6I…½Ä¬ô\ÑBW²J]\Ê\Üe\Ö!”8¥v…-)v4\ÛQ‘ó®]\ÉlšE\äl©¯qq«{¨ø{]\Âvnƒ²”JWŒ\á^=3F\ï@x\\¨¥\0\"\Z”¶H£y;ô_±–IÓ‡\nš¨\çDCDD\æ0ø)@90\0\0<\Z\Ó\áK%zşù\êR¤\ë\Å\ZZ\Øf©\ìg~¢;‰ŠÌ¶\ê\Ê-ñ=M\à9‰*Í‰\Ê$¤Õ¡Š¸zl÷©ö\ìV2€P;:\ÔjN”\íD^†°”œ¥K¿9ß±tšWY\í\á\ÏøH^ö\r\Ò\åc#w\'sŸ³Gä›¥’õEœU\êŒ\ë1–R¤Y”k\r–1’r«”Lb R·gH%¦2™Ê›\Ë@“ª¬›²|uMª–hŸD–Š‹¥\\ªó‡¦\åC¦M\Ä\ã\ë\å\×]9* ¥@t\ÂO\ÃmÊ®\éóÈ†µï¯¯\Ø\Ò7L\à]\Åll9X\Êw½—ÆŒ e€L&1&¨ÏŸ\Ò%@\Ãû\İ|\ç/ßµRó\ç^‰˜\ào»r{C\Ú\à7\'[¤§‘g°ş;”·\ÅS\ÜH)”«¶\î±MYG\É$u†h/½\ëÒ¢_]F‘\Ë$\ÜJ±\È`¬ŸL[Ö‰J\ÚZY\Ì+%eŒÁºŒ\Ët\Ü~·=½d\Ëäˆ¾›šxI“&­\Ä\È\ÄV\ëqE0¥^©\Ç3oß„Z¢A\æ.ª\ë«\Å&\ä\í\çfµ¢¬¨\\5R™[¹Zœ:¹\nˆ™C˜\ÄMW‹˜‡2Lú‚\0£•=3|iC¬¨•4\Ì:&Ö‹/\É®Œo™ºË…³&RŠ“«\à‡“ÆŸˆ››¡klV¥%\æaú>\å¸ œ© VË®qVI\Ë`Ù²¢ETCH\ÒNŸ¼–d&_9\à{[\Íy%n\Ü5ú¯\\U\n\í:0Y\ÃK§\ns¬\è\Z\çw\'*\"BšÆ¿\"\rZ\íÙ‚\ÇAg+«\ê\Ñ\ZY½l¶¶¨dÁ‹xöˆ1dÜY4H¨ \Ù\"ğšIÀ?\Õ\Èò\"<ˆ˜D\Â\"#Î­vó\Éyó±5^&dG·õ|€‡\Ç\â<~ÿ\0ô\Õ\ÊOF7¯•1ŒnDD¢o°÷ùñ©jŸs7{—U\ÑW¦,\æşw!¦\â¸?\'x\Ì\ïLš‰·“Œ]Ê£M\Åh¹;e\ìòL\\{ )Fğ1r\ë6c‰Š£¾Z^F°‹ò\çĞ°\í\ã]\ãzo½¶\"\ÇK±u²MX\r\êZ5d\ØSò[”¯ZfY*\İ1læ¸™£”¬B˜ˆ¡70\İD‚E¨[\èK»×º\æ\ä­]\ä—9Ø»ŒeI;:\Ú:¾\Í1¬V\ãQ…Œ\ÍHƒu\â\ë€#!.TS)J‘^Í¬¢\é„Ú¸A\0\0M¹\n9?$I:\ìÛ™U6eŒ\Ú<\0üÕ“q}E>\Óö„š\ÊH_¬*z%0€\0%UL\Èvœ\ç\ÖşÎ®JüJOL×‘y\ßN\é\Î=*pJGS\Õö¶\Ì\àĞŠr&\Ão/~\0\r\Üx\ã8\×y‘`»ı¬´¸lsx5\ÇÉ•VÒ›f\Íè˜†\à\ïO\Ø] n>\âUÛ¤`ûòP\ãUp—“%jn”\ÌVİŒ;›=‘\Óx\Z\Ä$g\ãÒ¯¿–Õ‹Q\"«,¨ğ›“‰H™@\ÇUC‘\"”9J<®öu\é\Ï¶\í½\\º«nQ:<sIš¶\Ñ0\ãÖ¯2‹qU£‰\ä·ªÆš\Ù\ê!\Ú6™\Ïj\'x±D\Â\Â=˜ƒü¦‚\æ\Íô+Ğ‹nÖ&÷%µ \í%V™ƒP.4c\é¸\ËJÀ\Ã<ºY\â\ã\Ãò\ÕZ1\ëeÁ‹4R]\ä’EDÇ·;‚¨.Tn’ø\ÅËª\Ó-F#,’©\Ï\Ï\ÏO\'	]­–rbB`+\Õ\Â\ÃUaEÚ€‹,¢P*€š%1Î¨•0:\Ê(±¡µ·–wC-ß‘&\ä8yò\Ü<‡Ÿ<ùÿ\0¾¬šo<‘\"Y^\Ş~€\0>x|}¼‡üõªw™I=+[˜—\Èd[3d\Òju˜·tˆ.¦1\\81€\É4?¯ıjqşÁxñ\Ş\Z\ÏB7»&8jMW\Ø\Ù\ÖĞ²’¸[¡¶ığV!3<w»\Û\ÓZM~ÁY7±»\åI-Ú½¬Wq|\Ä#ó\ÇopJ¬º«EQôQ‰&8ü@\Ù28X˜\ÆP“Sz«¬÷òòNõø‘iFQ•V[ó\Ï\ì{;?\Út6¢Qğ.‘…“4W°™³r–Á)8V“¶\"\İ`\"Átš\ã9Q†A&\"a9\ÍG)K\\\Ù,»;…3PPNQ\âgm‡ew›J\ÊG6	€8{ `¬ˆ‚	H\Ê%L\àWi\ÓU¾hªiï¡Î¿´Î².\ß11İ˜§ƒ¸\å»\"\'Pyn3\'L¬’óÁTöQV\å‹\ÏÁ\ä<:\ëöuu±œŞ†\×:\âK&\Z\éO³\Úå½¢¬l–j®X‘f¹5š¡™n6<Ÿ\ÙrrG®Z!@7S¸5\ÚP—û\éŸk[\Ù\Ş\å»PI\Ş¼Wˆc¤;¶C¯Ubˆ\ãÀ\ï&P!yù\ê“iBM\éD¥m#š.\é\î¤\É\Ôi“\Ñ\Ø#[”¥),G¨û¬!Y²u`h\ĞS¿¨@£%‹a\'%w)$\n´©”\ÉaÒ•e¡g\'t\ÖD\è\è\×\Õ+k¸/\Ø0.\\¢-Š™Rd\ìFù’ˆ\Ù\Õ\Õ+xÉ•Y4\ÖÊ´\Ó¯R´¸3r³k%²\ÍDj\ÕX´LX7+½K\ÇL—;üŠ\Ä\ß^ó¯›\â\ÎRùBÎ›ˆ\n|YWñF:>»*$®AT\Û,d\Ç\ÓykX‰<›zP\0p\ìJ‚\\3f\Í2UE,‰\×.\ä+TK\Ú!ñÀŸ¿\Ï!\ã\íÿ\0­X›²+J öãøó\Ç\ä\ÛWŠ\Ò÷Yóû)&ò°\ÒV™–°Ñ©z®*}4SUuD?¥\'\Üc\Ø\Ç\Ï\Z»j	Y\å,\Ş~\Î\í[V*LZ®qm\í\áÙ¬õä“ƒ&™)$+=‘p©‡µ \íõcˆö¦‘|ˆ5\æ\âM\Îmı\Ì5³Ó›£M\Ú&.\×\\\Å[Qªuùb\Ñkp0mœE¡uaJ1­IU\\_\ç\ZI\Û\'PL¨¤x\ÊúdM\ë\Â¢ºR[­yú\"Y\Ê\ë>v®}u/²<a*‹\È\Ù\ÕH§?Q²-†v\Üx»\Ät@H4ZR\Æö\Ï%Z1@ˆšVX®™5X\Å$|C’¡î¾OSm¥]\Õı7õ\ËÖy\ëQ\\ó\Ñü3RÁ\Ë\êr§¶\ä™\ÕI¼§s‘ym»\Ë;vqE\"Œ\ÄÛ€,s^N\0TY Í²dşR¦˜58‹®W<^oÄˆ¦–”b\Z\'n\Ò}Z:\Å\Õ\éQöS˜\Ş÷—§¢,HC92\ÏjW\Û;\Ä!.¶7ªòdY¡6n˜10	Šyl„9\Z\èÀUJ´Ì¤£Y÷:ƒ\ÅÆ±‡aÉ´llc6±ññÌ‘I³6Y ›flZ7D D\"\Ù$“L…\0)H\0\0\0k¨ ‰\Ë8£g<ms\ÄYV²\Ê\ã2\êÍ¶· £¤”ˆ‘HS]2<`\á\'1\Ïn\Å[»j².š8E7\r–Id\Èr\ÃIªj\Ó\0º\Éı/ÛŠ\Ç%™ºt>\Ì8Rƒ\ì\é\í£Ü¨–n¢¢¸û<\Õ.Uó\ÏC6\Å\Û(\å\âG3+\"‡ô“A¤\ê\âuu^”¶¾sÄœl\ËV-\Ç\îhĞ”:ª\Ù\ì \Õ\Ü\è\n‡9¢‰…v¦\äx;”TT\Ê;8ù÷\"(€ö7?4\ßUt¬—×Ÿ\"t\İ\ß9ò®¤™3(™\Ëö-y\ãõ9zÑ°U`<ö\ÕT$Õ¼šÛŒ³“Uyµó\Î\îu4ù)­0…0r¤z<ƒD\Ôô\çR¡*\íù\æ\ä9]m^¿a6ò\ãM)•±€\Ì(µƒ²»şO¶(…T\Ãö\07Ÿ°\ëEL²\Éú\Ë\ê,(—²@5u%\nC{¥CX¬\ÓUx\Ïf‰„À™|ùE\Ò(ö‰”M4W˜œ—¬\â\å•\ÒĞ˜\É->¿\Øó\ÒwIf—\ÉT\Ü@\êF™;\í“1v”ª<T\æU~UÖ¾\î~]š+¿…	\ãÒE«F\ä‘Ie™Ş’Š\Ù\Ë\Ù\Ôc)¥\ï-?­K\Çõ(º£T;ÚeÎ³±Jx\é[\"­i\ÉW[W%+\n!pO\ïgA$ñ³/\Ê90\é\îFGJš	8t\è˜\á\á\Ï\Ôv\Õö\çcI\Ê1\×\\‹—\Ü^\èºjô{’\ÄT]\ÇXm¹‹-dG\è‹x\èv·\Ë›w@\ã(Xq\ÓyDÑ®Ñ‚X7D¥9 e\×R5\"±zdû\á-:Ÿ‰\Í,I;¯u>\Å\Â\íó8\ísu˜Ñ†HÛ¥\ë\å\ìm$@²´³CÈ³`\äJ‹1š‘\Õbm2‰}Xù&­\"\"\0£r\ëZ]Šs·Œ‡\çl–ŒM„10³\\\"\Û\ìXó\Z\Ò\éS–¢ ¨®lrÕ¨F«Í”‹˜\ê¨ \ê\à\â&Ò’\ÑP-H\r\0\0ü€>|€òıù\0ÿ\0MB›òúu6¾ìŒ–Y˜C\"\à±\àÕ‰›şÓ©U+s\Ğpõ\ãK5®“#NzÁı¤®^œ|.ıÈ“\ã.)¦¡(\áÛª²m÷2«¹o£\Û4\Ûb\ç\ÛVm\Û\Æu¢:YØ²uuRcd	&b™ªS0\ÊB\Ï\Å\È(tT\n\ì\å“)”@\æˆ\Å(Y* ˆn>”\î³Hˆ‚Xó:\àGk¸Êše?\ØLs—\0û€`Ò¾@òúUzÏ˜DG\áõ„GCrğ\ÜüqÇªpñÿ\0+\Ô)}*\İf\Ë\È\á\î@y)‡q\Ø\Ø@\0D;T\ã\çöù\ÔşA/v©ô õT‹\Ê8\ß\"\Ü\î[_Á‘\ï5ko»•¿L\å;¯\Í4“;†5Š¥XÙ‡¥M°Š-\ÜÊ ‚ŠUS/&\n\Ê.Qq\Õ>\ä§M=h\İDŒßºZmf6BE4\ä\rX‚Ad\\\äŒ÷š,L\Ş\ÌJHJJ9\äd\í’c+%+$\àE¼\\TJ\êSaƒ`£pÀ‡d¾¯ö\Í!cN®·o²üø-Y½\çmz?Y^ó›²ô\Z1¹Ÿ 9üRóA]8‚S!  Q‡¨WùE±\×cb\Z0lƒY6\åxôTq\"£¦k.¡‹\ÃşN7òu_ºÿ\0\×oİ?Ã…J=÷\ßÔ¬¨m}ûl\êo…¶ó´¯8†g¹<¥],s˜u\Ô3xœ\n[[c[§3\ÕVXª±¯·«²|¸°šNM«¡|Ä±¦Q\ë\æH›·b¦Ò¦²g.&\Ãi]§§‘Ô´œñ\çÇ“qöı=\Ã\Û\à~·\Z\Ø\Ìú\Ğ€4 \r\0h@\Z\0\Ğ»}[À}Bğ\Ûl5š[\Ú4€´°¿\ã\Ë\æ9·IÑ²F-È±1òq1Wº5’8LF\ÓhFMK!\è½lö=tŸœY«ÁCVš\î\n¬t\åê•·œ¥\Ñ6%\İ\Æ¹/*l{¼\éwq\ÆE\Ãò\ärW{¤\Ä\Çp¢9Et£ô\ìd Tri7ÑP‘+d\Ü¸ñ}–-§†º]\é·üªõ7†<£jN\Õzš2\Û\ÓqN\ÖiõºTR2öÕ’|\îó•ç˜±s‘²Mu\ÛyKMš\ÙcôEË…_Ë¶n°3*\ŞÉšLš5j‰hˆ§ÃŠŒtF2“”œ¬“º¹ \r\0h@\Z\0\Ğ€4 \r\0pÀˆ!ğ?·\Û\Ç\í\ã@\Z\0\Ğ€ÿ\Ù',9876540,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\mauseinalam.jpg'),(15,'mouse','Funciona',87654,_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\í/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B®7\020200721<\0124448+00008BIM%\0\0\0\0\0lD©.w@q&ô ò¼\'Ç8BIM:\0\0\0\0\0\ï\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\à\0\0\0\0\0\0\0\0\0Grn doub@o\à\0\0\0\0\0\0\0\0\0Bl  doub@o\à\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\í\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\Î\0\0\0\0\0\0 \0\0\0 \0\0\à\0,\0\0\0!²\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\İ\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sğ\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñğ3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ı¸ZÚ¿ğD”ôi.J\Ïñ‘\Ñ\Zğ\ÖS{¿”C\0ÿ\0ÏV©úù\Ğ\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\İm\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECş*½wı.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯ş3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Şû­¯ı* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ı&\Ï\Ñ\Õú\ç2^\ë®õ\0e-\İmÑ¬o\Ñoª\ï\Í\Ş\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛ\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikİ\Ã÷9µ\İ]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½ş1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\İ\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\İ{ƒkiš\èfŒoş”³şêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ıÂ·1\ÃV´º;ğ?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ğ\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ĞS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\şqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉıŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4şšªı\"×‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ı`\éØ´\Ô:vef±¯Ä²\Ému\Öğc+;\Ûú-‘±¸ÿ\0Î¾\ïğI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™işß§\ÓşWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹Áş\Æfd»ù5S]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Ş\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœİ”\×ş†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wş	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\İ\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYşfıkÀ»#\ÑSœ30^2ñ-i÷‡05\ŞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\İBğF.4ò\Ó]C¿\Ïıÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ğ/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»ş\ëZ\ßğu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»ş¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôş‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îş\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êşc¶’—\å0\ÒHû3\\\\N\Ğ\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyıo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ĞWÿ\0^»üJwş£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadıg\êG­õzºn\â\á¼\×N\İ[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×²:?Mf	mYù\íô©\Ó\Ğ\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\İ¬ls\Âk\ŞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\İõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\İÿ\0A%<o\ÕN Şõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’J¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñğ\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\î\Ç>\ËK$ÿ\0„w\î=\Íı\ï\èô«\İc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïğ§şut?Rş«;§cı»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgı\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜIı\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElşQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØğZ\ÇX\ç82ª\Ú%\Ï{\Ê\ëcG\ç9\î\Ø\Å\ì¤\àıNú³eıE\ík\Øß´õ›\Ş\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kş5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsş…_Î —‰\ÂfWÖ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Ş}\Ö\ä?ùW]µŞŸıÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yş¾õ_­g\\,œ®\Øô\Ù`øµ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èşS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ğ§şšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzı:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Şv\ì\ì±\íşE–û?\ÒZ’œµ1˜\ìc9¿§xŸcHşd8…±®÷ş\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àı¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷ş\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Ş\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zş±ş\Ú\Ê\â’:f3‰ =Wı™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶ş\é{\ïs?ı\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çşúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúY\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦ş»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\İt §‡7\'m-ö6\Z\Ğtc=­u¯ü\İ\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwıcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\İ\0öˆğÑŸõ\Î\Æh·©c\à4\é‰_«güeğ\æÿ\0›Ê¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrİA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ĞûÛ²ŸıŸ\Õ\ë\İÿ\0½Efı]\è\Õt>‹‰\Ò\ë;ş\Í\\Xÿ\0ß±\ÇÔ¾\İ\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@İ¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿ~¶}S\ëı-\Öõ\Z·Qc¢¬\Êd\Ğd{+iúT9¿CÒ·ı\èıO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rı\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ıö\ê·û\ĞSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëW\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®İ«5ù¹on\Óaku\Ñÿ\0By\äø¡J{P98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ı3¾\Ñwúk?Eü\Ê\Ş\é8W\ç\ÜpºSM•Wı#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\İ-\İfŒ\\\Ò\ìzŸ\Õ3\ãP\Ğ>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»ó\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­şm ~\å\rİ»ù?\Ï[şk\á\ä\âecW~•İŒñ5\ÙQaOc™\í^[ş0óz\ÏY\êV\ã\áş±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñú¢\äºG\\\ê½ó‘Ò²\ç\Ò1º\Öò;dc¿ôo~¿\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\İNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlşÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\İ\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ŞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaş-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ı‡oş–Mÿ\0Œ_ùr\ïı‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½ş&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^;	tIq.w\Ò{\Şò\ç½\îX?Yºõ·\ä_\Ñ:s\ËûJö¯h±¢Ê±¨}~µn\İvgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\İs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-İ³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvM\"¼ê™º«Kˆ.±õ\×\ìµ\Îu\ë0\İÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘ş‘»›ÿ\0^\ĞıRšş\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ıfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ğö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ù8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0\0 N\Ä\0,\Ä\ì\0¯‰\Ø\0(v\'\0¯‰\Ø\0(v\'\0\0±±;\0*‰\0±±;\0*‰\0±±;\0*‰\0\0º\ìN\09‰\0º\ìN\09‰\0º\ìN\09‰\0\0»Ø\09‰\0»Ø\09‰\0»Ø\09‰\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0\0¾\0\0\0;±;\0¾\0\0\0;±;\0¾\0\0\0;±;\0\0¾;\0=bv\0¾;\0=bv\0¾;\0=bv\0\0¿±\0>‰\0¿±\0>‰\0¿±\0>‰\0\0À\ìN\0?‰\0À\ìN\0?‰\0À\ìN\0?‰\0\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0\0ÁØ\0F\'b\0ÁØ\0F\'b\0ÁØ\0F\'b\0\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\0Å±;\0O±;\0Å±;\0O±;\0Å±;\0O±;\0\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\0\Æ;\0d‰\0\Æ;\0d‰\0\Æ;\0d‰\0\0\Æbv\0t‰\0\Æbv\0t‰\0\Æbv\0t‰\0\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\0«D\ì\0œI\Û\0¯‰\Ø\0¶;\0¯‰\Ø\0¶;\0\0°bv\0»\'b\0°bv\0»\'b\0°bv\0»\'b\0\0¯Ø\0¾\ìN\0­‰\0¿v\'\0­‰\0¿v\'\0\0Ø\0\ÇN\Ä\0—‰\Ø\0Ç‰\Ø\0—‰\Ø\0Ç‰\Ø\0\0ƒ±;\0\È\Ä\ì\0~‰\Ø\0Æ‰\0~‰\Ø\0Æ‰\0\0h\ìN\0\Ã\Ä\ì\0b;\0º;\0b;\0º;\0\0Xbv\0²‰\0T\0\0\0‰\0O‰\0Š‰\0\0VØ\0y‰\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0XØ\0u±\0XØ\0u±\0XØ\0u±\0\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0\0Xbv\0q‰\0Xbv\0q‰\0Xbv\0q‰\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h‰\Ø\0I‰\0v\0\0\0>\ìN\0v\0\0\0>\ìN\0\0x±\0>\0\0\0x±\0>\0\0\0x±\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿ\á%\ÔExif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\Î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ô\0\0\0\0\0\0\0\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\ã\0\0\0\0\0\0\0\ë(\0\0\0\0\0\0\01\0\0\0\0\0\0\0ó2\0\0\0\0\0\0\0\0\0\0\0\0\0¤\0\0\0\0ipp\0‡i\0\0\0\0\0\0(\0\0¼\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(‚š\0\0\0\0\0\0‚\0\0\0\0\0\0ˆ\"\0\0\0\0\0\0\0ˆ\'\0\0\0\0€\0\0\0\0\0\0\00210\0\0\0\0\0\0\0\0\0\0\0\02‘\0\0\0\0\0‘\0\0\0\0\0\0F’\0\n\0\0\0\0\0N’\0\0\0\0\0\0V’\0\n\0\0\0\0\0^’\0\n\0\0\0\0\0f’\0\0\0\0\0\0n’\0\0\0\0\0\0\0’\0\0\0\0\0ÿ\0\0’	\0\0\0\0\0\0\0\0’\n\0\0\0\0\0\0v’\0\0\0\0\0\0~’‘\0\0\0\0\0\0…’’\0\0\0\0\0\0Œ \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0  \0\0\0\0\0\0  \0\0\0\0\0\0œ¢\0\0\0\0\0\0\0£\0\0\0\0\0\0\0\0£\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0“¤\0\0\0\0\0\Z\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤	\0\0\0\0\0\0\0\0¤\n\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0\0\0\0\0“‡\0;š\Ê\0\0\0\0´\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0\İ\0\0\'\0\0\0©\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0©\0\0\0d\0\0$\0\0\è354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!²\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\İ\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sğ\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñğ3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ı¸ZÚ¿ğD”ôi.J\Ïñ‘\Ñ\Zğ\ÖS{¿”C\0ÿ\0ÏV©úù\Ğ\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\İm\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECş*½wı.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯ş3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Şû­¯ı* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ı&\Ï\Ñ\Õú\ç2^\ë®õ\0e-\İmÑ¬o\Ñoª\ï\Í\Ş\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛ\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikİ\Ã÷9µ\İ]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½ş1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\İ\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\İ{ƒkiš\èfŒoş”³şêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ıÂ·1\ÃV´º;ğ?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ğ\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ĞS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\şqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉıŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4şšªı\"×‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ı`\éØ´\Ô:vef±¯Ä²\Ému\Öğc+;\Ûú-‘±¸ÿ\0Î¾\ïğI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™işß§\ÓşWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹Áş\Æfd»ù5S]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Ş\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœİ”\×ş†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wş	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\İ\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYşfıkÀ»#\ÑSœ30^2ñ-i÷‡05\ŞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\İBğF.4ò\Ó]C¿\Ïıÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ğ/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»ş\ëZ\ßğu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»ş¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôş‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îş\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êşc¶’—\å0\ÒHû3\\\\N\Ğ\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyıo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ĞWÿ\0^»üJwş£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadıg\êG­õzºn\â\á¼\×N\İ[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×²:?Mf	mYù\íô©\Ó\Ğ\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\İ¬ls\Âk\ŞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\İõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\İÿ\0A%<o\ÕN Şõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’J¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñğ\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\î\Ç>\ËK$ÿ\0„w\î=\Íı\ï\èô«\İc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïğ§şut?Rş«;§cı»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgı\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜIı\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElşQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØğZ\ÇX\ç82ª\Ú%\Ï{\Ê\ëcG\ç9\î\Ø\Å\ì¤\àıNú³eıE\ík\Øß´õ›\Ş\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kş5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsş…_Î —‰\ÂfWÖ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Ş}\Ö\ä?ùW]µŞŸıÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yş¾õ_­g\\,œ®\Øô\Ù`øµ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èşS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ğ§şšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzı:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Şv\ì\ì±\íşE–û?\ÒZ’œµ1˜\ìc9¿§xŸcHşd8…±®÷ş\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àı¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷ş\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Ş\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zş±ş\Ú\Ê\â’:f3‰ =Wı™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶ş\é{\ïs?ı\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çşúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúY\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦ş»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\İt §‡7\'m-ö6\Z\Ğtc=­u¯ü\İ\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwıcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\İ\0öˆğÑŸõ\Î\Æh·©c\à4\é‰_«güeğ\æÿ\0›Ê¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrİA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ĞûÛ²ŸıŸ\Õ\ë\İÿ\0½Efı]\è\Õt>‹‰\Ò\ë;ş\Í\\Xÿ\0ß±\ÇÔ¾\İ\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@İ¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿ~¶}S\ëı-\Öõ\Z·Qc¢¬\Êd\Ğd{+iúT9¿CÒ·ı\èıO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rı\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ıö\ê·û\ĞSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëW\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®İ«5ù¹on\Óaku\Ñÿ\0By\äø¡J{P98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ı3¾\Ñwúk?Eü\Ê\Ş\é8W\ç\ÜpºSM•Wı#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\İ-\İfŒ\\\Ò\ìzŸ\Õ3\ãP\Ğ>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»ó\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­şm ~\å\rİ»ù?\Ï[şk\á\ä\âecW~•İŒñ5\ÙQaOc™\í^[ş0óz\ÏY\êV\ã\áş±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñú¢\äºG\\\ê½ó‘Ò²\ç\Ò1º\Öò;dc¿ôo~¿\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\İNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlşÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\İ\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ŞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaş-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ı‡oş–Mÿ\0Œ_ùr\ïı‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½ş&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^;	tIq.w\Ò{\Şò\ç½\îX?Yºõ·\ä_\Ñ:s\ËûJö¯h±¢Ê±¨}~µn\İvgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\İs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-İ³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvM\"¼ê™º«Kˆ.±õ\×\ìµ\Îu\ë0\İÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘ş‘»›ÿ\0^\ĞıRšş\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ıfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ğö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ùÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\áŠhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa‘Br¡±Á\Ñ\áğÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AğQaq\"2‘¡±Á\ÑñB\ábÿ\Ú\0\0\0?\0\ßÆ€4 \r\0h@\Z\0\Ğ€4 \r\0h@\Z\0\Ğ€4 \r\0h@\Z\0\Ğ€4 \r\0h@:‹\ÎÛ›\Û\î\Ø\ë¸\çüÃ±%xH±Ú¼»\Ù#\á\ÜJ\n¢²0Q*¨/,.ŠS\0Š,[¸W€\í\àt3n\êN\éåˆ¢\Úÿ\0…Rw\İ\ËYdb’“ikN+5\Èó.u–K–A$zq®…$\Ês¢Í¤“„ˆ±=THcu¤p\å/\â\n˜šú¦75z–~L\'³(À¦º\Ì\ÓQ£\\£™eZ»\'\0\r\İJV#¢#\ÓzA:~¢\0‰\ÌÀ%\r_£	dñš\ì\Úc¯ªWs\Ï=2\Æ64›»Q\Ù1­\Ê@¨\ÌR]TUnªG±d\×MtWEB*p:j\"r\0\åÿ\0•\Æu\ÏB­´şEªm\Ï\ê/¨\äGQ¬²¾%`¯A\'r•‹a=F)¨r”\î\r:\Ü\ÅU2€ˆ‰ ğ§‘ñ¬\å‚ÿ\0\Ñõ ¦·\È\Ğn!\ÎØ¯:V™Z±¥º.\ÅôN@I(Aº\Éª¦1T)D½\ä\à@Àa/d\ÓNš%4óC½¨$4 \r\0hs8nm¶#’3†E¬\ãŠtjj™I[ò £Õ’(\Ø\ÃG$u9&n\â4EeŒ&\0jKVJMèŒ•\ï·\êX·I¶°Uv[U&;«4E\Ù]\çL—\ÒF\Ü\å’7«!P¡/ê²­&)‚‚“‰o~\è@J!\İN\0+\Õzd‰¤µÏŸ379“0\Ù_¸Ê›‘³\Îdüırbß½\Êr\Ë[\ÜbZ»¦\å|Í´\Ñ\'(ƒœ \î9Dœ4\Ä,EA’È¢f¿\nß…ºÖºQ=¨ƒ,$-Æ¹\')o\ÖÆ­\Ï=)™O¸ª\Ümµ‡jÑ¬½n‰\ÒceY\0*‚ş?;•\Ò-\Ğná»•OO-‹(w/¬Pöù†p]Jf\Åó+°3lm\Óy^g¬i\Ì/‰J\×‰\ØcwN…_g ş9¤´\é›*ñ‹wmT,¡¢2m«¯k2ƒm¹”-÷\ë\ÆC<\\$\ÆAµ\Ë\Üg\ZW\Z:,%\çû\âG³N(7;\ÅTH0e\ÕXÜ¨©\ÄvRj÷Ô„¯AyJ\ÌS„|‚q•k…\Ñ\Êc¤\Ö51IU˜Â²E0O@´LoLJ\0 \" \Z²\Åk8‘(k{û±n %Ä™5¦KañZ(HFg¬ô°ñN\ÜJÁÄ„\ÔIˆ­y\Ğ	Nt\ÕY2¥)s\á\ÔO5\ï*o~sBª4\í<¹\ÍÎ€»i\Ï“\ë5öó›\ÊIIA#-fhf\Æei`TRYEöe˜#U›¬@E³\Äm{@«¢³@\Z\0\Ğ1\Õ\'ª0\é\ÛEaŠLo[½1Y|ŒRz™Uk\Ü\å¨]-i$§ªÊ®G\èÇ‚µQ4Œ>‘\ÃYbbt*_-ß‘„\İ\Â\îk>nòò\ï)nñ-n—p¢ªDE*¡Ò­\ÖY®s\nq\Õ\Ø4¸B5©\0¼‘2˜İ¾D =¡Ì¦\Û\ê•\Ûğ\å\ÍVU\Õ\Î|ˆow»\Âc¯ig–I‚«\ÒĞ–\"\Ç\Ép,¥œ@K°›kõ”Lá‹—,nº`2©82e(˜À\Z\ÚôQy·±o[;\ØV1\Üşs°f<¹ğmŠm\ä\Ë\ë¦ \Ù\\û‹\ì¹\Øb$S=\Ê\"f\\h„ú3\ÒDŒFB:	*ª¸•9\é„)Ù³-z²m¦’.~y©:‰bı°m.ör\ãˆ\Ë&B\Îu0¥Jô\älXú€\îq$\İë’H·nVµù+¶P.\Ô\"/¹d§\Êé‘“hşmº~\éguÙ•IAÀY“qV;­ã·²‰\Òö,’¬òˆ´¯B¤©Š.\ìŒ:ªUöe)\nR™Ë¤Çµ4\Û1l •ú¹U\Z·%ùööİ¥m\èÒ™YOt\Ù-¡}3Û­‰\ÊÀ`XI€«[X\æò¡SP9*\Ïÿ\0ŠXJF\ã\ÊM²rVÒµóœ,\Â÷˜ó4mj…\İ\îEÊ¶u\Û&F“ˆŒ+Ùµ–/)\"\Ú)$’ˆª1`G\ï^$\İ4›7ar$˜\0$AÑµ–¥=\é*N\Í\Ñ\í\Û`O·V8Ÿ!ÀD\ÜñK„ f¡\ìQ­]>\Ê\ÖÙ£,¤¬›ô\Ì%7\æ99UŞ»+ Q3\Æ%\Û\é.ŠL\Ó\å)d›\É¢ß¨\Ú\ŞroÓ¿6-µ9I›¾\İnÓ¶;\Æ\Îe®¯Jú\áˆl•HJ^6\ÅoEANÁ\î	û÷u§e\í1S3–G `)-	¦\ÒN\Ó!Å§\äkB.Eœ\Äl|´r\Åq&É¤ƒş…Ù½n›¦«Ï’™S0½­ˆ?v€ª®©ıS±7MŒN‹\ÇÄ¾\îşÁúX[‘ø¢¼Ë„DZ­w»¬\ÔEjö1vr{§@^Er„d`ÊŠ¨\Û9\ÍAx½F6ü{ù(e­\Íe\Ëvw\Î÷÷Ü~‘,”\ì\ëò•è¤z1°p1i£Wd	µn\0ƒF\è…(eUS‘·&\ÛvÙ²Ihyù\Õ\\\Å\ÔwÖ»[\Ä°j’ÀØ‡1J³\å\Ò \ĞH8\îK\Üb€ö÷”¹C¦C\Õ+\Ñ\\ŠªIµ©_\Ó%ºX\ìœm±jŒÃˆô\ß\Õ)J‘G(Tb%™™RIND¤˜Fğh¥TT­Š©\Ä5PÂº\Şğê”½šO\\Ä¢\åCr•\Õõ¾\Ñf…n\Â1\Õ\n\ák¯e8DA^\reö.c?˜n\èh‹YF-œ¤\Ä¢R$ &\í»•ªªûQk|µû\Ú[„\ÎqR¶	¸\ìÏ•XK\Ú\'$¬\Ög\ír\r­5\ì6I…½Ä¬ô\ÑBW²J]\Ê\Üe\Ö!”8¥v…-)v4\ÛQ‘ó®]\ÉlšE\äl©¯qq«{¨ø{]\Âvnƒ²”JWŒ\á^=3F\ï@x\\¨¥\0\"\Z”¶H£y;ô_±–IÓ‡\nš¨\çDCDD\æ0ø)@90\0\0<\Z\Ó\áK%zşù\êR¤\ë\Å\ZZ\Øf©\ìg~¢;‰ŠÌ¶\ê\Ê-ñ=M\à9‰*Í‰\Ê$¤Õ¡Š¸zl÷©ö\ìV2€P;:\ÔjN”\íD^†°”œ¥K¿9ß±tšWY\í\á\ÏøH^ö\r\Ò\åc#w\'sŸ³Gä›¥’õEœU\êŒ\ë1–R¤Y”k\r–1’r«”Lb R·gH%¦2™Ê›\Ë@“ª¬›²|uMª–hŸD–Š‹¥\\ªó‡¦\åC¦M\Ä\ã\ë\å\×]9* ¥@t\ÂO\ÃmÊ®\éóÈ†µï¯¯\Ø\Ò7L\à]\Åll9X\Êw½—ÆŒ e€L&1&¨ÏŸ\Ò%@\Ãû\İ|\ç/ßµRó\ç^‰˜\ào»r{C\Ú\à7\'[¤§‘g°ş;”·\ÅS\ÜH)”«¶\î±MYG\É$u†h/½\ëÒ¢_]F‘\Ë$\ÜJ±\È`¬ŸL[Ö‰J\ÚZY\Ì+%eŒÁºŒ\Ët\Ü~·=½d\Ëäˆ¾›šxI“&­\Ä\È\ÄV\ëqE0¥^©\Ç3oß„Z¢A\æ.ª\ë«\Å&\ä\í\çfµ¢¬¨\\5R™[¹Zœ:¹\nˆ™C˜\ÄMW‹˜‡2Lú‚\0£•=3|iC¬¨•4\Ì:&Ö‹/\É®Œo™ºË…³&RŠ“«\à‡“ÆŸˆ››¡klV¥%\æaú>\å¸ œ© VË®qVI\Ë`Ù²¢ETCH\ÒNŸ¼–d&_9\à{[\Íy%n\Ü5ú¯\\U\n\í:0Y\ÃK§\ns¬\è\Z\çw\'*\"BšÆ¿\"\rZ\íÙ‚\ÇAg+«\ê\Ñ\ZY½l¶¶¨dÁ‹xöˆ1dÜY4H¨ \Ù\"ğšIÀ?\Õ\Èò\"<ˆ˜D\Â\"#Î­vó\Éyó±5^&dG·õ|€‡\Ç\â<~ÿ\0ô\Õ\ÊOF7¯•1ŒnDD¢o°÷ùñ©jŸs7{—U\ÑW¦,\æşw!¦\â¸?\'x\Ì\ïLš‰·“Œ]Ê£M\Åh¹;e\ìòL\\{ )Fğ1r\ë6c‰Š£¾Z^F°‹ò\çĞ°\í\ã]\ãzo½¶\"\ÇK±u²MX\r\êZ5d\ØSò[”¯ZfY*\İ1læ¸™£”¬B˜ˆ¡70\İD‚E¨[\èK»×º\æ\ä­]\ä—9Ø»ŒeI;:\Ú:¾\Í1¬V\ãQ…Œ\ÍHƒu\â\ë€#!.TS)J‘^Í¬¢\é„Ú¸A\0\0M¹\n9?$I:\ìÛ™U6eŒ\Ú<\0üÕ“q}E>\Óö„š\ÊH_¬*z%0€\0%UL\Èvœ\ç\ÖşÎ®JüJOL×‘y\ßN\é\Î=*pJGS\Õö¶\Ì\àĞŠr&\Ão/~\0\r\Üx\ã8\×y‘`»ı¬´¸lsx5\ÇÉ•VÒ›f\Íè˜†\à\ïO\Ø] n>\âUÛ¤`ûòP\ãUp—“%jn”\ÌVİŒ;›=‘\Óx\Z\Ä$g\ãÒ¯¿–Õ‹Q\"«,¨ğ›“‰H™@\ÇUC‘\"”9J<®öu\é\Ï¶\í½\\º«nQ:<sIš¶\Ñ0\ãÖ¯2‹qU£‰\ä·ªÆš\Ù\ê!\Ú6™\Ïj\'x±D\Â\Â=˜ƒü¦‚\æ\Íô+Ğ‹nÖ&÷%µ \í%V™ƒP.4c\é¸\ËJÀ\Ã<ºY\â\ã\Ãò\ÕZ1\ëeÁ‹4R]\ä’EDÇ·;‚¨.Tn’ø\ÅËª\Ó-F#,’©\Ï\Ï\ÏO\'	]­–rbB`+\Õ\Â\ÃUaEÚ€‹,¢P*€š%1Î¨•0:\Ê(±¡µ·–wC-ß‘&\ä8yò\Ü<‡Ÿ<ùÿ\0¾¬šo<‘\"Y^\Ş~€\0>x|}¼‡üõªw™I=+[˜—\Èd[3d\Òju˜·tˆ.¦1\\81€\É4?¯ıjqşÁxñ\Ş\Z\ÏB7»&8jMW\Ø\Ù\ÖĞ²’¸[¡¶ığV!3<w»\Û\ÓZM~ÁY7±»\åI-Ú½¬Wq|\Ä#ó\ÇopJ¬º«EQôQ‰&8ü@\Ù28X˜\ÆP“Sz«¬÷òòNõø‘iFQ•V[ó\Ï\ì{;?\Út6¢Qğ.‘…“4W°™³r–Á)8V“¶\"\İ`\"Átš\ã9Q†A&\"a9\ÍG)K\\\Ù,»;…3PPNQ\âgm‡ew›J\ÊG6	€8{ `¬ˆ‚	H\Ê%L\àWi\ÓU¾hªiï¡Î¿´Î².\ß11İ˜§ƒ¸\å»\"\'Pyn3\'L¬’óÁTöQV\å‹\ÏÁ\ä<:\ëöuu±œŞ†\×:\âK&\Z\éO³\Úå½¢¬l–j®X‘f¹5š¡™n6<Ÿ\ÙrrG®Z!@7S¸5\ÚP—û\éŸk[\Ù\Ş\å»PI\Ş¼Wˆc¤;¶C¯Ubˆ\ãÀ\ï&P!yù\ê“iBM\éD¥m#š.\é\î¤\É\Ôi“\Ñ\Ø#[”¥),G¨û¬!Y²u`h\ĞS¿¨@£%‹a\'%w)$\n´©”\ÉaÒ•e¡g\'t\ÖD\è\è\×\Õ+k¸/\Ø0.\\¢-Š™Rd\ìFù’ˆ\Ù\Õ\Õ+xÉ•Y4\ÖÊ´\Ó¯R´¸3r³k%²\ÍDj\ÕX´LX7+½K\ÇL—;üŠ\Ä\ß^ó¯›\â\ÎRùBÎ›ˆ\n|YWñF:>»*$®AT\Û,d\Ç\ÓykX‰<›zP\0p\ìJ‚\\3f\Í2UE,‰\×.\ä+TK\Ú!ñÀŸ¿\Ï!\ã\íÿ\0­X›²+J öãøó\Ç\ä\ÛWŠ\Ò÷Yóû)&ò°\ÒV™–°Ñ©z®*}4SUuD?¥\'\Üc\Ø\Ç\Ï\Z»j	Y\å,\Ş~\Î\í[V*LZ®qm\í\áÙ¬õä“ƒ&™)$+=‘p©‡µ \íõcˆö¦‘|ˆ5\æ\âM\Îmı\Ì5³Ó›£M\Ú&.\×\\\Å[Qªuùb\Ñkp0mœE¡uaJ1­IU\\_\ç\ZI\Û\'PL¨¤x\ÊúdM\ë\Â¢ºR[­yú\"Y\Ê\ë>v®}u/²<a*‹\È\Ù\ÕH§?Q²-†v\Üx»\Ät@H4ZR\Æö\Ï%Z1@ˆšVX®™5X\Å$|C’¡î¾OSm¥]\Õı7õ\ËÖy\ëQ\\ó\Ñü3RÁ\Ë\êr§¶\ä™\ÕI¼§s‘ym»\Ë;vqE\"Œ\ÄÛ€,s^N\0TY Í²dşR¦˜58‹®W<^oÄˆ¦–”b\Z\'n\Ò}Z:\Å\Õ\éQöS˜\Ş÷—§¢,HC92\ÏjW\Û;\Ä!.¶7ªòdY¡6n˜10	Šyl„9\Z\èÀUJ´Ì¤£Y÷:ƒ\ÅÆ±‡aÉ´llc6±ññÌ‘I³6Y ›flZ7D D\"\Ù$“L…\0)H\0\0\0k¨ ‰\Ë8£g<ms\ÄYV²\Ê\ã2\êÍ¶· £¤”ˆ‘HS]2<`\á\'1\Ïn\Å[»j².š8E7\r–Id\Èr\ÃIªj\Ó\0º\Éı/ÛŠ\Ç%™ºt>\Ì8Rƒ\ì\é\í£Ü¨–n¢¢¸û<\Õ.Uó\ÏC6\Å\Û(\å\âG3+\"‡ô“A¤\ê\âuu^”¶¾sÄœl\ËV-\Ç\îhĞ”:ª\Ù\ì \Õ\Ü\è\n‡9¢‰…v¦\äx;”TT\Ê;8ù÷\"(€ö7?4\ßUt¬—×Ÿ\"t\İ\ß9ò®¤™3(™\Ëö-y\ãõ9zÑ°U`<ö\ÕT$Õ¼šÛŒ³“Uyµó\Î\îu4ù)­0…0r¤z<ƒD\Ôô\çR¡*\íù\æ\ä9]m^¿a6ò\ãM)•±€\Ì(µƒ²»şO¶(…T\Ãö\07Ÿ°\ëEL²\Éú\Ë\ê,(—²@5u%\nC{¥CX¬\ÓUx\Ïf‰„À™|ùE\Ò(ö‰”M4W˜œ—¬\â\å•\ÒĞ˜\É->¿\Øó\ÒwIf—\ÉT\Ü@\êF™;\í“1v”ª<T\æU~UÖ¾\î~]š+¿…	\ãÒE«F\ä‘Ie™Ş’Š\Ù\Ë\Ù\Ôc)¥\ï-?­K\Çõ(º£T;ÚeÎ³±Jx\é[\"­i\ÉW[W%+\n!pO\ïgA$ñ³/\Ê90\é\îFGJš	8t\è˜\á\á\Ï\Ôv\Õö\çcI\Ê1\×\\‹—\Ü^\èºjô{’\ÄT]\ÇXm¹‹-dG\è‹x\èv·\Ë›w@\ã(Xq\ÓyDÑ®Ñ‚X7D¥9 e\×R5\"±zdû\á-:Ÿ‰\Í,I;¯u>\Å\Â\íó8\ísu˜Ñ†HÛ¥\ë\å\ìm$@²´³CÈ³`\äJ‹1š‘\Õbm2‰}Xù&­\"\"\0£r\ëZ]Šs·Œ‡\çl–ŒM„10³\\\"\Û\ìXó\Z\Ò\éS–¢ ¨®lrÕ¨F«Í”‹˜\ê¨ \ê\à\â&Ò’\ÑP-H\r\0\0ü€>|€òıù\0ÿ\0MB›òúu6¾ìŒ–Y˜C\"\à±\àÕ‰›şÓ©U+s\Ğpõ\ãK5®“#NzÁı¤®^œ|.ıÈ“\ã.)¦¡(\áÛª²m÷2«¹o£\Û4\Ûb\ç\ÛVm\Û\Æu¢:YØ²uuRcd	&b™ªS0\ÊB\Ï\Å\È(tT\n\ì\å“)”@\æˆ\Å(Y* ˆn>”\î³Hˆ‚Xó:\àGk¸Êše?\ØLs—\0û€`Ò¾@òúUzÏ˜DG\áõ„GCrğ\ÜüqÇªpñÿ\0+\Ô)}*\İf\Ë\È\á\î@y)‡q\Ø\Ø@\0D;T\ã\çöù\ÔşA/v©ô õT‹\Ê8\ß\"\Ü\î[_Á‘\ï5ko»•¿L\å;¯\Í4“;†5Š¥XÙ‡¥M°Š-\ÜÊ ‚ŠUS/&\n\Ê.Qq\Õ>\ä§M=h\İDŒßºZmf6BE4\ä\rX‚Ad\\\äŒ÷š,L\Ş\ÌJHJJ9\äd\í’c+%+$\àE¼\\TJ\êSaƒ`£pÀ‡d¾¯ö\Í!cN®·o²üø-Y½\çmz?Y^ó›²ô\Z1¹Ÿ 9üRóA]8‚S!  Q‡¨WùE±\×cb\Z0lƒY6\åxôTq\"£¦k.¡‹\ÃşN7òu_ºÿ\0\×oİ?Ã…J=÷\ßÔ¬¨m}ûl\êo…¶ó´¯8†g¹<¥],s˜u\Ô3xœ\n[[c[§3\ÕVXª±¯·«²|¸°šNM«¡|Ä±¦Q\ë\æH›·b¦Ò¦²g.&\Ãi]§§‘Ô´œñ\çÇ“qöı=\Ã\Û\à~·\Z\Ø\Ìú\Ğ€4 \r\0h@\Z\0\Ğ»}[À}Bğ\Ûl5š[\Ú4€´°¿\ã\Ë\æ9·IÑ²F-È±1òq1Wº5’8LF\ÓhFMK!\è½lö=tŸœY«ÁCVš\î\n¬t\åê•·œ¥\Ñ6%\İ\Æ¹/*l{¼\éwq\ÆE\Ãò\ärW{¤\Ä\Çp¢9Et£ô\ìd Tri7ÑP‘+d\Ü¸ñ}–-§†º]\é·üªõ7†<£jN\Õzš2\Û\ÓqN\ÖiõºTR2öÕ’|\îó•ç˜±s‘²Mu\ÛyKMš\ÙcôEË…_Ë¶n°3*\ŞÉšLš5j‰hˆ§ÃŠŒtF2“”œ¬“º¹ \r\0h@\Z\0\Ğ€4 \r\0pÀˆ!ğ?·\Û\Ç\í\ã@\Z\0\Ğ€ÿ\Ù',876543,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\mauseinalam.jpg'),(16,'mouse','Funciona',34567,_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\í/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B®7\020200721<\0124448+00008BIM%\0\0\0\0\0lD©.w@q&ô ò¼\'Ç8BIM:\0\0\0\0\0\ï\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\à\0\0\0\0\0\0\0\0\0Grn doub@o\à\0\0\0\0\0\0\0\0\0Bl  doub@o\à\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\í\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\Î\0\0\0\0\0\0 \0\0\0 \0\0\à\0,\0\0\0!²\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\İ\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sğ\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñğ3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ı¸ZÚ¿ğD”ôi.J\Ïñ‘\Ñ\Zğ\ÖS{¿”C\0ÿ\0ÏV©úù\Ğ\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\İm\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECş*½wı.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯ş3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Şû­¯ı* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ı&\Ï\Ñ\Õú\ç2^\ë®õ\0e-\İmÑ¬o\Ñoª\ï\Í\Ş\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛ\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikİ\Ã÷9µ\İ]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½ş1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\İ\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\İ{ƒkiš\èfŒoş”³şêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ıÂ·1\ÃV´º;ğ?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ğ\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ĞS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\şqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉıŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4şšªı\"×‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ı`\éØ´\Ô:vef±¯Ä²\Ému\Öğc+;\Ûú-‘±¸ÿ\0Î¾\ïğI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™işß§\ÓşWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹Áş\Æfd»ù5S]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Ş\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœİ”\×ş†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wş	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\İ\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYşfıkÀ»#\ÑSœ30^2ñ-i÷‡05\ŞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\İBğF.4ò\Ó]C¿\Ïıÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ğ/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»ş\ëZ\ßğu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»ş¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôş‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îş\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êşc¶’—\å0\ÒHû3\\\\N\Ğ\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyıo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ĞWÿ\0^»üJwş£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadıg\êG­õzºn\â\á¼\×N\İ[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×²:?Mf	mYù\íô©\Ó\Ğ\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\İ¬ls\Âk\ŞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\İõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\İÿ\0A%<o\ÕN Şõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’J¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñğ\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\î\Ç>\ËK$ÿ\0„w\î=\Íı\ï\èô«\İc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïğ§şut?Rş«;§cı»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgı\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜIı\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElşQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØğZ\ÇX\ç82ª\Ú%\Ï{\Ê\ëcG\ç9\î\Ø\Å\ì¤\àıNú³eıE\ík\Øß´õ›\Ş\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kş5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsş…_Î —‰\ÂfWÖ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Ş}\Ö\ä?ùW]µŞŸıÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yş¾õ_­g\\,œ®\Øô\Ù`øµ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èşS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ğ§şšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzı:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Şv\ì\ì±\íşE–û?\ÒZ’œµ1˜\ìc9¿§xŸcHşd8…±®÷ş\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àı¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷ş\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Ş\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zş±ş\Ú\Ê\â’:f3‰ =Wı™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶ş\é{\ïs?ı\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çşúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúY\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦ş»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\İt §‡7\'m-ö6\Z\Ğtc=­u¯ü\İ\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwıcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\İ\0öˆğÑŸõ\Î\Æh·©c\à4\é‰_«güeğ\æÿ\0›Ê¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrİA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ĞûÛ²ŸıŸ\Õ\ë\İÿ\0½Efı]\è\Õt>‹‰\Ò\ë;ş\Í\\Xÿ\0ß±\ÇÔ¾\İ\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@İ¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿ~¶}S\ëı-\Öõ\Z·Qc¢¬\Êd\Ğd{+iúT9¿CÒ·ı\èıO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rı\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ıö\ê·û\ĞSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëW\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®İ«5ù¹on\Óaku\Ñÿ\0By\äø¡J{P98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ı3¾\Ñwúk?Eü\Ê\Ş\é8W\ç\ÜpºSM•Wı#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\İ-\İfŒ\\\Ò\ìzŸ\Õ3\ãP\Ğ>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»ó\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­şm ~\å\rİ»ù?\Ï[şk\á\ä\âecW~•İŒñ5\ÙQaOc™\í^[ş0óz\ÏY\êV\ã\áş±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñú¢\äºG\\\ê½ó‘Ò²\ç\Ò1º\Öò;dc¿ôo~¿\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\İNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlşÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\İ\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ŞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaş-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ı‡oş–Mÿ\0Œ_ùr\ïı‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½ş&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^;	tIq.w\Ò{\Şò\ç½\îX?Yºõ·\ä_\Ñ:s\ËûJö¯h±¢Ê±¨}~µn\İvgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\İs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-İ³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvM\"¼ê™º«Kˆ.±õ\×\ìµ\Îu\ë0\İÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘ş‘»›ÿ\0^\ĞıRšş\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ıfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ğö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ù8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0\0 N\Ä\0,\Ä\ì\0¯‰\Ø\0(v\'\0¯‰\Ø\0(v\'\0\0±±;\0*‰\0±±;\0*‰\0±±;\0*‰\0\0º\ìN\09‰\0º\ìN\09‰\0º\ìN\09‰\0\0»Ø\09‰\0»Ø\09‰\0»Ø\09‰\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0\0¾\0\0\0;±;\0¾\0\0\0;±;\0¾\0\0\0;±;\0\0¾;\0=bv\0¾;\0=bv\0¾;\0=bv\0\0¿±\0>‰\0¿±\0>‰\0¿±\0>‰\0\0À\ìN\0?‰\0À\ìN\0?‰\0À\ìN\0?‰\0\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0\0ÁØ\0F\'b\0ÁØ\0F\'b\0ÁØ\0F\'b\0\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\0Å±;\0O±;\0Å±;\0O±;\0Å±;\0O±;\0\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\0\Æ;\0d‰\0\Æ;\0d‰\0\Æ;\0d‰\0\0\Æbv\0t‰\0\Æbv\0t‰\0\Æbv\0t‰\0\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\0«D\ì\0œI\Û\0¯‰\Ø\0¶;\0¯‰\Ø\0¶;\0\0°bv\0»\'b\0°bv\0»\'b\0°bv\0»\'b\0\0¯Ø\0¾\ìN\0­‰\0¿v\'\0­‰\0¿v\'\0\0Ø\0\ÇN\Ä\0—‰\Ø\0Ç‰\Ø\0—‰\Ø\0Ç‰\Ø\0\0ƒ±;\0\È\Ä\ì\0~‰\Ø\0Æ‰\0~‰\Ø\0Æ‰\0\0h\ìN\0\Ã\Ä\ì\0b;\0º;\0b;\0º;\0\0Xbv\0²‰\0T\0\0\0‰\0O‰\0Š‰\0\0VØ\0y‰\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0XØ\0u±\0XØ\0u±\0XØ\0u±\0\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0\0Xbv\0q‰\0Xbv\0q‰\0Xbv\0q‰\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h‰\Ø\0I‰\0v\0\0\0>\ìN\0v\0\0\0>\ìN\0\0x±\0>\0\0\0x±\0>\0\0\0x±\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿ\á%\ÔExif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\Î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ô\0\0\0\0\0\0\0\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\ã\0\0\0\0\0\0\0\ë(\0\0\0\0\0\0\01\0\0\0\0\0\0\0ó2\0\0\0\0\0\0\0\0\0\0\0\0\0¤\0\0\0\0ipp\0‡i\0\0\0\0\0\0(\0\0¼\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(‚š\0\0\0\0\0\0‚\0\0\0\0\0\0ˆ\"\0\0\0\0\0\0\0ˆ\'\0\0\0\0€\0\0\0\0\0\0\00210\0\0\0\0\0\0\0\0\0\0\0\02‘\0\0\0\0\0‘\0\0\0\0\0\0F’\0\n\0\0\0\0\0N’\0\0\0\0\0\0V’\0\n\0\0\0\0\0^’\0\n\0\0\0\0\0f’\0\0\0\0\0\0n’\0\0\0\0\0\0\0’\0\0\0\0\0ÿ\0\0’	\0\0\0\0\0\0\0\0’\n\0\0\0\0\0\0v’\0\0\0\0\0\0~’‘\0\0\0\0\0\0…’’\0\0\0\0\0\0Œ \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0  \0\0\0\0\0\0  \0\0\0\0\0\0œ¢\0\0\0\0\0\0\0£\0\0\0\0\0\0\0\0£\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0“¤\0\0\0\0\0\Z\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤	\0\0\0\0\0\0\0\0¤\n\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0\0\0\0\0“‡\0;š\Ê\0\0\0\0´\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0\İ\0\0\'\0\0\0©\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0©\0\0\0d\0\0$\0\0\è354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!²\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\İ\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sğ\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñğ3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ı¸ZÚ¿ğD”ôi.J\Ïñ‘\Ñ\Zğ\ÖS{¿”C\0ÿ\0ÏV©úù\Ğ\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\İm\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECş*½wı.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯ş3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Şû­¯ı* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ı&\Ï\Ñ\Õú\ç2^\ë®õ\0e-\İmÑ¬o\Ñoª\ï\Í\Ş\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛ\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikİ\Ã÷9µ\İ]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½ş1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\İ\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\İ{ƒkiš\èfŒoş”³şêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ıÂ·1\ÃV´º;ğ?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ğ\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ĞS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\şqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉıŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4şšªı\"×‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ı`\éØ´\Ô:vef±¯Ä²\Ému\Öğc+;\Ûú-‘±¸ÿ\0Î¾\ïğI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™işß§\ÓşWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹Áş\Æfd»ù5S]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Ş\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœİ”\×ş†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wş	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\İ\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYşfıkÀ»#\ÑSœ30^2ñ-i÷‡05\ŞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\İBğF.4ò\Ó]C¿\Ïıÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ğ/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»ş\ëZ\ßğu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»ş¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôş‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îş\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êşc¶’—\å0\ÒHû3\\\\N\Ğ\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyıo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ĞWÿ\0^»üJwş£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadıg\êG­õzºn\â\á¼\×N\İ[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×²:?Mf	mYù\íô©\Ó\Ğ\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\İ¬ls\Âk\ŞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\İõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\İÿ\0A%<o\ÕN Şõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’J¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñğ\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\î\Ç>\ËK$ÿ\0„w\î=\Íı\ï\èô«\İc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïğ§şut?Rş«;§cı»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgı\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜIı\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElşQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØğZ\ÇX\ç82ª\Ú%\Ï{\Ê\ëcG\ç9\î\Ø\Å\ì¤\àıNú³eıE\ík\Øß´õ›\Ş\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kş5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsş…_Î —‰\ÂfWÖ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Ş}\Ö\ä?ùW]µŞŸıÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yş¾õ_­g\\,œ®\Øô\Ù`øµ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èşS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ğ§şšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzı:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Şv\ì\ì±\íşE–û?\ÒZ’œµ1˜\ìc9¿§xŸcHşd8…±®÷ş\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àı¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷ş\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Ş\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zş±ş\Ú\Ê\â’:f3‰ =Wı™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶ş\é{\ïs?ı\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çşúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúY\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦ş»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\İt §‡7\'m-ö6\Z\Ğtc=­u¯ü\İ\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwıcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\İ\0öˆğÑŸõ\Î\Æh·©c\à4\é‰_«güeğ\æÿ\0›Ê¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrİA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ĞûÛ²ŸıŸ\Õ\ë\İÿ\0½Efı]\è\Õt>‹‰\Ò\ë;ş\Í\\Xÿ\0ß±\ÇÔ¾\İ\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@İ¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿ~¶}S\ëı-\Öõ\Z·Qc¢¬\Êd\Ğd{+iúT9¿CÒ·ı\èıO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rı\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ıö\ê·û\ĞSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëW\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®İ«5ù¹on\Óaku\Ñÿ\0By\äø¡J{P98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ı3¾\Ñwúk?Eü\Ê\Ş\é8W\ç\ÜpºSM•Wı#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\İ-\İfŒ\\\Ò\ìzŸ\Õ3\ãP\Ğ>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»ó\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­şm ~\å\rİ»ù?\Ï[şk\á\ä\âecW~•İŒñ5\ÙQaOc™\í^[ş0óz\ÏY\êV\ã\áş±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñú¢\äºG\\\ê½ó‘Ò²\ç\Ò1º\Öò;dc¿ôo~¿\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\İNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlşÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\İ\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ŞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaş-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ı‡oş–Mÿ\0Œ_ùr\ïı‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½ş&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^;	tIq.w\Ò{\Şò\ç½\îX?Yºõ·\ä_\Ñ:s\ËûJö¯h±¢Ê±¨}~µn\İvgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\İs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-İ³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvM\"¼ê™º«Kˆ.±õ\×\ìµ\Îu\ë0\İÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘ş‘»›ÿ\0^\ĞıRšş\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ıfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ğö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ùÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\áŠhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa‘Br¡±Á\Ñ\áğÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AğQaq\"2‘¡±Á\ÑñB\ábÿ\Ú\0\0\0?\0\ßÆ€4 \r\0h@\Z\0\Ğ€4 \r\0h@\Z\0\Ğ€4 \r\0h@\Z\0\Ğ€4 \r\0h@:‹\ÎÛ›\Û\î\Ø\ë¸\çüÃ±%xH±Ú¼»\Ù#\á\ÜJ\n¢²0Q*¨/,.ŠS\0Š,[¸W€\í\àt3n\êN\éåˆ¢\Úÿ\0…Rw\İ\ËYdb’“ikN+5\Èó.u–K–A$zq®…$\Ês¢Í¤“„ˆ±=THcu¤p\å/\â\n˜šú¦75z–~L\'³(À¦º\Ì\ÓQ£\\£™eZ»\'\0\r\İJV#¢#\ÓzA:~¢\0‰\ÌÀ%\r_£	dñš\ì\Úc¯ªWs\Ï=2\Æ64›»Q\Ù1­\Ê@¨\ÌR]TUnªG±d\×MtWEB*p:j\"r\0\åÿ\0•\Æu\ÏB­´şEªm\Ï\ê/¨\äGQ¬²¾%`¯A\'r•‹a=F)¨r”\î\r:\Ü\ÅU2€ˆ‰ ğ§‘ñ¬\å‚ÿ\0\Ñõ ¦·\È\Ğn!\ÎØ¯:V™Z±¥º.\ÅôN@I(Aº\Éª¦1T)D½\ä\à@Àa/d\ÓNš%4óC½¨$4 \r\0hs8nm¶#’3†E¬\ãŠtjj™I[ò £Õ’(\Ø\ÃG$u9&n\â4EeŒ&\0jKVJMèŒ•\ï·\êX·I¶°Uv[U&;«4E\Ù]\çL—\ÒF\Ü\å’7«!P¡/ê²­&)‚‚“‰o~\è@J!\İN\0+\Õzd‰¤µÏŸ379“0\Ù_¸Ê›‘³\Îdüırbß½\Êr\Ë[\ÜbZ»¦\å|Í´\Ñ\'(ƒœ \î9Dœ4\Ä,EA’È¢f¿\nß…ºÖºQ=¨ƒ,$-Æ¹\')o\ÖÆ­\Ï=)™O¸ª\Ümµ‡jÑ¬½n‰\ÒceY\0*‚ş?;•\Ò-\Ğná»•OO-‹(w/¬Pöù†p]Jf\Åó+°3lm\Óy^g¬i\Ì/‰J\×‰\ØcwN…_g ş9¤´\é›*ñ‹wmT,¡¢2m«¯k2ƒm¹”-÷\ë\ÆC<\\$\ÆAµ\Ë\Üg\ZW\Z:,%\çû\âG³N(7;\ÅTH0e\ÕXÜ¨©\ÄvRj÷Ô„¯AyJ\ÌS„|‚q•k…\Ñ\Êc¤\Ö51IU˜Â²E0O@´LoLJ\0 \" \Z²\Åk8‘(k{û±n %Ä™5¦KañZ(HFg¬ô°ñN\ÜJÁÄ„\ÔIˆ­y\Ğ	Nt\ÕY2¥)s\á\ÔO5\ï*o~sBª4\í<¹\ÍÎ€»i\Ï“\ë5öó›\ÊIIA#-fhf\Æei`TRYEöe˜#U›¬@E³\Äm{@«¢³@\Z\0\Ğ1\Õ\'ª0\é\ÛEaŠLo[½1Y|ŒRz™Uk\Ü\å¨]-i$§ªÊ®G\èÇ‚µQ4Œ>‘\ÃYbbt*_-ß‘„\İ\Â\îk>nòò\ï)nñ-n—p¢ªDE*¡Ò­\ÖY®s\nq\Õ\Ø4¸B5©\0¼‘2˜İ¾D =¡Ì¦\Û\ê•\Ûğ\å\ÍVU\Õ\Î|ˆow»\Âc¯ig–I‚«\ÒĞ–\"\Ç\Ép,¥œ@K°›kõ”Lá‹—,nº`2©82e(˜À\Z\ÚôQy·±o[;\ØV1\Üşs°f<¹ğmŠm\ä\Ë\ë¦ \Ù\\û‹\ì¹\Øb$S=\Ê\"f\\h„ú3\ÒDŒFB:	*ª¸•9\é„)Ù³-z²m¦’.~y©:‰bı°m.ör\ãˆ\Ë&B\Îu0¥Jô\älXú€\îq$\İë’H·nVµù+¶P.\Ô\"/¹d§\Êé‘“hşmº~\éguÙ•IAÀY“qV;­ã·²‰\Òö,’¬òˆ´¯B¤©Š.\ìŒ:ªUöe)\nR™Ë¤Çµ4\Û1l •ú¹U\Z·%ùööİ¥m\èÒ™YOt\Ù-¡}3Û­‰\ÊÀ`XI€«[X\æò¡SP9*\Ïÿ\0ŠXJF\ã\ÊM²rVÒµóœ,\Â÷˜ó4mj…\İ\îEÊ¶u\Û&F“ˆŒ+Ùµ–/)\"\Ú)$’ˆª1`G\ï^$\İ4›7ar$˜\0$AÑµ–¥=\é*N\Í\Ñ\í\Û`O·V8Ÿ!ÀD\ÜñK„ f¡\ìQ­]>\Ê\ÖÙ£,¤¬›ô\Ì%7\æ99UŞ»+ Q3\Æ%\Û\é.ŠL\Ó\å)d›\É¢ß¨\Ú\ŞroÓ¿6-µ9I›¾\İnÓ¶;\Æ\Îe®¯Jú\áˆl•HJ^6\ÅoEANÁ\î	û÷u§e\í1S3–G `)-	¦\ÒN\Ó!Å§\äkB.Eœ\Äl|´r\Åq&É¤ƒş…Ù½n›¦«Ï’™S0½­ˆ?v€ª®©ıS±7MŒN‹\ÇÄ¾\îşÁúX[‘ø¢¼Ë„DZ­w»¬\ÔEjö1vr{§@^Er„d`ÊŠ¨\Û9\ÍAx½F6ü{ù(e­\Íe\Ëvw\Î÷÷Ü~‘,”\ì\ëò•è¤z1°p1i£Wd	µn\0ƒF\è…(eUS‘·&\ÛvÙ²Ihyù\Õ\\\Å\ÔwÖ»[\Ä°j’ÀØ‡1J³\å\Ò \ĞH8\îK\Üb€ö÷”¹C¦C\Õ+\Ñ\\ŠªIµ©_\Ó%ºX\ìœm±jŒÃˆô\ß\Õ)J‘G(Tb%™™RIND¤˜Fğh¥TT­Š©\Ä5PÂº\Şğê”½šO\\Ä¢\åCr•\Õõ¾\Ñf…n\Â1\Õ\n\ák¯e8DA^\reö.c?˜n\èh‹YF-œ¤\Ä¢R$ &\í»•ªªûQk|µû\Ú[„\ÎqR¶	¸\ìÏ•XK\Ú\'$¬\Ög\ír\r­5\ì6I…½Ä¬ô\ÑBW²J]\Ê\Üe\Ö!”8¥v…-)v4\ÛQ‘ó®]\ÉlšE\äl©¯qq«{¨ø{]\Âvnƒ²”JWŒ\á^=3F\ï@x\\¨¥\0\"\Z”¶H£y;ô_±–IÓ‡\nš¨\çDCDD\æ0ø)@90\0\0<\Z\Ó\áK%zşù\êR¤\ë\Å\ZZ\Øf©\ìg~¢;‰ŠÌ¶\ê\Ê-ñ=M\à9‰*Í‰\Ê$¤Õ¡Š¸zl÷©ö\ìV2€P;:\ÔjN”\íD^†°”œ¥K¿9ß±tšWY\í\á\ÏøH^ö\r\Ò\åc#w\'sŸ³Gä›¥’õEœU\êŒ\ë1–R¤Y”k\r–1’r«”Lb R·gH%¦2™Ê›\Ë@“ª¬›²|uMª–hŸD–Š‹¥\\ªó‡¦\åC¦M\Ä\ã\ë\å\×]9* ¥@t\ÂO\ÃmÊ®\éóÈ†µï¯¯\Ø\Ò7L\à]\Åll9X\Êw½—ÆŒ e€L&1&¨ÏŸ\Ò%@\Ãû\İ|\ç/ßµRó\ç^‰˜\ào»r{C\Ú\à7\'[¤§‘g°ş;”·\ÅS\ÜH)”«¶\î±MYG\É$u†h/½\ëÒ¢_]F‘\Ë$\ÜJ±\È`¬ŸL[Ö‰J\ÚZY\Ì+%eŒÁºŒ\Ët\Ü~·=½d\Ëäˆ¾›šxI“&­\Ä\È\ÄV\ëqE0¥^©\Ç3oß„Z¢A\æ.ª\ë«\Å&\ä\í\çfµ¢¬¨\\5R™[¹Zœ:¹\nˆ™C˜\ÄMW‹˜‡2Lú‚\0£•=3|iC¬¨•4\Ì:&Ö‹/\É®Œo™ºË…³&RŠ“«\à‡“ÆŸˆ››¡klV¥%\æaú>\å¸ œ© VË®qVI\Ë`Ù²¢ETCH\ÒNŸ¼–d&_9\à{[\Íy%n\Ü5ú¯\\U\n\í:0Y\ÃK§\ns¬\è\Z\çw\'*\"BšÆ¿\"\rZ\íÙ‚\ÇAg+«\ê\Ñ\ZY½l¶¶¨dÁ‹xöˆ1dÜY4H¨ \Ù\"ğšIÀ?\Õ\Èò\"<ˆ˜D\Â\"#Î­vó\Éyó±5^&dG·õ|€‡\Ç\â<~ÿ\0ô\Õ\ÊOF7¯•1ŒnDD¢o°÷ùñ©jŸs7{—U\ÑW¦,\æşw!¦\â¸?\'x\Ì\ïLš‰·“Œ]Ê£M\Åh¹;e\ìòL\\{ )Fğ1r\ë6c‰Š£¾Z^F°‹ò\çĞ°\í\ã]\ãzo½¶\"\ÇK±u²MX\r\êZ5d\ØSò[”¯ZfY*\İ1læ¸™£”¬B˜ˆ¡70\İD‚E¨[\èK»×º\æ\ä­]\ä—9Ø»ŒeI;:\Ú:¾\Í1¬V\ãQ…Œ\ÍHƒu\â\ë€#!.TS)J‘^Í¬¢\é„Ú¸A\0\0M¹\n9?$I:\ìÛ™U6eŒ\Ú<\0üÕ“q}E>\Óö„š\ÊH_¬*z%0€\0%UL\Èvœ\ç\ÖşÎ®JüJOL×‘y\ßN\é\Î=*pJGS\Õö¶\Ì\àĞŠr&\Ão/~\0\r\Üx\ã8\×y‘`»ı¬´¸lsx5\ÇÉ•VÒ›f\Íè˜†\à\ïO\Ø] n>\âUÛ¤`ûòP\ãUp—“%jn”\ÌVİŒ;›=‘\Óx\Z\Ä$g\ãÒ¯¿–Õ‹Q\"«,¨ğ›“‰H™@\ÇUC‘\"”9J<®öu\é\Ï¶\í½\\º«nQ:<sIš¶\Ñ0\ãÖ¯2‹qU£‰\ä·ªÆš\Ù\ê!\Ú6™\Ïj\'x±D\Â\Â=˜ƒü¦‚\æ\Íô+Ğ‹nÖ&÷%µ \í%V™ƒP.4c\é¸\ËJÀ\Ã<ºY\â\ã\Ãò\ÕZ1\ëeÁ‹4R]\ä’EDÇ·;‚¨.Tn’ø\ÅËª\Ó-F#,’©\Ï\Ï\ÏO\'	]­–rbB`+\Õ\Â\ÃUaEÚ€‹,¢P*€š%1Î¨•0:\Ê(±¡µ·–wC-ß‘&\ä8yò\Ü<‡Ÿ<ùÿ\0¾¬šo<‘\"Y^\Ş~€\0>x|}¼‡üõªw™I=+[˜—\Èd[3d\Òju˜·tˆ.¦1\\81€\É4?¯ıjqşÁxñ\Ş\Z\ÏB7»&8jMW\Ø\Ù\ÖĞ²’¸[¡¶ığV!3<w»\Û\ÓZM~ÁY7±»\åI-Ú½¬Wq|\Ä#ó\ÇopJ¬º«EQôQ‰&8ü@\Ù28X˜\ÆP“Sz«¬÷òòNõø‘iFQ•V[ó\Ï\ì{;?\Út6¢Qğ.‘…“4W°™³r–Á)8V“¶\"\İ`\"Átš\ã9Q†A&\"a9\ÍG)K\\\Ù,»;…3PPNQ\âgm‡ew›J\ÊG6	€8{ `¬ˆ‚	H\Ê%L\àWi\ÓU¾hªiï¡Î¿´Î².\ß11İ˜§ƒ¸\å»\"\'Pyn3\'L¬’óÁTöQV\å‹\ÏÁ\ä<:\ëöuu±œŞ†\×:\âK&\Z\éO³\Úå½¢¬l–j®X‘f¹5š¡™n6<Ÿ\ÙrrG®Z!@7S¸5\ÚP—û\éŸk[\Ù\Ş\å»PI\Ş¼Wˆc¤;¶C¯Ubˆ\ãÀ\ï&P!yù\ê“iBM\éD¥m#š.\é\î¤\É\Ôi“\Ñ\Ø#[”¥),G¨û¬!Y²u`h\ĞS¿¨@£%‹a\'%w)$\n´©”\ÉaÒ•e¡g\'t\ÖD\è\è\×\Õ+k¸/\Ø0.\\¢-Š™Rd\ìFù’ˆ\Ù\Õ\Õ+xÉ•Y4\ÖÊ´\Ó¯R´¸3r³k%²\ÍDj\ÕX´LX7+½K\ÇL—;üŠ\Ä\ß^ó¯›\â\ÎRùBÎ›ˆ\n|YWñF:>»*$®AT\Û,d\Ç\ÓykX‰<›zP\0p\ìJ‚\\3f\Í2UE,‰\×.\ä+TK\Ú!ñÀŸ¿\Ï!\ã\íÿ\0­X›²+J öãøó\Ç\ä\ÛWŠ\Ò÷Yóû)&ò°\ÒV™–°Ñ©z®*}4SUuD?¥\'\Üc\Ø\Ç\Ï\Z»j	Y\å,\Ş~\Î\í[V*LZ®qm\í\áÙ¬õä“ƒ&™)$+=‘p©‡µ \íõcˆö¦‘|ˆ5\æ\âM\Îmı\Ì5³Ó›£M\Ú&.\×\\\Å[Qªuùb\Ñkp0mœE¡uaJ1­IU\\_\ç\ZI\Û\'PL¨¤x\ÊúdM\ë\Â¢ºR[­yú\"Y\Ê\ë>v®}u/²<a*‹\È\Ù\ÕH§?Q²-†v\Üx»\Ät@H4ZR\Æö\Ï%Z1@ˆšVX®™5X\Å$|C’¡î¾OSm¥]\Õı7õ\ËÖy\ëQ\\ó\Ñü3RÁ\Ë\êr§¶\ä™\ÕI¼§s‘ym»\Ë;vqE\"Œ\ÄÛ€,s^N\0TY Í²dşR¦˜58‹®W<^oÄˆ¦–”b\Z\'n\Ò}Z:\Å\Õ\éQöS˜\Ş÷—§¢,HC92\ÏjW\Û;\Ä!.¶7ªòdY¡6n˜10	Šyl„9\Z\èÀUJ´Ì¤£Y÷:ƒ\ÅÆ±‡aÉ´llc6±ññÌ‘I³6Y ›flZ7D D\"\Ù$“L…\0)H\0\0\0k¨ ‰\Ë8£g<ms\ÄYV²\Ê\ã2\êÍ¶· £¤”ˆ‘HS]2<`\á\'1\Ïn\Å[»j².š8E7\r–Id\Èr\ÃIªj\Ó\0º\Éı/ÛŠ\Ç%™ºt>\Ì8Rƒ\ì\é\í£Ü¨–n¢¢¸û<\Õ.Uó\ÏC6\Å\Û(\å\âG3+\"‡ô“A¤\ê\âuu^”¶¾sÄœl\ËV-\Ç\îhĞ”:ª\Ù\ì \Õ\Ü\è\n‡9¢‰…v¦\äx;”TT\Ê;8ù÷\"(€ö7?4\ßUt¬—×Ÿ\"t\İ\ß9ò®¤™3(™\Ëö-y\ãõ9zÑ°U`<ö\ÕT$Õ¼šÛŒ³“Uyµó\Î\îu4ù)­0…0r¤z<ƒD\Ôô\çR¡*\íù\æ\ä9]m^¿a6ò\ãM)•±€\Ì(µƒ²»şO¶(…T\Ãö\07Ÿ°\ëEL²\Éú\Ë\ê,(—²@5u%\nC{¥CX¬\ÓUx\Ïf‰„À™|ùE\Ò(ö‰”M4W˜œ—¬\â\å•\ÒĞ˜\É->¿\Øó\ÒwIf—\ÉT\Ü@\êF™;\í“1v”ª<T\æU~UÖ¾\î~]š+¿…	\ãÒE«F\ä‘Ie™Ş’Š\Ù\Ë\Ù\Ôc)¥\ï-?­K\Çõ(º£T;ÚeÎ³±Jx\é[\"­i\ÉW[W%+\n!pO\ïgA$ñ³/\Ê90\é\îFGJš	8t\è˜\á\á\Ï\Ôv\Õö\çcI\Ê1\×\\‹—\Ü^\èºjô{’\ÄT]\ÇXm¹‹-dG\è‹x\èv·\Ë›w@\ã(Xq\ÓyDÑ®Ñ‚X7D¥9 e\×R5\"±zdû\á-:Ÿ‰\Í,I;¯u>\Å\Â\íó8\ísu˜Ñ†HÛ¥\ë\å\ìm$@²´³CÈ³`\äJ‹1š‘\Õbm2‰}Xù&­\"\"\0£r\ëZ]Šs·Œ‡\çl–ŒM„10³\\\"\Û\ìXó\Z\Ò\éS–¢ ¨®lrÕ¨F«Í”‹˜\ê¨ \ê\à\â&Ò’\ÑP-H\r\0\0ü€>|€òıù\0ÿ\0MB›òúu6¾ìŒ–Y˜C\"\à±\àÕ‰›şÓ©U+s\Ğpõ\ãK5®“#NzÁı¤®^œ|.ıÈ“\ã.)¦¡(\áÛª²m÷2«¹o£\Û4\Ûb\ç\ÛVm\Û\Æu¢:YØ²uuRcd	&b™ªS0\ÊB\Ï\Å\È(tT\n\ì\å“)”@\æˆ\Å(Y* ˆn>”\î³Hˆ‚Xó:\àGk¸Êše?\ØLs—\0û€`Ò¾@òúUzÏ˜DG\áõ„GCrğ\ÜüqÇªpñÿ\0+\Ô)}*\İf\Ë\È\á\î@y)‡q\Ø\Ø@\0D;T\ã\çöù\ÔşA/v©ô õT‹\Ê8\ß\"\Ü\î[_Á‘\ï5ko»•¿L\å;¯\Í4“;†5Š¥XÙ‡¥M°Š-\ÜÊ ‚ŠUS/&\n\Ê.Qq\Õ>\ä§M=h\İDŒßºZmf6BE4\ä\rX‚Ad\\\äŒ÷š,L\Ş\ÌJHJJ9\äd\í’c+%+$\àE¼\\TJ\êSaƒ`£pÀ‡d¾¯ö\Í!cN®·o²üø-Y½\çmz?Y^ó›²ô\Z1¹Ÿ 9üRóA]8‚S!  Q‡¨WùE±\×cb\Z0lƒY6\åxôTq\"£¦k.¡‹\ÃşN7òu_ºÿ\0\×oİ?Ã…J=÷\ßÔ¬¨m}ûl\êo…¶ó´¯8†g¹<¥],s˜u\Ô3xœ\n[[c[§3\ÕVXª±¯·«²|¸°šNM«¡|Ä±¦Q\ë\æH›·b¦Ò¦²g.&\Ãi]§§‘Ô´œñ\çÇ“qöı=\Ã\Û\à~·\Z\Ø\Ìú\Ğ€4 \r\0h@\Z\0\Ğ»}[À}Bğ\Ûl5š[\Ú4€´°¿\ã\Ë\æ9·IÑ²F-È±1òq1Wº5’8LF\ÓhFMK!\è½lö=tŸœY«ÁCVš\î\n¬t\åê•·œ¥\Ñ6%\İ\Æ¹/*l{¼\éwq\ÆE\Ãò\ärW{¤\Ä\Çp¢9Et£ô\ìd Tri7ÑP‘+d\Ü¸ñ}–-§†º]\é·üªõ7†<£jN\Õzš2\Û\ÓqN\ÖiõºTR2öÕ’|\îó•ç˜±s‘²Mu\ÛyKMš\ÙcôEË…_Ë¶n°3*\ŞÉšLš5j‰hˆ§ÃŠŒtF2“”œ¬“º¹ \r\0h@\Z\0\Ğ€4 \r\0pÀˆ!ğ?·\Û\Ç\í\ã@\Z\0\Ğ€ÿ\Ù',234567,1,'D:\\2\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\mauseinalam.jpg'),(17,'Laptop','Funciona',87654,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0A\0\r\0\0\0\0\0!\"1AQ	a2Bqbr‘$‚ğ%3CRcsƒ’“¡±Á\Ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\00\0\0\0\0\0\0\0!1AQ\"aq‘¡ğ#2R\áB±Áÿ\Ú\0\0\0?\0\ê\0P\0PJ\0 +@@@@@@A¯‹~÷^6›b4ô\r9w›e½\ß/m„É%l:a\nq\Ì)+‹ \àú\ĞgN\Òİ§\Z\ÒQn)\Õv½T„¡.V­ˆ¥-iRB’)¼/%$k@\Ô=ee¦\İ{¢\Ü\Éağğò¶\îzÔ´Úµ©õ\Å\ï\àö‰:ô\Ì&\İm¬¿\é8§	U\îÊ´\Ü\íù\Î2H\â´¡\ÖÁa¯éš”½»Zñrÿ\0%ø{ş2bU´¯EuN/{¾\ÙöÁÙ½\ÜZ\Ó;ƒf•1x	ƒ)ï”’O°i\î*?`k\ß1ˆ(#@V€(€(€(€(4|i7ööûi= Ë¥l\Ø,\ß0\â3\Ñ/\Ép“‘ş\í¦Ş€RöX\Ü\ë%\ÃI[m\Èi33jq\ÒrI=\0Ç¹ÀOZùƒ\Ö:=\Í;©\×\Ï\Ã&ğ\ßO¯MGº/v±¼]cih\êb2’\İÁ+h)i\æ\ÓO©S\ë\Ëğ{g­Yô]\Z¹’r\Ş~|ü¹+¿sŒ6\ïÿ\0d&\Ü\Ô\ÚM\rI6sRĞ·°úJzŸ§CôŞ´\ßPZ\ß\\~’’i¥¶{£T­k:P\ël\Ù\ím-\ß\ÙB†ôÆµ¹Å„’?\Éòù¨§şÜ’Ÿ\îñ­³2¶«\ãS~†¯´L\Â\0	T\Û#\ê†÷\êZp­şŠM@&\×üK¶rƒ-/U«JNp„ˆº‘ƒdÿ\0¶Mù\è	/e¿[u\çZnnpœD˜o¥\æ\×ú)$ƒü\èú\0 \n\0 (|\ç;¶\î\âYİª·3P!\Òücxveúc\á„ô!¬ı\èN6È£\ìÍ®¥i‹`‡û/½D™¨‰Àñ!)\n\nH\'\ËyıEs¯S\éĞ¼—¸\êc¦-tıZÁ¼\èzF£uEU£E\Ê2{?8\Ù\ã\èK=U®\ç\Ç\Ğ.Ê¸°©””J†’\n€¡$ô\È¸Í™JWı%†²Ÿƒj\Õôk­6\ÒUk4ñ\Ê[\à‹¹¹\Òun“¦ˆ\ìE\Ìp-.\àğQ\Îq¤\ç¡ô5\Út?NÔµ¯Ø¬¬mşK©\\T·—·SºOœ>Ş«R\â¾\ër2…6\çvBzø\ë]\'K[Òz^öv|;R	ö¬ú´¤\×R\à\ÆœYH®­â²\á>ufŒc/\îD>›|¶ö}\ËVk}ló\Ò\Z¶[¢·la„8¤2\ë\îkQ@<TR„\'©;\ÊÅ­Ò§ˆ,¾gXj\È\n\0 \n½\Zñ­°\ÚMe«XBl¶‰S\ÒU\ê¶\ÚR>\ê	z\Ì\ê\å=)\ç^|©\Ç\İY[‹Rº©D\ä“÷&©Ø¿\r¶%Ü¢Ø¹¶°W\ÆC‘ÀPo\Ó \ã\Ó\Ôı\ë—j.jö¤\ßf}\×\èúªzvÒ”q‡Mq\Î^s÷{\å›QªF’¸0›Še\ÂTF¢>|E%=xÿ\0,`ı+X·\Òk_j4\é[\ÒøÜº²¶_s[õ}œ§c(\Û\Ç~~¸\Z+¾™\äÆ¹ñ9”!†`8!\0d|g©ÿ\0\Å}¥\é\Í&\Ş\Ê0•Y/rx\Ê\å/¡ñ½Bµ=F£¥ıH¬.9X\å.W\ĞjwNÁ\Ón$ÁZK‰/ŠÂ¸(\ç¡ö>¸ú\Ö/ª´»[J®­Ÿ\İüŸş&uÒ¨¸µÓ¶\ëŒò»dmÜ˜§\İQV=°¢Q¸øzY\ç×›«Q\ÌøN\çpz“\íT7\Ñ.˜\ì‹q\Ç,\ï\çÃ“iª~\Ê:E™.w\Ä*ù0)8W\'ğ[ôh6?`6\Ûm\Ş^I5P@PB@M\n¾\'›·o=—µ^—°Ü›u¸¿,¦\âe\Â\Ì~ı+t•Ÿ$Œ\ç\Äh=o~3JË­ƒœ¤\ê£q{\î/6ÿ\0V\Êe\æ\á®km\ÇI\0w\Ùğ§=@úõ¯şÎH¹ôå—\Ñ~¥»·«9\×Q¦±ıİ–wK\ç¿q\à¶>\ëI~+\å°\Ò0• ‚‘\ëö¬¯GÓ„/s]r±¿œ\ì\Ù\êRòÖ¬­%…\Zî±–ş\ëeù4÷×™=†Z\ê¯\n	_‡\Èÿ\0Îµ\Ú\èW•\n\î¤\ÒP‹Ï\×c\ä9UJ\åÖ­.©Ic\Òòûp4úŸQ·9R\à§@ZòF˜ò­sW\Ö:\êÿ\0MbO—Ø·8Â¤*(=¹BY˜\åÕ¶œŒ(\äŸjÕ”±³\îbÂ‹œ’O‘\Ç\Øm¤‘»\ÛÍ£4{yWí‹«1\â3Á\\WÙ´¬\Ö5IõÍ£\"µ›¡KÜ›\å\á‘mğ˜¶\Âb$V’\ÄfKM6€„$a }\0¨<\Ó\"€³.dxœ‘%ö\ã\Çhr[®¬%	ä‚€a·#¶N\Ò\"Tk\"\\\Ôó\ØH.*1\áIKpş_\áÖ˜\È\"\Ş\èö’Öºõ+2ğ-ñJ”‹}­]\Ô~]\\\Î_I8\å*\' Z’23z\nºYf\Û\Ş}\Ã\Ì4\ë.„¨øR•øV\n¸(\'\0K5=(’*k=½—h}ÀXù¸\É¥\Æÿ\0\Z0	ú¤!”“\äjŒ07r¬¥S‘\ÔIóğôPûz\Õ-&\\…ISy‹–\rz\"\Ìa2ò\èK\\^}@óÿ\0µ]·«ú;yBœs,¶¾\ç\\\Òı]Nµ\İ%tı¸(ô\É\ç\Â\íõ\ç¡‹®#³JùE(	\0º…ƒ\ç\åšõ´½N­\İJ¬°óŒ?s\Íõ–—kg_İ´Y\ë]I\ç·|vùı\Ä®\0(c¦=\ê\åZ\ßD—¹\Ì\é\ìú™\Ê\ÒT\Û}\Ş2 œ¤û×›)¬\ã¤ö(¤Ú†;¥ù:)ğ†\ÚA}\Ş\ÍI­Ÿkœ--mâ¹‚T¯<}R\Òÿ\0R°\"–\ì\É\×\Z…x\ÛÇˆ/\İÿ\0¬uª\ÍphûB\îŞ£Ú‹S¬ºoöœw\\\Ş^X†s\Í	ñú„ú@B=gºú›p\ä—u\áù\È(7ü-ızŸ­\0ºrkJ$6y2\ë]A÷Iÿ\0œC\Ş\İ\â\âÛŒƒ‚©(c’VR<\Îpµd’\\$\àã ªÔ¼”–\æ4¸iiD¨6Q\Æ^\Ï$œ¯\ÂO.i\Æ:UvZ’\n“!A¶Ò·\ÙQ\Âo€08g)m\ÉX8$yP\Òı¥!\\P_	-­AjD”¨°œ‰è“•?\ÅP\Ò%;î•-nµóQÀ*²RSœ)\'ªAúŸz£\r&Ş‹!ği\âó)\êNxı@ôûTC\àŸZ\äÌ\İx\Óö\\›‡º_OcV\ÌT.B\é\àd’}+×¶©JµT®~Å¥„£\äPD±µ\Ş2ù\Ú¬øˆ<°U^§m\ZT•ZK	~ş´\èöĞ«V3¨öO?…—ø;oğ\Æ\ÚÃ·]–,—,÷WMVû—\é“…9„°“ô\r!ûÆµd°°kW5\İ\ÍiÖ—ü›d±©1‹o°Ü–\\i\Ö\Ò\ëN$¡hX\ÊTB>`ûPS};\Z·pnU\çoøÂ”|nYJ‚[Yõ,(ôAı\Ã\áö) !m\Ş\ß6Áq“\ã\èSXYm\æ$ ¡\Ä(z( ş´¹r~´	&\ŞT5£‚ó\Ş0\êy2\ç¿$ûıF¾jSÁ4N¼\Å\é-ÀBV$€–‘Ã’¬’¥\ê\ÑïœŸ­iä§7pµ©\Ç\ß!µ¼µ©	m=Nx¡]BT|\Ê}GŞªpk\Ñm\\4³1ô%\è\İ\éR’‡:>\àÇ…$G„d}\Í@M‰E¡bJ ¥¤­M¨§%`…®~E«\n\Æ\Z\ëÓ¨OIR~Fúû¤¦ÁJŒ˜ı\ãx\Úü¹\'ÿ\0\Õ=E`\Õ$¿µ;gy\Ü\ÍÁÓºJ\Öt^n1\í\ËZHi.¸¥@yı*\ç¹>Œ\í\à¿N½JI¨KM~y=!\Øl±4\å’\ßi€\Ğb\íÅ\ĞòChHJG\ØV\Ë}\0P\0\Ù\ï\'gı/¼\Öâ››\'vmcİ£$›óÀW¢ÑŸÊ¯±­\ÏM\á\Ø}M²\×^\ê÷¿muX‹tŒ	÷|Ğ¯\ÜW_l´Uq“\à y\nz\â\éZT’}\rWHa´Çœ“=„$!•©D.0ò*HIGızµR~H6òW\Z\ä$Í‰!sĞ¦\Õ\ßLJ¸¼”œ$	\à\0ü)\0¾~u_$#S~}>—\á\Ü\Ç!ax¤Aa£Õœ\àuõ§€şF\çd;3\î7j;\Ò#iû{–&‡Bf]¥«ƒhGº•Œº¯d«¯ \ëV›\É+c­½›;+\è\Î\Í\Z`[ôüa*\ìóiL\ë\Ë\í€ü•aù’|#\îTz\Ô<”@@\î\ÅnÔ–©6Ë¬&.ù(\îŞ%°´->\Ä\Zv\ì)r°¢]ÿ\0nPõ\Ö\Ú2·lJ%rX½\É?\çSû§\Ä=9PVğÓ®¶\êÛˆQBĞ´¤pAÈƒ\èhÌ¥\àš\é6\ëÕºE¹Ö \Îa\é¼Wüºÿ\0´‚p\0Œ9“\åŒÔ­8û4ü8.š\Æ\\]_¼k~4c‡Ó¥dHp£¿?\è“ûƒ\Å\ïÆ™ÁÑ=§mšR\Ï\Õg\ÙnŠ€\Û1b¶m\0{ş\r@64@@@@GnÒ½‹ô¦üG‘t‡\ÃM\ë$¦\è\ÃynIIøÇ§1\â\äPIö0\İHÛ¼t¼ı\ä•29‹«\ËÅ­	Ï…\îø¤¥c÷0WŸÉ‘@t{g;5Y¶\áqn÷y\Ò]T\ÒDù\Ã0¹c’b´I\îò\0d—U`€O*\0 \n\0 \n\0 \n\0 \n\0 \n˜ +@@@ÿ\Ù',876543,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\portatillnovo.jpg'),(18,'Celular','Funciona',34567,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0ªiq\Ş\0\0\0sBIT|dˆ\0\0\0	pHYs\0\0»\0\0»:\ì\ã\â\0\0\0tEXtSoftware\0www.inkscape.org›\î<\Z\0\0\ÄIDATx\Ú\í›\ÛSW\Çu¦\Ó\éøĞ‡ö¥uú\Ğ\étú/\Ôi\ß\Z¼Lµ¨P„4‰‘*T\å&Š¶\"8¨\\ªTå¢”©Z²‰\\ \É!	/B\Æ \á¢ a·û[D&‹ƒt`\É\Ìw8ûûş\Ø=ç““³{v÷¬!b\Íb$LLÿR”!#\å!E,‘\àX28öbë¿¨NJ\Ê\Ù@V\äñ6|®C–\r€Hœ½ŒŸY‡\å \ÉÈŸ¯rûc$\Æ\à\à(D(:>\Û\ÂøC;‚÷)·m‹\Ğúx³ \0d–@BfÁ|•Ûº5\\\Ï\á„\Ñ1lGF‹u°=Ÿ ga½ ³€µ\0x‚£={\"øª8qú+\Ø&ÿN\ì	\ç+w\îF|	<\ÈY1\0–F\0,\0p$wHx¬È¶”‚c²€\àô\Í\æıµb)\Ç\0\0\0`\0Ô”§±‰Qº:¥š$¹¡|~µõ&N»?Â‹G\é‚x*·õm\è4j\ÖwQº6šÌŠ·\0n°€¤\Ş4@tó_R\è/ Sò\Ç\í\"†Œùxó¾Y\Óm ¾0(ûªN\å*R*J\Ô\ëmúqˆ…\Éı¬\í\Ér=\Æ ©\åw\n@\Ù\Ù\Z\0ğ \ç«3²\Î\Şòj*–?0\ã5ıvL	\0B\ä6lU\0‘U\è\Î\å¹W€¬ºQœ\Ë÷\Ìx\Ò5\ëÀ@\Ç@©/¤\0\\:W«g\0\ä|­7ScÀ&DnmMMU•œQ|jVS=\0HVŸw¤ª½F\×K{œ%­A\ë_x£cx„Ÿ`ôrI&ˆ9»\Zl\Îuv£e­Ã€\Ñõq‡I¸\0`9€¢ö]©5\ÙC×•\Îg\\ƒ\Ö~d¥y0h[„•\Ã	õ\Ğ1ğ \çx•\Ò\á-\rsâ¥¡º•\Ç\èX\r@Po\è-µJ‰›Ö¤§O\ìB\Ä\ã8¤¹×•€B,Gs™\Z\Ã2+o‹9ªk9Q\ZBøÒ‘jm/{\È\r4\Ö\ã4ÏŒş¸ƒ7z\Õzd8Gs\é5€«\Ó\0¤e\'K\ÖJ	\Ê€«€¦kÙŒ\0’«µ\ë~6\ë2\Ø&6\Òmz\Ê\Ék$\è‚ØŠ\Ğ\ç\"oz@7¿·\Ì*õ\Î\í?D\Õs\âU^	=€_\ß\æ\0dƒ§šlb]—]„TZ¥ƒ\Ëj.§\0\ìÉ­ne\ZÀƒœ\Æ\ÊÓŒ\0$5†VŸ`°+j\Ë\Ğ\Ñu=¥\â‘pÀ®²ÿ•„l\İ«¥b\àA¸\Ú\èzT!R¹\ËcµtÁ\à\È\ê\ép\à:`Z\ŞÈ›].º¢«\í£ô\Ê¬\ëz)‘™\\tAlV\ë{F%\r=.º¸·^Vˆ®±O\å+œsGxR\ãšQÈ‘’3Fr`ôÌ,A<\È9§\éE\Éıs>^œp\Æ\Ş\îd-€}7¬˜\ÆS\n.\ÖMO‡•\ät˜a\Æux8ŒŸ\ä»1\Öh\ïR\â81@\Ê561i	/n\ê_0€\çCıÄ¡xÁ¸¸3t2O\é7\0¦¦ğ~ú·–ZcF\0mGg\İ/\à\núı@Dqsÿ™;V\í™;]:\Éu“\å½6»…P\Ş\×*µ–p»\Ù ²\Êöœlì¤¯1`wI«\nr\n\îı\Ó\Æ\0<È‘\ÙUCÀdœ\Ü9\È\ê\Ó`Xª\Û^ØŒĞµó¢!\Ïc\à\Ç\Ô:pYó•Ù”‹\Ğ1ğ ‡W÷`L\áBÚ\Î\Ò\ã€.pC$\0ÀD^C\İôm\è\ê zL$\ïqû\0~ş_MQU6\Ï|\nM¯P“3>|ÿD#lskƒ^\Ç@P†˜ö\Ép#¹_¼u©ßµ?8&k\0\ìM»\Ü\ÌtøF‰%&NP¨›s KE\İ\0\Ék\ÄG\'&\ÛAP†X¥Ö©\Â	\Â}¬¶\İô®ıÁ1ıÀÿ¬\0\0¶øD­U¬³´¢t}Ø¦\×|Wˆô¿9_ñb\ïõ\Îû\ä\ï¥b\àA\Î/Ù²¾^^¢f\è€¥K+JW¼p‰}\0¾?\ß8\0\Ï\ï|i\ã]\r9?\é¨w\0×™Ÿ\Ã; (C<È©O\ÌG˜†g\ËûY\Û6]@0&\0Ÿ5N¾¨§®\æ\Æl\"ó\Ì%0”!\äÜ‘\ä0Ø—U‡ù=\0_O‘!¶j\0À·=\á\Úg\Z\å\Ñ` cğù¿¯\ë¨w\0R\äºGS6‚2€ô \çoI.#\0 Y}\Ø`Ô«\×\Ú\r]X[-\ß^Dœ\Ógd˜õ\ä\ì£b\àA7\ë–s,Vhñrù]=©:p\0\0À>\0\ÂÄ“C±\ÉgmK)8f`Á„?8b\Ö ¼\ê\0l\Ù\Ö6óXÊ«\nÀ!aZ\ß\Üw \æ\0Ş±pr>mş¹{¦ñP~\ï°¬\'±tö \à\×°Re¿\\:»\êO¯„\åóÿæ±…\éİ¶{\ï\0\0\0\0IEND®B`‚',23456,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\telefono-inteligente.png');
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
