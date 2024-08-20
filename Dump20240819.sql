CREATE DATABASE  IF NOT EXISTS `bikes` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bikes`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bikes
-- ------------------------------------------------------
-- Server version	8.0.39

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
  `idCargo` int NOT NULL,
  `nomeCargo` varchar(45) NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Gerente'),(2,'Vendedor'),(3,'Faxineiro');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `idCidade` int NOT NULL,
  `nomeCidade` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idCidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Campo Mourão'),(2,'Maringá'),(3,'Londrina'),(4,'São Paulo'),(5,'Guarulhos'),(6,'Curitiba'),(7,'Florianópolis'),(8,'Porto União');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `rendaCliente` double NOT NULL,
  `dataDeCadastroCliente` date NOT NULL,
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Cliente_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `idEndereco` int NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `CidadeIdCidade` int NOT NULL,
  `Estado_siglaEstado` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `fk_Endereco_Cidade1_idx` (`CidadeIdCidade`),
  KEY `fk_Endereco_Estado1_idx` (`Estado_siglaEstado`),
  CONSTRAINT `fk_Endereco_Cidade1` FOREIGN KEY (`CidadeIdCidade`) REFERENCES `cidade` (`idCidade`),
  CONSTRAINT `fk_Endereco_Estado1` FOREIGN KEY (`Estado_siglaEstado`) REFERENCES `estado` (`siglaEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1000,NULL,'1920',NULL,'0000',1,'PR'),(1001,NULL,'220',NULL,'111',2,'PR'),(1002,NULL,'345',NULL,'33333',3,'PR'),(1003,NULL,'123',NULL,'44444',7,'SC'),(1004,NULL,'980',NULL,'45454',5,'SP'),(1005,NULL,'800',NULL,'95889',4,'SP'),(1006,NULL,'3410',NULL,'65656',6,'PR');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `siglaEstado` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nomeEstado` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`siglaEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('PR','Paraná'),('SC','Santa Catarina'),('SP','São Paulo');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `nomeFornecedor` int DEFAULT NULL,
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Fornecedor_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (110,'2020'),(120,'2030'),(140,'2040'),(150,'2050');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_has_produto`
--

DROP TABLE IF EXISTS `fornecedor_has_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor_has_produto` (
  `Fornecedor_Pessoa_idPessoa` varchar(20) NOT NULL,
  `Produto_idProduto` int NOT NULL,
  PRIMARY KEY (`Fornecedor_Pessoa_idPessoa`,`Produto_idProduto`),
  KEY `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Fornecedor_has_Produto_Fornecedor1_idx` (`Fornecedor_Pessoa_idPessoa`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor1` FOREIGN KEY (`Fornecedor_Pessoa_idPessoa`) REFERENCES `fornecedor` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_has_produto`
--

LOCK TABLES `fornecedor_has_produto` WRITE;
/*!40000 ALTER TABLE `fornecedor_has_produto` DISABLE KEYS */;
INSERT INTO `fornecedor_has_produto` VALUES ('2050',111),('2050',222),('2050',333),('2030',444),('2030',555),('2040',666),('2020',777);
/*!40000 ALTER TABLE `fornecedor_has_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `salario` double DEFAULT NULL,
  `CargosIdCargo` int NOT NULL,
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`),
  KEY `fk_Funcionario_Cargos1_idx` (`CargosIdCargo`),
  KEY `fk_Funcionario_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Funcionario_Cargos1` FOREIGN KEY (`CargosIdCargo`) REFERENCES `cargo` (`idCargo`),
  CONSTRAINT `fk_Funcionario_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (5000,1,'111'),(1200,3,'444'),(2000,2,'555');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `idMarca` int NOT NULL,
  `nomeMarca` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (11,'Cly Components'),(12,'Elite'),(13,'Fox'),(14,'Raveman'),(15,'Caloi'),(16,'Scott'),(17,'Colli');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `Pedido_idPedido` int NOT NULL,
  `Cliente_Pessoa_idPessoa` varchar(20) NOT NULL,
  `valor` double DEFAULT NULL,
  `parcelas` int DEFAULT NULL,
  `TipoPagamento_idTipoPagamento` int NOT NULL,
  PRIMARY KEY (`Cliente_Pessoa_idPessoa`,`Pedido_idPedido`),
  KEY `fk_Pagamento_Pedido1_idx` (`Pedido_idPedido`),
  KEY `fk_Pagamento_Cliente1_idx` (`Cliente_Pessoa_idPessoa`),
  KEY `fk_Pagamento_TipoPagamento1_idx` (`TipoPagamento_idTipoPagamento`),
  CONSTRAINT `fk_Pagamento_Cliente1` FOREIGN KEY (`Cliente_Pessoa_idPessoa`) REFERENCES `cliente` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Pagamento_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_Pagamento_TipoPagamento1` FOREIGN KEY (`TipoPagamento_idTipoPagamento`) REFERENCES `tipopagamento` (`idTipoPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL,
  `dataDoPedido` date NOT NULL,
  `Funcionario_Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Funcionario1_idx` (`Funcionario_Pessoa_idPessoa`),
  CONSTRAINT `fk_Pedido_Funcionario1` FOREIGN KEY (`Funcionario_Pessoa_idPessoa`) REFERENCES `funcionario` (`Pessoa_idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1234,'2024-03-05','111'),(2345,'2024-06-12','111'),(3456,'2024-01-02','444'),(4567,'2024-04-14','555'),(5678,'2024-04-14','444'),(6789,'2024-07-30','555'),(7891,'2024-05-07','111'),(8910,'2024-05-07','444'),(9101,'2024-05-07','555');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidohasproduto`
--

DROP TABLE IF EXISTS `pedidohasproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidohasproduto` (
  `quantidade` int NOT NULL,
  `precoUnitarioProduto` double NOT NULL,
  `ProdutoIdProduto` int NOT NULL,
  `PedidoIdPedido` int NOT NULL,
  PRIMARY KEY (`ProdutoIdProduto`,`PedidoIdPedido`),
  KEY `fk_pedido_has_produto_produto1_idx` (`ProdutoIdProduto`),
  KEY `fk_PedidoHasProduto_Pedido1_idx` (`PedidoIdPedido`),
  CONSTRAINT `fk_pedido_has_produto_produto1` FOREIGN KEY (`ProdutoIdProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_PedidoHasProduto_Pedido1` FOREIGN KEY (`PedidoIdPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidohasproduto`
--

LOCK TABLES `pedidohasproduto` WRITE;
/*!40000 ALTER TABLE `pedidohasproduto` DISABLE KEYS */;
INSERT INTO `pedidohasproduto` VALUES (1,200,111,4567),(1,530,222,2345),(1,859,333,3456),(1,859,333,5678),(1,1199.99,444,6789),(1,2137,555,7891),(1,2137,555,9101),(2,102,666,1234),(1,102,666,8910),(1,59,777,4567);
/*!40000 ALTER TABLE `pedidohasproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `idPessoa` varchar(20) NOT NULL,
  `nomePessoa` varchar(60) NOT NULL,
  `dataNascimentoPessoa` date NOT NULL,
  `TipoPessoa_idTipoPessoa` int NOT NULL,
  `senhaPessoa` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idPessoa`),
  KEY `fk_Pessoa_TipoPessoa1_idx` (`TipoPessoa_idTipoPessoa`),
  CONSTRAINT `fk_Pessoa_TipoPessoa1` FOREIGN KEY (`TipoPessoa_idTipoPessoa`) REFERENCES `tipopessoa` (`idTipoPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES ('111','Maria Consoladora da Almas','1990-01-24',1,'123456'),('2020','Cia das peças','1990-01-01',2,'123456'),('2030','Fábrica de bicicletas Xing Ling','2000-01-01',2,'123456'),('2040','Gambiarra e Cia','2015-01-01',2,'123456'),('2050','Monark','1990-01-01',2,'123456'),('222','José da Almas','1984-01-13',1,'123456'),('444','Carlos Carlitos','1990-01-24',1,'123456'),('555','Timocréia Triches','1900-05-04',1,'123456'),('999','Joel Simplório','2000-06-23',1,'123456');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_has_endereco`
--

DROP TABLE IF EXISTS `pessoa_has_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_has_endereco` (
  `Endereco_idEndereco` int NOT NULL,
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`Endereco_idEndereco`,`Pessoa_idPessoa`),
  KEY `fk_Pessoa_has_Endereco_Endereco1_idx` (`Endereco_idEndereco`),
  KEY `fk_Pessoa_has_Endereco_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Pessoa_has_Endereco_Endereco1` FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `endereco` (`idEndereco`),
  CONSTRAINT `fk_Pessoa_has_Endereco_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_has_endereco`
--

LOCK TABLES `pessoa_has_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_has_endereco` DISABLE KEYS */;
INSERT INTO `pessoa_has_endereco` VALUES (1000,'111'),(1001,'444'),(1002,'555'),(1003,'2020'),(1004,'2040'),(1005,'2030'),(1006,'2050');
/*!40000 ALTER TABLE `pessoa_has_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_has_tipocontato`
--

DROP TABLE IF EXISTS `pessoa_has_tipocontato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_has_tipocontato` (
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  `TipoContato_idTipoContato` int NOT NULL,
  `contato` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`,`TipoContato_idTipoContato`),
  KEY `fk_Pessoa_has_TipoContato_TipoContato1_idx` (`TipoContato_idTipoContato`),
  KEY `fk_Pessoa_has_TipoContato_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Pessoa_has_TipoContato_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`),
  CONSTRAINT `fk_Pessoa_has_TipoContato_TipoContato1` FOREIGN KEY (`TipoContato_idTipoContato`) REFERENCES `tipocontato` (`idTipoContato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_has_tipocontato`
--

LOCK TABLES `pessoa_has_tipocontato` WRITE;
/*!40000 ALTER TABLE `pessoa_has_tipocontato` DISABLE KEYS */;
INSERT INTO `pessoa_has_tipocontato` VALUES ('111',2,'99988-3400'),('2020',3,'ciaepecas@hotmail.com'),('2030',3,'xingling@hotmail.com'),('2040',3,'gambandcia@hotmail.com'),('2050',3,'monark@hotmail.com'),('444',2,'99745-6089'),('555',2,'98823-5445');
/*!40000 ALTER TABLE `pessoa_has_tipocontato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precoproduto`
--

DROP TABLE IF EXISTS `precoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precoproduto` (
  `Produto_idProduto` int NOT NULL,
  `dataPrecoProduto` timestamp NOT NULL,
  `precoProduto` double DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`,`dataPrecoProduto`),
  KEY `fk_PrecoProduto_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_PrecoProduto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precoproduto`
--

LOCK TABLES `precoproduto` WRITE;
/*!40000 ALTER TABLE `precoproduto` DISABLE KEYS */;
INSERT INTO `precoproduto` VALUES (111,'2023-03-02 03:00:00',200),(222,'2024-05-17 03:00:00',530),(333,'2024-06-05 03:00:00',859),(444,'2024-04-23 03:00:00',1590),(444,'2024-07-25 03:00:00',1199.99),(555,'2024-02-13 03:00:00',2137),(666,'2024-02-28 03:00:00',102),(777,'2024-02-29 03:00:00',59);
/*!40000 ALTER TABLE `precoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL,
  `nomeProduto` varchar(45) NOT NULL,
  `quantidadeEmEstoque` int NOT NULL,
  `UnidadeDeMedidaSiglaUnidadeDeMedida` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Marca_idMarca` int NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_Produto_UnidadeDeMedida1_idx` (`UnidadeDeMedidaSiglaUnidadeDeMedida`),
  KEY `fk_Produto_Marca1_idx` (`Marca_idMarca`),
  CONSTRAINT `fk_Produto_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `marca` (`idMarca`),
  CONSTRAINT `fk_Produto_UnidadeDeMedida1` FOREIGN KEY (`UnidadeDeMedidaSiglaUnidadeDeMedida`) REFERENCES `unidadedemedida` (`siglaUnidadeDeMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (111,'bike aro 12',2,'aP',17,'kids'),(222,'bike aro 16',3,'aM',17,'3000'),(333,'bike aro 20',2,'aG',16,'666'),(444,'bike aro 26',8,'aX',15,'2.0'),(555,'bike aro 24',7,'aE',15,'2.0'),(666,'capacete adulto',10,'M',11,'security'),(777,'capacete kids',8,'P',12,'pro');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontato`
--

DROP TABLE IF EXISTS `tipocontato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocontato` (
  `idTipoContato` int NOT NULL,
  `nomeTipoContato` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idTipoContato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontato`
--

LOCK TABLES `tipocontato` WRITE;
/*!40000 ALTER TABLE `tipocontato` DISABLE KEYS */;
INSERT INTO `tipocontato` VALUES (1,'telefone'),(2,'whatsapp'),(3,'e-mail');
/*!40000 ALTER TABLE `tipocontato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopagamento`
--

DROP TABLE IF EXISTS `tipopagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipopagamento` (
  `idTipoPagamento` int NOT NULL,
  `nomeTipoPagamento` varchar(45) DEFAULT NULL COMMENT 'Dinheiro, cartão, pix, etc.',
  PRIMARY KEY (`idTipoPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopagamento`
--

LOCK TABLES `tipopagamento` WRITE;
/*!40000 ALTER TABLE `tipopagamento` DISABLE KEYS */;
INSERT INTO `tipopagamento` VALUES (1,'Cartão de Crédito'),(2,'Dinheiro'),(3,'Pix'),(4,'Transferência Bancária');
/*!40000 ALTER TABLE `tipopagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopessoa`
--

DROP TABLE IF EXISTS `tipopessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipopessoa` (
  `idTipoPessoa` int NOT NULL,
  `nomeTipoPessoa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COMMENT='Considerados os casos de pessoa física ou pessoa jurídica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopessoa`
--

LOCK TABLES `tipopessoa` WRITE;
/*!40000 ALTER TABLE `tipopessoa` DISABLE KEYS */;
INSERT INTO `tipopessoa` VALUES (1,'Fisica'),(2,'Juridica');
/*!40000 ALTER TABLE `tipopessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadedemedida`
--

DROP TABLE IF EXISTS `unidadedemedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidadedemedida` (
  `siglaUnidadeDeMedida` varchar(2) NOT NULL,
  `nomeUnidadeDeMedida` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`siglaUnidadeDeMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadedemedida`
--

LOCK TABLES `unidadedemedida` WRITE;
/*!40000 ALTER TABLE `unidadedemedida` DISABLE KEYS */;
INSERT INTO `unidadedemedida` VALUES ('aE','aro24'),('aG','aro20'),('aM','aro16'),('aP','aro12'),('aX','aro26'),('G','tamanho'),('M','tamanho'),('P','tamanho'),('un','unico');
/*!40000 ALTER TABLE `unidadedemedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bikes'
--

--
-- Dumping routines for database 'bikes'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 21:22:37
