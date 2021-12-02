-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Dez-2021 às 14:10
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `glaycon`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

CREATE TABLE `cidades` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cidades`
--

INSERT INTO `cidades` (`id`, `codigo`, `nome`, `estado`) VALUES
(1, 16000, 'Rio do Sul', 1),
(2, 15567, 'AgronÃ´mica', 1),
(3, 12234, 'Santa Maria', 2),
(7, 421234, 'Brusque', 1),
(16, 89170000, 'Laurentino', 1),
(18, 8917000, 'Laureba', 1),
(19, 1, 'asdasf', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `sigla` varchar(2) NOT NULL,
  `nome` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estados`
--

INSERT INTO `estados` (`id`, `sigla`, `nome`) VALUES
(1, 'SC', 'Santa Catarina'),
(2, 'RS', 'Rio Grande do Sul'),
(3, 'SP', 'São Paulo'),
(4, 'PR', 'Paraná');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `classe` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`id`, `endereco`, `classe`, `descricao`, `ordem`) VALUES
(1, '?modulo=pessoas&pagina=cadastro', 'btn btn-info mx-2 mt-2', 'Cad.Pessoa', 3),
(2, '?modulo=pessoas&pagina=listagem', 'btn btn-info mx-2 mt-2', 'Pessoas', 2),
(3, '?', 'btn btn-danger mx-2 mt-2', 'Home', 1),
(4, '?modulo=estados&pagina=listagem', 'btn btn-info mx-2 mt-2', 'Estados', 3),
(5, '?modulo=cidades&pagina=listagem', 'btn btn-info mx-2 mt-2', 'Cidades', 4),
(6, '?modulo=cidades&pagina=cadastro', 'btn btn-info mx-2 mt-2', 'Cad.Cidade', 5),
(7, '?modulo=produtos&pagina=cadastro', 'btn btn-info mx-2 mt-2', 'Cad.Produto', 7),
(9, '?modulo=produtos&pagina=listagem', 'btn btn-info mx-2 mt-2', 'Produtos', 6),
(10, '?modulo=estados&pagina=cadastro', 'btn btn-info mx-2 mt-2', 'Cad.Estados', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`) VALUES
(2, 'Marcondes'),
(3, 'aaa'),
(4, 'Glaycon Francisco Chirolli');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `nome` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`nome`, `marca`, `valor`) VALUES
('asd', 'bbb', '7.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `login` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `login`, `email`, `nome`, `password`) VALUES
(1, 'marcondes', 'marcondesmacaneiro@gmail.com', 'Marcondes Maçaneiro', 'e10adc3949ba59abbe56e057f20f883e'),
(3, 'glaycon', 'glayconchirolli@live.com', 'Glaycon Chirolli', '*A00D6EEF76EC509DB66358D2E6685F8FF7A4C3DD'),
(8, 'glayconf', 'glayconchirolli@live.com', 'Glaycon Chirolli', 'teste'),
(11, 'Glayconc', 'glayconchirolli@live.com', 'Glaycon Francisco Chirolli', 'i???H?NM?>(???{'),
(12, 'GlayconA', 'glayconchirolli@live.com', 'Glaycon Francisco Chirolli', '$2y$10$m36tzlPPazcEO/qMrx6eOuPGEnHgDU2MEHknY7.sZeGrwOF0hbL4W'),
(13, 'aaa', 'gaonsod@gmail.com', 'asinha', ' ,?b?Y[?K-#Kp');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `estado` (`estado`);

--
-- Índices para tabela `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sigla` (`sigla`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_endereco_uindex` (`endereco`);

--
-- Índices para tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_login_uindex` (`login`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidades`
--
ALTER TABLE `cidades`
  ADD CONSTRAINT `cidades_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
