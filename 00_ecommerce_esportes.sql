-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2021 at 03:53 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `00_ecommerce_esportes`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrador`
--

CREATE TABLE `administrador` (
  `CPF` int(11) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Sobrenome` varchar(60) NOT NULL,
  `Data_nasc` date NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Senha` varchar(60) NOT NULL,
  `Tel` int(11) NOT NULL,
  `Sexo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrador`
--

INSERT INTO `administrador` (`CPF`, `Nome`, `Sobrenome`, `Data_nasc`, `Email`, `Senha`, `Tel`, `Sexo`) VALUES
(225441, 'Anderson ', 'Oliveira', '2011-09-08', 'ander.ol@gmail.com', 'anderson123', 1932214556, 'Masculino');

-- --------------------------------------------------------

--
-- Table structure for table `boleto`
--

CREATE TABLE `boleto` (
  `Cod_bol` int(11) NOT NULL,
  `Cod_barra` int(11) NOT NULL,
  `Data_vencimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `boleto`
--

INSERT INTO `boleto` (`Cod_bol`, `Cod_barra`, `Data_vencimento`) VALUES
(1, 33448877, '2021-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `carrinho`
--

CREATE TABLE `carrinho` (
  `Cod_prod` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Cod_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carrinho`
--

INSERT INTO `carrinho` (`Cod_prod`, `Quantidade`, `Cod_compra`) VALUES
(1, 2, 1),
(3, 1, 2),
(2, 2, 3),
(4, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cartao_de_credito`
--

CREATE TABLE `cartao_de_credito` (
  `Cod_cred` int(11) NOT NULL,
  `Nome_cartao` varchar(60) NOT NULL,
  `Num_cartao` int(11) NOT NULL,
  `Cod_seguranca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cartao_de_credito`
--

INSERT INTO `cartao_de_credito` (`Cod_cred`, `Nome_cartao`, `Num_cartao`, `Cod_seguranca`) VALUES
(1, 'RODRIGO BARBOSA', 456789321, 666);

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `Cod_categ` int(11) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`Cod_categ`, `Nome`, `Descricao`) VALUES
(1, 'Roupas', 'Roupas e vestimentas diversas'),
(2, 'Bolas', 'Bolas esportivas'),
(3, 'Calçados', 'Calçados diversos'),
(4, 'Acessórios', 'Acessórios para diversos esportes');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `CPF` int(11) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Sobrenome` varchar(60) NOT NULL,
  `No_casa` int(11) NOT NULL,
  `Complemento` varchar(60) DEFAULT NULL,
  `Data_nasc` date NOT NULL,
  `CEP` int(11) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Senha` varchar(60) NOT NULL,
  `Tel` int(11) NOT NULL,
  `Sexo` varchar(60) NOT NULL,
  `Saldo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`CPF`, `Nome`, `Sobrenome`, `No_casa`, `Complemento`, `Data_nasc`, `CEP`, `Email`, `Senha`, `Tel`, `Sexo`, `Saldo`) VALUES
(123321234, 'Valeria', 'Da Silva', 1234, NULL, '2012-09-05', 332112, 'val.silv@hotmail.com', 'valeria123', 1932246775, 'Feminino', NULL),
(321234876, 'Rodrigo', 'Barbosa', 3321, 'Ap 26', '2013-04-16', 34532154, 'rods.bar@gmail.com', 'rodrigo123', 1933245598, 'Masculino', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `compra`
--

CREATE TABLE `compra` (
  `Cod_compra` int(11) NOT NULL,
  `Data_compra` date NOT NULL,
  `Valor_total` float NOT NULL,
  `Cod_pag` int(11) NOT NULL,
  `Cod_rast` int(11) NOT NULL,
  `CPF_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compra`
--

INSERT INTO `compra` (`Cod_compra`, `Data_compra`, `Valor_total`, `Cod_pag`, `Cod_rast`, `CPF_cliente`) VALUES
(1, '2021-09-12', 799.98, 1, 1, 123321234),
(2, '2021-09-12', 399.99, 2, 2, 123321234),
(3, '2021-04-03', 1599.97, 3, 3, 321234876);

-- --------------------------------------------------------

--
-- Table structure for table `garantia`
--

CREATE TABLE `garantia` (
  `Cod_gar` int(11) NOT NULL,
  `Descricao` varchar(60) NOT NULL,
  `Duracao` varchar(60) NOT NULL,
  `Valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `garantia`
--

INSERT INTO `garantia` (`Cod_gar`, `Descricao`, `Duracao`, `Valor`) VALUES
(1, 'Bolas e Acessórios', '2 anos', 399.99),
(2, 'Vestimentas e Calçados', '1 ano', 599.99);

-- --------------------------------------------------------

--
-- Table structure for table `pagamento`
--

CREATE TABLE `pagamento` (
  `Cod_pag` int(11) NOT NULL,
  `Metodo` varchar(60) NOT NULL,
  `CNPJ_banco` int(11) NOT NULL,
  `Total_pag` float NOT NULL,
  `Cod_bol` int(11) DEFAULT NULL,
  `Cod_cred` int(11) DEFAULT NULL,
  `Cod_pix` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pagamento`
--

INSERT INTO `pagamento` (`Cod_pag`, `Metodo`, `CNPJ_banco`, `Total_pag`, `Cod_bol`, `Cod_cred`, `Cod_pix`) VALUES
(1, 'Boleto', 33215543, 799.98, 1, NULL, NULL),
(2, 'Pix', 33215543, 599.99, NULL, NULL, 1),
(3, 'Cartão de Crédito', 665466723, 1599.97, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pix`
--

CREATE TABLE `pix` (
  `Cod_pix` int(11) NOT NULL,
  `Chave` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pix`
--

INSERT INTO `pix` (`Cod_pix`, `Chave`) VALUES
(1, 'valeria2000');

-- --------------------------------------------------------

--
-- Table structure for table `produto`
--

CREATE TABLE `produto` (
  `Cod_prod` int(11) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descricao` varchar(60) NOT NULL,
  `Cor` varchar(60) DEFAULT NULL,
  `Tamanho` varchar(60) DEFAULT NULL,
  `Cod_categ` int(11) NOT NULL,
  `Preco` float NOT NULL,
  `Cod_gar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produto`
--

INSERT INTO `produto` (`Cod_prod`, `Nome`, `Descricao`, `Cor`, `Tamanho`, `Cod_categ`, `Preco`, `Cod_gar`) VALUES
(1, 'Bola de Basquete', 'Bola do Chicago Bulls', 'Marrom', 'Padrão', 2, 399.99, 1),
(2, 'Camisa do São Paulo', 'Camisa do time do São Paulo', 'Vermelha', 'G', 1, 599.99, 2),
(3, 'Tênis de basquete', 'Linha do Lebron James', 'Azul', '42', 3, 599.99, 2),
(4, 'Kit Taco de Golf', 'Tacos de golf com mochila incluso', 'Preto', 'Padrão', 4, 399.99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rastreio_compra`
--

CREATE TABLE `rastreio_compra` (
  `Cod_rast` int(11) NOT NULL,
  `CNPJ_transp` int(11) NOT NULL,
  `Estado_do_rastreio` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rastreio_compra`
--

INSERT INTO `rastreio_compra` (`Cod_rast`, `CNPJ_transp`, `Estado_do_rastreio`) VALUES
(1, 33410098, 'Em transporte'),
(2, 33410098, 'Produto em separação de envio'),
(3, 446750997, 'Produto entregue');

-- --------------------------------------------------------

--
-- Table structure for table `sist_bancario`
--

CREATE TABLE `sist_bancario` (
  `CNPJ` int(11) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `CPF_Admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sist_bancario`
--

INSERT INTO `sist_bancario` (`CNPJ`, `Nome`, `CPF_Admin`) VALUES
(33215543, 'Santander', 225441),
(665466723, 'Nubank', 225441);

-- --------------------------------------------------------

--
-- Table structure for table `transportadora`
--

CREATE TABLE `transportadora` (
  `CNPJ` int(11) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descricao` varchar(60) NOT NULL,
  `CPF_Admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transportadora`
--

INSERT INTO `transportadora` (`CNPJ`, `Nome`, `Descricao`, `CPF_Admin`) VALUES
(33410098, 'Correios', 'Transportadora pública', 225441),
(446750997, 'Solon Express SA', 'Transportadora privada', 225441);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`CPF`);

--
-- Indexes for table `boleto`
--
ALTER TABLE `boleto`
  ADD PRIMARY KEY (`Cod_bol`);

--
-- Indexes for table `carrinho`
--
ALTER TABLE `carrinho`
  ADD KEY `FK_prod` (`Cod_prod`),
  ADD KEY `FK_compra` (`Cod_compra`);

--
-- Indexes for table `cartao_de_credito`
--
ALTER TABLE `cartao_de_credito`
  ADD PRIMARY KEY (`Cod_cred`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Cod_categ`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CPF`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`Cod_compra`),
  ADD KEY `FK_pag` (`Cod_pag`),
  ADD KEY `FK_rastreio` (`Cod_rast`),
  ADD KEY `FK_cliente` (`CPF_cliente`);

--
-- Indexes for table `garantia`
--
ALTER TABLE `garantia`
  ADD PRIMARY KEY (`Cod_gar`);

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`Cod_pag`),
  ADD KEY `FK_banco` (`CNPJ_banco`),
  ADD KEY `FK_boleto` (`Cod_bol`),
  ADD KEY `FK_credito` (`Cod_cred`),
  ADD KEY `FK_pix` (`Cod_pix`);

--
-- Indexes for table `pix`
--
ALTER TABLE `pix`
  ADD PRIMARY KEY (`Cod_pix`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Cod_prod`),
  ADD KEY `FK_categoria` (`Cod_categ`),
  ADD KEY `FK_farantia` (`Cod_gar`);

--
-- Indexes for table `rastreio_compra`
--
ALTER TABLE `rastreio_compra`
  ADD PRIMARY KEY (`Cod_rast`),
  ADD KEY `FK_transp` (`CNPJ_transp`);

--
-- Indexes for table `sist_bancario`
--
ALTER TABLE `sist_bancario`
  ADD PRIMARY KEY (`CNPJ`),
  ADD KEY `FK_admin` (`CPF_Admin`);

--
-- Indexes for table `transportadora`
--
ALTER TABLE `transportadora`
  ADD PRIMARY KEY (`CNPJ`),
  ADD KEY `FK_adm` (`CPF_Admin`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `FK_compra` FOREIGN KEY (`Cod_compra`) REFERENCES `compra` (`Cod_compra`),
  ADD CONSTRAINT `FK_prod` FOREIGN KEY (`Cod_prod`) REFERENCES `produto` (`Cod_prod`);

--
-- Constraints for table `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `FK_cliente` FOREIGN KEY (`CPF_cliente`) REFERENCES `cliente` (`CPF`),
  ADD CONSTRAINT `FK_pag` FOREIGN KEY (`Cod_pag`) REFERENCES `pagamento` (`Cod_pag`),
  ADD CONSTRAINT `FK_rastreio` FOREIGN KEY (`Cod_rast`) REFERENCES `rastreio_compra` (`Cod_rast`);

--
-- Constraints for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `FK_banco` FOREIGN KEY (`CNPJ_banco`) REFERENCES `sist_bancario` (`CNPJ`),
  ADD CONSTRAINT `FK_boleto` FOREIGN KEY (`Cod_bol`) REFERENCES `boleto` (`Cod_bol`),
  ADD CONSTRAINT `FK_credito` FOREIGN KEY (`Cod_cred`) REFERENCES `cartao_de_credito` (`Cod_cred`),
  ADD CONSTRAINT `FK_pix` FOREIGN KEY (`Cod_pix`) REFERENCES `pix` (`Cod_pix`);

--
-- Constraints for table `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `FK_categoria` FOREIGN KEY (`Cod_categ`) REFERENCES `categoria` (`Cod_categ`),
  ADD CONSTRAINT `FK_farantia` FOREIGN KEY (`Cod_gar`) REFERENCES `garantia` (`Cod_gar`);

--
-- Constraints for table `rastreio_compra`
--
ALTER TABLE `rastreio_compra`
  ADD CONSTRAINT `FK_transp` FOREIGN KEY (`CNPJ_transp`) REFERENCES `transportadora` (`CNPJ`);

--
-- Constraints for table `sist_bancario`
--
ALTER TABLE `sist_bancario`
  ADD CONSTRAINT `FK_admin` FOREIGN KEY (`CPF_Admin`) REFERENCES `administrador` (`CPF`);

--
-- Constraints for table `transportadora`
--
ALTER TABLE `transportadora`
  ADD CONSTRAINT `FK_adm` FOREIGN KEY (`CPF_Admin`) REFERENCES `administrador` (`CPF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
