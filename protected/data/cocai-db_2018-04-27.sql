-- phpMyAdmin SQL Dump
-- version 4.4.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 27, 2018 at 09:23 PM
-- Server version: 5.5.44
-- PHP Version: 5.4.42

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cocai`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `cedula` varchar(45) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `ubicacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `combo`
--

CREATE TABLE `combo` (
  `id` int(11) NOT NULL,
  `codigo_padre` varchar(45) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `submodelo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `referencia_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `direccion`
--

INSERT INTO `direccion` (`id`, `nombre`, `padre_id`, `referencia_id`) VALUES
(1, 'Distrito Capital', NULL, 2),
(2, 'Miranda', NULL, 2),
(3, 'Vargas', NULL, 2),
(4, 'Libertador', 1, 3),
(5, 'Acevedo', 2, 3),
(6, 'Andres Bello', 2, 3),
(7, 'Baruta', 2, 3),
(8, 'Brion', 2, 3),
(9, 'Buroz', 2, 3),
(10, 'Carrizal', 2, 3),
(11, 'Chacao', 2, 3),
(12, 'Cristobal Rojas', 2, 3),
(13, 'El Hatillo', 2, 3),
(14, 'Guaicaipuro', 2, 3),
(15, 'Independencia', 2, 3),
(16, 'Lander', 2, 3),
(17, 'Los Salias', 2, 3),
(18, 'Paez', 2, 3),
(19, 'Paz Castillo', 2, 3),
(20, 'Pedro Gual', 2, 3),
(21, 'Plaza', 2, 3),
(22, 'Simon Bolivar', 2, 3),
(23, 'Sucre', 2, 3),
(24, 'Urdaneta', 2, 3),
(25, 'Zamora', 2, 3),
(26, 'Vargas', 3, 3),
(27, 'Altagracia', 4, 4),
(28, 'Candelaria', 4, 4),
(29, 'Catedral', 4, 4),
(30, 'La Pastora', 4, 4),
(31, 'San Agustin', 4, 4),
(32, 'San Jose', 4, 4),
(33, 'San Juan', 4, 4),
(34, 'Santa Rosalia', 4, 4),
(35, 'Santa Teresa', 4, 4),
(36, 'Sucre', 4, 4),
(37, '23 de Enero', 4, 4),
(38, 'Antimano', 4, 4),
(39, 'El Recreo', 4, 4),
(40, 'El Valle', 4, 4),
(41, 'La Vega', 4, 4),
(42, 'Macarao', 4, 4),
(43, 'Caricuao', 4, 4),
(44, 'El Junquito', 4, 4),
(45, 'Coche', 4, 4),
(46, 'San Pedro', 4, 4),
(47, 'San Bernardino', 4, 4),
(48, 'El Paraiso', 4, 4),
(49, 'Araguita', 5, 4),
(50, 'Arevalo Gonzalez', 5, 4),
(51, 'Capaya', 5, 4),
(52, 'Caucagua', 5, 4),
(53, 'Panaquire', 5, 4),
(54, 'Ribas', 5, 4),
(55, 'El Cafe', 5, 4),
(56, 'Marizapa', 5, 4),
(57, 'Cumbo', 6, 4),
(58, 'San Jose de Barlovento', 6, 4),
(59, 'El Cafetal', 7, 4),
(60, 'Las Minas', 7, 4),
(61, 'Nuestra Sra del Rosario', 7, 4),
(62, 'Higuerote', 8, 4),
(63, 'Curiepe', 8, 4),
(64, 'Tacarigua de Brion', 8, 4),
(65, 'Mamporal', 9, 4),
(66, 'Carrizal', 10, 4),
(67, 'Chacao Caracas', 11, 4),
(68, 'Charallave', 12, 4),
(69, 'Las Brisas', 12, 4),
(70, 'Hatillo Caracas', 13, 4),
(71, 'Altagracia de la Montania', 14, 4),
(72, 'Cecilio Acosta', 14, 4),
(73, 'Los Teques', 14, 4),
(74, 'El Jarillo', 14, 4),
(75, 'San Pedro', 14, 4),
(76, 'Tacata', 14, 4),
(77, 'Paracotos', 14, 4),
(78, 'Cartanal', 15, 4),
(79, 'Santa Teresa', 15, 4),
(80, 'La Democracia', 16, 4),
(81, 'Ocumare del Tuy', 16, 4),
(82, 'Santa Barbara', 16, 4),
(83, 'San Antonio de los Altos', 17, 4),
(84, 'Rio Chico', 18, 4),
(85, 'El Guapo', 18, 4),
(86, 'Tacarigua de la Laguna', 18, 4),
(87, 'Paparo', 18, 4),
(88, 'San Fernando del Guapo', 18, 4),
(89, 'Santa Lucia del Tuy', 19, 4),
(90, 'Cupira', 20, 4),
(91, 'Machurucuto', 20, 4),
(92, 'Guarenas', 21, 4),
(93, 'San Antonio de Yare', 22, 4),
(94, 'San Francisco de Yare', 22, 4),
(95, 'Leoncio Martinez', 23, 4),
(96, 'Caucaguita', 23, 4),
(97, 'Filas de Mariche', 23, 4),
(98, 'La Dolorita', 23, 4),
(99, 'Petare', 23, 4),
(100, 'Cua', 24, 4),
(101, 'Nueva Cua', 24, 4),
(102, 'Guatire', 25, 4),
(103, 'Bolivar', 25, 4),
(104, 'Caraballeda', 26, 4),
(105, 'Carayaca', 26, 4),
(106, 'Carlos Soublette', 26, 4),
(107, 'Caruao', 26, 4),
(108, 'Catia La Mar', 26, 4),
(109, 'El Junko', 26, 4),
(110, 'La Guaira', 26, 4),
(111, 'Macuto', 26, 4),
(112, 'Maiquetia', 26, 4),
(113, 'Naiguata', 26, 4),
(114, 'Urimare', 26, 4);

-- --------------------------------------------------------

--
-- Table structure for table `explosion`
--

CREATE TABLE `explosion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_ranking` date NOT NULL,
  `grupo` varchar(45) NOT NULL,
  `codigo_prod` varchar(20) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `monto` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `porcentaje_vta` decimal(19,4) DEFAULT '0.0000',
  `costo` decimal(19,4) DEFAULT '0.0000',
  `costo_total` decimal(19,4) DEFAULT '0.0000',
  `porcentaje_costo` decimal(19,4) DEFAULT '0.0000',
  `unidad_negocio_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `explosion`
--

INSERT INTO `explosion` (`id`, `fecha`, `fecha_ranking`, `grupo`, `codigo_prod`, `producto`, `cantidad`, `monto`, `porcentaje_vta`, `costo`, `costo_total`, `porcentaje_costo`, `unidad_negocio_id`) VALUES
(1, '2018-03-12', '2018-01-10', 'POSTRES', 'FPSAU9100001', 'Brownie', 2, '9607.1428', '100.0000', '0.0000', '0.0000', '0.0000', 1),
(2, '2018-03-12', '2018-01-10', 'BEBIDAS 16 Oz', 'FPSAU8300004', 'Pepsi Cola 16 Oz', 5, '13616.0715', '83.3300', '0.0000', '0.0000', '0.0000', 1),
(3, '2018-03-12', '2018-01-10', 'Alimentos', 'FPSE0001118', 'Ensalada Capresa', 2, '50000.0000', '70.0000', '0.0000', '0.0000', '0.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `num_factura` varchar(45) NOT NULL,
  `fecha_carga` date NOT NULL,
  `fecha_factura` date NOT NULL,
  `porcentaje_impuesto` int(11) NOT NULL DEFAULT '0',
  `impuesto_factura` decimal(19,4) DEFAULT '0.0000',
  `total_factura` decimal(19,4) NOT NULL DEFAULT '1.0000',
  `proveedor_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`id`, `num_factura`, `fecha_carga`, `fecha_factura`, `porcentaje_impuesto`, `impuesto_factura`, `total_factura`, `proveedor_id`, `unidad_negocio_id`) VALUES
(1, '2', '2018-04-18', '2018-04-18', 12, '260000.0000', '2340000.0000', 1, 1),
(2, '31', '2018-04-18', '2018-04-18', 0, '0.0000', '100000.0000', 5, 59),
(3, '3333', '2018-04-18', '2018-04-18', 0, '0.0000', '60.0000', 1, 59),
(4, '12321f', '2018-04-20', '2018-04-20', 0, '0.0000', '1000.0000', 1, 1),
(9, '123f', '2018-04-20', '2018-04-20', 0, '0.0000', '20000.0000', 1, 1),
(10, 'p21323', '2018-04-20', '2018-04-20', 0, '0.0000', '40000.0000', 1, 1),
(11, '321', '2018-04-20', '2018-04-20', 0, '0.0000', '200500.0000', 1, 1),
(12, 'pr2', '2018-04-20', '2018-04-20', 0, '0.0000', '4444600.0000', 1, 1),
(13, '321456', '2018-04-20', '2018-04-20', 0, '0.0000', '0.0000', 5, 1),
(14, '56789', '2018-04-20', '2018-04-20', 0, '0.0000', '200000.0000', 1, 1),
(15, '2389', '2018-04-20', '2018-04-20', 0, '0.0000', '100000.0000', 1, 1),
(16, '232', '2018-04-20', '2018-04-20', 0, '0.0000', '469046.0000', 1, 1),
(17, 'prueba f', '2018-04-20', '2018-04-19', 0, '0.0000', '3020000.0000', 5, 1),
(18, '10', '2018-04-20', '2018-04-18', 0, '0.0000', '2000.0000', 1, 1),
(19, '33', '2018-04-20', '2018-04-20', 0, '0.0000', '18000.0000', 5, 1),
(20, '211212', '2018-04-24', '2018-04-24', 0, '0.0000', '50.0000', 1, 505),
(21, '2404', '2018-04-24', '2018-04-24', 0, '0.0000', '50.0000', 1, 505),
(22, '2', '2018-04-24', '2018-04-24', 0, '0.0000', '50.0000', 1, 505);

-- --------------------------------------------------------

--
-- Table structure for table `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `ordenNum` varchar(45) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `recetaInactiva` tinyint(1) DEFAULT NULL,
  `subGrupo` varchar(100) DEFAULT NULL,
  `imagenProducto` text,
  `familia_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grupo`
--

INSERT INTO `grupo` (`id`, `ordenNum`, `codigo`, `nombre`, `recetaInactiva`, `subGrupo`, `imagenProducto`, `familia_id`) VALUES
(1, '3', NULL, 'PIZZAS 12', 0, NULL, NULL, 116),
(2, '4', NULL, 'PIZZAS 16', 0, NULL, NULL, 116),
(3, '1', NULL, 'POSTRES', 0, NULL, NULL, 116),
(4, '2', NULL, 'BEBIDAS 16 Oz', 0, NULL, NULL, 117),
(5, '5', NULL, 'Ensaladas', 0, NULL, NULL, 116),
(7, '13', NULL, 'ADICIONALES 8 - T', 0, NULL, NULL, 116),
(8, '16', NULL, 'ADICIONALES GRANDES -T', 0, NULL, NULL, 116),
(9, '15', NULL, 'ADICIONALES MEDIANOS -T', 0, NULL, NULL, 116),
(10, '14', NULL, 'ADICIONALES PEQUENOS -T', 0, NULL, NULL, 116),
(11, '8', NULL, 'BEBIDAS GRANDES - T', 0, NULL, NULL, 117),
(12, '7', NULL, 'BEBIDAS MEDIANAS - T', 0, NULL, NULL, 117),
(13, '6', NULL, 'BEBIDAS PEQUENAS - T', 0, NULL, NULL, 117),
(14, '12', NULL, 'CAFE - T', 1, NULL, NULL, 117),
(15, '24', NULL, 'ENSALADAS MIXTAS - T', 1, NULL, NULL, 116),
(16, '11', NULL, 'JUGOS - T', 1, NULL, NULL, 117),
(17, '17', NULL, 'PARA LLEVAR - T', 0, NULL, NULL, 143),
(18, '22', NULL, 'PASTAS - T', 1, NULL, NULL, 116),
(19, '1', NULL, 'PASTELITOS - T', 1, NULL, NULL, 116),
(20, '27', NULL, 'PIZZA && BEBIDAS PERSONAL - T', 0, NULL, NULL, 120),
(21, '2', NULL, 'PIZZAS 8 - T', 0, NULL, NULL, 116),
(22, '5', NULL, 'PIZZAS GRANDES - T', 0, NULL, NULL, 116),
(23, '4', NULL, 'PIZZAS MEDIANAS - T', 0, NULL, NULL, 116),
(24, '3', NULL, 'PIZZAS PEQUENAS - T', 0, NULL, NULL, 116),
(25, '25', NULL, 'POSTRES - T', 0, NULL, NULL, 116),
(26, '10', NULL, 'REFRESCOS BOMBA 600ML - T', 1, NULL, NULL, 117),
(27, '9', NULL, 'REFRESCOS LATA Y AGUAS - T', 0, NULL, NULL, 117),
(28, '18', NULL, 'SIN ADIC 8 - T', 0, NULL, NULL, 116),
(29, '21', NULL, 'SIN ADIC GR - T', 0, NULL, NULL, 116),
(30, '20', NULL, 'SIN ADIC MED - T', 0, NULL, NULL, 116),
(31, '19', NULL, 'SIN ADIC PEQ - T', 0, NULL, NULL, 116),
(32, '23', NULL, 'TIPO PASTA - T', 1, NULL, NULL, 116),
(36, '26', NULL, 'WRAP - T', 1, NULL, NULL, 116),
(37, '0', NULL, 'BEBIDAS 16 Oz - NM', 0, NULL, NULL, 117),
(38, '0', NULL, 'POSTRES-NM', 0, NULL, NULL, 116),
(81, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 117),
(86, '0', NULL, 'PASTELES', 0, NULL, NULL, 116),
(88, '0', NULL, 'PIZZAS 16', 0, NULL, NULL, 116),
(89, '0', NULL, 'ARTICOS', 0, NULL, NULL, 117),
(90, '0', NULL, 'SLICES 16', 0, NULL, NULL, 116),
(91, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 117),
(92, '0', NULL, 'POSTRES', 0, NULL, NULL, 116),
(93, '0', NULL, 'BEBIDAS PERSONAL', 0, NULL, NULL, 120),
(95, '0', NULL, 'CAFE', 0, NULL, NULL, 117),
(98, '0', NULL, 'DULCES FRIOS', 0, NULL, NULL, 116),
(99, '0', NULL, 'EXTRAS', 0, NULL, NULL, 116),
(100, '0', NULL, 'PASTELERIA DULCE', 0, NULL, NULL, 116),
(101, '0', NULL, 'PASTELERIA SALADA', 0, NULL, NULL, 116),
(102, '0', NULL, 'WAFFLES CLASICOS', 0, NULL, NULL, 116),
(103, '0', NULL, 'INFUSIONES', 0, NULL, NULL, 116),
(104, '0', NULL, 'COMBO LOKURA PIZZAS 16', 0, NULL, NULL, NULL),
(105, '0', NULL, 'COMBO PIZZAS 16', 0, NULL, NULL, NULL),
(107, '0', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 120),
(108, '0', NULL, 'PARA LLEVAR', 0, NULL, NULL, 143),
(111, '0', NULL, 'PROTEINA POTE', 1, NULL, NULL, 116),
(112, '0', NULL, 'PROTEINA POTE LIGHT', 1, NULL, NULL, 116),
(113, '1', NULL, 'BURROS', 0, NULL, NULL, 116),
(114, '8', NULL, 'EXTRAS', 0, NULL, NULL, 116),
(115, '3', NULL, 'POTE', 1, NULL, NULL, 119),
(116, '7', NULL, 'REFRESCO LATA Y AGUA', 0, NULL, NULL, 117),
(119, '9', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 120),
(120, '4', NULL, 'BEBIDAS GRANDES', 0, NULL, NULL, 117),
(121, '5', NULL, 'BEBIDAS MEDIANAS', 0, NULL, NULL, 117),
(122, '6', NULL, 'BEBIDAS PEQUENAS', 0, NULL, NULL, 117),
(123, '0', NULL, 'PROTEINA RICO BURRITO', 1, NULL, NULL, 116),
(124, '2', NULL, 'TAQUERIA', 0, NULL, NULL, 116),
(125, '0', NULL, 'OPCIONES CALIENTES', 1, NULL, NULL, NULL),
(126, '0', NULL, 'OPCIONES FRIAS', 1, NULL, NULL, NULL),
(127, '0', NULL, 'PLATOS', 0, NULL, NULL, 119),
(128, '0', '', 'INFUSIONES', 0, NULL, NULL, 116),
(145, '13', NULL, 'ADICIONALES 8 - R', 1, NULL, NULL, 116),
(146, '16', NULL, 'ADICIONALES GRANDES - R', 1, NULL, NULL, 116),
(147, '15', NULL, 'ADICIONALES MEDIANOS - R', 1, NULL, NULL, 116),
(148, '14', NULL, 'ADICIONALES PEQUENOS - R', 1, NULL, NULL, 116),
(149, '8', NULL, 'BEBIDAS GRANDES - R', 0, NULL, NULL, 117),
(150, '12', NULL, 'CAFE - R', 1, NULL, NULL, 117),
(151, '11', NULL, 'JUGOS - R', 1, NULL, NULL, 117),
(152, '17', NULL, 'PARA LLEVAR - R', 0, NULL, NULL, 143),
(158, '2', NULL, 'PIZZAS 8 - R', 1, NULL, NULL, 116),
(159, '5', NULL, 'PIZZAS GRANDES - R', 0, NULL, NULL, 116),
(160, '4', NULL, 'PIZZAS MEDIANAS - R', 1, NULL, NULL, 116),
(161, '3', NULL, 'PIZZAS PEQUENAS - R', 1, NULL, NULL, 116),
(162, '25', NULL, 'POSTRES - R', 0, NULL, NULL, 116),
(163, '10', NULL, 'REFRESCOS BOMBA 600ML - R', 1, NULL, NULL, 117),
(164, '9', NULL, 'REFRESCOS LATA Y AGUAS - R', 0, NULL, NULL, 117),
(165, '18', NULL, 'SIN ADIC 8 - R', 1, NULL, NULL, 116),
(166, '21', NULL, 'SIN ADIC GR - R', 1, NULL, NULL, 116),
(167, '20', NULL, 'SIN ADIC MED - R', 1, NULL, NULL, 116),
(168, '19', NULL, 'SIN ADIC PEQ - R', 1, NULL, NULL, 116),
(169, '7', NULL, 'BEBIDAS MEDIANAS - R', 0, NULL, NULL, 117),
(170, '6', NULL, 'BEBIDAS PEQUENAS - R', 0, NULL, NULL, 117),
(178, '27', NULL, 'PIZZA && BEBIDAS PERSONAL - R', 0, NULL, NULL, 120),
(179, '1', NULL, 'PASTELITOS - R', 0, NULL, NULL, 116),
(180, '9', NULL, 'ADICIONALES 12 -NM', 1, NULL, NULL, 116),
(181, '13', NULL, 'ADICIONALES 8 - T', 1, NULL, NULL, 116),
(182, '8', NULL, 'ADICIONALES 9 -NM', 1, NULL, NULL, 116),
(183, '16', NULL, 'ADICIONALES GRANDES -T', 1, NULL, NULL, 116),
(184, '9', NULL, 'ADICIONALES 12 ', 0, NULL, NULL, 116),
(185, '10', NULL, 'ADICIONALES 16', 0, NULL, NULL, 116),
(186, '10', NULL, 'ADICIONALES 16 -NM', 1, NULL, NULL, 116),
(187, '8', NULL, 'ADICIONALES 9 ', 0, NULL, NULL, 116),
(188, '14', NULL, 'ADICIONALES PEQUENOS -T', 1, NULL, NULL, 116),
(189, '15', NULL, 'ADICIONALES MEDIANOS -T', 1, NULL, NULL, 116),
(190, '24', NULL, 'ENSALADAS MIXTAS - T', 1, NULL, NULL, 116),
(191, '11', NULL, 'PARA LLEVAR ', 0, NULL, NULL, 143),
(192, '11', NULL, 'PARA LLEVAR - NM', 1, NULL, NULL, 143),
(193, '17', NULL, 'PARA LLEVAR - T', 1, NULL, NULL, 143),
(194, '22', NULL, 'PASTAS - T', 1, NULL, NULL, 116),
(195, '1', NULL, 'PASTELITOS', 1, NULL, NULL, 116),
(196, '1', NULL, 'PASTELITOS - T', 1, NULL, NULL, 116),
(197, '3', NULL, 'PIZZAS 12', 0, NULL, NULL, 116),
(198, '3', NULL, 'PIZZAS 12 - NM', 1, NULL, NULL, 116),
(199, '4', NULL, 'PIZZAS 16 ', 0, NULL, NULL, 116),
(200, '4', NULL, 'PIZZAS 16 - NM', 1, NULL, NULL, 116),
(201, '1', NULL, 'PIZZAS 7', 0, NULL, NULL, 116),
(202, '1', NULL, 'PIZZAS 7 - NM', 1, NULL, NULL, 116),
(203, '2', NULL, 'PIZZAS 8 - T', 1, NULL, NULL, 116),
(204, '2', NULL, 'PIZZAS 9', 0, NULL, NULL, 116),
(205, '2', NULL, 'PIZZAS 9 - NM', 1, NULL, NULL, 116),
(206, '5', NULL, 'PIZZAS GRANDES - T', 1, NULL, NULL, 116),
(207, '4', NULL, 'PIZZAS MEDIANAS - T', 1, NULL, NULL, 116),
(208, '12', NULL, 'POSTRES', 0, NULL, NULL, 116),
(209, '12', NULL, 'POSTRES - NM', 1, NULL, NULL, 116),
(210, '25', NULL, 'POSTRES - T', 1, NULL, NULL, 116),
(211, '16', NULL, 'SIN ADIC 12', 0, NULL, NULL, 116),
(212, '16', NULL, 'SIN ADIC 12 - NM', 1, NULL, NULL, 116),
(213, '15', NULL, 'SIN ADIC 16 ', 0, NULL, NULL, 116),
(214, '15', NULL, 'SIN ADIC 16 - NM', 1, NULL, NULL, 116),
(215, '13', NULL, 'SIN ADIC 7', 0, NULL, NULL, 116),
(216, '13', NULL, 'SIN ADIC 7 - NM', 1, NULL, NULL, 116),
(217, '18', NULL, 'SIN ADIC 8 - T', 1, NULL, NULL, 116),
(218, '14', NULL, 'SIN ADIC 9', 0, NULL, NULL, 116),
(219, '14', NULL, 'SIN ADIC 9 - NM', 1, NULL, NULL, 116),
(220, '21', NULL, 'SIN ADIC GR - T', 1, NULL, NULL, 116),
(221, '20', NULL, 'SIN ADIC MED - T', 1, NULL, NULL, 116),
(222, '19', NULL, 'SIN ADIC PEQ - T', 1, NULL, NULL, 116),
(223, '23', NULL, 'TIPO PASTA - T', 1, NULL, NULL, 116),
(224, '26', NULL, 'WRAP - T', 1, NULL, NULL, 116),
(225, '5', NULL, 'BEBIDAS 16 Oz', 0, NULL, NULL, 117),
(226, '5', NULL, 'BEBIDAS 16 Oz - NM', 1, NULL, NULL, 117),
(227, '6', NULL, 'BEBIDAS 21 Oz', 0, NULL, NULL, 117),
(228, '6', NULL, 'BEBIDAS 21 Oz - NM', 1, NULL, NULL, 117),
(229, '8', NULL, 'BEBIDAS GRANDES - T', 1, NULL, NULL, 117),
(230, '7', NULL, 'BEBIDAS MEDIANAS - T', 1, NULL, NULL, 117),
(231, '6', NULL, 'BEBIDAS PEQUENAS - T', 1, NULL, NULL, 117),
(232, '12', NULL, 'CAFE', 1, NULL, NULL, 117),
(233, '12', NULL, 'CAFE - T', 1, NULL, NULL, 117),
(234, '11', NULL, 'JUGOS - T', 1, NULL, NULL, 117),
(235, '10', NULL, 'REFRESCOS BOMBA 600ML - T', 1, NULL, NULL, 117),
(236, '7', NULL, 'REFRESCOS LATA Y AGUAS', 0, NULL, NULL, 117),
(237, '7', NULL, 'REFRESCOS LATA Y AGUAS - NM', 1, NULL, NULL, 117),
(238, '9', NULL, 'REFRESCOS LATA Y AGUAS - T', 1, NULL, NULL, 117),
(241, '17', NULL, 'PIZ & BEB. PERS.', 0, NULL, NULL, 6),
(242, '17', NULL, 'PIZ Y BEB. PERS. - NM', 1, NULL, NULL, 6),
(243, '27', NULL, 'PIZZA && BEBIDAS PERSONAL - T', 1, NULL, NULL, 120),
(244, '3', NULL, 'PIZZAS PEQUENAS - T', 1, NULL, NULL, 116),
(249, '0', NULL, 'BEBIDAS', 0, NULL, NULL, 117),
(251, '0', NULL, 'YOGURES', 0, NULL, NULL, 142),
(252, '0', NULL, 'CAFE', 0, NULL, NULL, 117),
(253, '0', NULL, 'DULCES FRIOS', 0, NULL, NULL, 116),
(254, '0', NULL, 'DULCES', 0, NULL, NULL, 116),
(255, '0', NULL, 'PASTA SECA', 0, NULL, NULL, 116),
(256, '0', NULL, 'PIZZETAS', 0, NULL, NULL, 116),
(257, '0', NULL, 'ENSALADAS', 0, NULL, NULL, 116),
(258, '0', NULL, 'BOMBONES', 0, NULL, NULL, 116),
(259, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 117),
(260, '0', NULL, 'PASTELES', 0, NULL, NULL, 116),
(261, '0', NULL, 'PIZZAS 16', 0, NULL, NULL, 116),
(262, '0', NULL, 'SLICES 16', 0, NULL, NULL, 116),
(263, '0', NULL, 'POSTRES', 0, NULL, NULL, 116),
(264, '0', NULL, 'COMBO LOKURA PIZZAS 16', 0, NULL, NULL, NULL),
(265, '0', NULL, 'COMBO PIZZAS 16', 0, NULL, NULL, NULL),
(266, '0', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 120),
(267, '0', NULL, 'PARA LLEVAR', 0, NULL, NULL, 143),
(268, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 117),
(269, '0', NULL, 'PASTELES', 0, NULL, NULL, 116),
(270, '0', NULL, 'PIZZAS 16', 0, NULL, NULL, 116),
(271, '0', NULL, 'SLICES 16', 0, NULL, NULL, 116),
(272, '0', NULL, 'POSTRES', 0, NULL, NULL, 116),
(273, '0', NULL, 'COMBO LOKURA PIZZAS 16', 0, NULL, NULL, NULL),
(274, '0', NULL, 'COMBO PIZZAS 16', 0, NULL, NULL, NULL),
(275, '0', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 120),
(276, '0', NULL, 'PARA LLEVAR', 0, NULL, NULL, 143),
(278, '3', NULL, 'PIZZAS OVALADAS - R', 0, NULL, NULL, 116),
(279, '13', NULL, 'ADICIONALES 8 - R', 0, NULL, NULL, 116),
(281, '16', NULL, 'ADICIONALES GRANDES - R', 0, NULL, NULL, 116),
(282, '15', NULL, 'ADICIONALES MEDIANOS - R', 0, NULL, NULL, 116),
(283, '14', NULL, 'ADICIONALES PEQUENOS - R', 0, NULL, NULL, 116),
(284, '1', NULL, 'PASTELITOS - R', 1, NULL, NULL, 116),
(285, '2', NULL, 'PIZZAS 8 - R', 0, NULL, NULL, 116),
(286, '5', NULL, 'PIZZAS GRANDES - R', 0, NULL, NULL, 116),
(287, '4', NULL, 'PIZZAS MEDIANAS - R', 0, NULL, NULL, 116),
(288, '3', NULL, 'PIZZAS PEQUENAS - R', 0, NULL, NULL, 116),
(289, '25', NULL, 'POSTRES - R', 0, NULL, NULL, 116),
(290, '18', NULL, 'SIN ADIC 8 - R', 0, NULL, NULL, 116),
(291, '21', NULL, 'SIN ADIC GR - R', 0, NULL, NULL, 116),
(292, '20', NULL, 'SIN ADIC MED - R', 0, NULL, NULL, 116),
(293, '19', NULL, 'SIN ADIC PEQ - R', 0, NULL, NULL, 116),
(294, '8', NULL, 'BEBIDAS GRANDES - R', 0, NULL, NULL, 117),
(295, '7', NULL, 'BEBIDAS MEDIANAS - R', 0, NULL, NULL, 117),
(296, '6', NULL, 'BEBIDAS PEQUENAS - R', 0, NULL, NULL, 117),
(297, '12', NULL, 'CAFE - R', 1, NULL, NULL, 117),
(298, '11', NULL, 'JUGOS - R', 1, NULL, NULL, 117),
(299, '10', NULL, 'REFRESCOS BOMBA 600ML - R', 1, NULL, NULL, 117),
(300, '9', NULL, 'REFRESCOS LATA Y AGUAS - R', 0, NULL, NULL, 117),
(301, '17', NULL, 'PARA LLEVAR - R', 0, NULL, NULL, 143),
(302, '27', NULL, 'PIZZA Y BEBIDAS PERSONAL - R', 0, NULL, NULL, 120),
(306, '0', NULL, 'BEBIDAS CALIENTES', 1, NULL, NULL, 117),
(307, '0', NULL, 'PIZZAS OVALADAS', 0, NULL, NULL, 116),
(308, '0', NULL, 'PIZZAS GRANDES', 0, NULL, NULL, 116),
(309, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 117),
(310, '0', NULL, 'PASTELES', 0, NULL, NULL, 116),
(311, '0', NULL, 'PIZZAS 16', 0, NULL, NULL, 116),
(312, '0', NULL, 'SLICES 16', 0, NULL, NULL, 116),
(313, '0', NULL, 'POSTRES', 0, NULL, NULL, 116),
(314, '0', NULL, 'COMBO LOKURA PIZZAS 16', 0, NULL, NULL, NULL),
(315, '0', NULL, 'COMBO PIZZAS 16', 0, NULL, NULL, NULL),
(316, '0', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 120),
(317, '0', NULL, 'PARA LLEVAR', 0, NULL, NULL, 143),
(318, '0', NULL, 'BEBIDAS CALIENTES', 1, NULL, NULL, 117),
(319, '0', NULL, 'SLICES 18', 1, NULL, NULL, 116),
(320, '0', NULL, 'COMBOS PIZZAS 18', 1, NULL, NULL, NULL),
(321, '0', NULL, 'COMBOS PIZZAS 18', 1, NULL, NULL, NULL),
(322, '0', NULL, 'SLICES 18', 1, NULL, NULL, 116),
(323, '0', NULL, 'BEBIDAS CALIENTES', 1, NULL, NULL, 117),
(324, '0', NULL, 'SLICES 18', 1, NULL, NULL, 116),
(328, '0', NULL, 'COMBOS PIZZAS 18', 1, NULL, NULL, NULL),
(329, '0', NULL, 'NACHOS', 1, NULL, NULL, 116),
(330, '10', NULL, 'INFUSIONES', 0, NULL, NULL, 116),
(331, '0', NULL, 'PROTEINA BURRITO', 1, NULL, NULL, 116),
(332, '0', NULL, 'PROTEINA BURRO', 1, NULL, NULL, 116),
(333, '0', NULL, 'PROTEINA MATA BURRO', 1, NULL, NULL, 116),
(334, '0', NULL, 'COMBOS PIZZAS 18', 1, NULL, NULL, NULL),
(335, '0', NULL, 'SLICES 18', 1, NULL, NULL, 116),
(336, '0', NULL, 'BEBIDAS CALIENTES', 1, NULL, NULL, 117),
(337, '1', NULL, 'Pizzas Med', 0, NULL, NULL, 116),
(338, '2', NULL, 'Pizzas Fam', 0, NULL, NULL, 116),
(339, '4', NULL, 'Acompanantes', 0, NULL, NULL, 116),
(340, '5', NULL, 'Postres', 0, NULL, NULL, 116),
(341, '3', NULL, 'Bebidas', 0, NULL, NULL, 117),
(342, '1', NULL, 'PIZZA-9', 0, NULL, NULL, 116),
(343, '2', NULL, 'PIZZA-12', 0, NULL, NULL, 116),
(344, '3', NULL, 'PIZZA-14', 0, NULL, NULL, 116),
(345, '4', NULL, 'PIZZA-16', 0, NULL, NULL, 116),
(346, '5', NULL, 'Combo 9', 0, NULL, NULL, NULL),
(347, '6', NULL, 'COMBO 12', 0, NULL, NULL, NULL),
(348, '7', NULL, 'COMBO 14', 0, NULL, NULL, NULL),
(349, '8', NULL, 'COMBO 16', 0, NULL, NULL, NULL),
(350, '9', NULL, 'PROMOCION DEL MES', 0, NULL, NULL, NULL),
(351, '10', NULL, 'SODAS PEQUENAS', 0, NULL, NULL, 117),
(352, '11', NULL, 'SODAS MEDIANAS', 0, NULL, NULL, 117),
(353, '12', NULL, 'SODAS GRANDES', 0, NULL, NULL, 117),
(354, '13', NULL, 'ADICIONAL 9', 0, NULL, NULL, 116),
(355, '14', NULL, 'ADICIONAL 12', 0, NULL, NULL, 116),
(356, '15', NULL, 'ADICIONAL 14', 0, NULL, NULL, 116),
(357, '20', NULL, 'P-LLEVAR', 0, NULL, NULL, 143),
(358, '17', NULL, 'CON ADIC-PEQ', 0, NULL, NULL, 116),
(359, '18', NULL, 'CON ADIC-MED', 0, NULL, NULL, 116),
(361, '19', NULL, 'CON ADIC-GRD', 0, NULL, NULL, 116),
(362, '21', NULL, 'SIN ADIC-PEQ', 0, NULL, NULL, 116),
(363, '22', NULL, 'SIN ADIC-MED', 0, NULL, NULL, 116),
(364, '23', NULL, 'SIN ADIC-GRD', 0, NULL, NULL, 116),
(365, '24', NULL, 'POSTRES', 0, NULL, NULL, 116),
(366, '25', NULL, 'SLICE', 0, NULL, NULL, 116),
(367, '26', NULL, 'EXTRAS', 0, NULL, NULL, 116),
(368, '27', NULL, 'MALTEADAS', 0, NULL, NULL, 117),
(370, '29', NULL, 'PRE.POSTRES COMBO', 0, NULL, NULL, NULL),
(371, '30', NULL, 'PRE.SABOR COMBO', 0, NULL, NULL, NULL),
(372, '1', NULL, 'Burrito', 0, NULL, NULL, 116),
(373, '2', NULL, 'Burro', 0, NULL, NULL, 116),
(374, '3', NULL, 'Mata Burro 10"', 0, NULL, NULL, 116),
(375, '4', NULL, 'Mata Burro 12"', 0, NULL, NULL, 116),
(376, '5', NULL, 'OPCIONES FRIAS', 0, NULL, NULL, NULL),
(377, '6', NULL, 'Combos', 0, NULL, NULL, NULL),
(378, '7', NULL, 'Combos RB', 0, NULL, NULL, NULL),
(379, '8', NULL, 'Bebidas 12 Oz', 0, NULL, NULL, 117),
(380, '9', NULL, 'Bebidas 16 Oz', 0, NULL, NULL, 117),
(381, '10', NULL, 'Bebidas 22 Oz', 0, NULL, NULL, 117),
(382, '11', NULL, 'POSTRES', 0, NULL, NULL, 116),
(383, '12', NULL, 'X- FRIOS', 0, NULL, NULL, NULL),
(384, '13', NULL, 'X- CALIENTES', 0, NULL, NULL, NULL),
(385, '14', NULL, 'X-Proteinas 10"', 0, NULL, NULL, 116),
(386, '15', NULL, 'X-Proteinas 12"', 0, NULL, NULL, 116),
(387, '16', NULL, 'X-SALSAS', 0, NULL, NULL, NULL),
(388, '17', NULL, 'Opciones Calientes', 0, NULL, NULL, 116),
(389, '18', NULL, 'Preparacion Proteina', 0, NULL, NULL, 116),
(390, '19', NULL, 'Prep. Combos Bebidas', 0, NULL, NULL, NULL),
(392, '16', NULL, 'ADICIONAL 16', 0, NULL, NULL, 116),
(393, '28', NULL, 'PRE.BEBIDA COMBO', 0, NULL, NULL, NULL),
(394, '31', NULL, 'FULL ECONOMICA', 1, NULL, NULL, NULL),
(403, NULL, NULL, 'Sodas Medianas Rb', 0, NULL, NULL, 117),
(404, NULL, NULL, 'Postres Rb', 0, NULL, NULL, 116),
(405, NULL, NULL, 'Preparacion Proteina Rb', 0, NULL, NULL, 116),
(406, NULL, NULL, 'Sodas Pequenas Rb', 0, NULL, NULL, 117),
(407, NULL, NULL, 'Sodas Medianas Rb', 0, NULL, NULL, 117),
(408, NULL, NULL, 'Sodas Grandes Rb', 0, NULL, NULL, 117),
(409, NULL, NULL, 'Prep. Combos Bebidas Rb', 0, NULL, NULL, 117),
(410, NULL, NULL, 'Combos Adicional', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ingredientes_has_explosion`
--

CREATE TABLE `ingredientes_has_explosion` (
  `explosion_id` int(11) NOT NULL,
  `ingrediente_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredientes_has_explosion`
--

INSERT INTO `ingredientes_has_explosion` (`explosion_id`, `ingrediente_id`, `producto_id`, `cantidad`, `unidad_medida_id`) VALUES
(1, 26, NULL, '400.0000', 6),
(1, 22, NULL, '4.0000', 6),
(1, 23, NULL, '2.0000', 13),
(1, 24, NULL, '8.0000', 13),
(2, 15, NULL, '11615.0000', 12),
(2, 26, NULL, '1000.0000', 6),
(2, 29, NULL, '5.0000', 12),
(2, 17, NULL, '15.0000', 12),
(2, 22, NULL, '1665.0105', 6),
(2, 23, NULL, '10.0000', 13);

-- --------------------------------------------------------

--
-- Table structure for table `ingrediente_has_receta`
--

CREATE TABLE `ingrediente_has_receta` (
  `ingrediente_id` int(11) DEFAULT NULL,
  `receta_id` int(11) NOT NULL,
  `cantidad` decimal(19,4) DEFAULT '0.0000',
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingrediente_has_receta`
--

INSERT INTO `ingrediente_has_receta` (`ingrediente_id`, `receta_id`, `cantidad`, `unidad_medida_id`) VALUES
(16, 1, '3.0000', 15),
(15, 10, '2.0000', 4),
(1, 10, '3.0000', 5),
(16, 10, '2.0000', 15),
(2, 10, '2.0000', 4),
(2, 1, '3000.0000', 12),
(15, 1, '1.0000', 4),
(15, 2, '3.0000', 4),
(2, 2, '2.0000', 4),
(1, 2, '2.0000', 6),
(17, 12, '2.0000', 12),
(16, 12, '4.0000', 6),
(1, 13, '23.0000', 6),
(21, 16, '1.0000', 13),
(22, 16, '2.0000', 6),
(23, 16, '1.0000', 13),
(24, 16, '4.0000', 13),
(26, 19, '2.0000', 6),
(6, 19, '200.0000', 6),
(27, 19, '140.0000', 6),
(28, 19, '1.0000', 13),
(22, 19, '2.0000', 6),
(30, 19, '1.0000', 13),
(29, 19, '30.0000', 12),
(22, 17, '3.0000', 6),
(23, 17, '2.0000', 13),
(29, 13, '1.0000', 12),
(26, 18, '200.0000', 6),
(4, 20, '80.0000', 12),
(33, 20, '80.0000', 6),
(35, 20, '75.0000', 6),
(36, 20, '25.0000', 6),
(37, 20, '250.0000', 6),
(38, 20, '2500.0000', 6),
(39, 20, '250.0000', 6),
(40, 20, '1000.0000', 12),
(41, 20, '25.0000', 6),
(43, 20, '25.0000', 6),
(44, 20, '250.0000', 6),
(45, 20, '5.0000', 6),
(46, 20, '1250.0000', 6),
(48, 20, '75.0000', 6),
(49, 21, '800.0000', 6),
(39, 21, '50.0000', 6),
(37, 21, '50.0000', 6),
(50, 21, '1.0000', 13),
(43, 21, '5.0000', 6),
(51, 21, '100.0000', 6),
(52, 21, '10.0000', 6),
(47, 21, '5.0000', 6),
(45, 21, '1.0000', 6),
(53, 21, '1.0000', 13),
(26, 23, '200.0000', 6),
(6, 24, '300.0000', 6),
(26, 24, '1000.0000', 6),
(54, 1, '500.0000', 6),
(47, 20, '25.0000', 6),
(16, 25, '220.0000', 6),
(27, 26, '100.0000', 6),
(117, 27, '0.2000', 6),
(174, 27, '0.1000', 6),
(163, 27, '0.8000', 6),
(104, 29, '500.0000', 6),
(179, 29, '15.0000', 6),
(168, 29, '3.0000', 6),
(189, 29, '15.0000', 6),
(12, 27, '10.0000', 6),
(17, 27, '100.0000', 12);

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `mercancia_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `existencia_teorica` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `existencia_real` decimal(19,4) DEFAULT '0.0000',
  `diferencia` decimal(19,4) DEFAULT '0.0000',
  `unidad_medida_id` int(11) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL,
  `tipo_inventario` int(11) NOT NULL,
  `comentario` text,
  `procesado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`id`, `mercancia_id`, `unidad_negocio_id`, `existencia_teorica`, `existencia_real`, `diferencia`, `unidad_medida_id`, `fecha_inicial`, `fecha_final`, `tipo_inventario`, `comentario`, `procesado`) VALUES
(1, 1, 1, '1.0000', NULL, '-1.0000', 6, '2018-03-01', '2018-03-31', 171, NULL, 0),
(2, 6, 1, '3000.0000', NULL, '-3000.0000', 6, '2018-03-01', '2018-03-31', 171, NULL, 0),
(3, 15, 1, '0.0000', NULL, '0.0000', 12, '2018-03-01', '2018-03-31', 171, NULL, 0),
(4, 16, 1, '0.0000', NULL, '0.0000', 6, '2018-03-01', '2018-03-31', 171, NULL, 0),
(5, 17, 1, '0.0000', NULL, '0.0000', 12, '2018-03-01', '2018-03-31', 171, NULL, 0),
(6, 18, 1, '0.0000', NULL, '0.0000', 6, '2018-03-01', '2018-03-31', 171, NULL, 0),
(7, 21, 1, '3000.0000', NULL, '-3000.0000', 13, '2018-03-01', '2018-03-31', 171, NULL, 0),
(8, 22, 1, '3000.0000', NULL, '-3000.0000', 6, '2018-03-01', '2018-03-31', 171, NULL, 0),
(9, 23, 1, '200.0000', NULL, '-200.0000', 13, '2018-03-01', '2018-03-31', 171, NULL, 0),
(10, 24, 1, '1000.0000', NULL, '-1000.0000', 13, '2018-03-01', '2018-03-31', 171, NULL, 0),
(11, 26, 1, '2800.0000', NULL, '-2800.0000', 6, '2018-03-01', '2018-03-31', 171, NULL, 0),
(12, 27, 1, '1000.0000', NULL, '-1000.0000', 6, '2018-03-01', '2018-03-31', 171, NULL, 0),
(13, 28, 1, '7500.0000', NULL, '-7500.0000', 13, '2018-03-01', '2018-03-31', 171, NULL, 0),
(14, 29, 1, '1000.0000', NULL, '-1000.0000', 12, '2018-03-01', '2018-03-31', 171, NULL, 0),
(15, 30, 1, '1000.0000', NULL, '-1000.0000', 13, '2018-03-01', '2018-03-31', 171, NULL, 0),
(16, 1, 1, '1.0000', NULL, '-1.0000', 6, '2018-03-01', '2018-03-31', 172, NULL, 0),
(17, 6, 1, '3000.0000', NULL, '-3000.0000', 6, '2018-03-01', '2018-03-31', 172, NULL, 0),
(18, 15, 1, '0.0000', NULL, '0.0000', 12, '2018-03-01', '2018-03-31', 172, NULL, 0),
(19, 16, 1, '0.0000', NULL, '0.0000', 6, '2018-03-01', '2018-03-31', 172, NULL, 0),
(20, 17, 1, '0.0000', NULL, '0.0000', 12, '2018-03-01', '2018-03-31', 172, NULL, 0),
(21, 18, 1, '0.0000', NULL, '0.0000', 6, '2018-03-01', '2018-03-31', 172, NULL, 0),
(22, 21, 1, '3000.0000', NULL, '-3000.0000', 13, '2018-03-01', '2018-03-31', 172, NULL, 0),
(23, 22, 1, '3000.0000', NULL, '-3000.0000', 6, '2018-03-01', '2018-03-31', 172, NULL, 0),
(24, 23, 1, '200.0000', NULL, '-200.0000', 13, '2018-03-01', '2018-03-31', 172, NULL, 0),
(25, 24, 1, '1000.0000', NULL, '-1000.0000', 13, '2018-03-01', '2018-03-31', 172, NULL, 0),
(26, 26, 1, '2800.0000', NULL, '-2800.0000', 6, '2018-03-01', '2018-03-31', 172, NULL, 0),
(27, 27, 1, '1000.0000', NULL, '-1000.0000', 6, '2018-03-01', '2018-03-31', 172, NULL, 0),
(28, 28, 1, '7500.0000', NULL, '-7500.0000', 13, '2018-03-01', '2018-03-31', 172, NULL, 0),
(29, 29, 1, '1000.0000', NULL, '-1000.0000', 12, '2018-03-01', '2018-03-31', 172, NULL, 0),
(30, 30, 1, '1000.0000', NULL, '-1000.0000', 13, '2018-03-01', '2018-03-31', 172, NULL, 0),
(31, 1, 1, '1.0000', NULL, '-1.0000', 6, '2018-04-13', '2018-04-13', 164, NULL, 0),
(32, 6, 1, '3000.0000', NULL, '-3000.0000', 6, '2018-04-13', '2018-04-13', 164, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kardex`
--

CREATE TABLE `kardex` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cantidad` decimal(19,4) DEFAULT '0.0000',
  `existencia` decimal(19,4) DEFAULT '0.0000',
  `descripcion` text,
  `tipo_movimiento_id` int(11) DEFAULT NULL,
  `mercancia_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `motivo_id` int(11) DEFAULT NULL,
  `reversado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kardex`
--

INSERT INTO `kardex` (`id`, `fecha`, `hora`, `cantidad`, `existencia`, `descripcion`, `tipo_movimiento_id`, `mercancia_id`, `unidad_negocio_id`, `usuario_id`, `unidad_medida_id`, `motivo_id`, `reversado`) VALUES
(2, '2017-08-15', '10:12:10', '24000.0000', '0.0000', 'bulto de arroz', 131, 1, 1, 15, 6, 122, 0),
(3, '2017-08-15', '15:19:05', '22800.0000', '0.0000', 'medio bulto de arroz', 131, 1, 1, 15, 6, 122, 0),
(4, '2017-08-15', '15:44:08', '48000.0000', '0.0000', 'refresco de 2 litro', 131, 2, 1, 15, 12, 122, 0),
(5, '2017-08-15', '15:00:45', '2000.0000', '0.0000', 'Solicitud de emergencia por que se acabo el arroz', 131, 1, 1, 3, 6, 122, 0),
(6, '2017-08-15', '15:09:38', '21600.0000', '0.0000', 'Solicitud de emergencia por que se acabo el arroz', 131, 1, 5, 15, 6, 122, 0),
(7, '2017-08-15', '15:19:22', '24000.0000', '0.0000', 'Compra de arroz aprovechando una oferta de un proveedor', 131, 1, 7, 1, 6, 122, 0),
(8, '2017-08-18', '08:38:17', '71280.0000', '0.0000', '', 132, 1, 59, 15, 6, 133, 0),
(9, '2017-08-18', '08:38:49', '71280.0000', '0.0000', '', 132, 1, 59, 15, 6, 133, 0),
(14, '2017-08-18', '08:42:15', '71280.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(15, '2017-08-21', '02:57:43', '90000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(16, '2017-08-21', '03:00:26', '90000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(17, '2017-08-21', '03:00:36', '90000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(18, '2017-08-21', '03:01:54', '90000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(19, '2017-08-21', '03:01:55', '90000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(20, '2017-08-21', '03:01:56', '90000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(21, '2017-08-21', '03:01:56', '90000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(22, '2017-08-21', '03:03:11', '90000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(23, '2017-08-21', '03:09:33', '108000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(24, '2017-08-21', '03:11:55', '108000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(25, '2017-08-21', '03:14:51', '108000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(26, '2017-08-21', '03:16:24', '108000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(27, '2017-08-21', '03:16:54', '108000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(29, '2017-11-22', '12:12:13', '0.0000', '0.0000', '33600', 132, 1, 59, 15, 12, 133, 0),
(30, '2017-11-22', '12:18:38', '0.0000', '0.0000', '33600', 132, 1, 59, 15, 12, 133, 0),
(31, '2017-11-22', '12:37:04', '0.0000', '0.0000', '33600', 132, 1, 59, 15, 12, 133, 0),
(32, '2017-11-22', '12:38:08', '0.0000', '0.0000', '33600', 132, 1, 59, 15, 12, 133, 0),
(34, '2017-11-22', '12:38:31', '0.0000', '0.0000', '33600', 132, 4, 59, 15, 12, 133, 0),
(35, '2017-11-22', '01:02:46', '0.0000', '0.0000', '2000', 132, 11, 59, 15, 6, 133, 0),
(36, '2017-11-22', '01:03:03', '0.0000', '0.0000', '2000', 132, 11, 59, 15, 6, 133, 0),
(37, '2017-11-22', '01:15:45', '0.0000', '0.0000', '50', 132, 2, 59, 15, 12, 133, 0),
(38, '2017-11-22', '01:16:13', '0.0000', '0.0000', '1000', 132, 2, 59, 15, 12, 133, 0),
(39, '2017-11-22', '01:16:57', '0.0000', '0.0000', '3000', 132, 2, 59, 15, 12, 133, 0),
(40, '2017-11-22', '03:56:49', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(41, '2017-11-23', '09:48:33', '3500.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(42, '2017-11-23', '10:41:50', '2500.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(43, '2017-11-23', '02:54:47', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(44, '2017-11-23', '02:55:14', '2500.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(45, '2017-11-23', '02:55:27', '3500.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(46, '2017-11-23', '02:55:34', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(47, '2017-11-24', '03:11:56', '1206500.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(48, '2017-11-24', '03:13:23', '8500.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(49, '2017-11-24', '03:13:54', '10500.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(50, '2017-11-24', '03:39:47', '11100.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(51, '2017-11-24', '03:41:20', '11100.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(52, '2017-11-24', '03:42:30', '20100.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(53, '2017-11-24', '05:17:03', '22100.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(54, '2017-11-27', '09:52:03', '23300.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(55, '2017-11-27', '10:42:59', '24300.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(56, '2017-11-27', '10:45:47', '25300.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133, 0),
(57, '2017-11-27', '10:48:39', '26500.0000', '0.0000', 'se derramo un litro ', 132, 2, 1, 15, 12, 122, 0),
(58, '2017-11-27', '12:46:59', '5500.0000', '0.0000', 'prueba 2', 132, 2, 59, 15, 12, 122, 0),
(59, '2017-12-04', '10:15:30', '2970.0000', '0.0000', 'Producto creado', 131, 12, 59, 15, 6, 123, 0),
(60, '2017-12-04', '11:09:57', '81.0000', '0.0000', 'Producto creado', 131, 13, 59, 15, 12, 123, 0),
(61, '2017-12-04', '02:46:34', '2000.0000', '0.0000', 'Producto creado', 131, 14, 59, 15, 6, 123, 0),
(62, '2017-12-04', '02:49:55', '6000.0000', '0.0000', 'Producto creado', 131, 15, 59, 15, 12, 123, 0),
(63, '2017-12-04', '03:00:37', '1000.0000', '0.0000', 'Producto creado', 131, 16, 59, 15, 6, 123, 0),
(64, '2017-12-04', '03:05:04', '6000.0000', '0.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133, 0),
(65, '2017-12-04', '03:05:41', '6000.0000', '0.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133, 0),
(66, '2017-12-04', '03:26:37', '6000.0000', '0.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133, 0),
(67, '2017-12-04', '03:26:52', '6000.0000', '0.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133, 0),
(68, '2017-12-04', '03:28:13', '6000.0000', '0.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133, 0),
(69, '2017-12-04', '04:05:43', '5000.0000', '0.0000', 'Producto creado', 131, 17, 59, 15, 12, 123, 0),
(70, '2017-12-04', '04:27:15', '2000.0000', '0.0000', 'Producto creado', 131, 18, 59, 15, 6, 123, 0),
(71, '2017-12-06', '02:55:43', '0.0000', '0.0000', 'Error cargando los datos del producto', 132, 15, 1, 15, 12, 133, 0),
(75, '2017-12-27', '10:48:01', '3000.0000', '0.0000', 'Producto creado', 131, 31, 59, 15, 6, 123, 0),
(76, '2017-12-27', '10:48:35', '5600.0000', '0.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133, 0),
(77, '2017-12-27', '10:49:26', '2970.0000', '0.0000', 'Error cargando los datos del producto', 132, 12, 59, 15, 6, 133, 0),
(78, '2017-12-28', '09:33:04', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133, 0),
(79, '2017-12-28', '11:05:32', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133, 0),
(80, '2017-12-28', '11:10:55', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133, 0),
(81, '2017-12-28', '11:11:59', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133, 0),
(82, '2017-12-28', '11:15:47', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(83, '2017-12-28', '11:17:25', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(84, '2017-12-28', '11:17:51', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(85, '2017-12-28', '11:18:15', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(86, '2017-12-28', '11:18:33', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(87, '2017-12-28', '11:20:30', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(88, '2017-12-28', '11:41:28', '42240.0000', '0.0000', 'Producto creado', 131, 32, 59, 15, 6, 123, 0),
(89, '2017-12-28', '11:43:03', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(90, '2018-01-08', '12:05:12', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133, 0),
(91, '2018-01-08', '12:05:27', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133, 0),
(92, '2018-01-08', '12:05:37', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133, 0),
(93, '2018-01-08', '12:48:58', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(94, '2018-01-08', '12:49:09', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(95, '2018-01-11', '03:24:00', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 21, 59, 1, 13, 133, 0),
(96, '2018-01-17', '02:31:27', '10000.0000', '0.0000', 'Producto creado', 131, 54, 60, 10, 6, 123, 0),
(99, '2018-01-22', '04:57:52', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 59, 59, 15, 6, 123, 0),
(100, '2018-01-25', '12:13:09', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 63, 59, 15, 13, 123, 0),
(101, '2018-01-26', '02:14:31', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 64, 59, 15, 6, 123, 0),
(102, '2018-01-26', '02:17:41', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 65, 59, 15, 6, 123, 0),
(103, '2018-01-26', '02:45:39', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 66, 59, 15, 6, 123, 0),
(104, '2018-01-26', '02:48:52', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 67, 59, 15, 6, 123, 0),
(106, '2018-01-26', '02:52:41', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 69, 59, 15, 6, 123, 0),
(107, '2018-01-26', '03:02:16', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 70, 59, 15, 13, 123, 0),
(108, '2018-01-26', '03:33:16', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 71, 59, 15, 6, 123, 0),
(109, '2018-01-26', '05:17:04', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 72, 59, 15, 4, 123, 0),
(110, '2018-01-29', '10:07:21', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 73, 59, 15, 12, 123, 0),
(111, '2018-01-29', '03:14:36', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 74, 59, 15, 6, 123, 0),
(112, '2018-01-29', '04:03:20', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(113, '2018-01-29', '04:06:25', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(114, '2018-01-29', '04:06:42', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(115, '2018-01-29', '04:07:13', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(116, '2018-01-29', '04:07:33', '3000.0000', '0.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133, 0),
(117, '2018-01-29', '04:10:33', '0.0000', '0.0000', 'Error cargando los datos del producto', 132, 63, 59, 15, 13, 133, 0),
(118, '2018-01-29', '04:11:02', '0.0000', '0.0000', 'Error cargando los datos del producto', 132, 63, 59, 15, 13, 133, 0),
(119, '2018-01-29', '04:13:34', '0.0000', '0.0000', 'Error cargando los datos del producto', 132, 64, 59, 15, 6, 133, 0),
(120, '2018-01-29', '04:14:11', '0.0000', '0.0000', 'Error cargando los datos del producto', 132, 64, 59, 15, 6, 133, 0),
(121, '2018-01-29', '04:14:39', '0.0000', '0.0000', 'Error cargando los datos del producto', 132, 64, 59, 15, 6, 133, 0),
(122, '2018-01-29', '05:03:20', '0.0000', '0.0000', 'Error cargando los datos del producto', 132, 64, 59, 15, 6, 133, 0),
(123, '2018-01-29', '05:12:19', '0.0000', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 75, 59, 15, 12, 123, 0),
(124, '2018-01-29', '05:21:52', '6000.0000', '0.0000', 'Error cargando los datos del producto', 132, 75, 59, 15, 12, 133, 0),
(125, '2018-03-12', '10:10:27', '1.0000', '0.0000', 'Producto de compra, registrado en sistema', 131, 332, 60, 10, 6, 123, 0),
(126, '2018-03-14', '04:06:47', '0.0000', '0.0000', 'Producto de compra, registrado en sistema', 131, 345, 59, 15, 12, 123, 0),
(127, '2018-03-14', '04:07:17', '0.0000', '0.0000', 'Producto de compra, registrado en sistema', 131, 346, 59, 15, 12, 123, 0),
(133, '2018-03-14', '04:43:42', '13.8000', '27.6000', 'Produccion de 1 de Salsa Verde Cremosito (burritos) Generico', 131, 195, 506, 10, 6, 178, 0),
(134, '2018-03-14', '04:43:42', '-200.0000', '0.0000', 'Produccion de 1 de Salsa Verde Cremosito (burritos) Generico', 132, 27, 506, 10, 6, 179, 0),
(135, '2018-03-15', '09:03:48', '0.0000', '0.0000', 'Producto de compra, registrado en sistema', 131, 347, 59, 15, 12, 123, 0),
(136, '2018-03-15', '09:26:21', '0.0000', '0.0000', 'Producto de compra, registrado en sistema', 131, 348, 60, 10, 13, 123, 0),
(137, '2018-03-15', '09:54:28', '2.1000', '4.2000', 'Produccion de 2 de Salsa Tartara Cremosito (burritos) Generico', 131, 194, 506, 10, 6, 178, 0),
(138, '2018-03-23', '01:52:02', '1.0000', '-1.0000', 'El producto se vencio', 132, 15, 1, 15, 12, 182, 0),
(139, '2018-03-23', '01:52:02', '1.0000', '-1.0000', 'El producto vino deteriorado', 132, 16, 1, 15, 6, 182, 0),
(140, '2018-03-23', '01:52:47', '200.0000', '2600.0000', 'El producto se vencio (Brownie)', 132, 26, 1, 15, 6, 182, 0),
(141, '2018-03-23', '01:52:47', '2.0000', '2998.0000', 'El producto se vencio (Brownie)', 132, 22, 1, 15, 6, 182, 0),
(142, '2018-03-23', '01:52:47', '1.0000', '199.0000', 'El producto se vencio (Brownie)', 132, 23, 1, 15, 13, 182, 0),
(143, '2018-03-23', '01:52:47', '4.0000', '996.0000', 'El producto se vencio (Brownie)', 132, 24, 1, 15, 13, 182, 0),
(144, '2018-03-23', '01:58:51', '3.1000', '6.2000', 'Produccion de 1 de Salsa Tartara Cremosito (burritos) Generico', 131, 194, 506, 10, 6, 178, 0),
(145, '2018-03-23', '04:38:36', '16.8000', '33.6000', 'Produccion de 2 Salsa Verde Cremosito (burritos) Generico', 131, 195, 506, 10, 6, 178, 0),
(146, '2018-03-23', '04:38:36', '-600.0000', '400.0000', 'Produccion de 2 Salsa Verde Cremosito (burritos) Generico', 132, 27, 506, 10, 6, 179, 0),
(147, '2018-03-26', '08:25:42', '18.8000', '37.6000', 'Produccion de 2 Salsa Verde Cremosito (burritos) Generico', 131, 195, 506, 10, 6, 178, 0),
(148, '2018-03-26', '08:25:42', '2200.0000', '400.0000', 'Produccion de 2 Salsa Verde Cremosito (burritos) Generico', 132, 27, 506, 10, 6, 179, 0),
(149, '2018-03-26', '08:29:56', '200.0000', '2000.0000', 'El producto se deterioro durante el proceso de produccion', 132, 27, 506, 10, 6, 182, 0),
(150, '2018-03-26', '09:20:38', '21.8000', '43.6000', 'Produccion de 3 Salsa Verde Cremosito (burritos) Generico', 131, 195, 506, 10, 6, 178, 0),
(151, '2018-03-26', '09:20:38', '1400.0000', '600.0000', 'Produccion de 3 Salsa Verde Cremosito (burritos) Generico', 132, 27, 506, 10, 6, 179, 0),
(152, '2018-03-26', '09:32:43', '1.0000', '-1.0000', 'motivo de prueba', 132, 33, 506, 10, 6, 182, 0),
(153, '2018-03-26', '09:32:43', '1.0000', '-1.0000', 'El producto se vencio', 132, 38, 506, 10, 6, 182, 0),
(154, '2018-03-26', '10:03:17', '1135.0000', '2270.0000', 'Produccion de 1 Arroz Blanco (burritos) Generico', 131, 105, 505, 10, 6, 178, 0),
(155, '2018-03-26', '10:03:18', '500.0000', '500.0000', 'Produccion de 1 Arroz Blanco (burritos) Generico', 132, 104, 505, 10, 6, 179, 0),
(156, '2018-03-26', '10:03:18', '985.0000', '15.0000', 'Produccion de 1 Arroz Blanco (burritos) Generico', 132, 179, 505, 10, 6, 179, 0),
(157, '2018-03-26', '10:03:18', '985.0000', '15.0000', 'Produccion de 1 Arroz Blanco (burritos) Generico', 132, 189, 505, 10, 6, 179, 0),
(158, '2018-03-26', '10:03:18', '998.0000', '2.0000', 'Produccion de 1 Arroz Blanco (burritos) Generico', 132, 168, 505, 10, 6, 179, 0),
(159, '2018-04-03', '04:51:47', '100000.0000', '-99000.0000', 'registo de producto en sistema', 132, 104, 60, 10, 6, 133, 0),
(160, '2018-04-03', '04:53:36', '100000.0000', '0.0000', 'registo de producto en sistema', 132, 104, 60, 10, 6, 133, 0),
(161, '2018-04-03', '04:56:53', '100000.0000', '0.0000', 'registo de producto en sistema', 132, 104, 60, 10, 6, 133, 0),
(162, '2018-04-03', '05:00:55', '2500.0000', '-1500.0000', 'registo de producto en sistema', 132, 168, 60, 10, 6, 133, 0),
(163, '2018-04-03', '05:02:34', '2000.0000', '-1000.0000', 'registo de producto en sistema', 132, 179, 60, 10, 6, 133, 0),
(164, '2018-04-03', '05:05:31', '2.5000', '997.5000', 'registo de producto en sistema', 132, 189, 60, 10, 6, 133, 0),
(165, '2018-04-03', '07:24:18', '20.8000', '0.0000', 'prueba  - (Reverso de 1.0000 Salsa Verde Cremosito (burritos) Generico)', 132, 195, 506, 10, 6, 193, 0),
(166, '2018-04-03', '07:24:18', '1600.0000', '3000.0000', 'prueba  - (Reverso de 1.0000 Salsa Verde Cremosito (burritos) Generico)', 131, 27, 506, 10, 6, 192, 0),
(167, '2018-04-03', '07:30:52', '1000.0000', '9000.0000', 'El producto se cayo', 132, 2, 506, 10, 12, 180, 0),
(168, '2018-04-03', '07:31:23', '0.5000', '8999.5000', 'El producto se cayo', 132, 2, 506, 10, 12, 180, 1),
(169, '2018-04-03', '07:31:54', '0.5000', '9000.0000', 'fue mermado por error', 131, 2, 506, 10, 12, 191, 1),
(170, '2018-04-04', '09:30:56', '1001.0000', '2002.0000', 'Produccion de 1 Salsa Tartara Cremosito (burritos) Generico', 131, 194, 505, 10, 6, 178, 0),
(171, '2018-04-04', '09:30:56', '999.8000', '0.2000', 'Produccion de 1 Salsa Tartara Cremosito (burritos) Generico', 132, 117, 505, 10, 6, 179, 0),
(172, '2018-04-04', '09:30:56', '999.9000', '0.1000', 'Produccion de 1 Salsa Tartara Cremosito (burritos) Generico', 132, 174, 505, 10, 6, 179, 0),
(173, '2018-04-04', '09:30:56', '999.2000', '0.8000', 'Produccion de 1 Salsa Tartara Cremosito (burritos) Generico', 132, 163, 505, 10, 6, 179, 0),
(174, '2018-04-04', '09:30:56', '984.9850', '0.0150', 'Produccion de 1 Salsa Tartara Cremosito (burritos) Generico', 132, 189, 505, 10, 6, 179, 0),
(175, '2018-04-04', '09:32:44', '1000.0000', '0.0000', 'mal cargada - (Reverso de 1.0000 Salsa Tartara Cremosito (burritos) Generico)', 132, 194, 505, 10, 6, 193, 0),
(176, '2018-04-04', '09:32:44', '1000.0000', '1999.8000', 'mal cargada - (Reverso de 1.0000 Salsa Tartara Cremosito (burritos) Generico)', 131, 117, 505, 10, 6, 192, 0),
(177, '2018-04-04', '09:32:44', '1000.0000', '1999.9000', 'mal cargada - (Reverso de 1.0000 Salsa Tartara Cremosito (burritos) Generico)', 131, 174, 505, 10, 6, 192, 0),
(178, '2018-04-04', '09:32:45', '1000.0000', '1999.2000', 'mal cargada - (Reverso de 1.0000 Salsa Tartara Cremosito (burritos) Generico)', 131, 163, 505, 10, 6, 192, 0),
(179, '2018-04-04', '09:32:45', '985.0000', '1969.9850', 'mal cargada - (Reverso de 1.0000 Salsa Tartara Cremosito (burritos) Generico)', 131, 189, 505, 10, 6, 192, 0),
(180, '2018-04-04', '09:41:31', '2.0000', '998.0000', 'El producto se cayo', 132, 85, 505, 10, 13, 180, 1),
(181, '2018-04-04', '09:42:00', '2.0000', '1000.0000', 'mal cargada', 131, 85, 505, 10, 13, 191, 1),
(182, '2018-04-11', '09:40:51', '500.0000', '635.0000', 'pruebas', 132, 105, 505, 10, 6, 180, 1),
(183, '2018-04-11', '09:41:51', '500.0000', '1135.0000', 'mal cargada', 131, 105, 505, 10, 6, 191, 1),
(184, '2018-04-11', '09:50:58', '2000.0000', '0.0000', 'registo de producto en sistema', 132, 179, 60, 10, 6, 133, 0),
(185, '2018-04-11', '09:55:37', '2500.0000', '0.0000', 'registo de producto en sistema', 132, 168, 60, 10, 6, 133, 0),
(186, '2018-04-12', '10:03:13', '7200.0000', '0.0000', 'registo de producto en sistema', 132, 6, 59, 15, 6, 133, 0),
(187, '2018-04-18', '03:47:49', '1.0000', '0.0000', '', 131, 16, 1, 15, 4, 199, 0),
(188, '2018-04-18', '03:47:50', '2.0000', '1.0000', '', 131, 15, 1, 15, 4, 199, 0),
(189, '2018-04-18', '03:49:48', '2.0000', '0.0000', '', 131, 16, 1, 15, 4, 199, 0),
(190, '2018-04-18', '03:53:04', '1.0000', '-3.0000', 'barata', 131, 16, 1, 15, 11, 199, 0),
(191, '2018-04-18', '03:53:04', '1.0000', '-4.0000', 'barata', 131, 16, 1, 15, 11, 199, 0),
(192, '2018-04-18', '03:54:06', '1.0000', '-5.0000', 'barata', 131, 16, 1, 15, 11, 199, 0),
(193, '2018-04-18', '03:57:16', '1.0000', '-6.0000', 'barata', 131, 16, 1, 15, 11, 199, 0),
(194, '2018-04-18', '04:04:42', '10.0000', '2.0000', '', 131, 16, 1, 15, 4, 199, 0),
(195, '2018-04-18', '04:04:42', '12.0000', '9.0000', '', 131, 15, 1, 15, 4, 199, 0),
(196, '2018-04-18', '07:34:49', '2.0000', '5002.0000', 'prueba centro p', 131, 17, 59, 15, 4, 199, 0),
(197, '2018-04-18', '07:39:43', '3.0000', '1003.0000', 'sad', 131, 16, 59, 15, 4, 199, 0),
(198, '2018-04-20', '02:06:34', '1.0000', '-17.0000', '', 131, 16, 1, 15, 11, 199, 0),
(199, '2018-04-20', '02:07:55', '2.0000', '-16.0000', '', 131, 16, 1, 15, 11, 199, 0),
(200, '2018-04-20', '02:07:55', '2.0000', '-16.0000', '', 131, 16, 1, 15, 11, 199, 0),
(201, '2018-04-20', '02:08:53', '2.0000', '-16.0000', '', 131, 16, 1, 15, 11, 199, 0),
(202, '2018-04-20', '02:09:55', '2.0000', '-16.0000', '', 131, 16, 1, 15, 11, 199, 0),
(203, '2018-04-20', '02:11:12', '2.0000', '984.0000', '', 131, 16, 1, 15, 11, 199, 0),
(204, '2018-04-20', '02:12:20', '2.0000', '1984.0000', '', 131, 16, 1, 15, 11, 199, 0),
(205, '2018-04-20', '02:51:39', '200.5000', '12182.5000', '', 131, 16, 1, 15, 6, 199, 0),
(206, '2018-04-20', '03:15:29', '2222.3000', '114454.3000', '', 131, 16, 1, 15, 6, 199, 0),
(207, '2018-04-20', '05:43:36', '1.0000', '-14.0000', '', 131, 15, 1, 15, 23, 199, 0),
(208, '2018-04-20', '05:47:08', '1.0000', '1.0000', '', 131, 17, 1, 15, 11, 199, 0),
(209, '2018-04-20', '07:11:53', '5000.0000', '1218382.0000', 'prueba 1', 132, 16, 1, 15, 11, 200, 0),
(210, '2018-04-20', '07:11:53', '5000.0000', '1218382.0000', 'prueba 1', 132, 16, 1, 15, 11, 200, 0),
(211, '2018-04-20', '07:15:48', '5000.0000', '1218382.0000', 'prueba 1', 132, 16, 1, 15, 11, 200, 0),
(212, '2018-04-20', '07:24:05', '24000.0000', '-15.0000', 'prueba 2', 132, 15, 1, 15, 4, 200, 0),
(213, '2018-04-20', '07:25:24', '2222.3000', '1216159.7000', 'pruyeba 3', 132, 16, 1, 15, 6, 200, 0),
(214, '2018-04-20', '07:26:46', '23.0000', '23.0000', 'adsad', 131, 18, 1, 15, 5, 199, 0),
(215, '2018-04-20', '07:26:46', '1.0000', '2.0000', '', 131, 1, 1, 15, 19, 199, 0),
(216, '2018-04-20', '07:35:56', '19800.0000', '1.0000', 'prueba 4', 132, 1, 1, 15, 19, 200, 0),
(217, '2018-04-20', '07:38:53', '23000.0000', '0.0000', 'prueba 5', 132, 18, 1, 15, 5, 200, 0),
(218, '2018-04-20', '08:26:06', '1000.0000', '1215159.7000', 'prueba 5', 132, 16, 1, 15, 11, 200, 0),
(219, '2018-04-20', '08:28:13', '200.5000', '1214959.2000', 'prueba final', 132, 16, 1, 15, 6, 200, 0),
(220, '2018-04-20', '08:31:44', '2500.0000', '0.0000', 'prueba final final', 132, 17, 1, 15, 11, 200, 0),
(221, '2018-04-20', '08:55:07', '1000.0000', '1000.0000', '', 131, 18, 1, 15, 6, 199, 0),
(222, '2018-04-20', '08:55:07', '10.0000', '11.0000', '', 131, 1, 1, 15, 5, 199, 0),
(223, '2018-04-20', '08:55:54', '9900.0000', '1.0000', 'prueba f', 132, 1, 1, 15, 5, 200, 0),
(224, '2018-04-20', '09:16:17', '1.0000', '2.0000', '', 131, 1, 1, 15, 5, 199, 0),
(225, '2018-04-20', '09:16:43', '990.0000', '1.0000', 'prueba casi', 132, 1, 1, 15, 5, 200, 0),
(226, '2018-04-20', '09:16:43', '990.0000', '-989.0000', 'prueba casi', 132, 1, 1, 15, 5, 200, 0),
(227, '2018-04-20', '09:18:07', '10.0000', '-979.0000', '', 131, 1, 1, 15, 5, 199, 0),
(228, '2018-04-20', '09:18:27', '9900.0000', '-989.0000', 'prueba final', 132, 1, 1, 15, 5, 200, 0),
(229, '2018-04-20', '09:20:38', '2000.0000', '-2015.0000', 'total', 132, 15, 1, 15, 23, 200, 0),
(230, '2018-04-24', '08:03:51', '5.0000', '1005.0000', '', 131, 250, 505, 10, 4, 199, 0),
(231, '2018-04-24', '08:03:51', '5.0000', '1005.0000', '', 131, 241, 505, 10, 4, 199, 0),
(232, '2018-04-24', '08:04:32', '1000.0000', '0.0000', 'registo de producto en sistema', 132, 241, 60, 10, 12, 133, 0),
(233, '2018-04-24', '08:04:55', '1000.0000', '0.0000', 'registo de producto en sistema', 132, 250, 60, 10, 12, 133, 0),
(234, '2018-04-24', '08:05:46', '5.0000', '1005.0000', '', 131, 241, 505, 10, 4, 199, 0),
(235, '2018-04-24', '08:05:47', '5.0000', '1005.0000', '', 131, 250, 505, 10, 4, 199, 0),
(236, '2018-04-24', '08:57:15', '5.0000', '6005.0000', '', 131, 241, 505, 10, 4, 199, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `accion` varchar(15) DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `fecha`, `hora`, `referencia`, `nombre`, `accion`, `usuario`, `unidad_negocio_id`) VALUES
(1, '2017-08-16', '10:44:36', 'Producto', 'Queso amarillo', 'Creado', 'Freddy Diaz', 59),
(2, '2017-08-18', '08:42:15', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(3, '2017-08-21', '03:16:54', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(4, '2017-08-21', '09:36:10', 'Producto', 'Jamon', 'Creado', 'Freddy Diaz', 59),
(5, '2017-08-21', '09:40:15', 'Producto', 'Jamon', 'Creado', 'Freddy Diaz', 59),
(6, '2017-08-21', '09:46:01', 'Producto', 'Jamon', 'Eliminado', 'Freddy Diaz', 59),
(7, '2017-08-21', '09:46:46', 'Producto', 'Jamon', 'Eliminado', 'Freddy Diaz', 59),
(8, '2017-08-29', '07:49:31', 'Producto', 'Agua saborizada', 'Creado', 'Freddy Diaz', 59),
(9, '2017-08-29', '08:02:21', 'Producto', 'Agua saborizada', 'Creado', 'Freddy Diaz', 59),
(10, '2017-08-29', '08:20:21', 'Producto', 'Agua saborizada', 'Creado', 'Freddy Diaz', 59),
(11, '2017-08-29', '08:31:57', 'Producto', 'Agua saborizada', 'Creado', 'Freddy Diaz', 59),
(12, '2017-08-29', '08:32:25', 'Producto', 'Agua saborizada', 'Creado', 'Freddy Diaz', 59),
(13, '2017-11-21', '03:51:24', 'Producto', 'harina', 'Creado', 'Freddy Diaz', 59),
(14, '2017-11-21', '03:51:32', 'Producto', 'harina', 'Eliminado', 'Freddy Diaz', 59),
(15, '2017-11-22', '12:38:08', 'Producto', 'Agua saborizada', 'Modificado', 'Freddy Diaz', 59),
(16, '2017-11-22', '12:38:20', 'Producto', 'Agua saborizada', 'Modificado', 'Freddy Diaz', 59),
(17, '2017-11-22', '12:38:31', 'Producto', 'Agua saborizada', 'Modificado', 'Freddy Diaz', 59),
(18, '2017-11-22', '01:02:46', 'Producto', 'harina', 'Modificado', 'Freddy Diaz', 59),
(19, '2017-11-22', '01:03:03', 'Producto', 'harina', 'Modificado', 'Freddy Diaz', 59),
(20, '2017-11-22', '01:15:46', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(21, '2017-11-22', '01:16:13', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(22, '2017-11-22', '01:16:57', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(23, '2017-11-22', '02:06:36', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(24, '2017-11-22', '03:12:51', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(25, '2017-11-22', '03:15:06', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(26, '2017-11-22', '03:16:14', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(27, '2017-11-22', '03:17:42', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(28, '2017-11-22', '03:19:36', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(29, '2017-11-22', '03:22:26', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(30, '2017-11-22', '03:22:33', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(31, '2017-11-22', '03:28:31', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(32, '2017-11-22', '03:29:02', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(33, '2017-11-22', '03:32:07', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(34, '2017-11-22', '03:32:28', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(35, '2017-11-22', '03:35:42', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(36, '2017-11-22', '03:35:53', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(37, '2017-11-22', '03:36:01', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(38, '2017-11-22', '03:41:22', 'Producto', 'Arroz', 'Eliminado', 'Freddy Diaz', 59),
(39, '2017-11-22', '03:56:49', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(40, '2017-11-23', '09:48:33', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(41, '2017-11-23', '10:41:50', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(42, '2017-11-23', '02:54:48', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(43, '2017-11-23', '02:55:14', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(44, '2017-11-23', '02:55:27', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(45, '2017-11-23', '02:55:34', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(46, '2017-11-24', '03:11:56', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(47, '2017-11-24', '03:13:23', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(48, '2017-11-24', '03:13:54', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(49, '2017-11-24', '03:39:47', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(50, '2017-11-24', '03:41:20', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(51, '2017-11-24', '03:42:30', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(52, '2017-11-24', '05:17:03', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(53, '2017-11-27', '09:52:03', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(54, '2017-11-27', '10:42:59', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(55, '2017-11-27', '10:45:47', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(56, '2017-11-27', '10:48:39', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(57, '2017-11-27', '12:46:59', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(58, '2017-12-04', '10:15:30', 'Producto', 'arroz', 'Creado', 'Freddy Diaz', 59),
(59, '2017-12-04', '11:09:57', 'Producto', 'Refresco', 'Creado', 'Freddy Diaz', 59),
(60, '2017-12-04', '02:46:34', 'Producto', 'pasta', 'Creado', 'Freddy Diaz', 59),
(61, '2017-12-04', '02:49:55', 'Producto', 'Refresco', 'Creado', 'Freddy Diaz', 59),
(62, '2017-12-04', '02:52:40', 'Producto', 'Refresco', 'Eliminado', 'Freddy Diaz', 59),
(63, '2017-12-04', '03:00:37', 'Producto', 'Atun', 'Creado', 'Freddy Diaz', 59),
(64, '2017-12-04', '03:05:04', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(65, '2017-12-04', '03:05:42', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(66, '2017-12-04', '03:26:37', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(67, '2017-12-04', '03:26:52', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(68, '2017-12-04', '03:28:13', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(69, '2017-12-04', '04:05:43', 'Producto', 'salsa', 'Creado', 'Freddy Diaz', 59),
(70, '2017-12-04', '04:27:15', 'Producto', 'azucar', 'Creado', 'Freddy Diaz', 59),
(71, '2017-12-06', '02:55:43', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 1),
(72, '2017-12-06', '03:05:30', 'Producto', 'asdas', 'Creado', 'Freddy Diaz', 59),
(73, '2017-12-06', '03:06:48', 'Producto', 'fdsfsdf', 'Creado', 'Freddy Diaz', 59),
(74, '2017-12-06', '03:07:25', 'Producto', 'fdsfsdf', 'Modificado', 'Freddy Diaz', 59),
(75, '2017-12-27', '10:45:00', 'Producto', 'asdas', 'Eliminado', 'Freddy Diaz', 59),
(76, '2017-12-27', '10:45:08', 'Producto', 'fdsfsdf', 'Eliminado', 'Freddy Diaz', 59),
(77, '2017-12-27', '10:48:01', 'Producto', 'arroz', 'Creado', 'Freddy Diaz', 59),
(78, '2017-12-27', '10:48:21', 'Producto', 'arroz', 'Eliminado', 'Freddy Diaz', 59),
(79, '2017-12-27', '10:48:35', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59),
(80, '2017-12-27', '10:49:27', 'Producto', 'arroz', 'Modificado', 'Freddy Diaz', 59),
(81, '2017-12-28', '09:33:04', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 1),
(82, '2017-12-28', '11:05:32', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 1),
(83, '2017-12-28', '11:10:55', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 1),
(84, '2017-12-28', '11:11:59', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 1),
(85, '2017-12-28', '11:15:47', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(86, '2017-12-28', '11:17:25', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(87, '2017-12-28', '11:17:52', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(88, '2017-12-28', '11:18:15', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(89, '2017-12-28', '11:18:33', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(90, '2017-12-28', '11:20:30', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(91, '2017-12-28', '11:41:28', 'Producto', 'probadita', 'Creado', 'Freddy Diaz', 59),
(92, '2017-12-28', '11:42:13', 'Producto', 'probadita', 'Eliminado', 'Freddy Diaz', 59),
(93, '2017-12-28', '11:43:03', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(94, '2018-01-08', '12:05:12', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 1),
(95, '2018-01-08', '12:05:27', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 1),
(96, '2018-01-08', '12:05:37', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 1),
(97, '2018-01-08', '12:48:58', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(98, '2018-01-08', '12:49:09', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(99, '2018-01-11', '03:24:00', 'Producto', 'Brownie', 'Modificado', 'Jean Gilles  Raimbault', 59),
(100, '2018-01-17', '02:31:27', 'Producto', 'masa para pizza', 'Creado', 'Rodolfo Leon', 60),
(101, '2018-01-19', '11:51:13', 'Producto', 'prueba', 'Creado', 'Jean Gilles  Raimbault', 59),
(102, '2018-01-22', '08:51:14', 'Producto', 'prueba', 'Modificado', 'Freddy Diaz', 59),
(103, '2018-01-22', '08:51:52', 'Producto', 'prueba', 'Eliminado', 'Freddy Diaz', 59),
(104, '2018-01-22', '04:57:52', 'Producto', 'masa para pizza 2', 'Creado', 'Freddy Diaz', 59),
(105, '2018-01-25', '12:13:09', 'Producto', 'agrupado 4', 'Creado', 'Freddy Diaz', 59),
(106, '2018-01-26', '02:14:31', 'Producto', 'prueba asociado', 'Creado', 'Freddy Diaz', 59),
(107, '2018-01-26', '02:17:41', 'Producto', 'arroz', 'Creado', 'Freddy Diaz', 59),
(108, '2018-01-26', '02:45:39', 'Producto', 'arroz asociado', 'Creado', 'Freddy Diaz', 59),
(109, '2018-01-26', '02:48:52', 'Producto', 'asociado arroz', 'Creado', 'Freddy Diaz', 59),
(110, '2018-01-26', '02:52:18', 'Producto', 'asoc arroz', 'Creado', 'Freddy Diaz', 59),
(111, '2018-01-26', '02:52:41', 'Producto', 'asoc arroz', 'Creado', 'Freddy Diaz', 59),
(112, '2018-01-26', '03:02:16', 'Producto', 'asdasd', 'Creado', 'Freddy Diaz', 59),
(113, '2018-01-26', '03:02:26', 'Producto', 'asdasd', 'Eliminado', 'Freddy Diaz', 59),
(114, '2018-01-26', '03:02:36', 'Producto', 'arroz', 'Eliminado', 'Freddy Diaz', 59),
(115, '2018-01-26', '03:02:47', 'Producto', 'arroz asociado', 'Eliminado', 'Freddy Diaz', 59),
(116, '2018-01-26', '03:02:54', 'Producto', 'asociado arroz', 'Eliminado', 'Freddy Diaz', 59),
(117, '2018-01-26', '03:03:05', 'Producto', 'asoc arroz', 'Eliminado', 'Freddy Diaz', 59),
(118, '2018-01-26', '03:33:16', 'Producto', 'probando', 'Creado', 'Freddy Diaz', 59),
(119, '2018-01-26', '05:17:04', 'Producto', 'asdd', 'Creado', 'Freddy Diaz', 59),
(120, '2018-01-29', '10:07:21', 'Producto', 'Asociado de aderezos', 'Creado', 'Freddy Diaz', 59),
(121, '2018-01-29', '03:14:36', 'Producto', 'semi prueba', 'Creado', 'Freddy Diaz', 59),
(122, '2018-01-29', '04:07:13', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(123, '2018-01-29', '04:07:34', 'Producto', 'Arroz', 'Modificado', 'Freddy Diaz', 59),
(124, '2018-01-29', '04:10:33', 'Producto', 'agrupado probandodd', 'Modificado', 'Freddy Diaz', 59),
(125, '2018-01-29', '04:11:02', 'Producto', 'agrupado 4', 'Modificado', 'Freddy Diaz', 59),
(126, '2018-01-29', '04:13:34', 'Producto', 'prueba asociado update', 'Modificado', 'Freddy Diaz', 59),
(127, '2018-01-29', '04:14:11', 'Producto', 'prueba asociado update', 'Modificado', 'Freddy Diaz', 59),
(128, '2018-01-29', '04:14:39', 'Producto', 'prueba asociado', 'Modificado', 'Freddy Diaz', 59),
(129, '2018-01-29', '05:03:20', 'Producto', 'prueba asociado', 'Modificado', 'Freddy Diaz', 59),
(130, '2018-01-29', '05:12:19', 'Producto', 'prueba asociado', 'Creado', 'Freddy Diaz', 59),
(131, '2018-01-29', '05:21:53', 'Producto', 'prueba asociado', 'Modificado', 'Freddy Diaz', 59),
(132, '2018-02-20', '11:03:06', 'Producto', 'Cebolla', 'Creado', 'Freddy Diaz', 59),
(133, '2018-02-20', '11:04:24', 'Producto', 'Cebolla blanca', 'Modificado', 'Freddy Diaz', 59),
(134, '2018-03-12', '10:10:27', 'Producto', 'CEBOLLA MORADA', 'Creado', 'Rodolfo Leon', 60),
(135, '2018-03-14', '03:34:25', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(136, '2018-03-14', '03:39:49', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(137, '2018-03-14', '03:43:53', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(138, '2018-03-14', '03:44:20', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(139, '2018-03-14', '03:56:25', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(140, '2018-03-14', '03:57:52', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(141, '2018-03-14', '03:58:44', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(142, '2018-03-14', '03:59:42', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(143, '2018-03-14', '04:01:20', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(144, '2018-03-14', '04:02:28', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(145, '2018-03-14', '04:03:04', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(146, '2018-03-14', '04:04:19', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(147, '2018-03-14', '04:06:47', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(148, '2018-03-14', '04:07:17', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(149, '2018-03-14', '04:15:02', 'Producto', 'Salsa Verde Cremosito (burritos)', 'Modificado', 'Rodolfo Leon', 506),
(150, '2018-03-14', '04:15:24', 'Producto', 'Salsa Verde Cremosito (burritos)', 'Modificado', 'Rodolfo Leon', 506),
(151, '2018-03-14', '04:22:52', 'Producto', 'Salsa Verde Cremosito (burritos)', 'Modificado', 'Rodolfo Leon', 506),
(152, '2018-03-14', '04:24:57', 'Producto', 'Salsa Verde Cremosito (burritos)', 'Modificado', 'Rodolfo Leon', 506),
(153, '2018-03-14', '04:24:57', 'Producto', 'Salsa Verde Cremosito (burritos)', 'Modificado', 'Rodolfo Leon', 506),
(154, '2018-03-14', '04:43:42', 'Producto', 'Salsa Verde Cremosito (burritos)', 'Modificado', 'Rodolfo Leon', 506),
(155, '2018-03-14', '04:43:42', 'Producto', 'Tomate', 'Modificado', 'Rodolfo Leon', 506),
(156, '2018-03-15', '09:03:47', 'Producto', 'congelado', 'Creado', 'Freddy Diaz', 59),
(157, '2018-03-15', '09:26:21', 'Producto', 'QUESO CHEDDAR', 'Creado', 'Rodolfo Leon', 60),
(158, '2018-03-15', '09:54:28', 'Producto', 'Salsa Tartara Cremosito (burritos)', 'Modificado', 'Rodolfo Leon', 506),
(159, '2018-03-15', '09:54:28', 'Producto', 'Cebolla', 'Modificado', 'Rodolfo Leon', 506),
(160, '2018-03-23', '01:52:02', 'Producto', 'Refresco Sevenup', 'Actualizado', 'Freddy Diaz', 1),
(161, '2018-03-23', '01:52:02', 'Producto', 'Atun Margarita', 'Actualizado', 'Freddy Diaz', 1),
(162, '2018-03-23', '01:52:47', 'Producto', 'Albahaca ', 'Actualizado', 'Freddy Diaz', 1),
(163, '2018-03-23', '01:52:47', 'Producto', 'Caramelos Menta', 'Actualizado', 'Freddy Diaz', 1),
(164, '2018-03-23', '01:52:47', 'Producto', 'Cucharitas de postre', 'Actualizado', 'Freddy Diaz', 1),
(165, '2018-03-23', '01:52:47', 'Producto', 'Servilletas z Paveca', 'Actualizado', 'Freddy Diaz', 1),
(166, '2018-03-23', '01:58:51', 'Producto', 'Salsa Tartara Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 506),
(167, '2018-03-23', '01:58:51', 'Producto', 'Cebolla Generico', 'Modificado', 'Rodolfo Leon', 506),
(168, '2018-03-23', '04:38:36', 'Producto', 'Salsa Verde Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 506),
(169, '2018-03-23', '04:38:36', 'Producto', 'Tomate ', 'Modificado', 'Rodolfo Leon', 506),
(170, '2018-03-26', '08:25:42', 'Producto', 'Salsa Verde Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 506),
(171, '2018-03-26', '08:25:42', 'Producto', 'Tomate ', 'Modificado', 'Rodolfo Leon', 506),
(172, '2018-03-26', '08:29:56', 'Producto', 'Tomate ', 'Actualizado', 'Rodolfo Leon', 506),
(173, '2018-03-26', '09:20:38', 'Producto', 'Salsa Verde Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 506),
(174, '2018-03-26', '09:20:38', 'Producto', 'Tomate ', 'Modificado', 'Rodolfo Leon', 506),
(175, '2018-03-26', '09:32:43', 'Producto', 'Aceitunas verdes ', 'Actualizado', 'Rodolfo Leon', 506),
(176, '2018-03-26', '09:32:43', 'Producto', 'Arroz Santoni', 'Actualizado', 'Rodolfo Leon', 506),
(177, '2018-03-26', '10:03:17', 'Producto', 'Arroz Blanco (burritos) Generico', 'Modificado', 'Rodolfo Leon', 505),
(178, '2018-03-26', '10:03:17', 'Producto', 'Arroz Blanco Generico', 'Modificado', 'Rodolfo Leon', 505),
(179, '2018-03-26', '10:03:18', 'Producto', 'Pimienta Limon Generico', 'Modificado', 'Rodolfo Leon', 505),
(180, '2018-03-26', '10:03:18', 'Producto', 'Sal Generico', 'Modificado', 'Rodolfo Leon', 505),
(181, '2018-03-26', '10:03:18', 'Producto', 'Oregano En Hoja Generico', 'Modificado', 'Rodolfo Leon', 505),
(182, '2018-04-03', '04:51:47', 'Producto', 'Arroz Blanco n/a', 'Modificado', 'Rodolfo Leon', 60),
(183, '2018-04-03', '04:53:36', 'Producto', 'Arroz Blanco n/a', 'Modificado', 'Rodolfo Leon', 60),
(184, '2018-04-03', '04:56:53', 'Producto', 'Arroz Blanco n/a', 'Modificado', 'Rodolfo Leon', 60),
(185, '2018-04-03', '05:00:56', 'Producto', 'Oregano En Hoja Generico', 'Modificado', 'Rodolfo Leon', 60),
(186, '2018-04-03', '05:02:34', 'Producto', 'Pimienta Limon ', 'Modificado', 'Rodolfo Leon', 60),
(187, '2018-04-03', '05:05:31', 'Producto', 'Sal ', 'Modificado', 'Rodolfo Leon', 60),
(188, '2018-04-03', '07:24:18', 'Producto', 'Salsa Verde Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 506),
(189, '2018-04-03', '07:24:18', 'Producto', 'Tomate ', 'Modificado', 'Rodolfo Leon', 506),
(190, '2018-04-03', '07:30:51', 'Producto', 'Refresco Coca-cola', 'Modificado', 'Rodolfo Leon', 506),
(191, '2018-04-03', '07:31:23', 'Producto', 'Refresco Coca-cola', 'Modificado', 'Rodolfo Leon', 506),
(192, '2018-04-03', '07:31:54', 'Producto', 'Refresco Coca-cola', 'Modificado', 'Rodolfo Leon', 506),
(193, '2018-04-04', '09:30:56', 'Producto', 'Salsa Tartara Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 505),
(194, '2018-04-04', '09:30:56', 'Producto', 'Cebolla Generico', 'Modificado', 'Rodolfo Leon', 505),
(195, '2018-04-04', '09:30:56', 'Producto', 'Pepinillo Generico', 'Modificado', 'Rodolfo Leon', 505),
(196, '2018-04-04', '09:30:56', 'Producto', 'Mayonesa De Chipotle Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 505),
(197, '2018-04-04', '09:30:56', 'Producto', 'Sal ', 'Modificado', 'Rodolfo Leon', 505),
(198, '2018-04-04', '09:32:44', 'Producto', 'Salsa Tartara Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 505),
(199, '2018-04-04', '09:32:44', 'Producto', 'Cebolla Generico', 'Modificado', 'Rodolfo Leon', 505),
(200, '2018-04-04', '09:32:44', 'Producto', 'Pepinillo Generico', 'Modificado', 'Rodolfo Leon', 505),
(201, '2018-04-04', '09:32:44', 'Producto', 'Mayonesa De Chipotle Cremosito (burritos) Generico', 'Modificado', 'Rodolfo Leon', 505),
(202, '2018-04-04', '09:32:45', 'Producto', 'Sal ', 'Modificado', 'Rodolfo Leon', 505),
(203, '2018-04-04', '09:41:30', 'Producto', 'Coca-cola Light Lata Generico', 'Modificado', 'Rodolfo Leon', 505),
(204, '2018-04-04', '09:42:00', 'Producto', 'Coca-cola Light Lata Generico', 'Modificado', 'Rodolfo Leon', 505),
(205, '2018-04-11', '09:40:51', 'Producto', 'Arroz Blanco (burritos) Generico', 'Modificado', 'Rodolfo Leon', 505),
(206, '2018-04-11', '09:41:51', 'Producto', 'Arroz Blanco (burritos) Generico', 'Modificado', 'Rodolfo Leon', 505),
(207, '2018-04-11', '09:50:59', 'Producto', 'Pimienta Limon ', 'Modificado', 'Rodolfo Leon', 60),
(208, '2018-04-11', '09:55:38', 'Producto', 'Oregano En Hoja Generico', 'Modificado', 'Rodolfo Leon', 60),
(209, '2018-04-12', '10:03:13', 'Producto', 'Queso Mozarella', 'Modificado', 'Freddy Diaz', 59),
(210, '2018-04-18', '03:47:49', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(211, '2018-04-18', '03:47:50', 'Producto', 'Refresco Sevenup', 'Modificado', 'Freddy Diaz', 1),
(212, '2018-04-18', '03:49:48', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(213, '2018-04-18', '03:53:04', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(214, '2018-04-18', '03:53:04', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(215, '2018-04-18', '03:54:06', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(216, '2018-04-18', '03:57:16', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(217, '2018-04-18', '04:04:42', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(218, '2018-04-18', '04:04:42', 'Producto', 'Refresco Sevenup', 'Modificado', 'Freddy Diaz', 1),
(219, '2018-04-18', '07:34:49', 'Producto', 'salsa ketchup', 'Modificado', 'Freddy Diaz', 59),
(220, '2018-04-18', '07:39:43', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 59),
(221, '2018-04-20', '02:06:33', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(222, '2018-04-20', '02:07:55', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(223, '2018-04-20', '02:07:55', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(224, '2018-04-20', '02:08:53', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(225, '2018-04-20', '02:09:55', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(226, '2018-04-20', '02:11:12', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(227, '2018-04-20', '02:12:20', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(228, '2018-04-20', '02:51:39', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(229, '2018-04-20', '03:15:29', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(230, '2018-04-20', '05:43:36', 'Producto', 'Refresco Sevenup', 'Modificado', 'Freddy Diaz', 1),
(231, '2018-04-20', '05:47:08', 'Producto', 'salsa ketchup', 'Modificado', 'Freddy Diaz', 1),
(232, '2018-04-20', '07:11:53', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(233, '2018-04-20', '07:11:53', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(234, '2018-04-20', '07:15:48', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(235, '2018-04-20', '07:24:05', 'Producto', 'Refresco Sevenup', 'Modificado', 'Freddy Diaz', 1),
(236, '2018-04-20', '07:25:24', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(237, '2018-04-20', '07:26:46', 'Producto', 'azucar la lucha', 'Modificado', 'Freddy Diaz', 1),
(238, '2018-04-20', '07:26:46', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(239, '2018-04-20', '07:35:56', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(240, '2018-04-20', '07:38:53', 'Producto', 'azucar la lucha', 'Modificado', 'Freddy Diaz', 1),
(241, '2018-04-20', '08:26:06', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(242, '2018-04-20', '08:28:13', 'Producto', 'Atun Margarita', 'Modificado', 'Freddy Diaz', 1),
(243, '2018-04-20', '08:31:44', 'Producto', 'salsa ketchup', 'Modificado', 'Freddy Diaz', 1),
(244, '2018-04-20', '08:55:07', 'Producto', 'azucar la lucha', 'Modificado', 'Freddy Diaz', 1),
(245, '2018-04-20', '08:55:07', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(246, '2018-04-20', '08:55:54', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(247, '2018-04-20', '09:16:17', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(248, '2018-04-20', '09:16:43', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(249, '2018-04-20', '09:16:43', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(250, '2018-04-20', '09:18:07', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(251, '2018-04-20', '09:18:27', 'Producto', 'Arroz Primor', 'Modificado', 'Freddy Diaz', 1),
(252, '2018-04-20', '09:20:38', 'Producto', 'Refresco Sevenup', 'Modificado', 'Freddy Diaz', 1),
(253, '2018-04-24', '08:03:51', 'Producto', 'Desengrasante Generico', 'Modificado', 'Rodolfo Leon', 505),
(254, '2018-04-24', '08:03:51', 'Producto', 'Cloro Generico', 'Modificado', 'Rodolfo Leon', 505),
(255, '2018-04-24', '08:04:32', 'Producto', 'Cloro Generico', 'Modificado', 'Rodolfo Leon', 60),
(256, '2018-04-24', '08:04:55', 'Producto', 'Desengrasante Generico', 'Modificado', 'Rodolfo Leon', 60),
(257, '2018-04-24', '08:05:46', 'Producto', 'Cloro Generico', 'Modificado', 'Rodolfo Leon', 505),
(258, '2018-04-24', '08:05:46', 'Producto', 'Desengrasante Generico', 'Modificado', 'Rodolfo Leon', 505),
(259, '2018-04-24', '08:57:15', 'Producto', 'Cloro Generico', 'Modificado', 'Rodolfo Leon', 505);

-- --------------------------------------------------------

--
-- Table structure for table `mercancia`
--

CREATE TABLE `mercancia` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `codigo_anterior` varchar(45) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` varchar(100) DEFAULT ' ',
  `precio_unitario` decimal(19,4) DEFAULT NULL,
  `contenido_neto` decimal(19,4) DEFAULT '0.0000',
  `cantidad_presentacion` int(11) DEFAULT '1',
  `formula_c` varchar(45) DEFAULT NULL,
  `formula_p` varchar(45) DEFAULT NULL,
  `formula_s` varchar(45) DEFAULT NULL,
  `familia_id` int(11) NOT NULL,
  `sub_familia_id` int(11) DEFAULT NULL,
  `unidad_medida_compra_id` int(11) DEFAULT NULL,
  `unidad_medida_consumo_id` int(11) NOT NULL,
  `unidad_medida_sistema_id` int(11) NOT NULL,
  `peso_escurrido` decimal(19,4) DEFAULT NULL,
  `descripcion` text,
  `exento_impuesto` tinyint(1) DEFAULT NULL,
  `receta_id` int(11) DEFAULT NULL,
  `tipo_mercancia_id` int(11) NOT NULL,
  `asociado_id` int(11) DEFAULT NULL,
  `tipo_inventario_id` int(11) DEFAULT NULL,
  `tipo_producto` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia`
--

INSERT INTO `mercancia` (`id`, `codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `sub_familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`, `peso_escurrido`, `descripcion`, `exento_impuesto`, `receta_id`, `tipo_mercancia_id`, `asociado_id`, `tipo_inventario_id`, `tipo_producto`) VALUES
(1, 'A001', '', 'Arroz', 'Primor', '1000.0000', '990.0000', 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, 149, 19, 5, 6, '0.0000', '', NULL, 18, 160, NULL, 164, 1),
(2, 'B002', '', 'Refresco', 'Coca-cola', '5000.0000', '2000.0000', 12, 'Cja * 2000', 'Ltrs *', 'Ml *', 117, NULL, 11, 4, 12, NULL, NULL, NULL, 12, 160, 75, NULL, 1),
(4, 'AC001', NULL, 'Aceite', 'Vatel', '0.0000', '1000.0000', 12, 'Cja * 1000', NULL, NULL, 116, NULL, 11, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(6, 'Q0010', '', 'Queso', 'Mozarella', '10000.0000', '1000.0000', 12, 'Cja * 1000', 'Kgs * ', 'Gr * ', 116, 148, 11, 5, 6, '0.0000', '', NULL, NULL, 160, NULL, 164, 1),
(7, 'H0012', '', 'Harina', 'Pan', '8000.0000', '990.0000', 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(8, 'J0041', NULL, 'Jamon', 'Plumrose', '50000.0000', '25000.0000', 1, 'Pza * 2500', '', '', 116, NULL, 14, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(9, '59006', NULL, 'Agua saborizada', 'Los andes', '1000.0000', '700.0000', 24, 'Cja * 700', NULL, NULL, 117, NULL, 11, 7, 12, NULL, NULL, 1, NULL, 160, NULL, NULL, 1),
(11, '59007', 'abcdf', 'harina', 'juana', '40000.0000', '1000.0000', 24, 'Blto * 1000', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, '1000.0000', 'harina de maiz', 1, NULL, 160, NULL, NULL, 1),
(12, '59007', 'abcd', 'arroz', 'mary', '4000.0000', '990.0000', 3, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, '1000.0000', 'arroz mary 1 kg', 0, NULL, 160, NULL, NULL, 1),
(13, '59008', 'p003', 'Refresco', 'refresco pepsi de 1 litro', '50.0000', '1000.0000', 9, 'Cja * 9', 'null', 'null', 117, NULL, 11, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(14, '59009', NULL, 'pasta', 'primor', '40.0000', '1000.0000', 2, 'Kgs * 1000', 'null', 'null', 116, NULL, 5, 5, 6, '1000.0000', 'probando', 0, NULL, 160, NULL, NULL, 1),
(15, '5900101', '', 'Refresco', 'Sevenup', '50000.0000', '2000.0000', 3, 'Cja * 2000', 'null', 'null', 117, NULL, 11, 4, 12, NULL, NULL, NULL, NULL, 160, 75, NULL, 1),
(16, '590010', NULL, 'Atun', 'Margarita', '3000.0000', '500.0000', 2, 'Lta * 500', 'null', 'null', 116, NULL, 15, 15, 6, '450.0000', 'atun enlatado margarita 500gr', 0, 13, 160, NULL, NULL, 1),
(17, '590011', NULL, 'salsa', 'ketchup', '2000.0000', '250.0000', 20, 'Ltrs * 250', 'null', 'null', 116, NULL, 4, 4, 12, '250.0000', 'prueba precio proveedor', 0, NULL, 160, NULL, NULL, 1),
(18, '590012', NULL, 'azucar', 'la lucha', '25000.0000', '1000.0000', 2, 'Kgs * 1000', 'null', 'null', 116, NULL, 5, 5, 6, '1000.0000', 'probando', 0, NULL, 160, NULL, NULL, 1),
(21, 'BRI001', '', 'Brownie', 'Savoy', '1000.0000', '600.0000', 12, 'Cja * 600', 'Un *', 'Un *', 116, NULL, 11, 13, 13, NULL, NULL, NULL, 23, 160, NULL, NULL, 1),
(22, 'CM001', '', 'Caramelos', 'Menta', '1000.0000', '1.0000', 24, 'Cja * 1', 'Gr *', 'Gr *', 116, NULL, 11, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(23, 'CC001', '', 'Cucharitas', 'de postre', '1000.0000', '20.0000', 24, 'Pqte * 20', 'Un *', 'Un *', 119, NULL, 16, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(24, 'SVZ001', '', 'Servilletas z', 'Paveca', '5000.0000', '100.0000', 100, 'Pqte * 100', 'Un *', 'Un *', 119, NULL, 16, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(26, 'AL001', '', 'Albahaca', '', '1000.0000', '990.0000', 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(27, 'TM001', '', 'Tomate', '', '700.0000', '1.0000', 1, 'Blto * 1', 'Kgs *', 'Gr *', 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(28, 'CP001', '', 'Cuchillos', 'Plasticos', '6000.0000', '100.0000', 100, 'Pqte * 100', 'Un *', 'Un *', 119, NULL, 16, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(29, 'ADC001', '', 'Aderezo', 'Caprese', '1000.0000', '990.0000', 24, 'Caja * 990', 'Ltr *', 'Ml *', 116, NULL, 11, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(30, 'TND001', '', 'Tenedores', 'Plasticos', '6000.0000', '100.0000', 100, 'Pqte * 100', 'Un *', 'Un *', 119, NULL, 16, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(31, '5900121', '', 'arroz', 'casa', '2000.0000', '1000.0000', 3, 'Kgs * 1000', '', '', 116, NULL, 5, 5, 6, '1100.0000', 'arroz prueba', 0, NULL, 160, NULL, NULL, 1),
(32, '590021', '', 'probadita', 'wasa', '2000.0000', '2112.0000', 10, 'Cja * 2112', '', '', 116, NULL, 11, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(33, 'AC003', '', 'Aceitunas verdes', '', '2000.0000', '990.0000', 1, 'Fr * 990', 'Gr *', 'Gr *', 116, NULL, 24, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(35, 'ACH01', NULL, 'Achiote', ' ', '12000.0000', '1000.0000', 1, 'Paq * 1000', NULL, NULL, 116, NULL, 16, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(36, 'AJ001', NULL, 'Ajo', ' ', '1000.0000', '1000.0000', 1, 'Paq * 1000', NULL, NULL, 116, NULL, 16, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(37, 'AP001', NULL, 'Apio', ' ', '10000.0000', '1000.0000', 1, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(38, 'A005', '', 'Arroz', 'Santoni', '20000.0000', '990.0000', 1, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(39, 'CE0002', NULL, 'Cebolla', ' ', '10000.0000', '1000.0000', 1, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(40, 'CO001', NULL, 'Consome', ' ', '2000.0000', '1000.0000', 1, 'Ltr * 1000', NULL, NULL, 116, NULL, 4, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(41, 'CP002', NULL, 'Cubito', 'Magi', '1000.0000', '100.0000', 10, 'Paq * 100', NULL, NULL, 116, NULL, 16, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(42, 'CU001', NULL, 'Culantro', ' ', '10000.0000', '1000.0000', 1000, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(43, 'PI0001', NULL, 'Perejil', ' ', '10000.0000', '1000.0000', 1000, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(44, 'PI0002', NULL, 'Pimenton', ' ', '10000.0000', '1000.0000', 1, 'Un * 1000', NULL, NULL, 116, NULL, 13, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(45, 'Pi0003', NULL, 'Pimienta Molida', ' ', '15000.0000', '1000.0000', 1, 'Paq * 1000', NULL, NULL, 116, NULL, 16, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(46, 'PO001', '', 'Pollo cocido', ' ', '10000.0000', '1000.0000', 1, 'Kgr * 2000', 'Kgr *', 'Gr *', 116, NULL, 13, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(47, 'SA001', '', 'Sal', 'casa', '20000.0000', '990.0000', 1, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(48, 'G00001', NULL, 'Guisantes', ' ', '10000.0000', '1000.0000', 1, 'Lta * 1000', NULL, NULL, 116, NULL, 15, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(49, 'PA0001', NULL, 'Papa', ' ', '10000.0000', '1000.0000', 1, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(50, 'HU001', '', 'Huevos', 'ovomar', '6000.0000', '1.0000', 24, 'Cja * 1', '', '', 116, NULL, 11, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(51, 'MY001', '', 'Mayonesa', 'Craft', '30000.0000', '1000.0000', 12, 'Cja * 1000', '', '', 116, NULL, 11, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(52, 'MT001', '', 'Mostaza', 'Craft', '30000.0000', '1000.0000', 12, 'Cja * 1000', '', '', 116, NULL, 11, 6, 6, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(53, 'HU001', '', 'Yema de huevo', ' ', '6000.0000', '1.0000', 24, 'Cja * 1', '', '', 116, NULL, 11, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, NULL, 1),
(54, '600022', '', 'masa para pizza', ' ', '11000.0000', '1000.0000', 10, 'Kgs * 1000', '', '', 116, NULL, 5, 6, 6, '1.0000', '', 0, 24, 160, NULL, NULL, 1),
(59, 'mp2', '', 'masa para pizza 12', '', NULL, '0.0000', 1, NULL, '', '', 135, 158, NULL, 13, 13, '1.0000', 'prueba', NULL, NULL, 161, NULL, NULL, 1),
(60, 'AGA001', '', 'agrupado 2', '', NULL, '0.0000', 1, NULL, '', '', 116, NULL, NULL, 13, 13, NULL, '', NULL, NULL, 161, NULL, NULL, 1),
(61, 'AGA001', '', 'agrupado 2', '', NULL, '0.0000', 1, NULL, '', '', 116, NULL, NULL, 13, 13, NULL, '', NULL, NULL, 161, NULL, NULL, 1),
(62, 'AGA2', '', 'agrupado 3', '', NULL, '0.0000', 1, NULL, '', '', 116, NULL, NULL, 13, 13, NULL, '', NULL, NULL, 161, NULL, NULL, 1),
(63, 'AGA3', '', 'agrupado 4', '', '3000.0000', '0.0000', 1, NULL, 'Un * ', 'Un * ', 116, NULL, NULL, 13, 13, NULL, 'prueba 4 agrupados', NULL, 25, 161, NULL, 164, 1),
(64, '5900102', '', 'prueba asociado', '', NULL, '0.0000', 1, NULL, 'Ml * ', 'Ml * ', 117, NULL, NULL, 5, 6, NULL, '', NULL, NULL, 162, NULL, 164, 1),
(65, 'ASA01', '', 'arroz', '', NULL, '0.0000', 1, NULL, '', '', 116, NULL, NULL, 6, 6, NULL, '', NULL, NULL, 162, NULL, NULL, 1),
(66, 'ASA2', '', 'arroz asociado', '', '5000.0000', '0.0000', 1, NULL, '', '', 116, NULL, NULL, 6, 6, NULL, '', NULL, NULL, 162, NULL, NULL, 1),
(67, 'ASA3', '', 'asociado arroz', '', '5000.0000', '0.0000', 1, NULL, '', '', 116, NULL, NULL, 6, 6, NULL, '', NULL, NULL, 162, NULL, NULL, 1),
(69, 'ASA4', '', 'asoc arroz', '', '2500.0000', '0.0000', 1, NULL, '', '', 116, NULL, NULL, 6, 6, NULL, '', NULL, NULL, 162, NULL, NULL, 1),
(70, 'ASA5', '', 'asdasd', 'Generico', '3000.0000', '0.0000', 1, NULL, '', '', 116, NULL, NULL, 13, 13, NULL, '', NULL, NULL, 162, NULL, NULL, 1),
(71, 'ASA6', '', 'probando', 'Generico', '2500.0000', '0.0000', 1, NULL, '', '', 116, NULL, NULL, 6, 6, NULL, '', NULL, NULL, 162, NULL, NULL, 1),
(72, 'ASA7', '', 'asdd', 'Generico', '10000.0000', '0.0000', 1, NULL, '', '', 116, NULL, NULL, 6, 4, NULL, '', NULL, NULL, 162, NULL, NULL, 1),
(73, 'ASA8', '', 'Asociado de aderezos', 'Generico', '1000.0000', '0.0000', 1, NULL, '', '', 116, 150, NULL, 12, 12, NULL, '', NULL, NULL, 162, NULL, 165, 1),
(74, 'mp3', '', 'semi prueba', 'Generico', NULL, '0.0000', 1, NULL, '', '', 135, NULL, NULL, 6, 6, NULL, '', NULL, NULL, 160, NULL, 164, 1),
(75, '5900103', '', 'prueba asociado', 'Generico', '50000.0000', '0.0000', 1, NULL, 'Ml * ', 'Ml * ', 117, NULL, NULL, 12, 12, NULL, '', NULL, NULL, 162, NULL, 164, 1),
(76, 'BNG0001', NULL, 'Agua Embotellada', 'Generico', '131.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(77, 'ENV0001', NULL, 'Brownie Manjar-rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(78, 'ENV0002', NULL, 'Brownie Nutella-rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(79, 'ENV0003', NULL, 'Brownie Oreo-rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(80, 'ENV0004', NULL, 'Brownie Snicker-rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(81, 'ENV0033', NULL, 'Brownies Clasico-rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(82, 'ENV0006', NULL, 'Brownies Especiales', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(83, 'ST0024', NULL, 'Carne Mechada (burritos)', 'Generico', '29.4850', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(84, 'ST0026', NULL, 'Carne Molida Guisada-rb', 'Generico', '9.5950', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(85, 'BG0005', NULL, 'Coca-cola Light Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(86, 'DS0001', NULL, 'Contenedor De 32 Oz Para Rb Pote Light', 'Generico', '63.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(87, 'ST0067', NULL, 'Guacamole Con Pulpa De Agt (burritos)', 'Generico', '9.5050', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(88, 'ST0079', NULL, 'Marinado Para Pollo (burrito)', 'Generico', '17.6000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(89, 'DS0002', NULL, 'Platos 10 Desechables', 'Generico', '29.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(90, 'ST0119', NULL, 'Pollo A La Parrilla (burritos)', 'Generico', '7.6200', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(91, 'ST0121', NULL, 'Pollo Mechado (burritos)', 'Generico', '37.3650', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(92, 'ST0123', NULL, 'Puerco Guisado-rb', 'Generico', '4.4550', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(93, 'PC0023', NULL, 'Pulpa De Aguacate Rb', 'Generico', '0.3110', '0.0000', 1, NULL, NULL, NULL, 168, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(94, 'LA0017', NULL, 'Queso Mozzarela (rebanado)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 139, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(95, 'ENV0009', NULL, 'Tortilla De Harina De 12', 'Generico', '388.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(96, 'ENV0010', NULL, 'Tortilla De Harina De 10', 'Generico', '360.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(97, 'DS0004', NULL, 'Vasos De 12oz (rb)', 'Generico', '290.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(98, 'DS0006', NULL, 'Vasos De 16oz (rb)', 'Generico', '680.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(99, 'DS0008', NULL, 'Vasos De 22oz (rb)', 'Generico', '238.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1),
(100, 'ENV0011', NULL, 'Aceite', 'Generico', '113.7120', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(101, 'ENV0012', NULL, 'Aceite De Oliva', 'Generico', '3.2020', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(102, 'ENV0164', NULL, 'Aceite En Aerosol', 'Generico', '1.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(103, 'VG0001', NULL, 'Aguacate', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(104, 'ENV0022', '', 'Arroz Blanco', 'n/a', '1.3500', '2000.0000', 10, 'Pqte * 2000', 'Kgs *', 'Gr *', 142, 148, 16, 5, 6, '0.0000', '', NULL, NULL, 160, NULL, 165, 1),
(105, 'ST0008', NULL, 'Arroz Blanco (burritos)', 'Generico', '1.1016', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, 29, 160, NULL, 165, 1),
(106, 'GEN0006', NULL, 'Arroz Generico', ' ', '0.7180', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, 28, 160, NULL, 165, 1),
(107, 'ENV0026', NULL, 'Azucar', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(108, 'ENV0029', NULL, 'Azucar Pulverizada', 'Generico', '2.9000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(109, 'DS0015', NULL, 'Bolsa De Papel 12 Rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(110, 'DS0016', NULL, 'Bolsa De Papel 5 Rb', 'Generico', '19.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(111, 'DS0017', NULL, 'Bolsa De Papel Con Ventana-rb', 'Generico', '0.1580', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(112, 'ST0021', NULL, 'Camarones Guisados Rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, 30, 160, NULL, 165, 1),
(113, 'DS0034', NULL, 'Canoas De Carton Grandes', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(114, 'DS0035', NULL, 'Canoas De Carton Pequenas', 'Generico', '0.0490', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(115, 'ST0022', NULL, 'Carne A La Parrilla (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(116, 'DS0038', NULL, 'Carrizos Forrados', 'Generico', '0.0050', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(117, 'VG0007', NULL, 'Cebolla', 'Generico', '1.3190', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(118, 'VG0008', NULL, 'Cebolla Morada', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(119, 'BG0030', NULL, 'Coca Cola Clasica-lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(120, 'BG0010', NULL, 'Coca Cola Light Bag I B.', 'Generico', '3.4030', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(121, 'BG0011', NULL, 'Coca Cola Zero Bag I B.', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(122, 'BG0037', NULL, 'Coca Cola Zero Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(123, 'BG0001', NULL, 'Coca-cola 1 Lt', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(124, 'BG0002', NULL, 'Coca-cola 2 Lt', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(125, 'BG0012', NULL, 'Coca-cola Bag I B.', 'Generico', '4.0800', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(126, 'ST0037', NULL, 'Congri Frijol Negro Con Arroz (burritos)', 'Generico', '0.7630', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(127, 'GEN0004', NULL, 'Contorno Caliente Generico', ' ', '0.0070', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(128, 'GEN0005', NULL, 'Contorno Frio Generico', ' ', '2.8300', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(129, 'LA0001', NULL, 'Crema Agria', 'Generico', '5.4520', '0.0000', 1, NULL, NULL, NULL, 139, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(130, 'ENV0061', NULL, 'Doritos', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(131, 'ST0056', NULL, 'Ensalada De Tomate Y Maiz (burritos)', 'Generico', '3.7530', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(132, 'DS0054', NULL, 'Envase De (2 Oz) Para Rb', 'Generico', '0.0150', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(133, 'DS0109', NULL, 'Envase De 9 Con 3 Divisiones Rb', 'Generico', '0.3600', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(134, 'DS0113', NULL, 'Envase Para Llevar Transparente Rb', 'Generico', '0.1060', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(135, 'DS0055', NULL, 'Envase Para Papas Fritas Grande Rb', 'Generico', '0.0340', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(136, 'DS0056', NULL, 'Envase Para Papas Fritas Pequeno Rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(137, 'BG0013', NULL, 'Fanta Bag I B.', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(138, 'BG0007', NULL, 'Fresa 2', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(139, 'BG0009', NULL, 'Fresca 2', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(140, 'BG0014', NULL, 'Fresca Bag I B.', 'Generico', '3.7890', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(141, 'BG0036', NULL, 'Fresca Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(142, 'GEN0007', NULL, 'Frijoles', 'Generico', '0.9210', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(143, 'ST0062', NULL, 'Frijoles Negros Guisados (burritos)', 'Generico', '0.8400', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(144, 'ST0064', NULL, 'Frijoles Rojos Guisados (burritos)', 'Generico', '0.9100', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(145, 'NG0003', NULL, 'Garrafon De Agua', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(146, 'BG0015', NULL, 'Ginger Ale Bag I B.', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(147, 'ENV0300', NULL, 'Guacamole Congelado', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(148, 'ENV0084', NULL, 'Jalapeno Rebanado', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(149, 'DS0060', NULL, 'Jueg.cub. Desechables', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(150, 'ENV0086', NULL, 'Jugo De Limon', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(151, 'ENV0089', NULL, 'Ketchup De Paquete', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(152, 'BG0016', NULL, 'Kist De Fresa Bag I B.', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(153, 'BG0033', NULL, 'Kist Fresa Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(154, 'BG0031', NULL, 'Kist Manzana Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(155, 'BG0034', NULL, 'Kist Naranja Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(156, 'BG0032', NULL, 'Kist Uva Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(157, 'VG0016', NULL, 'Lechuga Nacional', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(158, 'VG0017', NULL, 'Lechuga Romana', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(159, 'FT0004', NULL, 'Limon', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 140, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(160, 'ENV0094', NULL, 'Maiz En Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(161, 'ENV0169', NULL, 'Manjar (dulce De Leche)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(162, 'ST0077', NULL, 'Marinado Para Carne (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(163, 'ST0086', NULL, 'Mayonesa De Chipotle Cremosito (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(164, 'ST0094', NULL, 'Mojito (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(165, 'ST0095', NULL, 'Mojito De Cilantro (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(166, 'ENV0109', NULL, 'Nacho Cortado Rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(167, 'BG0017', NULL, 'Nestea Bag In Box', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(168, 'EC0026', '', 'Oregano En Hoja', 'Generico', '19.6500', '1000.0000', 1, 'Kgs * 1000', 'Kgs *', 'Gr *', 141, 148, 5, 5, 6, '0.0000', '', NULL, NULL, 160, NULL, 165, 1),
(169, 'PC0018', NULL, 'Papa Congelada 1/4', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 168, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(170, 'PC0019', NULL, 'Papa Dulce Congelada', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 168, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(171, 'PC0020', NULL, 'Papas Congeladas 3/8', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 168, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(172, 'PC0021', NULL, 'Papas Onduladas', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 168, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(173, 'PC0022', NULL, 'Papas Western', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 168, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(174, 'ENV0123', NULL, 'Pepinillo', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(175, 'ST0115', NULL, 'Picante Chipotle (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(176, 'ENV0124', NULL, 'Picante Delidas', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(177, 'ST0116', NULL, 'Pico De Gallo (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(178, 'ENV0126', NULL, 'Pimienta En Sobre', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(179, 'EC0029', '', 'Pimienta Limon', '', '20.5800', '1000.0000', 1, 'Kgs * 1000', 'Kgs *', 'Gr *', 141, 148, 5, 5, 6, '0.0000', '', NULL, NULL, 160, NULL, 165, 1),
(180, 'EC0031', NULL, 'Pimienta Negra Molida', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 141, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(181, 'VG0026', NULL, 'Platano Maduro', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(182, 'VG0027', NULL, 'Platano Verde', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(183, 'DS0075', NULL, 'Platos 10 Con Division Desechables', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(184, 'LA0012', NULL, 'Queso Americano Amarillo Barra', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 139, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(185, 'LA0018', NULL, 'Queso Mozzarella', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 139, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(186, 'GEN0003', NULL, 'Quesos Genericos', ' ', '0.0000', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(187, 'VG0030', NULL, 'Repollo Blanco', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(188, 'VG0031', NULL, 'Repollo Morado', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(189, 'ENV0138', '', 'Sal', '', '0.6000', '22.7000', 10, 'Frdo * 22.7', 'Kgs *', 'Gr *', 142, 148, 8, 5, 6, '0.0000', '', NULL, NULL, 160, NULL, 165, 1),
(190, 'ENV0139', NULL, 'Sal En Sobre', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(191, 'ST0138', NULL, 'Salsa De Aguacate (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(192, 'ENV0143', NULL, 'Salsa De Queso Fundido', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(193, 'GEN0002', NULL, 'Salsa Generica', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 116, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(194, 'ST0146', NULL, 'Salsa Tartara Cremosito (burritos)', 'Generico', '840.4040', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, 27, 160, NULL, 165, 1),
(195, 'ST0148', NULL, 'Salsa Verde Cremosito (burritos)', 'Generico', '70000.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, 26, 160, NULL, 165, 1),
(196, 'GEN0008', NULL, 'Sodas Genericas Rb', ' ', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(197, 'BG0018', NULL, 'Sprite Bag I B.', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(198, 'BG0035', NULL, 'Sprite Lata', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 117, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(199, 'ST0179', NULL, 'Tajadas Rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(200, 'DS0084', NULL, 'Tapa Para Contenedor De 24 Oz Para Rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(201, 'DS0085', NULL, 'Tapa Para Envase De (2 Oz) Para Rb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(202, 'DS0088', NULL, 'Tapas Vasos De 1 Oz', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(203, 'DS0091', NULL, 'Tapas Para Vasos De 12oz', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(204, 'DS0092', NULL, 'Tapas Para Vasos De 16oz', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(205, 'EMB0013', NULL, 'Tocino Ahumado', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 145, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(206, 'VG0032', NULL, 'Tomate Especial P/salsa', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(207, 'VG0033', NULL, 'Tomate P/ensalada', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 146, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(208, 'ENV0159', NULL, 'Tortilla De Maiz 6 (entera)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(209, 'DS0097', NULL, 'Vaso De 1 Oz.', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(210, 'ST0163', NULL, 'Vegetales Salteados (burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(211, 'ST0164', NULL, 'Vegetales Salteados (cocidos)-(burritos)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(212, 'ENV0161', NULL, 'Vinagre Blanco', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 142, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(213, 'ST0170', NULL, 'Zumo De Limon', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 135, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 165, 1),
(214, 'OT0001', NULL, 'Agua De Grifo', 'Generico', '0.4670', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(215, 'AL0018', NULL, 'Alcogel', 'Generico', '7.0000', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(216, 'AL0001', NULL, 'Ambientador Enlatado', 'Generico', '1.4000', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(217, 'DS0012', NULL, 'Bandeja Tipo B', 'Generico', '0.0130', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(218, 'OF0001', NULL, 'Boligrafo Tinta Azul', 'Generico', '1.1250', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(219, 'OF0002', NULL, 'Boligrafo Tinta Negra', 'Generico', '1.1250', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(220, 'OF0003', NULL, 'Boligrafo Tinta Roja', 'Generico', '1.1250', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(221, 'AL0019', NULL, 'Bolsa De 13 Galones', 'Generico', '0.1310', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(222, 'DS0014', NULL, 'Bolsa De 5 5,6 Camiseta', 'Generico', '0.0220', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(223, 'AL0020', NULL, 'Bolsa Gigantes 37x50 Jumbo', 'Generico', '0.4950', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(224, 'AL0021', NULL, 'Bolsa Jardinera 32x40 Gal.', 'Generico', '0.1190', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(225, 'AL0022', NULL, 'Bolsa Jardinera Transparente 32x40', 'Generico', '0.1340', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(226, 'DS0024', NULL, 'Bolsa Para Porcionar 7x12', 'Generico', '0.0100', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(227, 'PC0002', NULL, 'Bolsas De Hielo', 'Generico', '2.5000', '0.0000', 1, NULL, NULL, NULL, 168, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(228, 'AL0033', NULL, 'Bombillos Espiral 32wts.', 'Generico', '5.9290', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(229, 'OF0004', NULL, 'Borrador De Goma Zh-05', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(230, 'OF0005', NULL, 'Caja De 100 Cartapacios Crema 8.5x11', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(231, 'OF0006', NULL, 'Caja De 100 Cartapacios Crema 8.5x14', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(232, 'OF0007', NULL, 'Caja De 100 Clips 1', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(233, 'OF0008', NULL, 'Caja De 5000 Grapas Std. 26/6 Studmark', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(234, 'OF0009', NULL, 'Caja De Clips Jumbo', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(235, 'OF0010', NULL, 'Caja De Push Pin Colores Surtidos', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(236, 'OF0012', NULL, 'Cartucho Toner Hp-cb435a', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(237, 'OF0017', NULL, 'Cartucho Toner Negro Cb540a', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(238, 'OF0018', NULL, 'Cera Para Contar Dinero', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(239, 'OF0019', NULL, 'Cinta Impresora De Caja-erc-31', 'Generico', '2.1900', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(240, 'OF0020', NULL, 'Cinta Panasonic 115 I', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(241, 'AL0006', '', 'Cloro', 'Generico', '0.7930', '1000.0000', 1, 'Ltrs * 1000', 'Ltrs *', 'Ml *', 169, 148, 4, 4, 12, '0.0000', '', NULL, NULL, 160, NULL, 166, 1),
(242, 'OT0002', NULL, 'Co2 (20 Lbs.)', 'Generico', '9.8600', '0.0000', 1, NULL, NULL, NULL, 136, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(243, 'OT0003', NULL, 'Co2 (35 Lbs.)', 'Generico', '26.3900', '0.0000', 1, NULL, NULL, NULL, 136, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(244, 'OT0004', NULL, 'Co2 (50 Lbs.)', 'Generico', '24.6600', '0.0000', 1, NULL, NULL, NULL, 136, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(245, 'DS0043', NULL, 'Cucharas Dulceras', 'Generico', '0.0100', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(246, 'DS0044', NULL, 'Cucharas Soperas', 'Generico', '0.0100', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(247, 'DS0045', NULL, 'Cuchillos De Plastico', 'Generico', '0.0100', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(248, 'AL0034', NULL, 'Delantales Desechable', 'Generico', '0.2230', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(249, 'OF0021', NULL, 'Descuento De Jubilado (0011)', 'Generico', '0.3120', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(250, 'AL0002', '', 'Desengrasante', 'Generico', '3.1680', '1000.0000', 1, 'Ltrs * 1000', 'Ltrs *', 'Ml *', 169, 148, 4, 4, 12, '0.0000', '', NULL, NULL, 160, NULL, 166, 1),
(251, 'AL0005', NULL, 'Desinfectante', 'Generico', '2.2190', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(252, 'AL0008', NULL, 'Destapador Para Canerias', 'Generico', '7.7410', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(253, 'DS0050', NULL, 'Encendedores-(lighting)', 'Generico', '2.9500', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(254, 'OF0022', NULL, 'Engrapadora Std-bostitch B-515', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(255, 'DS0059', NULL, 'Envases Tipo Fiambrera', 'Generico', '0.0710', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(256, 'AL0024', NULL, 'Escoba Dura', 'Generico', '7.9500', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(257, 'AL0023', NULL, 'Escoba Estandar', 'Generico', '3.6500', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(258, 'AL0040', NULL, 'Esponja 2 Usos', 'Generico', '0.3550', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(259, 'AL0041', NULL, 'Esponja De Acero', 'Generico', '0.2090', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(260, 'AL0036', NULL, 'Guante/limpieza', 'Generico', '1.9630', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(261, 'AL0037', NULL, 'Guantes De Latex', 'Generico', '0.0700', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(262, 'AL0038', NULL, 'Guantes Plasticos Transp', 'Generico', '0.0100', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(263, 'AL0025', NULL, 'Haragan', 'Generico', '26.5000', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(264, 'AL0010', NULL, 'Jabon En Polvo', 'Generico', '1.9360', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 5, 6, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(265, 'AL0009', NULL, 'Jabon Lavaplatos', 'Generico', '3.6810', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(266, 'AL0011', NULL, 'Jabon Para Lavar Manos', 'Generico', '6.5590', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(267, 'OF0025', NULL, 'Lapiz Mecanico 0.5mm', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(268, 'OF0026', NULL, 'Lapiz(hb 2)', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(269, 'AL0004', NULL, 'Limpia Vidrios', 'Generico', '1.5850', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(270, 'AL0003', NULL, 'Limpiador Multi Usos', 'Generico', '4.4240', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(271, 'AL0012', NULL, 'Limpiador Para Pisos De Cemento', 'Generico', '5.0860', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(272, 'OF0027', NULL, 'Liquido Corrector Blanco', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(273, 'AL0026', NULL, 'Mango Para Mopas', 'Generico', '9.6400', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(274, 'DS0061', NULL, 'Manteles Impresos', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(275, 'OF0028', NULL, 'Marcador Permanente Azul Grueso', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(276, 'OF0029', NULL, 'Marcador Permanente Negro Grueso', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(277, 'OF0030', NULL, 'Marcador Permanente Rojo Grueso', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(278, 'OF0031', NULL, 'Marcador Tinta Borrable Azul', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(279, 'OF0032', NULL, 'Marcador Tinta Borrable Negro', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(280, 'OF0033', NULL, 'Marcador Tinta Borrable Rojo', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(281, 'OF0034', NULL, 'Marcador Tinta Borrable Verde', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(282, 'AL0027', NULL, 'Mopas/mota', 'Generico', '4.5000', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(283, 'OF0035', NULL, 'Pads Quita Y Pon 3 X 3 R-330', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(284, 'OF0036', NULL, 'Pads Rallado 5 X 8', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(285, 'OF0037', NULL, 'Pads Rallados Blancos 8.5 X 11', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(286, 'DS0062', NULL, 'Palillo Sadwiches N 4', 'Generico', '0.0040', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(287, 'AL0029', NULL, 'Palos Para Escobas', 'Generico', '3.9760', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(288, 'AL0032', NULL, 'Panitos De Cocina', 'Generico', '0.2220', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(289, 'DS0066', NULL, 'Papel Antigrasa', 'Generico', '0.0200', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(290, 'DS0067', NULL, 'Papel De Aluminio', 'Generico', '18.2070', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(291, 'DS0069', NULL, 'Papel Films', 'Generico', '40.5840', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(292, 'AL0042', NULL, 'Papel Higienico', 'Generico', '0.2290', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(293, 'AL0043', NULL, 'Papel Higienico Industrial', 'Generico', '2.6550', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(294, 'AL0044', NULL, 'Papel Toalla De Rollo', 'Generico', '11.2820', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(295, 'OF0038', NULL, 'Paquete De 1/4 Lbs Ligas 33', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(296, 'AL0030', NULL, 'Piedra Para Limpiar Grill/plancha', 'Generico', '2.3100', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(297, 'AL0016', NULL, 'Pulidor De Metal Aerosol', 'Generico', '25.8330', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(298, 'AL0017', NULL, 'Pulidor De Metal Liquido', 'Generico', '25.8330', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 4, 12, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(299, 'OF0039', NULL, 'Quita Y Pon 3 X 3 Con Dispensador R-330', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(300, 'OF0040', NULL, 'Recibo De Caja Menuda (0013)', 'Generico', '0.1000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(301, 'OF0041', NULL, 'Recibo O Vale De Dinero (0012)', 'Generico', '0.8480', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(302, 'AL0028', NULL, 'Recojedor De Basura', 'Generico', '0.1000', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(303, 'OF0042', NULL, 'Reglas De 12 De Largo', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(304, 'OF0043', NULL, 'Resaltadores Surtidos (pentel S-515)', 'Generico', '2.0500', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(305, 'OF0044', NULL, 'Resma 500 Hojas Blancas De 8.5 X 11 20 Lb', 'Generico', '0.0080', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(306, 'OF0045', NULL, 'Resma 500 Hojas Blancas De 8.5 X 14 20 Lb', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(307, 'AL0031', NULL, 'Roceadores', 'Generico', '3.2500', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(308, 'OF0046', NULL, 'Rollo De Masking Tape-1/2', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(309, 'OF0047', NULL, 'Rollo De Masking Tape-2', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(310, 'OF0048', NULL, 'Rollo De Tape 3m-600', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(311, 'OF0049', NULL, 'Rollo Para Sumadora De 2-1/4', 'Generico', '0.4700', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(312, 'OF0050', NULL, 'Rollos Impresora Fiscal', 'Generico', '1.2060', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1);
INSERT INTO `mercancia` (`id`, `codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `sub_familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`, `peso_escurrido`, `descripcion`, `exento_impuesto`, `receta_id`, `tipo_mercancia_id`, `asociado_id`, `tipo_inventario_id`, `tipo_producto`) VALUES
(313, 'OF0051', NULL, 'Rollos Para Impresora', 'Generico', '0.5700', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(314, 'OF0052', NULL, 'Rollos Para Micros', 'Generico', '0.8400', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(315, 'OF0053', NULL, 'Rollos Para Micros 3', 'Generico', '0.5900', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(316, 'OF0054', NULL, 'Saca Puntas De Metal', 'Generico', '0.1300', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(317, 'OF0055', NULL, 'Sacagrapas', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(318, 'DS0078', NULL, 'Servilletas', 'Generico', '0.0040', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(319, 'OF0056', NULL, 'Sobre De Manila 10x15', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(320, 'OF0057', NULL, 'Sobre De Manila 9x12', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(321, 'OF0058', NULL, 'Sumadora Canon -p23-dh-v', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(322, 'DS0110', NULL, 'Tapa Para Envase De 9 Rb', 'Generico', '0.2690', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(323, 'OF0059', NULL, 'Tape De 2 Transparente O Chocolate', 'Generico', '0.4570', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(324, 'OF0060', NULL, 'Tape Transparente De 3/4 X 36 Yds.', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(325, 'DS0095', NULL, 'Tenedores Plasticos', 'Generico', '0.0160', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(326, 'OF0061', NULL, 'Tinta Caja Registradora', 'Generico', '3.0800', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(327, 'OF0062', NULL, 'Tinta Impr. Comanda', 'Generico', '2.1900', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(328, 'AL0045', NULL, 'Toallin Industrial', 'Generico', '0.0100', '0.0000', 1, NULL, NULL, NULL, 169, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(329, 'OF0063', NULL, 'Toner Impresora Laser', 'Generico', '0.0000', '0.0000', 1, NULL, NULL, NULL, 170, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(330, 'DS0107', NULL, 'Vasos De Cortesia', 'Generico', '0.0210', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(331, 'DS0108', NULL, 'Vasos Transp. 16 Oz.', 'Generico', '0.1250', '0.0000', 1, NULL, NULL, NULL, 143, NULL, NULL, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 166, 1),
(332, 'VG34', '', 'CEBOLLA MORADA', '', '1.2500', '1.0000', 1, 'Kgs * 1', '', '', 146, 173, 5, 5, 6, NULL, 'OK', 0, NULL, 160, NULL, 165, 1),
(333, 'PC3', '', 'congelado', 'prueba1', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(334, 'CONG004', '', 'congelado', 'prueba4', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(335, 'CONG004', '', 'congelado', 'prueba4', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(336, 'CONG004', '', 'congelado', 'prueba4', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(337, 'CONG004', '', 'congelado', 'prueba4', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(338, 'CONG004', '', 'congelado', 'prueba4', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(339, 'CONG5', '', 'congelado', 'prueba5', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 12, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(340, 'CONG6', '', 'congelado', 'prueba6', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(341, 'CONG6', '', 'congelado', 'prueba6', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(342, 'CONG6', '', 'congelado', 'prueba6', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(343, 'CONG6', '', 'congelado', 'prueba6', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(344, 'CONG6', '', 'congelado', 'prueba6', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(345, 'CONG6', '', 'congelado', 'prueba6', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(346, 'CONG6', '', 'congelado', 'prueba6', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(347, 'CONG7', '', 'congelado', 'pruebas', '0.0000', '0.0000', 1, 'Ltrs * 1', '', '', 168, NULL, 4, 4, 12, NULL, '', 0, NULL, 160, NULL, 165, 1),
(348, 'LA19', '', 'QUESO CHEDDAR', 'SUPERIOR', '0.0000', '150.0000', 150, 'Cja * 150', '', '', 139, NULL, 11, 13, 13, NULL, NULL, NULL, NULL, 160, NULL, 164, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mercancia_has_factura`
--

CREATE TABLE `mercancia_has_factura` (
  `id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `mercancia_id` int(11) NOT NULL,
  `cantidad` decimal(19,4) NOT NULL DEFAULT '1.0000',
  `cantidadx` int(11) NOT NULL DEFAULT '1',
  `unidad_medida_id` int(11) NOT NULL,
  `precio_unitario_um` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `devolucion` tinyint(1) NOT NULL DEFAULT '0',
  `comentario_devolucion` varchar(400) DEFAULT 'N/A',
  `fecha_devolucion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia_has_factura`
--

INSERT INTO `mercancia_has_factura` (`id`, `factura_id`, `mercancia_id`, `cantidad`, `cantidadx`, `unidad_medida_id`, `precio_unitario_um`, `devolucion`, `comentario_devolucion`, `fecha_devolucion`) VALUES
(1, 1, 16, '10.0000', 1, 4, '20000.0000', 0, 'N/A', NULL),
(2, 1, 15, '12.0000', 1, 4, '200000.0000', 1, 'prueba 2', NULL),
(3, 2, 17, '2.0000', 1, 4, '50000.0000', 0, 'N/A', NULL),
(4, 3, 16, '3.0000', 1, 4, '20.0000', 0, 'N/A', NULL),
(5, 4, 16, '1.0000', 10, 11, '1000.0000', 1, 'prueba 1', NULL),
(6, 5, 16, '2.0000', 1, 11, '10000.0000', 0, 'N/A', NULL),
(7, 6, 16, '2.0000', 1, 11, '10000.0000', 0, 'N/A', NULL),
(8, 7, 16, '2.0000', 1, 11, '10000.0000', 0, 'N/A', NULL),
(9, 8, 16, '2.0000', 1, 11, '10000.0000', 0, 'N/A', NULL),
(10, 9, 16, '2.0000', 1, 11, '10000.0000', 1, 'prueba 5', NULL),
(11, 10, 16, '2.0000', 1, 11, '20000.0000', 0, 'N/A', NULL),
(12, 11, 16, '200.5000', 1, 6, '1000.0000', 1, 'prueba final', NULL),
(13, 12, 16, '2222.3000', 1, 6, '2000.0000', 1, 'pruyeba 3', NULL),
(14, 13, 15, '1.0000', 1, 23, '120000.0000', 1, 'total', NULL),
(15, 15, 17, '1.0000', 10, 11, '100000.0000', 1, 'prueba final final', NULL),
(16, 16, 18, '23.0000', 1, 5, '3002.0000', 1, 'prueba 5', NULL),
(17, 16, 1, '1.0000', 20, 19, '400000.0000', 1, 'prueba 4', NULL),
(18, 17, 18, '1000.0000', 1, 6, '3000.0000', 0, 'N/A', NULL),
(19, 17, 1, '10.0000', 1, 5, '2000.0000', 1, 'prueba f', NULL),
(20, 18, 1, '1.0000', 1, 5, '2000.0000', 1, 'prueba casi', NULL),
(21, 19, 1, '10.0000', 1, 5, '2000.0000', 1, 'prueba final', NULL),
(22, 20, 250, '5.0000', 1, 4, '5.0000', 0, 'N/A', NULL),
(23, 20, 241, '5.0000', 1, 4, '5.0000', 0, 'N/A', NULL),
(24, 21, 241, '5.0000', 1, 4, '5.0000', 0, 'N/A', NULL),
(25, 21, 250, '5.0000', 1, 4, '5.0000', 0, 'N/A', NULL),
(26, 22, 241, '5.0000', 1, 4, '10.0000', 0, 'N/A', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mercancia_has_modelo`
--

CREATE TABLE `mercancia_has_modelo` (
  `id` int(11) NOT NULL,
  `mercancia_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia_has_modelo`
--

INSERT INTO `mercancia_has_modelo` (`id`, `mercancia_id`, `modelo_id`) VALUES
(1, 72, 9),
(2, 71, 9),
(3, 348, 8),
(4, 332, 8),
(6, 213, 12),
(8, 212, 12),
(9, 332, 12),
(10, 347, 7),
(11, 346, 7),
(12, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `mercancia_has_reposicion`
--

CREATE TABLE `mercancia_has_reposicion` (
  `id` int(11) NOT NULL,
  `cantidad` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `cantidad_recibida` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `precio` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `ingrediente_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `proveedor_id` int(11) DEFAULT '0',
  `reposicion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia_has_reposicion`
--

INSERT INTO `mercancia_has_reposicion` (`id`, `cantidad`, `cantidad_recibida`, `precio`, `ingrediente_id`, `unidad_medida_id`, `proveedor_id`, `reposicion_id`) VALUES
(1, '2.0000', '0.0000', '3000.0000', 16, 15, NULL, 1),
(2, '1.0000', '0.0000', '50000.0000', 15, 4, NULL, 1),
(3, '2.0000', '0.0000', '50000.0000', 15, 4, NULL, 2),
(4, '1.0000', '0.0000', '2000.0000', 17, 4, NULL, 2),
(5, '2.0000', '0.0000', '1000.0000', 1, 5, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mercancia_has_unidad_negocio`
--

CREATE TABLE `mercancia_has_unidad_negocio` (
  `mercancia_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL DEFAULT '0',
  `codigo_modelo` varchar(45) DEFAULT NULL,
  `existencia` decimal(19,4) DEFAULT '0.0000',
  `stock_min` decimal(19,4) DEFAULT '0.0000',
  `stock_max` decimal(19,4) DEFAULT '0.0000',
  `status` tinyint(1) DEFAULT '0',
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia_has_unidad_negocio`
--

INSERT INTO `mercancia_has_unidad_negocio` (`mercancia_id`, `unidad_negocio_id`, `codigo_modelo`, `existencia`, `stock_min`, `stock_max`, `status`, `descripcion`) VALUES
(1, 1, NULL, '-989.0000', '30000.0000', '60000.0000', 0, NULL),
(1, 2, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 3, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 4, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 5, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 6, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 7, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 8, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 9, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 10, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 11, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 13, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 14, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 15, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 16, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 17, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 18, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 19, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 20, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 21, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 22, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 23, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 24, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 25, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 26, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 27, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 28, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 29, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 31, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 32, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 33, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(1, 39, NULL, '7500.0000', '3000.0000', '9000.0000', 0, NULL),
(1, 59, NULL, '3000.0000', '20000.0000', '61000.0000', 0, NULL),
(2, 59, NULL, '5600.0000', '30000.0000', '60000.0000', 1, NULL),
(2, 501, NULL, '20.0000', '10.0000', '40.0000', 0, NULL),
(2, 506, NULL, '9000.0000', '0.0000', '0.0000', 0, NULL),
(4, 39, NULL, '0.0000', '3000.0000', '6000.0000', 0, NULL),
(4, 59, NULL, '33600.0000', '50.0000', '1000.0000', 1, NULL),
(4, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(6, 1, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(6, 59, NULL, '7200.0000', '5000.0000', '10000.0000', 0, NULL),
(6, 501, NULL, '60.0000', '20.0000', '40.0000', 0, NULL),
(6, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(11, 59, NULL, '2000.0000', '10000.0000', '50000.0000', 0, 'harina de maiz'),
(12, 59, NULL, '2970.0000', '10000.0000', '60000.0000', 0, 'arroz mary 1 kg'),
(14, 59, NULL, '2000.0000', '2000.0000', '10000.0000', 0, 'probando'),
(15, 1, NULL, '-2015.0000', '1000.0000', '5000.0000', 0, NULL),
(15, 59, NULL, '6000.0000', '8000.0000', '60000.0000', 0, '2'),
(16, 1, NULL, '1214959.2000', '2000.0000', '8000.0000', 0, NULL),
(16, 59, NULL, '997.0000', '2000.0000', '50000.0000', 0, 'atun enlatado margarita 500gr'),
(17, 1, NULL, '0.0000', '1500.0000', '6500.0000', 0, NULL),
(17, 59, NULL, '4998.0000', '6000.0000', '20000.0000', 0, 'prueba precio proveedor'),
(18, 1, NULL, '1000000.0000', '0.0000', '0.0000', 0, NULL),
(18, 59, NULL, '2000.0000', '5000.0000', '30000.0000', 0, 'probando'),
(21, 1, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(21, 59, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(21, 501, NULL, '100.0000', '10.0000', '120.0000', 0, NULL),
(22, 1, NULL, '2998.0000', '30000.0000', '60000.0000', 0, NULL),
(22, 59, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(22, 60, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(22, 501, NULL, '20.0000', '10.0000', '20.0000', 0, NULL),
(22, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(23, 1, NULL, '199.0000', '100.0000', '1000.0000', 0, NULL),
(23, 59, NULL, '200.0000', '100.0000', '1000.0000', 0, NULL),
(23, 60, NULL, '200.0000', '100.0000', '1000.0000', 0, NULL),
(23, 501, NULL, '100.0000', '20.0000', '1200.0000', 0, NULL),
(23, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(24, 1, NULL, '996.0000', '100.0000', '1000.0000', 0, NULL),
(24, 59, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(24, 60, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(24, 501, NULL, '100.0000', '100.0000', '200.0000', 0, NULL),
(24, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(26, 1, NULL, '2600.0000', '30000.0000', '60000.0000', 0, NULL),
(26, 59, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(26, 60, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(26, 501, NULL, '100.0000', '50.0000', '150.0000', 0, NULL),
(26, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(27, 1, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(27, 59, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(27, 60, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(27, 501, NULL, '20.0000', '10.0000', '70.0000', 0, NULL),
(27, 506, NULL, '1600.0000', '0.0000', '0.0000', 0, NULL),
(28, 1, NULL, '7500.0000', '3000.0000', '9000.0000', 0, NULL),
(28, 59, NULL, '7500.0000', '3000.0000', '9000.0000', 0, NULL),
(28, 60, NULL, '7500.0000', '3000.0000', '9000.0000', 0, NULL),
(28, 501, NULL, '10.0000', '10.0000', '60.0000', 0, NULL),
(28, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(29, 1, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(29, 59, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(29, 60, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(30, 1, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(30, 59, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(30, 60, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(30, 501, NULL, '300.0000', '100.0000', '300.0000', 0, NULL),
(30, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(33, 506, NULL, '-1.0000', '0.0000', '0.0000', 0, NULL),
(35, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(36, 60, NULL, '200.0000', '100.0000', '1000.0000', 0, NULL),
(37, 60, NULL, '5600.0000', '30000.0000', '60000.0000', 1, NULL),
(38, 506, NULL, '-1.0000', '0.0000', '0.0000', 0, NULL),
(39, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(40, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(41, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(42, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(43, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(44, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(45, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(46, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(47, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(48, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(49, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(50, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(51, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(52, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(53, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(54, 60, NULL, '10000.0000', '10.0000', '50.0000', 0, ''),
(54, 501, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(59, 59, NULL, '0.0000', '1.0000', '1.0000', 0, 'prueba'),
(63, 59, NULL, '0.0000', '0.0000', '0.0000', 0, ''),
(64, 59, NULL, '0.0000', '0.0000', '0.0000', 0, ''),
(71, 39, NULL, '1.0000', '0.0000', '0.0000', 0, NULL),
(71, 40, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(71, 41, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(71, 42, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(71, 44, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(71, 45, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(71, 46, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(71, 59, NULL, '6000.0000', NULL, NULL, 0, ''),
(72, 39, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(72, 40, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(72, 41, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(72, 42, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(72, 44, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(72, 45, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(72, 46, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(72, 59, NULL, '8000.0000', NULL, NULL, 0, ''),
(73, 59, NULL, '1000.0000', NULL, NULL, 0, ''),
(74, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(75, 59, NULL, '6000.0000', '0.0000', '0.0000', 0, ''),
(76, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(76, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(76, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(77, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(77, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(77, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(78, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(78, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(78, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(79, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(79, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(79, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(80, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(80, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(80, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(81, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(81, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(81, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(82, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(82, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(82, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(83, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(83, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(83, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(84, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(84, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(84, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(85, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(85, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(85, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(86, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(86, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(86, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(87, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(87, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(87, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(88, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(88, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(88, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(89, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(89, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(89, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(90, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(90, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(90, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(91, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(91, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(91, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(92, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(92, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(92, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(93, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(93, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(93, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(94, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(94, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(94, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(95, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(95, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(95, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(96, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(96, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(96, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(97, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(97, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(97, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(98, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(98, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(98, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(99, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(99, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(99, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(100, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(100, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(100, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(101, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(101, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(101, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(102, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(102, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(102, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(103, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(103, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(103, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(104, 60, NULL, '100000.0000', '2000.0000', '100000.0000', 0, NULL),
(104, 505, NULL, '500.0000', '10000.0000', '10000.0000', 0, NULL),
(104, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(105, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(105, 505, NULL, '1135.0000', '10000.0000', '10000.0000', 0, NULL),
(105, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(106, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(106, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(106, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(107, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(107, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(107, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(108, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(108, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(108, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(109, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(109, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(109, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(110, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(110, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(110, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(111, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(111, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(111, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(112, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(112, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(112, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(113, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(113, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(113, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(114, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(114, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(114, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(115, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(115, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(115, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(116, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(116, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(116, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(117, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(117, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(117, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(118, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(118, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(118, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(119, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(119, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(119, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(120, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(120, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(120, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(121, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(121, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(121, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(122, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(122, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(122, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(123, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(123, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(123, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(124, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(124, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(124, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(125, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(125, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(125, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(126, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(126, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(126, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(127, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(127, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(127, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(128, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(128, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(128, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(129, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(129, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(129, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(130, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(130, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(130, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(131, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(131, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(131, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(132, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(132, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(132, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(133, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(133, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(133, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(134, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(134, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(134, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(135, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(135, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(135, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(136, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(136, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(136, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(137, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(137, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(137, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(138, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(138, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(138, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(139, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(139, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(139, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(140, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(140, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(140, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(141, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(141, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(141, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(142, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(142, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(142, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(143, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(143, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(143, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(144, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(144, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(144, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(145, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(145, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(145, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(146, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(146, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(146, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(147, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(147, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(147, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(148, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(148, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(148, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(149, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(149, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(149, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(150, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(150, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(150, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(151, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(151, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(151, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(152, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(152, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(152, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(153, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(153, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(153, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(154, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(154, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(154, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(155, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(155, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(155, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(156, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(156, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(156, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(157, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(157, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(157, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(158, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(158, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(158, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(159, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(159, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(159, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(160, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(160, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(160, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(161, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(161, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(161, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(162, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(162, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(162, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(163, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(163, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(163, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(164, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(164, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(164, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(165, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(165, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(165, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(166, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(166, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(166, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(167, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(167, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(167, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(168, 60, NULL, '2500.0000', '5000.0000', '10000.0000', 0, NULL),
(168, 505, NULL, '998.0000', '10000.0000', '10000.0000', 0, NULL),
(168, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(169, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(169, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(169, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(170, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(170, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(170, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(171, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(171, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(171, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(172, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(172, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(172, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(173, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(173, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(173, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(174, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(174, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(174, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(175, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(175, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(175, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(176, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(176, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(176, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(177, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(177, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(177, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(178, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(178, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(178, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(179, 60, NULL, '2000.0000', '2000.0000', '6000.0000', 0, NULL),
(179, 505, NULL, '985.0000', '10000.0000', '10000.0000', 0, NULL),
(179, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(180, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(180, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(180, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(181, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(181, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(181, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(182, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(182, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(182, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(183, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(183, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(183, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(184, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(184, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(184, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(185, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(185, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(185, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(186, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(186, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(186, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(187, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(187, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(187, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(188, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(188, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(188, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(189, 60, NULL, '2.5000', '5000.0000', '50000.0000', 0, NULL),
(189, 505, NULL, '985.0000', '10000.0000', '10000.0000', 0, NULL),
(189, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(190, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(190, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(190, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(191, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(191, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(191, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(192, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(192, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(192, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(193, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(193, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(193, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(194, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(194, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(194, 506, NULL, '3.1000', '0.0000', '0.0000', 0, NULL),
(194, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(195, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(195, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(195, 506, NULL, '20.8000', '0.0000', '0.0000', 0, NULL),
(195, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(196, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(196, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(196, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(197, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(197, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(197, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(198, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(198, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(198, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(199, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(199, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(199, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(200, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(200, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(200, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(201, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(201, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(201, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(202, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(202, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(202, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(203, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(203, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(203, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(204, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(204, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(204, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(205, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(205, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(205, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(206, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(206, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(206, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(207, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(207, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(207, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(208, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(208, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(208, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(209, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(209, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(209, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(210, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(210, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(210, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(211, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(211, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(211, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(212, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(212, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(212, 512, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(213, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(213, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(213, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(214, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(214, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(214, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(215, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(215, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(215, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(216, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(216, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(216, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(217, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(217, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(217, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(218, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(218, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(218, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(219, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(219, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(219, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(220, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(220, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(220, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(221, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(221, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(221, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(222, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(222, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(222, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(223, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(223, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(223, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(224, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(224, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(224, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(225, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(225, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(225, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(226, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(226, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(226, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(227, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(227, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(227, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(228, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(228, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(228, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(229, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(229, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(229, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(230, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(230, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(230, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(231, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(231, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(231, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(232, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(232, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(232, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(233, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(233, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(233, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(234, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(234, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(234, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(235, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(235, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(235, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(236, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(236, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(236, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(237, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(237, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(237, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(238, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(238, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(238, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(239, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(239, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(239, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(240, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(240, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(240, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(241, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(241, 505, NULL, '11000.0000', '10000.0000', '10000.0000', 0, NULL),
(241, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(242, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(242, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(242, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(243, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(243, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(243, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(244, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(244, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(244, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(245, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(245, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(245, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(246, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(246, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(246, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(247, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(247, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(247, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(248, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(248, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(248, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(249, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(249, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(249, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(250, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(250, 505, NULL, '6000.0000', '10000.0000', '10000.0000', 0, NULL),
(250, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(251, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(251, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(251, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(252, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(252, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(252, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(253, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(253, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(253, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(254, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(254, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(254, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(255, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(255, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(255, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(256, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(256, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(256, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(257, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(257, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(257, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(258, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(258, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(258, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(259, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(259, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(259, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(260, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(260, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(260, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(261, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(261, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(261, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(262, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(262, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(262, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(263, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(263, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(263, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(264, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(264, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(264, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(265, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(265, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(265, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(266, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(266, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(266, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(267, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(267, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(267, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(268, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(268, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(268, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(269, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(269, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(269, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(270, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(270, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(270, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(271, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(271, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(271, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(272, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(272, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(272, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(273, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(273, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(273, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(274, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(274, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(274, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(275, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(275, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(275, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(276, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(276, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(276, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(277, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(277, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(277, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(278, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(278, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(278, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(279, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(279, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(279, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(280, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(280, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(280, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(281, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(281, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(281, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(282, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(282, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(282, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(283, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(283, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(283, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(284, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(284, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(284, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(285, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(285, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(285, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(286, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(286, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(286, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(287, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(287, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(287, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(288, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(288, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL);
INSERT INTO `mercancia_has_unidad_negocio` (`mercancia_id`, `unidad_negocio_id`, `codigo_modelo`, `existencia`, `stock_min`, `stock_max`, `status`, `descripcion`) VALUES
(288, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(289, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(289, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(289, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(290, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(290, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(290, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(291, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(291, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(291, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(292, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(292, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(292, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(293, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(293, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(293, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(294, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(294, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(294, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(295, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(295, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(295, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(296, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(296, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(296, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(297, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(297, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(297, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(298, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(298, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(298, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(299, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(299, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(299, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(300, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(300, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(300, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(301, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(301, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(301, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(302, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(302, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(302, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(303, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(303, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(303, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(304, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(304, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(304, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(305, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(305, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(305, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(306, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(306, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(306, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(307, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(307, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(307, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(308, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(308, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(308, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(309, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(309, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(309, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(310, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(310, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(310, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(311, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(311, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(311, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(312, 60, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(312, 505, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(312, 512, NULL, '1000.0000', '10000.0000', '10000.0000', 0, NULL),
(332, 60, NULL, '1.0000', NULL, NULL, 0, 'OK'),
(332, 501, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 502, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 503, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 504, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 508, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 510, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 511, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 512, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 513, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(332, 514, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(333, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(334, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(335, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(336, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(337, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(338, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(339, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(340, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(341, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(342, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(343, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(344, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(345, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(346, 1, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 2, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 3, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 4, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 5, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 6, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 7, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 8, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 9, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 10, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 11, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 13, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 14, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 15, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 16, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 17, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 18, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 19, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 20, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 21, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 22, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 23, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 24, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 25, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 26, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 27, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 28, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 29, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 31, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 32, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 33, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(346, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(347, 1, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 2, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 3, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 4, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 5, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 6, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 7, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 8, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 9, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 10, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 11, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 13, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 14, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 15, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 16, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 17, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 18, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 19, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 20, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 21, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 22, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 23, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 24, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 25, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 26, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 27, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 28, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 29, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 31, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 32, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 33, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(347, 59, NULL, '0.0000', NULL, NULL, 0, ''),
(348, 60, NULL, '0.0000', NULL, NULL, 0, 'REBANADO'),
(348, 501, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 502, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 503, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 504, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 508, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 510, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 511, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 513, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(348, 514, NULL, '0.0000', '0.0000', '0.0000', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modelo`
--

INSERT INTO `modelo` (`id`, `nombre`, `sigla`, `padre_id`) VALUES
(1, 'division', NULL, NULL),
(2, 'modelo', NULL, NULL),
(3, 'submodelo', NULL, NULL),
(4, 'Fast Food', 'FF', 1),
(5, 'Full Services', 'FS', 1),
(6, 'Otros', 'OTR', 1),
(7, 'Full pizza', 'FP', 4),
(8, 'Full pizza (PTY)', 'FP(PT', 4),
(9, 'Oh lala', 'OH', 4),
(10, 'Pizza loka', 'PLK', 4),
(11, 'Rico burrito', 'RB', 4),
(12, 'Rico burrito (PTY)', 'RB(PT', 4),
(13, 'Muffin', 'MF', 4),
(14, 'Chip & Cookie', 'C&C', 4),
(15, 'Telepizza', 'TP', 4),
(16, 'Antillana', 'AN', 5),
(17, 'Green Martini', 'GM', 5),
(18, 'Piccola', 'PCL', 4),
(19, 'Trattoria', 'TRA', 5),
(20, 'Boulevard cafe (PTY)', 'BC(PT', 5),
(21, 'Bagel', 'BG', 4),
(22, 'Ingenieria de valor', 'IV', 3),
(23, 'Ovalado', 'OV', 3),
(24, 'Reingenieria', 'RI', 3),
(25, 'Tradicional', 'TR', 3),
(26, 'La Mar', 'LM', 5),
(27, 'Ratail', 'RT', 1),
(28, 'Multifranquicias', NULL, 6),
(29, 'XC2', NULL, 6),
(30, 'Wanai', NULL, 6),
(31, 'Propolca', NULL, 6),
(32, 'Zucor', NULL, 6),
(33, 'braintax', NULL, 6),
(34, 'Tradicional', 'TR', 8),
(35, 'Tradicional', 'TR', 12),
(36, 'Tradicional', 'TR', 20);

-- --------------------------------------------------------

--
-- Table structure for table `modelo_has_grupo`
--

CREATE TABLE `modelo_has_grupo` (
  `modelo_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modelo_has_grupo`
--

INSERT INTO `modelo_has_grupo` (`modelo_id`, `grupo_id`) VALUES
(22, 1),
(22, 2);

-- --------------------------------------------------------

--
-- Table structure for table `modelo_has_receta`
--

CREATE TABLE `modelo_has_receta` (
  `modelo_id` int(11) NOT NULL,
  `receta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modelo_has_receta`
--

INSERT INTO `modelo_has_receta` (`modelo_id`, `receta_id`) VALUES
(7, 1),
(7, 2),
(7, 10),
(9, 11),
(7, 12),
(7, 13),
(7, 14),
(9, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(20, 20),
(20, 21),
(8, 22),
(8, 23),
(8, 24),
(20, 26),
(20, 27),
(12, 28),
(12, 29),
(12, 30),
(12, 31);

-- --------------------------------------------------------

--
-- Table structure for table `modelo_has_submodelo`
--

CREATE TABLE `modelo_has_submodelo` (
  `id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  `sub_modelo_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modelo_has_submodelo`
--

INSERT INTO `modelo_has_submodelo` (`id`, `modelo_id`, `sub_modelo_id`) VALUES
(1, 7, 22),
(2, 7, 23),
(3, 7, 24),
(4, 7, 25),
(5, 8, 25),
(6, 9, 25),
(7, 10, 25),
(8, 11, 25),
(9, 12, 25),
(10, 13, 25),
(11, 14, 25),
(12, 15, 25),
(13, 16, 25),
(14, 17, 25),
(15, 18, 25),
(16, 19, 25),
(17, 20, 25),
(18, 21, 25),
(19, 8, 34),
(20, 12, 35),
(21, 20, 36);

-- --------------------------------------------------------

--
-- Table structure for table `notificacion_has_remision`
--

CREATE TABLE `notificacion_has_remision` (
  `fecha_enviada` date DEFAULT NULL,
  `fecha_recibida` date DEFAULT NULL,
  `reposicion_id` int(11) NOT NULL,
  `remision_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notificacion_has_remision`
--

INSERT INTO `notificacion_has_remision` (`fecha_enviada`, `fecha_recibida`, `reposicion_id`, `remision_id`, `unidad_negocio_id`, `status_id`) VALUES
(NULL, NULL, 0, 1, 1, 128),
('2018-04-27', NULL, 0, 2, 1, 127),
(NULL, NULL, 1, 0, 59, 129),
(NULL, NULL, 2, 0, 59, 129),
(NULL, NULL, 3, 0, 59, 129);

-- --------------------------------------------------------

--
-- Table structure for table `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `num_transaccion` varchar(45) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produccion`
--

CREATE TABLE `produccion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `rendimiento_ideal` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `resultante` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `unidad_medida_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `reversado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produccion`
--

INSERT INTO `produccion` (`id`, `fecha`, `producto_id`, `cantidad`, `rendimiento_ideal`, `resultante`, `unidad_medida_id`, `unidad_negocio_id`, `reversado`) VALUES
(1, '2018-03-14', 195, '1.0000', '1.0000', '1.0000', 6, 506, 1),
(2, '2018-03-23', 195, '2.0000', '2.0000', '1.0000', 6, 506, 0),
(3, '2018-03-26', 195, '2.0000', '2.0000', '2.0000', 6, 506, 0),
(4, '2018-03-26', 195, '3.0000', '3.0000', '3.0000', 6, 506, 0),
(5, '2018-03-26', 105, '1.0000', '1.0000', '135.0000', 6, 505, 0),
(6, '2018-04-04', 194, '1.0000', '1.0000', '1.0000', 6, 505, 1);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `codigo_tcr` varchar(45) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `costo` decimal(19,4) DEFAULT NULL,
  `porcentaje_costo` decimal(19,4) DEFAULT '0.0000',
  `precioVta_A` decimal(19,4) DEFAULT '0.0000',
  `precioVta_B` decimal(19,4) DEFAULT '0.0000',
  `precioVta_C` decimal(19,4) DEFAULT '0.0000',
  `producto_Inactivo` tinyint(1) DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  `ocultar` tinyint(1) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `grupo_id` int(11) NOT NULL,
  `receta_id` int(11) DEFAULT NULL,
  `tipo_producto` int(1) NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `precioVta_C`, `producto_Inactivo`, `tipo`, `ocultar`, `status`, `grupo_id`, `receta_id`, `tipo_producto`) VALUES
(1, 'FPSAU8700004', 'FPSAU8700004', 'Piz. Manhattan 12', '69000.0000', '193.6027', '35640.0000', '26360.7100', '0.0000', 0, 0, 0, '0', 1, 1, 2),
(2, 'FPSAU8800004', 'FPSAU8800004', 'Piz. Manhattan 16', '54000.0000', '121.3800', '44490.0000', '32901.7900', '0.0000', 0, 0, 0, '0', 2, 2, 2),
(3, 'FPSAU9100001', NULL, 'Brownie', '9000.0000', '295081.9672', '3.0500', '37000.0000', '0.0000', 0, 0, 0, '0', 3, 16, 2),
(4, 'FPSAU8300004', NULL, 'Pepsi Cola 16 Oz', '3100.0000', '5.5357', '56000.0000', '48000.0000', '0.0000', 0, 0, 0, '0', 4, 17, 2),
(5, 'FPSE0001118', NULL, 'Ensalada Capresa', '25700.0000', '128.5000', '60000.0000', '17000.0000', '0.0000', 0, 0, 0, '0', 5, 22, 2),
(6, 'ST0013', NULL, 'Arroz con pollo', '133000.0000', '221.6667', '60000.0000', '17000.0000', '0.0000', 0, 0, 0, '0', 5, 20, 2),
(7, 'ST0187', NULL, 'Ensalada de papas', '24466.0101', '122.3301', '20000.0000', '17000.0000', '0.0000', 0, 0, 0, '0', 5, 21, 2),
(8, 'RB200', NULL, 'Agua Mineral', NULL, '0.0000', '1.7500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(9, 'RB800', NULL, 'Brownie De Manjar', NULL, '0.0000', '2.5000', '0.0000', '0.0000', 0, 0, 0, '0', 404, NULL, 2),
(10, 'RB801', NULL, 'Brownie De Oreo', NULL, '0.0000', '2.5000', '0.0000', '0.0000', 0, 0, 0, '0', 404, NULL, 2),
(11, 'RB802', NULL, 'Brownie De Snicker', NULL, '0.0000', '2.5000', '0.0000', '0.0000', 0, 0, 0, '0', 404, NULL, 2),
(12, 'RB804', NULL, 'Brownie Especial', NULL, '0.0000', '2.5000', '0.0000', '0.0000', 0, 0, 0, '0', 404, NULL, 2),
(13, 'RB803', NULL, 'Brownie- Clasico', NULL, '0.0000', '2.0000', '0.0000', '0.0000', 0, 0, 0, '0', 404, NULL, 2),
(14, 'RB1600', NULL, 'Burrito Carne Molida', NULL, '0.0000', '3.5000', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(15, 'RB1605', NULL, 'Burrito Enrollado De Carne', NULL, '0.0000', '8.7500', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(16, 'RB1607', NULL, 'Burrito Enrollado De Carne -22 Oz.', NULL, '0.0000', '8.7500', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(17, 'RB1606', NULL, 'Burrito Enrollado De Pollo', NULL, '0.0000', '8.7500', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(18, 'RB1608', NULL, 'Burrito Enrollado De Pollo - 22', NULL, '0.0000', '8.7500', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(19, 'RB1603', NULL, 'Burrito Pollo A La Parrilla', NULL, '0.0000', '4.5000', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(20, 'RB1601', NULL, 'Burrito Pollo Mechado', NULL, '0.0000', '3.5000', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(21, 'RB1604', NULL, 'Burrito Puerco Guisado', NULL, '0.0000', '4.5000', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(22, 'RB1602', NULL, 'Burrito Ropa Vieja', NULL, '0.0000', '4.5000', '0.0000', '0.0000', 0, 0, 0, '0', 372, NULL, 2),
(23, 'RB1700', NULL, 'Burro Carne Molida', NULL, '0.0000', '5.5000', '0.0000', '0.0000', 0, 0, 0, '0', 373, NULL, 2),
(24, 'RB1703', NULL, 'Burro Pollo A La Parrilla', NULL, '0.0000', '6.5000', '0.0000', '0.0000', 0, 0, 0, '0', 373, NULL, 2),
(25, 'RB1701', NULL, 'Burro Pollo Mechado', NULL, '0.0000', '5.5000', '0.0000', '0.0000', 0, 0, 0, '0', 373, NULL, 2),
(26, 'RB1704', NULL, 'Burro Puerco Guisado', NULL, '0.0000', '6.5000', '0.0000', '0.0000', 0, 0, 0, '0', 373, NULL, 2),
(27, 'RB1702', NULL, 'Burro Ropa Vieja', NULL, '0.0000', '6.5000', '0.0000', '0.0000', 0, 0, 0, '0', 373, NULL, 2),
(28, 'RB1102', NULL, 'Carne Molida', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 405, NULL, 2),
(29, 'RB106', NULL, 'Coca Cola 12 Oz', NULL, '0.0000', '1.2500', '0.0000', '0.0000', 0, 0, 0, '0', 406, NULL, 2),
(30, 'RB201', NULL, 'Coca Cola 16 Oz', NULL, '0.0000', '1.4500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(31, 'RB300', NULL, 'Coca Cola 22 Oz', NULL, '0.0000', '1.8000', '0.0000', '0.0000', 0, 0, 0, '0', 408, NULL, 2),
(32, 'RB307', NULL, 'Coca Cola Clasica Lata', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(33, 'RB308', NULL, 'Coca Cola Light Lata', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(34, 'RB202', NULL, 'Coca Light 16 Oz', NULL, '0.0000', '1.4500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(35, 'RB203', NULL, 'Coca Light Lata', NULL, '0.0000', '1.6500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(36, 'RB101', NULL, 'Coca Ligth 12 Oz', NULL, '0.0000', '1.2500', '0.0000', '0.0000', 0, 0, 0, '0', 406, NULL, 2),
(37, 'RB301', NULL, 'Coca Ligth 22 Oz', NULL, '0.0000', '1.8000', '0.0000', '0.0000', 0, 0, 0, '0', 408, NULL, 2),
(38, 'RB900', NULL, 'Combo Agua Mineral ', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(39, 'RB410', NULL, 'Combo Bbb ', NULL, '0.0000', '3.5000', '0.0000', '0.0000', 0, 0, 0, '0', 378, NULL, 2),
(40, 'RB413', NULL, 'Combo Bbb-16 Oz', NULL, '0.0000', '3.5000', '0.0000', '0.0000', 0, 0, 0, '0', 378, NULL, 2),
(41, 'RB414', NULL, 'Combo Bbb-22 Oz', NULL, '0.0000', '3.5000', '0.0000', '0.0000', 0, 0, 0, '0', 378, NULL, 2),
(42, 'RB901', NULL, 'Combo Coca Cola 12 Oz.', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(43, 'RB902', NULL, 'Combo Coca Ligth 12 Oz', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(44, 'RB903', NULL, 'Combo Fresca 12 Oz', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(45, 'RB907', NULL, 'Combo Kist Naranja 12 Oz', NULL, '0.0000', '0.0010', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(46, 'RB904', NULL, 'Combo Kist Roja 12 Oz', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(47, 'RB506', NULL, 'Combo Nacho Especial 12 Oz', NULL, '0.0000', '3.2500', '0.0000', '0.0000', 0, 0, 0, '0', 410, NULL, 2),
(48, 'RB507', NULL, 'Combo Nacho Especial 16 Oz', NULL, '0.0000', '3.6500', '0.0000', '0.0000', 0, 0, 0, '0', 410, NULL, 2),
(49, 'RB508', NULL, 'Combo Nacho Especial 22 Oz', NULL, '0.0000', '3.9900', '0.0000', '0.0000', 0, 0, 0, '0', 410, NULL, 2),
(50, 'RB100', NULL, 'Combo Nacho Y Queso 12 Oz', NULL, '0.0000', '2.2500', '0.0000', '0.0000', 0, 0, 0, '0', 410, 31, 2),
(51, 'RB501', NULL, 'Combo Nacho Y Queso 16 Oz', NULL, '0.0000', '2.6500', '0.0000', '0.0000', 0, 0, 0, '0', 410, NULL, 2),
(52, 'RB502', NULL, 'Combo Nacho Y Queso 22 Oz', NULL, '0.0000', '2.9900', '0.0000', '0.0000', 0, 0, 0, '0', 410, NULL, 2),
(53, 'RB503', NULL, 'Combo Papa Western 12 Oz', NULL, '0.0000', '2.3500', '0.0000', '0.0000', 0, 0, 0, '0', 410, NULL, 2),
(54, 'RB504', NULL, 'Combo Papa Western 16 Oz', NULL, '0.0000', '2.7500', '0.0000', '0.0000', 0, 0, 0, '0', 410, NULL, 2),
(55, 'RB505', NULL, 'Combo Papa Western 22 Oz', NULL, '0.0000', '3.1500', '0.0000', '0.0000', 0, 0, 0, '0', 410, NULL, 2),
(56, 'RB409', NULL, 'Combo Pa`2,', NULL, '0.0000', '14.9900', '0.0000', '0.0000', 0, 0, 0, '0', 378, NULL, 2),
(57, 'RB411', NULL, 'Combo Pa`2-16 Oz,', NULL, '0.0000', '14.9900', '0.0000', '0.0000', 0, 0, 0, '0', 378, NULL, 2),
(58, 'RB412', NULL, 'Combo Pa''2-22 Oz,', NULL, '0.0000', '14.9900', '0.0000', '0.0000', 0, 0, 0, '0', 378, NULL, 2),
(59, 'RB905', NULL, 'Combo Sprite 12 Oz', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(60, 'RB906', NULL, 'Combo Te Fuze 12 Oz', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(61, 'RB415', NULL, 'Combo Tocino De 10', NULL, '0.0000', '5.5000', '0.0000', '0.0000', 0, 0, 0, '0', 378, NULL, 2),
(62, 'RB102', NULL, 'Fresca 12 Oz', NULL, '0.0000', '1.2500', '0.0000', '0.0000', 0, 0, 0, '0', 406, NULL, 2),
(63, 'RB204', NULL, 'Fresca 16 Oz', NULL, '0.0000', '1.4500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(64, 'RB302', NULL, 'Fresca 22 Oz', NULL, '0.0000', '1.8000', '0.0000', '0.0000', 0, 0, 0, '0', 408, NULL, 2),
(65, 'RB309', NULL, 'Fresca Lata', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(66, 'RB310', NULL, 'Kist De Naranja Lata', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 409, NULL, 2),
(67, 'RB103', NULL, 'Kist Naranja 12 Oz', NULL, '0.0000', '1.2500', '0.0000', '0.0000', 0, 0, 0, '0', 406, NULL, 2),
(68, 'RB205', NULL, 'Kist Naranja 16 Oz', NULL, '0.0000', '1.4500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(69, 'RB303', NULL, 'Kist Naranja 22 Oz', NULL, '0.0000', '1.8000', '0.0000', '0.0000', 0, 0, 0, '0', 408, NULL, 2),
(70, 'RB104', NULL, 'Kist Roja 12 Oz', NULL, '0.0000', '1.2500', '0.0000', '0.0000', 0, 0, 0, '0', 406, NULL, 2),
(71, 'RB206', NULL, 'Kist Roja 16 Oz', NULL, '0.0000', '1.4500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(72, 'RB304', NULL, 'Kist Roja 22 Oz', NULL, '0.0000', '1.8000', '0.0000', '0.0000', 0, 0, 0, '0', 408, NULL, 2),
(73, 'RB1800', NULL, 'Mata Burro 10 Carne Molida', NULL, '0.0000', '7.2500', '0.0000', '0.0000', 0, 0, 0, '0', 374, NULL, 2),
(74, 'RB1803', NULL, 'Mata Burro 10 Pollo A La Parrilla', NULL, '0.0000', '7.5000', '0.0000', '0.0000', 0, 0, 0, '0', 374, NULL, 2),
(75, 'RB1801', NULL, 'Mata Burro 10 Pollo Mechado', NULL, '0.0000', '7.2500', '0.0000', '0.0000', 0, 0, 0, '0', 374, NULL, 2),
(76, 'RB1804', NULL, 'Mata Burro 10 Puerco Guisado', NULL, '0.0000', '7.5000', '0.0000', '0.0000', 0, 0, 0, '0', 374, NULL, 2),
(77, 'RB1802', NULL, 'Mata Burro 10 Ropa Vieja', NULL, '0.0000', '7.5000', '0.0000', '0.0000', 0, 0, 0, '0', 374, NULL, 2),
(78, 'RB1900', NULL, 'Mata Burro 12 Carne Molida', NULL, '0.0000', '8.2500', '0.0000', '0.0000', 0, 0, 0, '0', 375, NULL, 2),
(79, 'RB1903', NULL, 'Mata Burro 12 Pollo A La Parrilla', NULL, '0.0000', '8.5000', '0.0000', '0.0000', 0, 0, 0, '0', 375, NULL, 2),
(80, 'RB1901', NULL, 'Mata Burro 12 Pollo Mechado', NULL, '0.0000', '8.2500', '0.0000', '0.0000', 0, 0, 0, '0', 375, NULL, 2),
(81, 'RB1904', NULL, 'Mata Burro 12 Puerco Guisado', NULL, '0.0000', '8.5000', '0.0000', '0.0000', 0, 0, 0, '0', 375, NULL, 2),
(82, 'RB1902', NULL, 'Mata Burro 12 Ropa Vieja', NULL, '0.0000', '8.5000', '0.0000', '0.0000', 0, 0, 0, '0', 375, NULL, 2),
(83, 'RB602', NULL, 'Nacho Especial', NULL, '0.0000', '2.5000', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(84, 'RB601', NULL, 'Papa Western', NULL, '0.0000', '1.5000', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(85, 'RB1311', NULL, 'Para Llevar Comida', NULL, '0.0000', '3.5000', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(86, 'RB630', NULL, 'Plato Burrero De Carne Mechada', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(87, 'RB628', NULL, 'Plato Burrero De Carne Molida ', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(88, 'RB627', NULL, 'Plato Burrero De P-mechado', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(89, 'RB625', NULL, 'Plato Burrero De P-parrilla', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(90, 'RB629', NULL, 'Plato Burrero De Puerco Guisado ', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(91, 'RB603', NULL, 'Plato Burrero Para Llevar Carne Molida', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(92, 'RB606', NULL, 'Plato Burrero Para Llevar Pollo Mechado', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(93, 'RB605', NULL, 'Plato Burrero Para Llevar Pollo Parrilla', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(94, 'RB607', NULL, 'Plato Burrero Para Llevar Puerco Guisado', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(95, 'RB604', NULL, 'Plato Burrero Para Llevar Ropa Vieja', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(96, 'RB1104', NULL, 'Pollo Al Grill', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 405, NULL, 2),
(97, 'RB1105', NULL, 'Pollo Desmechado', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 405, NULL, 2),
(98, 'RB618', NULL, 'Pote Burrero De Carne Mechada', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(99, 'RB617', NULL, 'Pote Burrero De Carne Molida', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(100, 'RB616', NULL, 'Pote Burrero De P-mechado', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(101, 'RB615', NULL, 'Pote Burrero De P-parrilla', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(102, 'RB619', NULL, 'Pote Burrero De Puerco Mechado', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(103, 'RB631', NULL, 'Pote Light De Carne Mechada', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(104, 'RB632', NULL, 'Pote Light De Carne Molida', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(105, 'RB633', NULL, 'Pote Light De P-mechado', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(106, 'RB634', NULL, 'Pote Light De P-parrilla', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(107, 'RB635', NULL, 'Pote Light De Puerco Mechado', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(108, 'RB620', NULL, 'Pote Nachos De Carne Mechada', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(109, 'RB621', NULL, 'Pote Nachos De Carne Molida', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(110, 'RB622', NULL, 'Pote Nachos De P-mechado', NULL, '0.0000', '5.9900', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(111, 'RB623', NULL, 'Pote Nachos De P-parrilla', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(112, 'RB624', NULL, 'Pote Nachos De Puerco Guisado', NULL, '0.0000', '6.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(113, 'RB1106', NULL, 'Puerco Guisado', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 405, NULL, 2),
(114, 'RB611', NULL, 'Quesadilla De Carne', NULL, '0.0000', '3.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(115, 'RB612', NULL, 'Quesadilla De Pollo', NULL, '0.0000', '3.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(116, 'RB613', NULL, 'Quesadilla De Queso', NULL, '0.0000', '2.7500', '0.0000', '0.0000', 0, 0, 0, '0', 388, NULL, 2),
(117, 'RB1107', NULL, 'Ropa Vieja', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, '0', 405, NULL, 2),
(118, 'RB107', NULL, 'Sprite 12 Oz', NULL, '0.0000', '1.2500', '0.0000', '0.0000', 0, 0, 0, '0', 406, NULL, 2),
(119, 'RB208', NULL, 'Sprite 16 Oz', NULL, '0.0000', '1.4500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(120, 'RB306', NULL, 'Sprite 22 Oz', NULL, '0.0000', '1.8000', '0.0000', '0.0000', 0, 0, 0, '0', 408, NULL, 2),
(121, 'RB805', NULL, 'Sweet Burrito ', NULL, '0.0000', '1.7500', '0.0000', '0.0000', 0, 0, 0, '0', 404, NULL, 2),
(122, 'RB105', NULL, 'Te Fuze 12 Oz', NULL, '0.0000', '1.2500', '0.0000', '0.0000', 0, 0, 0, '0', 406, NULL, 2),
(123, 'RB207', NULL, 'Te Fuze 16 Oz', NULL, '0.0000', '1.4500', '0.0000', '0.0000', 0, 0, 0, '0', 403, NULL, 2),
(124, 'RB305', NULL, 'Te Fuze 22 Oz', NULL, '0.0000', '1.8000', '0.0000', '0.0000', 0, 0, 0, '0', 408, NULL, 2),
(125, 'RB1200', NULL, 'X- Arroz Blanco', NULL, '0.0000', '0.3000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(126, 'RB1400', NULL, 'X- Carne Molida 10', NULL, '0.0000', '0.3500', '0.0000', '0.0000', 0, 0, 0, '0', 385, NULL, 2),
(127, 'RB1405', NULL, 'X- Carne Molida 12', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 386, NULL, 2),
(128, 'RB1300', NULL, 'X- Cebollin', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(129, 'RB1201', NULL, 'X- Congri', NULL, '0.0000', '0.3000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(130, 'RB1509', NULL, 'X- Crema De Leche 1 Oz', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(131, 'RB1500', NULL, 'X- Crema De Leche 2 Oz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(132, 'RB1202', NULL, 'X- Frigoles Rojos', NULL, '0.0000', '0.3000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(133, 'RB1203', NULL, 'X- Frijoles Negros', NULL, '0.0000', '0.3000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(134, 'RB1212', NULL, 'X- Frijoles Negros 500 Gr.', NULL, '0.0000', '1.5000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(135, 'RB1213', NULL, 'X- Frijoles Rojos 500 Gr.', NULL, '0.0000', '1.5000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(136, 'RB1501', NULL, 'X- Guacamole 1 Oz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(137, 'RB1502', NULL, 'X- Guacamole 2 Oz', NULL, '0.0000', '2.0000', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(138, 'RB1301', NULL, 'X- Jalapenos', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(139, 'RB1302', NULL, 'X- Lechuga', NULL, '0.0000', '1.2500', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(140, 'RB1310', NULL, 'X- Maiz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(141, 'RB1510', NULL, 'X- Mojito 1 Oz', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(142, 'RB1503', NULL, 'X- Mojito 2 Oz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(143, 'RB1217', NULL, 'X- Nacho Especial', NULL, '0.0000', '2.7500', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(144, 'RB1204', NULL, 'X- Nachos Con Queso', NULL, '0.0000', '1.7500', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(145, 'RB1214', NULL, 'X- Nachos Por Paquete.', NULL, '0.0000', '5.2500', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(146, 'RB1208', NULL, 'X- Nachos Solos', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(147, 'RB1216', NULL, 'X- Papas Western', NULL, '0.0000', '1.5000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(148, 'RB1511', NULL, 'X- Picante D Lidas 1 Oz', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(149, 'RB1504', NULL, 'X- Picante D Lidas 2 Oz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(150, 'RB1303', NULL, 'X- Pico De Gallo', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(151, 'RB1403', NULL, 'X- Pollo A La Parrilla 10', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 385, NULL, 2),
(152, 'RB1210', NULL, 'X- Pollo Guisado 500 Gr.', NULL, '0.0000', '1.6500', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(153, 'RB1401', NULL, 'X- Pollo Mechado 10', NULL, '0.0000', '0.3500', '0.0000', '0.0000', 0, 0, 0, '0', 385, NULL, 2),
(154, 'RB1406', NULL, 'X- Pollo Mechado 12', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 386, NULL, 2),
(155, 'RB1409', NULL, 'X- Pollo Parilla 12', NULL, '0.0000', '1.5000', '0.0000', '0.0000', 0, 0, 0, '0', 386, NULL, 2),
(156, 'RB1404', NULL, 'X- Puerco 10', NULL, '0.0000', '0.7000', '0.0000', '0.0000', 0, 0, 0, '0', 385, NULL, 2),
(157, 'RB1410', NULL, 'X- Puerco 12', NULL, '0.0000', '1.5000', '0.0000', '0.0000', 0, 0, 0, '0', 386, NULL, 2),
(158, 'RB1211', NULL, 'X- Puerco Guisado 500 Gr.', NULL, '0.0000', '4.0000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(159, 'RB1205', NULL, 'X- Queso Fundido', NULL, '0.0000', '1.0000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(160, 'RB1304', NULL, 'X- Queso Rallado Amarillo', NULL, '0.0000', '0.9000', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(161, 'RB1305', NULL, 'X- Queso Rallado Blanco', NULL, '0.0000', '0.9000', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(162, 'RB1402', NULL, 'X- Ropa Vieja 10', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 385, NULL, 2),
(163, 'RB1407', NULL, 'X- Ropa Vieja 12', NULL, '0.0000', '1.5000', '0.0000', '0.0000', 0, 0, 0, '0', 385, NULL, 2),
(164, 'RB1512', NULL, 'X- Salsa Chipotle 1 Oz', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(165, 'RB1505', NULL, 'X- Salsa Chipotle 2 Oz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(166, 'RB1513', NULL, 'X- Salsa Mayonesa Chipotle 1 Oz', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(167, 'RB1506', NULL, 'X- Salsa Mayonesa Chipotle 2 Oz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(168, 'RB1514', NULL, 'X- Salsa Tartara 1 Oz', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(169, 'RB1507', NULL, 'X- Salsa Tartara 2 Oz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(170, 'RB1515', NULL, 'X- Salsa Verde 1 Oz', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(171, 'RB1508', NULL, 'X- Salsa Verde 2 Oz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 387, NULL, 2),
(172, 'RB1206', NULL, 'X- Tajadas', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(173, 'RB1306', NULL, 'X- Tomate Con Maiz', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(174, 'RB1307', NULL, 'X- Tomate Picado', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2),
(175, 'RB1215', NULL, 'X- Tortillas 10 ', NULL, '0.0000', '0.7500', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(176, 'RB1209', NULL, 'X- Tortillas 12', NULL, '0.0000', '0.9000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(177, 'RB1207', NULL, 'X- Vegetales Salteados', NULL, '0.0000', '0.5000', '0.0000', '0.0000', 0, 0, 0, '0', 384, NULL, 2),
(178, 'RB1308', NULL, 'X-tortilla 12', NULL, '0.0000', '0.9000', '0.0000', '0.0000', 0, 0, 0, '0', 383, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `producto_has_modelo`
--

CREATE TABLE `producto_has_modelo` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto_has_modelo`
--

INSERT INTO `producto_has_modelo` (`id`, `producto_id`, `modelo_id`) VALUES
(1, 4, 9),
(2, 1, 9),
(3, 36, 12),
(5, 176, 12),
(7, 67, 12);

-- --------------------------------------------------------

--
-- Table structure for table `producto_has_orden`
--

CREATE TABLE `producto_has_orden` (
  `producto_id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `producto_has_unidad_negocio`
--

CREATE TABLE `producto_has_unidad_negocio` (
  `producto_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `stock_venta` decimal(19,4) DEFAULT '0.0000',
  `stock_minimo` decimal(19,4) DEFAULT '0.0000',
  `stock_maximo` decimal(19,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto_has_unidad_negocio`
--

INSERT INTO `producto_has_unidad_negocio` (`producto_id`, `unidad_negocio_id`, `stock_venta`, `stock_minimo`, `stock_maximo`) VALUES
(1, 1, '2.0000', '0.0000', '0.0000'),
(1, 39, '0.0000', '0.0000', '0.0000'),
(1, 40, '0.0000', '0.0000', '0.0000'),
(1, 41, '0.0000', '0.0000', '0.0000'),
(1, 42, '0.0000', '0.0000', '0.0000'),
(1, 44, '0.0000', '0.0000', '0.0000'),
(1, 45, '0.0000', '0.0000', '0.0000'),
(1, 46, '0.0000', '0.0000', '0.0000'),
(1, 59, '2.0000', '0.0000', '0.0000'),
(1, 60, '2.0000', '0.0000', '0.0000'),
(1, 501, '2.0000', '0.0000', '0.0000'),
(2, 1, '10.0000', '0.0000', '0.0000'),
(2, 59, '10.0000', '0.0000', '0.0000'),
(2, 60, '10.0000', '0.0000', '0.0000'),
(2, 501, '10.0000', '0.0000', '0.0000'),
(3, 1, '20.0000', '0.0000', '0.0000'),
(3, 59, '20.0000', '0.0000', '0.0000'),
(3, 60, '20.0000', '0.0000', '0.0000'),
(3, 501, '20.0000', '0.0000', '0.0000'),
(4, 1, '21.0000', '0.0000', '0.0000'),
(4, 39, '0.0000', '0.0000', '0.0000'),
(4, 40, '0.0000', '0.0000', '0.0000'),
(4, 41, '0.0000', '0.0000', '0.0000'),
(4, 42, '0.0000', '0.0000', '0.0000'),
(4, 44, '0.0000', '0.0000', '0.0000'),
(4, 45, '0.0000', '0.0000', '0.0000'),
(4, 46, '0.0000', '0.0000', '0.0000'),
(4, 59, '21.0000', '0.0000', '0.0000'),
(4, 60, '21.0000', '0.0000', '0.0000'),
(4, 501, '21.0000', '0.0000', '0.0000'),
(4, 512, '0.0000', '0.0000', '0.0000'),
(5, 1, '21.0000', '0.0000', '0.0000'),
(5, 59, '21.0000', '0.0000', '0.0000'),
(5, 60, '21.0000', '0.0000', '0.0000'),
(5, 501, '21.0000', '0.0000', '0.0000'),
(6, 59, '21.0000', '0.0000', '0.0000'),
(6, 60, '21.0000', '0.0000', '0.0000'),
(6, 506, '21.0000', '0.0000', '0.0000'),
(7, 59, '10.0000', '0.0000', '0.0000'),
(7, 60, '10.0000', '0.0000', '0.0000'),
(7, 506, '0.0000', '0.0000', '0.0000'),
(8, 60, '1.0000', '0.0000', '0.0000'),
(9, 60, '1.0000', '0.0000', '0.0000'),
(9, 505, '1.0000', '0.0000', '0.0000'),
(9, 512, '1.0000', '0.0000', '0.0000'),
(10, 60, '1.0000', '0.0000', '0.0000'),
(10, 505, '1.0000', '0.0000', '0.0000'),
(10, 512, '1.0000', '0.0000', '0.0000'),
(11, 60, '1.0000', '0.0000', '0.0000'),
(11, 505, '1.0000', '0.0000', '0.0000'),
(11, 512, '1.0000', '0.0000', '0.0000'),
(12, 60, '1.0000', '0.0000', '0.0000'),
(12, 505, '1.0000', '0.0000', '0.0000'),
(12, 512, '1.0000', '0.0000', '0.0000'),
(13, 60, '1.0000', '0.0000', '0.0000'),
(13, 505, '1.0000', '0.0000', '0.0000'),
(13, 512, '1.0000', '0.0000', '0.0000'),
(14, 60, '1.0000', '0.0000', '0.0000'),
(14, 505, '1.0000', '0.0000', '0.0000'),
(14, 512, '1.0000', '0.0000', '0.0000'),
(15, 60, '1.0000', '0.0000', '0.0000'),
(15, 505, '1.0000', '0.0000', '0.0000'),
(15, 512, '1.0000', '0.0000', '0.0000'),
(16, 60, '1.0000', '0.0000', '0.0000'),
(16, 505, '1.0000', '0.0000', '0.0000'),
(16, 512, '1.0000', '0.0000', '0.0000'),
(17, 60, '1.0000', '0.0000', '0.0000'),
(17, 505, '1.0000', '0.0000', '0.0000'),
(17, 512, '1.0000', '0.0000', '0.0000'),
(18, 60, '1.0000', '0.0000', '0.0000'),
(18, 505, '1.0000', '0.0000', '0.0000'),
(18, 512, '1.0000', '0.0000', '0.0000'),
(19, 60, '1.0000', '0.0000', '0.0000'),
(19, 505, '1.0000', '0.0000', '0.0000'),
(19, 512, '1.0000', '0.0000', '0.0000'),
(20, 60, '1.0000', '0.0000', '0.0000'),
(20, 505, '1.0000', '0.0000', '0.0000'),
(20, 512, '1.0000', '0.0000', '0.0000'),
(21, 60, '1.0000', '0.0000', '0.0000'),
(21, 505, '1.0000', '0.0000', '0.0000'),
(21, 512, '1.0000', '0.0000', '0.0000'),
(22, 60, '1.0000', '0.0000', '0.0000'),
(22, 505, '1.0000', '0.0000', '0.0000'),
(22, 512, '1.0000', '0.0000', '0.0000'),
(23, 60, '1.0000', '0.0000', '0.0000'),
(23, 505, '1.0000', '0.0000', '0.0000'),
(23, 512, '1.0000', '0.0000', '0.0000'),
(24, 60, '1.0000', '0.0000', '0.0000'),
(24, 505, '1.0000', '0.0000', '0.0000'),
(24, 512, '1.0000', '0.0000', '0.0000'),
(25, 60, '1.0000', '0.0000', '0.0000'),
(25, 505, '1.0000', '0.0000', '0.0000'),
(25, 512, '1.0000', '0.0000', '0.0000'),
(26, 60, '1.0000', '0.0000', '0.0000'),
(26, 505, '1.0000', '0.0000', '0.0000'),
(26, 512, '1.0000', '0.0000', '0.0000'),
(27, 60, '1.0000', '0.0000', '0.0000'),
(27, 505, '1.0000', '0.0000', '0.0000'),
(27, 512, '1.0000', '0.0000', '0.0000'),
(28, 60, '1.0000', '0.0000', '0.0000'),
(28, 505, '1.0000', '0.0000', '0.0000'),
(28, 512, '1.0000', '0.0000', '0.0000'),
(29, 60, '1.0000', '0.0000', '0.0000'),
(29, 505, '1.0000', '0.0000', '0.0000'),
(29, 512, '1.0000', '0.0000', '0.0000'),
(30, 60, '1.0000', '0.0000', '0.0000'),
(30, 505, '1.0000', '0.0000', '0.0000'),
(30, 512, '1.0000', '0.0000', '0.0000'),
(31, 60, '1.0000', '0.0000', '0.0000'),
(31, 505, '1.0000', '0.0000', '0.0000'),
(31, 512, '1.0000', '0.0000', '0.0000'),
(32, 60, '1.0000', '0.0000', '0.0000'),
(32, 505, '1.0000', '0.0000', '0.0000'),
(32, 512, '1.0000', '0.0000', '0.0000'),
(33, 60, '1.0000', '0.0000', '0.0000'),
(33, 505, '1.0000', '0.0000', '0.0000'),
(33, 512, '1.0000', '0.0000', '0.0000'),
(34, 60, '1.0000', '0.0000', '0.0000'),
(34, 505, '1.0000', '0.0000', '0.0000'),
(34, 512, '1.0000', '0.0000', '0.0000'),
(35, 60, '1.0000', '0.0000', '0.0000'),
(35, 505, '1.0000', '0.0000', '0.0000'),
(35, 512, '1.0000', '0.0000', '0.0000'),
(36, 60, '1.0000', '0.0000', '0.0000'),
(36, 505, '1.0000', '0.0000', '0.0000'),
(36, 512, '1.0000', '0.0000', '0.0000'),
(37, 60, '1.0000', '0.0000', '0.0000'),
(37, 505, '1.0000', '0.0000', '0.0000'),
(37, 512, '1.0000', '0.0000', '0.0000'),
(38, 60, '1.0000', '0.0000', '0.0000'),
(38, 505, '1.0000', '0.0000', '0.0000'),
(38, 512, '1.0000', '0.0000', '0.0000'),
(39, 60, '1.0000', '0.0000', '0.0000'),
(39, 505, '1.0000', '0.0000', '0.0000'),
(39, 512, '1.0000', '0.0000', '0.0000'),
(40, 60, '1.0000', '0.0000', '0.0000'),
(40, 505, '1.0000', '0.0000', '0.0000'),
(40, 512, '1.0000', '0.0000', '0.0000'),
(41, 60, '1.0000', '0.0000', '0.0000'),
(41, 505, '1.0000', '0.0000', '0.0000'),
(41, 512, '1.0000', '0.0000', '0.0000'),
(42, 60, '1.0000', '0.0000', '0.0000'),
(42, 505, '1.0000', '0.0000', '0.0000'),
(42, 512, '1.0000', '0.0000', '0.0000'),
(43, 60, '1.0000', '0.0000', '0.0000'),
(43, 505, '1.0000', '0.0000', '0.0000'),
(43, 512, '1.0000', '0.0000', '0.0000'),
(44, 60, '1.0000', '0.0000', '0.0000'),
(44, 505, '1.0000', '0.0000', '0.0000'),
(44, 512, '1.0000', '0.0000', '0.0000'),
(45, 60, '1.0000', '0.0000', '0.0000'),
(45, 505, '1.0000', '0.0000', '0.0000'),
(45, 512, '1.0000', '0.0000', '0.0000'),
(46, 60, '1.0000', '0.0000', '0.0000'),
(46, 505, '1.0000', '0.0000', '0.0000'),
(46, 512, '1.0000', '0.0000', '0.0000'),
(47, 60, '1.0000', '0.0000', '0.0000'),
(47, 505, '1.0000', '0.0000', '0.0000'),
(47, 512, '1.0000', '0.0000', '0.0000'),
(48, 60, '1.0000', '0.0000', '0.0000'),
(48, 505, '1.0000', '0.0000', '0.0000'),
(48, 512, '1.0000', '0.0000', '0.0000'),
(49, 60, '1.0000', '0.0000', '0.0000'),
(49, 505, '1.0000', '0.0000', '0.0000'),
(49, 512, '1.0000', '0.0000', '0.0000'),
(50, 60, '1.0000', '0.0000', '0.0000'),
(50, 505, '1.0000', '0.0000', '0.0000'),
(50, 512, '1.0000', '0.0000', '0.0000'),
(51, 60, '1.0000', '0.0000', '0.0000'),
(51, 505, '1.0000', '0.0000', '0.0000'),
(51, 512, '1.0000', '0.0000', '0.0000'),
(52, 60, '1.0000', '0.0000', '0.0000'),
(52, 505, '1.0000', '0.0000', '0.0000'),
(52, 512, '1.0000', '0.0000', '0.0000'),
(53, 60, '1.0000', '0.0000', '0.0000'),
(53, 505, '1.0000', '0.0000', '0.0000'),
(53, 512, '1.0000', '0.0000', '0.0000'),
(54, 60, '1.0000', '0.0000', '0.0000'),
(54, 505, '1.0000', '0.0000', '0.0000'),
(54, 512, '1.0000', '0.0000', '0.0000'),
(55, 60, '1.0000', '0.0000', '0.0000'),
(55, 505, '1.0000', '0.0000', '0.0000'),
(55, 512, '1.0000', '0.0000', '0.0000'),
(56, 60, '1.0000', '0.0000', '0.0000'),
(56, 505, '1.0000', '0.0000', '0.0000'),
(56, 512, '1.0000', '0.0000', '0.0000'),
(57, 60, '1.0000', '0.0000', '0.0000'),
(57, 505, '1.0000', '0.0000', '0.0000'),
(57, 512, '1.0000', '0.0000', '0.0000'),
(58, 60, '1.0000', '0.0000', '0.0000'),
(58, 505, '1.0000', '0.0000', '0.0000'),
(58, 512, '1.0000', '0.0000', '0.0000'),
(59, 60, '1.0000', '0.0000', '0.0000'),
(59, 505, '1.0000', '0.0000', '0.0000'),
(59, 512, '1.0000', '0.0000', '0.0000'),
(60, 60, '1.0000', '0.0000', '0.0000'),
(60, 505, '1.0000', '0.0000', '0.0000'),
(60, 512, '1.0000', '0.0000', '0.0000'),
(61, 60, '1.0000', '0.0000', '0.0000'),
(61, 505, '1.0000', '0.0000', '0.0000'),
(61, 512, '1.0000', '0.0000', '0.0000'),
(62, 60, '1.0000', '0.0000', '0.0000'),
(62, 505, '0.0000', '0.0000', '0.0000'),
(62, 512, '0.0000', '0.0000', '0.0000'),
(63, 60, '1.0000', '0.0000', '0.0000'),
(63, 505, '1.0000', '0.0000', '0.0000'),
(63, 512, '1.0000', '0.0000', '0.0000'),
(64, 60, '1.0000', '0.0000', '0.0000'),
(64, 505, '1.0000', '0.0000', '0.0000'),
(64, 512, '1.0000', '0.0000', '0.0000'),
(65, 60, '1.0000', '0.0000', '0.0000'),
(65, 505, '1.0000', '0.0000', '0.0000'),
(65, 512, '1.0000', '0.0000', '0.0000'),
(66, 60, '1.0000', '0.0000', '0.0000'),
(66, 505, '1.0000', '0.0000', '0.0000'),
(66, 512, '1.0000', '0.0000', '0.0000'),
(67, 60, '1.0000', '0.0000', '0.0000'),
(67, 505, '1.0000', '0.0000', '0.0000'),
(67, 512, '1.0000', '0.0000', '0.0000'),
(68, 60, '1.0000', '0.0000', '0.0000'),
(68, 505, '1.0000', '0.0000', '0.0000'),
(68, 512, '1.0000', '0.0000', '0.0000'),
(70, 60, '1.0000', '0.0000', '0.0000'),
(70, 505, '1.0000', '0.0000', '0.0000'),
(70, 512, '1.0000', '0.0000', '0.0000'),
(71, 60, '1.0000', '0.0000', '0.0000'),
(71, 505, '1.0000', '0.0000', '0.0000'),
(71, 512, '1.0000', '0.0000', '0.0000'),
(72, 60, '1.0000', '0.0000', '0.0000'),
(72, 505, '1.0000', '0.0000', '0.0000'),
(72, 512, '1.0000', '0.0000', '0.0000'),
(73, 60, '1.0000', '0.0000', '0.0000'),
(73, 505, '1.0000', '0.0000', '0.0000'),
(73, 512, '1.0000', '0.0000', '0.0000'),
(74, 60, '1.0000', '0.0000', '0.0000'),
(74, 505, '1.0000', '0.0000', '0.0000'),
(74, 512, '1.0000', '0.0000', '0.0000'),
(75, 60, '1.0000', '0.0000', '0.0000'),
(75, 505, '1.0000', '0.0000', '0.0000'),
(75, 512, '1.0000', '0.0000', '0.0000'),
(76, 60, '1.0000', '0.0000', '0.0000'),
(76, 505, '1.0000', '0.0000', '0.0000'),
(76, 512, '1.0000', '0.0000', '0.0000'),
(77, 60, '1.0000', '0.0000', '0.0000'),
(77, 505, '1.0000', '0.0000', '0.0000'),
(77, 512, '1.0000', '0.0000', '0.0000'),
(78, 60, '1.0000', '0.0000', '0.0000'),
(78, 505, '1.0000', '0.0000', '0.0000'),
(78, 512, '1.0000', '0.0000', '0.0000'),
(79, 60, '1.0000', '0.0000', '0.0000'),
(79, 505, '1.0000', '0.0000', '0.0000'),
(79, 512, '1.0000', '0.0000', '0.0000'),
(80, 60, '1.0000', '0.0000', '0.0000'),
(80, 505, '1.0000', '0.0000', '0.0000'),
(80, 512, '1.0000', '0.0000', '0.0000'),
(81, 60, '1.0000', '0.0000', '0.0000'),
(81, 505, '1.0000', '0.0000', '0.0000'),
(81, 512, '1.0000', '0.0000', '0.0000'),
(82, 60, '1.0000', '0.0000', '0.0000'),
(82, 505, '1.0000', '0.0000', '0.0000'),
(82, 512, '1.0000', '0.0000', '0.0000'),
(83, 60, '1.0000', '0.0000', '0.0000'),
(83, 505, '1.0000', '0.0000', '0.0000'),
(83, 512, '1.0000', '0.0000', '0.0000'),
(84, 60, '1.0000', '0.0000', '0.0000'),
(84, 505, '1.0000', '0.0000', '0.0000'),
(84, 512, '1.0000', '0.0000', '0.0000'),
(85, 60, '1.0000', '0.0000', '0.0000'),
(85, 505, '1.0000', '0.0000', '0.0000'),
(85, 512, '1.0000', '0.0000', '0.0000'),
(86, 60, '1.0000', '0.0000', '0.0000'),
(86, 505, '1.0000', '0.0000', '0.0000'),
(86, 512, '1.0000', '0.0000', '0.0000'),
(87, 60, '1.0000', '0.0000', '0.0000'),
(87, 505, '1.0000', '0.0000', '0.0000'),
(87, 512, '1.0000', '0.0000', '0.0000'),
(88, 60, '1.0000', '0.0000', '0.0000'),
(88, 505, '1.0000', '0.0000', '0.0000'),
(88, 512, '1.0000', '0.0000', '0.0000'),
(89, 60, '1.0000', '0.0000', '0.0000'),
(89, 505, '1.0000', '0.0000', '0.0000'),
(89, 512, '1.0000', '0.0000', '0.0000'),
(90, 60, '1.0000', '0.0000', '0.0000'),
(90, 505, '1.0000', '0.0000', '0.0000'),
(90, 512, '1.0000', '0.0000', '0.0000'),
(91, 60, '1.0000', '0.0000', '0.0000'),
(91, 505, '1.0000', '0.0000', '0.0000'),
(91, 512, '1.0000', '0.0000', '0.0000'),
(92, 60, '1.0000', '0.0000', '0.0000'),
(92, 505, '1.0000', '0.0000', '0.0000'),
(92, 512, '1.0000', '0.0000', '0.0000'),
(93, 60, '1.0000', '0.0000', '0.0000'),
(93, 505, '1.0000', '0.0000', '0.0000'),
(93, 512, '1.0000', '0.0000', '0.0000'),
(94, 60, '1.0000', '0.0000', '0.0000'),
(94, 505, '1.0000', '0.0000', '0.0000'),
(94, 512, '1.0000', '0.0000', '0.0000'),
(95, 60, '1.0000', '0.0000', '0.0000'),
(95, 505, '1.0000', '0.0000', '0.0000'),
(95, 512, '1.0000', '0.0000', '0.0000'),
(96, 60, '1.0000', '0.0000', '0.0000'),
(96, 505, '1.0000', '0.0000', '0.0000'),
(96, 512, '1.0000', '0.0000', '0.0000'),
(97, 60, '1.0000', '0.0000', '0.0000'),
(97, 505, '1.0000', '0.0000', '0.0000'),
(97, 512, '1.0000', '0.0000', '0.0000'),
(98, 60, '1.0000', '0.0000', '0.0000'),
(98, 505, '1.0000', '0.0000', '0.0000'),
(98, 512, '1.0000', '0.0000', '0.0000'),
(99, 60, '1.0000', '0.0000', '0.0000'),
(99, 505, '1.0000', '0.0000', '0.0000'),
(99, 512, '1.0000', '0.0000', '0.0000'),
(100, 60, '1.0000', '0.0000', '0.0000'),
(100, 505, '1.0000', '0.0000', '0.0000'),
(100, 512, '1.0000', '0.0000', '0.0000'),
(101, 60, '1.0000', '0.0000', '0.0000'),
(101, 505, '1.0000', '0.0000', '0.0000'),
(101, 512, '1.0000', '0.0000', '0.0000'),
(102, 60, '1.0000', '0.0000', '0.0000'),
(102, 505, '1.0000', '0.0000', '0.0000'),
(102, 512, '1.0000', '0.0000', '0.0000'),
(103, 60, '1.0000', '0.0000', '0.0000'),
(103, 505, '1.0000', '0.0000', '0.0000'),
(103, 512, '1.0000', '0.0000', '0.0000'),
(104, 60, '1.0000', '0.0000', '0.0000'),
(104, 505, '1.0000', '0.0000', '0.0000'),
(104, 512, '1.0000', '0.0000', '0.0000'),
(105, 60, '1.0000', '0.0000', '0.0000'),
(105, 505, '1.0000', '0.0000', '0.0000'),
(105, 512, '1.0000', '0.0000', '0.0000'),
(106, 60, '1.0000', '0.0000', '0.0000'),
(106, 505, '1.0000', '0.0000', '0.0000'),
(106, 512, '1.0000', '0.0000', '0.0000'),
(107, 60, '1.0000', '0.0000', '0.0000'),
(107, 505, '1.0000', '0.0000', '0.0000'),
(107, 512, '1.0000', '0.0000', '0.0000'),
(108, 60, '1.0000', '0.0000', '0.0000'),
(108, 505, '1.0000', '0.0000', '0.0000'),
(108, 512, '1.0000', '0.0000', '0.0000'),
(109, 60, '1.0000', '0.0000', '0.0000'),
(109, 505, '1.0000', '0.0000', '0.0000'),
(109, 512, '1.0000', '0.0000', '0.0000'),
(110, 60, '1.0000', '0.0000', '0.0000'),
(110, 505, '1.0000', '0.0000', '0.0000'),
(110, 512, '1.0000', '0.0000', '0.0000'),
(111, 60, '1.0000', '0.0000', '0.0000'),
(111, 505, '1.0000', '0.0000', '0.0000'),
(111, 512, '1.0000', '0.0000', '0.0000'),
(112, 60, '1.0000', '0.0000', '0.0000'),
(112, 505, '1.0000', '0.0000', '0.0000'),
(112, 512, '1.0000', '0.0000', '0.0000'),
(113, 60, '1.0000', '0.0000', '0.0000'),
(113, 505, '1.0000', '0.0000', '0.0000'),
(113, 512, '1.0000', '0.0000', '0.0000'),
(114, 60, '1.0000', '0.0000', '0.0000'),
(114, 505, '1.0000', '0.0000', '0.0000'),
(114, 512, '1.0000', '0.0000', '0.0000'),
(115, 60, '1.0000', '0.0000', '0.0000'),
(115, 505, '1.0000', '0.0000', '0.0000'),
(115, 512, '1.0000', '0.0000', '0.0000'),
(116, 60, '1.0000', '0.0000', '0.0000'),
(116, 505, '1.0000', '0.0000', '0.0000'),
(116, 512, '1.0000', '0.0000', '0.0000'),
(117, 60, '1.0000', '0.0000', '0.0000'),
(117, 505, '1.0000', '0.0000', '0.0000'),
(117, 512, '1.0000', '0.0000', '0.0000'),
(118, 60, '1.0000', '0.0000', '0.0000'),
(118, 505, '1.0000', '0.0000', '0.0000'),
(118, 512, '1.0000', '0.0000', '0.0000'),
(119, 60, '1.0000', '0.0000', '0.0000'),
(119, 505, '1.0000', '0.0000', '0.0000'),
(119, 512, '1.0000', '0.0000', '0.0000'),
(120, 60, '1.0000', '0.0000', '0.0000'),
(120, 505, '1.0000', '0.0000', '0.0000'),
(120, 512, '1.0000', '0.0000', '0.0000'),
(121, 60, '1.0000', '0.0000', '0.0000'),
(121, 505, '1.0000', '0.0000', '0.0000'),
(121, 512, '1.0000', '0.0000', '0.0000'),
(122, 60, '1.0000', '0.0000', '0.0000'),
(122, 505, '1.0000', '0.0000', '0.0000'),
(122, 512, '1.0000', '0.0000', '0.0000'),
(123, 60, '1.0000', '0.0000', '0.0000'),
(123, 505, '1.0000', '0.0000', '0.0000'),
(123, 512, '1.0000', '0.0000', '0.0000'),
(124, 60, '1.0000', '0.0000', '0.0000'),
(124, 505, '1.0000', '0.0000', '0.0000'),
(124, 512, '1.0000', '0.0000', '0.0000'),
(125, 60, '1.0000', '0.0000', '0.0000'),
(125, 505, '1.0000', '0.0000', '0.0000'),
(125, 512, '1.0000', '0.0000', '0.0000'),
(126, 60, '1.0000', '0.0000', '0.0000'),
(126, 505, '1.0000', '0.0000', '0.0000'),
(126, 512, '1.0000', '0.0000', '0.0000'),
(127, 60, '1.0000', '0.0000', '0.0000'),
(127, 505, '1.0000', '0.0000', '0.0000'),
(127, 512, '1.0000', '0.0000', '0.0000'),
(128, 60, '1.0000', '0.0000', '0.0000'),
(128, 505, '1.0000', '0.0000', '0.0000'),
(128, 512, '1.0000', '0.0000', '0.0000'),
(129, 60, '1.0000', '0.0000', '0.0000'),
(129, 505, '1.0000', '0.0000', '0.0000'),
(129, 512, '1.0000', '0.0000', '0.0000'),
(130, 60, '1.0000', '0.0000', '0.0000'),
(130, 505, '1.0000', '0.0000', '0.0000'),
(130, 512, '1.0000', '0.0000', '0.0000'),
(131, 60, '1.0000', '0.0000', '0.0000'),
(131, 505, '1.0000', '0.0000', '0.0000'),
(131, 512, '1.0000', '0.0000', '0.0000'),
(132, 60, '1.0000', '0.0000', '0.0000'),
(132, 505, '1.0000', '0.0000', '0.0000'),
(132, 512, '1.0000', '0.0000', '0.0000'),
(133, 60, '1.0000', '0.0000', '0.0000'),
(133, 505, '1.0000', '0.0000', '0.0000'),
(133, 512, '1.0000', '0.0000', '0.0000'),
(134, 60, '1.0000', '0.0000', '0.0000'),
(134, 505, '1.0000', '0.0000', '0.0000'),
(134, 512, '1.0000', '0.0000', '0.0000'),
(135, 60, '1.0000', '0.0000', '0.0000'),
(135, 505, '1.0000', '0.0000', '0.0000'),
(135, 512, '1.0000', '0.0000', '0.0000'),
(136, 60, '1.0000', '0.0000', '0.0000'),
(136, 505, '1.0000', '0.0000', '0.0000'),
(136, 512, '1.0000', '0.0000', '0.0000'),
(137, 60, '1.0000', '0.0000', '0.0000'),
(137, 505, '1.0000', '0.0000', '0.0000'),
(137, 512, '1.0000', '0.0000', '0.0000'),
(138, 60, '1.0000', '0.0000', '0.0000'),
(138, 505, '1.0000', '0.0000', '0.0000'),
(138, 512, '1.0000', '0.0000', '0.0000'),
(139, 60, '1.0000', '0.0000', '0.0000'),
(139, 505, '1.0000', '0.0000', '0.0000'),
(139, 512, '1.0000', '0.0000', '0.0000'),
(140, 60, '1.0000', '0.0000', '0.0000'),
(140, 505, '1.0000', '0.0000', '0.0000'),
(140, 512, '1.0000', '0.0000', '0.0000'),
(141, 60, '1.0000', '0.0000', '0.0000'),
(141, 505, '1.0000', '0.0000', '0.0000'),
(141, 512, '1.0000', '0.0000', '0.0000'),
(142, 60, '1.0000', '0.0000', '0.0000'),
(142, 505, '1.0000', '0.0000', '0.0000'),
(142, 512, '1.0000', '0.0000', '0.0000'),
(143, 60, '1.0000', '0.0000', '0.0000'),
(143, 505, '1.0000', '0.0000', '0.0000'),
(143, 512, '1.0000', '0.0000', '0.0000'),
(144, 60, '1.0000', '0.0000', '0.0000'),
(144, 505, '1.0000', '0.0000', '0.0000'),
(144, 512, '1.0000', '0.0000', '0.0000'),
(145, 60, '1.0000', '0.0000', '0.0000'),
(145, 505, '1.0000', '0.0000', '0.0000'),
(145, 512, '1.0000', '0.0000', '0.0000'),
(146, 60, '1.0000', '0.0000', '0.0000'),
(146, 505, '1.0000', '0.0000', '0.0000'),
(146, 512, '1.0000', '0.0000', '0.0000'),
(147, 60, '1.0000', '0.0000', '0.0000'),
(147, 505, '1.0000', '0.0000', '0.0000'),
(147, 512, '1.0000', '0.0000', '0.0000'),
(148, 60, '1.0000', '0.0000', '0.0000'),
(148, 505, '1.0000', '0.0000', '0.0000'),
(148, 512, '1.0000', '0.0000', '0.0000'),
(149, 60, '1.0000', '0.0000', '0.0000'),
(149, 505, '1.0000', '0.0000', '0.0000'),
(149, 512, '1.0000', '0.0000', '0.0000'),
(150, 60, '1.0000', '0.0000', '0.0000'),
(150, 505, '1.0000', '0.0000', '0.0000'),
(150, 512, '1.0000', '0.0000', '0.0000'),
(151, 60, '1.0000', '0.0000', '0.0000'),
(151, 505, '1.0000', '0.0000', '0.0000'),
(151, 512, '1.0000', '0.0000', '0.0000'),
(152, 60, '1.0000', '0.0000', '0.0000'),
(152, 505, '1.0000', '0.0000', '0.0000'),
(152, 512, '1.0000', '0.0000', '0.0000'),
(153, 60, '1.0000', '0.0000', '0.0000'),
(153, 505, '1.0000', '0.0000', '0.0000'),
(153, 512, '1.0000', '0.0000', '0.0000'),
(154, 60, '1.0000', '0.0000', '0.0000'),
(154, 505, '1.0000', '0.0000', '0.0000'),
(154, 512, '1.0000', '0.0000', '0.0000'),
(155, 60, '1.0000', '0.0000', '0.0000'),
(155, 505, '1.0000', '0.0000', '0.0000'),
(155, 512, '1.0000', '0.0000', '0.0000'),
(156, 60, '1.0000', '0.0000', '0.0000'),
(156, 505, '1.0000', '0.0000', '0.0000'),
(156, 512, '1.0000', '0.0000', '0.0000'),
(157, 60, '1.0000', '0.0000', '0.0000'),
(157, 505, '1.0000', '0.0000', '0.0000'),
(157, 512, '1.0000', '0.0000', '0.0000'),
(158, 60, '1.0000', '0.0000', '0.0000'),
(158, 505, '1.0000', '0.0000', '0.0000'),
(158, 512, '1.0000', '0.0000', '0.0000'),
(159, 60, '1.0000', '0.0000', '0.0000'),
(159, 505, '1.0000', '0.0000', '0.0000'),
(159, 512, '1.0000', '0.0000', '0.0000'),
(160, 60, '1.0000', '0.0000', '0.0000'),
(160, 505, '1.0000', '0.0000', '0.0000'),
(160, 512, '1.0000', '0.0000', '0.0000'),
(161, 60, '1.0000', '0.0000', '0.0000'),
(161, 505, '1.0000', '0.0000', '0.0000'),
(161, 512, '1.0000', '0.0000', '0.0000'),
(162, 60, '1.0000', '0.0000', '0.0000'),
(162, 505, '1.0000', '0.0000', '0.0000'),
(162, 512, '1.0000', '0.0000', '0.0000'),
(163, 60, '1.0000', '0.0000', '0.0000'),
(163, 505, '1.0000', '0.0000', '0.0000'),
(163, 512, '1.0000', '0.0000', '0.0000'),
(164, 60, '1.0000', '0.0000', '0.0000'),
(164, 505, '1.0000', '0.0000', '0.0000'),
(164, 512, '1.0000', '0.0000', '0.0000'),
(165, 60, '1.0000', '0.0000', '0.0000'),
(165, 505, '1.0000', '0.0000', '0.0000'),
(165, 512, '1.0000', '0.0000', '0.0000'),
(166, 60, '1.0000', '0.0000', '0.0000'),
(166, 505, '1.0000', '0.0000', '0.0000'),
(166, 512, '1.0000', '0.0000', '0.0000'),
(167, 60, '1.0000', '0.0000', '0.0000'),
(167, 505, '1.0000', '0.0000', '0.0000'),
(167, 512, '1.0000', '0.0000', '0.0000'),
(168, 60, '1.0000', '0.0000', '0.0000'),
(168, 505, '1.0000', '0.0000', '0.0000'),
(168, 512, '1.0000', '0.0000', '0.0000'),
(169, 60, '1.0000', '0.0000', '0.0000'),
(169, 505, '1.0000', '0.0000', '0.0000'),
(169, 512, '1.0000', '0.0000', '0.0000'),
(170, 60, '1.0000', '0.0000', '0.0000'),
(170, 505, '1.0000', '0.0000', '0.0000'),
(170, 512, '1.0000', '0.0000', '0.0000'),
(171, 60, '1.0000', '0.0000', '0.0000'),
(171, 505, '1.0000', '0.0000', '0.0000'),
(171, 512, '1.0000', '0.0000', '0.0000'),
(172, 60, '1.0000', '0.0000', '0.0000'),
(172, 505, '1.0000', '0.0000', '0.0000'),
(172, 512, '1.0000', '0.0000', '0.0000'),
(173, 60, '1.0000', '0.0000', '0.0000'),
(173, 505, '1.0000', '0.0000', '0.0000'),
(173, 512, '1.0000', '0.0000', '0.0000'),
(174, 60, '1.0000', '0.0000', '0.0000'),
(174, 505, '1.0000', '0.0000', '0.0000'),
(174, 512, '1.0000', '0.0000', '0.0000'),
(175, 60, '1.0000', '0.0000', '0.0000'),
(175, 505, '1.0000', '0.0000', '0.0000'),
(175, 512, '1.0000', '0.0000', '0.0000'),
(176, 60, '1.0000', '0.0000', '0.0000'),
(176, 512, '1.0000', '0.0000', '0.0000'),
(177, 60, '1.0000', '0.0000', '0.0000'),
(177, 505, '1.0000', '0.0000', '0.0000'),
(177, 512, '1.0000', '0.0000', '0.0000'),
(178, 60, '1.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `ubicacion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `rif`, `razon_social`, `correo`, `status`, `ubicacion_id`) VALUES
(1, 'DAFILCA, C.A.', NULL, NULL, NULL, 0, 1),
(2, 'PRODOTTI IL BUONGUSTAIO', NULL, NULL, NULL, 0, 3),
(3, 'DIST. GOUPIGOIS, C.A.', NULL, NULL, NULL, 0, 8),
(4, 'DISTRIBUIDORA PACK AND FOOD', NULL, NULL, NULL, 0, 10),
(5, 'Pepsi Cola Venezuela, C.A.', NULL, NULL, NULL, 0, 11),
(6, 'Nuevoproveedor', NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor_has_mercancia`
--

CREATE TABLE `proveedor_has_mercancia` (
  `mercancia_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `codigo_x_proveedor` varchar(30) DEFAULT NULL,
  `precio` decimal(19,4) DEFAULT '0.0000',
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveedor_has_mercancia`
--

INSERT INTO `proveedor_has_mercancia` (`mercancia_id`, `proveedor_id`, `codigo_x_proveedor`, `precio`, `status`) VALUES
(1, 1, 'pv200', '780.0000', 0),
(2, 5, 'pa333', '800.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor_has_telefono`
--

CREATE TABLE `proveedor_has_telefono` (
  `proveedor_id` int(11) NOT NULL,
  `telefono_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveedor_has_telefono`
--

INSERT INTO `proveedor_has_telefono` (`proveedor_id`, `telefono_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `receta`
--

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `costo` decimal(19,4) DEFAULT '0.0000',
  `rendimiento` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receta`
--

INSERT INTO `receta` (`id`, `nombre`, `costo`, `rendimiento`, `unidad_medida_id`) VALUES
(1, 'pizza manhattan 12', '15000.0000', '0.0000', 0),
(2, 'Piz. Manhattan 16', NULL, '0.0000', 0),
(3, 'salsa de tomate', '2000.0000', '0.0000', 0),
(10, 'Refresco Coca-cola', NULL, '0.0000', 0),
(11, 'Atun Eveba', NULL, '0.0000', 0),
(12, 'Refresco Coca-cola', NULL, '0.0000', 0),
(13, 'Atun Margarita', NULL, '0.0000', 0),
(14, 'Refresco Sevenup', NULL, '0.0000', 0),
(15, 'Aceite Vatel', NULL, '0.0000', 0),
(16, 'Brownie', '2000.0000', '0.0000', 0),
(17, 'Pepsi Cola 16 Oz', '50000.0000', '0.0000', 0),
(18, 'Arroz Primor', NULL, '0.0000', 0),
(19, 'Ensalada Capresa', NULL, '0.0000', 0),
(20, 'Arroz con pollo', '0.0000', '0.0000', 0),
(21, 'Ensalada de papas', '0.0000', '0.0000', 0),
(22, 'Ensalada Capresa', '0.0000', '0.0000', 0),
(23, 'Brownie Savoy', '0.0000', '0.0000', 0),
(24, 'masa para pizza  ', '0.0000', '1.0000', 5),
(25, 'agrupado 4', NULL, '0.0000', 0),
(26, 'Salsa Verde Cremosito (burritos) Generico', '0.0000', '1.0000', 4),
(27, 'Salsa Tartara Cremosito (burritos) Generico', '0.0000', '1.0000', 5),
(28, 'Arroz Generico  ', '0.0000', '1.0000', 5),
(29, 'Arroz Blanco (burritos) Generico', '0.0000', '1.0000', 5),
(30, 'Camarones Guisados Rb Generico', '0.0000', '1.0000', 5),
(31, 'Combo Nacho Y Queso 12 Oz', '0.0000', '1.0000', 13);

-- --------------------------------------------------------

--
-- Table structure for table `receta_has_receta`
--

CREATE TABLE `receta_has_receta` (
  `receta_id` int(11) NOT NULL,
  `sub_receta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receta_has_receta`
--

INSERT INTO `receta_has_receta` (`receta_id`, `sub_receta_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `referencia`
--

CREATE TABLE `referencia` (
  `id` int(11) NOT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `referencia`
--

INSERT INTO `referencia` (`id`, `referencia`, `padre_id`) VALUES
(1, 'codigo', NULL),
(2, 'estado', NULL),
(3, 'municipio', NULL),
(4, 'parroquia', NULL),
(5, 'tipo_usuario', NULL),
(6, 'preguntas', NULL),
(7, 'status_pedido', NULL),
(8, 'tipo_manejo', NULL),
(9, 'tipo_producto', NULL),
(10, 'dia_disponible', NULL),
(11, 'tipo_pago', NULL),
(13, 'familia', NULL),
(27, '0212', 1),
(28, '0412', 1),
(29, '0416', 1),
(30, '0414', 1),
(31, '0424', 1),
(32, '0426', 1),
(33, 'Administrador', 5),
(34, 'Tecnico', 5),
(35, 'Super usuario', 5),
(36, 'nombre de su primera mascota?', 6),
(37, 'segundo nombre de la madre?', 6),
(38, 'jugador de futbol favorito?', 6),
(39, 'cual es su pelicula favorita?', 6),
(40, 'nombre de su escuela de primaria', 6),
(41, 'Pendiente', 7),
(42, 'confirmado', 7),
(43, 'Completado', 7),
(44, 'Unidad', 8),
(45, 'Peso', 8),
(46, 'Simple', 9),
(47, 'Combo', 9),
(48, 'Agrupar', 9),
(49, 'Lunes', 10),
(50, 'Martes', 10),
(51, 'Miercoles', 10),
(52, 'Jueves', 10),
(53, 'Viernes', 10),
(54, 'Sabado', 10),
(55, 'Domingo', 10),
(56, 'Todos', 10),
(57, 'Efectivo', 11),
(58, 'Debito', 11),
(59, 'Credito', 11),
(60, 'Cesta_ticcket', 11),
(113, 'Operaciones', 5),
(114, 'Costo', 5),
(115, 'Cliente', 5),
(116, 'Alimento', 13),
(117, 'Bebidas', 13),
(118, 'Bebidas alcoholicas', 13),
(119, 'Articulos', 13),
(120, 'Consumo personal', 13),
(121, 'motivo', NULL),
(122, 'Compra directa', 131),
(123, 'Solicitud de reposicion de mercancia', 131),
(124, 'Solicitud de remision de mercancia', 131),
(125, 'status_notificaciones', NULL),
(126, 'Solicitud de remision', 125),
(127, 'Remision enviada', 125),
(128, 'Remision procesada', 125),
(129, 'Solicitud de reposicion de mercancia', 125),
(130, 'tipo_movimiento', NULL),
(131, 'Entrada', 130),
(132, 'Salida', 130),
(133, 'Error', 132),
(134, 'Reposicion de mercancia procesada', 125),
(135, 'Semi terminados', 13),
(136, 'Otros', 13),
(137, 'Mantenimiento', 13),
(138, ' Licores', 13),
(139, 'Lacteos', 13),
(140, 'Frutas', 13),
(141, 'Especies y condimentos', 13),
(142, 'Envasados', 13),
(143, 'Desechables', 13),
(144, 'Carnes', 13),
(145, 'Embutidos', 13),
(146, 'Vegetales', 13),
(147, 'sub_familia', NULL),
(148, '[ AGREGAR NUEVA ]', 147),
(149, 'Aceites Oliva', 147),
(150, 'Aderezos', 147),
(151, 'Azucares', 147),
(152, 'Aceites Maiz', 147),
(157, 'masas caseras', 147),
(158, 'masas', 147),
(159, 'tipo_ingrediente', NULL),
(160, 'Simple', 159),
(161, 'Agrupado', 159),
(162, 'Asociado', 159),
(163, 'tipo_inventario', NULL),
(164, 'Diario', 163),
(165, 'Decadal', 163),
(166, 'Mensual', 163),
(168, 'Congelados', 13),
(169, 'Articulos de limpieza', 13),
(170, 'Articulos de oficina', 13),
(171, 'Inicial', NULL),
(172, 'Final', NULL),
(173, 'Carga de inventario Inicial', 131),
(174, 'Carga de inventario final', 131),
(175, 'Reposicion de mercancia', 132),
(176, 'Remision de mercancia', 132),
(177, 'Venta', 132),
(178, 'Produccion', 131),
(179, 'Produccion', 132),
(180, 'Merma', 132),
(181, '[ AGREGAR NUEVO MOTIVO ]', 121),
(182, 'El producto se quedo fuera de la nevera y se deterioro', 121),
(183, 'El producto se vencio', 121),
(184, 'El producto vino deteriorado', 121),
(185, 'El producto se deterioro durante el proceso de produccion', 121),
(186, 'El producto se quemo por accidente', 121),
(187, 'El producto se cayo', 121),
(188, 'QUESOS', 147),
(189, 'pruebas', 121),
(190, 'motivo de prueba', 121),
(191, 'Reverso de merma', 131),
(192, 'Reverso de produccion', 131),
(193, 'Reverso de produccion', 132),
(194, 'pais', NULL),
(195, 'Panama', 194),
(196, 'Venezuela', 194),
(197, 'BEBIDAS GASEOSAS', 147),
(198, 'BEBIDAS NO GASEOSAS', 147),
(199, 'Compra', 131),
(200, 'Devolucion', 132),
(201, 'Reposicion de mercancia enviada', 125);

-- --------------------------------------------------------

--
-- Table structure for table `remision`
--

CREATE TABLE `remision` (
  `id` int(11) NOT NULL,
  `num_remision` varchar(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(20) NOT NULL,
  `descripcion` text,
  `cantidad` decimal(19,4) DEFAULT '0.0000',
  `cantidad_recibida` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `unidad_medida_id` int(11) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mercancia_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `remision`
--

INSERT INTO `remision` (`id`, `num_remision`, `fecha`, `hora`, `descripcion`, `cantidad`, `cantidad_recibida`, `unidad_medida_id`, `unidad_negocio_id`, `usuario_id`, `mercancia_id`) VALUES
(1, '', '2018-04-27', '1:17:29 pm', 'prueba', '2.0000', '0.0000', 5, 3, 15, 1),
(2, '184272', '2018-04-27', '3:06:52 pm', 'f1', '2.0000', '2.0000', 4, 3, 15, 346);

-- --------------------------------------------------------

--
-- Table structure for table `reposicion_mercancia`
--

CREATE TABLE `reposicion_mercancia` (
  `id` int(11) NOT NULL,
  `num_reposicion` varchar(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(15) NOT NULL,
  `total` decimal(19,4) DEFAULT '0.0000',
  `tipo_reposicion` varchar(45) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reposicion_mercancia`
--

INSERT INTO `reposicion_mercancia` (`id`, `num_reposicion`, `fecha`, `hora`, `total`, `tipo_reposicion`, `unidad_negocio_id`, `usuario_id`) VALUES
(1, '184271', '2018-04-27', '3:23:29 pm', '56.0000', 'compra a proveedores', 1, 15),
(2, '184272', '2018-04-27', '3:23:52 pm', '102.0000', 'compra a proveedores', 1, 15),
(3, '184273', '2018-04-27', '3:26:24 pm', '2.0000', 'compra a proveedores', 3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `telefono`
--

CREATE TABLE `telefono` (
  `id` int(11) NOT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `codigo_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `telefono`
--

INSERT INTO `telefono` (`id`, `numero`, `codigo_id`) VALUES
(1, '6321945', 27),
(2, '6321945', 27),
(3, '6611635', 27),
(4, '6936681', 27),
(5, '4726281', 27),
(6, '4727189 ', 27),
(7, '2028113             ', 27),
(8, '2028349', 27),
(9, '2738711', 27),
(10, '2738846', 27);

-- --------------------------------------------------------

--
-- Table structure for table `telefono_has_cliente`
--

CREATE TABLE `telefono_has_cliente` (
  `telefono_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL,
  `edificio` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `urbanizacion` varchar(45) NOT NULL,
  `nro_intercomunicador` varchar(45) NOT NULL,
  `punto_referencia` varchar(150) NOT NULL,
  `parroquia_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `edificio`, `calle`, `urbanizacion`, `nro_intercomunicador`, `punto_referencia`, `parroquia_id`) VALUES
(1, '24', 'san juan', 'Guarenas', '6', 'Conjunto residencial ubicado Frente a la farmacia', 36),
(3, '235b', 'san rafael', 'brisas de propatria', '2', 'escaleras san vicente', 36),
(8, 'monaquito', 'Av Monaco', 'La california', '22a', 'a una cuadra de la estacion de metrobus la california', 70),
(10, '10 D', 'calle', 'Nueva casarapa', '3-33', 'a dos cuadras del centro comercial rojo', 92),
(11, 'Sanduvi Plaza', '3ra Transversal', 'Sta Eduvigis', '104', 'Frente a la Iglesia Preciosisima Sangre (Santa Eduvigis)', 95);

-- --------------------------------------------------------

--
-- Table structure for table `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id` int(11) NOT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad_medida`
--

INSERT INTO `unidad_medida` (`id`, `unidad`, `abreviatura`, `padre_id`) VALUES
(1, 'Masa', NULL, NULL),
(2, 'Liquido', NULL, NULL),
(3, 'Longitud', NULL, NULL),
(4, 'Litro(s)', 'Ltrs', 2),
(5, 'Kilogramo(s)', 'Kgs', 1),
(6, 'Gramo(s)', 'Gr', 1),
(7, 'Botella(s)', 'Btl', 2),
(8, 'Fardo(s)', 'Frdo', 30),
(9, 'Guacal(es)', 'Gcl', 1),
(10, 'Saco(s)', 'Sco', 1),
(11, 'Caja(s)', 'Cja', 30),
(12, 'Mililitro(s)', 'Ml', 2),
(13, 'Unidad(es)', 'Un', 29),
(14, 'Pieza(s)', 'Pza', 29),
(15, 'Lata(s)', 'Lta', 1),
(16, 'Paquete(s)', 'Pqte', 29),
(17, 'Bovina(s)', 'Bvna', 1),
(18, 'Barra(s)', 'Brra', 1),
(19, 'Bulto(s)', 'Blto', 1),
(20, 'Cunete(s)', 'Cte', 2),
(21, 'Galon(es)', 'Glon', 2),
(22, 'Resma(s)', 'Rsma', 3),
(23, 'Docena(s)', 'Dcna', 29),
(24, 'Frasco(s)', 'Fco', 30),
(25, 'Cuenta(s)', 'Cuen', 1),
(26, 'Metro(s)', 'Mtrs', 3),
(27, 'Centimetro(s)', 'Cm', 3),
(28, 'Bandeja(s)', 'Bdj', 1),
(29, 'Unidades', NULL, NULL),
(30, 'Otros', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unidad_negocio`
--

CREATE TABLE `unidad_negocio` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `numero_autorizacion` varchar(45) DEFAULT NULL,
  `modelo_has_submodelo_id` int(11) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `pais_id` int(11) NOT NULL DEFAULT '196'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad_negocio`
--

INSERT INTO `unidad_negocio` (`id`, `codigo`, `rif`, `razon_social`, `nombre`, `numero_autorizacion`, `modelo_has_submodelo_id`, `correo`, `empresa_id`, `pais_id`) VALUES
(1, '0030', 'J-29468624-9', 'Operadora Aeropuerto 2007 C.A.', 'FP AEROPUERTO', '582946524', 1, 'fpaeropuerto@fullpizza.com', 59, 196),
(2, '0011', 'J-29706562-8', 'Operadora FpBoleita 011 C.A.', 'FP BOLEITA', '558865103', 1, 'fpboleita@fullpizza.com', 59, 196),
(3, '0029', 'J-29637315-5', 'Operadora Tamanaco 2008 C.A.', 'FP CCCT', '708751670', 1, 'fpccct@fullpizza.com', 59, 196),
(4, '26', 'J-29600796-9', 'Operadora FP Los Proceres C.A.', 'FP IPSFA', '218262314', 1, 'fpipsfa@fullpizza.com', 59, 196),
(5, '7', 'J-29706585-7', 'Operadora FP Lido 007 C.A.', 'FP LIDO', '520421640', 1, 'fplido@fullpizza.com', 59, 196),
(6, '25', 'J-29637305-1', 'Operadora Millenium 2008 C.A.', 'FP MILLENIUM', '589228495', 1, 'fpmillenium@fullpizza.com', 59, 196),
(7, '61', 'J-29830763-3', 'Operadora Plaza Venezuela 2009 C.A.', 'FP BICENTENARIO', '593151194', 1, 'fp.ccs.bicentenario@fullpizza.com', 59, 196),
(8, '10', 'J-29706547-4', 'Operadora FP El Recreo 010 C.A.', 'FP RECREO', '737410268', 1, 'fprecreo@fullpizza.com', 59, 196),
(9, '9', 'J-29706492-3', 'Operadora FP Diversion009 C.A.', 'FP SAMBIL DIVERSION', '570456763', 1, 'fpdiversion@fullpizza.com', 59, 196),
(10, '8', 'J-29737409-4', 'Operadora FP Feria CCS 008 C.A.', 'FP SAMBIL FERIA', '256706677', 1, 'fpferia@fullpizza.com', 59, 196),
(11, '22', 'J-30895190-0', 'Productora La Confitiure de Oro C.A.', 'FP TOLON', '845661486', 1, 'fptolon@fullpizza.com', 59, 196),
(12, '2000', 'J-30895190-0', 'Productora La Confitiure de Oro C.A.', 'CHIPCOOKIE TOLON', '164869818', 11, 'fptolon@fullpizza.com', 59, 196),
(13, '2', 'J-29706491-5', 'Operadora UCAB 002 C.A.', 'FP UCAB', '121649327', 1, 'fpucab@fullpizza.com', 59, 196),
(14, '34', 'J-29638215-8', 'Operadora El Llano 2008 C.A.', 'FP ACARIGUA', '944126839', 1, 'fpllanomall@fullpizza.com', 59, 196),
(15, '63', 'J-29800629-3', 'Operadora Maracay 2009 C.A.', 'FP AVIADORES', '432893570', 1, 'fp.may.sigo@fullpizza.com', 59, 196),
(16, '17', 'J-29521250-0', 'Operadora Barquisimeto C.A.', 'FP S. BARQUISIMETO', '926740298', 1, 'fpsambbarquisimeto', 59, 196),
(17, '54', 'J- 31749880-1', 'Operadora FP El Lago 2011 C.A.', 'FP S. MARACAIBO', '892605624', 1, 'fpmaracaibo@fullpizza.com', 59, 196),
(18, '0020', 'J-29370529-0', 'Operadora Lara-0632006 C.A.', 'FP MTRP BARQUISIMETO', '977261513', 1, 'fpbarquisimeto@fullpizza.com', 59, 196),
(19, '12', 'J-29706495-8', 'Operadora FPMetropolis 012 C.A.', 'FP MTRP VALENCIA', '118410771', 1, 'fpmetropolis@fullpizza.com', 59, 196),
(20, '42', 'J-29871770-0', 'Operadora FP Paraguana 2009 C.A.', 'FP PARAGUANA', '784354406', 1, 'fpparaguana@fullpizza.com', 59, 196),
(21, '0', 'J-29706489-3', 'Operadora Este C.A.', 'FP LAS TRINITARIAS', '915468342', 1, 'fpparis@fullpizza.com', 59, 196),
(22, '31', 'J-29724582-0', 'Operadora Plaza Puerto C.A.', 'FP PLAZA MAYOR', '557479912', 1, 'fpplzmayor@fullpizza.com', 59, 196),
(23, '14', 'J-29706490-7', 'Operadora FP Margarita 014 C.A.', 'FP S. MARGARITA', '291160155', 1, 'fpmargarita@fullpizza.com', 59, 196),
(24, '13', 'J-29706494-0', 'Operadora FP Valencia 013 C.A.', 'FP SAMBIL VALENCIA', '631763844', 1, 'fpsambvalencia@fullpiza.com', 59, 196),
(25, '4', 'J-29365112-3', 'Operadora FPST2007 C.A.', 'FP TACHIRA', '679193173', 1, 'fpsncristobal@fullpizza.com', 59, 196),
(26, '58', 'J-40125261-3', 'Pizza Real C.A.', 'FP PUENTE REAL', '414606929', 1, 'fppuentereal@fullpizza.com', 59, 196),
(27, '56', 'J-40064201-9', 'Pizzerias del Oeste 132, C.A. ', 'FP PROPATRIA', '990971977', 1, 'fppropatria@fullpizza.com', 59, 196),
(28, '37', 'J-29449227-4', 'Representaciones Pasadena C.A.', 'FP LIDER', '470604320', 1, 'fplider@fullpizza.com', 59, 196),
(29, '21', 'J-30948141-0', 'XLunch C.A.', 'FP GALERIAS MARACAY', '963799571', 1, 'fpgalmaracay@fullpizza.com', 59, 196),
(31, '39', 'J-29839358-0', 'Inversiones Pampatar C.A.', 'FP LA VELA', '413388225', 1, 'fplavela@fullpizza.com', 59, 196),
(32, '38', 'J-29848534-1', 'Representaciones Nemar C.A.', 'FP ALTAVISTA II', '899787596', 1, 'fpaltavistaii@fullpizza.com', 59, 196),
(33, '18', 'J-29369833-9', 'Inversiones Lamo C.A.', 'FP PZA ATLANTICO', '934240973', 1, 'fpptoordaz@fullpizza.com', 59, 196),
(34, '52', 'J-30707128-1', 'Operadora PLK Elice C.A.', 'PLK CHACAO', '278183304', NULL, 'plchacao@fullpizza.com', 59, 196),
(35, '47', 'J-29997801-9', 'Operadora PLS Petare C.A.', 'PLK PETARE', '953912705', NULL, 'plpetare@fullpizza.com', 59, 196),
(36, '45', 'J-29600831-0', 'Operadora Los Ilustres C.A.', 'PLK SABANA GRANDE', '473309215', NULL, 'plsabanagrande@fullpizza.com', 59, 196),
(37, '62', 'J-40232165-1', 'Inversiones 3055530 C.A.', 'PLK AEROPUERTO', '903710294', NULL, 'pl.mqt.aeropuerto@pizzaloka.com.ve', 59, 196),
(38, '32', 'J-29980564-5', 'Inversora Nesi C.A.', 'PLK CIUDAD TRAKI', '268297438', NULL, 'plciudadtraki@fullpizza.com', 59, 196),
(39, '1024', 'J-30757227-2', 'Operadora DLV003 C.A.', 'OH LALA CHACAITO', '749733641', 6, 'ccs.expreso@ohlala.com.ve', 59, 196),
(40, '1008', 'J-29896375-1', 'Corporacion Prestigio PQM C.A.', 'OHLALA METROPOLIS', '773982449', 6, 'oh.val.metropolis@ohlala.com', 59, 196),
(41, '1002', 'J-29637224-1', 'Representaciones Somaroma 2009 C.A.', 'OHLALA RECREO FERIA', '610219931', 6, 'oh.ccs.recreo@ohlala.com.ve', 59, 196),
(42, '1027', 'J- 40232151-1', 'Inversiones OH Recreo 2012 C.A.', 'OH RECREO KIOSKO', '897915414', 6, 'oh.ccs.recreo@ohlala.com.ve', 59, 196),
(43, '902', 'J-317690060', 'Inversiones 238882 C.A.', 'MUFFIN CAFE ', '650368289', NULL, 'mcaeropuerto@fullpizza.com', 59, 196),
(44, '1010', 'J-31749269-2', 'Inversiones JCR, C.A. ', 'OHLALA METROPOLIS BQ', '615914811', 6, 'iqpm1421@gmail.com', 59, 196),
(45, '1009', 'J-29350955-6', 'Inversiones QP1421 C.A.', 'OHLALA SAMBIL BQMTO', '671526111', 6, 'iqpm1421@gmail.com', 59, 196),
(46, '1000', 'J-31578297-9', 'Bh Pack C.A.', 'OHLALA EMBAJADA ', '229366884', 6, 'oh.ccs.embajada@ohlala.com.ve', 59, 196),
(47, '901', 'J-30757411-9', 'Operadora DLV005 C.A.', 'RB MILLENIUM', '122334469', NULL, 'rbmillenium@fullpizza.com', 59, 196),
(48, '3005', 'J-40232160-0', 'Operadora RB Recreo 2012 C.A.', 'RB RECREO', '237766659', NULL, 'rb.oh.ccs.recreo@ricoburrito.com', 59, 196),
(49, '3002', 'J-40232150-3', 'Inversiones RB lider 2012 C.A.', 'RB LIDER', '227880793', NULL, 'rb.ccs.lider@ricoburrito.com', 59, 196),
(50, '3004', 'J-40232147-3', 'Operadora RB Metropolis 2012 C.A.', 'RB METROPOLIS', '378767461', NULL, 'rb.val.metropolis@ricoburrito.com', 59, 196),
(51, '3000', 'J-40148998-2', 'Operadora Popular Rondon 2012', 'RB CHACAITO', '208208162', NULL, 'rb.ccs.expreso@ricoburrito.com', 59, 196),
(52, '5', 'J-29869805-5', 'Operadora de Alimentos Antillana 2010 C.A.', 'ANTILLANA', '554774117', NULL, 'antillana@fullpizza.com', 59, 196),
(53, '57', 'J-40107855-9', 'Representaciones Green Margarita C.A.', 'GREEN MARTINI', '724265130', NULL, 'greenmartini@fullpizza.com', 59, 196),
(54, '6', 'J-29724633-9', 'Operadora FP Piccola 006 C.A.', 'PICCOLA', '568751869', NULL, 'piccola@fullpizza.com', 59, 196),
(55, '3', 'J-31329666-0', 'Cooperativa El Nazareno 1562 RL', 'ALLEGRE TRATTORIA', '314665353', NULL, 'trattoria@fullpizza.com', 59, 196),
(56, '8000', 'J-313017167', 'Corporacion ORLICA', 'BAGEL NOSH', '428802584', NULL, NULL, 59, 196),
(57, '5000', 'J-40520881-3', 'AyB Hernandez Sanchez C.A.', 'RESTAURANT LA MAR', '316460380', NULL, 'nelsonrhernandez10@gmail.com', 59, 196),
(58, '59', 'J-30756999-9', 'Operadora DLV001 C.A.', 'FP DELIVERY TIENDA', '814231707', NULL, NULL, 59, 196),
(59, '8888', NULL, NULL, 'Corporacion multifranquicia', NULL, NULL, NULL, NULL, 196),
(60, '8889', NULL, NULL, 'Multifranquicia (PTY)', NULL, NULL, NULL, NULL, 195),
(501, '0501', '2429074-1-808935 DV ', 'Franquicias Pizza Panama, S.A.', 'FP CARRUSEL(PTY)', '528821415', 19, NULL, 60, 195),
(502, '0502', '1390804-1-626179 DV ', 'Full Inversiones Panama, S.A.', 'FP MAGIC ZONE(PTY)', '903877581', 19, 'fpalbrook3@fullpizza.com', 60, 195),
(503, '0503', '1261127-1-595525 DV6', 'FRANQUICIAS FULL PANAMA', 'FP ALBROOK CINES(PTY)', '624581873', 19, 'fpalbrook2@fullpizza', 60, 195),
(504, '0504', '1818282-1-708554', 'Grupo Full pizza, S.A.', 'FP ALBROOK TERMINAL(PTY)', '768672660', 19, 'fpterminal@fullpizza.com', 60, 195),
(505, '0505', '2429074-1-808935 DV ', 'Franquicias Pizza Panama, S.A.', 'RB I ALBROOK(PTY)', '236548855', 20, NULL, 60, 195),
(506, '0506', '470523-1-708576 DV ', 'RESTAURANTE BROOKAL S.A.', 'BOULEVARD ALBROOK CAFE(PTY)', '673230906', 21, 'boulevardalbrook1@fullpizza.com', 60, 195),
(508, '0508', '1818282-1-708554 DV ', 'Grupo Pizza, S.A.', 'FP WESTLAND(PTY)', '241857645', 19, 'fpwestland1@fullpizza.com', 60, 195),
(509, '0509', '1818282-1-708554 DV ', 'Grupo Pizza, S.A.', 'BOULEVARD WESTLAND(PTY)', '763196583', 21, NULL, 60, 195),
(510, '0510', '2429074-1-808935 DV ', 'FRANQUICIAS PIZZA PANAMA S,A.', 'FP LOS ANDES(PTY)', '184859354', 19, 'fp.pty.losandes1@fullpizza.com', 60, 195),
(511, '0511', '155593908-2-2015 DV', 'Inversiones Capsal, S.A', 'FP EL DORADO(PTY)', '633300452', 19, NULL, 60, 195),
(512, '0512', '13908041-1-626179 DV', 'Full Inversiones Panama, S.A', 'RB II MAGIC ZONE(PTY)', '838312228', 20, NULL, 60, 195),
(513, '0513', '2469180-1-814587 DV4', 'Franquicias F Pizza Santiago,S.A.', 'FP SANTIAGO(PTY)', '242858646', 19, 'fpsantiago@fullpizza.com', 60, 195),
(514, '0514', '155619048-2-2015 DV42', 'Franquicias Stoners Pizza,S.A.', 'FP VILLA LUCRE(PTY)', '242858647', 19, 'fpstoners@fullpizza.com', 60, 195);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `respuesta` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `nombre`, `apellido`, `clave`, `tipo_usuario_id`, `pregunta_id`, `respuesta`) VALUES
(1, 'Jeanhd', 'Jean Gilles ', 'Raimbault', 'hd10042006', 35, 1, ''),
(2, 'leohd', 'Leonardo', 'Suarez', 'l30', 34, 1, ''),
(3, 'hirwuinhd', 'Hirwuin', 'Colmenares', 'Hcolmenares', 35, 36, 'Pelusa'),
(4, 'David', 'David', 'Reyes', 'd4v1dr3y3s', 113, 1, ''),
(5, 'Karla', 'Karla', 'Alvarez', 'c0st0s', 114, 1, ''),
(6, 'Victor', 'Victor', 'Castillo', 'v1ctorc4st1llo', 113, 1, ''),
(7, 'Martin', 'Martin', 'Schintu', '1n4ct1vo', 113, 1, ''),
(8, 'Manuel', 'Manuel', 'Rocha', 'rocha123', 113, 1, ''),
(9, 'Angel', 'Angel', 'Rivas', 'p4n4m42017', 113, 1, ''),
(10, 'Rodolfo', 'Rodolfo', 'Leon', 'rl30n', 113, 1, ''),
(11, 'Jerson', 'Jerson', 'Mendes', 'm3nd3sj', 113, 1, ''),
(12, 'Alvaro', 'Alvaro', 'Diez', '4lv4r0d13z', 113, 1, ''),
(13, 'Sergio', 'Sergio', 'Calzada', 's3rg10c', 113, 1, ''),
(14, 'Jean', 'Jean', 'Ospino', 'j34nOsp1no', 113, 1, ''),
(15, 'freddyhd', 'Freddy', 'Diaz', 'diazf', 35, 1, ''),
(16, 'Diana', 'Diana', 'Guzman', 'd14naGuzm4n', 113, 1, ''),
(17, 'Victor', 'Victor', 'Ochoa', 'V1ctorOcho4', 113, 1, ''),
(18, 'mariadelgado', 'maria', 'delgado', '1234567', 115, 37, 'margarita'),
(19, 'jeangilles', 'Jean-Gilles', 'Raimbault', '123456789', 115, 36, 'minone');

-- --------------------------------------------------------

--
-- Table structure for table `usuario_has_unidad_negocio`
--

CREATE TABLE `usuario_has_unidad_negocio` (
  `usuario_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario_has_unidad_negocio`
--

INSERT INTO `usuario_has_unidad_negocio` (`usuario_id`, `unidad_negocio_id`) VALUES
(1, 1),
(3, 1),
(15, 1),
(1, 2),
(1, 3),
(15, 3),
(1, 4),
(3, 4),
(15, 4),
(3, 5),
(2, 7),
(1, 39),
(3, 39),
(15, 39),
(1, 59),
(15, 59),
(9, 60),
(10, 60),
(1, 501),
(9, 501),
(10, 501),
(1, 502),
(9, 502),
(10, 502),
(1, 503),
(9, 503),
(10, 503),
(1, 504),
(9, 504),
(10, 504),
(1, 505),
(9, 505),
(10, 505),
(1, 506),
(9, 506),
(10, 506),
(1, 508),
(9, 508),
(10, 508),
(1, 509),
(9, 509),
(10, 509),
(1, 510),
(9, 510),
(10, 510),
(1, 511),
(9, 511),
(10, 511),
(1, 512),
(9, 512),
(10, 512),
(1, 513),
(9, 513),
(10, 513),
(1, 514),
(9, 514),
(10, 514);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  ADD KEY `fk_cliente_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_cliente_ubicacion1_idx` (`ubicacion_id`);

--
-- Indexes for table `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_combo_modelo1_idx` (`submodelo_id`);

--
-- Indexes for table `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_direccion_direccion1_idx` (`padre_id`),
  ADD KEY `fk_direccion_referencia1_idx` (`referencia_id`);

--
-- Indexes for table `explosion`
--
ALTER TABLE `explosion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_id` (`grupo`),
  ADD KEY `producto_id` (`producto`),
  ADD KEY `unidad_negocio_id` (`unidad_negocio_id`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproveedor` (`proveedor_id`),
  ADD KEY `idudn` (`unidad_negocio_id`);

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_grupo_referencia1_idx` (`familia_id`);

--
-- Indexes for table `ingredientes_has_explosion`
--
ALTER TABLE `ingredientes_has_explosion`
  ADD KEY `producto_id` (`producto_id`);

--
-- Indexes for table `ingrediente_has_receta`
--
ALTER TABLE `ingrediente_has_receta`
  ADD KEY `fk_materia_prima_has_receta_receta1_idx` (`receta_id`),
  ADD KEY `fk_materia_prima_has_receta_materia_prima1_idx` (`ingrediente_id`),
  ADD KEY `fk_ingrediente_has_receta_unidad_medida1_idx` (`unidad_medida_id`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_inventario` (`tipo_inventario`),
  ADD KEY `unidad_negocio_id` (`unidad_negocio_id`);

--
-- Indexes for table `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kardex_mercancia1_idx` (`mercancia_id`),
  ADD KEY `fk_kardex_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_kardex_referencia2_idx` (`tipo_movimiento_id`),
  ADD KEY `fk_kardex_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_kardex_unidad_medida1_idx` (`unidad_medida_id`),
  ADD KEY `motivo_id` (`motivo_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_unidad_negocio1_idx` (`unidad_negocio_id`);

--
-- Indexes for table `mercancia`
--
ALTER TABLE `mercancia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mercancia_referencia1_idx` (`familia_id`),
  ADD KEY `fk_mercancia_unidad_medida1_idx` (`unidad_medida_compra_id`),
  ADD KEY `fk_mercancia_unidad_medida2_idx` (`unidad_medida_consumo_id`),
  ADD KEY `fk_mercancia_unidad_medida3_idx` (`unidad_medida_sistema_id`),
  ADD KEY `receta_id` (`receta_id`),
  ADD KEY `subfamilia` (`sub_familia_id`),
  ADD KEY `tipo_ing` (`tipo_mercancia_id`),
  ADD KEY `asociado_id` (`asociado_id`),
  ADD KEY `tipo_inventario_id` (`tipo_inventario_id`);

--
-- Indexes for table `mercancia_has_factura`
--
ALTER TABLE `mercancia_has_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idfactura` (`factura_id`),
  ADD KEY `idmercancia` (`mercancia_id`),
  ADD KEY `idum` (`unidad_medida_id`);

--
-- Indexes for table `mercancia_has_modelo`
--
ALTER TABLE `mercancia_has_modelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mercancia_id` (`mercancia_id`),
  ADD KEY `modelo_id` (`modelo_id`);

--
-- Indexes for table `mercancia_has_reposicion`
--
ALTER TABLE `mercancia_has_reposicion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingrediente_id` (`ingrediente_id`),
  ADD KEY `unidad_medida_id` (`unidad_medida_id`),
  ADD KEY `proveedor_id` (`proveedor_id`),
  ADD KEY `unidad_medida_id_2` (`unidad_medida_id`),
  ADD KEY `reposicion_id` (`reposicion_id`);

--
-- Indexes for table `mercancia_has_unidad_negocio`
--
ALTER TABLE `mercancia_has_unidad_negocio`
  ADD PRIMARY KEY (`mercancia_id`,`unidad_negocio_id`),
  ADD KEY `fk_inventario_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_mercancia_has_unidad_negocio_mercancia1_idx` (`mercancia_id`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_modelo_modelo1_idx` (`padre_id`);

--
-- Indexes for table `modelo_has_grupo`
--
ALTER TABLE `modelo_has_grupo`
  ADD PRIMARY KEY (`modelo_id`,`grupo_id`),
  ADD KEY `fk_modelo_has_grupo_grupo1_idx` (`grupo_id`),
  ADD KEY `fk_modelo_has_grupo_modelo1_idx` (`modelo_id`);

--
-- Indexes for table `modelo_has_receta`
--
ALTER TABLE `modelo_has_receta`
  ADD PRIMARY KEY (`modelo_id`,`receta_id`),
  ADD KEY `fk_modelo_has_receta_receta1_idx` (`receta_id`),
  ADD KEY `fk_modelo_has_receta_modelo1_idx` (`modelo_id`);

--
-- Indexes for table `modelo_has_submodelo`
--
ALTER TABLE `modelo_has_submodelo`
  ADD PRIMARY KEY (`id`,`modelo_id`,`sub_modelo_id`),
  ADD KEY `fk_modelo_has_modelo_modelo2_idx` (`sub_modelo_id`),
  ADD KEY `fk_modelo_has_modelo_modelo1_idx` (`modelo_id`);

--
-- Indexes for table `notificacion_has_remision`
--
ALTER TABLE `notificacion_has_remision`
  ADD PRIMARY KEY (`reposicion_id`,`unidad_negocio_id`,`remision_id`),
  ADD KEY `fk_kardex_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_kardex_has_unidad_negocio_reposicion1_idx` (`reposicion_id`),
  ADD KEY `fk_kardex_has_unidad_negocio_remision1_idx` (`remision_id`),
  ADD KEY `fk_notificacion_has_remision_referencia1_idx` (`status_id`);

--
-- Indexes for table `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orden_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_orden_referencia1_idx` (`tipo_pago_id`),
  ADD KEY `fk_orden_referencia2_idx` (`status_id`);

--
-- Indexes for table `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`producto_id`),
  ADD KEY `unidadmedidaid` (`unidad_medida_id`),
  ADD KEY `udnid` (`unidad_negocio_id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_grupo1_idx` (`grupo_id`),
  ADD KEY `fk_producto_receta1_idx` (`receta_id`);

--
-- Indexes for table `producto_has_modelo`
--
ALTER TABLE `producto_has_modelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`producto_id`),
  ADD KEY `modeloid` (`modelo_id`);

--
-- Indexes for table `producto_has_orden`
--
ALTER TABLE `producto_has_orden`
  ADD PRIMARY KEY (`producto_id`,`orden_id`),
  ADD KEY `fk_producto_has_orden_orden1_idx` (`orden_id`),
  ADD KEY `fk_producto_has_orden_producto1_idx` (`producto_id`);

--
-- Indexes for table `producto_has_unidad_negocio`
--
ALTER TABLE `producto_has_unidad_negocio`
  ADD PRIMARY KEY (`producto_id`,`unidad_negocio_id`),
  ADD KEY `fk_producto_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_producto_has_unidad_negocio_producto1_idx` (`producto_id`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ubicacion_id` (`ubicacion_id`);

--
-- Indexes for table `proveedor_has_mercancia`
--
ALTER TABLE `proveedor_has_mercancia`
  ADD PRIMARY KEY (`mercancia_id`,`proveedor_id`),
  ADD KEY `fk_proveedor_has_mercancia_mercancia1_idx` (`mercancia_id`),
  ADD KEY `fk_proveedor_has_mercancia_proveedor1_idx` (`proveedor_id`);

--
-- Indexes for table `proveedor_has_telefono`
--
ALTER TABLE `proveedor_has_telefono`
  ADD PRIMARY KEY (`proveedor_id`,`telefono_id`),
  ADD KEY `fk_proveedor_has_telefono_telefono1_idx` (`telefono_id`),
  ADD KEY `fk_proveedor_has_telefono_proveedor1_idx` (`proveedor_id`);

--
-- Indexes for table `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unidad_m_id` (`unidad_medida_id`);

--
-- Indexes for table `receta_has_receta`
--
ALTER TABLE `receta_has_receta`
  ADD PRIMARY KEY (`receta_id`,`sub_receta_id`),
  ADD KEY `fk_receta_has_receta_receta2_idx` (`sub_receta_id`),
  ADD KEY `fk_receta_has_receta_receta1_idx` (`receta_id`);

--
-- Indexes for table `referencia`
--
ALTER TABLE `referencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_referencia_referencia1_idx` (`padre_id`);

--
-- Indexes for table `remision`
--
ALTER TABLE `remision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_remision_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_remision_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_remision_ingrediente1_idx` (`mercancia_id`),
  ADD KEY `unimedida` (`unidad_medida_id`);

--
-- Indexes for table `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_carga_compra_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_carga_compra_usuario1_idx` (`usuario_id`);

--
-- Indexes for table `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_telefono_referencia1_idx` (`codigo_id`);

--
-- Indexes for table `telefono_has_cliente`
--
ALTER TABLE `telefono_has_cliente`
  ADD PRIMARY KEY (`telefono_id`,`cliente_id`),
  ADD KEY `fk_telefono_has_cliente_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_telefono_has_cliente_telefono1_idx` (`telefono_id`);

--
-- Indexes for table `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ubicacion_direccion1_idx` (`parroquia_id`);

--
-- Indexes for table `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_unidad_medida_unidad_medida1_idx` (`padre_id`);

--
-- Indexes for table `unidad_negocio`
--
ALTER TABLE `unidad_negocio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_unidad_negocio_modelo_has_submodelo1_idx` (`modelo_has_submodelo_id`),
  ADD KEY `fk_unidad_negocio_unidad_negocio1_idx` (`empresa_id`),
  ADD KEY `pais_id` (`pais_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_referencia1_idx` (`tipo_usuario_id`),
  ADD KEY `fk_usuario_referencia2_idx` (`pregunta_id`);

--
-- Indexes for table `usuario_has_unidad_negocio`
--
ALTER TABLE `usuario_has_unidad_negocio`
  ADD PRIMARY KEY (`usuario_id`,`unidad_negocio_id`),
  ADD KEY `fk_usuario_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_usuario_has_unidad_negocio_usuario1_idx` (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `combo`
--
ALTER TABLE `combo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `explosion`
--
ALTER TABLE `explosion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=411;
--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `kardex`
--
ALTER TABLE `kardex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=237;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=260;
--
-- AUTO_INCREMENT for table `mercancia`
--
ALTER TABLE `mercancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=349;
--
-- AUTO_INCREMENT for table `mercancia_has_factura`
--
ALTER TABLE `mercancia_has_factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `mercancia_has_modelo`
--
ALTER TABLE `mercancia_has_modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `mercancia_has_reposicion`
--
ALTER TABLE `mercancia_has_reposicion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `modelo_has_submodelo`
--
ALTER TABLE `modelo_has_submodelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT for table `producto_has_modelo`
--
ALTER TABLE `producto_has_modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `referencia`
--
ALTER TABLE `referencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT for table `remision`
--
ALTER TABLE `remision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `telefono`
--
ALTER TABLE `telefono`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_ubicacion1` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `combo`
--
ALTER TABLE `combo`
  ADD CONSTRAINT `fk_combo_modelo1` FOREIGN KEY (`submodelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_direccion_direccion1` FOREIGN KEY (`padre_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_direccion_referencia1` FOREIGN KEY (`referencia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `explosion`
--
ALTER TABLE `explosion`
  ADD CONSTRAINT `fk_unidad_negocio_id` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupo_referencia1` FOREIGN KEY (`familia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ingrediente_has_receta`
--
ALTER TABLE `ingrediente_has_receta`
  ADD CONSTRAINT `fk_ingrediente_has_receta_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mercancia_id` FOREIGN KEY (`ingrediente_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_receta_id` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `fk_kardex_mercancia1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kardex_motivo_id` FOREIGN KEY (`motivo_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_tipo_movimiento_id` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mercancia`
--
ALTER TABLE `mercancia`
  ADD CONSTRAINT `fk_mercancia_referencia1` FOREIGN KEY (`familia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida1` FOREIGN KEY (`unidad_medida_compra_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida2` FOREIGN KEY (`unidad_medida_consumo_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida3` FOREIGN KEY (`unidad_medida_sistema_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receta_id2` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subfamilia_id` FOREIGN KEY (`sub_familia_id`) REFERENCES `referencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipom_id` FOREIGN KEY (`tipo_mercancia_id`) REFERENCES `referencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_inv_id` FOREIGN KEY (`tipo_inventario_id`) REFERENCES `referencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mercancia_has_reposicion`
--
ALTER TABLE `mercancia_has_reposicion`
  ADD CONSTRAINT `fk_ingrediente_id` FOREIGN KEY (`ingrediente_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prov_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reposicion_id` FOREIGN KEY (`reposicion_id`) REFERENCES `reposicion_mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mercancia_has_unidad_negocio`
--
ALTER TABLE `mercancia_has_unidad_negocio`
  ADD CONSTRAINT `fk_inventario_has_unidad_negocio_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_has_unidad_negocio_mercancia1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `fk_modelo_modelo1` FOREIGN KEY (`padre_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `modelo_has_grupo`
--
ALTER TABLE `modelo_has_grupo`
  ADD CONSTRAINT `fk_modelo_has_grupo_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modelo_has_grupo_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `modelo_has_receta`
--
ALTER TABLE `modelo_has_receta`
  ADD CONSTRAINT `fk_modelo_has_receta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modelo_has_receta_receta1` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `modelo_has_submodelo`
--
ALTER TABLE `modelo_has_submodelo`
  ADD CONSTRAINT `fk_modelo_has_modelo_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modelo_has_modelo_modelo2` FOREIGN KEY (`sub_modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_orden_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden_referencia1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden_referencia2` FOREIGN KEY (`status_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_receta1` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `producto_has_orden`
--
ALTER TABLE `producto_has_orden`
  ADD CONSTRAINT `fk_producto_has_orden_orden1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producto_has_orden_producto1_idx` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `producto_has_unidad_negocio`
--
ALTER TABLE `producto_has_unidad_negocio`
  ADD CONSTRAINT `fk_producto_has_unidad_negocio_producto1_idx	` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producto_has_unidad_negocio_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_ubicacion_proveedor` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proveedor_has_mercancia`
--
ALTER TABLE `proveedor_has_mercancia`
  ADD CONSTRAINT `fk_proveedor_has_mercancia_mercancia1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedor_has_mercancia_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `proveedor_has_telefono`
--
ALTER TABLE `proveedor_has_telefono`
  ADD CONSTRAINT `fk_proveedor_has_telefono_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedor_has_telefono_telefono1` FOREIGN KEY (`telefono_id`) REFERENCES `telefono` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `receta_has_receta`
--
ALTER TABLE `receta_has_receta`
  ADD CONSTRAINT `fk_receta_has_receta_receta1` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receta_has_receta_receta2` FOREIGN KEY (`sub_receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `referencia`
--
ALTER TABLE `referencia`
  ADD CONSTRAINT `fk_referencia_referencia1` FOREIGN KEY (`padre_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `remision`
--
ALTER TABLE `remision`
  ADD CONSTRAINT `fk_remision_ingrediente1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_remision_um1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_remision_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_remision_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
  ADD CONSTRAINT `fk_carga_compra_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carga_compra_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `fk_telefono_referencia1` FOREIGN KEY (`codigo_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `telefono_has_cliente`
--
ALTER TABLE `telefono_has_cliente`
  ADD CONSTRAINT `fk_telefono_has_cliente_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_telefono_has_cliente_telefono1` FOREIGN KEY (`telefono_id`) REFERENCES `telefono` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `fk_ubicacion_direccion1` FOREIGN KEY (`parroquia_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD CONSTRAINT `fk_unidad_medida_unidad_medida1` FOREIGN KEY (`padre_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unidad_negocio`
--
ALTER TABLE `unidad_negocio`
  ADD CONSTRAINT `fk_unidad_negocio_modelo_has_submodelo1` FOREIGN KEY (`modelo_has_submodelo_id`) REFERENCES `modelo_has_submodelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_unidad_negocio_unidad_negocio1` FOREIGN KEY (`empresa_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_referencia1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_referencia2` FOREIGN KEY (`pregunta_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario_has_unidad_negocio`
--
ALTER TABLE `usuario_has_unidad_negocio`
  ADD CONSTRAINT `fk_usuario_has_unidad_negocio_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_unidad_negocio_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
