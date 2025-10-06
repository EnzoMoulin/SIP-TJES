-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: egap
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_repeat_pessoas`
--

DROP TABLE IF EXISTS `_repeat_pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_repeat_pessoas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `pessoas` int DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `fb_parent_fk_parent_id_INDEX` (`parent_id`),
  KEY `fb_repeat_el_pessoas_INDEX` (`pessoas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_repeat_veiculos`
--

DROP TABLE IF EXISTS `_repeat_veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_repeat_veiculos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `veiculos` int DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `fb_parent_fk_parent_id_INDEX` (`parent_id`),
  KEY `fb_repeat_el_veiculos_INDEX` (`veiculos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_equipe`
--

DROP TABLE IF EXISTS `age_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_equipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `funcao` text,
  `id_pessoa` int DEFAULT NULL,
  `contato` text,
  `disponivel` int DEFAULT NULL,
  `ativo` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fb_order_id_pessoa_INDEX` (`id_pessoa`),
  KEY `fb_order_contato_INDEX` (`contato`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_id_user_INDEX` (`id_user`),
  KEY `fb_order_disponivel_INDEX` (`disponivel`),
  KEY `fb_order_funcao_INDEX` (`funcao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_frota`
--

DROP TABLE IF EXISTS `age_frota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_frota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `descricao` text,
  `marca` int DEFAULT NULL,
  `modelo` int DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `proprietario` text,
  `disponivel` int DEFAULT NULL,
  `ativo` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_marca_INDEX` (`marca`),
  KEY `fb_order_modelo_INDEX` (`modelo`),
  KEY `fb_order_placa_INDEX` (`placa`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_id_user_INDEX` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_materiais`
--

DROP TABLE IF EXISTS `age_materiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_materiais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `id_termo` int DEFAULT NULL,
  `id_solicitacao` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_solicitacao_INDEX` (`id_solicitacao`),
  KEY `fb_order_id_pedido_INDEX` (`id_pedido`),
  KEY `fb_order_id_termo_INDEX` (`id_termo`)
) ENGINE=InnoDB AUTO_INCREMENT=7817 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_recursos`
--

DROP TABLE IF EXISTS `age_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_recursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `condutor` int DEFAULT NULL,
  `veiculo` int DEFAULT NULL,
  `id_solicitacao` int DEFAULT NULL,
  `observacao` text,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_solicitacao_INDEX` (`id_solicitacao`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_regiao`
--

DROP TABLE IF EXISTS `age_regiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_regiao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `sigla` varchar(255) DEFAULT NULL,
  `regiao` text,
  `unidade` int DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_sigla_INDEX` (`sigla`(10)),
  KEY `fb_order_unidade_INDEX` (`unidade`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_solicitacao`
--

DROP TABLE IF EXISTS `age_solicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_solicitacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `tipo` text,
  `id_situacao` int DEFAULT NULL,
  `id_solicitante` int DEFAULT NULL,
  `setor_solicitante` int DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `data_termino` datetime DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  `justificativa` text,
  `local_saida` varchar(255) DEFAULT NULL,
  `local_destino` varchar(255) DEFAULT NULL,
  `motivo_cancelamento` text,
  `finalizar` text,
  `unidade_solicitante` int DEFAULT NULL,
  `regiao` int DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `agendamento_pai` int DEFAULT NULL,
  `motivo_edicao` text,
  `anexo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_prefilter_tipo_INDEX` (`tipo`(10)),
  KEY `fb_order_id_solicitante_INDEX` (`id_solicitante`),
  KEY `fb_order_id_situacao_INDEX` (`id_situacao`),
  KEY `fb_order_setor_solicitante_INDEX` (`setor_solicitante`),
  KEY `fb_order_justificativa_INDEX` (`justificativa`(10)),
  KEY `fb_order_local_saida_INDEX` (`local_saida`(10)),
  KEY `fb_order_local_destino_INDEX` (`local_destino`(10)),
  KEY `fb_order_data_inicio_INDEX` (`data_inicio`),
  KEY `fb_filter_unidade_solicitante_INDEX` (`unidade_solicitante`),
  KEY `fb_filter_regiao_INDEX` (`regiao`)
) ENGINE=InnoDB AUTO_INCREMENT=42818 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_unidades`
--

DROP TABLE IF EXISTS `age_unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_unidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `id_unidade` int DEFAULT NULL,
  `id_veiculo` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_balancoanual`
--

DROP TABLE IF EXISTS `alm_balancoanual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_balancoanual` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `termino` datetime DEFAULT NULL,
  `mensagem` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_data_inicio_INDEX` (`data_inicio`),
  KEY `fb_order_termino_INDEX` (`termino`),
  KEY `fb_order_mensagem_INDEX` (`mensagem`(10))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_estoque`
--

DROP TABLE IF EXISTS `alm_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `tipo_movimentacao` int DEFAULT NULL,
  `nota_fiscal` int DEFAULT NULL,
  `material` int DEFAULT NULL,
  `quantidade` decimal(21,10) DEFAULT NULL,
  `preco_unitario` decimal(21,10) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `valor_total` decimal(21,10) DEFAULT NULL,
  `quantidade_estoque` decimal(21,10) DEFAULT NULL,
  `preco_medio_estoque` decimal(21,10) DEFAULT NULL,
  `valor_total_estoque` decimal(21,10) DEFAULT NULL,
  `id_setor` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_tipo_movimentacao_INDEX` (`tipo_movimentacao`),
  KEY `fb_order_nota_fical_INDEX` (`nota_fiscal`),
  KEY `fb_order_material_INDEX` (`material`),
  KEY `fb_order_quantidade_INDEX` (`quantidade`),
  KEY `fb_order_preco_unitario_INDEX` (`preco_unitario`),
  KEY `fb_order_valor_total_INDEX` (`valor_total`),
  KEY `fb_order_quantidade_estoque_INDEX` (`quantidade_estoque`),
  KEY `fb_order_preco_medio_estoque_INDEX` (`preco_medio_estoque`),
  KEY `fb_order_valor_total_estoque_INDEX` (`valor_total_estoque`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_id_setor_INDEX` (`id_setor`),
  KEY `fb_order_id_pedido_INDEX` (`id_pedido`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`)
) ENGINE=InnoDB AUTO_INCREMENT=293637 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_itens_notafiscal`
--

DROP TABLE IF EXISTS `alm_itens_notafiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_itens_notafiscal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_notafiscal` int DEFAULT NULL,
  `id_material` int DEFAULT NULL,
  `quantidade` decimal(21,10) DEFAULT NULL,
  `preco_unitario` decimal(21,10) DEFAULT NULL,
  `tipo_material` text,
  `id_material_permanente` int DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `total_item` decimal(21,10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_notafiscal_INDEX` (`id_notafiscal`)
) ENGINE=InnoDB AUTO_INCREMENT=24400 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_material`
--

DROP TABLE IF EXISTS `alm_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao_resumida` int DEFAULT NULL,
  `unidade` int DEFAULT NULL,
  `marca` int DEFAULT NULL,
  `modelo` int DEFAULT NULL,
  `situacao` text,
  `data_ultima_compra` datetime DEFAULT NULL,
  `valor_ultima_compra` decimal(21,10) DEFAULT NULL,
  `especificacao` text,
  `elemento_despesa` int DEFAULT NULL,
  `conta_contabil` int DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `valor_medio` decimal(21,10) DEFAULT NULL,
  `estoque` decimal(21,10) DEFAULT NULL,
  `tipo_material` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_descricao_resumida_INDEX` (`descricao_resumida`),
  KEY `fb_order_valor_ultima_compra_INDEX` (`valor_ultima_compra`),
  KEY `fb_order_especificacao_INDEX` (`especificacao`(10)),
  KEY `fb_order_valor_medio_INDEX` (`valor_medio`),
  KEY `fb_order_estoque_INDEX` (`estoque`),
  KEY `fb_order_tipo_material_INDEX` (`tipo_material`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_notafiscal`
--

DROP TABLE IF EXISTS `alm_notafiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_notafiscal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `num_documento` varchar(255) DEFAULT NULL,
  `situacao` int DEFAULT NULL,
  `data_situacao` datetime DEFAULT NULL,
  `fornecedor` int DEFAULT NULL,
  `data_documento` datetime DEFAULT NULL,
  `tipo_documento` int DEFAULT NULL,
  `observacao` text,
  `atualizado_por` int DEFAULT NULL,
  `valor_total` decimal(21,10) DEFAULT NULL,
  `estoque` text,
  `unidade_judiciaria` int DEFAULT NULL,
  `setor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_num_documento_INDEX` (`num_documento`(10)),
  KEY `fb_order_fornecedor_INDEX` (`fornecedor`),
  KEY `fb_order_data_documento_INDEX` (`data_documento`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_valor_total_INDEX` (`valor_total`),
  KEY `fb_order_situacao_INDEX` (`situacao`),
  KEY `fb_order_estoque_INDEX` (`estoque`(10)),
  KEY `fb_order_tipo_documento_INDEX` (`tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4260 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_situacao_notafiscal`
--

DROP TABLE IF EXISTS `alm_situacao_notafiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_situacao_notafiscal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_tipo_documento`
--

DROP TABLE IF EXISTS `alm_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_tipo_documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alm_tipo_movimentacao`
--

DROP TABLE IF EXISTS `alm_tipo_movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alm_tipo_movimentacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_contrato`
--

DROP TABLE IF EXISTS `ava_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_contrato` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo` text,
  `no_contrato` varchar(255) NOT NULL DEFAULT '0',
  `nm_contrato` varchar(255) NOT NULL DEFAULT '0',
  `situacao` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_no_contrato_INDEX` (`no_contrato`(10)),
  KEY `fb_order_nm_contrato_INDEX` (`nm_contrato`(10)),
  KEY `fb_order_id_tipo_INDEX` (`id_tipo`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_formulario`
--

DROP TABLE IF EXISTS `ava_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_formulario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `localidade` int DEFAULT NULL,
  `periodo` int DEFAULT NULL,
  `fiscal` int DEFAULT NULL,
  `gestor` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `resposta_falta` varchar(1) DEFAULT NULL,
  `observacao` text,
  `ng` int DEFAULT NULL,
  `log` text,
  `contrato` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_formulario_contrato_id` (`contrato`),
  KEY `fk_formulario_localidade_id` (`localidade`),
  KEY `fk_formulario_periodo_id` (`periodo`),
  CONSTRAINT `fk_formulario_contrato_id` FOREIGN KEY (`contrato`) REFERENCES `ava_contrato` (`id`),
  CONSTRAINT `fk_formulario_localidade_id` FOREIGN KEY (`localidade`) REFERENCES `ava_localidades` (`id_localidade`),
  CONSTRAINT `fk_formulario_periodo_id` FOREIGN KEY (`periodo`) REFERENCES `ava_periodo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5252 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_funcao`
--

DROP TABLE IF EXISTS `ava_funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_funcao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL DEFAULT '0',
  `id_contrato` int unsigned NOT NULL DEFAULT '0',
  `id_tipo` char(1) NOT NULL DEFAULT '0' COMMENT 'F: Fiscal, G: Gestor',
  `id_localidade` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_users_id_usuario` (`id_usuario`),
  KEY `fk_contrato_id_contrato` (`id_contrato`),
  CONSTRAINT `fk_contrato_id_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `ava_contrato` (`id`),
  CONSTRAINT `fk_users_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `jos_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_localidades`
--

DROP TABLE IF EXISTS `ava_localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_localidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_localidade` int NOT NULL DEFAULT '0',
  `id_contrato` int unsigned NOT NULL DEFAULT '0',
  `situacao` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: Ativo ; 0: Inativo',
  PRIMARY KEY (`id`),
  KEY `fk_setores_id_localidade` (`id_localidade`),
  KEY `fk_contrato_id_contrato1` (`id_contrato`),
  CONSTRAINT `fk_contrato_id_contrato1` FOREIGN KEY (`id_contrato`) REFERENCES `ava_contrato` (`id`),
  CONSTRAINT `fk_setores_id_localidade` FOREIGN KEY (`id_localidade`) REFERENCES `mat_setores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_perguntas`
--

DROP TABLE IF EXISTS `ava_perguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_perguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `texto` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_texto_INDEX` (`texto`(10))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_periodo`
--

DROP TABLE IF EXISTS `ava_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_periodo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `inicio` datetime DEFAULT NULL,
  `termino` datetime DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `ng1` int DEFAULT NULL,
  `ng2` int DEFAULT NULL,
  `ng3` int DEFAULT NULL,
  `contrato` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_periodo_contrato_id` (`contrato`),
  CONSTRAINT `fk_periodo_contrato_id` FOREIGN KEY (`contrato`) REFERENCES `ava_contrato` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_respostas`
--

DROP TABLE IF EXISTS `ava_respostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_respostas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `formulario` int DEFAULT NULL,
  `pergunta` int DEFAULT NULL,
  `nfc` int DEFAULT NULL,
  `nans` int DEFAULT NULL,
  `observacao` text,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_respostas_pergunta_id` (`pergunta`),
  KEY `fk_respostas_formulario_id` (`formulario`),
  CONSTRAINT `fk_respostas_formulario_id` FOREIGN KEY (`formulario`) REFERENCES `ava_formulario` (`id`),
  CONSTRAINT `fk_respostas_pergunta_id` FOREIGN KEY (`pergunta`) REFERENCES `ava_perguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61285 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_tipoformulario`
--

DROP TABLE IF EXISTS `ava_tipoformulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_tipoformulario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_contrato` int unsigned NOT NULL DEFAULT '0',
  `id_perguntas` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Lista de IDS das perguntas separados por vírgula',
  PRIMARY KEY (`id`),
  KEY `fk_tipoformulario_contrato_id` (`id_contrato`),
  KEY `fb_order_id_perguntas_INDEX` (`id_perguntas`(10)),
  CONSTRAINT `fk_tipoformulario_contrato_id` FOREIGN KEY (`id_contrato`) REFERENCES `ava_contrato` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_transporte_form`
--

DROP TABLE IF EXISTS `ava_transporte_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_transporte_form` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `funcao` varchar(50) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ausencia_com_sub` int NOT NULL DEFAULT '0' COMMENT '0 = false; 1 = true',
  `ausencia_sem_sub` int NOT NULL DEFAULT '0' COMMENT '0 = false; 1 = true',
  `observacoes` text,
  `quest_1` tinyint DEFAULT '1',
  `quest-2` tinyint DEFAULT '1',
  `quest_3` tinyint DEFAULT '1',
  `quest_4` tinyint DEFAULT '1',
  `quest_5` tinyint DEFAULT '1',
  `quest_6` tinyint DEFAULT '1',
  `quest_7` tinyint DEFAULT '1',
  `quest_8` tinyint DEFAULT '1',
  `ext_quest_3` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `form_id` (`form_id`) USING BTREE,
  CONSTRAINT `FK_ava_transporte_form_ava_formulario` FOREIGN KEY (`form_id`) REFERENCES `ava_formulario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ava_transporte_periodo`
--

DROP TABLE IF EXISTS `ava_transporte_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava_transporte_periodo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_person_id` int unsigned NOT NULL,
  `tipo` int NOT NULL COMMENT '0 = com substituto / 1= sem substituto;',
  `nome_sub` varchar(100) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `form_id` (`form_person_id`) USING BTREE,
  CONSTRAINT `FK_ava_transporte_periodo_ava_transporte_form` FOREIGN KEY (`form_person_id`) REFERENCES `ava_transporte_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cad_centrocusto`
--

DROP TABLE IF EXISTS `cad_centrocusto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_centrocusto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cha_chamados`
--

DROP TABLE IF EXISTS `cha_chamados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cha_chamados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `id_solicitante` int DEFAULT NULL,
  `id_setorsolicitante` int DEFAULT NULL,
  `id_situacao` int DEFAULT NULL,
  `descricao` text,
  `anexo` text,
  `prioridade` text,
  `data_inicio` datetime DEFAULT NULL,
  `data_previsao` datetime DEFAULT NULL,
  `data_termino` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_id_tipo_INDEX` (`id_tipo`),
  KEY `fb_order_id_solicitante_INDEX` (`id_solicitante`),
  KEY `fb_order_id_setorsolicitante_INDEX` (`id_setorsolicitante`),
  KEY `fb_order_id_situacao_INDEX` (`id_situacao`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_data_previsao_INDEX` (`data_previsao`),
  KEY `fb_order_data_inicio_INDEX` (`data_inicio`),
  KEY `fb_order_data_termino_INDEX` (`data_termino`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cha_historico`
--

DROP TABLE IF EXISTS `cha_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cha_historico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_chamado` int DEFAULT NULL,
  `id_situacao` int DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_termino` datetime DEFAULT NULL,
  `atendido_por` int DEFAULT NULL,
  `descricao` text,
  `fabrik_lists` int DEFAULT NULL,
  `fabrik_forms` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_id_situacao_INDEX` (`id_situacao`),
  KEY `fb_order_data_termino_INDEX` (`data_termino`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_id_chamado_INDEX` (`id_chamado`),
  KEY `fb_order_data_inicio_INDEX` (`data_inicio`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cha_tipochamado`
--

DROP TABLE IF EXISTS `cha_tipochamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cha_tipochamado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_cedidos`
--

DROP TABLE IF EXISTS `imo_cedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_cedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_imovel` int DEFAULT NULL,
  `resumo` text,
  `proprietario_responsavel` text,
  `condicao_uso` text,
  `num_processo` varchar(255) DEFAULT NULL,
  `termo_digital` text,
  `objeto` text,
  `fiscais` text,
  `valor` decimal(13,2) DEFAULT NULL,
  `data_assinatura` datetime DEFAULT NULL,
  `ato_diario` varchar(255) DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `situacao` text,
  `atualizado_por` int DEFAULT NULL,
  `observacao` text,
  `vencimento` datetime DEFAULT NULL,
  `vigencia` varchar(255) DEFAULT NULL,
  `aditivo_vigencia` datetime DEFAULT NULL,
  `retribuicao` text,
  `despesas` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_id_imovel_INDEX` (`id_imovel`),
  KEY `fb_order_resumo_INDEX` (`resumo`(10)),
  KEY `fb_order_proprietario_responsavel_INDEX` (`proprietario_responsavel`(10)),
  KEY `fb_order_condicao_uso_INDEX` (`condicao_uso`(10)),
  KEY `fb_order_num_processo_INDEX` (`num_processo`(10)),
  KEY `fb_order_data_assinatura_INDEX` (`data_assinatura`),
  KEY `fb_order_vencimento_INDEX` (`vencimento`),
  KEY `fb_order_vigencia_INDEX` (`vigencia`(10))
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_cidade`
--

DROP TABLE IF EXISTS `imo_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_cidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=8544 DEFAULT CHARSET=utf8mb3 COMMENT='Fonte de dados: orcle corporativo.cidade';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_ciduf`
--

DROP TABLE IF EXISTS `imo_ciduf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_ciduf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cidade` int DEFAULT NULL,
  `cd_uf` varchar(2) DEFAULT NULL,
  `cd_cep_cidade` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cidade` (`id_cidade`),
  KEY `fb_order_cd_cep_cidade_INDEX` (`cd_cep_cidade`),
  CONSTRAINT `imo_ciduf_ibfk_1` FOREIGN KEY (`id_cidade`) REFERENCES `imo_cidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_condicaouso`
--

DROP TABLE IF EXISTS `imo_condicaouso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_condicaouso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_denominacao`
--

DROP TABLE IF EXISTS `imo_denominacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_denominacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `denominacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_denominacao_INDEX` (`denominacao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_depreciacao`
--

DROP TABLE IF EXISTS `imo_depreciacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_depreciacao` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_imovel` int DEFAULT NULL,
  `data_calculo` datetime DEFAULT NULL,
  `depreciacao_mensal` decimal(21,10) DEFAULT NULL,
  `depreciacao_acumulada` decimal(21,10) DEFAULT NULL,
  `valor_residual` decimal(21,10) DEFAULT NULL,
  `valor` decimal(21,10) DEFAULT NULL,
  `item` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `valor_liquido_contabil` decimal(21,10) DEFAULT NULL,
  `vida_util` int DEFAULT NULL,
  `id_obra` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_imovel` (`Id_imovel`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_item_INDEX` (`item`),
  CONSTRAINT `imo_depreciacao_ibfk_1` FOREIGN KEY (`Id_imovel`) REFERENCES `imo_imovel` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=143574 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_entradasaida`
--

DROP TABLE IF EXISTS `imo_entradasaida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_entradasaida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `tipo` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_usuario_INDEX` (`usuario`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_tipo_INDEX` (`tipo`(10))
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_estadoconservacao`
--

DROP TABLE IF EXISTS `imo_estadoconservacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_estadoconservacao` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `descEstadoConservacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fb_order_descEstadoConservacao_INDEX` (`descEstadoConservacao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_eventos`
--

DROP TABLE IF EXISTS `imo_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_tributos` int DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `descricao` text,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_tributos_INDEX` (`id_tributos`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_gestorcedidos`
--

DROP TABLE IF EXISTS `imo_gestorcedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_gestorcedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_cedidos` int DEFAULT NULL,
  `ato_diario` varchar(255) DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `gestor_fiscal` text,
  `nome` int DEFAULT NULL,
  `data_encerramento` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `tipo_tributo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_cedidos_INDEX` (`id_cedidos`),
  KEY `fb_order_tipo_tributo_INDEX` (`tipo_tributo`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_imovel`
--

DROP TABLE IF EXISTS `imo_imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_imovel` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `num_registro` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_aquisicao` datetime DEFAULT NULL,
  `data_construcao` datetime DEFAULT NULL,
  `data_incorporacao` datetime DEFAULT NULL,
  `data_ingresso_contabil` datetime DEFAULT NULL,
  `data_reavaliacao` datetime DEFAULT NULL,
  `inscricao_generica` varchar(255) DEFAULT NULL,
  `end_logradouro` varchar(255) DEFAULT NULL,
  `end_numero` varchar(25) DEFAULT NULL,
  `end_bairro` varchar(255) DEFAULT NULL,
  `end_cidade` varchar(255) DEFAULT NULL,
  `end_estado` varchar(2) DEFAULT NULL,
  `end_cep` varchar(20) DEFAULT NULL,
  `end_compl_endereco` varchar(255) DEFAULT NULL,
  `end_latitude` decimal(21,20) DEFAULT NULL,
  `end_longitude` decimal(21,20) DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `area_terreno_total` decimal(12,2) DEFAULT NULL,
  `area_edificacao` decimal(12,2) DEFAULT NULL,
  `valor_atualizado` decimal(12,2) DEFAULT NULL,
  `valor_historico_escritura` decimal(12,2) DEFAULT NULL,
  `valor_historico_iptu` decimal(12,2) DEFAULT NULL,
  `valor_historico_1a_avaliacao` decimal(12,2) DEFAULT NULL,
  `criterio_valor_historico` varchar(255) DEFAULT NULL,
  `criterio_valor_atualizado` varchar(255) DEFAULT NULL,
  `valor_reavaliado` decimal(10,2) DEFAULT NULL,
  `vida_util` int DEFAULT NULL,
  `idade_aparente_anos` int DEFAULT NULL,
  `Id_tipoimovel` int DEFAULT NULL,
  `Id_planocontas` int DEFAULT NULL,
  `id_denominacao` int DEFAULT NULL,
  `Id_situacao` int DEFAULT NULL,
  `Id_tipodebem` int DEFAULT NULL,
  `Id_setores` int DEFAULT NULL,
  `id_responsavel` int DEFAULT NULL,
  `id_condicaouso` int DEFAULT NULL,
  `id_cidade` int DEFAULT NULL,
  `id_ciduf` int DEFAULT NULL,
  `Id_estadoconservacao` int DEFAULT NULL,
  `id_elementodespesa` int DEFAULT NULL,
  `id_entradasaida` int DEFAULT NULL,
  `data_baixa` datetime DEFAULT NULL,
  `processo_baixa` varchar(255) DEFAULT NULL,
  `vida_util_remanescente` int DEFAULT NULL,
  `depreciacao_mensal` decimal(21,10) DEFAULT NULL,
  `depreciacao_acumulada` decimal(21,10) DEFAULT NULL,
  `valor_liquido_contabil` decimal(21,10) DEFAULT NULL,
  `valor_residual` decimal(21,10) DEFAULT NULL,
  `inscricao_fiscal` varchar(255) DEFAULT NULL,
  `inscricao_imobiliaria` varchar(255) DEFAULT NULL,
  `observacao` text,
  `num_processo_tj` varchar(255) DEFAULT NULL,
  `num_processo_seger` varchar(255) DEFAULT NULL,
  `num_matricula` varchar(255) DEFAULT NULL,
  `data_situacao` datetime DEFAULT NULL,
  `num_processo_adm` int DEFAULT NULL,
  `data_vigencia` datetime DEFAULT NULL,
  `vida_util_reavaliado` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_tipoimovel` (`Id_tipoimovel`),
  KEY `Id_planocontas` (`Id_planocontas`),
  KEY `id_denominacao` (`id_denominacao`),
  KEY `Id_situacao` (`Id_situacao`),
  KEY `Id_tipodebem` (`Id_tipodebem`),
  KEY `Id_setores` (`Id_setores`),
  KEY `id_responsavel` (`id_responsavel`),
  KEY `id_condicaouso` (`id_condicaouso`),
  KEY `id_cidade` (`id_cidade`),
  KEY `id_ciduf` (`id_ciduf`),
  KEY `imo_imovel_estadoconservacao` (`Id_estadoconservacao`),
  KEY `fb_order_num_registro_INDEX` (`num_registro`(10)),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_data_aquisicao_INDEX` (`data_aquisicao`),
  KEY `fb_order_id_entradasaida_INDEX` (`id_entradasaida`),
  KEY `fb_order_num_processo_tj_INDEX` (`num_processo_tj`(10)),
  KEY `fb_order_num_processo_seger_INDEX` (`num_processo_seger`(10)),
  KEY `fb_order_num_matricula_INDEX` (`num_matricula`(10)),
  KEY `fb_order_num_processo_adm_INDEX` (`num_processo_adm`),
  KEY `fb_order_id_elementodespesa_INDEX` (`id_elementodespesa`),
  CONSTRAINT `imo_imovel_estadoconservacao` FOREIGN KEY (`Id_estadoconservacao`) REFERENCES `imo_estadoconservacao` (`Id`),
  CONSTRAINT `imo_imovel_ibfk_1` FOREIGN KEY (`Id_tipoimovel`) REFERENCES `imo_tipoimovel` (`Id`),
  CONSTRAINT `imo_imovel_ibfk_10` FOREIGN KEY (`id_ciduf`) REFERENCES `imo_ciduf` (`id`),
  CONSTRAINT `imo_imovel_ibfk_2` FOREIGN KEY (`Id_planocontas`) REFERENCES `mat_planocontas` (`id`),
  CONSTRAINT `imo_imovel_ibfk_3` FOREIGN KEY (`id_denominacao`) REFERENCES `imo_denominacao` (`id`),
  CONSTRAINT `imo_imovel_ibfk_4` FOREIGN KEY (`Id_situacao`) REFERENCES `imo_situacao` (`Id`),
  CONSTRAINT `imo_imovel_ibfk_5` FOREIGN KEY (`Id_tipodebem`) REFERENCES `imo_tipodebem` (`Id`),
  CONSTRAINT `imo_imovel_ibfk_6` FOREIGN KEY (`Id_setores`) REFERENCES `mat_setores` (`id`),
  CONSTRAINT `imo_imovel_ibfk_7` FOREIGN KEY (`id_responsavel`) REFERENCES `imo_responsavel` (`id`),
  CONSTRAINT `imo_imovel_ibfk_8` FOREIGN KEY (`id_condicaouso`) REFERENCES `imo_condicaouso` (`id`),
  CONSTRAINT `imo_imovel_ibfk_9` FOREIGN KEY (`id_cidade`) REFERENCES `imo_cidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_obras`
--

DROP TABLE IF EXISTS `imo_obras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_obras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_imovel` int DEFAULT NULL,
  `descricao` text,
  `data` datetime DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_reavaliacao`
--

DROP TABLE IF EXISTS `imo_reavaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_reavaliacao` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `valor_reavaliacao` decimal(21,10) DEFAULT NULL,
  `valor_mercado` decimal(21,20) DEFAULT NULL,
  `ajuste_contabil` decimal(21,10) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `data_reavaliacao` datetime DEFAULT NULL,
  `data_disponibilizacao` datetime DEFAULT NULL,
  `data_referencia` datetime DEFAULT NULL,
  `valor_aquisicao` decimal(21,20) DEFAULT NULL,
  `vida_util_reavaliacao` int DEFAULT NULL,
  `vida_util_siafi` int DEFAULT NULL,
  `vida_util` int DEFAULT NULL,
  `tempo_utilizacao_meses` int DEFAULT NULL,
  `vida_util_remanescente_meses` int DEFAULT NULL,
  `vida_util_estimada_anos` decimal(21,10) DEFAULT NULL,
  `pub1` decimal(21,10) DEFAULT NULL,
  `puv` decimal(21,10) DEFAULT NULL,
  `fr` decimal(21,10) DEFAULT NULL,
  `utilizacao_bem_anos` decimal(21,10) DEFAULT NULL,
  `idade_aparente_anos` int DEFAULT NULL,
  `Id_estadoconservacao` int DEFAULT NULL,
  `Id_imovel` int DEFAULT NULL,
  `observacao` text,
  PRIMARY KEY (`Id`),
  KEY `Id_estadoconservacao` (`Id_estadoconservacao`),
  KEY `Id_imovel` (`Id_imovel`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_responsavel`
--

DROP TABLE IF EXISTS `imo_responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_responsavel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `proprietario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_proprietario_INDEX` (`proprietario`(10))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_situacao`
--

DROP TABLE IF EXISTS `imo_situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_situacao` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fb_order_Descricao_INDEX` (`Descricao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_termos`
--

DROP TABLE IF EXISTS `imo_termos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_termos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `num_termo` varchar(255) DEFAULT NULL,
  `ano_termo` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `arquivo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_termosimoveis`
--

DROP TABLE IF EXISTS `imo_termosimoveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_termosimoveis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `termo` int DEFAULT NULL,
  `imovel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_termo_INDEX` (`termo`),
  KEY `fb_order_imovel_INDEX` (`imovel`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_tipodebem`
--

DROP TABLE IF EXISTS `imo_tipodebem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_tipodebem` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fb_order_Descricao_INDEX` (`Descricao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_tipoimovel`
--

DROP TABLE IF EXISTS `imo_tipoimovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_tipoimovel` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `desc_tipo_imovel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fb_order_desc_tipo_imovel_INDEX` (`desc_tipo_imovel`(10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_tipotributo`
--

DROP TABLE IF EXISTS `imo_tipotributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_tipotributo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10))
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imo_tributos`
--

DROP TABLE IF EXISTS `imo_tributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imo_tributos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_imovel` int DEFAULT NULL,
  `tipo_tributo` int DEFAULT NULL,
  `vencimento` datetime DEFAULT NULL,
  `valor` decimal(13,2) DEFAULT NULL,
  `pago_em` datetime DEFAULT NULL,
  `valor_pago` decimal(13,2) DEFAULT NULL,
  `processo_pagto` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `observacao` text,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_imovel` (`Id_imovel`),
  KEY `fb_order_tipo_tributo_INDEX` (`tipo_tributo`),
  KEY `fb_order_vencimento_INDEX` (`vencimento`),
  KEY `fb_order_pago_em_INDEX` (`pago_em`),
  KEY `fb_order_processo_pagto_INDEX` (`processo_pagto`(10)),
  KEY `fb_order_observacao_INDEX` (`observacao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `int_amortizacao`
--

DROP TABLE IF EXISTS `int_amortizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `int_amortizacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_intangivel` int DEFAULT NULL,
  `data_calculo` datetime DEFAULT NULL,
  `amortizacao_mensal` decimal(21,10) DEFAULT NULL,
  `amortizacao_acumulada` decimal(21,10) DEFAULT NULL,
  `valor` decimal(21,10) DEFAULT NULL,
  `item` int DEFAULT NULL,
  `valor_liquido_contabil` decimal(21,10) DEFAULT NULL,
  `vida_util` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_id_intangivel_INDEX` (`id_intangivel`),
  KEY `fb_order_data_calculo_INDEX` (`data_calculo`),
  KEY `fb_order_amortizacao_mensal_INDEX` (`amortizacao_mensal`),
  KEY `fb_order_amortizacao_acumulada_INDEX` (`amortizacao_acumulada`),
  KEY `fb_order_valor_INDEX` (`valor`),
  KEY `fb_order_item_INDEX` (`item`),
  KEY `fb_order_valor_liquido_contabil_INDEX` (`valor_liquido_contabil`),
  KEY `fb_order_vida_util_INDEX` (`vida_util`)
) ENGINE=MyISAM AUTO_INCREMENT=2387 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `int_fabricante`
--

DROP TABLE IF EXISTS `int_fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `int_fabricante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `int_intangivel`
--

DROP TABLE IF EXISTS `int_intangivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `int_intangivel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_tipointangivel` int DEFAULT NULL,
  `id_fabricante` int DEFAULT NULL,
  `classificacao` text,
  `nome` varchar(255) DEFAULT NULL,
  `versao` varchar(255) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `processo_aquisicao` varchar(255) DEFAULT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `valor_aquisicao` decimal(21,10) DEFAULT NULL,
  `observacao` text,
  `id_planocontas` int DEFAULT NULL,
  `id_elementodespesa` int DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `atualizado_em` date DEFAULT NULL,
  `vida_util_remanescente` int DEFAULT NULL,
  `inscricao_generica` varchar(255) DEFAULT NULL,
  `nota_patrimonial` varchar(255) DEFAULT NULL,
  `amortizacao_mensal` decimal(21,10) DEFAULT NULL,
  `amortizacao_acumulada` decimal(21,10) DEFAULT NULL,
  `valor_liquido_contabil` decimal(21,10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_id_tipointangivel_INDEX` (`id_tipointangivel`),
  KEY `fb_order_id_fabricante_INDEX` (`id_fabricante`),
  KEY `fb_order_classificacao_INDEX` (`classificacao`(10)),
  KEY `fb_order_nome_INDEX` (`nome`(10)),
  KEY `fb_order_versao_INDEX` (`versao`(10)),
  KEY `fb_order_quantidade_INDEX` (`quantidade`),
  KEY `fb_order_processo_aquisicao_INDEX` (`processo_aquisicao`(10)),
  KEY `fb_order_data_aquisicao_INDEX` (`data_aquisicao`),
  KEY `fb_order_observacao_INDEX` (`observacao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_valor_aquisicao_INDEX` (`valor_aquisicao`),
  KEY `fb_order_atualizado_em_INDEX` (`atualizado_em`),
  KEY `fb_order_inscricao_generica_INDEX` (`inscricao_generica`(10))
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `int_tipo`
--

DROP TABLE IF EXISTS `int_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `int_tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_atividades`
--

DROP TABLE IF EXISTS `inv_atividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inv_atividades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_inventario` int DEFAULT NULL,
  `id_unidade` int DEFAULT NULL,
  `setor` int DEFAULT NULL,
  `complemento` int DEFAULT NULL,
  `inicio` datetime DEFAULT NULL,
  `termino` datetime DEFAULT NULL,
  `dupla` varchar(255) DEFAULT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `qtde_inventariada` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3414 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_comissao`
--

DROP TABLE IF EXISTS `inv_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inv_comissao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_inventario` int DEFAULT NULL,
  `comissao` text,
  `nome` int DEFAULT NULL,
  `funcao` text,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_inventario_INDEX` (`id_inventario`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_equipes`
--

DROP TABLE IF EXISTS `inv_equipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inv_equipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_inventario` int DEFAULT NULL,
  `unidade` int DEFAULT NULL,
  `funcao` text,
  `integrante` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_unidade_INDEX` (`unidade`)
) ENGINE=MyISAM AUTO_INCREMENT=791 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_ak_profiles`
--

DROP TABLE IF EXISTS `jos_ak_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_ak_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `filters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quickicon` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_ak_stats`
--

DROP TABLE IF EXISTS `jos_ak_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_ak_stats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'run',
  `origin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'full',
  `profile_id` bigint NOT NULL DEFAULT '1',
  `archivename` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `absolute_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `multipart` int NOT NULL DEFAULT '0',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backupid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesexist` tinyint NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_size` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fullstatus` (`filesexist`,`status`),
  KEY `idx_stale` (`status`,`origin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_ak_storage`
--

DROP TABLE IF EXISTS `jos_ak_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_ak_storage` (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`tag`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_akeeba_common`
--

DROP TABLE IF EXISTS `jos_akeeba_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_akeeba_common` (
  `key` varchar(255) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_assets`
--

DROP TABLE IF EXISTS `jos_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_associations`
--

DROP TABLE IF EXISTS `jos_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_associations` (
  `id` int NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_banner_clients`
--

DROP TABLE IF EXISTS `jos_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_banner_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_banner_tracks`
--

DROP TABLE IF EXISTS `jos_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int unsigned NOT NULL,
  `banner_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_banners`
--

DROP TABLE IF EXISTS `jos_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int NOT NULL DEFAULT '0',
  `impmade` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `clickurl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_categories`
--

DROP TABLE IF EXISTS `jos_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_contact_details`
--

DROP TABLE IF EXISTS `jos_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `catid` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_content`
--

DROP TABLE IF EXISTS `jos_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_content_frontpage`
--

DROP TABLE IF EXISTS `jos_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_content_frontpage` (
  `content_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_content_rating`
--

DROP TABLE IF EXISTS `jos_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_content_rating` (
  `content_id` int NOT NULL DEFAULT '0',
  `rating_sum` int unsigned NOT NULL DEFAULT '0',
  `rating_count` int unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_content_types`
--

DROP TABLE IF EXISTS `jos_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_content_types` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_contentitem_tag_map`
--

DROP TABLE IF EXISTS `jos_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_contentitem_tag_map` (
  `type_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_core_log_searches`
--

DROP TABLE IF EXISTS `jos_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_core_log_searches` (
  `search_term` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_extensions`
--

DROP TABLE IF EXISTS `jos_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_extensions` (
  `extension_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `access` int unsigned NOT NULL DEFAULT '1',
  `protected` tinyint NOT NULL DEFAULT '0',
  `manifest_cache` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int DEFAULT '0',
  `state` int DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_attending`
--

DROP TABLE IF EXISTS `jos_fabrik_attending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_attending` (
  `user_id` int NOT NULL,
  `list_id` int NOT NULL,
  `form_id` int NOT NULL,
  `row_id` int NOT NULL,
  `element_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`list_id`,`form_id`,`row_id`,`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_connections`
--

DROP TABLE IF EXISTS `jos_fabrik_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_connections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `database` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `published` int NOT NULL DEFAULT '0',
  `checked_out` int NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `default` int NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_cron`
--

DROP TABLE IF EXISTS `jos_fabrik_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_cron` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `frequency` smallint NOT NULL,
  `unit` varchar(15) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int NOT NULL,
  `created_by_alias` varchar(30) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` varchar(30) NOT NULL,
  `checked_out` int NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `lastrun` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_elements`
--

DROP TABLE IF EXISTS `jos_fabrik_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int NOT NULL,
  `plugin` varchar(100) NOT NULL,
  `label` text,
  `checked_out` int NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL DEFAULT '0',
  `default` text NOT NULL,
  `hidden` int NOT NULL,
  `eval` int NOT NULL,
  `ordering` int NOT NULL,
  `show_in_list_summary` int DEFAULT NULL,
  `filter_type` varchar(20) DEFAULT NULL,
  `filter_exact_match` int DEFAULT NULL,
  `published` int NOT NULL DEFAULT '0',
  `link_to_detail` int NOT NULL DEFAULT '0',
  `primary_key` int NOT NULL DEFAULT '0',
  `auto_increment` int NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '0',
  `use_in_page_title` int NOT NULL DEFAULT '0',
  `parent_id` mediumint NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `showinsummary` (`show_in_list_summary`),
  KEY `plugin` (`plugin`(10)),
  KEY `join_checked_out` (`checked_out`),
  KEY `join_group_id` (`group_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2677 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_form_sessions`
--

DROP TABLE IF EXISTS `jos_fabrik_form_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_form_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `form_id` int NOT NULL,
  `row_id` int NOT NULL,
  `last_page` int NOT NULL,
  `referring_url` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1306 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_formgroup`
--

DROP TABLE IF EXISTS `jos_fabrik_formgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_formgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `group_id` int NOT NULL,
  `ordering` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `join_group_id` (`group_id`),
  KEY `join_form_id` (`form_id`),
  KEY `ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_forms`
--

DROP TABLE IF EXISTS `jos_fabrik_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `record_in_database` int NOT NULL,
  `error` varchar(150) NOT NULL,
  `intro` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `checked_out` int NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset_button_label` varchar(100) NOT NULL,
  `submit_button_label` varchar(100) NOT NULL,
  `form_template` varchar(255) DEFAULT NULL,
  `view_only_template` varchar(255) DEFAULT NULL,
  `published` int NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_groups`
--

DROP TABLE IF EXISTS `jos_fabrik_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `css` text NOT NULL,
  `label` varchar(100) NOT NULL,
  `published` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `checked_out` int NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `is_join` int NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_joins`
--

DROP TABLE IF EXISTS `jos_fabrik_joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_joins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `list_id` int NOT NULL,
  `element_id` int NOT NULL,
  `join_from_table` varchar(255) NOT NULL,
  `table_join` varchar(255) NOT NULL,
  `table_key` varchar(255) NOT NULL,
  `table_join_key` varchar(255) NOT NULL,
  `join_type` varchar(255) NOT NULL,
  `group_id` int NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`),
  KEY `element_id` (`element_id`),
  KEY `group_id` (`group_id`),
  KEY `table_join` (`table_join`(100))
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_jsactions`
--

DROP TABLE IF EXISTS `jos_fabrik_jsactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_jsactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `element_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `element_id` (`element_id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_lists`
--

DROP TABLE IF EXISTS `jos_fabrik_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `introduction` text NOT NULL,
  `form_id` int NOT NULL,
  `db_table_name` varchar(255) NOT NULL,
  `db_primary_key` varchar(255) NOT NULL,
  `auto_inc` int NOT NULL,
  `connection_id` int NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int NOT NULL,
  `checked_out` int NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `published` int NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `access` int NOT NULL,
  `hits` int NOT NULL,
  `rows_per_page` int NOT NULL,
  `template` varchar(255) NOT NULL,
  `order_by` varchar(255) NOT NULL,
  `order_dir` varchar(255) NOT NULL DEFAULT 'ASC',
  `filter_action` varchar(30) NOT NULL,
  `group_by` varchar(255) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_log`
--

DROP TABLE IF EXISTS `jos_fabrik_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timedate_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` smallint NOT NULL,
  `referring_url` varchar(255) NOT NULL,
  `message_source` varchar(255) NOT NULL,
  `message_type` char(60) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13685 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_notification`
--

DROP TABLE IF EXISTS `jos_fabrik_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(50) NOT NULL COMMENT 'tableid.formid.rowid reference',
  `user_id` int NOT NULL,
  `reason` varchar(40) NOT NULL,
  `message` text NOT NULL,
  `label` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniquereason` (`user_id`,`reason`(20),`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_notification_event`
--

DROP TABLE IF EXISTS `jos_fabrik_notification_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_notification_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(50) NOT NULL COMMENT 'tableid.formid.rowid reference',
  `event` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_notification_event_sent`
--

DROP TABLE IF EXISTS `jos_fabrik_notification_event_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_notification_event_sent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notification_event_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_notified` (`notification_event_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_packages`
--

DROP TABLE IF EXISTS `jos_fabrik_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_packages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `external_ref` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `component_name` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `checked_out` int NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `template` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_thumbs`
--

DROP TABLE IF EXISTS `jos_fabrik_thumbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_thumbs` (
  `user_id` varchar(255) NOT NULL,
  `listid` int NOT NULL,
  `formid` int NOT NULL,
  `row_id` int NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `element_id` int NOT NULL,
  `special` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`listid`,`formid`,`row_id`,`element_id`,`special`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_validations`
--

DROP TABLE IF EXISTS `jos_fabrik_validations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_validations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `element_id` int NOT NULL,
  `validation_plugin` varchar(100) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `client_side_validation` int NOT NULL DEFAULT '0',
  `checked_out` int NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_fabrik_visualizations`
--

DROP TABLE IF EXISTS `jos_fabrik_visualizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_fabrik_visualizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `intro_text` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `checked_out` int NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `published` int NOT NULL,
  `access` int NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_filters`
--

DROP TABLE IF EXISTS `jos_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_filters` (
  `filter_id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int unsigned NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  `params` longtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links`
--

DROP TABLE IF EXISTS `jos_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int DEFAULT '1',
  `access` int DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`),
  KEY `idx_title` (`title`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms0`
--

DROP TABLE IF EXISTS `jos_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms0` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms1`
--

DROP TABLE IF EXISTS `jos_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms1` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms2`
--

DROP TABLE IF EXISTS `jos_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms2` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms3`
--

DROP TABLE IF EXISTS `jos_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms3` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms4`
--

DROP TABLE IF EXISTS `jos_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms4` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms5`
--

DROP TABLE IF EXISTS `jos_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms5` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms6`
--

DROP TABLE IF EXISTS `jos_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms6` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms7`
--

DROP TABLE IF EXISTS `jos_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms7` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms8`
--

DROP TABLE IF EXISTS `jos_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms8` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_terms9`
--

DROP TABLE IF EXISTS `jos_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_terms9` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_termsa`
--

DROP TABLE IF EXISTS `jos_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_termsa` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_termsb`
--

DROP TABLE IF EXISTS `jos_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_termsb` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_termsc`
--

DROP TABLE IF EXISTS `jos_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_termsc` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_termsd`
--

DROP TABLE IF EXISTS `jos_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_termsd` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_termse`
--

DROP TABLE IF EXISTS `jos_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_termse` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_links_termsf`
--

DROP TABLE IF EXISTS `jos_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_links_termsf` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_taxonomy`
--

DROP TABLE IF EXISTS `jos_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_taxonomy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `access` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `jos_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_taxonomy_map` (
  `link_id` int unsigned NOT NULL,
  `node_id` int unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_terms`
--

DROP TABLE IF EXISTS `jos_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_terms` (
  `term_id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_terms_common`
--

DROP TABLE IF EXISTS `jos_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_tokens`
--

DROP TABLE IF EXISTS `jos_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `jos_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_tokens_aggregate` (
  `term_id` int unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_finder_types`
--

DROP TABLE IF EXISTS `jos_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_finder_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_languages`
--

DROP TABLE IF EXISTS `jos_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_menu`
--

DROP TABLE IF EXISTS `jos_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int unsigned NOT NULL DEFAULT '0',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100))
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_menu_types`
--

DROP TABLE IF EXISTS `jos_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_menu_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_messages`
--

DROP TABLE IF EXISTS `jos_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_messages` (
  `message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int unsigned NOT NULL DEFAULT '0',
  `user_id_to` int unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_messages_cfg`
--

DROP TABLE IF EXISTS `jos_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_messages_cfg` (
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_mijosql_queries`
--

DROP TABLE IF EXISTS `jos_mijosql_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_mijosql_queries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `query` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_modules`
--

DROP TABLE IF EXISTS `jos_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint unsigned NOT NULL DEFAULT '1',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_modules_menu`
--

DROP TABLE IF EXISTS `jos_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_modules_menu` (
  `moduleid` int NOT NULL DEFAULT '0',
  `menuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_newsfeeds`
--

DROP TABLE IF EXISTS `jos_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_newsfeeds` (
  `catid` int NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int unsigned NOT NULL DEFAULT '1',
  `cache_time` int unsigned NOT NULL DEFAULT '3600',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `rtl` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `images` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_overrider`
--

DROP TABLE IF EXISTS `jos_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_overrider` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_postinstall_messages`
--

DROP TABLE IF EXISTS `jos_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_postinstall_messages` (
  `postinstall_message_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint NOT NULL DEFAULT '1',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_redirect_links`
--

DROP TABLE IF EXISTS `jos_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_redirect_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referer` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_link_modifed` (`modified_date`),
  KEY `idx_old_url` (`old_url`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_schemas`
--

DROP TABLE IF EXISTS `jos_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_schemas` (
  `extension_id` int NOT NULL,
  `version_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_session`
--

DROP TABLE IF EXISTS `jos_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_session` (
  `session_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `guest` tinyint unsigned DEFAULT '1',
  `time` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` int DEFAULT '0',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_tags`
--

DROP TABLE IF EXISTS `jos_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_template_styles`
--

DROP TABLE IF EXISTS `jos_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_template_styles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `home` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_ucm_base`
--

DROP TABLE IF EXISTS `jos_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_ucm_base` (
  `ucm_id` int unsigned NOT NULL,
  `ucm_item_id` int NOT NULL,
  `ucm_type_id` int NOT NULL,
  `ucm_language_id` int NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_ucm_content`
--

DROP TABLE IF EXISTS `jos_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_ucm_content` (
  `core_content_id` int unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_checked_out_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_access` int unsigned NOT NULL DEFAULT '0',
  `core_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int unsigned NOT NULL DEFAULT '0',
  `core_version` int unsigned NOT NULL DEFAULT '1',
  `core_ordering` int NOT NULL DEFAULT '0',
  `core_metakey` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_language` (`core_language`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_content_type` (`core_type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_ucm_history`
--

DROP TABLE IF EXISTS `jos_ucm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_ucm_history` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int unsigned NOT NULL,
  `ucm_type_id` int unsigned NOT NULL,
  `version_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int unsigned NOT NULL DEFAULT '0',
  `character_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2638 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_update_sites`
--

DROP TABLE IF EXISTS `jos_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_update_sites` (
  `update_site_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int DEFAULT '0',
  `last_check_timestamp` bigint DEFAULT '0',
  `extra_query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_update_sites_extensions`
--

DROP TABLE IF EXISTS `jos_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_update_sites_extensions` (
  `update_site_id` int NOT NULL DEFAULT '0',
  `extension_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_updates`
--

DROP TABLE IF EXISTS `jos_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_updates` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_site_id` int DEFAULT '0',
  `extension_id` int DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint DEFAULT '0',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_user_keys`
--

DROP TABLE IF EXISTS `jos_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_user_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint NOT NULL,
  `time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_user_notes`
--

DROP TABLE IF EXISTS `jos_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_user_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_user_profiles`
--

DROP TABLE IF EXISTS `jos_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_user_profiles` (
  `user_id` int NOT NULL,
  `profile_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_user_usergroup_map`
--

DROP TABLE IF EXISTS `jos_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_user_usergroup_map` (
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_usergroups`
--

DROP TABLE IF EXISTS `jos_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_usergroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_users`
--

DROP TABLE IF EXISTS `jos_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint NOT NULL DEFAULT '0',
  `sendEmail` tinyint DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `idx_name` (`name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=6063 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_utf8_conversion`
--

DROP TABLE IF EXISTS `jos_utf8_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_utf8_conversion` (
  `converted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_viewlevels`
--

DROP TABLE IF EXISTS `jos_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_viewlevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `rules` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_weblinks`
--

DROP TABLE IF EXISTS `jos_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_weblinks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `catid` int NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int unsigned NOT NULL DEFAULT '1',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jos_wf_profiles`
--

DROP TABLE IF EXISTS `jos_wf_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jos_wf_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `users` text NOT NULL,
  `types` text NOT NULL,
  `components` text NOT NULL,
  `area` tinyint NOT NULL,
  `device` varchar(255) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint NOT NULL,
  `ordering` int NOT NULL,
  `checked_out` tinyint NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_anexoprocesso`
--

DROP TABLE IF EXISTS `mat_anexoprocesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_anexoprocesso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `num_processo` int DEFAULT NULL,
  `tipo_documento` int DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `num_documento` varchar(255) DEFAULT NULL,
  `anexo_documento` text,
  `material` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_num_processo_INDEX` (`num_processo`)
) ENGINE=InnoDB AUTO_INCREMENT=1493 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_arquivodigital`
--

DROP TABLE IF EXISTS `mat_arquivodigital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_arquivodigital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `termo` int DEFAULT NULL,
  `arquivo_digital` text,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `data_validacao` datetime DEFAULT NULL,
  `validado_por` int DEFAULT NULL,
  `observacao` text,
  `situacao` int DEFAULT '0',
  `web` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_termo_INDEX` (`termo`),
  KEY `fb_prefilter_arquivo_digital_INDEX` (`arquivo_digital`(10)),
  KEY `fb_filter_situacao_INDEX` (`situacao`),
  KEY `fb_filter_web_INDEX` (`web`),
  KEY `fb_order_validado_por_INDEX` (`validado_por`)
) ENGINE=InnoDB AUTO_INCREMENT=141576 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_arquivodigital_repeat_arquivo_digital`
--

DROP TABLE IF EXISTS `mat_arquivodigital_repeat_arquivo_digital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_arquivodigital_repeat_arquivo_digital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `arquivo_digital` text,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `fb_parent_fk_parent_id_INDEX` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_baixa`
--

DROP TABLE IF EXISTS `mat_baixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_baixa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `NumeroProcesso` varchar(255) DEFAULT NULL,
  `DataBaixa` datetime DEFAULT NULL,
  `Requisitante` varchar(255) DEFAULT NULL,
  `RequisitanteCnpj` varchar(255) DEFAULT NULL,
  `Observacao` text,
  `Endereco` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_NumeroProcesso_INDEX` (`NumeroProcesso`(10)),
  KEY `fb_order_DataBaixa_INDEX` (`DataBaixa`),
  KEY `fb_order_Requisitante_INDEX` (`Requisitante`(10)),
  KEY `fb_order_RequisitanteCnpj_INDEX` (`RequisitanteCnpj`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_Usuario_INDEX` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_bens_incorporados`
--

DROP TABLE IF EXISTS `mat_bens_incorporados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_bens_incorporados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_complementosetor`
--

DROP TABLE IF EXISTS `mat_complementosetor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_complementosetor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_Usuario_INDEX` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5130 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_conciliacao`
--

DROP TABLE IF EXISTS `mat_conciliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_conciliacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `numero_patrimonio` varchar(255) DEFAULT NULL,
  `descricao` text,
  `data_aquisicao` datetime DEFAULT NULL,
  `local` varchar(255) DEFAULT NULL,
  `comarca` varchar(255) DEFAULT NULL,
  `valor_aquisicao` varchar(255) DEFAULT NULL,
  `forma_aquisicao` varchar(255) DEFAULT NULL,
  `numero_documento` varchar(255) DEFAULT NULL,
  `fornecedor` varchar(255) DEFAULT NULL,
  `data_conciliacao` datetime DEFAULT NULL,
  `patrimonio` int DEFAULT NULL,
  `patrimonio_desmembrado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_data_conciliacao_INDEX` (`data_conciliacao`)
) ENGINE=InnoDB AUTO_INCREMENT=14680 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_depreciacao`
--

DROP TABLE IF EXISTS `mat_depreciacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_depreciacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `patrimonio` int DEFAULT NULL,
  `item` int DEFAULT NULL,
  `data_calculo` datetime DEFAULT NULL,
  `valor` decimal(21,10) DEFAULT NULL,
  `vida_util` int DEFAULT NULL,
  `valor_residual` decimal(21,10) DEFAULT NULL,
  `depreciacao_mensal` decimal(21,10) DEFAULT NULL,
  `depreciacao_acumulada` decimal(21,10) DEFAULT NULL,
  `valor_liquido_contabil` decimal(21,10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_item_INDEX` (`item`),
  KEY `fb_order_data_calculo_INDEX` (`data_calculo`),
  KEY `fb_order_valor_INDEX` (`valor`),
  KEY `fb_order_valor_residual_INDEX` (`valor_residual`),
  KEY `fb_order_depreciacao_mensal_INDEX` (`depreciacao_mensal`),
  KEY `fb_order_depreciacao_acumulada_INDEX` (`depreciacao_acumulada`),
  KEY `fb_order_valor_liquido_contabil_INDEX` (`valor_liquido_contabil`),
  KEY `fb_order_patrimonio_INDEX` (`patrimonio`),
  KEY `fb_order_vida_util_INDEX` (`vida_util`)
) ENGINE=InnoDB AUTO_INCREMENT=21640058 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_descricaodetalhada`
--

DROP TABLE IF EXISTS `mat_descricaodetalhada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_descricaodetalhada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao_resumida` int DEFAULT NULL,
  `descricao_detalhada` text,
  `marca` int DEFAULT NULL,
  `modelo` int DEFAULT NULL,
  `valor_mercado` decimal(21,10) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `imagem` text,
  `visibilidade` text,
  `pdf` text,
  `unidade_medida` int DEFAULT NULL,
  `item_estoque` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_resumida_INDEX` (`descricao_resumida`),
  KEY `fb_order_descricao_detalhada_INDEX` (`descricao_detalhada`(10)),
  KEY `fb_order_marca_INDEX` (`marca`),
  KEY `fb_order_modelo_INDEX` (`modelo`),
  KEY `fb_order_valor_mercado_INDEX` (`valor_mercado`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_imagem_INDEX` (`imagem`(10)),
  KEY `fb_order_visibilidade_INDEX` (`visibilidade`(10)),
  KEY `fb_order_pdf_INDEX` (`pdf`(10)),
  KEY `fb_filter_item_estoque_INDEX` (`item_estoque`(10))
) ENGINE=MyISAM AUTO_INCREMENT=134311 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_descricaoresumida`
--

DROP TABLE IF EXISTS `mat_descricaoresumida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_descricaoresumida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `CodigodaClasse` int DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `ContaContabil` int DEFAULT NULL,
  `imagem` text,
  `id_tipo_material` text,
  `id_produto` int DEFAULT NULL,
  `visibilidade` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_Descricao_INDEX` (`Descricao`(10)),
  KEY `fb_order_CodigodaClasse_INDEX` (`CodigodaClasse`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_ContaContabil_INDEX` (`ContaContabil`),
  KEY `fb_order_imagem_INDEX` (`imagem`(10)),
  KEY `fb_order_id_produto_INDEX` (`id_produto`),
  KEY `fb_filter_id_tipo_material_INDEX` (`id_tipo_material`(10))
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_filtro_relatorios`
--

DROP TABLE IF EXISTS `mat_filtro_relatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_filtro_relatorios` (
  `usuario` int NOT NULL,
  `numero` int NOT NULL,
  PRIMARY KEY (`usuario`,`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_fornecedor`
--

DROP TABLE IF EXISTS `mat_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_fornecedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `NomeFornecedor` varchar(255) DEFAULT NULL,
  `Pessoa` text,
  `CNPJ` varchar(255) DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `telefone_comercial` varchar(255) DEFAULT NULL,
  `telefone_celular` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_NomeFornecedor_INDEX` (`NomeFornecedor`(10)),
  KEY `fb_order_CNPJ_INDEX` (`CNPJ`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_telefone_comercial_INDEX` (`telefone_comercial`(10)),
  KEY `fb_order_telefone_celular_INDEX` (`telefone_celular`(10))
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_infousers`
--

DROP TABLE IF EXISTS `mat_infousers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_infousers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5777 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_inventario`
--

DROP TABLE IF EXISTS `mat_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_inventario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `num_inventario` int DEFAULT NULL,
  `ano_inventario` int DEFAULT NULL,
  `inicio_inventario` datetime DEFAULT NULL,
  `termino_inventario` datetime DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `situacao` text,
  `dias` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_itembaixa`
--

DROP TABLE IF EXISTS `mat_itembaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_itembaixa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_baixa` int NOT NULL,
  `id_bem` int NOT NULL,
  `id_situacao` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_baixa_INDEX` (`id_baixa`),
  KEY `fb_order_id_bem_INDEX` (`id_bem`)
) ENGINE=InnoDB AUTO_INCREMENT=72587 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_itensinventario`
--

DROP TABLE IF EXISTS `mat_itensinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_itensinventario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_bem` varchar(255) DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  `num_patrimonio` varchar(255) DEFAULT NULL,
  `num_patrimonioantigo` varchar(255) DEFAULT NULL,
  `num_serie` varchar(255) DEFAULT NULL,
  `descricao_resumida` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `setor` int DEFAULT NULL,
  `id_inventario` int DEFAULT NULL,
  `estado_conservacao` varchar(255) DEFAULT NULL,
  `setor_localizado` varchar(255) DEFAULT NULL,
  `unidade_localizado` varchar(255) DEFAULT NULL,
  `complemento_localizado` varchar(255) DEFAULT NULL,
  `descricao_detalhada` text,
  `observacao` varchar(255) DEFAULT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `termo` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `num_serie_egap` varchar(255) DEFAULT NULL,
  `descricao_detalhada_egap` varchar(255) DEFAULT NULL,
  `marca_egap` varchar(255) DEFAULT NULL,
  `modelo_egap` varchar(255) DEFAULT NULL,
  `id_complementosetor` varchar(255) DEFAULT NULL,
  `transferido_em` datetime DEFAULT NULL,
  `situacao_conciliacao` text,
  `conciliado_patrimonio` varchar(255) DEFAULT NULL,
  `imagem_enviada` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_unidades_INDEX` (`unidades`),
  KEY `fb_order_setor_localizado_INDEX` (`setor_localizado`(10)),
  KEY `fb_order_complemento_localizado_INDEX` (`complemento_localizado`(10)),
  KEY `fb_order_id_bem_INDEX` (`id_bem`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_num_patrimonio_INDEX` (`num_patrimonio`(10)),
  KEY `fb_order_num_patrimonioantigo_INDEX` (`num_patrimonioantigo`(10)),
  KEY `fb_order_num_serie_INDEX` (`num_serie`(10)),
  KEY `fb_order_estado_conservacao_INDEX` (`estado_conservacao`(10)),
  KEY `fb_order_descricao_resumida_INDEX` (`descricao_resumida`(10)),
  KEY `fb_order_marca_INDEX` (`marca`(10)),
  KEY `fb_order_modelo_INDEX` (`modelo`(10)),
  KEY `fb_order_descricao_detalhada_INDEX` (`descricao_detalhada`(10)),
  KEY `fb_order_situacao_INDEX` (`situacao`(10)),
  KEY `fb_order_termo_INDEX` (`termo`(10)),
  KEY `fb_order_conciliado_patrimonio_INDEX` (`conciliado_patrimonio`(10)),
  KEY `fb_order_observacao_INDEX` (`observacao`(10)),
  KEY `fb_order_transferido_em_INDEX` (`transferido_em`),
  KEY `fb_filter_id_inventario_INDEX` (`id_inventario`),
  KEY `idx_mat_itensinventario_001` (`setor`,`id_inventario`),
  KEY `idx_mat_itensinventario_002` (`num_patrimonio`,`id_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=653302 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_lotacao`
--

DROP TABLE IF EXISTS `mat_lotacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_lotacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `unidade_judiciaria` int DEFAULT NULL,
  `setor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_user_INDEX` (`id_user`),
  KEY `fb_order_unidade_judiciaria_INDEX` (`unidade_judiciaria`),
  KEY `fb_order_setor_INDEX` (`setor`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=305508 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_marca`
--

DROP TABLE IF EXISTS `mat_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_marca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `tipobem` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_modelo`
--

DROP TABLE IF EXISTS `mat_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_modelo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `marca` int DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_marca_INDEX` (`marca`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_patrimonio`
--

DROP TABLE IF EXISTS `mat_patrimonio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_patrimonio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TomboSmarapd` varchar(255) DEFAULT NULL,
  `NumPatrimonio` int DEFAULT NULL,
  `NumerodePatAnterior` varchar(255) DEFAULT NULL,
  `NumerodeSerie` varchar(255) DEFAULT NULL,
  `Produto` int DEFAULT NULL,
  `ContaContabil` int DEFAULT NULL,
  `DescricaoResumidadoBem` int DEFAULT NULL,
  `Descricao` text,
  `Marca` int DEFAULT NULL,
  `Modelo` int DEFAULT NULL,
  `TipodoBem` text,
  `EstadodeConservacao` text,
  `Voltagem` text,
  `SituacaoBem` int DEFAULT NULL,
  `ClassificacaoInservivel` text,
  `UnidadeJudiciaria` int DEFAULT NULL,
  `Setor` int DEFAULT NULL,
  `ComplementoSetor` int DEFAULT NULL,
  `AndarSetor` text,
  `Unidade` varchar(255) DEFAULT NULL,
  `DataCadastro` datetime DEFAULT NULL,
  `Valor` decimal(21,10) DEFAULT NULL,
  `DatadeIncorporacao` datetime DEFAULT NULL,
  `Lote` int DEFAULT NULL,
  `DatadeVencimento` datetime DEFAULT NULL,
  `NumeracaoInicial` varchar(255) DEFAULT NULL,
  `NumeracaoFinal` varchar(255) DEFAULT NULL,
  `MesdeReferencia` varchar(255) DEFAULT NULL,
  `Fornecedor` int DEFAULT NULL,
  `NotaFiscal` varchar(255) DEFAULT NULL,
  `FormaAquisicao` text,
  `SiglaUnidadeGestora` varchar(255) DEFAULT NULL,
  `Categoria` text,
  `Combustivel` text,
  `Placa` varchar(8) DEFAULT NULL,
  `Chassi` varchar(255) DEFAULT NULL,
  `Renavam` varchar(255) DEFAULT NULL,
  `VidaUtil` varchar(255) DEFAULT NULL,
  `DatadaReavaliacao` datetime DEFAULT NULL,
  `ValordaReavaliacao` decimal(21,10) DEFAULT NULL,
  `ValordeMercado` decimal(21,10) DEFAULT NULL,
  `AcertoContabil` decimal(21,10) DEFAULT NULL,
  `UtilizacaodoBem` varchar(255) DEFAULT NULL,
  `VidaUtilEstimada` varchar(255) DEFAULT NULL,
  `EC` decimal(21,10) DEFAULT NULL,
  `PUB1` decimal(21,10) DEFAULT NULL,
  `PUB2` decimal(21,10) DEFAULT NULL,
  `PUV` decimal(21,10) DEFAULT NULL,
  `FR` decimal(21,10) DEFAULT NULL,
  `ValorReavaliado` decimal(21,10) DEFAULT NULL,
  `VidaUtilSIAFi` varchar(255) DEFAULT NULL,
  `UtilizacaodoBemMeses` int DEFAULT NULL,
  `DepreciacaoMensal` decimal(21,10) DEFAULT NULL,
  `DepreciacaoAcumulada` decimal(21,10) DEFAULT NULL,
  `TestedeImpairment` decimal(21,10) DEFAULT NULL,
  `DataDisponibilizacao` datetime DEFAULT NULL,
  `Observacao` text,
  `date_time` datetime DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `NumTomboSmarapd` int DEFAULT NULL,
  `ProcessoBaixa` varchar(255) DEFAULT NULL,
  `DataBaixa` datetime DEFAULT NULL,
  `ValorAquisicao` decimal(21,10) DEFAULT NULL,
  `AnoFabricacao` varchar(4) DEFAULT NULL,
  `AnoModelo` varchar(4) DEFAULT NULL,
  `ValorResidual` decimal(21,10) DEFAULT NULL,
  `Garantia` int DEFAULT NULL,
  `numero_processo` varchar(255) DEFAULT NULL,
  `nota_empenho` varchar(255) DEFAULT NULL,
  `nota_liquidacao` varchar(255) DEFAULT NULL,
  `data_liquidacao` datetime DEFAULT NULL,
  `VidaUtilReavaliacao` varchar(255) DEFAULT NULL,
  `id_descricaodetalhada` int DEFAULT NULL,
  `grupo` text,
  `acuracia` text,
  `unidade_gestora` text,
  `sit_inventario` varchar(255) DEFAULT NULL,
  `id_inventario` int DEFAULT NULL,
  `situacao_contabil` text,
  `data_situacao_contabil` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_Produto_INDEX` (`Produto`),
  KEY `fb_order_DescricaoResumidadoBem_INDEX` (`DescricaoResumidadoBem`),
  KEY `fb_order_Setor_INDEX` (`Setor`),
  KEY `fb_order_NumerodePatAnterior_INDEX` (`NumerodePatAnterior`(10)),
  KEY `fb_order_TomboSmarapd_INDEX` (`TomboSmarapd`),
  KEY `NumPatrimonio` (`NumPatrimonio`),
  KEY `fb_order_UnidadeJudiciaria_INDEX` (`UnidadeJudiciaria`),
  KEY `fb_order_SituacaoBem_INDEX` (`SituacaoBem`),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_ProcessoBaixa_INDEX` (`ProcessoBaixa`(10)),
  KEY `fb_order_NumerodeSerie_INDEX` (`NumerodeSerie`(10)),
  KEY `fb_order_ComplementoSetor_INDEX` (`ComplementoSetor`),
  KEY `fb_order_DataBaixa_INDEX` (`DataBaixa`),
  KEY `idx_mat_patrimonio_DatadeIncorporacao` (`DatadeIncorporacao`),
  KEY `fb_order_Valor_INDEX` (`Valor`),
  KEY `fb_order_ValorAquisicao_INDEX` (`ValorAquisicao`),
  KEY `fb_order_ValorResidual_INDEX` (`ValorResidual`),
  KEY `idx_mat_patrimonio_001` (`ContaContabil`) USING BTREE,
  KEY `idx_mat_patrimonio_002` (`DataDisponibilizacao`) USING BTREE,
  KEY `fb_prefilter_acuracia_INDEX` (`acuracia`(10)),
  KEY `idx_mat_patrimonio_003` (`id_descricaodetalhada`),
  KEY `idx_mat_patrimonio_004` (`Setor`,`id_inventario`),
  KEY `idx_mat_patrimonio_005` (`Setor`,`id_inventario`,`sit_inventario`),
  KEY `fb_order_data_situacao_contabil_INDEX` (`data_situacao_contabil`),
  FULLTEXT KEY `Descricao` (`Descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=205857 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_planocontas`
--

DROP TABLE IF EXISTS `mat_planocontas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_planocontas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `funcao` text,
  `vinculo` varchar(255) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_codigo_INDEX` (`codigo`(10)),
  KEY `fb_order_titulo_INDEX` (`titulo`(10)),
  KEY `fb_order_usuario_INDEX` (`usuario`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=14174 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_processos`
--

DROP TABLE IF EXISTS `mat_processos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_processos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `num_processo` varchar(255) DEFAULT NULL,
  `data_abertura` datetime DEFAULT NULL,
  `gestor_titular` int DEFAULT NULL,
  `gestor_substituto` int DEFAULT NULL,
  `descricao` text,
  `data_vigencia` datetime DEFAULT NULL,
  `id_tipo_processo` int DEFAULT NULL,
  `id_processo_pai` int DEFAULT NULL,
  `id_fornecedor` int DEFAULT NULL,
  `no_processo_sei` varchar(255) DEFAULT NULL,
  `situacao_atual` text,
  `unidade_demandante` int DEFAULT NULL,
  `projeto_atividade` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_gestor_titular_INDEX` (`gestor_titular`),
  KEY `fb_order_num_processo_INDEX` (`num_processo`(10)),
  KEY `fb_order_no_processo_sei_INDEX` (`no_processo_sei`(10)),
  KEY `fb_order_id_tipo_processo_INDEX` (`id_tipo_processo`),
  KEY `fb_order_data_abertura_INDEX` (`data_abertura`),
  KEY `fb_order_unidade_demandante_INDEX` (`unidade_demandante`),
  KEY `fb_order_data_vigencia_INDEX` (`data_vigencia`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_projeto_atividade_INDEX` (`projeto_atividade`)
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_produtos`
--

DROP TABLE IF EXISTS `mat_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CodigodaClasse` int DEFAULT NULL,
  `DescricaodaClasse` varchar(255) DEFAULT NULL,
  `Despesa` varchar(2) DEFAULT NULL,
  `VidaUtil` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `ValorResidual` decimal(21,10) DEFAULT NULL,
  `item_patrimonial` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `CodigodaClasse` (`CodigodaClasse`),
  KEY `fb_order_DescricaodaClasse_INDEX` (`DescricaodaClasse`(10)),
  KEY `fb_order_VidaUtil_INDEX` (`VidaUtil`),
  KEY `fb_order_CodigodaClasse_INDEX` (`CodigodaClasse`),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_valor_residual_INDEX` (`ValorResidual`),
  KEY `fb_order_item_patrimonial_INDEX` (`item_patrimonial`(10))
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_reavaliacao`
--

DROP TABLE IF EXISTS `mat_reavaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_reavaliacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `patrimonio` int DEFAULT NULL,
  `data_reavaliacao` datetime DEFAULT NULL,
  `data_disponibilizacao` datetime DEFAULT NULL,
  `data_referencia` datetime DEFAULT NULL,
  `valor_aquisicao` decimal(21,10) DEFAULT NULL,
  `vida_util_reavaliacao` int DEFAULT NULL,
  `vida_util_siafi` int DEFAULT NULL,
  `vida_util` int DEFAULT NULL,
  `tempo_utilizacao_meses` int DEFAULT NULL,
  `vida_util_remanescente_meses` int DEFAULT NULL,
  `valor_mercado` decimal(21,10) DEFAULT NULL,
  `utilizacao_bem_anos` decimal(21,10) DEFAULT NULL,
  `vida_util_estimada_anos` decimal(21,10) DEFAULT NULL,
  `estado_conservacao` text,
  `pub1` decimal(21,10) DEFAULT NULL,
  `puv` decimal(21,10) DEFAULT NULL,
  `fr` decimal(21,10) DEFAULT NULL,
  `valor_reavaliacao` decimal(21,10) DEFAULT NULL,
  `ajuste_contabil` decimal(21,10) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_patrimonio_INDEX` (`patrimonio`),
  KEY `fb_order_data_reavaliacao_INDEX` (`data_reavaliacao`),
  KEY `fb_order_data_disponibilizacao_INDEX` (`data_disponibilizacao`),
  KEY `fb_order_data_referencia_INDEX` (`data_referencia`),
  KEY `fb_order_valor_aquisicao_INDEX` (`valor_aquisicao`),
  KEY `fb_order_vida_util_reavaliacao_INDEX` (`vida_util_reavaliacao`),
  KEY `fb_order_vida_util_siafi_INDEX` (`vida_util_siafi`),
  KEY `fb_order_vida_util_INDEX` (`vida_util`),
  KEY `fb_order_tempo_utilizacao_meses_INDEX` (`tempo_utilizacao_meses`),
  KEY `fb_order_vida_util_remanescente_meses_INDEX` (`vida_util_remanescente_meses`),
  KEY `fb_order_valor_mercado_INDEX` (`valor_mercado`),
  KEY `fb_order_utilizacao_bem_anos_INDEX` (`utilizacao_bem_anos`),
  KEY `fb_order_vida_util_estimada_anos_INDEX` (`vida_util_estimada_anos`),
  KEY `fb_order_pub1_INDEX` (`pub1`),
  KEY `fb_order_puv_INDEX` (`puv`),
  KEY `fb_order_fr_INDEX` (`fr`),
  KEY `fb_order_valor_reavaliacao_INDEX` (`valor_reavaliacao`),
  KEY `fb_order_ajuste_contabil_INDEX` (`ajuste_contabil`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=MyISAM AUTO_INCREMENT=7344 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_setores`
--

DROP TABLE IF EXISTS `mat_setores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_setores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `CodigoPai` int DEFAULT NULL,
  `UnidadeOrganizacional` varchar(255) DEFAULT NULL,
  `Setor` varchar(255) DEFAULT NULL,
  `SetorDescricao` varchar(255) DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `CodigodaUO` int DEFAULT NULL,
  `comarca` text,
  `vara` text,
  `ordem` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cd_orgao` int DEFAULT NULL,
  `cns` varchar(255) DEFAULT NULL,
  `presidencia` text,
  `centrocusto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_UnidadeOrganizacional_INDEX` (`UnidadeOrganizacional`(10)),
  KEY `fb_order_Setor_INDEX` (`Setor`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_CodigodaOU_INDEX` (`CodigodaUO`),
  KEY `fb_order_CodigoPai_INDEX` (`CodigoPai`),
  KEY `fb_order_ordem_INDEX` (`ordem`),
  KEY `fb_order_email_INDEX` (`email`(10)),
  KEY `fb_order_cd_orgao_INDEX` (`cd_orgao`),
  KEY `fb_order_cns_INDEX` (`cns`(10)),
  KEY `fb_order_presidencia_INDEX` (`presidencia`(10)),
  KEY `fb_order_centrocusto_INDEX` (`centrocusto`(10)),
  KEY `fb_order_SetorDescricao_INDEX` (`SetorDescricao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=5287 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_situacao`
--

DROP TABLE IF EXISTS `mat_situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_situacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `situacao` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_situacao_INDEX` (`situacao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_termos`
--

DROP TABLE IF EXISTS `mat_termos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_termos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `num_termo` int DEFAULT NULL,
  `ano_termo` int DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `pedido_no` int DEFAULT NULL,
  `situacao_entrega` text,
  PRIMARY KEY (`id`),
  KEY `fb_filter_situacao_entrega_INDEX` (`situacao_entrega`(10))
) ENGINE=InnoDB AUTO_INCREMENT=141597 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_tipo_documentos`
--

DROP TABLE IF EXISTS `mat_tipo_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_tipo_documentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_tipo_processo`
--

DROP TABLE IF EXISTS `mat_tipo_processo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_tipo_processo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_transferencia`
--

DROP TABLE IF EXISTS `mat_transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_transferencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `NumPatrimonio` int DEFAULT NULL,
  `SetorAnterior` varchar(255) DEFAULT NULL,
  `SetorAtual` varchar(255) DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `UnidadeAnterior` varchar(255) DEFAULT NULL,
  `UnidadeAtual` int DEFAULT NULL,
  `ComplementoAnterior` varchar(255) DEFAULT NULL,
  `ComplementoAtual` int DEFAULT NULL,
  `AndarAnterior` varchar(255) DEFAULT NULL,
  `AndarAtual` varchar(255) DEFAULT NULL,
  `Termo` int DEFAULT NULL,
  `pedido_no` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_NumPatrimonio_INDEX` (`NumPatrimonio`),
  KEY `fb_order_SetorAnterior_INDEX` (`SetorAnterior`(10)),
  KEY `fb_order_SetorAtual_INDEX` (`SetorAtual`(10)),
  KEY `fb_order_UnidadeAnterior_INDEX` (`UnidadeAnterior`(10)),
  KEY `fb_order_ComplementoAnterior_INDEX` (`ComplementoAnterior`(10)),
  KEY `fb_order_AndarAnterior_INDEX` (`AndarAnterior`(10)),
  KEY `fb_order_UnidadeAtual_INDEX` (`UnidadeAtual`),
  KEY `fb_order_ComplementoAtual_INDEX` (`ComplementoAtual`),
  KEY `fb_order_AndarAtual_INDEX` (`AndarAtual`(10)),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_Termo_INDEX` (`Termo`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_pedido_no_INDEX` (`pedido_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1379821 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_unidades`
--

DROP TABLE IF EXISTS `mat_unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_unidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `Sigla` varchar(255) DEFAULT NULL,
  `Unidade` varchar(255) DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_Sigla_INDEX` (`Sigla`(10)),
  KEY `fb_order_Unidade_INDEX` (`Unidade`(10)),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mat_unidadesinventario`
--

DROP TABLE IF EXISTS `mat_unidadesinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mat_unidadesinventario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_inventario` int DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_termino` datetime DEFAULT NULL,
  `situacao` text,
  `dias` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_join_fk_id_inventario_INDEX` (`id_inventario`),
  KEY `fb_order_unidades_INDEX` (`unidades`),
  KEY `fb_order_data_inicio_INDEX` (`data_inicio`),
  KEY `fb_order_data_termino_INDEX` (`data_termino`),
  KEY `fb_order_dias_INDEX` (`dias`),
  KEY `fb_order_situacao_INDEX` (`situacao`(10))
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orc_acao`
--

DROP TABLE IF EXISTS `orc_acao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orc_acao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orc_empenho`
--

DROP TABLE IF EXISTS `orc_empenho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orc_empenho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `data_empenho` datetime DEFAULT NULL,
  `no_empenho` varchar(255) DEFAULT NULL,
  `processo_no` int DEFAULT NULL,
  `elemento_despesa` int DEFAULT NULL,
  `valor_1instancia` decimal(13,2) DEFAULT NULL,
  `valor_2instancia` decimal(13,2) DEFAULT NULL,
  `valor_total` decimal(13,2) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `data_cancelamento` datetime DEFAULT NULL,
  `gestor_substituto` int DEFAULT NULL,
  `gestor_titular` int DEFAULT NULL,
  `no_reserva` int DEFAULT NULL,
  `unidade_requisitante` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_data_empenho_INDEX` (`data_empenho`),
  KEY `fb_order_no_empenho_INDEX` (`no_empenho`(10)),
  KEY `fb_order_processo_no_INDEX` (`processo_no`),
  KEY `fb_order_elemento_despesa_INDEX` (`elemento_despesa`),
  KEY `fb_order_no_reserva_INDEX` (`no_reserva`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orc_orcamento`
--

DROP TABLE IF EXISTS `orc_orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orc_orcamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `projeto` int DEFAULT NULL,
  `elemento_despesa` int DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `valor_1instancia` decimal(13,2) DEFAULT NULL,
  `valor_2instancia` decimal(13,2) DEFAULT NULL,
  `valor_total` decimal(13,2) DEFAULT NULL,
  `saldo_1instancia` decimal(13,2) DEFAULT NULL,
  `saldo_2instancia` decimal(13,2) DEFAULT NULL,
  `saldo_atual` decimal(13,2) DEFAULT NULL,
  `previsao_1instancia` decimal(13,2) DEFAULT NULL,
  `previsao_2instancia` decimal(13,2) DEFAULT NULL,
  `previsao_total` decimal(13,2) DEFAULT NULL,
  `observacao` text,
  `unidade_requisitante` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_projeto_INDEX` (`projeto`),
  KEY `fb_order_elemento_despesa_INDEX` (`elemento_despesa`),
  KEY `fb_order_ano_INDEX` (`ano`),
  KEY `fb_order_observacao_INDEX` (`observacao`(10)),
  KEY `fb_filter_unidade_requisitante_INDEX` (`unidade_requisitante`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orc_orcamentoevento`
--

DROP TABLE IF EXISTS `orc_orcamentoevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orc_orcamentoevento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `orcamento` int DEFAULT NULL,
  `tipo_evento` text,
  `valor_total` decimal(13,2) DEFAULT NULL,
  `observacao` text,
  `valor_1instancia` decimal(13,2) DEFAULT NULL,
  `valor_2instancia` decimal(13,2) DEFAULT NULL,
  `processo_no` int DEFAULT NULL,
  `no_reserva` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_observacao_INDEX` (`observacao`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_processo_no_INDEX` (`processo_no`),
  KEY `fb_order_no_reserva_INDEX` (`no_reserva`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orc_planoorcamentario`
--

DROP TABLE IF EXISTS `orc_planoorcamentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orc_planoorcamentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `setor_responsavel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_codigo_INDEX` (`codigo`(10)),
  KEY `fb_order_nome_INDEX` (`nome`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orc_projeto`
--

DROP TABLE IF EXISTS `orc_projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orc_projeto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `acao` int DEFAULT NULL,
  `unidade_judiciaria` int DEFAULT NULL,
  `plano_orcamentario` int DEFAULT NULL,
  `area` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_acao_INDEX` (`acao`),
  KEY `fb_order_unidade_judiciaria_INDEX` (`unidade_judiciaria`),
  KEY `fb_order_plano_orcamentario_INDEX` (`plano_orcamentario`),
  KEY `fb_order_area_INDEX` (`area`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orc_reserva`
--

DROP TABLE IF EXISTS `orc_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orc_reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `processo_no` int DEFAULT NULL,
  `gestor_titular` int DEFAULT NULL,
  `gestor_substituto` int DEFAULT NULL,
  `elemento_despesa` int DEFAULT NULL,
  `valor_1instancia` decimal(13,2) DEFAULT NULL,
  `valor_2instancia` decimal(13,2) DEFAULT NULL,
  `valor_total` decimal(13,2) DEFAULT NULL,
  `no_reserva` varchar(255) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `data_cancelamento` datetime DEFAULT NULL,
  `data_reserva` datetime DEFAULT NULL,
  `unidade_requisitante` int DEFAULT NULL,
  `orcamento` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_processo_no_INDEX` (`processo_no`),
  KEY `fb_order_gestor_titular_INDEX` (`gestor_titular`),
  KEY `fb_order_elemento_despesa_INDEX` (`elemento_despesa`),
  KEY `fb_order_no_reserva_INDEX` (`no_reserva`(10)),
  KEY `fb_order_data_reserva_INDEX` (`data_reserva`),
  KEY `fb_order_unidade_requisitante_INDEX` (`unidade_requisitante`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_bens_materiais`
--

DROP TABLE IF EXISTS `pat_bens_materiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_bens_materiais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `c1` int DEFAULT NULL,
  `nrtomboantigo` int DEFAULT NULL,
  `sgunges` int DEFAULT NULL,
  `idunidorc` int DEFAULT NULL,
  `dsunor` int DEFAULT NULL,
  `sigla` int DEFAULT NULL,
  `conta` int DEFAULT NULL,
  `icsitfinbempat` int DEFAULT NULL,
  `icsitbempat` int DEFAULT NULL,
  `idveiculo_cpn` int DEFAULT NULL,
  `idbempat_cpn` int DEFAULT NULL,
  `idbempat_dmb` int DEFAULT NULL,
  `idbempat` int DEFAULT NULL,
  `Almoxarifado` int DEFAULT NULL,
  `Modalidade` int DEFAULT NULL,
  `NomeFornecedor` int DEFAULT NULL,
  `DescricaoMaterial` int DEFAULT NULL,
  `NomeDoador` int DEFAULT NULL,
  `DataLiberacaoUso` datetime DEFAULT NULL,
  `DescricaodoBem` int DEFAULT NULL,
  `DataDocto` datetime DEFAULT NULL,
  `NroSerieDocto` int DEFAULT NULL,
  `EstadoConservacao` int DEFAULT NULL,
  `FormaAquisicao` int DEFAULT NULL,
  `VidaUtil` int DEFAULT NULL,
  `DataAquisicao` datetime DEFAULT NULL,
  `DataSituacaoFinanc` datetime DEFAULT NULL,
  `SituacaoFinanc` int DEFAULT NULL,
  `DatadaSituacao` datetime DEFAULT NULL,
  `ValorAquisicao` int DEFAULT NULL,
  `SituacaodoBem` int DEFAULT NULL,
  `ClasseBem` int DEFAULT NULL,
  `CodMaterial` int DEFAULT NULL,
  `NroTombo` int DEFAULT NULL,
  `idmaterial` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pat_veiculos`
--

DROP TABLE IF EXISTS `pat_veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pat_veiculos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ped_fases`
--

DROP TABLE IF EXISTS `ped_fases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ped_fases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `idSituacao` int DEFAULT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `id_itempedido` int DEFAULT NULL,
  `id_descricaoresumida` int DEFAULT NULL,
  `id_descricaodetalhada` int DEFAULT NULL,
  `quantidade` varchar(255) DEFAULT NULL,
  `id_termo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_idSituacao_INDEX` (`idSituacao`),
  KEY `fb_order_Descricao_INDEX` (`Descricao`(10)),
  KEY `fb_order_Usuario_INDEX` (`Usuario`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_id_pedido_INDEX` (`id_pedido`),
  KEY `fb_order_id_itempedido_INDEX` (`id_itempedido`),
  KEY `fb_order_id_descricaoresumida_INDEX` (`id_descricaoresumida`),
  KEY `fb_order_id_descricaodetalhada_INDEX` (`id_descricaodetalhada`),
  KEY `fb_order_quantidade_INDEX` (`quantidade`(10)),
  KEY `fb_order_id_termo_INDEX` (`id_termo`)
) ENGINE=InnoDB AUTO_INCREMENT=4257 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ped_itempedido`
--

DROP TABLE IF EXISTS `ped_itempedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ped_itempedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `idPedido` int DEFAULT NULL,
  `QuantidadeMaterial` int DEFAULT NULL,
  `ObservacaoItem` text,
  `QuantidadeMaterialAtendida` int DEFAULT NULL,
  `material` int DEFAULT NULL,
  `DescricaoDetalhada` int DEFAULT NULL,
  `data_validacao` datetime DEFAULT NULL,
  `situacao` int DEFAULT NULL,
  `justificativa` text,
  `validado_por` int DEFAULT NULL,
  `data_cancelado` datetime DEFAULT NULL,
  `cancelado_por` int DEFAULT NULL,
  `quantidade_validada` varchar(255) DEFAULT NULL,
  `valor_material` decimal(21,10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_idPedido_INDEX` (`idPedido`),
  KEY `fb_order_ObservacaoItem_INDEX` (`ObservacaoItem`(10)),
  KEY `fb_order_QuantidadeMaterialAtendida_INDEX` (`QuantidadeMaterialAtendida`),
  KEY `fb_order_DescricaoDetalhada_INDEX` (`DescricaoDetalhada`),
  KEY `fb_order_material_INDEX` (`material`),
  KEY `fb_order_data_validacao_INDEX` (`data_validacao`),
  KEY `fb_order_situacao_INDEX` (`situacao`),
  KEY `fb_order_justificativa_INDEX` (`justificativa`(10)),
  KEY `fb_order_validado_por_INDEX` (`validado_por`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_quantidade_validada_INDEX` (`quantidade_validada`(10)),
  KEY `fb_order_QuantidadeMaterial_INDEX` (`QuantidadeMaterial`)
) ENGINE=InnoDB AUTO_INCREMENT=229271 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ped_pedidos`
--

DROP TABLE IF EXISTS `ped_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ped_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `Solicitante` int DEFAULT NULL,
  `UnidadeJudiciaria` int DEFAULT NULL,
  `Setor` int DEFAULT NULL,
  `Observacao` text,
  `DataTermino` datetime DEFAULT NULL,
  `ResponsavelAtendimento` int DEFAULT NULL,
  `idSituacao` int DEFAULT NULL,
  `num_protocolo` varchar(255) DEFAULT NULL,
  `arquivo` text,
  `justificativa` text,
  `setor_responsavel` int DEFAULT NULL,
  `ComplementoSetor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_Solicitante_INDEX` (`Solicitante`),
  KEY `fb_order_UnidadeJudiciaria_INDEX` (`UnidadeJudiciaria`),
  KEY `fb_order_Setor_INDEX` (`Setor`),
  KEY `fb_order_DataTermino_INDEX` (`DataTermino`),
  KEY `fb_order_ResponsavelAtendimento_INDEX` (`ResponsavelAtendimento`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_idSituacao_INDEX` (`idSituacao`),
  KEY `fb_order_num_protocolo_INDEX` (`num_protocolo`),
  KEY `fb_order_arquivo_INDEX` (`arquivo`(10)),
  KEY `fb_order_Observacao_INDEX` (`Observacao`(10)),
  KEY `fb_order_ComplementoSetor_INDEX` (`ComplementoSetor`),
  CONSTRAINT `ped_pedidos_ibfk_1` FOREIGN KEY (`Solicitante`) REFERENCES `jos_users` (`id`),
  CONSTRAINT `ped_pedidos_ibfk_2` FOREIGN KEY (`ResponsavelAtendimento`) REFERENCES `jos_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38847 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ped_situacao`
--

DROP TABLE IF EXISTS `ped_situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ped_situacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_Descricao_INDEX` (`Descricao`(10)),
  KEY `fb_order_Usuario_INDEX` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pel_pontoeletronico`
--

DROP TABLE IF EXISTS `pel_pontoeletronico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pel_pontoeletronico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_tipohora` int DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `entrada` varchar(255) DEFAULT NULL,
  `saida` varchar(255) DEFAULT NULL,
  `observacao` text,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_id_tipohora_INDEX` (`id_tipohora`),
  KEY `fb_order_data_INDEX` (`data`),
  KEY `fb_order_entrada_INDEX` (`entrada`(10)),
  KEY `fb_order_saida_INDEX` (`saida`(10)),
  KEY `fb_order_observacao_INDEX` (`observacao`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_id_usuario_INDEX` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pel_tipohoras`
--

DROP TABLE IF EXISTS `pel_tipohoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pel_tipohoras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_date_time_INDEX` (`date_time`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_analiseswot`
--

DROP TABLE IF EXISTS `pla_analiseswot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_analiseswot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `texto` text,
  `fatores` text,
  `ambiente` text,
  `setor_responsavel` int DEFAULT NULL,
  `quadrante` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_titulo_INDEX` (`titulo`(10)),
  KEY `fb_order_texto_INDEX` (`texto`(10)),
  KEY `fb_order_setor_responsavel_INDEX` (`setor_responsavel`),
  KEY `fb_order_ambiente_INDEX` (`ambiente`(10)),
  KEY `fb_order_fatores_INDEX` (`fatores`(10)),
  KEY `fb_order_quadrante_INDEX` (`quadrante`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_bensservicos`
--

DROP TABLE IF EXISTS `pla_bensservicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_bensservicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_planocontratacao` int DEFAULT NULL,
  `id_naturezadespesa` int DEFAULT NULL,
  `id_planoorcamentario` int DEFAULT NULL,
  `id_etapa` int DEFAULT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `classificacao` varchar(50) DEFAULT NULL,
  `prioridade` varchar(50) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `valor1` decimal(20,6) DEFAULT NULL,
  `valor2` decimal(20,6) DEFAULT NULL,
  `valor_final` decimal(20,6) DEFAULT NULL,
  `justificativa` varchar(500) DEFAULT NULL,
  `data_estimada` date DEFAULT NULL,
  `renovacao_contrato` varchar(50) DEFAULT NULL,
  `sus_acess` varchar(50) DEFAULT NULL,
  `valor1_executado` decimal(20,6) DEFAULT NULL,
  `valor2_executado` decimal(20,6) DEFAULT NULL,
  `valor_final_executado` decimal(20,6) DEFAULT NULL,
  `quantidade_executada` int DEFAULT NULL,
  `data_executada` date DEFAULT NULL,
  `num_processo_sei` varchar(255) DEFAULT NULL,
  `obj_estrategico` int DEFAULT NULL,
  `ini_estrategica` int DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pla_bensservicos_id_naturezadespesa_mat_produtos` (`id_naturezadespesa`) USING BTREE,
  KEY `FK_pla_bensservicos_id_planoorcamentario_mat_planocontas` (`id_planoorcamentario`) USING BTREE,
  KEY `FK_pla_benservicos_id_etapa_ped_situacao` (`id_etapa`) USING BTREE,
  KEY `FK_pla_bensservicos_id_planocontratacao` (`id_planocontratacao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_estrategico`
--

DROP TABLE IF EXISTS `pla_estrategico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_estrategico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `setor_responsavel` int DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `missao` text,
  `visao` text,
  `valores` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_setor_responsavel_INDEX` (`setor_responsavel`),
  KEY `fb_order_periodo_INDEX` (`periodo`(10)),
  KEY `fb_order_missao_INDEX` (`missao`(10)),
  KEY `fb_order_visao_INDEX` (`visao`(10)),
  KEY `fb_order_valores_INDEX` (`valores`(10))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_historico`
--

DROP TABLE IF EXISTS `pla_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_historico` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_planocontratacao` int DEFAULT '0',
  `id_etapa` int DEFAULT '0',
  `id_usuario` int DEFAULT '0',
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pla_historico_id_usuario_jos_users` (`id_usuario`) USING BTREE,
  KEY `FK_pla_historico_id_etapa_ped_situacao` (`id_etapa`) USING BTREE,
  KEY `FK_pla_historico_id_planocontratacao` (`id_planocontratacao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_iniciativas`
--

DROP TABLE IF EXISTS `pla_iniciativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_iniciativas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `objetivo` int DEFAULT NULL,
  `iniciativa` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_codigo_INDEX` (`codigo`(10)),
  KEY `fb_order_objetivo_INDEX` (`objetivo`),
  KEY `fb_order_iniciativa_INDEX` (`iniciativa`(10))
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_limite`
--

DROP TABLE IF EXISTS `pla_limite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_limite` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_setor` int DEFAULT NULL,
  `limite` decimal(20,6) unsigned DEFAULT NULL,
  `ano_limite` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pla_limite_id_setor_mat_setores_id` (`id_setor`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_macrodesafios`
--

DROP TABLE IF EXISTS `pla_macrodesafios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_macrodesafios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `macrodesafios` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_macrodesafios_INDEX` (`macrodesafios`(10))
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_modelonegocioblocos`
--

DROP TABLE IF EXISTS `pla_modelonegocioblocos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_modelonegocioblocos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `texto` text,
  `cor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_texto_INDEX` (`texto`(10)),
  KEY `fb_order_cor_INDEX` (`cor`(10))
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_modelonegocios`
--

DROP TABLE IF EXISTS `pla_modelonegocios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_modelonegocios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `bloco` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `texto` text,
  `setor_responsavel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_bloco_INDEX` (`bloco`),
  KEY `fb_order_titulo_INDEX` (`titulo`(10)),
  KEY `fb_order_texto_INDEX` (`texto`(10)),
  KEY `fb_order_setor_responsavel_INDEX` (`setor_responsavel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_objetivos`
--

DROP TABLE IF EXISTS `pla_objetivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_objetivos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `planejamento` int DEFAULT NULL,
  `perspectiva` int DEFAULT NULL,
  `objetivo` text,
  `texto_complementar` text,
  `temas` int DEFAULT NULL,
  `macrodesafio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_planejamento_INDEX` (`planejamento`),
  KEY `fb_order_perspectiva_INDEX` (`perspectiva`),
  KEY `fb_order_objetivo_INDEX` (`objetivo`(10)),
  KEY `fb_order_texto_complementar_INDEX` (`texto_complementar`(10)),
  KEY `fb_order_temas_INDEX` (`temas`),
  KEY `fb_order_macrodesafio_INDEX` (`macrodesafio`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_objetivos_repeat_temas`
--

DROP TABLE IF EXISTS `pla_objetivos_repeat_temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_objetivos_repeat_temas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `temas` int DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `fb_parent_fk_parent_id_INDEX` (`parent_id`),
  KEY `fb_repeat_el_temas_INDEX` (`temas`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_perspectivas`
--

DROP TABLE IF EXISTS `pla_perspectivas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_perspectivas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `perspectivas` varchar(255) DEFAULT NULL,
  `cor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_perspectivas_INDEX` (`perspectivas`(10)),
  KEY `fb_order_cor_INDEX` (`cor`(10))
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_planocontratacao`
--

DROP TABLE IF EXISTS `pla_planocontratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_planocontratacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_solicitante` int DEFAULT NULL,
  `id_etapa` int DEFAULT NULL,
  `secretaria_ou_assessoria` int DEFAULT NULL,
  `cd_coordenadoria` int DEFAULT NULL,
  `secretaria_assessoria` varchar(50) DEFAULT NULL,
  `coordenadoria` varchar(50) DEFAULT NULL,
  `classificacao` varchar(50) DEFAULT NULL,
  `comentario_adm` varchar(2000) DEFAULT NULL,
  `preco_total` double DEFAULT NULL,
  `ano_execucao` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pla_planocontratacao_id_solicitante_jos_users` (`id_solicitante`) USING BTREE,
  KEY `FK_pla_planocontratacao_id_etapa_ped_situacao` (`id_etapa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pla_temas`
--

DROP TABLE IF EXISTS `pla_temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla_temas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `tema` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_tema_INDEX` (`tema`(10))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_designaafasta`
--

DROP TABLE IF EXISTS `pre_designaafasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_designaafasta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `tipo` text,
  `motivo` int DEFAULT NULL,
  `vara` int DEFAULT NULL,
  `inicio` datetime DEFAULT NULL,
  `termino` datetime DEFAULT NULL,
  `observacao` text,
  `atualizado_por` int DEFAULT NULL,
  `magistrado` int DEFAULT NULL,
  `substituicao` int DEFAULT NULL,
  `processo_sei` varchar(255) DEFAULT NULL,
  `vinculo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_motivo_INDEX` (`motivo`),
  KEY `fb_order_vara_INDEX` (`vara`),
  KEY `fb_order_inicio_INDEX` (`inicio`),
  KEY `fb_order_termino_INDEX` (`termino`),
  KEY `fb_order_observacao_INDEX` (`observacao`(10)),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_magistrado_INDEX` (`magistrado`),
  KEY `fb_order_tipo_INDEX` (`tipo`(10)),
  KEY `fb_order_processo_sei_INDEX` (`processo_sei`(10)),
  KEY `fb_order_substituicao_INDEX` (`substituicao`)
) ENGINE=MyISAM AUTO_INCREMENT=18775 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_magistrados`
--

DROP TABLE IF EXISTS `pre_magistrados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_magistrados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `telefone_residencial` varchar(255) DEFAULT NULL,
  `telefone_celular` varchar(255) DEFAULT NULL,
  `telefone_comercial` varchar(255) DEFAULT NULL,
  `foto` text,
  `email` varchar(255) DEFAULT NULL,
  `ativo` text,
  `cargo` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_matricula_INDEX` (`matricula`),
  KEY `fb_order_nome_INDEX` (`nome`(10)),
  KEY `fb_order_cpf_INDEX` (`cpf`(10)),
  KEY `fb_order_telefone_residencial_INDEX` (`telefone_residencial`(10)),
  KEY `fb_order_telefone_celular_INDEX` (`telefone_celular`(10)),
  KEY `fb_order_telefone_comercial_INDEX` (`telefone_comercial`(10)),
  KEY `fb_order_foto_INDEX` (`foto`(10)),
  KEY `fb_order_email_INDEX` (`email`(10)),
  KEY `fb_order_cargo_INDEX` (`cargo`(10))
) ENGINE=MyISAM AUTO_INCREMENT=558 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_magistrados_repeat_foto`
--

DROP TABLE IF EXISTS `pre_magistrados_repeat_foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_magistrados_repeat_foto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `foto` text,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `fb_parent_fk_parent_id_INDEX` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_notificacao`
--

DROP TABLE IF EXISTS `pre_notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_notificacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `motivo` int DEFAULT NULL,
  `designaafasta` int DEFAULT NULL,
  `vara` int DEFAULT NULL,
  `magistrado` int DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `oficio` varchar(255) DEFAULT NULL,
  `dias` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_designaafasta_INDEX` (`designaafasta`),
  KEY `fb_order_motivo_INDEX` (`motivo`),
  KEY `fb_order_vara_INDEX` (`vara`),
  KEY `fb_order_magistrado_INDEX` (`magistrado`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`),
  KEY `fb_order_oficio_INDEX` (`oficio`(10)),
  KEY `fb_order_dias_INDEX` (`dias`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_substituicao`
--

DROP TABLE IF EXISTS `pre_substituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_substituicao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `comarca_origem` int DEFAULT NULL,
  `vara_origem` int DEFAULT NULL,
  `comarca_destino` int DEFAULT NULL,
  `vara_destino` int DEFAULT NULL,
  `observacao` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_comarca_origem_INDEX` (`comarca_origem`),
  KEY `fb_order_vara_origem_INDEX` (`vara_origem`),
  KEY `fb_order_comarca_destino_INDEX` (`comarca_destino`),
  KEY `fb_order_vara_destino_INDEX` (`vara_destino`),
  KEY `fb_order_observacao_INDEX` (`observacao`(10))
) ENGINE=MyISAM AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_tabela`
--

DROP TABLE IF EXISTS `pre_tabela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_tabela` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `tabelarh` text,
  `codigorh` int DEFAULT NULL,
  `ativo` text,
  `cor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10)),
  KEY `fb_order_codigorh_INDEX` (`codigorh`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_tabelarh_INDEX` (`tabelarh`(10)),
  KEY `fb_order_cor_INDEX` (`cor`(10))
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pro_cotacao`
--

DROP TABLE IF EXISTS `pro_cotacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_cotacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `processo_no` int DEFAULT NULL,
  `item` int DEFAULT NULL,
  `fornecedor` int DEFAULT NULL,
  `valor_cotado` decimal(13,2) DEFAULT NULL,
  `data_cotacao` datetime DEFAULT NULL,
  `responsavel` int DEFAULT NULL,
  `fonte` text,
  `situacao` int DEFAULT NULL,
  `complemento` text,
  PRIMARY KEY (`id`),
  KEY `fb_order_processo_no_INDEX` (`processo_no`),
  KEY `fb_order_item_INDEX` (`item`),
  KEY `fb_order_fornecedor_INDEX` (`fornecedor`),
  KEY `fb_order_data_cotacao_INDEX` (`data_cotacao`),
  KEY `fb_order_responsavel_INDEX` (`responsavel`),
  KEY `fb_order_situacao_INDEX` (`situacao`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_complemento_INDEX` (`complemento`(10))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pro_materiais`
--

DROP TABLE IF EXISTS `pro_materiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_materiais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `processo` int DEFAULT NULL,
  `material` int DEFAULT NULL,
  `qtde_min` decimal(13,2) DEFAULT NULL,
  `qtde_max` decimal(13,2) DEFAULT NULL,
  `preco` decimal(13,2) DEFAULT NULL,
  `saldo_atual` decimal(13,2) DEFAULT NULL,
  `atualizado_por` int DEFAULT NULL,
  `lote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_date_time_INDEX` (`date_time`),
  KEY `fb_order_processo_INDEX` (`processo`),
  KEY `fb_order_material_INDEX` (`material`),
  KEY `fb_order_qtde_max_INDEX` (`qtde_max`),
  KEY `fb_order_atualizado_por_INDEX` (`atualizado_por`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `real_users`
--

DROP TABLE IF EXISTS `real_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `real_users` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `situacao` tinyint NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tabela com a relação de usuários replicados da tabela controle.usuar do ORACLE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_alteracaotermocontratual`
--

DROP TABLE IF EXISTS `tce_alteracaotermocontratual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_alteracaotermocontratual` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `numeroinstrumentocontrataco` varchar(16) DEFAULT NULL,
  `anoinstrumentocontratacao` int DEFAULT NULL,
  `tipotermocontratualalteracao` text,
  `numerotermocontratualalteracao` varchar(16) DEFAULT NULL,
  `anotermocontratualalteracao` int DEFAULT NULL,
  `cpfsignatariocontratante` varchar(11) DEFAULT NULL,
  `nomesignatariocontratante` varchar(200) DEFAULT NULL,
  `tipoidentificacaosignatariocontratado` text,
  `numeroidentificacaosignatariocontratado` varchar(14) DEFAULT NULL,
  `nomesignatariocontratado` varchar(200) DEFAULT NULL,
  `regimeexecucaoalterado` varchar(255) DEFAULT NULL,
  `tipopagamentoalterado` varchar(255) DEFAULT NULL,
  `descricaotipopagamentoalterado` varchar(250) DEFAULT NULL,
  `modoexecucaofornecimentoalterado` varchar(255) DEFAULT NULL,
  `descricaomodoexecucaofornecimentoalterado` varchar(250) DEFAULT NULL,
  `dataassinaturatermocontratual` datetime DEFAULT NULL,
  `datapublicacaoresumotermocontratual` datetime DEFAULT NULL,
  `veiculodivulgacaotermocontratual` varchar(255) DEFAULT NULL,
  `descricaoveiculotermocontratual` varchar(250) DEFAULT NULL,
  `urlpublicacaotermocontratual` varchar(255) DEFAULT NULL,
  `prorrogacaoprazovigencia` int DEFAULT NULL,
  `iniciovigenciacontratoalterado` datetime DEFAULT NULL,
  `fimvigenciacontratoalterado` datetime DEFAULT NULL,
  `previsaoinicioexecucaoalterado` datetime DEFAULT NULL,
  `previsaofimexecucaoalterado` datetime DEFAULT NULL,
  `modalidadegarantiaalterada` varchar(255) DEFAULT NULL,
  `percentualgarantiaalterado` decimal(16,2) DEFAULT NULL,
  `valorgarantiaalterado` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_atribuicaomembrocomissao`
--

DROP TABLE IF EXISTS `tce_atribuicaomembrocomissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_atribuicaomembrocomissao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_atribuicaorepresentante`
--

DROP TABLE IF EXISTS `tce_atribuicaorepresentante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_atribuicaorepresentante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_avaliacaopropostaitem`
--

DROP TABLE IF EXISTS `tce_avaliacaopropostaitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_avaliacaopropostaitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `numeroidentificacaolicitante` varchar(14) DEFAULT NULL,
  `codigoitem` int DEFAULT NULL,
  `gtin` int DEFAULT NULL,
  `descricaoitem` varchar(250) DEFAULT NULL,
  `quantidadeitem` decimal(16,2) DEFAULT NULL,
  `unidademedida` varchar(255) DEFAULT NULL,
  `descricaounidademedida` varchar(250) DEFAULT NULL,
  `valorunitarioitemproposta` decimal(16,2) DEFAULT NULL,
  `valortotalitemproposta` decimal(16,2) DEFAULT NULL,
  `valorunitarioitemfinal` decimal(16,2) DEFAULT NULL,
  `valortotalitemfinal` decimal(16,2) DEFAULT NULL,
  `bdi` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_avaliacaopropostalote`
--

DROP TABLE IF EXISTS `tce_avaliacaopropostalote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_avaliacaopropostalote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `numeroidentificacaolicitante` varchar(14) DEFAULT NULL,
  `valorpropostalote` decimal(16,2) DEFAULT NULL,
  `valorfinallote` decimal(16,2) DEFAULT NULL,
  `pontuacaopropostatecnica` decimal(16,2) DEFAULT NULL,
  `tipoempate` text,
  `reducaoproposta` text,
  `classificacao` int DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_comissao`
--

DROP TABLE IF EXISTS `tce_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_comissao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `codigocomissao` int DEFAULT NULL,
  `tipocomissao` varchar(255) DEFAULT NULL,
  `descricaocomissao` varchar(250) DEFAULT NULL,
  `tipoatodesignacao` varchar(255) DEFAULT NULL,
  `descricaoatodesignacao` varchar(250) DEFAULT NULL,
  `numeroatodesignacao` varchar(16) DEFAULT NULL,
  `anoatodesignacao` int DEFAULT NULL,
  `datapublicacaoatodesignacao` datetime DEFAULT NULL,
  `veiculopublicacaoatodesignacao` varchar(255) DEFAULT NULL,
  `descricaoveiculopublicacao` varchar(250) DEFAULT NULL,
  `urlpublicacaoatodesignacao` varchar(255) DEFAULT NULL,
  `iniciovigenciadesignacao` datetime DEFAULT NULL,
  `fimvigenciadesignacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_consorciados`
--

DROP TABLE IF EXISTS `tce_consorciados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_consorciados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `numeroidentificacaolicitante` varchar(14) DEFAULT NULL,
  `nomeconsorciado` varchar(250) DEFAULT NULL,
  `cnpjconsorciado` varchar(14) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_contratacao`
--

DROP TABLE IF EXISTS `tce_contratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_contratacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `urledital` varchar(255) DEFAULT NULL,
  `datapublicacaoedital` datetime DEFAULT NULL,
  `veiculopublicacaoedital` varchar(255) DEFAULT NULL,
  `descricaoveiculoedital` varchar(250) DEFAULT NULL,
  `urlpublicacaoedital` varchar(255) DEFAULT NULL,
  `dataaberturalicitacao` datetime DEFAULT NULL,
  `horaaberturalicitacao` varchar(5) DEFAULT NULL,
  `localaberturalicitacao` varchar(250) DEFAULT NULL,
  `editalrepublicado` text,
  `justificativarepublicacao` text,
  `numeroprocessoadministrativocontratacao` varchar(255) DEFAULT NULL,
  `anoprocessoadministrativocontratacao` int DEFAULT NULL,
  `dataautuacaoprocessoadministrativocontratacao` datetime DEFAULT NULL,
  `objetocontratacao` varchar(255) DEFAULT NULL,
  `justificativanecessidadecontratacao` text,
  `remanescenteparcelaoutracontratacao` text,
  `identificacaocontratacaoremanescente` varchar(10) DEFAULT NULL,
  `naturezacontratacao` varchar(255) DEFAULT NULL,
  `tipocontratacao` varchar(255) DEFAULT NULL,
  `subtipocontratacao` varchar(255) DEFAULT NULL,
  `modalidadelicitacao` varchar(255) DEFAULT NULL,
  `tipolicitacao` varchar(255) DEFAULT NULL,
  `valortotallicitacao` decimal(16,2) DEFAULT NULL,
  `valorizacaominimapropostatecnica` decimal(16,2) DEFAULT NULL,
  `fixaxaoprecomaximo` decimal(16,2) DEFAULT NULL,
  `pesotecnica` decimal(16,2) DEFAULT NULL,
  `pesopreco` decimal(16,2) DEFAULT NULL,
  `prequalificacao` text,
  `numeroprocessoprequalificacao` varchar(255) DEFAULT NULL,
  `anoprocessoprequalificacao` int DEFAULT NULL,
  `baselegalprequalificacao` varchar(250) DEFAULT NULL,
  `inversaofases` text,
  `baselegalinversaofases` varchar(250) DEFAULT NULL,
  `prazovigencia` int DEFAULT NULL,
  `prazoexecucao` int DEFAULT NULL,
  `anoprevisaofinalizacaocontratacao` int DEFAULT NULL,
  `regimeexecucao` varchar(255) DEFAULT NULL,
  `modoexecucaofornecimento` varchar(255) DEFAULT NULL,
  `descricaomodoexecucaofornecimento` varchar(250) DEFAULT NULL,
  `descricaolocalexecucaofornecimento` text,
  `nomearquivolocalexecucaofornecimento` varchar(255) DEFAULT NULL,
  `serviconaturezacontinua` text,
  `admiteconsorcioempresa` text,
  `limiteconsorciados` int DEFAULT NULL,
  `admitesubcontratacao` text,
  `admiteadesoes` text,
  `limiteadesoes` int DEFAULT NULL,
  `previsaoeditalquantitativoadesao` text,
  `audienciapublica` text,
  `licenciamentoambiental` text,
  `instrumentocontratacao` varchar(255) DEFAULT NULL,
  `tipointervencao` text,
  `dimensaoobraservico` decimal(16,2) DEFAULT NULL,
  `tipoprojeto` text,
  `numeroregistrobemimovel` varchar(10) DEFAULT NULL,
  `descricaobemimovel` text,
  `tiporesponsabilidadetecnicaprojeto` text,
  `numeroresponsabilidadetecnica` varchar(20) DEFAULT NULL,
  `urlresponsabilidadetecnica` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_criterioavaliacao`
--

DROP TABLE IF EXISTS `tce_criterioavaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_criterioavaliacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_cronogramaalterado`
--

DROP TABLE IF EXISTS `tce_cronogramaalterado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_cronogramaalterado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anotermocontratualalteracao` varchar(11) DEFAULT NULL,
  `numerotermocontratualalteracao` varchar(11) DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `valor` varchar(30) DEFAULT NULL,
  `identificacaoperiodoevento` varchar(30) DEFAULT NULL,
  `periodicidadeevento` varchar(30) DEFAULT NULL,
  `atividade` varchar(30) DEFAULT NULL,
  `nomearquivocronogramafesicofinanceiro` varchar(30) DEFAULT NULL,
  `versao` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_cronogramacontrato`
--

DROP TABLE IF EXISTS `tce_cronogramacontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_cronogramacontrato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(255) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(16) DEFAULT NULL,
  `anoinstrumentocontratacao` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `nomearquivocronogramafesicofinanceiro` varchar(30) DEFAULT NULL,
  `atividade` varchar(100) DEFAULT NULL,
  `periodicidadeevento` varchar(50) DEFAULT NULL,
  `identificacaoperiodoevento` varchar(50) DEFAULT NULL,
  `valor` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_cronogramaedital`
--

DROP TABLE IF EXISTS `tce_cronogramaedital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_cronogramaedital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `nomearquivocronogramafisicofinanceiro` varchar(255) DEFAULT NULL,
  `atividade` varchar(100) DEFAULT NULL,
  `periodicidadeevento` varchar(50) DEFAULT NULL,
  `identificacaoperiodoevento` varchar(50) DEFAULT NULL,
  `valor` decimal(16,2) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_cronogramapropostalote`
--

DROP TABLE IF EXISTS `tce_cronogramapropostalote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_cronogramapropostalote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `numeroidentificacaolicitante` varchar(14) DEFAULT NULL,
  `nomearquivocronogramafisicofinanceiro` varchar(30) DEFAULT NULL,
  `atividade` varchar(100) DEFAULT NULL,
  `periodicidadeevento` varchar(50) DEFAULT NULL,
  `identificacaoperiodoevento` varchar(50) DEFAULT NULL,
  `valor` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_empenho`
--

DROP TABLE IF EXISTS `tce_empenho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_empenho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `anoempenho` varchar(11) DEFAULT NULL,
  `numeroempenho` varchar(11) DEFAULT NULL,
  `ugempenho` varchar(11) DEFAULT NULL,
  `valorempenho` decimal(16,2) DEFAULT NULL,
  `dataemissaoempenho` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_empenhomedicao`
--

DROP TABLE IF EXISTS `tce_empenhomedicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_empenhomedicao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anomedicao` varchar(11) DEFAULT NULL,
  `numeromedicao` varchar(11) DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `ugempenho` varchar(11) DEFAULT NULL,
  `numeroempenho` varchar(8) DEFAULT NULL,
  `anoempenho` int DEFAULT NULL,
  `valorliquidadoempenho` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_fases`
--

DROP TABLE IF EXISTS `tce_fases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_fases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_order_descricao_INDEX` (`descricao`(10))
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_fiscalgestor`
--

DROP TABLE IF EXISTS `tce_fiscalgestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_fiscalgestor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `nmeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `unidadeadministrativa` varchar(250) DEFAULT NULL,
  `tipoidentificacaofiscalgestor` text,
  `numeroidentificacaofiscalgestor` varchar(14) DEFAULT NULL,
  `nomefiscalgestor` varchar(250) DEFAULT NULL,
  `naturezacargofiscalgestor` varchar(255) DEFAULT NULL,
  `descricaonaturezacargo` varchar(250) DEFAULT NULL,
  `formacaoespecializacao` varchar(250) DEFAULT NULL,
  `tipofiscalgestor` varchar(255) DEFAULT NULL,
  `descricaotipofiscalgestor` varchar(250) DEFAULT NULL,
  `tipoatodesignacao` varchar(255) DEFAULT NULL,
  `descricaoatodesignacao` varchar(250) DEFAULT NULL,
  `numeroatodesignacao` varchar(16) DEFAULT NULL,
  `anoatodesignacao` int DEFAULT NULL,
  `datapublicacaoatodesignacao` datetime DEFAULT NULL,
  `veiculopublicacaoatodesignacao` varchar(255) DEFAULT NULL,
  `descricaoveiculo` varchar(250) DEFAULT NULL,
  `urlpublicacaoatodesignacao` varchar(255) DEFAULT NULL,
  `iniciovigenciadesignacao` datetime DEFAULT NULL,
  `fimvigenciadesignacao` datetime DEFAULT NULL,
  `art_rrtfiscalgestor` varchar(20) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_fontepesquisa`
--

DROP TABLE IF EXISTS `tce_fontepesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_fontepesquisa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_fornecedorespesquisa`
--

DROP TABLE IF EXISTS `tce_fornecedorespesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_fornecedorespesquisa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigoitem` int DEFAULT NULL,
  `nomefornecedor` varchar(250) DEFAULT NULL,
  `cnpjcpffornecedor` varchar(14) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_instrumentocontratual`
--

DROP TABLE IF EXISTS `tce_instrumentocontratual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_instrumentocontratual` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `tipoinstrumentocontratacao` varchar(255) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(16) DEFAULT NULL,
  `anoinstrumentocontratacao` int DEFAULT NULL,
  `urlinstrumentocontratacao` varchar(255) DEFAULT NULL,
  `numeroprocessoadministrativocontratacao` varchar(16) DEFAULT NULL,
  `anoprocessoadministrativo` int DEFAULT NULL,
  `tipocontratacao` varchar(255) DEFAULT NULL,
  `subtipocontratacao` varchar(255) DEFAULT NULL,
  `valortotalcontratacao` decimal(16,2) DEFAULT NULL,
  `cpfsignatariocontratante` varchar(11) DEFAULT NULL,
  `nomesignatariocontratante` varchar(200) DEFAULT NULL,
  `cargosignatariocontratante` varchar(250) DEFAULT NULL,
  `naturezacargosignatariocontratante` varchar(255) DEFAULT NULL,
  `descricaocargosignatariocontratante` varchar(250) DEFAULT NULL,
  `tipoidentificacaocontratado` text,
  `numeroidentificacaocontratado` varchar(14) DEFAULT NULL,
  `nomecontratado` varchar(200) DEFAULT NULL,
  `tipoidentificacaosignatariocontratado` text,
  `numeroidentificacaosignatariocontratado` varchar(14) DEFAULT NULL,
  `regimeexecucao` varchar(255) DEFAULT NULL,
  `tipopagamento` varchar(255) DEFAULT NULL,
  `descricaotipopagamento` varchar(250) DEFAULT NULL,
  `criterioavaliacao` varchar(255) DEFAULT NULL,
  `descricaocriterioavaliacao` varchar(250) DEFAULT NULL,
  `modoexecucaofornecimento` varchar(255) DEFAULT NULL,
  `descricaomodoexecucaofornecimento` varchar(250) DEFAULT NULL,
  `serviconaturezacontinua` text,
  `prorrogavel` text,
  `indicereajuste` varchar(250) DEFAULT NULL,
  `database` varchar(7) DEFAULT NULL,
  `descricaolocalexecucaofornecimento` text,
  `nomearquivolocalexecucaofornecimento` varchar(30) DEFAULT NULL,
  `admitesubcontratacao` text,
  `dataassinaturainstrumentocontratacao` datetime DEFAULT NULL,
  `datapublicacaoresumoinstrumentocontratacao` datetime DEFAULT NULL,
  `veiculopublicacaoinstrumentocontratacao` varchar(255) DEFAULT NULL,
  `descricaoveiculopublicacaoinstrumentocontratacao` varchar(250) DEFAULT NULL,
  `urldepublicacaoinstrumentocontratacao` varchar(255) DEFAULT NULL,
  `prazovigencia` int DEFAULT NULL,
  `iniciovigenciacontrato` datetime DEFAULT NULL,
  `fimvigenciacontrato` datetime DEFAULT NULL,
  `garantiacontratual` text,
  `modalidadegarantia` varchar(255) DEFAULT NULL,
  `percentualgarantia` decimal(16,2) DEFAULT NULL,
  `valorgarantia` decimal(16,2) DEFAULT NULL,
  `dataapresentacaogarantia` datetime DEFAULT NULL,
  `informacoesgarantia` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_itemalterado`
--

DROP TABLE IF EXISTS `tce_itemalterado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_itemalterado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anotermocontratualalteracao` varchar(11) DEFAULT NULL,
  `numerotermocontratualalteracao` varchar(11) DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `tabelareferencial` varchar(255) DEFAULT NULL,
  `unidademedida` varchar(255) DEFAULT NULL,
  `codigoitem` int DEFAULT NULL,
  `indicecorrecao` int DEFAULT NULL,
  `bdi` int DEFAULT NULL,
  `valortotalitem` int DEFAULT NULL,
  `valorunitarioitem` int DEFAULT NULL,
  `descricaounidademedida` int DEFAULT NULL,
  `quantidadeitem` int DEFAULT NULL,
  `gtin` int DEFAULT NULL,
  `databasetabela` datetime DEFAULT NULL,
  `tipoalteracao` text,
  `valoracrescido` decimal(16,2) DEFAULT NULL,
  `valordecrescido` decimal(16,2) DEFAULT NULL,
  `percentualreajuste` decimal(16,2) DEFAULT NULL,
  `descricaoitem` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_itemcontratado`
--

DROP TABLE IF EXISTS `tce_itemcontratado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_itemcontratado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(16) DEFAULT NULL,
  `anoinstrumentocontratacao` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `codigoitem` int DEFAULT NULL,
  `gtin` int DEFAULT NULL,
  `descricaoitem` varchar(250) DEFAULT NULL,
  `quantidadeitem` decimal(16,2) DEFAULT NULL,
  `unidademedida` varchar(255) DEFAULT NULL,
  `descricaounidademedida` varchar(250) DEFAULT NULL,
  `valorunitarioitem` decimal(16,2) DEFAULT NULL,
  `valortotalitem` decimal(16,2) DEFAULT NULL,
  `tabelareferencial` varchar(255) DEFAULT NULL,
  `databasetabela` datetime DEFAULT NULL,
  `bdi` decimal(16,2) DEFAULT NULL,
  `indicecorrecao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_itemedital`
--

DROP TABLE IF EXISTS `tce_itemedital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_itemedital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `codigoitem` int DEFAULT NULL,
  `descricaoitem` varchar(250) DEFAULT NULL,
  `quantidadeitem` decimal(16,2) DEFAULT NULL,
  `unidademedida` varchar(255) DEFAULT NULL,
  `descricaounidademedida` varchar(250) DEFAULT NULL,
  `quantitativominimo` decimal(16,2) DEFAULT NULL,
  `quantitativomaximo` decimal(16,2) DEFAULT NULL,
  `valorunitarioitem` decimal(16,2) DEFAULT NULL,
  `valortotalitem` decimal(16,2) DEFAULT NULL,
  `valoraceitabilidadeitem` text,
  `itemamostra` text,
  `bdi` decimal(16,2) DEFAULT NULL,
  `indicecorrecao` varchar(250) DEFAULT NULL,
  `quantitativoautorizadoadesao` decimal(16,2) DEFAULT NULL,
  `objetopadronizado` text,
  `numeroprocessopadronizacao` varchar(255) DEFAULT NULL,
  `anoprocessopadronizacao` int DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_itemmedido`
--

DROP TABLE IF EXISTS `tce_itemmedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_itemmedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `numeromedicao` varchar(11) DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `anomedicao` int DEFAULT NULL,
  `numeroliquidacao` varchar(8) DEFAULT NULL,
  `anoliquidacao` int DEFAULT NULL,
  `codigoitem` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `valorunitarioitem` decimal(16,2) DEFAULT NULL,
  `quantidadeexecutadaitem` decimal(16,2) DEFAULT NULL,
  `quantidadeacumuladaitem` decimal(16,2) DEFAULT NULL,
  `valortotalmedidoitem` decimal(16,2) DEFAULT NULL,
  `valortotalsubcontratadoitem` decimal(16,2) DEFAULT NULL,
  `nomearquivoimagemmedicao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_leiloeirocontratado`
--

DROP TABLE IF EXISTS `tce_leiloeirocontratado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_leiloeirocontratado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `numeroprocessoadministrativo` varchar(16) DEFAULT NULL,
  `anoprocessoadministrativo` int DEFAULT NULL,
  `dataautuacaoprocessoadministrativo` datetime DEFAULT NULL,
  `tipoatodesignacao` varchar(255) DEFAULT NULL,
  `descricaoatodesignacao` varchar(250) DEFAULT NULL,
  `numeroatodesignacao` varchar(16) DEFAULT NULL,
  `anoatodesignacao` int DEFAULT NULL,
  `datapublicacaoatodesignacao` datetime DEFAULT NULL,
  `veiculopublicacaoatodesignacao` varchar(255) DEFAULT NULL,
  `descricaoveiculopublicacaoatodesignacao` varchar(250) DEFAULT NULL,
  `urlpublicacaoatodesignacao` varchar(255) DEFAULT NULL,
  `iniciovigenciadesignacao` datetime DEFAULT NULL,
  `fimvigenciadesignacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_licitante`
--

DROP TABLE IF EXISTS `tce_licitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_licitante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` int DEFAULT NULL,
  `tipoidentificacaolicitante` text,
  `numeroidentificacaolicitante` varchar(14) DEFAULT NULL,
  `nomelicitante` varchar(200) DEFAULT NULL,
  `tipoempresa` varchar(255) DEFAULT NULL,
  `descricaoempresa` varchar(250) DEFAULT NULL,
  `convidadoconvite` text,
  `participanteconvite` text,
  `consorcioempresas` text,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_licitantesimpedidos`
--

DROP TABLE IF EXISTS `tce_licitantesimpedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_licitantesimpedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `numeroidentificacaolicitante` varchar(14) DEFAULT NULL,
  `tipoimpedimento` text,
  `justificativaimpedimento` text,
  `baselegalimpedimento` varchar(250) DEFAULT NULL,
  `referenciaeditalimpedimento` varchar(250) DEFAULT NULL,
  `veiculopublicacaoimpedimento` varchar(255) DEFAULT NULL,
  `descricaoveiculopublicacaoimpedimento` varchar(250) DEFAULT NULL,
  `urldocumentoimpedimento` varchar(255) DEFAULT NULL,
  `datapublicacaoimpedimento` datetime DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_lotealterado`
--

DROP TABLE IF EXISTS `tce_lotealterado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_lotealterado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `valortotallote` varchar(11) DEFAULT NULL,
  `descricaoloteetapa` varchar(11) DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numerotermocontratualalteracao` varchar(16) DEFAULT NULL,
  `anotermocontratualalteracao` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_lotecontratado`
--

DROP TABLE IF EXISTS `tce_lotecontratado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_lotecontratado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(16) DEFAULT NULL,
  `anoinstrumentocontratacao` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `descricaoloteetapa` varchar(250) DEFAULT NULL,
  `valortotallote` decimal(16,2) DEFAULT NULL,
  `classificacaolicitacao` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_loteedital`
--

DROP TABLE IF EXISTS `tce_loteedital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_loteedital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `cdigoloteetapa` int DEFAULT NULL,
  `descricaoloteetapa` varchar(255) DEFAULT NULL,
  `valortotallote` decimal(16,2) DEFAULT NULL,
  `beneficioslc123` text,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_matrizresponsaveiscontratacao`
--

DROP TABLE IF EXISTS `tce_matrizresponsaveiscontratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_matrizresponsaveiscontratacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `tipoato` varchar(255) DEFAULT NULL,
  `dataato` datetime DEFAULT NULL,
  `nomeresponsavelato` varchar(200) DEFAULT NULL,
  `cpfresponsavelato` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` int DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_matrizresponsavellicitacao`
--

DROP TABLE IF EXISTS `tce_matrizresponsavellicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_matrizresponsavellicitacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `tipoato` varchar(255) DEFAULT NULL,
  `dataato` datetime DEFAULT NULL,
  `nomeresponsavel` varchar(200) DEFAULT NULL,
  `cpfresponsavelato` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_medicao`
--

DROP TABLE IF EXISTS `tce_medicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_medicao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeromedicao` int DEFAULT NULL,
  `anomedicao` int DEFAULT NULL,
  `datainiciomedicao` datetime DEFAULT NULL,
  `datafimmedicao` datetime DEFAULT NULL,
  `dataateste` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_membroscomissao`
--

DROP TABLE IF EXISTS `tce_membroscomissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_membroscomissao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `codigocomissao` int DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `nomemembro` varchar(200) DEFAULT NULL,
  `atribuicaomembro` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(250) DEFAULT NULL,
  `naturezacargo` varchar(255) DEFAULT NULL,
  `descricaonaturezacargo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_modalidadegarantiacontratual`
--

DROP TABLE IF EXISTS `tce_modalidadegarantiacontratual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_modalidadegarantiacontratual` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_modalidadelicitacao`
--

DROP TABLE IF EXISTS `tce_modalidadelicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_modalidadelicitacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_modoexecucao`
--

DROP TABLE IF EXISTS `tce_modoexecucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_modoexecucao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_naturezacargo`
--

DROP TABLE IF EXISTS `tce_naturezacargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_naturezacargo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_naturezacontratacao`
--

DROP TABLE IF EXISTS `tce_naturezacontratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_naturezacontratacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_notafiscal`
--

DROP TABLE IF EXISTS `tce_notafiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_notafiscal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_objetoalteracaotermocontratual`
--

DROP TABLE IF EXISTS `tce_objetoalteracaotermocontratual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_objetoalteracaotermocontratual` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontrataco` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numerotermocontratualalteracao` varchar(16) DEFAULT NULL,
  `anotermocontratualalteracao` int DEFAULT NULL,
  `objetotermocontratualalteracao` varchar(255) DEFAULT NULL,
  `justificativaalteracao` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_objetotermocontratualalt`
--

DROP TABLE IF EXISTS `tce_objetotermocontratualalt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_objetotermocontratualalt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_orcamentoug`
--

DROP TABLE IF EXISTS `tce_orcamentoug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_orcamentoug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `unidadegestora` varchar(11) DEFAULT NULL,
  `dotacaoorcamentaria` varchar(33) DEFAULT NULL,
  `valor` decimal(16,2) DEFAULT NULL,
  `recursoconvenio` text,
  `descricaoconvenio` varchar(250) DEFAULT NULL,
  `identificacaocontratacao` int DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_ordemexecucaoservicofornec`
--

DROP TABLE IF EXISTS `tce_ordemexecucaoservicofornec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_ordemexecucaoservicofornec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroordemexecucaoservico` varchar(8) DEFAULT NULL,
  `dataordemexecucaoservico` datetime DEFAULT NULL,
  `prazoexecucaoservico` int DEFAULT NULL,
  `previsaoinicioexecucaoservico` datetime DEFAULT NULL,
  `previsaofimexecucaoservico` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_ordemservicofornecimentomedicao`
--

DROP TABLE IF EXISTS `tce_ordemservicofornecimentomedicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_ordemservicofornecimentomedicao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anomedicao` varchar(11) DEFAULT NULL,
  `numeromedicao` varchar(11) DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroordemexecucaoservico` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_origemocorrenciasancao`
--

DROP TABLE IF EXISTS `tce_origemocorrenciasancao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_origemocorrenciasancao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_pagamentomedicao`
--

DROP TABLE IF EXISTS `tce_pagamentomedicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_pagamentomedicao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_pesquisamercado`
--

DROP TABLE IF EXISTS `tce_pesquisamercado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_pesquisamercado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigoitem` int DEFAULT NULL,
  `fontepesquisa` varchar(255) DEFAULT NULL,
  `descricaofonte` varchar(250) DEFAULT NULL,
  `tabelareferencial` varchar(255) DEFAULT NULL,
  `databasefontepesquisa` datetime DEFAULT NULL,
  `meepp` text,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_regimeexecucao`
--

DROP TABLE IF EXISTS `tce_regimeexecucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_regimeexecucao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_representanteprocurador`
--

DROP TABLE IF EXISTS `tce_representanteprocurador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_representanteprocurador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `numeroidentificacaolicitante` varchar(14) DEFAULT NULL,
  `tipoidentificacaorepresentanteprocurador` text,
  `numeroidentificacaorepresentanteprocurador` varchar(14) DEFAULT NULL,
  `nomerepresentanteprocurador` varchar(250) DEFAULT NULL,
  `atribuicaorepresentanteprocurador` varchar(255) DEFAULT NULL,
  `descricaoatribuicaorepresentanteprocurador` varchar(250) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_requisitohabilita`
--

DROP TABLE IF EXISTS `tce_requisitohabilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_requisitohabilita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `tipohabilitacao` varchar(255) DEFAULT NULL,
  `especificacaohabilitacao` varchar(255) DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_resultadolicitacao`
--

DROP TABLE IF EXISTS `tce_resultadolicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_resultadolicitacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `numeroedital` varchar(16) DEFAULT NULL,
  `anoedital` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `situacaoloteetapa` text,
  `numeroidentificacaolicitantevencedor` varchar(14) DEFAULT NULL,
  `nomelicitantevencedor` varchar(200) DEFAULT NULL,
  `datadeclaracaopropostavencedora` datetime DEFAULT NULL,
  `veiculodivulgacaoresultado` varchar(255) DEFAULT NULL,
  `descricaoveiculodivulgacaoresultado` varchar(250) DEFAULT NULL,
  `urldivulgacaoresultado` varchar(255) DEFAULT NULL,
  `datapublicacaoresultado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_situacaoinstrumentocontratacao`
--

DROP TABLE IF EXISTS `tce_situacaoinstrumentocontratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_situacaoinstrumentocontratacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_situacaolote`
--

DROP TABLE IF EXISTS `tce_situacaolote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_situacaolote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_subcontratacaoitem`
--

DROP TABLE IF EXISTS `tce_subcontratacaoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_subcontratacaoitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `anoliquidacao` varchar(11) DEFAULT NULL,
  `numeroliquidacao` varchar(11) DEFAULT NULL,
  `anomedicao` varchar(11) DEFAULT NULL,
  `numeromedicao` varchar(11) DEFAULT NULL,
  `anoinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `numeroinstrumentocontratacao` varchar(11) DEFAULT NULL,
  `anoedital` varchar(11) DEFAULT NULL,
  `numeroedital` varchar(11) DEFAULT NULL,
  `unidadegestoragerenciadora` varchar(11) DEFAULT NULL,
  `codigoitem` int DEFAULT NULL,
  `codigoloteetapa` int DEFAULT NULL,
  `identificacaocontratacao` varchar(10) DEFAULT NULL,
  `tipoidentificacaosubcontratado` text,
  `numeroidentificacaosubcontratado` varchar(14) DEFAULT NULL,
  `nomesubcontratado` varchar(200) DEFAULT NULL,
  `quantidadeexecutadaitemsubcontratado` decimal(16,2) DEFAULT NULL,
  `valorexecutadoitemsubcontratado` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_subtipocontratacao`
--

DROP TABLE IF EXISTS `tce_subtipocontratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_subtipocontratacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tabelareferencial`
--

DROP TABLE IF EXISTS `tce_tabelareferencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tabelareferencial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipoato`
--

DROP TABLE IF EXISTS `tce_tipoato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipoato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipoatodesignacao`
--

DROP TABLE IF EXISTS `tce_tipoatodesignacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipoatodesignacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipocomissaolicitacao`
--

DROP TABLE IF EXISTS `tce_tipocomissaolicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipocomissaolicitacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipocontratacao`
--

DROP TABLE IF EXISTS `tce_tipocontratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipocontratacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipoempresa`
--

DROP TABLE IF EXISTS `tce_tipoempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipoempresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipofiscalgestor`
--

DROP TABLE IF EXISTS `tce_tipofiscalgestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipofiscalgestor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipohabilitacao`
--

DROP TABLE IF EXISTS `tce_tipohabilitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipohabilitacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `qualificacao` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipoinstrumento`
--

DROP TABLE IF EXISTS `tce_tipoinstrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipoinstrumento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipolicitacao`
--

DROP TABLE IF EXISTS `tce_tipolicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipolicitacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipoocorrencia`
--

DROP TABLE IF EXISTS `tce_tipoocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipoocorrencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tipopagamento`
--

DROP TABLE IF EXISTS `tce_tipopagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tipopagamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_tiposancao`
--

DROP TABLE IF EXISTS `tce_tiposancao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_tiposancao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_unidademedida`
--

DROP TABLE IF EXISTS `tce_unidademedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_unidademedida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tce_veiculopublicacao`
--

DROP TABLE IF EXISTS `tce_veiculopublicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tce_veiculopublicacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'egap'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-07 13:01:30
