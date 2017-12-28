-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-12-2017 a las 15:34:17
-- Versión del servidor: 5.5.58-cll
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hdj15229_cocai`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
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
-- Estructura de tabla para la tabla `combo`
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
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `referencia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `direccion`
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
-- Estructura de tabla para la tabla `explosion`
--

CREATE TABLE `explosion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_ranking` date NOT NULL,
  `grupo` varchar(45) NOT NULL,
  `codigo_prod` varchar(20) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `porcentaje_vta` decimal(19,2) DEFAULT NULL,
  `costo` decimal(19,2) DEFAULT NULL,
  `costo_total` decimal(19,2) DEFAULT NULL,
  `porcentaje_costo` decimal(19,2) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `explosion`
--

INSERT INTO `explosion` (`id`, `fecha`, `fecha_ranking`, `grupo`, `codigo_prod`, `producto`, `cantidad`, `monto`, `porcentaje_vta`, `costo`, `costo_total`, `porcentaje_costo`, `unidad_negocio_id`) VALUES
(1, '2017-12-21', '2017-12-17', 'POSTRES', 'FPSAU9100001', 'Brownie', 2, 9607, '100.00', '0.00', '0.00', '0.00', 1),
(2, '2017-12-21', '2017-12-17', 'BEBIDAS 16 Oz', 'FPSAU8300004', 'Pepsi Cola 16 Oz', 5, 13616, '83.33', '0.00', '0.00', '0.00', 1),
(3, '2017-12-21', '2017-12-17', 'POSTRES', 'FPSAU9100001', 'Brownie', 2, 9607, '100.00', '0.00', '0.00', '0.00', 1),
(4, '2017-12-21', '2017-12-17', 'BEBIDAS 16 Oz', 'FPSAU8300004', 'Pepsi Cola 16 Oz', 5, 13616, '83.33', '0.00', '0.00', '0.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `ordNum` varchar(45) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `recetaInactiva` tinyint(1) DEFAULT NULL,
  `subGrupo` varchar(100) DEFAULT NULL,
  `imagenProducto` text,
  `padre_id` int(11) DEFAULT NULL,
  `submodelo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `ordNum`, `codigo`, `nombre`, `recetaInactiva`, `subGrupo`, `imagenProducto`, `padre_id`, `submodelo_id`) VALUES
(1, '0', NULL, 'Familia', 0, NULL, NULL, NULL, NULL),
(2, '0', NULL, 'Alimentos', 0, NULL, NULL, 1, NULL),
(3, '0', NULL, 'Bebidas', 0, NULL, NULL, 1, NULL),
(4, '0', NULL, 'Bebidas alcoholicas', 0, NULL, NULL, 1, NULL),
(5, '0', NULL, 'Articulos', 0, NULL, NULL, 1, NULL),
(6, '0', NULL, 'Consumo personal', 0, NULL, NULL, 1, NULL),
(7, '13', NULL, 'ADICIONALES 8 - T', 0, NULL, NULL, 2, 49),
(8, '16', NULL, 'ADICIONALES GRANDES -T', 0, NULL, NULL, 2, 49),
(9, '15', NULL, 'ADICIONALES MEDIANOS -T', 0, NULL, NULL, 2, 49),
(10, '14', NULL, 'ADICIONALES PEQUENOS -T', 0, NULL, NULL, 2, 49),
(11, '8', NULL, 'BEBIDAS GRANDES - T', 0, NULL, NULL, 3, 49),
(12, '7', NULL, 'BEBIDAS MEDIANAS - T', 0, NULL, NULL, 3, 49),
(13, '6', NULL, 'BEBIDAS PEQUENAS - T', 0, NULL, NULL, 3, 49),
(14, '12', NULL, 'CAFE - T', 1, NULL, NULL, 3, 49),
(15, '24', NULL, 'ENSALADAS MIXTAS - T', 1, NULL, NULL, 2, 49),
(16, '11', NULL, 'JUGOS - T', 1, NULL, NULL, 3, 49),
(17, '17', NULL, 'PARA LLEVAR - T', 0, NULL, NULL, 5, 49),
(18, '22', NULL, 'PASTAS - T', 1, NULL, NULL, 2, 49),
(19, '1', NULL, 'PASTELITOS - T', 1, NULL, NULL, 2, 49),
(20, '27', NULL, 'PIZZA && BEBIDAS PERSONAL - T', 0, NULL, NULL, 6, 49),
(21, '2', NULL, 'PIZZAS 8 - T', 0, NULL, NULL, 2, 49),
(22, '5', NULL, 'PIZZAS GRANDES - T', 0, NULL, NULL, 2, 49),
(23, '4', NULL, 'PIZZAS MEDIANAS - T', 0, NULL, NULL, 2, 49),
(24, '3', NULL, 'PIZZAS PEQUENAS - T', 0, NULL, NULL, 2, 49),
(25, '25', NULL, 'POSTRES - T', 0, NULL, NULL, 2, 49),
(26, '10', NULL, 'REFRESCOS BOMBA 600ML - T', 1, NULL, NULL, 3, 49),
(27, '9', NULL, 'REFRESCOS LATA Y AGUAS - T', 0, NULL, NULL, 3, 49),
(28, '18', NULL, 'SIN ADIC 8 - T', 0, NULL, NULL, 2, 49),
(29, '21', NULL, 'SIN ADIC GR - T', 0, NULL, NULL, 2, 49),
(30, '20', NULL, 'SIN ADIC MED - T', 0, NULL, NULL, 2, 49),
(31, '19', NULL, 'SIN ADIC PEQ - T', 0, NULL, NULL, 2, 49),
(32, '23', NULL, 'TIPO PASTA - T', 1, NULL, NULL, 2, 49),
(36, '26', NULL, 'WRAP - T', 1, NULL, NULL, 2, 49),
(37, '0', NULL, 'BEBIDAS 16 Oz - NM', 0, NULL, NULL, 3, 49),
(38, '0', NULL, 'POSTRES-NM', 0, NULL, NULL, 2, 49),
(81, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 3, 84),
(86, '0', NULL, 'PASTELES', 0, NULL, NULL, 2, 84),
(88, '0', NULL, 'PIZZAS 16', 0, NULL, NULL, 2, 84),
(89, '0', NULL, 'ARTICOS', 0, NULL, NULL, 3, 83),
(90, '0', NULL, 'SLICES 16', 0, NULL, NULL, 2, 84),
(91, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 3, 83),
(92, '0', NULL, 'POSTRES', 0, NULL, NULL, 2, 84),
(93, '0', NULL, 'BEBIDAS PERSONAL', 0, NULL, NULL, 6, 83),
(95, '0', NULL, 'CAFE', 0, NULL, NULL, 3, 83),
(98, '0', NULL, 'DULCES FRIOS', 0, NULL, NULL, 2, 83),
(99, '0', NULL, 'EXTRAS', 0, NULL, NULL, 2, 83),
(100, '0', NULL, 'PASTELERIA DULCE', 0, NULL, NULL, 2, 83),
(101, '0', NULL, 'PASTELERIA SALADA', 0, NULL, NULL, 2, 83),
(102, '0', NULL, 'WAFFLES CLASICOS', 0, NULL, NULL, 2, 83),
(103, '0', NULL, 'INFUSIONES', 0, NULL, NULL, 3, 83),
(104, '0', NULL, 'COMBO LOKURA PIZZAS 16', 0, NULL, NULL, 2, 84),
(105, '0', NULL, 'COMBO PIZZAS 16', 0, NULL, NULL, 2, 84),
(107, '0', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 6, 84),
(108, '0', NULL, 'PARA LLEVAR', 0, NULL, NULL, 5, 84),
(111, '0', NULL, 'PROTEINA POTE', 1, NULL, NULL, 2, 85),
(112, '0', NULL, 'PROTEINA POTE LIGHT', 1, NULL, NULL, 2, 85),
(113, '1', NULL, 'BURROS', 0, NULL, NULL, 2, 85),
(114, '8', NULL, 'EXTRAS', 0, NULL, NULL, 2, 85),
(115, '3', NULL, 'POTE', 1, NULL, NULL, 2, 85),
(116, '7', NULL, 'REFRESCO LATA Y AGUA', 0, NULL, NULL, 3, 85),
(119, '9', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 6, 85),
(120, '4', NULL, 'BEBIDAS GRANDES', 0, NULL, NULL, 3, 85),
(121, '5', NULL, 'BEBIDAS MEDIANAS', 0, NULL, NULL, 3, 85),
(122, '6', NULL, 'BEBIDAS PEQUENAS', 0, NULL, NULL, 3, 85),
(123, '0', NULL, 'PROTEINA RICO BURRITO', 1, NULL, NULL, 2, 85),
(124, '2', NULL, 'TAQUERIA', 0, NULL, NULL, 2, 85),
(125, '0', NULL, 'OPCIONES CALIENTES', 1, NULL, NULL, 2, 85),
(126, '0', NULL, 'OPCIONES FRIAS', 1, NULL, NULL, 2, 85),
(127, '0', NULL, 'PLATOS', 0, NULL, NULL, 5, 85),
(128, '0', '', 'INFUSIONES', 0, NULL, NULL, NULL, 85),
(145, '13', NULL, 'ADICIONALES 8 - R', 1, NULL, NULL, 2, 52),
(146, '16', NULL, 'ADICIONALES GRANDES - R', 1, NULL, NULL, 2, 52),
(147, '15', NULL, 'ADICIONALES MEDIANOS - R', 1, NULL, NULL, 2, 52),
(148, '14', NULL, 'ADICIONALES PEQUENOS - R', 1, NULL, NULL, 2, 52),
(149, '8', NULL, 'BEBIDAS GRANDES - R', 0, NULL, NULL, 3, 52),
(150, '12', NULL, 'CAFE - R', 1, NULL, NULL, 3, 52),
(151, '11', NULL, 'JUGOS - R', 1, NULL, NULL, 3, 52),
(152, '17', NULL, 'PARA LLEVAR - R', 0, NULL, NULL, 5, 52),
(158, '2', NULL, 'PIZZAS 8 - R', 1, NULL, NULL, 2, 52),
(159, '5', NULL, 'PIZZAS GRANDES - R', 0, NULL, NULL, 2, 52),
(160, '4', NULL, 'PIZZAS MEDIANAS - R', 1, NULL, NULL, 2, 52),
(161, '3', NULL, 'PIZZAS PEQUENAS - R', 1, NULL, NULL, 2, 52),
(162, '25', NULL, 'POSTRES - R', 0, NULL, NULL, 2, 52),
(163, '10', NULL, 'REFRESCOS BOMBA 600ML - R', 1, NULL, NULL, 3, 52),
(164, '9', NULL, 'REFRESCOS LATA Y AGUAS - R', 0, NULL, NULL, 3, 52),
(165, '18', NULL, 'SIN ADIC 8 - R', 1, NULL, NULL, 2, 52),
(166, '21', NULL, 'SIN ADIC GR - R', 1, NULL, NULL, 2, 52),
(167, '20', NULL, 'SIN ADIC MED - R', 1, NULL, NULL, 2, 52),
(168, '19', NULL, 'SIN ADIC PEQ - R', 1, NULL, NULL, 2, 52),
(169, '7', NULL, 'BEBIDAS MEDIANAS - R', 0, NULL, NULL, 3, 52),
(170, '6', NULL, 'BEBIDAS PEQUENAS - R', 0, NULL, NULL, 3, 52),
(178, '27', NULL, 'PIZZA && BEBIDAS PERSONAL - R', 0, NULL, NULL, 6, 52),
(179, '1', NULL, 'PASTELITOS - R', 0, NULL, NULL, 2, 52),
(180, '9', NULL, 'ADICIONALES 12 -NM', 1, NULL, NULL, 2, 51),
(181, '13', NULL, 'ADICIONALES 8 - T', 1, NULL, NULL, 2, 51),
(182, '8', NULL, 'ADICIONALES 9 -NM', 1, NULL, NULL, 2, 51),
(183, '16', NULL, 'ADICIONALES GRANDES -T', 1, NULL, NULL, 2, 51),
(184, '9', NULL, 'ADICIONALES 12 ', 0, NULL, NULL, 2, 51),
(185, '10', NULL, 'ADICIONALES 16', 0, NULL, NULL, 2, 51),
(186, '10', NULL, 'ADICIONALES 16 -NM', 1, NULL, NULL, 2, 51),
(187, '8', NULL, 'ADICIONALES 9 ', 0, NULL, NULL, 2, 51),
(188, '14', NULL, 'ADICIONALES PEQUENOS -T', 1, NULL, NULL, 2, 51),
(189, '15', NULL, 'ADICIONALES MEDIANOS -T', 1, NULL, NULL, 2, 51),
(190, '24', NULL, 'ENSALADAS MIXTAS - T', 1, NULL, NULL, 2, 51),
(191, '11', NULL, 'PARA LLEVAR ', 0, NULL, NULL, 2, 51),
(192, '11', NULL, 'PARA LLEVAR - NM', 1, NULL, NULL, 2, 51),
(193, '17', NULL, 'PARA LLEVAR - T', 1, NULL, NULL, 2, 51),
(194, '22', NULL, 'PASTAS - T', 1, NULL, NULL, 2, 51),
(195, '1', NULL, 'PASTELITOS', 1, NULL, NULL, 2, 51),
(196, '1', NULL, 'PASTELITOS - T', 1, NULL, NULL, 2, 51),
(197, '3', NULL, 'PIZZAS 12', 0, NULL, NULL, 2, 51),
(198, '3', NULL, 'PIZZAS 12 - NM', 1, NULL, NULL, 2, 51),
(199, '4', NULL, 'PIZZAS 16 ', 0, NULL, NULL, 2, 51),
(200, '4', NULL, 'PIZZAS 16 - NM', 1, NULL, NULL, 2, 51),
(201, '1', NULL, 'PIZZAS 7', 0, NULL, NULL, 2, 51),
(202, '1', NULL, 'PIZZAS 7 - NM', 1, NULL, NULL, 2, 51),
(203, '2', NULL, 'PIZZAS 8 - T', 1, NULL, NULL, 2, 51),
(204, '2', NULL, 'PIZZAS 9', 0, NULL, NULL, 2, 51),
(205, '2', NULL, 'PIZZAS 9 - NM', 1, NULL, NULL, 2, 51),
(206, '5', NULL, 'PIZZAS GRANDES - T', 1, NULL, NULL, 2, 51),
(207, '4', NULL, 'PIZZAS MEDIANAS - T', 1, NULL, NULL, 2, 51),
(208, '12', NULL, 'POSTRES', 0, NULL, NULL, 2, 51),
(209, '12', NULL, 'POSTRES - NM', 1, NULL, NULL, 2, 51),
(210, '25', NULL, 'POSTRES - T', 1, NULL, NULL, 2, 51),
(211, '16', NULL, 'SIN ADIC 12', 0, NULL, NULL, 2, 51),
(212, '16', NULL, 'SIN ADIC 12 - NM', 1, NULL, NULL, 2, 51),
(213, '15', NULL, 'SIN ADIC 16 ', 0, NULL, NULL, 2, 51),
(214, '15', NULL, 'SIN ADIC 16 - NM', 1, NULL, NULL, 2, 51),
(215, '13', NULL, 'SIN ADIC 7', 0, NULL, NULL, 2, 51),
(216, '13', NULL, 'SIN ADIC 7 - NM', 1, NULL, NULL, 2, 51),
(217, '18', NULL, 'SIN ADIC 8 - T', 1, NULL, NULL, 2, 51),
(218, '14', NULL, 'SIN ADIC 9', 0, NULL, NULL, 2, 51),
(219, '14', NULL, 'SIN ADIC 9 - NM', 1, NULL, NULL, 2, 51),
(220, '21', NULL, 'SIN ADIC GR - T', 1, NULL, NULL, 2, 51),
(221, '20', NULL, 'SIN ADIC MED - T', 1, NULL, NULL, 2, 51),
(222, '19', NULL, 'SIN ADIC PEQ - T', 1, NULL, NULL, 2, 51),
(223, '23', NULL, 'TIPO PASTA - T', 1, NULL, NULL, 2, 51),
(224, '26', NULL, 'WRAP - T', 1, NULL, NULL, 2, 51),
(225, '5', NULL, 'BEBIDAS 16 Oz', 0, NULL, NULL, 3, 51),
(226, '5', NULL, 'BEBIDAS 16 Oz - NM', 1, NULL, NULL, 3, 51),
(227, '6', NULL, 'BEBIDAS 21 Oz', 0, NULL, NULL, 3, 51),
(228, '6', NULL, 'BEBIDAS 21 Oz - NM', 1, NULL, NULL, 3, 51),
(229, '8', NULL, 'BEBIDAS GRANDES - T', 1, NULL, NULL, 3, 51),
(230, '7', NULL, 'BEBIDAS MEDIANAS - T', 1, NULL, NULL, 3, 51),
(231, '6', NULL, 'BEBIDAS PEQUENAS - T', 1, NULL, NULL, 3, 51),
(232, '12', NULL, 'CAFE', 1, NULL, NULL, 3, 51),
(233, '12', NULL, 'CAFE - T', 1, NULL, NULL, 3, 51),
(234, '11', NULL, 'JUGOS - T', 1, NULL, NULL, 3, 51),
(235, '10', NULL, 'REFRESCOS BOMBA 600ML - T', 1, NULL, NULL, 3, 51),
(236, '7', NULL, 'REFRESCOS LATA Y AGUAS', 0, NULL, NULL, 3, 51),
(237, '7', NULL, 'REFRESCOS LATA Y AGUAS - NM', 1, NULL, NULL, 3, 51),
(238, '9', NULL, 'REFRESCOS LATA Y AGUAS - T', 1, NULL, NULL, 3, 51),
(241, '17', NULL, 'PIZ & BEB. PERS.', 0, NULL, NULL, 6, 51),
(242, '17', NULL, 'PIZ Y BEB. PERS. - NM', 1, NULL, NULL, 6, 51),
(243, '27', NULL, 'PIZZA && BEBIDAS PERSONAL - T', 1, NULL, NULL, 6, 51),
(244, '3', NULL, 'PIZZAS PEQUENAS - T', 1, NULL, NULL, 2, 51),
(249, '0', NULL, 'BEBIDAS', 0, NULL, NULL, 3, 86),
(251, '0', NULL, 'YOGURES', 0, NULL, NULL, 3, 86),
(252, '0', NULL, 'CAFE', 0, NULL, NULL, 3, 86),
(253, '0', NULL, 'DULCES FRIOS', 0, NULL, NULL, 2, 86),
(254, '0', NULL, 'DULCES', 0, NULL, NULL, 2, 86),
(255, '0', NULL, 'PASTA SECA', 0, NULL, NULL, 2, 86),
(256, '0', NULL, 'PIZZETAS', 0, NULL, NULL, 2, 86),
(257, '0', NULL, 'ENSALADAS', 0, NULL, NULL, 2, 86),
(258, '0', NULL, 'BOMBONES', 0, NULL, NULL, 2, 86),
(259, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 3, 155),
(260, '0', NULL, 'PASTELES', 0, NULL, NULL, 2, 155),
(261, '0', NULL, 'PIZZAS 16', 0, NULL, NULL, 2, 155),
(262, '0', NULL, 'SLICES 16', 0, NULL, NULL, 2, 155),
(263, '0', NULL, 'POSTRES', 0, NULL, NULL, 2, 155),
(264, '0', NULL, 'COMBO LOKURA PIZZAS 16', 0, NULL, NULL, 2, 155),
(265, '0', NULL, 'COMBO PIZZAS 16', 0, NULL, NULL, 2, 155),
(266, '0', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 6, 155),
(267, '0', NULL, 'PARA LLEVAR', 0, NULL, NULL, 5, 155),
(268, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 3, 156),
(269, '0', NULL, 'PASTELES', 0, NULL, NULL, 2, 156),
(270, '0', NULL, 'PIZZAS 16', 0, NULL, NULL, 2, 156),
(271, '0', NULL, 'SLICES 16', 0, NULL, NULL, 2, 156),
(272, '0', NULL, 'POSTRES', 0, NULL, NULL, 2, 156),
(273, '0', NULL, 'COMBO LOKURA PIZZAS 16', 0, NULL, NULL, 2, 156),
(274, '0', NULL, 'COMBO PIZZAS 16', 0, NULL, NULL, 2, 156),
(275, '0', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 6, 156),
(276, '0', NULL, 'PARA LLEVAR', 0, NULL, NULL, 5, 156),
(278, '3', NULL, 'PIZZAS OVALADAS - R', 0, NULL, NULL, 2, 52),
(279, '13', NULL, 'ADICIONALES 8 - R', 0, NULL, NULL, 2, 50),
(281, '16', NULL, 'ADICIONALES GRANDES - R', 0, NULL, NULL, 2, 50),
(282, '15', NULL, 'ADICIONALES MEDIANOS - R', 0, NULL, NULL, 2, 50),
(283, '14', NULL, 'ADICIONALES PEQUENOS - R', 0, NULL, NULL, 2, 50),
(284, '1', NULL, 'PASTELITOS - R', 1, NULL, NULL, 2, 50),
(285, '2', NULL, 'PIZZAS 8 - R', 0, NULL, NULL, 2, 50),
(286, '5', NULL, 'PIZZAS GRANDES - R', 0, NULL, NULL, 2, 50),
(287, '4', NULL, 'PIZZAS MEDIANAS - R', 0, NULL, NULL, 2, 50),
(288, '3', NULL, 'PIZZAS PEQUENAS - R', 0, NULL, NULL, 2, 50),
(289, '25', NULL, 'POSTRES - R', 0, NULL, NULL, 2, 50),
(290, '18', NULL, 'SIN ADIC 8 - R', 0, NULL, NULL, 2, 50),
(291, '21', NULL, 'SIN ADIC GR - R', 0, NULL, NULL, 2, 50),
(292, '20', NULL, 'SIN ADIC MED - R', 0, NULL, NULL, 2, 50),
(293, '19', NULL, 'SIN ADIC PEQ - R', 0, NULL, NULL, 2, 50),
(294, '8', NULL, 'BEBIDAS GRANDES - R', 0, NULL, NULL, 3, 50),
(295, '7', NULL, 'BEBIDAS MEDIANAS - R', 0, NULL, NULL, 3, 50),
(296, '6', NULL, 'BEBIDAS PEQUENAS - R', 0, NULL, NULL, 3, 50),
(297, '12', NULL, 'CAFE - R', 1, NULL, NULL, 3, 50),
(298, '11', NULL, 'JUGOS - R', 1, NULL, NULL, 3, 50),
(299, '10', NULL, 'REFRESCOS BOMBA 600ML - R', 1, NULL, NULL, 3, 50),
(300, '9', NULL, 'REFRESCOS LATA Y AGUAS - R', 0, NULL, NULL, 3, 50),
(301, '17', NULL, 'PARA LLEVAR - R', 0, NULL, NULL, 5, 50),
(302, '27', NULL, 'PIZZA Y BEBIDAS PERSONAL - R', 0, NULL, NULL, 6, 50),
(306, '0', NULL, 'BEBIDAS CALIENTES', 1, NULL, NULL, 3, 84),
(307, '0', NULL, 'PIZZAS OVALADAS', 0, NULL, NULL, 2, 155),
(308, '0', NULL, 'PIZZAS GRANDES', 0, NULL, NULL, 2, 155),
(309, '0', NULL, 'BEBIDAS FRIAS', 0, NULL, NULL, 3, 157),
(310, '0', NULL, 'PASTELES', 0, NULL, NULL, 2, 157),
(311, '0', NULL, 'PIZZAS 16', 0, NULL, NULL, 2, 157),
(312, '0', NULL, 'SLICES 16', 0, NULL, NULL, 2, 157),
(313, '0', NULL, 'POSTRES', 0, NULL, NULL, 2, 157),
(314, '0', NULL, 'COMBO LOKURA PIZZAS 16', 0, NULL, NULL, 2, 157),
(315, '0', NULL, 'COMBO PIZZAS 16', 0, NULL, NULL, 2, 157),
(316, '0', NULL, 'COMIDA & BEBIDA PERSONAL', 0, NULL, NULL, 6, 157),
(317, '0', NULL, 'PARA LLEVAR', 0, NULL, NULL, 5, 157),
(318, '0', NULL, 'BEBIDAS CALIENTES', 1, NULL, NULL, NULL, 155),
(319, '0', NULL, 'SLICES 18', 1, NULL, NULL, NULL, 155),
(320, '0', NULL, 'COMBOS PIZZAS 18', 1, NULL, NULL, NULL, 155),
(321, '0', NULL, 'COMBOS PIZZAS 18', 1, NULL, NULL, NULL, 156),
(322, '0', NULL, 'SLICES 18', 1, NULL, NULL, NULL, 156),
(323, '0', NULL, 'BEBIDAS CALIENTES', 1, NULL, NULL, NULL, 156),
(324, '0', NULL, 'SLICES 18', 1, NULL, NULL, NULL, 84),
(328, '0', NULL, 'COMBOS PIZZAS 18', 1, NULL, NULL, NULL, 84),
(329, '0', NULL, 'NACHOS', 1, NULL, NULL, NULL, 85),
(330, '10', NULL, 'INFUSIONES', 0, NULL, NULL, NULL, 85),
(331, '0', NULL, 'PROTEINA BURRITO', 1, NULL, NULL, NULL, 85),
(332, '0', NULL, 'PROTEINA BURRO', 1, NULL, NULL, NULL, 85),
(333, '0', NULL, 'PROTEINA MATA BURRO', 1, NULL, NULL, NULL, 85),
(334, '0', NULL, 'COMBOS PIZZAS 18', 1, NULL, NULL, NULL, 157),
(335, '0', NULL, 'SLICES 18', 1, NULL, NULL, NULL, 157),
(336, '0', NULL, 'BEBIDAS CALIENTES', 1, NULL, NULL, NULL, 157),
(337, '1', NULL, 'Pizzas Med', 0, NULL, NULL, NULL, 100),
(338, '2', NULL, 'Pizzas Fam', 0, NULL, NULL, NULL, 100),
(339, '4', NULL, 'Acompanantes', 0, NULL, NULL, NULL, 100),
(340, '5', NULL, 'Postres', 0, NULL, NULL, NULL, 100),
(341, '3', NULL, 'Bebidas', 0, NULL, NULL, NULL, 100),
(342, '1', NULL, 'PIZZA-9', 0, NULL, NULL, NULL, 177),
(343, '2', NULL, 'PIZZA-12', 0, NULL, NULL, NULL, 177),
(344, '3', NULL, 'PIZZA-14', 0, NULL, NULL, NULL, 177),
(345, '4', NULL, 'PIZZA-16', 0, NULL, NULL, NULL, 177),
(346, '5', NULL, 'Combo 9', 0, NULL, NULL, NULL, 177),
(347, '6', NULL, 'COMBO 12', 0, NULL, NULL, NULL, 177),
(348, '7', NULL, 'COMBO 14', 0, NULL, NULL, NULL, 177),
(349, '8', NULL, 'COMBO 16', 0, NULL, NULL, NULL, 177),
(350, '9', NULL, 'PROMOCION DEL MES', 0, NULL, NULL, NULL, 177),
(351, '10', NULL, 'SODAS PEQUEÃ‘AS', 0, NULL, NULL, NULL, 177),
(352, '11', NULL, 'SODAS MEDIANAS', 0, NULL, NULL, NULL, 177),
(353, '12', NULL, 'SODAS GRANDES', 0, NULL, NULL, NULL, 177),
(354, '13', NULL, 'ADICIONAL 9', 0, NULL, NULL, NULL, 177),
(355, '14', NULL, 'ADICIONAL 12', 0, NULL, NULL, NULL, 177),
(356, '15', NULL, 'ADICIONAL 14', 0, NULL, NULL, NULL, 177),
(357, '20', NULL, 'P-LLEVAR', 0, NULL, NULL, NULL, 177),
(358, '17', NULL, 'CON ADIC-PEQ', 0, NULL, NULL, NULL, 177),
(359, '18', NULL, 'CON ADIC-MED', 0, NULL, NULL, NULL, 177),
(361, '19', NULL, 'CON ADIC-GRD', 0, NULL, NULL, NULL, 177),
(362, '21', NULL, 'SIN ADIC-PEQ', 0, NULL, NULL, NULL, 177),
(363, '22', NULL, 'SIN ADIC-MED', 0, NULL, NULL, NULL, 177),
(364, '23', NULL, 'SIN ADIC-GRD', 0, NULL, NULL, NULL, 177),
(365, '24', NULL, 'POSTRES', 0, NULL, NULL, NULL, 177),
(366, '25', NULL, 'SLICE', 0, NULL, NULL, NULL, 177),
(367, '26', NULL, 'EXTRAS', 0, NULL, NULL, NULL, 177),
(368, '27', NULL, 'MALTEADAS', 0, NULL, NULL, NULL, 177),
(370, '29', NULL, 'PRE.POSTRES COMBO', 0, NULL, NULL, NULL, 177),
(371, '30', NULL, 'PRE.SABOR COMBO', 0, NULL, NULL, NULL, 177),
(372, '1', NULL, 'Burrito', 0, NULL, NULL, NULL, 178),
(373, '2', NULL, 'Burro', 0, NULL, NULL, NULL, 178),
(374, '3', NULL, 'Mata Burro 10\"', 0, NULL, NULL, NULL, 178),
(375, '4', NULL, 'Mata Burro 12\"', 0, NULL, NULL, NULL, 178),
(376, '5', NULL, 'OPCIONES FRIAS', 0, NULL, NULL, NULL, 178),
(377, '6', NULL, 'Combos', 0, NULL, NULL, NULL, 178),
(378, '7', NULL, 'Combos RB', 0, NULL, NULL, NULL, 178),
(379, '8', NULL, 'Bebidas 12 Oz', 0, NULL, NULL, NULL, 178),
(380, '9', NULL, 'Bebidas 16 Oz', 0, NULL, NULL, NULL, 178),
(381, '10', NULL, 'Bebidas 22 Oz', 0, NULL, NULL, NULL, 178),
(382, '11', NULL, 'POSTRES', 0, NULL, NULL, NULL, 178),
(383, '12', NULL, 'X- FRIOS', 0, NULL, NULL, NULL, 178),
(384, '13', NULL, 'X- CALIENTES', 0, NULL, NULL, NULL, 178),
(385, '14', NULL, 'X-Proteinas 10\"', 0, NULL, NULL, NULL, 178),
(386, '15', NULL, 'X-Proteinas 12\"', 0, NULL, NULL, NULL, 178),
(387, '16', NULL, 'X-SALSAS', 0, NULL, NULL, NULL, 178),
(388, '17', NULL, 'Opciones Calientes', 0, NULL, NULL, NULL, 178),
(389, '18', NULL, 'Preparacion Proteina', 0, NULL, NULL, NULL, 178),
(390, '19', NULL, 'Prep. Combos Bebidas', 0, NULL, NULL, NULL, 178),
(392, '16', NULL, 'ADICIONAL 16', 0, NULL, NULL, NULL, 177),
(393, '28', NULL, 'PRE.BEBIDA COMBO', 0, NULL, NULL, NULL, 177),
(394, '31', NULL, 'FULL ECONOMICA', 1, NULL, NULL, NULL, 177);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_has_explosion`
--

CREATE TABLE `ingredientes_has_explosion` (
  `explosion_id` int(11) NOT NULL,
  `ingrediente_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingredientes_has_explosion`
--

INSERT INTO `ingredientes_has_explosion` (`explosion_id`, `ingrediente_id`, `cantidad`, `unidad_medida_id`) VALUES
(1, 15, 4, 12),
(2, 15, 5, 12),
(3, 15, 4, 12),
(4, 15, 5, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente_has_receta`
--

CREATE TABLE `ingrediente_has_receta` (
  `ingrediente_id` int(11) DEFAULT NULL,
  `receta_id` int(11) NOT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingrediente_has_receta`
--

INSERT INTO `ingrediente_has_receta` (`ingrediente_id`, `receta_id`, `cantidad`, `unidad_medida_id`) VALUES
(1, 3, 1, 5),
(17, 2, 1, 13),
(15, 4, 1, 4),
(16, 2, 2, 15),
(15, 5, 1, 4),
(17, 3, 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cantidad` int(5) DEFAULT NULL,
  `descripcion` text,
  `tipo_movimiento_id` int(11) DEFAULT NULL,
  `mercancia_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `motivo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`id`, `fecha`, `hora`, `cantidad`, `descripcion`, `tipo_movimiento_id`, `mercancia_id`, `unidad_negocio_id`, `usuario_id`, `unidad_medida_id`, `motivo_id`) VALUES
(2, '2017-08-15', '10:12:10', 24000, 'bulto de arroz', 131, 1, 1, 15, 6, 122),
(3, '2017-08-15', '15:19:05', 22800, 'medio bulto de arroz', 131, 1, 1, 15, 6, 122),
(4, '2017-08-15', '15:44:08', 48000, 'refresco de 2 litro', 131, 2, 1, 15, 12, 122),
(5, '2017-08-15', '15:00:45', 2000, 'Solicitud de emergencia por que se acabo el arroz', 131, 1, 1, 3, 6, 122),
(6, '2017-08-15', '15:09:38', 21600, 'Solicitud de emergencia por que se acabo el arroz', 131, 1, 5, 15, 6, 122),
(7, '2017-08-15', '15:19:22', 24000, 'Compra de arroz aprovechando una oferta de un proveedor', 131, 1, 7, 1, 6, 122),
(8, '2017-08-18', '08:38:17', 71280, '', 132, 1, 59, 15, 6, 133),
(9, '2017-08-18', '08:38:49', 71280, '', 132, 1, 59, 15, 6, 133),
(14, '2017-08-18', '08:42:15', 71280, 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(15, '2017-08-21', '02:57:43', 90000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(16, '2017-08-21', '03:00:26', 90000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(17, '2017-08-21', '03:00:36', 90000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(18, '2017-08-21', '03:01:54', 90000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(19, '2017-08-21', '03:01:55', 90000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(20, '2017-08-21', '03:01:56', 90000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(21, '2017-08-21', '03:01:56', 90000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(22, '2017-08-21', '03:03:11', 90000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(23, '2017-08-21', '03:09:33', 108000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(24, '2017-08-21', '03:11:55', 108000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(25, '2017-08-21', '03:14:51', 108000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(26, '2017-08-21', '03:16:24', 108000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(27, '2017-08-21', '03:16:54', 108000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(29, '2017-11-22', '12:12:13', 0, '33600', 132, 1, 59, 15, 12, 133),
(30, '2017-11-22', '12:18:38', 0, '33600', 132, 1, 59, 15, 12, 133),
(31, '2017-11-22', '12:37:04', 0, '33600', 132, 1, 59, 15, 12, 133),
(32, '2017-11-22', '12:38:08', 0, '33600', 132, 1, 59, 15, 12, 133),
(34, '2017-11-22', '12:38:31', 0, '33600', 132, 4, 59, 15, 12, 133),
(35, '2017-11-22', '01:02:46', 0, '2000', 132, 11, 59, 15, 6, 133),
(36, '2017-11-22', '01:03:03', 0, '2000', 132, 11, 59, 15, 6, 133),
(37, '2017-11-22', '01:15:45', 0, '50', 132, 2, 59, 15, 12, 133),
(38, '2017-11-22', '01:16:13', 0, '1000', 132, 2, 59, 15, 12, 133),
(39, '2017-11-22', '01:16:57', 0, '3000', 132, 2, 59, 15, 12, 133),
(40, '2017-11-22', '03:56:49', 3000, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(41, '2017-11-23', '09:48:33', 3500, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(42, '2017-11-23', '10:41:50', 2500, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(43, '2017-11-23', '02:54:47', 3000, 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(44, '2017-11-23', '02:55:14', 2500, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(45, '2017-11-23', '02:55:27', 3500, 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(46, '2017-11-23', '02:55:34', 3000, 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(47, '2017-11-24', '03:11:56', 1206500, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(48, '2017-11-24', '03:13:23', 8500, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(49, '2017-11-24', '03:13:54', 10500, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(50, '2017-11-24', '03:39:47', 11100, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(51, '2017-11-24', '03:41:20', 11100, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(52, '2017-11-24', '03:42:30', 20100, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(53, '2017-11-24', '05:17:03', 22100, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(54, '2017-11-27', '09:52:03', 23300, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(55, '2017-11-27', '10:42:59', 24300, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(56, '2017-11-27', '10:45:47', 25300, 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(57, '2017-11-27', '10:48:39', 26500, 'se derramo un litro ', 132, 2, 1, 15, 12, 122),
(58, '2017-11-27', '12:46:59', 5500, 'prueba 2', 132, 2, 59, 15, 12, 122),
(59, '2017-12-04', '10:15:30', 2970, 'Producto creado', 131, 12, 59, 15, 6, 123),
(60, '2017-12-04', '11:09:57', 81, 'Producto creado', 131, 13, 59, 15, 12, 123),
(61, '2017-12-04', '02:46:34', 2000, 'Producto creado', 131, 14, 59, 15, 6, 123),
(62, '2017-12-04', '02:49:55', 6000, 'Producto creado', 131, 15, 59, 15, 12, 123),
(63, '2017-12-04', '03:00:37', 1000, 'Producto creado', 131, 16, 59, 15, 6, 123),
(64, '2017-12-04', '03:05:04', 6000, 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(65, '2017-12-04', '03:05:41', 6000, 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(66, '2017-12-04', '03:26:37', 6000, 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(67, '2017-12-04', '03:26:52', 6000, 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(68, '2017-12-04', '03:28:13', 6000, 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(69, '2017-12-04', '04:05:43', 5000, 'Producto creado', 131, 17, 59, 15, 12, 123),
(70, '2017-12-04', '04:27:15', 2000, 'Producto creado', 131, 18, 59, 15, 6, 123),
(71, '2017-12-06', '02:55:43', 0, 'Error cargando los datos del producto', 132, 15, 1, 15, 12, 133),
(72, '2017-12-06', '03:05:30', 44444, 'Producto creado', 131, 19, 59, 15, 6, 123),
(73, '2017-12-06', '03:06:48', 42624, 'Producto creado', 131, 20, 59, 15, 12, 123),
(74, '2017-12-06', '03:07:25', 42624, 'Error cargando los datos del producto', 132, 20, 59, 15, 12, 133);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `log`
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
(74, '2017-12-06', '03:07:25', 'Producto', 'fdsfsdf', 'Modificado', 'Freddy Diaz', 59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mercancia`
--

CREATE TABLE `mercancia` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `codigo_anterior` varchar(45) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` text,
  `precio_unitario` decimal(19,2) DEFAULT NULL,
  `contenido_neto` int(11) DEFAULT NULL,
  `cantidad_presentacion` int(11) DEFAULT NULL,
  `formula_c` varchar(45) DEFAULT NULL,
  `formula_p` varchar(45) DEFAULT NULL,
  `formula_s` varchar(45) DEFAULT NULL,
  `familia_id` int(11) NOT NULL,
  `unidad_medida_compra_id` int(11) NOT NULL,
  `unidad_medida_consumo_id` int(11) NOT NULL,
  `unidad_medida_sistema_id` int(11) NOT NULL,
  `peso_escurrido` int(11) DEFAULT NULL,
  `descripcion` text,
  `exento_impuesto` tinyint(1) DEFAULT NULL,
  `rendimiento` int(11) DEFAULT NULL,
  `receta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mercancia`
--

INSERT INTO `mercancia` (`id`, `codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`, `peso_escurrido`, `descripcion`, `exento_impuesto`, `rendimiento`, `receta_id`) VALUES
(1, 'A001', '', 'Arroz', 'Primor', '1000.00', 990, 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, 19, 5, 6, NULL, NULL, NULL, NULL, 2),
(2, 'B002', '', 'Refresco', 'Coca-cola', '3000.00', 2000, 12, 'Cja * 2000', 'Ltrs *', 'Ml *', 117, 11, 4, 12, NULL, NULL, NULL, NULL, 1),
(4, 'AC001', NULL, 'Aceite', 'Vatel', '5000.00', 1000, 12, 'Cja * 1000', NULL, NULL, 116, 11, 4, 12, NULL, NULL, NULL, NULL, NULL),
(6, 'Q0010', '', 'Queso amarillo', 'Paisa', '10000.00', 600, 12, 'Cja * 600', NULL, NULL, 116, 11, 5, 6, NULL, NULL, NULL, NULL, NULL),
(7, 'H0012', '', 'Harina', 'Pan', '8000.00', 990, 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, 19, 5, 6, NULL, NULL, NULL, NULL, NULL),
(8, 'J0041', NULL, 'Jamon', 'Plumrose', '50000.00', 25000, 1, 'Pza * 2500', '', '', 116, 14, 5, 6, NULL, NULL, NULL, NULL, NULL),
(9, '59006', NULL, 'Agua saborizada', 'Los andes', '1000.00', 700, 24, 'Cja * 700', NULL, NULL, 117, 11, 7, 12, NULL, NULL, 1, NULL, NULL),
(11, '59007', 'abcd', 'harina', 'juana', '40000.00', 1000, 24, 'Blto * 1000', 'Kgs *', 'Gr *', 116, 19, 5, 6, 1000, 'harina de maiz', 1, 1000, NULL),
(12, '59007', 'abcd', 'arroz', 'mary', '40.00', 990, 3, 'Blto * 990', NULL, 'null', 116, 19, 5, 6, 1000, 'arroz mary 1 kg', 0, 1000, NULL),
(13, '59008', 'p003', 'Refresco', 'refresco pepsi de 1 litro', '50.00', 1000, 9, 'Cja * 9', 'null', 'null', 117, 11, 4, 12, NULL, NULL, NULL, NULL, NULL),
(14, '59009', 'null', 'pasta', 'primor', '40.00', 1000, 2, 'Kgs * 1000', 'null', 'null', 116, 5, 5, 6, 1000, 'probando', 0, 1000, NULL),
(15, '5900101', '', 'Refresco', 'Sevenup', '50000.00', 2000, 3, 'Cja * 2000', 'null', 'null', 117, 11, 4, 12, NULL, NULL, NULL, NULL, NULL),
(16, '590010', 'null', 'Atun', 'Margarita', '35000.00', 500, 2, 'Lta * 500', 'null', 'null', 116, 15, 15, 6, 450, 'atun enlatado margarita 500gr', 0, 500, 5),
(17, '590011', 'null', 'salsa', 'ketchup', '2000.00', 250, 20, 'Ltrs * 250', 'null', 'null', 116, 4, 4, 13, 250, 'prueba precio proveedor', 0, 250, NULL),
(18, '590012', 'null', 'azucar', 'la lucha', '25000.00', 1000, 2, 'Kgs * 1000', 'null', 'null', 116, 5, 5, 6, 1000, 'probando', 0, 1000, NULL),
(19, '590013', '', 'asdas', 'sadasd', '2121.22', 22222, 2, 'Kgs * 22222', '', '', 116, 5, 5, 6, 1111, '', 0, 22222, NULL),
(20, '590014', '', 'fdsfsdf', 'asdasd', '213.32', 21312, 2, 'Kgs * 21312', '', '', 116, 5, 16, 12, 21312, '', 0, 21321, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mercancia_has_reposicion`
--

CREATE TABLE `mercancia_has_reposicion` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(19,2) NOT NULL,
  `ingrediente_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `proveedor_id` int(11) DEFAULT '0',
  `reposicion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mercancia_has_reposicion`
--

INSERT INTO `mercancia_has_reposicion` (`id`, `cantidad`, `precio`, `ingrediente_id`, `unidad_medida_id`, `proveedor_id`, `reposicion_id`) VALUES
(25, 2, '3000.00', 1, 0, NULL, 1),
(35, 2, '3000.00', 2, 0, NULL, 1),
(36, 2, '3000.00', 1, 0, NULL, 2),
(38, 2, '3000.00', 2, 0, NULL, 2),
(39, 1, '3000.00', 2, 0, NULL, 3),
(40, 2, '1.00', 1, 0, NULL, 3),
(41, 2, '1.00', 1, 0, NULL, 4),
(42, 3, '3000.00', 2, 0, NULL, 4),
(43, 2, '1.00', 1, 19, NULL, 5),
(44, 2, '3000.00', 2, 4, NULL, 5),
(45, 2, '780.00', 1, 5, NULL, 6),
(46, 3, '800.00', 2, 4, NULL, 6),
(47, 2, '780.00', 1, 5, NULL, 7),
(48, 3, '800.00', 2, 4, NULL, 7),
(49, 2, '780.00', 1, 5, NULL, 8),
(51, 2, '800.00', 2, 4, NULL, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mercancia_has_unidad_negocio`
--

CREATE TABLE `mercancia_has_unidad_negocio` (
  `mercancia_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL DEFAULT '0',
  `codigo_modelo` varchar(45) DEFAULT NULL,
  `existencia` float DEFAULT '0',
  `stock_min` int(11) DEFAULT NULL,
  `stock_max` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mercancia_has_unidad_negocio`
--

INSERT INTO `mercancia_has_unidad_negocio` (`mercancia_id`, `unidad_negocio_id`, `codigo_modelo`, `existencia`, `stock_min`, `stock_max`, `status`, `descripcion`) VALUES
(1, 1, NULL, 3000, 30000, 60000, 0, NULL),
(1, 39, NULL, 7500, 3000, 9000, 0, NULL),
(1, 59, NULL, 3000, 30000, 60000, 0, NULL),
(2, 1, NULL, 600, NULL, NULL, 0, NULL),
(2, 59, NULL, 5500, 30000, 60000, 1, NULL),
(4, 39, NULL, 4500, 3000, 6000, 0, NULL),
(4, 59, NULL, 33600, 50, 1000, 1, NULL),
(6, 59, NULL, 7200, 5000, 10000, 0, NULL),
(11, 59, NULL, 2000, 10000, 50000, 0, 'harina de maiz'),
(12, 59, NULL, 2970, 10000, 60000, 0, 'arroz mary 1 kg'),
(14, 59, NULL, 2000, 2000, 10000, 0, 'probando'),
(15, 1, NULL, 0, NULL, NULL, 0, NULL),
(15, 59, NULL, 6000, 8000, 60000, 0, '2'),
(16, 1, NULL, 0, NULL, NULL, 0, NULL),
(16, 59, NULL, 1000, 2000, 50000, 0, 'atun enlatado margarita 500gr'),
(17, 1, NULL, 0, NULL, NULL, 0, NULL),
(17, 59, NULL, 5000, 6000, 20000, 0, 'prueba precio proveedor'),
(18, 59, NULL, 2000, 5000, 30000, 0, 'probando'),
(19, 59, NULL, 44444, 222222, 222222, 0, ''),
(20, 59, NULL, 42624, 21312312, 2131231, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelo`
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
(20, 'Boulevard cafe(PTY)', 'BC(PT', 5),
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
(33, 'braintax', NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_has_grupo`
--

CREATE TABLE `modelo_has_grupo` (
  `modelo_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelo_has_grupo`
--

INSERT INTO `modelo_has_grupo` (`modelo_id`, `grupo_id`) VALUES
(22, 1),
(22, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_has_receta`
--

CREATE TABLE `modelo_has_receta` (
  `modelo_id` int(11) NOT NULL,
  `receta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelo_has_receta`
--

INSERT INTO `modelo_has_receta` (`modelo_id`, `receta_id`) VALUES
(7, 2),
(7, 3),
(7, 4),
(7, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_has_submodelo`
--

CREATE TABLE `modelo_has_submodelo` (
  `id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  `sub_modelo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelo_has_submodelo`
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
(18, 21, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_has_remision`
--

CREATE TABLE `notificacion_has_remision` (
  `reposicion_id` int(11) NOT NULL,
  `remision_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notificacion_has_remision`
--

INSERT INTO `notificacion_has_remision` (`reposicion_id`, `remision_id`, `unidad_negocio_id`, `status_id`) VALUES
(0, 8, 2, 126),
(0, 5, 3, 126),
(0, 9, 3, 126),
(0, 10, 3, 126),
(0, 1, 5, 126),
(0, 2, 5, 126),
(0, 7, 5, 126),
(0, 3, 7, 126),
(0, 6, 7, 126),
(0, 4, 1, 127),
(1, 0, 59, 129),
(2, 0, 59, 129),
(3, 0, 59, 129),
(4, 0, 59, 129),
(5, 0, 59, 129),
(6, 0, 59, 129),
(7, 0, 59, 129),
(8, 0, 59, 129);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
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
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `codigo_tcr` varchar(45) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `costo` decimal(19,2) DEFAULT NULL,
  `porcentaje_costo` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `precioVta_A` decimal(19,2) DEFAULT NULL,
  `precioVta_B` decimal(19,2) DEFAULT NULL,
  `producto_Inactivo` tinyint(1) DEFAULT NULL,
  `ocultar` tinyint(1) DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  `dia_disponible_id` int(11) DEFAULT NULL,
  `tipo_producto_id` int(11) DEFAULT NULL,
  `tipo_manejo_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `sub_modelo_id` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `stock_maximo` int(11) DEFAULT NULL,
  `receta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `receta_id`) VALUES
(1, 'FPSAU2000005', '160008', 'Piz. Prueba - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(2, 'FPSAU2200005', 'PIZ10', 'Piz. Full Vegetariana 8 - T', '0.00', '0.0000', '12.42', '12.20', 0, 0, 0, 54, 63, 67, 21, 49, NULL, NULL, NULL, NULL, NULL),
(3, 'FPSAU9100001', 'FPSAU9100001', 'Brownie', '0.00', '0.0000', '3.30', '2.21', 0, 0, 0, 54, 63, 67, 208, 51, NULL, NULL, NULL, NULL, 3),
(4, 'FPSAU8300004', 'FPSAU8300004', 'Pepsi Cola 16 Oz ', '0.00', '0.0000', '2.65', '2.59', 0, 0, 0, 54, 67, 63, 225, 51, NULL, NULL, NULL, NULL, 4),
(11, 'FPCAU4200001', '250001', 'Tipo Plumita - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 32, 49, NULL, NULL, NULL, NULL, NULL),
(12, 'FPCAU4200002', '250002', 'Tipo Tornillo - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 32, 49, NULL, NULL, NULL, NULL, NULL),
(13, 'FPCAU4200003', '250003', 'Tipo Vermicelli - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 32, 49, NULL, NULL, NULL, NULL, NULL),
(14, 'FPSAU0200001', 'ADP2', 'Adic. Aceite de Oliva 8 - T', '11.00', '0.0000', '4.05', '3.98', 0, 0, 0, 55, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(15, 'FPSAU0200002', 'ADP7', 'Adic. Aceitunas 8 - T', '4.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(16, 'FPSAU0200003', 'ADP4', 'Adic. Anchoas 8 - T', '70.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(17, 'FPSAU0200004', 'ADP1', 'Adic. Cebolla 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(18, 'FPSAU0200005', 'ADP9', 'Adic. Champinones 8 - T', '0.00', '0.0000', '4.05', '2.12', 1, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(19, 'FPSAU0200006', 'ADP6', 'Adic. Jamon de Pierna 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(20, 'FPSAU0200007', 'ADP5', 'Adic. Maiz 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(21, 'FPSAU0200008', 'ADP10', 'Adic. Pepperoni 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(22, 'FPSAU0200009', 'ADP3', 'Adic. Pimenton 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(23, 'FPSAU0200010', 'ADP11', 'Adic. Pollo Guisado 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 1, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(24, 'FPSAU0200011', 'ADP17', 'Adic. Queso Mozzarella 8 - T', '0.00', '0.0000', '2.16', '2.12', 1, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(25, 'FPSAU0200012', 'ADP15', 'Adic. Queso Parmesano 8 - T', '0.00', '0.0000', '2.16', '2.12', 1, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(26, 'FPSAU0200013', 'ADP14', 'Adic. Salchichon 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(27, 'FPSAU0200014', 'ADP8', 'Adic. Tocineta 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 1, 0, 54, 63, 67, 181, 49, NULL, NULL, NULL, NULL, NULL),
(28, 'FPSAU0400001', 'ADP55', 'Adic. Aceite de Oliva Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(29, 'FPSAU0400002', 'ADP64', 'Adic. Aceituna Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(30, 'FPSAU0400003', 'ADP56', 'Adic. Anchoas Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(31, 'FPSAU0400004', 'ADP58', 'Adic. Cebolla Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(32, 'FPSAU0400005', 'ADP59', 'Adic. Champinones Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(33, 'FPSAU0400006', 'ADP60', 'Adic. Jamon de Pierna Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(34, 'FPSAU0400007', 'ADP63', 'Adic. Maiz Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(35, 'FPSAU0400008', 'ADP66', 'Adic. Pepperoni Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(36, 'FPSAU0400009', 'ADP57', 'Adic. Pimenton Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(37, 'FPSAU0400010', 'ADP71', 'Adic. Pollo Guisado Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(38, 'FPSAU0400011', 'ADP65', 'Adic. Queso Mozzarella Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(39, 'FPSAU0400012', 'ADP61', 'Adic. Queso Parmesano Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(40, 'FPSAU0400013', 'ADP72', 'Adic. Salchichon Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(41, 'FPSAU0400014', 'ADP67', 'Adic. Tocineta Gde -T', '0.00', '0.0000', '13.02', '12.79', 0, 0, 0, 54, 63, 67, 8, 49, NULL, NULL, NULL, NULL, NULL),
(42, 'FPSAU0600001', 'ADP37', 'Adic. Aceite de Oliva Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(43, 'FPSAU0600002', 'ADP46', 'Adic. Aceituna Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(44, 'FPSAU0600003', 'ADP38', 'Adic. Anchoas Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(45, 'FPSAU0600004', 'ADP40', 'Adic. Cebolla Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(46, 'FPSAU0600005', 'ADP41', 'Adic. Champinones Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(47, 'FPSAU0600006', 'ADP42', 'Adic. Jamon de Pierna Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(48, 'FPSAU0600007', 'ADP45', 'Adic. Maiz Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(49, 'FPSAU0600008', 'ADP48', 'Adic. Pepperoni Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(50, 'FPSAU0600009', 'ADP39', 'Adic. Pimenton Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(51, 'FPSAU0600010', 'ADP53', 'Adic. Pollo Guisado Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(52, 'FPSAU0600011', 'ADP47', 'Adic. Queso Mozzarella Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(53, 'FPSAU0600012', 'ADP43', 'Adic. Queso Parmesano Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(54, 'FPSAU0600013', 'ADP54', 'Adic. Salchichon Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(55, 'FPSAU0600014', 'ADP49', 'Adic. Tocineta Med -T', '0.00', '0.0000', '10.19', '10.01', 0, 0, 0, 54, 63, 67, 9, 49, NULL, NULL, NULL, NULL, NULL),
(56, 'FPSAU0800001', 'ADP19', 'Adic. Aceite de Oliva Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(57, 'FPSAU0800002', 'ADP28', 'Adic. Aceitunas Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(58, 'FPSAU0800003', 'ADP20', 'Adic. Anchoas Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(59, 'FPSAU0800004', 'ADP22', 'Adic. Cebolla Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(60, 'FPSAU0800005', 'ADP23', 'Adic. Champinones Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(61, 'FPSAU0800006', 'ADP24', 'Adic. Jamon de Pierna Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(62, 'FPSAU0800007', 'ADP27', 'Adic. Maiz Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(63, 'FPSAU0800008', 'ADP30', 'Adic. Pepperoni Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(64, 'FPSAU0800009', 'ADP21', 'Adic. Pimenton Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(65, 'FPSAU0800010', 'ADP35', 'Adic. Pollo Guisado Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(66, 'FPSAU0800011', 'ADP29', 'Adic. Queso Mozzarella Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(67, 'FPSAU0800012', 'ADP25', 'Adic. Queso Parmesano Peq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(68, 'FPSAU0800013', 'ADP36', 'Adic. Salchichon Pq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(69, 'FPSAU0800014', 'ADP31', 'Adic. Tocineta Pq -T', '0.00', '0.0000', '5.66', '5.56', 0, 0, 0, 54, 63, 67, 10, 49, NULL, NULL, NULL, NULL, NULL),
(70, 'FPSAU1300001', 'ENS1', 'Ensa. Cesar - T', '0.00', '0.0000', '3.90', '3.83', 0, 0, 0, 54, 63, 67, 15, 49, NULL, NULL, NULL, NULL, NULL),
(71, 'FPSAU1300002', 'ENS5', 'Ensa. Americana - T', '0.00', '0.0000', '4.02', '3.94', 0, 0, 0, 54, 63, 67, 15, 49, NULL, NULL, NULL, NULL, NULL),
(72, 'FPSAU1300003', 'ENS6', 'Ensa. Cesar Con Pollo - T', '0.00', '0.0000', '4.30', '4.22', 0, 0, 0, 54, 63, 67, 15, 49, NULL, NULL, NULL, NULL, NULL),
(73, 'FPSAU1300004', 'ENS4', 'Ensa. Cobb - T', '0.00', '0.0000', '4.20', '4.13', 0, 0, 0, 54, 63, 67, 15, 49, NULL, NULL, NULL, NULL, NULL),
(74, 'FPSAU1300005', 'ENS11', 'Ensa. Pacifico - T', '0.00', '0.0000', '4.30', '4.22', 0, 0, 0, 54, 63, 67, 15, 49, NULL, NULL, NULL, NULL, NULL),
(75, 'FPSAU1500001', '008', 'Para Llevar Ensalada - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 17, 49, NULL, NULL, NULL, NULL, NULL),
(76, 'FPSAU1500002', '0001', 'Para Llevar Pasta - T', '0.00', '0.0000', '300.00', '294.00', 0, 0, 0, 54, 63, 67, 17, 49, NULL, NULL, NULL, NULL, NULL),
(77, 'FPSAU1500003', '011', 'Para Llevar Pizza 8 - T', '0.00', '0.0000', '650.00', '638.00', 0, 0, 0, 54, 63, 67, 17, 49, NULL, NULL, NULL, NULL, NULL),
(78, 'FPSAU1500004', '005', 'Para Llevar Pizza PQ - T', '0.00', '0.0000', '780.00', '766.00', 0, 0, 0, 54, 63, 67, 17, 49, NULL, NULL, NULL, NULL, NULL),
(79, 'FPSAU1500005', '007', 'Para Llevar Pz. Grd - T', '0.00', '0.0000', '1.70', '1.67', 0, 0, 0, 54, 63, 67, 17, 49, NULL, NULL, NULL, NULL, NULL),
(80, 'FPSAU1500006', '006', 'Para Llevar Pz. Med - T', '0.00', '0.0000', '1.38', '1.36', 0, 0, 0, 54, 63, 67, 17, 49, NULL, NULL, NULL, NULL, NULL),
(81, 'FPSAU1500007', '009', 'Para Llevar Wrap - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 17, 49, NULL, NULL, NULL, NULL, NULL),
(82, 'FPSAU1700001', 'PAS6', 'Pasta Alfredo - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(83, 'FPSAU1700002', 'PAS4', 'Pasta Bolonesa - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(84, 'FPSAU1700003', 'PAS2', 'Pasta Carbonara - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(85, 'FPSAU1700004', 'PAS5', 'Pasta Matriciana - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(86, 'FPSAU1700005', 'PAS1', 'Pasta Napolitana - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(87, 'FPSAU1700006', 'PAS9', 'Pasta Pollo a la Parmesana - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(88, 'FPSAU1700007', 'PAS3', 'Pasta Putanesca - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(89, 'FPSAU1700008', 'PAS7', 'Pasta Vegetales con pollo - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(90, 'FPSAU1700009', 'PAS8', 'Pasticho - T', '0.00', '0.0000', '5.59', '5.49', 0, 0, 0, 54, 63, 67, 18, 49, NULL, NULL, NULL, NULL, NULL),
(91, 'FPSAU1800001', 'DE002', 'Pastelito de Carne - T', '0.00', '0.0000', '700.00', '687.00', 0, 0, 0, 54, 63, 67, 19, 49, NULL, NULL, NULL, NULL, NULL),
(92, 'FPSAU1800002', 'DE003', 'Pastelito de Pollo - T', '0.00', '0.0000', '700.00', '687.00', 0, 0, 0, 54, 63, 67, 19, 49, NULL, NULL, NULL, NULL, NULL),
(93, 'FPSAU1800003', 'DE001', 'Pastelito de Queso - T', '0.00', '0.0000', '700.00', '687.00', 0, 0, 0, 54, 63, 67, 19, 49, NULL, NULL, NULL, NULL, NULL),
(94, 'FPSAU2000001', '160003', 'Piz. Pers. Full Pepperoni 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(95, 'FPSAU2000002', '160005', 'Piz. Pers. Full Tocineta 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(96, 'FPSAU2000003', '160006', 'Piz. Pers. Full Tradicional 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(97, 'FPSAU2000004', '160007', 'Piz. Pers. New York 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(99, 'FPSAU2000006', 'BEB32', 'Bebida Personal 7UP - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(100, 'FPSAU2000007', 'BEB31', 'Bebida Personal Kolita - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(101, 'FPSAU2000008', 'BEB34', 'Bebida Personal Naranja - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(102, 'FPSAU2000009', 'BEB33', 'Bebida Personal Pepsi - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(103, 'FPSAU2000010', 'BEB36', 'Bebida Personal Te Lipton Durazno - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(104, 'FPSAU2000011', 'BEB35', 'Bebida Personal Te Lipton Limon - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 20, 49, NULL, NULL, NULL, NULL, NULL),
(105, 'FPSAU2200001', 'PIZ2', 'Piz. Full Maiz  8 - T', '0.00', '0.0000', '9.09', '8.93', 0, 0, 0, 54, 63, 67, 21, 49, NULL, NULL, NULL, NULL, NULL),
(106, 'FPSAU2200002', 'PIZ5', 'Piz. Full Pepperoni 8 - T', '0.00', '0.0000', '10.79', '10.60', 0, 0, 0, 54, 63, 67, 21, 49, NULL, NULL, NULL, NULL, NULL),
(107, 'FPSAU2200003', 'PIZ6', 'Piz. Full Pollo Guisado 8 - T', '0.00', '0.0000', '11.60', '11.39', 0, 0, 0, 54, 63, 67, 21, 49, NULL, NULL, NULL, NULL, NULL),
(108, 'FPSAU2200004', 'PIZ4', 'Piz. Full Tocineta 8 - T', '0.00', '0.0000', '9.93', '9.75', 0, 0, 0, 54, 63, 67, 21, 49, NULL, NULL, NULL, NULL, NULL),
(110, 'FPSAU2200006', 'PIZ11', 'Piz. Manhattan 8 - T', '0.00', '0.0000', '12.69', '12.46', 0, 0, 0, 54, 63, 67, 21, 49, NULL, NULL, NULL, NULL, NULL),
(111, 'FPSAU2200007', 'PIZ3', 'Piz. New York 8 - T', '0.00', '0.0000', '9.50', '9.33', 0, 0, 0, 54, 63, 67, 21, 49, NULL, NULL, NULL, NULL, NULL),
(112, 'FPSAU2200008', 'PIZ1', 'Piz. Tradicional 8 - T', '0.00', '0.0000', '6.72', '6.60', 0, 0, 0, 54, 63, 67, 21, 49, NULL, NULL, NULL, NULL, NULL),
(113, 'FPSAU2500001', 'PIZ15', 'Piz. Full Maiz Gde - T', '0.00', '0.0000', '28.80', '28.29', 0, 0, 0, 54, 63, 67, 22, 49, NULL, NULL, NULL, NULL, NULL),
(114, 'FPSAU2500002', 'PIZ43', 'Piz. Full Pepperoni Gde - T', '0.00', '0.0000', '34.58', '33.96', 0, 0, 0, 54, 63, 67, 22, 49, NULL, NULL, NULL, NULL, NULL),
(115, 'FPSAU2500003', 'PIZ48', 'Piz. Full Pollo G. Gde - T', '0.00', '0.0000', '35.06', '34.43', 0, 0, 0, 54, 63, 67, 22, 49, NULL, NULL, NULL, NULL, NULL),
(116, 'FPSAU2500004', 'PIZ44', 'Piz. Full Tocineta Gde - T', '0.00', '0.0000', '32.70', '32.12', 0, 0, 0, 54, 63, 67, 22, 49, NULL, NULL, NULL, NULL, NULL),
(117, 'FPSAU2500005', 'PIZ41', 'Piz. Full Vegetariana Gde - T', '0.00', '0.0000', '35.50', '34.87', 0, 0, 0, 54, 63, 67, 22, 49, NULL, NULL, NULL, NULL, NULL),
(118, 'FPSAU2500006', 'PIZ42', 'Piz. New York Gde - T', '0.00', '0.0000', '30.36', '29.82', 0, 0, 0, 54, 63, 67, 22, 49, NULL, NULL, NULL, NULL, NULL),
(119, 'FPSAU2500007', 'PIZ38', 'Piz. Tradicional Gde - T', '0.00', '0.0000', '22.75', '22.34', 0, 0, 0, 54, 63, 67, 22, 49, NULL, NULL, NULL, NULL, NULL),
(120, 'FPSAU2500008', 'PIZ39', 'Piz.Manhatan Gde - T', '0.00', '0.0000', '35.75', '35.11', 0, 0, 0, 54, 63, 67, 22, 49, NULL, NULL, NULL, NULL, NULL),
(121, 'FPSAU2700001', 'PIZ14', 'Piz. Full Maiz Med - T', '0.00', '0.0000', '23.13', '22.72', 0, 0, 0, 54, 63, 67, 23, 49, NULL, NULL, NULL, NULL, NULL),
(122, 'FPSAU2700002', 'PIZ32', 'Piz. Full Pepperoni Med - T', '0.00', '0.0000', '27.72', '27.23', 0, 0, 0, 54, 63, 67, 23, 49, NULL, NULL, NULL, NULL, NULL),
(123, 'FPSAU2700003', 'PIZ37', 'Piz. Full Pollo Guisado Med - T', '0.00', '0.0000', '28.59', '28.08', 0, 0, 0, 54, 63, 67, 23, 49, NULL, NULL, NULL, NULL, NULL),
(124, 'FPSAU2700004', 'PIZ33', 'Piz. Full Tocineta Med - T', '0.00', '0.0000', '26.05', '25.58', 0, 0, 0, 54, 63, 67, 23, 49, NULL, NULL, NULL, NULL, NULL),
(125, 'FPSAU2700005', 'PIZ30', 'Piz. Full Vegetariana Med - T', '0.00', '0.0000', '31.07', '30.52', 0, 0, 0, 54, 63, 67, 23, 49, NULL, NULL, NULL, NULL, NULL),
(126, 'FPSAU2700006', 'PIZ28', 'Piz. Manhathan Med - T', '0.00', '0.0000', '32.49', '31.91', 0, 0, 0, 54, 63, 67, 23, 49, NULL, NULL, NULL, NULL, NULL),
(127, 'FPSAU2700007', 'PIZ31', 'Piz. New York Med - T', '0.00', '0.0000', '24.55', '24.11', 0, 0, 0, 54, 63, 67, 23, 49, NULL, NULL, NULL, NULL, NULL),
(128, 'FPSAU2700008', 'PIZ27', 'Piz. Tradicional Med - T', '0.00', '0.0000', '17.57', '17.26', 0, 0, 0, 54, 63, 67, 23, 49, NULL, NULL, NULL, NULL, NULL),
(129, 'FPSAU3000001', 'PIZ13', 'Piz. Full Maiz Peq - T', '0.00', '0.0000', '11.87', '11.66', 0, 0, 0, 54, 63, 67, 24, 49, NULL, NULL, NULL, NULL, NULL),
(130, 'FPSAU3000002', 'PIZ21', 'Piz. Full Pepperoni Peq - T', '0.00', '0.0000', '14.16', '13.91', 0, 0, 0, 54, 63, 67, 24, 49, NULL, NULL, NULL, NULL, NULL),
(131, 'FPSAU3000003', 'PIZ26', 'Piz. Full Pollo Guisado Peq - T', '0.00', '0.0000', '15.35', '7994.64', 0, 0, 0, 54, 63, 67, 24, 49, NULL, NULL, NULL, NULL, NULL),
(132, 'FPSAU3000004', 'PIZ22', 'Piz. Full Tocineta Peq - T', '0.00', '0.0000', '13.10', '12.87', 0, 0, 0, 54, 63, 67, 24, 49, NULL, NULL, NULL, NULL, NULL),
(133, 'FPSAU3000005', 'PIZ19', 'Piz. Full Vegetariana Pq - T', '0.00', '0.0000', '16.65', '16.35', 0, 0, 0, 54, 63, 67, 24, 49, NULL, NULL, NULL, NULL, NULL),
(134, 'FPSAU3000006', 'PIZ17', 'Piz. Manhattan Peq - T', '0.00', '0.0000', '16.97', '16.67', 0, 0, 0, 54, 63, 67, 24, 49, NULL, NULL, NULL, NULL, NULL),
(135, 'FPSAU3000007', 'PIZ20', 'Piz. New York Peq - T', '0.00', '0.0000', '12.79', '12.56', 0, 0, 0, 54, 63, 67, 24, 49, NULL, NULL, NULL, NULL, NULL),
(136, 'FPSAU3000008', 'PIZ16', 'Piz. Tradicional Peq - T', '0.00', '0.0000', '8.64', '8.49', 0, 0, 0, 54, 63, 67, 24, 49, NULL, NULL, NULL, NULL, NULL),
(137, 'FPSAU3100001', 'POS4', 'Quesillo - T', '0.00', '0.0000', '1.50', '1473.21', 0, 0, 0, 54, 63, 67, 25, 49, NULL, NULL, NULL, NULL, NULL),
(138, 'FPSAU3100002', 'POS7', 'Quesillo de chocolate - T', '0.00', '0.0000', '1.50', '1473.21', 0, 0, 0, 54, 63, 67, 25, 49, NULL, NULL, NULL, NULL, NULL),
(139, 'FPSAU3100003', 'POS6', 'Quesillo de coco - T', '500.00', '0.0000', '1.52', '1.48', 0, 0, 0, 54, 63, 67, 25, 49, NULL, NULL, NULL, NULL, NULL),
(140, 'FPSAU3100004', 'FPSAU3100004', 'Brownie - T', '0.00', '0.0000', '2.25', '1.97', 0, 0, 0, 54, 63, 67, 25, 49, NULL, NULL, NULL, NULL, NULL),
(141, 'FPSAU3100005', 'FPSAU3100005', 'Mini-Brownie - T', '0.00', '0.0000', '1.35', '1.18', 0, 0, 0, 54, 63, 67, 25, 49, NULL, NULL, NULL, NULL, NULL),
(142, 'FPSAU3100006', 'FPSAU3100006', 'Gelatina - T', '0.00', '0.0000', '1.05', '920.00', 0, 0, 0, 54, 63, 67, 25, 49, NULL, NULL, NULL, NULL, NULL),
(143, 'FPSAU3500001', 'SAP7', '-Aceituna 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(144, 'FPSAU3500002', 'SAP2', '-Cebolla 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(145, 'FPSAU3500003', 'SAP3', '-Champinon 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(146, 'FPSAU3500004', 'SAP4', '-Jamon de Pierna 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(147, 'FPSAU3500005', 'SAP6', '-Maiz 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(148, 'FPSAU3500006', 'SAP8', '-Mozzarella 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(149, 'FPSAU3500007', 'SAP15', '-Oregano 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(150, 'FPSAU3500008', 'SAP9', '-Peperoni 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(151, 'FPSAU3500009', 'SAP1', '-Pimenton 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(152, 'FPSAU3500010', 'SAP14', '-Pollo Guisado 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(153, 'FPSAU3500011', 'SAP16', '-Salsa 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(154, 'FPSAU3500012', 'SAP10', '-Tocineta 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(155, 'FPSAU3500013', 'FPSAU35000', '-Parmesano 8 - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 28, 49, NULL, NULL, NULL, NULL, NULL),
(156, 'FPSAU3700001', 'SAP58', '-Aceituna Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(157, 'FPSAU3700002', 'SAP52', '-Cebolla Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(158, 'FPSAU3700003', 'SAP53', '-Champinon Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(159, 'FPSAU3700004', 'SAP54', '-J.Pierna Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(160, 'FPSAU3700005', 'SAP57', '-Maiz Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(161, 'FPSAU3700006', 'SAP59', '-Mozzarella Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(162, 'FPSAU3700007', 'SAP35', '-Oregano Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(163, 'FPSAU3700008', 'SAP55', '-Parmesano Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(164, 'FPSAU3700009', 'SAP60', '-Peperoni Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(165, 'FPSAU3700010', 'SAP51', '-Pimenton Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(166, 'FPSAU3700011', 'SAP65', '-Pollo Guisado Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(167, 'FPSAU3700012', 'SAP36', '-Salsa Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(168, 'FPSAU3700013', 'SAP61', '-Tocineta Gde - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 29, 49, NULL, NULL, NULL, NULL, NULL),
(169, 'FPSAU3900001', 'SAP43', '-Aceituna Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(170, 'FPSAU3900002', 'SAP38', '-Cebolla Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(171, 'FPSAU3900003', 'SAP39', '-Champinon Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(172, 'FPSAU3900004', 'SAP40', '-J.Pierna Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(173, 'FPSAU3900005', 'SAP42', '-Maiz Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(174, 'FPSAU3900006', 'SAP44', '-Mozzarella Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(175, 'FPSAU3900007', 'SAP33', '-Oregano Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(176, 'FPSAU3900008', 'SAP45', '-Peperoni Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(177, 'FPSAU3900009', 'SAP37', '-Pimenton Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(178, 'FPSAU3900010', 'SAP50', '-Pollo G. Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(179, 'FPSAU3900011', 'SAP34', '-Salsa Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(180, 'FPSAU3900012', 'SAP46', '-Tocineta Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(181, 'FPSAU3900013', 'FPSAU3900013', '-Parmesano Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 30, 49, NULL, NULL, NULL, NULL, NULL),
(182, 'FPSAU4100001', 'SAP23', '-Aceituna Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(183, 'FPSAU4100002', 'SAP18', '-Cebolla Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(184, 'FPSAU4100003', 'SAP19', '-Champinon Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(185, 'FPSAU4100004', 'SAP20', '-Jamon de Pierna Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(186, 'FPSAU4100005', 'SAP22', '-Maiz Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(187, 'FPSAU4100006', 'SAP24', '-Mozzarella Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(188, 'FPSAU4100007', 'SAP31', '-Oregano Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(189, 'FPSAU4100008', 'SAP25', '-Peperoni Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(190, 'FPSAU4100009', 'SAP17', '-Pimenton Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(191, 'FPSAU4100010', 'SAP30', '-Pollo Guisado Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(192, 'FPSAU4100011', 'SAP32', '-Salsa Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(193, 'FPSAU4100012', 'SAP26', '-Tocineta Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(194, 'FPSAU4100013', 'FPSAU4100013', '-Parmesano Peq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 31, 49, NULL, NULL, NULL, NULL, NULL),
(195, 'FPSAU4300001', 'W001', 'Wrap Cesar con Pollo - T', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 36, 49, NULL, NULL, NULL, NULL, NULL),
(196, 'FPSAU4300002', 'W002', 'Wrap Club House - T', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 36, 49, NULL, NULL, NULL, NULL, NULL),
(197, 'FPSAU4300003', 'W005', 'Wrap Ligero - T', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 36, 49, NULL, NULL, NULL, NULL, NULL),
(198, 'FPSBU0900001', 'BEB16', '7 UP 32oz Gde - T', '1.00', '0.0000', '1.34', '1.32', 0, 0, 0, 54, 63, 67, 11, 49, NULL, NULL, NULL, NULL, NULL),
(199, 'FPSBU0900002', 'BEB17', 'Kolita 32oz Gde - T', '0.00', '0.0000', '1.34', '1.32', 0, 0, 0, 54, 63, 67, 11, 49, NULL, NULL, NULL, NULL, NULL),
(200, 'FPSBU0900003', 'BEB18', 'Naranja 32oz Gde - T', '0.00', '0.0000', '1.34', '1.32', 0, 0, 0, 54, 63, 67, 11, 49, NULL, NULL, NULL, NULL, NULL),
(201, 'FPSBU0900004', 'BEB15', 'Pepsi Cola 32oz Gde - T', '0.00', '0.0000', '1.34', '1.32', 0, 0, 0, 54, 63, 67, 11, 49, NULL, NULL, NULL, NULL, NULL),
(202, 'FPSBU0900005', '003', 'Poco/Hielo - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 11, 49, NULL, NULL, NULL, NULL, NULL),
(203, 'FPSBU0900006', '002', 'Sin/Hielo - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 11, 49, NULL, NULL, NULL, NULL, NULL),
(204, 'FPSBU0900007', 'BEB20', 'Te Lipton Durazno Gde - T', '0.00', '0.0000', '1.34', '1.32', 0, 0, 0, 54, 63, 67, 11, 49, NULL, NULL, NULL, NULL, NULL),
(205, 'FPSBU0900008', 'BEB19', 'Te Lipton Limon Gde - T', '0.00', '0.0000', '1.34', '1.32', 0, 0, 0, 54, 63, 67, 11, 49, NULL, NULL, NULL, NULL, NULL),
(206, 'FPSBU1000001', 'BEB10', '7 UP Med - T', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 63, 67, 12, 49, NULL, NULL, NULL, NULL, NULL),
(207, 'FPSBU1000002', 'BEB11', 'Kolita Med - T', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 63, 67, 12, 49, NULL, NULL, NULL, NULL, NULL),
(208, 'FPSBU1000003', 'BEB12', 'Naranja Med - T', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 63, 67, 12, 49, NULL, NULL, NULL, NULL, NULL),
(209, 'FPSBU1000004', 'BEB9', 'Pepsi Cola Med - T', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 63, 67, 12, 49, NULL, NULL, NULL, NULL, NULL),
(210, 'FPSBU1000005', 'BEB14', 'Te Lipton Durazno Med - T', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 63, 67, 12, 49, NULL, NULL, NULL, NULL, NULL),
(211, 'FPSBU1000006', 'BEB13', 'Te Lipton Limon Med - T', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 63, 67, 12, 49, NULL, NULL, NULL, NULL, NULL),
(212, 'FPSBU1000007', 'FPSBU1000007', 'Poco/Hielo Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 12, 49, NULL, NULL, NULL, NULL, NULL),
(213, 'FPSBU1000008', 'FPSBU1000008', 'Sin/Hielo Med - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 12, 49, NULL, NULL, NULL, NULL, NULL),
(214, 'FPSBU1100001', 'BEB3', '7 Up Pq - T', '0.00', '0.0000', '2.64', '2.59', 0, 0, 0, 54, 63, 67, 13, 49, NULL, NULL, NULL, NULL, NULL),
(215, 'FPSBU1100002', 'BEB4', 'Kolita Pq - T', '0.00', '0.0000', '2.64', '2.59', 0, 0, 0, 54, 63, 67, 13, 49, NULL, NULL, NULL, NULL, NULL),
(216, 'FPSBU1100003', 'BEB5', 'Naranja Pq - T', '0.00', '0.0000', '2.64', '2.59', 0, 0, 0, 54, 63, 67, 13, 49, NULL, NULL, NULL, NULL, NULL),
(217, 'FPSBU1100004', 'BEB1', 'Pepsi Cola Pq - T', '0.00', '0.0000', '2.64', '2.59', 0, 0, 0, 54, 63, 67, 13, 49, NULL, NULL, NULL, NULL, NULL),
(218, 'FPSBU1100005', 'BEB7', 'Te Lipton Durazno Pq - T', '0.00', '0.0000', '2.64', '2.59', 0, 0, 0, 54, 63, 67, 13, 49, NULL, NULL, NULL, NULL, NULL),
(219, 'FPSBU1100006', 'BEB6', 'Te Lipton Limon Pq - T', '0.00', '0.0000', '2.64', '2.59', 0, 0, 0, 54, 63, 67, 13, 49, NULL, NULL, NULL, NULL, NULL),
(220, 'FPSBU1100007', 'FPSBU1100007', 'Poco/Hielo Pq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 13, 49, NULL, NULL, NULL, NULL, NULL),
(221, 'FPSBU1100008', 'FPSBU1100008', 'Sin/Hielo Pq - T', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 13, 49, NULL, NULL, NULL, NULL, NULL),
(222, 'FPSBU1200001', '120001', 'Cafe Gde - T', '400.00', '0.0000', '1.07', '1.05', 1, 0, 0, 54, 63, 67, 14, 49, NULL, NULL, NULL, NULL, NULL),
(223, 'FPSBU1200002', '240002', 'Cafe Peq - T', '1.79', '0.0000', '720.00', '707.00', 0, 0, 0, 54, 63, 67, 14, 49, NULL, NULL, NULL, NULL, NULL),
(224, 'FPSBU1400001', 'BEB39', 'Yukery Durazno - T', '0.00', '0.0000', '700.00', '687.00', 0, 0, 0, 54, 63, 67, 16, 49, NULL, NULL, NULL, NULL, NULL),
(225, 'FPSBU1400002', 'BEB40', 'Yukery Mango - T', '0.00', '0.0000', '700.00', '687.00', 0, 0, 0, 54, 63, 67, 16, 49, NULL, NULL, NULL, NULL, NULL),
(226, 'FPSBU1400003', 'BEB37', 'Yukery Manzana - T', '0.00', '0.0000', '700.00', '687.00', 0, 0, 0, 54, 63, 67, 16, 49, NULL, NULL, NULL, NULL, NULL),
(227, 'FPSBU1400004', 'BEB38', 'Yukery Pera - T', '0.00', '0.0000', '700.00', '687.00', 0, 0, 0, 54, 63, 67, 16, 49, NULL, NULL, NULL, NULL, NULL),
(228, 'FPSBU3200001', 'BEB30', '7up bomba 600ml - T', '0.00', '0.0000', '910.00', '893.75', 0, 0, 0, 54, 63, 67, 26, 49, NULL, NULL, NULL, NULL, NULL),
(229, 'FPSBU3200002', 'BEB28', 'Kolita Bomba 600ml - T', '0.00', '0.0000', '910.00', '893.75', 0, 0, 0, 54, 63, 67, 26, 49, NULL, NULL, NULL, NULL, NULL),
(230, 'FPSBU3200003', 'BEB29', 'Naranja Bomba 600ml - T', '0.00', '0.0000', '910.00', '893.75', 0, 0, 0, 54, 63, 67, 26, 49, NULL, NULL, NULL, NULL, NULL),
(231, 'FPSBU3200004', 'BEB27', 'Pepsi Bomba 600ml - T', '0.00', '0.0000', '910.00', '893.75', 0, 0, 0, 54, 63, 67, 26, 49, NULL, NULL, NULL, NULL, NULL),
(232, 'FPSBU3300001', 'BEB24', '7 Up Ligth Lata - T', '0.00', '0.0000', '4.80', '4.71', 0, 0, 0, 54, 63, 67, 27, 49, NULL, NULL, NULL, NULL, NULL),
(233, 'FPSBU3300002', 'BEB26', 'Agua 600 ml - T', '0.00', '0.0000', '1.00', '1.00', 0, 0, 0, 54, 63, 67, 27, 49, NULL, NULL, NULL, NULL, NULL),
(234, 'FPSBU3300003', 'BEB21', 'Agua Mineral - T', '0.00', '0.0000', '1.00', '1.00', 0, 0, 0, 54, 63, 67, 27, 49, NULL, NULL, NULL, NULL, NULL),
(235, 'FPSBU3300004', 'BEB23', 'Pepsi Ligth Lata - T', '0.00', '0.0000', '4.80', '4.71', 0, 0, 0, 54, 63, 67, 27, 49, NULL, NULL, NULL, NULL, NULL),
(236, 'OHSAU0500001', '120002', 'CHOCOLATE DE FUENTE', '901.00', '0.0000', '1.55', '1.45', 1, 0, 0, 54, 63, 67, 98, 83, NULL, NULL, NULL, NULL, NULL),
(237, 'OHSAU0500002', '120001', 'FRESAS CON CREMA', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 98, 83, NULL, NULL, NULL, NULL, NULL),
(238, 'OHSAU0500003', '120004', 'FRUTAS PARA FUENTE', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 98, 83, NULL, NULL, NULL, NULL, NULL),
(239, 'OHSAU0500004', '120003', 'MED WAFFLES', '15.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 98, 83, NULL, NULL, NULL, NULL, NULL),
(240, 'OHSAU0600001', '070001', 'EXTRA. CREMA CHANTILLY', '6.50', '0.0000', '800.00', '814.00', 0, 0, 0, 54, 63, 67, 99, 83, NULL, NULL, NULL, NULL, NULL),
(241, 'OHSAU0600002', '070003', 'EXTRA. DULCE DE LECHE', '2.10', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 99, 83, NULL, NULL, NULL, NULL, NULL),
(242, 'OHSAU0600003', '070005', 'EXTRA. EDULCORANTE', '0.03', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 99, 83, NULL, NULL, NULL, NULL, NULL),
(243, 'OHSAU0600004', '070012', 'EXTRA. SIROPE DE CHOCOLATE', '4.41', '0.0000', '600.00', '594.00', 0, 0, 0, 54, 63, 67, 99, 83, NULL, NULL, NULL, NULL, NULL),
(244, 'OHSAU0800001', '010021', 'CARACOLA DE PASAS', '11.24', '0.0000', '4800.00', '4730.00', 0, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(245, 'OHSAU0800002', '010004', 'GALLETERIA POR KILO DESDE 100 gr', '0.01', '0.0000', '48.00', '46.20', 0, 0, 0, 54, 63, 68, 100, 83, NULL, NULL, NULL, NULL, NULL),
(246, 'OHSAU0800003', '010026', 'MINI BROWNIE', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(247, 'OHSAU0800004', '010023', 'MUFFIN MARMOLEADO', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(248, 'OHSAU0800005', '010024', 'MUFFINS DE CAMBUR Y NUECES', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(249, 'OHSAU0800006', '010007', 'MUFFINS DE CHOCOLATE', '9.59', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(250, 'OHSAU0800007', '010012', 'MUFFINS DE VAINILLA CON CHISPAS DE CHOCOLATE ', '9.59', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(251, 'OHSAU0800008', '010013', 'MUFFINS DE ZANAHORIA POR UNIDAD', '9.59', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(252, 'OHSAU0800009', '010022', 'PASTEL DE CHOCOLATE', '10.24', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(253, 'OHSAU0800010', '010025', 'QUESILLO TRADICIONAL', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(254, 'OHSAU0800011', '010030', 'TORTA DE AREQUIPE', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(255, 'OHSAU0800012', '010029', 'TORTA DE CHOCOLATE', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(256, 'OHSAU0800013', '010028', 'TORTA MARMOLEADA', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(257, 'OHSAU0800014', 'OHSAU0800014', 'MUFFIN', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(258, 'OHSAU0800015', 'OHSAU0800015', 'TORTA', '0.00', '0.0000', '5800.00', '5720.00', 0, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(259, 'OHSAU0800016', 'OHSAU0800016', 'MINIMUFFIN', '0.00', '0.0000', '2000.00', '1980.00', 0, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(260, 'OHSAU0800017', 'OHSAU0800017', 'BROWNIE', '0.00', '0.0000', '3100.00', '3080.00', 0, 0, 0, 54, 63, 67, 100, 83, NULL, NULL, NULL, NULL, NULL),
(261, 'OHSAU0900001', '020009', 'CACHITO DE JAMON', '0.00', '0.0000', '1600.00', '1571.42', 1, 0, 0, 54, 63, 67, 101, 83, NULL, NULL, NULL, NULL, NULL),
(262, 'OHSAU0900002', '020001', 'EMPANADA HORNEADA DE CARNE MOLIDA', '10.24', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 101, 83, NULL, NULL, NULL, NULL, NULL),
(263, 'OHSAU0900003', '020008', 'EMPANADA HORNEADA DE JAMON Y QUESO CREMA', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 101, 83, NULL, NULL, NULL, NULL, NULL),
(264, 'OHSAU0900004', '020002', 'EMPANADA HORNEADA DE POLLO', '10.24', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 101, 83, NULL, NULL, NULL, NULL, NULL),
(265, 'OHSAU0900005', '020007', 'EMPANADA HORNEADA DE QUESO', '10.24', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 101, 83, NULL, NULL, NULL, NULL, NULL),
(266, 'OHSAU0900006', '020006', 'EMPANADA HORNEADA RICOTTA CON ESPINACA', '10.24', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 101, 83, NULL, NULL, NULL, NULL, NULL),
(267, 'OHSAU0900007', 'OHSAU0900007', 'EMPANADA HORNEADA', '0.00', '0.0000', '2000.00', '1980.00', 0, 0, 0, 54, 63, 67, 101, 83, NULL, NULL, NULL, NULL, NULL),
(268, 'OHSAU0900008', 'OHSAU0900008', 'PASTEL DE HOJALDRE', '0.00', '0.0000', '2250.00', '2200.00', 0, 0, 0, 54, 63, 67, 101, 83, NULL, NULL, NULL, NULL, NULL),
(269, 'OHSAU1000001', '040009', 'NOCCIOLA CON DURAZNO-FRESA', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 102, 83, NULL, NULL, NULL, NULL, NULL),
(270, 'OHSAU1000002', '040008', 'NOCCIOLA CON FRUTAS', '19.39', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 102, 83, NULL, NULL, NULL, NULL, NULL),
(271, 'OHSAU1000003', '040007', 'NOCCIOLA MELOCOTON', '18.54', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 102, 83, NULL, NULL, NULL, NULL, NULL),
(272, 'OHSAU1000004', '040001', 'WAFFLE AZUCAR ', '8.89', '0.0000', '2650.00', '2640.00', 0, 0, 0, 54, 63, 67, 102, 83, NULL, NULL, NULL, NULL, NULL),
(273, 'OHSAU1000005', '040003', 'WAFFLE DULCE DE LECHE', '10.99', '0.0000', '4250.00', '4180.00', 0, 0, 0, 54, 63, 67, 102, 83, NULL, NULL, NULL, NULL, NULL),
(274, 'OHSAU1000006', '040004', 'WAFFLE KIKILALA', '12.46', '0.0000', '4450.00', '4400.00', 0, 0, 0, 54, 63, 67, 102, 83, NULL, NULL, NULL, NULL, NULL),
(275, 'OHSAU1000007', '040005', 'WAFFLE NOCCIOLA ', '18.54', '0.0000', '4900.00', '4840.00', 0, 0, 0, 54, 63, 67, 102, 83, NULL, NULL, NULL, NULL, NULL),
(276, 'OHSAU1000008', '040006', 'WAFFLE NOCCIOLA BANANA', '14.98', '0.0000', '5150.00', '5060.00', 0, 0, 0, 54, 63, 67, 102, 83, NULL, NULL, NULL, NULL, NULL),
(277, 'OHSBU0100001', '050001', 'ARTICO ', '14.21', '0.0000', '5050.00', '4950.00', 0, 0, 0, 54, 63, 67, 89, 83, NULL, NULL, NULL, NULL, NULL),
(278, 'OHSBU0100002', '050003', 'CARAMELARTICO', '15.83', '0.0000', '5800.00', '5720.00', 0, 0, 0, 54, 63, 67, 89, 83, NULL, NULL, NULL, NULL, NULL),
(279, 'OHSBU0100003', '050004', 'COOKIEARTICO', '23.00', '0.0000', '7250.00', '7150.00', 0, 0, 0, 54, 63, 67, 89, 83, NULL, NULL, NULL, NULL, NULL),
(280, 'OHSBU0100004', '050005', 'MOCARTICO', '18.63', '0.0000', '6250.00', '6160.00', 0, 0, 0, 54, 63, 67, 89, 83, NULL, NULL, NULL, NULL, NULL),
(281, 'OHSBU0100005', 'OHSBU0100005', 'MINIARTICO ', '0.00', '0.0000', '1900.00', '1870.00', 1, 0, 0, 54, 63, 67, 89, 83, NULL, NULL, NULL, NULL, NULL),
(282, 'OHSBU0100006', 'OHSBU0100006', 'MINICARAMELARTICO', '0.00', '0.0000', '2350.00', '2310.00', 1, 0, 0, 54, 63, 67, 89, 83, NULL, NULL, NULL, NULL, NULL),
(283, 'OHSBU0100007', 'OHSBU0100007', 'MINICOOKIEARTICO', '0.00', '0.0000', '2550.00', '2530.00', 1, 0, 0, 54, 63, 67, 89, 83, NULL, NULL, NULL, NULL, NULL),
(284, 'OHSBU0100008', 'OHSBU0100008', 'MINIMOCARTICO', '0.00', '0.0000', '2250.00', '2200.00', 1, 0, 0, 54, 63, 67, 89, 83, NULL, NULL, NULL, NULL, NULL),
(285, 'OHSBU0200001', '060001', 'AGUA MINERAL NEVADA (355 ML)', '3.47', '0.0000', '201.60', '200.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(286, 'OHSBU0200002', '060002', 'AGUA MINERAL NEVADA (600 ML)', '11.20', '0.0000', '280.00', '250.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(287, 'OHSBU0200003', '060004', 'CHINOTTO (GDE)', '5.86', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(288, 'OHSBU0200004', '060005', 'CHINOTTO (MED)', '4.47', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(289, 'OHSBU0200005', '060006', 'COCA COLA (GDE)', '5.07', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(290, 'OHSBU0200006', '060007', 'COCA COLA (MED)', '3.84', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(292, 'OHSBU0200007', '060008', 'COCA COLA LIGHT (GDE)', '5.07', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(293, 'OHSBU0200008', '060009', 'COCA COLA LIGHT (MED)', '3.84', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(294, 'OHSBU0200009', '060010', 'FRESCOLITA (GDE)', '5.87', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(295, 'OHSBU0200010', '060011', 'FRESCOLITA (MED)', '4.47', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(296, 'OHSBU0200011', '060015', 'FUZE TEA DURAZNO (GDE)', '4.42', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(297, 'OHSBU0200012', '060014', 'FUZE TEA DURAZNO (MED)', '4.23', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(298, 'OHSBU0200013', '060013', 'FUZE TEA LIMON (GDE)', '4.42', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(299, 'OHSBU0200014', '060012', 'FUZE TEA LIMON (MED)', '4.23', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(300, 'OHSBU0200015', '060016', 'HIT (GDE)', '5.87', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(301, 'OHSBU0200016', '060017', 'HIT (MED)', '4.47', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(302, 'OHSBU0200017', '060022', 'NESTEA (GDE)', '0.00', '0.0000', '3900.00', '3520.00', 0, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(303, 'OHSBU0200018', '060023', 'NESTEA (MED)', '0.00', '0.0000', '3350.00', '3300.00', 0, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(304, 'OHSBU0200019', 'OHSBU0200019', 'REFRESCO (GDE)', '0.00', '0.0000', '3600.00', '3520.00', 0, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(305, 'OHSBU0200020', 'OHSBU0200020', 'REFRESCO (MED)', '0.00', '0.0000', '2950.00', '2915.00', 0, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(306, 'OHSBU0200021', 'OHSBU0200021', 'FUZE TEA (GDE)', '0.00', '0.0000', '3600.00', '3520.00', 0, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(307, 'OHSBU0200022', 'OHSBU0200022', 'FUZE TEA (MED)', '0.00', '0.0000', '3350.00', '3300.00', 0, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(308, 'OHSBU0200023', 'OHSBU0200023', 'JUGO NARANJA (MED)', '0.00', '0.0000', '1350.00', '1320.00', 0, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(309, 'OHSBU0200024', 'OHSBU0200024', 'JUGO NARANJA (GDE)', '0.00', '0.0000', '1700.00', '1650.00', 0, 0, 0, 54, 63, 67, 91, 83, NULL, NULL, NULL, NULL, NULL),
(310, 'OHSBU0300001', '100003', 'BEBIDA PERSONAL CHINOTO', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 93, 83, NULL, NULL, NULL, NULL, NULL),
(311, 'OHSBU0300002', '100004', 'BEBIDA PERSONAL COCA COLA', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 93, 83, NULL, NULL, NULL, NULL, NULL),
(312, 'OHSBU0300003', '100001', 'BEBIDA PERSONAL FRESCOLITA', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 93, 83, NULL, NULL, NULL, NULL, NULL),
(313, 'OHSBU0300004', '100006', 'BEBIDA PERSONAL FUZE TE DURAZNO', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 93, 83, NULL, NULL, NULL, NULL, NULL),
(314, 'OHSBU0300005', '100002', 'BEBIDA PERSONAL FUZE TE LIMON', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 93, 83, NULL, NULL, NULL, NULL, NULL),
(315, 'OHSBU0300006', '100005', 'BEBIDA PERSONAL HIT', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 93, 83, NULL, NULL, NULL, NULL, NULL),
(316, 'OHSBU0300007', 'OHSBU0300007', 'BEBIDA PERSONAL 16 OZ', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 93, 83, NULL, NULL, NULL, NULL, NULL),
(317, 'OHSBU0400001', '030001', 'CAPPUCINO AMERICANO ( GDE)', '4.74', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(318, 'OHSBU0400002', '030017', 'CAPPUCINO ITALIANO ( GDE)', '0.00', '0.0000', '2800.00', '2750.00', 0, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(319, 'OHSBU0400003', '030016', 'EXPRESO (GDE)', '2.92', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(320, 'OHSBU0400004', '030004', 'EXPRESO (PEQ)', '2.92', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(321, 'OHSBU0400005', '030006', 'GUAYOYO (GDE)', '2.82', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(322, 'OHSBU0400006', '030005', 'GUAYOYO (PEQ)', '1.92', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(323, 'OHSBU0400007', '030007', 'LATTE (GDE)', '2.31', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(324, 'OHSBU0400008', '030008', 'LATTE (PEQ)', '1.57', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(325, 'OHSBU0400009', '030010', 'MOCACCINO AMERICANO (GDE)', '8.36', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(326, 'OHSBU0400010', '030012', 'MOCACCINO ITALIANO (GDE)', '6.12', '0.0000', '3350.00', '3300.00', 0, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(327, 'OHSBU0400011', 'OHSBU0400011', 'CAFE GR', '0.00', '0.0000', '2450.00', '2420.00', 0, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(328, 'OHSBU0400012', 'OHSBU0400012', 'CAFE PQ', '0.00', '0.0000', '2120.00', '2090.00', 0, 0, 0, 54, 63, 67, 95, 83, NULL, NULL, NULL, NULL, NULL),
(329, 'OHSBU0700001', '090017', 'INFUSION DE MANZANILLA', '0.00', '0.0000', '1700.00', '1650.00', 0, 0, 0, 54, 63, 67, 103, 83, NULL, NULL, NULL, NULL, NULL),
(330, 'OHSBU0700002', '090015', 'INFUSION DE TE NEGRO', '0.00', '0.0000', '1700.00', '1650.00', 0, 0, 0, 54, 63, 67, 103, 83, NULL, NULL, NULL, NULL, NULL),
(331, 'OHSBU0700003', '090016', 'INFUSION DE TE VERDE', '0.00', '0.0000', '1700.00', '1650.00', 0, 0, 0, 54, 63, 67, 103, 83, NULL, NULL, NULL, NULL, NULL),
(332, 'OHSBU0700004', '090018', 'INFUSION DE TILO', '0.00', '0.0000', '1700.00', '1650.00', 0, 0, 0, 54, 63, 67, 103, 83, NULL, NULL, NULL, NULL, NULL),
(333, 'OHSBU0700005', '090006', 'INFUSION FLOR DE JAMAICA', '19.92', '0.0000', '1700.00', '1650.00', 0, 0, 0, 54, 63, 67, 103, 83, NULL, NULL, NULL, NULL, NULL),
(335, 'PLSAU0500001', 'PLK06002', 'Refresco Personal - A', '6.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 107, 84, NULL, NULL, NULL, NULL, NULL),
(336, 'PLSAU0500002', 'PLK06001', 'Slice 16 - A Personal', '8.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 107, 84, NULL, NULL, NULL, NULL, NULL),
(337, 'PLSAU0600001', 'PLK08001', 'Para Llevar Pizza 16 - A', '11.42', '0.0000', '45.00', '43.79', 0, 0, 0, 54, 63, 67, 108, 84, NULL, NULL, NULL, NULL, NULL),
(338, 'PLSAU0700001', 'PLK04006', 'Pastel de Carne - A', '9.00', '0.0000', '11.50', '11.19', 1, 0, 0, 54, 63, 67, 86, 84, NULL, NULL, NULL, NULL, NULL),
(339, 'PLSAU0700002', 'PLK04007', 'Pastel de Pollo - A', '9.00', '0.0000', '12.00', '11.68', 1, 0, 0, 54, 63, 67, 86, 84, NULL, NULL, NULL, NULL, NULL),
(340, 'PLSAU0700003', 'PLK04005', 'Pastel de Queso - A', '9.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 86, 84, NULL, NULL, NULL, NULL, NULL),
(341, 'PLSAU0800001', 'PLK02001', 'Pizza 1 - A', '48.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 88, 84, NULL, NULL, NULL, NULL, NULL),
(342, 'PLSAU0800002', 'PLK02002', 'Pizza 2 - A', '52.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 88, 84, NULL, NULL, NULL, NULL, NULL),
(343, 'PLSAU0800003', 'PLK02003', 'Pizza 3 - A', '52.00', '0.0000', '175.00', '170.31', 1, 0, 0, 54, 63, 67, 88, 84, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `receta_id`) VALUES
(344, 'PLSAU0800004', 'PLK02004', 'Pizza 4 - A', '59.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 88, 84, NULL, NULL, NULL, NULL, NULL),
(345, 'PLSAU0800005', 'PLK02005', 'Pizza 5 - A', '54.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 88, 84, NULL, NULL, NULL, NULL, NULL),
(346, 'PLSAU0800006', 'PLK02006', 'Pizza 6 - A', '55.00', '0.0000', '27.00', '26.52', 1, 0, 0, 54, 63, 67, 88, 84, NULL, NULL, NULL, NULL, NULL),
(347, 'PLSAU0800007', 'PLK02007', 'Pizza 7 - A', '55.00', '0.0000', '27.00', '26.52', 1, 0, 0, 54, 63, 67, 88, 84, NULL, NULL, NULL, NULL, NULL),
(348, 'PLSAU0900001', 'PLSAU0900001', 'Slice 16 - A', '8.00', '0.0000', '33.90', '32.99', 0, 0, 0, 54, 63, 67, 90, 84, NULL, NULL, NULL, NULL, NULL),
(349, 'PLSAU0900002', 'PLSAU0900002', 'Pizzas Cuadradas - A', '0.00', '0.0000', '3.30', '3.21', 1, 0, 0, 54, 63, 67, 90, 84, NULL, NULL, NULL, NULL, NULL),
(350, 'PLSAU2000001', 'PLSAU2000001', 'Mini-Brownie - A', '0.00', '0.0000', '1.90', '1.28', 1, 0, 0, 54, 63, 67, 92, 84, NULL, NULL, NULL, NULL, NULL),
(351, 'PLSBU0200001', 'PLK03001', 'Agua Mineral 300Ml - A', '3.00', '0.0000', '200.00', '196.00', 1, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(352, 'PLSBU0200002', 'PLK03005', 'Agua Mineral 600Ml - A', '0.00', '0.0000', '350.00', '343.00', 1, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(353, 'PLSBU0200003', 'PLK03002', 'Malta - A', '7.00', '0.0000', '5.00', '4.87', 0, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(354, 'PLSBU0200004', 'PLK03003', 'Refresco - A', '6.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(355, 'PLSBU0200005', 'PLK03004', 'Te 12 Oz - A', '3.00', '0.0000', '2.50', '2.46', 1, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(356, 'PLSBU0200006', 'PLSBU0200006', 'Refresco 1,5 Lt - A', '0.00', '0.0000', '1.63', '1.60', 1, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(357, 'PLSBU0200007', 'PLSBU0200007', 'Jugo de Naranja - A', '0.00', '0.0000', '1.30', '1.23', 1, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(358, 'PLSBU0200008', 'PLSBU0200008', 'Infusiones - A', '0.00', '0.0000', '390.00', '383.00', 1, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(359, 'PR000001', 'RBSAU2000020', 'PRODUCTO PRUEBA', '0.00', '0.0000', '0.01', '0.00', 1, 0, 0, 54, 63, 67, 114, 83, NULL, NULL, NULL, NULL, NULL),
(360, 'RB020001', 'RBSAU1800003', 'BURRO', '35.78', '0.0000', '11500.00', '11294.64', 0, 0, 0, 54, 63, 67, 113, 85, NULL, NULL, NULL, NULL, NULL),
(368, 'RB030001', 'RBSAU1800004', 'MATA BURRO', '63.81', '0.0000', '19900.00', '19544.64', 0, 0, 0, 54, 63, 67, 113, 85, NULL, NULL, NULL, NULL, NULL),
(376, 'RB050001', 'RBSAU2100001', 'POTE', '31.41', '0.0000', '3499.00', '3436.51', 1, 0, 0, 54, 63, 67, 115, 85, NULL, NULL, NULL, NULL, NULL),
(377, 'RB050501', 'RBSAU2400005', 'POLLO MECHADA POTE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 111, 85, NULL, NULL, NULL, NULL, NULL),
(378, 'RB050502', 'RBSAU2400001', 'CARNE MECHADO POTE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 111, 85, NULL, NULL, NULL, NULL, NULL),
(379, 'RB050503', 'RBSAU2400006', 'POLLO PARRILLA POTE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 111, 85, NULL, NULL, NULL, NULL, NULL),
(380, 'RB050504', 'RBSAU2400003', 'CARNE PARRILLA POTE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 111, 85, NULL, NULL, NULL, NULL, NULL),
(381, 'RB050505', 'RBSAU2400004', 'CHORIZO PARRILLA POTE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 111, 85, NULL, NULL, NULL, NULL, NULL),
(382, 'RB050506', 'RBSAU2400007', 'SOLO POTE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 111, 85, NULL, NULL, NULL, NULL, NULL),
(383, 'RB050507', 'RBSAU2400002', 'CARNE MOLIDA POTE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 111, 85, NULL, NULL, NULL, NULL, NULL),
(384, 'RB060001', 'RBSAU2100002', 'POTE LIGHT', '30.69', '0.0000', '3849.00', '3780.26', 1, 0, 0, 54, 63, 67, 115, 85, NULL, NULL, NULL, NULL, NULL),
(385, 'RB060601', 'RBSAU2500005', 'POLLO MECHADO POTE LIGHT', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 112, 85, NULL, NULL, NULL, NULL, NULL),
(386, 'RB060602', 'RBSAU2500001', 'CARNE MECHADA POTE LIGHT', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 112, 85, NULL, NULL, NULL, NULL, NULL),
(387, 'RB060603 ', 'RBSAU2500006', 'POLLO PARRILLA POTE LIGHT', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 112, 85, NULL, NULL, NULL, NULL, NULL),
(388, 'RB060604', 'RBSAU2500003', 'CARNE PARRILLA POTE LIGHT', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 112, 85, NULL, NULL, NULL, NULL, NULL),
(389, 'RB060606', 'RBSAU2500004', 'CHORIZO PARRILLA POTE LIGHT', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 112, 85, NULL, NULL, NULL, NULL, NULL),
(390, 'RB060607', 'RBSAU2500007', 'SOLO POTE LIGHT', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 112, 85, NULL, NULL, NULL, NULL, NULL),
(391, 'RB060608', 'RBSAU2500002', 'CARNE MOLIDA POTE LIGHT', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 112, 85, NULL, NULL, NULL, NULL, NULL),
(392, 'RB070002', 'RBSAU2000016', 'EXTR. POLLO MECHADO', '6.66', '0.0000', '1280.00', '1257.14', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(393, 'RB070003', 'RBSAU2000015', 'EXTR. POLLO A LA PARRILLA', '5.20', '0.0000', '1280.00', '1257.14', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(394, 'RB070004', 'RBSAU2000004', 'EXTR. CARNE A LA PARRILLA', '5.25', '0.0000', '1280.00', '1257.14', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(395, 'RB070005', 'RBSAU2000006', 'EXTR. CHORIZO', '4.78', '0.0000', '1280.00', '1257.14', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(396, 'RB070006', 'RBSAU2000011', 'EXTR. GUACAMOLE', '3.71', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(397, 'RB070008', 'RBSAU2000001', 'EXTR. ARROZ', '0.68', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(398, 'RB070009', 'RBSAU2000018', 'EXTR. TAJADA', '0.77', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(399, 'RB070010', 'RBSAU2000007', 'EXTR. CONGRI', '1.97', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(400, 'RB070011', 'RBSAU2000008', 'EXTR. CREMA DE LECHE', '5.57', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(401, 'RB070012', 'RBSAU2000002', 'EXTR. CARAOTAS NEGRAS', '1.10', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(402, 'RB070013', 'RBSAU2000003', 'EXTR. CARAOTAS ROJAS', '1.32', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(403, 'RB070014', 'RBSAU2000019', 'EXTR. VEGETALES SALTEADOS', '1.21', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(404, 'RB070015', 'RBSAU2000013', 'EXTR. MOJITO DE AJI PICANTE', '1.54', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(405, 'RB070016', 'RBSAU2000012', 'EXTR. MOJITO CILANTRO', '1.32', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(406, 'RB070017', 'RBSAU2000014', 'EXTR. PICO DE GALLO', '1.58', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(407, 'RB070018', 'RBSAU2000009', 'EXTR. CREMOSITO SALSA TARTARA', '1.44', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(408, 'RB070020', 'RBSAU2000010', 'EXTR. CREMOSITO SALSA VERDE', '1.58', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(409, 'RB070023', 'RBSAU2000005', 'EXTR. CARNE MOLIDA', '0.00', '0.0000', '1280.00', '1257.14', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(410, 'RB070024', 'RBSAU2000017', 'EXTR. QUESO', '0.00', '0.0000', '1220.00', '1198.21', 1, 0, 0, 54, 63, 67, 114, 85, NULL, NULL, NULL, NULL, NULL),
(411, 'RB080008', 'RBSBU1500002', 'COCA COLA GDE', '0.00', '0.0000', '1800.00', '1767.85', 1, 0, 0, 54, 63, 67, 120, 85, NULL, NULL, NULL, NULL, NULL),
(412, 'RB080009', 'RBSBU1500003', 'COCA COLA LIGHT GDE', '0.00', '0.0000', '1800.00', '1767.85', 1, 0, 0, 54, 63, 67, 120, 85, NULL, NULL, NULL, NULL, NULL),
(413, 'RB080010', 'RBSBU1500007', 'HIT GDE', '0.00', '0.0000', '1800.00', '1767.85', 1, 0, 0, 54, 63, 67, 120, 85, NULL, NULL, NULL, NULL, NULL),
(414, 'RB080011', 'RBSBU1500004', 'FRESCOLITA GDE', '0.00', '0.0000', '1800.00', '1767.85', 1, 0, 0, 54, 63, 67, 120, 85, NULL, NULL, NULL, NULL, NULL),
(415, 'RB080012', 'RBSBU1500001', 'CHINOTTO GDE', '0.00', '0.0000', '1800.00', '1767.85', 1, 0, 0, 54, 63, 67, 120, 85, NULL, NULL, NULL, NULL, NULL),
(416, 'RB080013', 'RBSBU1500006', 'FUZE TE LIMON GDE', '0.00', '0.0000', '1800.00', '1767.85', 1, 0, 0, 54, 63, 67, 120, 85, NULL, NULL, NULL, NULL, NULL),
(417, 'RB080014', 'RBSBU1500005', 'FUZE TE DURAZNO GDE', '0.00', '0.0000', '1800.00', '1767.85', 1, 0, 0, 54, 63, 67, 120, 85, NULL, NULL, NULL, NULL, NULL),
(418, 'RB090007', 'RBSBU1600003', 'COCA COLA MED', '0.00', '0.0000', '2800.00', '2749.99', 0, 0, 0, 54, 63, 67, 121, 85, NULL, NULL, NULL, NULL, NULL),
(419, 'RB090008', 'RBSBU1600002', 'COCA COLA LIGHT MED', '0.00', '0.0000', '2300.00', '2258.91', 1, 0, 0, 54, 63, 67, 121, 85, NULL, NULL, NULL, NULL, NULL),
(420, 'RB090009', 'RBSBU1600007', 'HIT MED', '0.00', '0.0000', '2800.00', '2749.99', 0, 0, 0, 54, 63, 67, 121, 85, NULL, NULL, NULL, NULL, NULL),
(421, 'RB090010', 'RBSBU1600004', 'FRESCOLITA MED', '0.00', '0.0000', '2800.00', '2749.99', 0, 0, 0, 54, 63, 67, 121, 85, NULL, NULL, NULL, NULL, NULL),
(422, 'RB090011', 'RBSBU1600001', 'CHINOTTO MED', '0.00', '0.0000', '2800.00', '2.75', 0, 0, 0, 54, 63, 67, 121, 85, NULL, NULL, NULL, NULL, NULL),
(423, 'RB090012', 'RBSBU1600006', 'FUZE TE LIMON MED', '0.00', '0.0000', '2300.00', '2258.91', 1, 0, 0, 54, 63, 67, 121, 85, NULL, NULL, NULL, NULL, NULL),
(424, 'RB090013', 'RBSBU1600005', 'FUZE TE DURAZNO MED', '0.00', '0.0000', '2300.00', '2258.91', 1, 0, 0, 54, 63, 67, 121, 85, NULL, NULL, NULL, NULL, NULL),
(425, 'RB090014', 'RBSBU1600008', 'JUGO DE NARANJA MED', '0.00', '0.0000', '1200.00', '933.03', 1, 0, 0, 54, 63, 67, 121, 85, NULL, NULL, NULL, NULL, NULL),
(426, 'RB100007', 'RBSBU1700003', 'COCA COLA PQ', '10.00', '0.0000', '2300.00', '2258.91', 0, 0, 0, 54, 63, 67, 122, 85, NULL, NULL, NULL, NULL, NULL),
(427, 'RB100008', 'RBSBU1700002', 'COCA COLA LIGHT PQ', '0.00', '0.0000', '2050.00', '2013.39', 1, 0, 0, 54, 63, 67, 122, 85, NULL, NULL, NULL, NULL, NULL),
(428, 'RB100009', 'RBSBU1700007', 'HIT PQ', '0.00', '0.0000', '2300.00', '2258.91', 0, 0, 0, 54, 63, 67, 122, 85, NULL, NULL, NULL, NULL, NULL),
(429, 'RB100010', 'RBSBU1700004', 'FRESCOLITA PQ', '0.00', '0.0000', '2300.00', '2258.91', 0, 0, 0, 54, 63, 67, 122, 85, NULL, NULL, NULL, NULL, NULL),
(430, 'RB100011', 'RBSBU1700001', 'CHINOTTO PQ', '0.00', '0.0000', '2300.00', '2258.91', 0, 0, 0, 54, 63, 67, 122, 85, NULL, NULL, NULL, NULL, NULL),
(431, 'RB100012', 'RBSBU1700006', 'FUZE TE LIMON PQ', '0.00', '0.0000', '2050.00', '2013.39', 1, 0, 0, 54, 63, 67, 122, 85, NULL, NULL, NULL, NULL, NULL),
(432, 'RB100013', 'RBSBU1700005', 'FUZE TE DURAZNO PQ', '0.00', '0.0000', '2300.00', '2258.91', 1, 0, 0, 54, 63, 67, 122, 85, NULL, NULL, NULL, NULL, NULL),
(433, 'RB100014', 'RBSBU1700008', 'JUGO DE NARANJA PQ', '0.00', '0.0000', '1200.00', '1178.58', 0, 0, 0, 54, 63, 67, 122, 85, NULL, NULL, NULL, NULL, NULL),
(434, 'RB110001', 'RBSAU2700001', 'AGUA MINERAL', '3.22', '0.0000', '80.00', '78.57', 1, 0, 0, 54, 63, 67, 116, 85, NULL, NULL, NULL, NULL, NULL),
(435, 'RB110004', 'RBSAU2700003', 'COCA COLA LIGHT LATA', '0.00', '0.0000', '1700.00', '1669.64', 1, 0, 0, 54, 63, 67, 116, 85, NULL, NULL, NULL, NULL, NULL),
(436, 'RB110006', 'RBSAU2700002', 'AGUA MINERAL 600 ML', '0.00', '0.0000', '110.00', '108.03', 1, 0, 0, 54, 63, 67, 116, 85, NULL, NULL, NULL, NULL, NULL),
(437, 'RB120001', 'RBSAU1900001', 'BEBIDA PERSONAL CHINOTTO', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(438, 'RB120002', 'RBSAU1900004', 'BEBIDA PERSONAL FRESCOLITA', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(439, 'RB120003', 'RBSAU1900007', 'BEBIDA PERSONAL HIT', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(440, 'RB120004', 'RBSAU1900002', 'BEBIDA PERSONAL COCA COLA', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(441, 'RB120005', 'RBSAU1900005', 'BEBIDA PERSONAL FUZE TE DURAZNO', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(442, 'RB120006', 'RBSAU1900006', 'BEBIDA PERSONAL FUZE TE LIMON', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(443, 'RB120007', 'RBSAU1900003', 'BEBIDA PERSONAL COCA COLA LIGHT', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(444, 'RB120008', 'RBSAU1900008', 'BURRO PERSONAL', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(445, 'RB120009', 'RBSAU1900010', 'RICO BURRITO PERSONAL', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(446, 'RB120010', 'RBSAU1900009', 'MATA BURRO PERSONAL', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 119, 85, NULL, NULL, NULL, NULL, NULL),
(447, 'RB130001', 'RBSAU1800005', 'RICO BURRITO', '0.00', '0.0000', '6650.00', '6531.24', 0, 0, 0, 54, 63, 67, 113, 85, NULL, NULL, NULL, NULL, NULL),
(448, 'RB131301', 'RBSAU2600005', 'POLLO MECHADO RICO BURRITO', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 123, 85, NULL, NULL, NULL, NULL, NULL),
(449, 'RB131302', 'RBSAU2600001', 'CARNE MECHADA RICO BURRITO', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 123, 85, NULL, NULL, NULL, NULL, NULL),
(450, 'RB131303', 'RBSAU2600006', 'POLLO PARRILLA RICO BURRITO', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 123, 85, NULL, NULL, NULL, NULL, NULL),
(451, 'RB131304', 'RBSAU2600003', 'CARNE PARRILLA RICO BURRITO', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 123, 85, NULL, NULL, NULL, NULL, NULL),
(452, 'RB131305', 'RBSAU2600004', 'CHORIZO PARRILLA RICO BURRITO', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 123, 85, NULL, NULL, NULL, NULL, NULL),
(453, 'RB131306', 'RBSAU2600007', 'SOLO RICO BURRITO', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 123, 85, NULL, NULL, NULL, NULL, NULL),
(454, 'RB131307', 'RBSAU2600002', 'CARNE MOLIDA RICO BURRITO', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 123, 85, NULL, NULL, NULL, NULL, NULL),
(455, 'RB140001', 'RBSAU1800001', 'BURRITO DE CARNE', '0.00', '0.0000', '5750.00', '5647.32', 0, 0, 0, 54, 63, 67, 113, 85, NULL, NULL, NULL, NULL, NULL),
(456, 'RB140002', 'RBSAU1800002', 'BURRITO DE POLLO', '0.00', '0.0000', '5750.00', '5647.32', 0, 0, 0, 54, 63, 67, 113, 85, NULL, NULL, NULL, NULL, NULL),
(457, 'RB150001', 'RBSAU2800004', 'TOSTADA SOLA', '0.00', '0.0000', '2550.00', '2504.46', 0, 0, 0, 54, 63, 67, 124, 85, NULL, NULL, NULL, NULL, NULL),
(458, 'RB150002', 'RBSAU2800002', 'RACION TOSTADA', '0.00', '0.0000', '4650.00', '4566.96', 0, 0, 0, 54, 63, 67, 124, 85, NULL, NULL, NULL, NULL, NULL),
(459, 'RB150003', 'RBSAU2800003', 'TACO SOLO', '0.00', '0.0000', '2550.00', '2504.46', 0, 0, 0, 54, 63, 67, 124, 85, NULL, NULL, NULL, NULL, NULL),
(460, 'RB150004', 'RBSAU2800001', 'RACION TACO', '0.00', '0.0000', '6400.00', '6285.75', 0, 0, 0, 54, 63, 67, 124, 85, NULL, NULL, NULL, NULL, NULL),
(461, 'RBCAU2900001', 'RBCAU2900001', 'CON GUACAMOLE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 126, 85, NULL, NULL, NULL, NULL, NULL),
(462, 'RBCAU2900002', 'RBCAU2900001', 'SIN GUACAMOLE', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 126, 85, NULL, NULL, NULL, NULL, NULL),
(463, 'RBCAU3000001', 'RBCAU3000001', 'CARAOTAS NEGRAS', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 125, 85, NULL, NULL, NULL, NULL, NULL),
(464, 'RBCAU3000002', 'RBCAU3000002', 'CARAOTAS ROJAS', '0.00', '0.0000', '1.00', '0.98', 1, 0, 0, 54, 63, 67, 125, 85, NULL, NULL, NULL, NULL, NULL),
(465, 'RBSAU3000001', 'RBSAU3000001', 'PABELLON CRIOLLO', '50.00', '0.0000', '3500.00', '3437.50', 1, 0, 0, 54, 63, 67, 127, 85, NULL, NULL, NULL, NULL, NULL),
(466, 'RBSBU3100002', 'RBSBU3100002', 'INFUSION FRIA', '0.00', '0.0000', '1200.00', '1178.57', 0, 0, 0, 54, 63, 67, 128, 85, NULL, NULL, NULL, NULL, NULL),
(467, 'PLSAU0400001', 'PLK01001', 'Combo 1 Slice - A', '134.00', '0.0000', '1.69', '1.66', 1, 0, 0, 54, 63, 67, 105, 84, NULL, NULL, NULL, NULL, NULL),
(468, 'PLSAU0400002', 'PLK01002', 'Combo 2 Slices - A', '17.00', '0.0000', '2.78', '2.73', 1, 0, 0, 54, 63, 67, 105, 84, NULL, NULL, NULL, NULL, NULL),
(469, 'PLSAU0300002', 'PLK09002', 'Pizza 2  Refresco 1,5 Lt - A', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 104, 84, NULL, NULL, NULL, NULL, NULL),
(470, 'PLSAU0300003', 'PLK09003', 'Pizza 3  Refresco 1,5 Lt - A', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 104, 84, NULL, NULL, NULL, NULL, NULL),
(471, 'PLSAU0300004', 'PLK09004', 'Pizza 4  Refresco 1,5 Lt - A', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 104, 84, NULL, NULL, NULL, NULL, NULL),
(472, 'PLSAU0300005', 'PLK09005', 'Pizza 5  Refresco 1,5 Lt - A', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 104, 84, NULL, NULL, NULL, NULL, NULL),
(473, 'PLSAU0300006', 'PLK09006', 'Pizza 6  Refresco 1,5 Lt - A', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 104, 84, NULL, NULL, NULL, NULL, NULL),
(474, 'PLSAU0300007', 'PLK09007', 'Pizza 7  Refresco 1,5 Lt - A', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 104, 84, NULL, NULL, NULL, NULL, NULL),
(475, 'FPSAU8000004', 'FPSAU8000004', 'Adic. Champinones 12 ', '0.00', '0.0000', '6.53', '5.08', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(476, 'FPSAU8000012', 'FPSAU8000012', 'Adic. Tocineta 12', '0.00', '0.0000', '6.53', '5.08', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(477, 'FPSAU8000011', 'FPSAU8000011', 'Adic. Salsa Para Pizza 12 ', '0.00', '0.0000', '2.59', '2.01', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(478, 'FPSAU8000010', 'FPSAU8000010', 'Adic. Salchichon 12', '0.00', '0.0000', '6.53', '5.08', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(479, 'FPSAU8000009', 'FPSAU8000009', 'Adic. Q. Mozzarella 12', '0.00', '0.0000', '6.53', '5.08', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(480, 'FPSAU8000008', 'FPSAU8000008', 'Adic. Pimenton 12', '0.00', '0.0000', '2.59', '2.01', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(481, 'FPSAU8000007', 'FPSAU8000007', 'Adic. Pepperoni 12', '0.00', '0.0000', '7.00', '5.08', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(482, 'FPSAU8000005', 'FPSAU8000005', 'Adic. Jamon de Pierna 12 ', '0.00', '0.0000', '3.00', '2.01', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(483, 'FPSAU8000003', 'FPSAU8000003', 'Adic. Cebollin 12 ', '0.00', '0.0000', '2.59', '2.01', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(484, 'FPSAU8000002', 'FPSAU8000002', 'Adic. Anchoas 12', '0.00', '0.0000', '2.59', '2.01', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(485, 'FPSAU8000001', 'FPSAU8000001', 'Adic. Aceitunas 12 ', '0.00', '0.0000', '6.53', '5.08', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(486, 'FPSAU8000006', 'FPSAU8000006', 'Adic. Maiz 12', '0.00', '0.0000', '3.00', '2.01', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(487, 'FPSAU8000014', 'FPSAU8000014', 'Adic. Ajonjoli 12', '0.00', '0.0000', '2.59', '2.01', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(488, 'FPSAU8000013', 'FPSAU8000013', 'Adic. Ajo Porro 12', '0.00', '0.0000', '2.59', '2.01', 0, 0, 0, 54, 63, 67, 184, 51, NULL, NULL, NULL, NULL, NULL),
(489, 'FPSAU6400012', 'FPSAU6400012', 'Adic. Tocineta 12 - NM', '0.00', '0.0000', '982.14', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(490, 'FPSAU6400009', 'FPSAU6400009', 'Adic. Q. Mozzarella 12 -NM', '0.00', '0.0000', '2455.35', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(491, 'FPSAU6400011', 'FPSAU6400011', 'Adic. Salsa Para Pizza 12 - NM', '0.00', '0.0000', '2455.35', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(492, 'FPSAU6400008', 'FPSAU6400008', 'Adic. Pimenton 12 - NM', '0.00', '0.0000', '982.14', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(493, 'FPSAU6400007', 'FPSAU6400007', 'Adic. Pepperoni 12 - NM', '0.00', '0.0000', '2455.35', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(494, 'FPSAU6400006', 'FPSAU6400006', 'Adic. Maiz 12 - NM', '0.00', '0.0000', '982.14', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(495, 'FPSAU6400002', 'FPSAU6400002', 'Adic. Anchoas 12 - NM', '0.00', '0.0000', '982.14', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(496, 'FPSAU6400005', 'FPSAU6400005', 'Adic. Jamon de Pierna 12 - NM', '0.00', '0.0000', '982.14', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(497, 'FPSAU6400004', 'FPSAU6400004', 'Adic. Champinones 12 - NM', '0.00', '0.0000', '2455.35', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(498, 'FPSAU6400003', 'FPSAU6400003', 'Adic. Cebollin 12 - NM', '0.00', '0.0000', '982.14', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(499, 'FPSAU6400001', 'FPSAU6400001', 'Adic. Aceitunas 12 - NM', '0.00', '0.0000', '2455.35', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(500, 'FPSAU6400010', 'FPSAU6400010', 'Adic. Salchichon 12 - NM', '0.00', '0.0000', '2455.35', '-1.00', 1, 0, 0, 54, 67, 63, 180, 51, NULL, NULL, NULL, NULL, NULL),
(501, 'FPSAU8100011', 'FPSAU8100011', 'Adic. Salsa Para Pizza 16 ', '0.00', '0.0000', '4.43', '3.44', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(502, 'FPSAU8100010', 'FPSAU8100010', 'Adic. Salchichon 16 ', '0.00', '0.0000', '9.32', '7.22', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(503, 'FPSAU8100009', 'FPSAU8100009', 'Adic. Q. Mozzarella 16', '0.00', '0.0000', '9.32', '7.22', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(504, 'FPSAU8100008', 'FPSAU8100008', 'Adic. Pimenton 16 ', '0.00', '0.0000', '4.43', '3.44', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(505, 'FPSAU8100007', 'FPSAU8100007', 'Adic. Pepperoni 16 ', '0.00', '0.0000', '11.00', '7.22', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(506, 'FPSAU8100006', 'FPSAU8100006', 'Adic. Maiz 16 ', '0.00', '0.0000', '4.43', '3.44', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(507, 'FPSAU8100003', 'FPSAU8100003', 'Adic. Cebollin 16 ', '0.00', '0.0000', '4.43', '3.44', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(508, 'FPSAU8100012', 'FPSAU8100012', 'Adic. Tocineta 16 ', '0.00', '0.0000', '9.32', '7.22', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(509, 'FPSAU8100001', 'FPSAU8100001', 'Adic. Aceitunas 16 ', '0.00', '0.0000', '9.32', '7.22', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(510, 'FPSAU8100004', 'FPSAU8100004', 'Adic. Champinones 16 ', '0.00', '0.0000', '9.32', '7.22', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(511, 'FPSAU8100005', 'FPSAU8100005', 'Adic. Jamon de Pierna 16 ', '0.00', '0.0000', '4.43', '3.44', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(512, 'FPSAU8100002', 'FPSAU8100002', 'Adic. Anchoas 16 ', '0.00', '0.0000', '4.43', '3.44', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(513, 'FPSAU8100013', 'FPSAU8100014', 'Adic. Ajo Porro 16', '0.00', '0.0000', '4.43', '3.44', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(514, 'FPSAU8100014', 'FPSAU8100015', 'Adic. Ajonjoli 16', '0.00', '0.0000', '4.43', '3.44', 0, 0, 0, 54, 63, 67, 185, 51, NULL, NULL, NULL, NULL, NULL),
(515, 'FPSAU6500011', 'FPSAU6500011', 'Adic. Salsa Para Pizza 16 - NM', '0.00', '0.0000', '2946.42', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(516, 'FPSAU6500001', 'FPSAU6500001', 'Adic. Aceitunas 16 - NM', '0.00', '0.0000', '2946.42', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(517, 'FPSAU6500003', 'FPSAU6500003', 'Adic. Cebollin 16 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(518, 'FPSAU6500004', 'FPSAU6500004', 'Adic. Champinones 16 - NM', '0.00', '0.0000', '2946.42', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(519, 'FPSAU6500005', 'FPSAU6500005', 'Adic. Jamon de Pierna 16 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(520, 'FPSAU6500007', 'FPSAU6500007', 'Adic. Pepperoni 16 - NM', '0.00', '0.0000', '3437.50', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(521, 'FPSAU6500006', 'FPSAU6500006', 'Adic. Maiz 16 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(522, 'FPSAU6500010', 'FPSAU6500010', 'Adic. Salchichon 16 - NM', '0.00', '0.0000', '2946.42', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(523, 'FPSAU6500012', 'FPSAU6500012', 'Adic. Tocineta 16 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(524, 'FPSAU6500009', 'FPSAU6500009', 'Adic. Q. Mozzarella 16 -NM', '0.00', '0.0000', '3437.50', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(525, 'FPSAU6500008', 'FPSAU6500008', 'Adic. Pimenton 16 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(526, 'FPSAU6500002', 'FPSAU6500002', 'Adic. Anchoas 16 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 186, 51, NULL, NULL, NULL, NULL, NULL),
(527, 'FPSAU0200003', 'ADP4', 'Adic. Anchoas 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(528, 'FPSAU0200002', 'ADP7', 'Adic. Aceitunas 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(529, 'FPSAU0200001', 'ADP2', 'Adic. Aceite de Oliva 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(530, 'FPSAU0200014', 'ADP8', 'Adic. Tocineta 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(531, 'FPSAU0200013', 'ADP14', 'Adic. Salchichon 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(532, 'FPSAU0200012', 'ADP15', 'Adic. Queso Parmesano 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(533, 'FPSAU0200011', 'ADP17', 'Adic. Queso Mozzarella 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(534, 'FPSAU0200010', 'ADP11', 'Adic. Pollo Guisado 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(535, 'FPSAU0200009', 'ADP3', 'Adic. Pimenton 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(536, 'FPSAU0200008', 'ADP10', 'Adic. Pepperoni 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(537, 'FPSAU0200007', 'ADP5', 'Adic. Maiz 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(538, 'FPSAU0200006', 'ADP6', 'Adic. Jamon de Pierna 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(539, 'FPSAU0200005', 'ADP9', 'Adic. Champinones 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(540, 'FPSAU0200004', 'ADP1', 'Adic. Cebolla 8 - T', '0.00', '0.0000', '4.05', '3.98', 0, 0, 0, 54, 67, 63, 7, 49, NULL, NULL, NULL, NULL, NULL),
(541, 'FPSAU8200009', 'FPSAU8200009', 'Adic. Q. Mozzarella 9', '0.00', '0.0000', '3.91', '3.04', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(542, 'FPSAU8200013', 'FPSAU8200013', 'Adic. Ajonjoli 9', '0.00', '0.0000', '1.84', '1.42', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(543, 'FPSAU8200014', 'FPSAU8200014', 'Adic. Ajo Porro 9', '0.00', '0.0000', '1.84', '1.42', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(544, 'FPSAU8200012', 'FPSAU8200012', 'Adic. Tocineta 9 ', '0.00', '0.0000', '3.91', '3.04', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(545, 'FPSAU8200010', 'FPSAU8200010', 'Adic. Salchichon 9 ', '0.00', '0.0000', '3.91', '3.04', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(546, 'FPSAU8200008', 'FPSAU8200008', 'Adic. Pimenton 9 ', '0.00', '0.0000', '1.84', '1.42', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(547, 'FPSAU8200007', 'FPSAU8200007', 'Adic. Pepperoni 9 ', '0.00', '0.0000', '4.00', '3.04', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(548, 'FPSAU8200006', 'FPSAU8200006', 'Adic. Maiz 9 ', '0.00', '0.0000', '1.84', '1.42', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(549, 'FPSAU8200005', 'FPSAU8200005', 'Adic. Jamon de Pierna 9 ', '0.00', '0.0000', '1.84', '1.42', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(550, 'FPSAU8200004', 'FPSAU8200004', 'Adic. Champinones 9 ', '0.00', '0.0000', '3.91', '3.04', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(551, 'FPSAU8200003', 'FPSAU8200003', 'Adic. Cebollin 9 ', '0.00', '0.0000', '1.60', '1.42', 0, 0, 0, 54, 67, 63, 187, 51, NULL, NULL, NULL, NULL, NULL),
(552, 'FPSAU8200002', 'FPSAU8200002', 'Adic. Anchoas 9 ', '0.00', '0.0000', '1.84', '1.42', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(553, 'FPSAU8200001', 'FPSAU8200001', 'Adic. Aceitunas 9 ', '0.00', '0.0000', '3.91', '3.04', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(554, 'FPSAU8200011', 'FPSAU8200011', 'Adic. Salsa Para Pizza 9 ', '0.00', '0.0000', '1.84', '1.42', 0, 0, 0, 54, 63, 67, 187, 51, NULL, NULL, NULL, NULL, NULL),
(555, 'FPSAU6300002', 'FPSAU6300002', 'Adic. Anchoas 9 - NM', '0.00', '0.0000', '491.07', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(556, 'FPSAU6300012', 'FPSAU6300012', 'Adic. Tocineta 9 - NM', '0.00', '0.0000', '491.07', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(557, 'FPSAU6300010', 'FPSAU6300010', 'Adic. Salchichon 9 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(558, 'FPSAU6300009', 'FPSAU6300009', 'Adic. Q. Mozzarella 9 -NM', '0.00', '0.0000', '982.14', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(559, 'FPSAU6300008', 'FPSAU6300008', 'Adic. Pimenton 9 - NM', '0.00', '0.0000', '491.07', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(560, 'FPSAU6300007', 'FPSAU6300007', 'Adic. Pepperoni 9 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(561, 'FPSAU6300006', 'FPSAU6300006', 'Adic. Maiz 9 - NM', '0.00', '0.0000', '491.07', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(562, 'FPSAU6300005', 'FPSAU6300005', 'Adic. Jamon de Pierna 9 - NM', '0.00', '0.0000', '491.07', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(563, 'FPSAU6300003', 'FPSAU6300003', 'Adic. Cebollin 9 - NM', '0.00', '0.0000', '491.07', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(564, 'FPSAU6300001', 'FPSAU6300001', 'Adic. Aceitunas 9 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(565, 'FPSAU6300004', 'FPSAU6300004', 'Adic. Champinones 9 - NM', '0.00', '0.0000', '1473.21', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(566, 'FPSAU6300011', 'FPSAU6300011', 'Adic. Salsa Para Pizza 9 - NM', '0.00', '0.0000', '982.14', '-1.00', 1, 0, 0, 54, 67, 63, 182, 51, NULL, NULL, NULL, NULL, NULL),
(567, 'FPSAU0400010', 'ADP71', 'Adic. Pollo Guisado Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(568, 'FPSAU0400011', 'ADP65', 'Adic. Queso Mozzarella Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(569, 'FPSAU0400009', 'ADP57', 'Adic. Pimenton Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(570, 'FPSAU0400008', 'ADP66', 'Adic. Pepperoni Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(571, 'FPSAU0400013', 'ADP72', 'Adic. Salchichon Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(572, 'FPSAU0400007', 'ADP63', 'Adic. Maiz Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(573, 'FPSAU0400006', 'ADP60', 'Adic. Jamon de Pierna Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(574, 'FPSAU0400005', 'ADP59', 'Adic. Champinones Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(575, 'FPSAU0400004', 'ADP58', 'Adic. Cebolla Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(576, 'FPSAU0400003', 'ADP56', 'Adic. Anchoas Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(577, 'FPSAU0400002', 'ADP64', 'Adic. Aceituna Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(578, 'FPSAU0400001', 'ADP55', 'Adic. Aceite de Oliva Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(579, 'FPSAU0400014', 'ADP67', 'Adic. Tocineta Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(580, 'FPSAU0400012', 'ADP61', 'Adic. Queso Parmesano Gde -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 183, 51, NULL, NULL, NULL, NULL, NULL),
(581, 'FPSAU0600014', 'ADP49', 'Adic. Tocineta Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(582, 'FPSAU0600013', 'ADP54', 'Adic. Salchichon Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(583, 'FPSAU0600011', 'ADP47', 'Adic. Queso Mozzarella Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(584, 'FPSAU0600001', 'ADP37', 'Adic. Aceite de Oliva Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(585, 'FPSAU0600012', 'ADP43', 'Adic. Queso Parmesano Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(586, 'FPSAU0600002', 'ADP46', 'Adic. Aceituna Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(587, 'FPSAU0600003', 'ADP38', 'Adic. Anchoas Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(588, 'FPSAU0600004', 'ADP40', 'Adic. Cebolla Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(589, 'FPSAU0600005', 'ADP41', 'Adic. Champinones Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(590, 'FPSAU0600006', 'ADP42', 'Adic. Jamon de Pierna Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(591, 'FPSAU0600007', 'ADP45', 'Adic. Maiz Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(592, 'FPSAU0600008', 'ADP48', 'Adic. Pepperoni Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(593, 'FPSAU0600009', 'ADP39', 'Adic. Pimenton Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(594, 'FPSAU0600010', 'ADP53', 'Adic. Pollo Guisado Med -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 189, 51, NULL, NULL, NULL, NULL, NULL),
(595, 'FPSAU0800003', 'ADP20', 'Adic. Anchoas Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(596, 'FPSAU0800008', 'ADP30', 'Adic. Pepperoni Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(597, 'FPSAU0800007', 'ADP27', 'Adic. Maiz Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(598, 'FPSAU0800006', 'ADP24', 'Adic. Jamon de Pierna Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(599, 'FPSAU0800005', 'ADP23', 'Adic. Champinones Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(600, 'FPSAU0800004', 'ADP22', 'Adic. Cebolla Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(601, 'FPSAU0800009', 'ADP21', 'Adic. Pimenton Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(602, 'FPSAU0800002', 'ADP28', 'Adic. Aceitunas Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(603, 'FPSAU0800001', 'ADP19', 'Adic. Aceite de Oliva Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(604, 'FPSAU0800011', 'ADP29', 'Adic. Queso Mozzarella Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(605, 'FPSAU0800012', 'ADP25', 'Adic. Queso Parmesano Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(606, 'FPSAU0800013', 'ADP36', 'Adic. Salchichon Pq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(607, 'FPSAU0800014', 'ADP31', 'Adic. Tocineta Pq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(608, 'FPSAU0800010', 'ADP35', 'Adic. Pollo Guisado Peq -T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 188, 51, NULL, NULL, NULL, NULL, NULL),
(609, 'FPSAU8300007', 'FPSAU8300007', 'Te Lipton Durazno 16 Oz ', '0.00', '0.0000', '2.65', '2.59', 0, 0, 0, 54, 67, 63, 225, 51, NULL, NULL, NULL, NULL, NULL),
(610, 'FPSAU8300001', 'FPSAU8300001', '7 Up 16 Oz ', '0.00', '0.0000', '2.65', '2.59', 0, 0, 0, 54, 67, 63, 225, 51, NULL, NULL, NULL, NULL, NULL),
(611, 'FPSAU8300002', 'FPSAU8300002', 'Kolita 16 Oz ', '0.00', '0.0000', '2.65', '2.59', 0, 0, 0, 54, 67, 63, 225, 51, NULL, NULL, NULL, NULL, NULL),
(612, 'FPSAU8300003', 'FPSAU8300003', 'Naranja 16 Oz ', '0.00', '0.0000', '2.65', '2.59', 0, 0, 0, 54, 67, 63, 225, 51, NULL, NULL, NULL, NULL, NULL),
(614, 'FPSAU8300005', 'FPSAU8300005', 'Poco Hielo 16 Oz ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 225, 51, NULL, NULL, NULL, NULL, NULL),
(615, 'FPSAU8300008', 'FPSAU8300008', 'Te Lipton Limon 16 Oz ', '0.00', '0.0000', '2.65', '2.59', 0, 0, 0, 54, 67, 63, 225, 51, NULL, NULL, NULL, NULL, NULL),
(616, 'FPSAU8300006', 'FPSAU8300006', 'Sin Hielo 16 Oz ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 225, 51, NULL, NULL, NULL, NULL, NULL),
(617, 'FPSAU6600008', 'FPSAU6600008', 'Poco Hielo 16 Oz - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 226, 51, NULL, NULL, NULL, NULL, NULL),
(618, 'FPSAU6600006', 'FPSAU6600006', 'Te Lipton Limon 16 Oz - NM', '0.00', '0.0000', '1100.00', '-1.00', 1, 0, 0, 54, 67, 63, 226, 51, NULL, NULL, NULL, NULL, NULL),
(619, 'FPSAU6600005', 'FPSAU6600005', 'Te Lipton Durazno 16 Oz - NM', '0.00', '0.0000', '1100.00', '-1.00', 1, 0, 0, 54, 67, 63, 226, 51, NULL, NULL, NULL, NULL, NULL),
(620, 'FPSAU6600004', 'FPSAU6600004', 'Pepsi Cola 16 Oz - NM', '0.00', '0.0000', '1100.00', '-1.00', 1, 0, 0, 54, 67, 63, 226, 51, NULL, NULL, NULL, NULL, NULL),
(621, 'FPSAU6600003', 'FPSAU6600003', 'Naranja 16 Oz - NM', '0.00', '0.0000', '1100.00', '-1.00', 1, 0, 0, 54, 67, 63, 226, 51, NULL, NULL, NULL, NULL, NULL),
(622, 'FPSAU6600007', 'FPSAU6600007', 'Sin Hielo 16 Oz - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 226, 51, NULL, NULL, NULL, NULL, NULL),
(623, 'FPSAU6600002', 'FPSAU6600002', 'Kolita 16 Oz - NM', '0.00', '0.0000', '1100.00', '-1.00', 1, 0, 0, 54, 67, 63, 226, 51, NULL, NULL, NULL, NULL, NULL),
(624, 'FPSAU6600001', 'FPSAU6600001', '7 Up 16 Oz - NM', '0.00', '0.0000', '1100.00', '-1.00', 1, 0, 0, 54, 67, 63, 226, 51, NULL, NULL, NULL, NULL, NULL),
(625, 'FPSAU8400003', 'FPSAU8400003', 'Naranja 21 Oz ', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 67, 63, 227, 51, NULL, NULL, NULL, NULL, NULL),
(626, 'FPSAU8400001', 'FPSAU8400001', '7 Up 21 Oz', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 67, 63, 227, 51, NULL, NULL, NULL, NULL, NULL),
(627, 'FPSAU8400002', 'FPSAU8400002', 'Kolita 21 Oz ', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 67, 63, 227, 51, NULL, NULL, NULL, NULL, NULL),
(628, 'FPSAU8400008', 'FPSAU8400008', 'Te Lipton Limon 21 Oz ', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 67, 63, 227, 51, NULL, NULL, NULL, NULL, NULL),
(629, 'FPSAU8400004', 'FPSAU8400004', 'Pepsi Cola 21 Oz ', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 67, 63, 227, 51, NULL, NULL, NULL, NULL, NULL),
(630, 'FPSAU8400005', 'FPSAU8400005', 'Poco Hielo 21 Oz ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 227, 51, NULL, NULL, NULL, NULL, NULL),
(631, 'FPSAU8400006', 'FPSAU8400006', 'Sin Hielo 21 Oz ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 227, 51, NULL, NULL, NULL, NULL, NULL),
(632, 'FPSAU8400007', 'FPSAU8400007', 'Te Lipton Durazno 21 Oz ', '0.00', '0.0000', '3.60', '3.54', 0, 0, 0, 54, 67, 63, 227, 51, NULL, NULL, NULL, NULL, NULL),
(633, 'FPSAU6700006', 'FPSAU6700006', 'Te Lipton Limon 21 Oz - NM', '0.00', '0.0000', '1424.10', '-1.00', 1, 0, 0, 54, 67, 63, 228, 51, NULL, NULL, NULL, NULL, NULL),
(634, 'FPSAU6700007', 'FPSAU6700007', 'Sin Hielo 21 Oz - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 228, 51, NULL, NULL, NULL, NULL, NULL),
(635, 'FPSAU6700008', 'FPSAU6700008', 'Poco Hielo 21 Oz - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 228, 51, NULL, NULL, NULL, NULL, NULL),
(636, 'FPSAU6700002', 'FPSAU6700002', 'Kolita 21 Oz - NM', '0.00', '0.0000', '1424.10', '-1.00', 1, 0, 0, 54, 67, 63, 228, 51, NULL, NULL, NULL, NULL, NULL),
(637, 'FPSAU6700003', 'FPSAU6700003', 'Naranja 21 Oz - NM', '0.00', '0.0000', '1424.10', '-1.00', 1, 0, 0, 54, 67, 63, 228, 51, NULL, NULL, NULL, NULL, NULL),
(638, 'FPSAU6700004', 'FPSAU6700004', 'Pepsi Cola 21 Oz - NM', '0.00', '0.0000', '1424.10', '-1.00', 1, 0, 0, 54, 67, 63, 228, 51, NULL, NULL, NULL, NULL, NULL),
(639, 'FPSAU6700005', 'FPSAU6700005', 'Te Lipton Durazno 21 Oz - NM', '0.00', '0.0000', '1424.10', '-1.00', 1, 0, 0, 54, 67, 63, 228, 51, NULL, NULL, NULL, NULL, NULL),
(640, 'FPSAU6700001', 'FPSAU6700001', '7 Up 21 Oz - NM', '0.00', '0.0000', '1424.10', '-1.00', 1, 0, 0, 54, 67, 63, 228, 51, NULL, NULL, NULL, NULL, NULL),
(641, 'FPSBU0900006', '002', 'Sin/Hielo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 229, 51, NULL, NULL, NULL, NULL, NULL),
(642, 'FPSBU0900005', '003', 'Poco/Hielo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 229, 51, NULL, NULL, NULL, NULL, NULL),
(643, 'FPSBU0900001', 'BEB16', '7 UP 32oz Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 229, 51, NULL, NULL, NULL, NULL, NULL),
(644, 'FPSBU0900002', 'BEB17', 'Kolita 32oz Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 229, 51, NULL, NULL, NULL, NULL, NULL),
(645, 'FPSBU0900004', 'BEB15', 'Pepsi Cola 32oz Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 229, 51, NULL, NULL, NULL, NULL, NULL),
(646, 'FPSBU0900007', 'BEB20', 'Te Lipton Durazno Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 229, 51, NULL, NULL, NULL, NULL, NULL),
(647, 'FPSBU0900008', 'BEB19', 'Te Lipton Limon Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 229, 51, NULL, NULL, NULL, NULL, NULL),
(648, 'FPSBU0900003', 'BEB18', 'Naranja 32oz Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 229, 51, NULL, NULL, NULL, NULL, NULL),
(649, 'FPSBU1000003', 'BEB12', 'Naranja Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 230, 51, NULL, NULL, NULL, NULL, NULL),
(650, 'FPSBU1000001', 'BEB10', '7 UP Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 230, 51, NULL, NULL, NULL, NULL, NULL),
(651, 'FPSBU1000002', 'BEB11', 'Kolita Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 230, 51, NULL, NULL, NULL, NULL, NULL),
(652, 'FPSBU1000004', 'BEB9', 'Pepsi Cola Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 230, 51, NULL, NULL, NULL, NULL, NULL),
(653, 'FPSBU1000005', 'BEB14', 'Te Lipton Durazno Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 230, 51, NULL, NULL, NULL, NULL, NULL),
(654, 'FPSBU1000006', 'BEB13', 'Te Lipton Limon Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 230, 51, NULL, NULL, NULL, NULL, NULL),
(655, 'FPSBU1100005', 'BEB7', 'Te Lipton Durazno Pq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 231, 51, NULL, NULL, NULL, NULL, NULL),
(656, 'FPSBU1100002', 'BEB4', 'Kolita Pq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 231, 51, NULL, NULL, NULL, NULL, NULL),
(657, 'FPSBU1100006', 'BEB6', 'Te Lipton Limon Pq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 231, 51, NULL, NULL, NULL, NULL, NULL),
(658, 'FPSBU1100003', 'BEB5', 'Naranja Pq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 231, 51, NULL, NULL, NULL, NULL, NULL),
(659, 'FPSBU1100001', 'BEB3', '7 Up Pq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 231, 51, NULL, NULL, NULL, NULL, NULL),
(660, 'FPSBU1100004', 'BEB1', 'Pepsi Cola Pq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 231, 51, NULL, NULL, NULL, NULL, NULL),
(661, 'FPSBU9700001', 'FPSBU9700001', 'Cafe Gde', '0.00', '0.0000', '1.60', '0.00', 0, 0, 0, 54, 67, 63, 232, 51, NULL, NULL, NULL, NULL, NULL),
(662, 'FPSBU9700002', 'FPSBU9700002', 'Cafe Peq', '0.00', '0.0000', '2.20', '0.00', 0, 0, 0, 54, 67, 63, 232, 51, NULL, NULL, NULL, NULL, NULL),
(663, 'FPSBU1200001', '120001', 'Cafe Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 233, 51, NULL, NULL, NULL, NULL, NULL),
(664, 'FPSBU1200002', '240002', 'Cafe Peq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 233, 51, NULL, NULL, NULL, NULL, NULL),
(665, 'FPSAU1300001', 'ENS1', 'Ensa. Cesar - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 190, 51, NULL, NULL, NULL, NULL, NULL),
(666, 'FPSAU1300002', 'ENS5', 'Ensa. Americana - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 190, 51, NULL, NULL, NULL, NULL, NULL),
(667, 'FPSAU1300003', 'ENS6', 'Ensa. Cesar Con Pollo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 190, 51, NULL, NULL, NULL, NULL, NULL),
(668, 'FPSAU1300004', 'ENS4', 'Ensa. Cobb - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 190, 51, NULL, NULL, NULL, NULL, NULL),
(669, 'FPSAU1300005', 'ENS11', 'Ensa. Pacifico - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 190, 51, NULL, NULL, NULL, NULL, NULL),
(670, 'FPSBU1400004', 'BEB38', 'Yukery Pera - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 234, 51, NULL, NULL, NULL, NULL, NULL),
(671, 'FPSBU1400002', 'BEB40', 'Yukery Mango - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 234, 51, NULL, NULL, NULL, NULL, NULL),
(672, 'FPSBU1400001', 'BEB39', 'Yukery Durazno - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 234, 51, NULL, NULL, NULL, NULL, NULL),
(673, 'FPSBU1400003', 'BEB37', 'Yukery Manzana - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 234, 51, NULL, NULL, NULL, NULL, NULL),
(674, 'FPSAU8500002', 'FPSAU8500002', 'Para Llevar Pizza 16 ', '0.00', '0.0000', '1.87', '1.67', 0, 0, 0, 54, 67, 63, 191, 51, NULL, NULL, NULL, NULL, NULL),
(675, 'FPSAU8500003', 'FPSAU8500003', 'Para Llevar Pizza 9 ', '0.00', '0.0000', '860.00', '766.00', 0, 0, 0, 54, 67, 63, 191, 51, NULL, NULL, NULL, NULL, NULL),
(676, 'FPSAU8500001', 'FPSAU8500001', 'Para Llevar Pizza 12 ', '0.00', '0.0000', '1.52', '1.36', 0, 0, 0, 54, 67, 63, 191, 51, NULL, NULL, NULL, NULL, NULL),
(677, 'FPSAU6800003', 'FPSAU6800003', 'Para Llevar Pizza 16 - NM', '0.00', '0.0000', '618.75', '-1.00', 1, 0, 0, 54, 67, 63, 192, 51, NULL, NULL, NULL, NULL, NULL),
(678, 'FPSAU6800002', 'FPSAU6800002', 'Para Llevar Pizza 12 - NM', '0.00', '0.0000', '500.89', '-1.00', 1, 0, 0, 54, 67, 63, 192, 51, NULL, NULL, NULL, NULL, NULL),
(679, 'FPSAU6800001', 'FPSAU6800001', 'Para Llevar Pizza 9 - NM', '0.00', '0.0000', '284.82', '-1.00', 1, 0, 0, 54, 67, 63, 192, 51, NULL, NULL, NULL, NULL, NULL),
(680, 'FPSAU1500006', '006', 'Para Llevar Pz. Med - T', '0.00', '0.0000', '1.38', '1.36', 1, 0, 0, 54, 67, 63, 193, 51, NULL, NULL, NULL, NULL, NULL),
(681, 'FPSAU1500005', '007', 'Para Llevar Pz. Grd - T', '0.00', '0.0000', '1.70', '1.67', 1, 0, 0, 54, 67, 63, 193, 51, NULL, NULL, NULL, NULL, NULL),
(682, 'FPSAU1500007', '009', 'Para Llevar Wrap - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 193, 51, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `receta_id`) VALUES
(683, 'FPSAU1500004', '005', 'Para Llevar Pizza PQ - T', '0.00', '0.0000', '780.00', '766.00', 1, 0, 0, 54, 67, 63, 193, 51, NULL, NULL, NULL, NULL, NULL),
(684, 'FPSAU1500003', '011', 'Para Llevar Pizza 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 193, 51, NULL, NULL, NULL, NULL, NULL),
(685, 'FPSAU1500001', '008', 'Para Llevar Ensalada - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 193, 51, NULL, NULL, NULL, NULL, NULL),
(686, 'FPSAU1500002', '0001', 'Para Llevar Pasta - T', '0.00', '0.0000', '300.00', '294.00', 1, 0, 0, 54, 67, 63, 193, 51, NULL, NULL, NULL, NULL, NULL),
(687, 'FPSAU1700008', 'PAS7', 'Pasta Vegetales con pollo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 64, 194, 51, NULL, NULL, NULL, NULL, NULL),
(688, 'FPSAU1700006', 'PAS9', 'Pasta Pollo a la Parmesana - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 64, 194, 51, NULL, NULL, NULL, NULL, NULL),
(689, 'FPSAU1700009', 'PAS8', 'Pasticho - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 194, 51, NULL, NULL, NULL, NULL, NULL),
(690, 'FPSAU1700003', 'PAS2', 'Pasta Carbonara - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 64, 194, 51, NULL, NULL, NULL, NULL, NULL),
(691, 'FPSAU1700005', 'PAS1', 'Pasta Napolitana - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 64, 194, 51, NULL, NULL, NULL, NULL, NULL),
(692, 'FPSAU1700004', 'PAS5', 'Pasta Matriciana - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 64, 194, 51, NULL, NULL, NULL, NULL, NULL),
(693, 'FPSAU1700001', 'PAS6', 'Pasta Alfredo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 64, 194, 51, NULL, NULL, NULL, NULL, NULL),
(694, 'FPSAU1700007', 'PAS3', 'Pasta Putanesca - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 64, 194, 51, NULL, NULL, NULL, NULL, NULL),
(695, 'FPSAU1700002', 'PAS4', 'Pasta Bolonesa - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 64, 194, 51, NULL, NULL, NULL, NULL, NULL),
(696, 'FPSAU9700003', 'FPSAU9700003', 'Pastel de Carne.', '0.00', '0.0000', '1.15', '0.00', 0, 0, 0, 54, 67, 63, 195, 51, NULL, NULL, NULL, NULL, NULL),
(697, 'FPSAU9700001', 'FPSAU9700001', 'PASTELITOS.', '0.00', '0.0000', '770.00', '1.03', 1, 0, 0, 54, 67, 63, 195, 51, NULL, NULL, NULL, NULL, NULL),
(698, 'FPSAU9700002', 'FPSAU9700002', 'Pastel de Queso.', '0.00', '0.0000', '1.15', '0.00', 0, 0, 0, 54, 67, 63, 195, 51, NULL, NULL, NULL, NULL, NULL),
(699, 'FPSAU9700004', 'FPSAU9700004', 'Pastel de Pollo.', '0.00', '0.0000', '1.15', '0.00', 0, 0, 0, 54, 67, 63, 195, 51, NULL, NULL, NULL, NULL, NULL),
(700, 'FPSAU1800001', 'DE002', 'Pastelito de Carne - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 196, 51, NULL, NULL, NULL, NULL, NULL),
(701, 'FPSAU1800002', 'DE003', 'Pastelito de Pollo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 196, 51, NULL, NULL, NULL, NULL, NULL),
(702, 'FPSAU1800003', 'DE001', 'Pastelito de Queso - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 196, 51, NULL, NULL, NULL, NULL, NULL),
(703, 'FPSAU8600008', 'FPSAU8600008', 'Piz. Pers. New York', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 59, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(704, 'FPSAU8600003', 'FPSAU8600003', 'Beb. Pers. Naranja', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(705, 'FPSAU8600004', 'FPSAU8600004', 'Beb. Pers. Pepsi', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(706, 'FPSAU8600005', 'FPSAU8600005', 'Beb. Pers. Te Lipton Durazno', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(707, 'FPSAU8600007', 'FPSAU8600007', 'Piz. Pers. Millan', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 59, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(708, 'FPSAU8600002', 'FPSAU8600002', 'Beb. Pers. Kolita', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(709, 'FPSAU8600001', 'FPSAU8600001', 'Beb. Pers. 7UP', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(710, 'FPSAU8600009', 'FPSAU8600009', 'Piz. Prueba', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(711, 'FPSAU8600006', 'FPSAU8600006', 'Beb. Pers. Te Lipton Limon', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 241, 51, NULL, NULL, NULL, NULL, NULL),
(712, 'FPSAU6900009', 'FPSAU6900009', 'Beb. Pers. Te Lipton Limon - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 242, 51, NULL, NULL, NULL, NULL, NULL),
(713, 'FPSAU6900004', 'FPSAU6900004', 'Beb. Pers. 7UP - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 242, 51, NULL, NULL, NULL, NULL, NULL),
(714, 'FPSAU6900003', 'FPSAU6900003', 'Piz. Prueba - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 242, 51, NULL, NULL, NULL, NULL, NULL),
(715, 'FPSAU6900008', 'FPSAU6900008', 'Beb. Pers. Te Lipton Durazno - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 242, 51, NULL, NULL, NULL, NULL, NULL),
(716, 'FPSAU6900002', 'FPSAU6900002', 'Piz. Pers. Millan  - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 59, 67, 63, 242, 51, NULL, NULL, NULL, NULL, NULL),
(717, 'FPSAU6900001', 'FPSAU6900001', 'Piz. Pers. New York  - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 59, 67, 63, 242, 51, NULL, NULL, NULL, NULL, NULL),
(718, 'FPSAU6900005', 'FPSAU6900005', 'Beb. Pers. Kolita - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 242, 51, NULL, NULL, NULL, NULL, NULL),
(719, 'FPSAU6900006', 'FPSAU6900006', 'Beb. Pers. Naranja - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 242, 51, NULL, NULL, NULL, NULL, NULL),
(720, 'FPSAU6900007', 'FPSAU6900007', 'Beb. Pers. Pepsi - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 63, 67, 242, 51, NULL, NULL, NULL, NULL, NULL),
(721, 'FPSAU2000010', 'BEB36', 'Bebida Personal Te Lipton Durazno - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(722, 'FPSAU2000009', 'BEB33', 'Bebida Personal Pepsi - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(723, 'FPSAU2000008', 'BEB34', 'Bebida Personal Naranja - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(724, 'FPSAU2000007', 'BEB31', 'Bebida Personal Kolita - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(725, 'FPSAU2000006', 'BEB32', 'Bebida Personal 7UP - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(726, 'FPSAU2000005', '160008', 'Piz. Prueba - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(727, 'FPSAU2000004', '160007', 'Piz. Pers. New York 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 59, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(728, 'FPSAU2000003', '160006', 'Piz. Pers. Full Tradicional 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 59, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(729, 'FPSAU2000002', '160005', 'Piz. Pers. Full Tocineta 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 59, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(730, 'FPSAU2000001', '160003', 'Piz. Pers. Full Pepperoni 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 59, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(731, 'FPSAU2000011', 'BEB35', 'Bebida Personal Te Lipton Limon - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 243, 51, NULL, NULL, NULL, NULL, NULL),
(732, 'FPSAU8700009', 'FPSAU8700009', 'Piz. Venecia 12', '0.00', '0.0000', '24.07', '17.81', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(733, 'FPSAU8700006', 'FPSAU8700006', 'Piz. New York 12', '0.00', '0.0000', '21.54', '15.94', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(734, 'FPSAU8700008', 'FPSAU8700008', 'Piz. Vegana 12', '0.00', '0.0000', '35.64', '26.36', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(735, 'FPSAU8700007', 'FPSAU8700007', 'Piz. Tradicional 12', '0.00', '0.0000', '17.09', '12.64', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(736, 'FPSAU8700003', 'FPSAU8700003', 'Piz. Junior 12', '0.00', '0.0000', '22.96', '16.98', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(737, 'FPSAU8700002', 'FPSAU8700002', 'Piz. Del Chef 12', '0.00', '0.0000', '35.64', '26.36', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(738, 'FPSAU8700005', 'FPSAU8700005', 'Piz. Millan 12', '0.00', '0.0000', '22.96', '16.98', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(739, 'FPSAU8700001', 'FPSAU8700001', 'Piz. De Caza 12', '0.00', '0.0000', '35.64', '26.36', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(740, 'FPSAU8700004', 'FPSAU8700004', 'Piz. Manhattan 12', '0.00', '0.0000', '35.64', '26.36', 0, 0, 0, 54, 63, 67, 197, 51, NULL, NULL, NULL, NULL, NULL),
(741, 'FPSAU7200007', 'FPSAU7200007', 'Piz. Tradicional 12 - NM', '0.00', '0.0000', '4616.07', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(742, 'FPSAU7200001', 'FPSAU7200001', 'Piz. De Caza 12 - NM', '0.00', '0.0000', '9625.00', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(743, 'FPSAU7200002', 'FPSAU7200002', 'Piz. Del Chef 12 - NM', '0.00', '0.0000', '9625.00', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(744, 'FPSAU7200003', 'FPSAU7200003', 'Piz. Junior 12 - NM', '0.00', '0.0000', '6187.40', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(745, 'FPSAU7200004', 'FPSAU7200004', 'Piz. Manhattan 12 - NM', '0.00', '0.0000', '9625.00', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(746, 'FPSAU7200006', 'FPSAU7200006', 'Piz. New York 12 - NM', '0.00', '0.0000', '5794.64', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(747, 'FPSAU7200008', 'FPSAU7200008', 'Piz. Vegana 12 - NM', '0.00', '0.0000', '9625.00', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(748, 'FPSAU7200009', 'FPSAU7200009', 'Piz. Venecia 12 - NM', '0.00', '0.0000', '6482.14', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(749, 'FPSAU7200005', 'FPSAU7200005', 'Piz. Millan 12 - NM', '0.00', '0.0000', '6187.40', '-1.00', 1, 0, 0, 54, 67, 63, 198, 51, NULL, NULL, NULL, NULL, NULL),
(750, 'FPSAU8800005', 'FPSAU8800005', 'Piz. Millan 16 ', '0.00', '0.0000', '34.69', '25.66', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(751, 'FPSAU8800001', 'FPSAU8800001', 'Piz. De Caza 16 ', '0.00', '0.0000', '44.49', '32.90', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(752, 'FPSAU8800008', 'FPSAU8800008', 'Piz. Vegana 16 ', '0.00', '0.0000', '44.49', '32.90', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(753, 'FPSAU8800007', 'FPSAU8800007', 'Piz. Tradicional 16 ', '0.00', '0.0000', '26.56', '19.64', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(754, 'FPSAU8800006', 'FPSAU8800006', 'Piz. New York 16 ', '0.00', '0.0000', '31.96', '23.64', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(755, 'FPSAU8800004', 'FPSAU8800004', 'Piz. Manhattan 16 ', '0.00', '0.0000', '44.49', '32.90', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(756, 'FPSAU8800009', 'FPSAU8800009', 'Piz. Venecia 16 ', '0.00', '0.0000', '35.68', '26.39', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(757, 'FPSAU8800003', 'FPSAU8800003', 'Piz. Junior 16 ', '0.00', '0.0000', '34.69', '25.66', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(758, 'FPSAU8800002', 'FPSAU8800002', 'Piz. Del Chef 16 ', '0.00', '0.0000', '44.49', '32.90', 0, 0, 0, 54, 63, 67, 199, 51, NULL, NULL, NULL, NULL, NULL),
(759, 'FPSAU7300008', 'FPSAU7300008', 'Piz. Vegana 16 - NM', '0.00', '0.0000', '11982.14', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(760, 'FPSAU7300007', 'FPSAU7300007', 'Piz. Tradicional 16 - NM', '0.00', '0.0000', '7169.64', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(761, 'FPSAU7300004', 'FPSAU7300004', 'Piz. Manhattan 16 - NM', '0.00', '0.0000', '11982.14', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(762, 'FPSAU7300003', 'FPSAU7300003', 'Piz. Junior 16 - NM', '0.00', '0.0000', '9330.35', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(763, 'FPSAU7300002', 'FPSAU7300002', 'Piz. Del Chef 16 - NM', '0.00', '0.0000', '11982.14', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(764, 'FPSAU7300001', 'FPSAU7300001', 'Piz. De Caza 16 - NM', '0.00', '0.0000', '11982.14', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(765, 'FPSAU7300006', 'FPSAU7300006', 'Piz. New York 16 - NM', '0.00', '0.0000', '8642.85', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(766, 'FPSAU7300009', 'FPSAU7300009', 'Piz. Venecia 16 - NM', '0.00', '0.0000', '9625.00', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(767, 'FPSAU7300005', 'FPSAU7300005', 'Piz. Millan 16 - NM', '0.00', '0.0000', '9330.35', '-1.00', 1, 0, 0, 54, 67, 63, 200, 51, NULL, NULL, NULL, NULL, NULL),
(768, 'FPSAU8900001', 'FPSAU8900001', 'Piz. De Caza 7 ', '0.00', '0.0000', '5.89', '5.83', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(769, 'FPSAU8900003', 'FPSAU8900003', 'Piz. Junior 7 ', '0.00', '0.0000', '5.24', '4.32', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(770, 'FPSAU8900004', 'FPSAU8900004', 'Piz. Manhattan 7 ', '0.00', '0.0000', '5.54', '5.16', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(771, 'FPSAU8900005', 'FPSAU8900005', 'Piz. Millan 7 ', '0.00', '0.0000', '5.24', '4.32', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(772, 'FPSAU8900006', 'FPSAU8900006', 'Piz. New York 7 ', '0.00', '0.0000', '4.25', '3.73', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(773, 'FPSAU8900007', 'FPSAU8900007', 'Piz. Tradicional 7 ', '0.00', '0.0000', '3.49', '3.34', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(774, 'FPSAU8900008', 'FPSAU8900008', 'Piz. Vegana 7 ', '0.00', '0.0000', '5.89', '5.83', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(775, 'FPSAU8900009', 'FPSAU8900009', 'Piz. Venecia 7 ', '0.00', '0.0000', '5.45', '4.55', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(776, 'FPSAU8900002', 'FPSAU8900002', 'Piz. Del Chef 7', '0.00', '0.0000', '5.54', '5.16', 0, 0, 0, 54, 63, 67, 201, 51, NULL, NULL, NULL, NULL, NULL),
(777, 'FPSAU7000004', 'FPSAU7000004', 'Piz. Manhattan 7 - NM', '0.00', '0.0000', '1866.07', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(778, 'FPSAU7000008', 'FPSAU7000008', 'Piz. Vegana 7 - NM', '0.00', '0.0000', '2111.60', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(779, 'FPSAU7000002', 'FPSAU7000002', 'Piz. Del Chef 7 - NM', '0.00', '0.0000', '1866.07', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(780, 'FPSAU7000009', 'FPSAU7000009', 'Piz. Venecia 7 - NM', '0.00', '0.0000', '1669.64', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(781, 'FPSAU7000007', 'FPSAU7000007', 'Piz. Tradicional 7 - NM', '0.00', '0.0000', '1227.67', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(782, 'FPSAU7000006', 'FPSAU7000006', 'Piz. New York 7 - NM', '0.00', '0.0000', '1374.99', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(783, 'FPSAU7000005', 'FPSAU7000005', 'Piz. Millan 7 - NM', '0.00', '0.0000', '1571.42', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(784, 'FPSAU7000003', 'FPSAU7000003', 'Piz. Junior 7 - NM', '0.00', '0.0000', '1571.42', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(785, 'FPSAU7000001', 'FPSAU7000001', 'Piz. De Caza 7 - NM', '0.00', '0.0000', '2111.60', '-1.00', 1, 0, 0, 54, 67, 63, 202, 51, NULL, NULL, NULL, NULL, NULL),
(786, 'FPSAU2200008', 'PIZ1', 'Piz. Tradicional 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 203, 51, NULL, NULL, NULL, NULL, NULL),
(787, 'FPSAU2200005', 'PIZ10', 'Piz. Full Vegetariana 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 203, 51, NULL, NULL, NULL, NULL, NULL),
(788, 'FPSAU2200007', 'PIZ3', 'Piz. New York 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 203, 51, NULL, NULL, NULL, NULL, NULL),
(789, 'FPSAU2200003', 'PIZ6', 'Piz. Full Pollo Guisado 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 203, 51, NULL, NULL, NULL, NULL, NULL),
(790, 'FPSAU2200001', 'PIZ2', 'Piz. Full Maiz  8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 203, 51, NULL, NULL, NULL, NULL, NULL),
(791, 'FPSAU2200004', 'PIZ4', 'Piz. Full Tocineta 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 203, 51, NULL, NULL, NULL, NULL, NULL),
(792, 'FPSAU2200002', 'PIZ5', 'Piz. Full Pepperoni 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 203, 51, NULL, NULL, NULL, NULL, NULL),
(793, 'FPSAU2200006', 'PIZ11', 'Piz. Manhattan 8 - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 203, 51, NULL, NULL, NULL, NULL, NULL),
(794, 'FPSAU9000007', 'FPSAU9000007', 'Piz. Tradicional 9 ', '0.00', '0.0000', '8.63', '6.38', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(795, 'FPSAU9000009', 'FPSAU9000009', 'Piz. Venecia 9', '0.00', '0.0000', '12.02', '8.89', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(796, 'FPSAU9000008', 'FPSAU9000008', 'Piz. Vegana 9 ', '0.00', '0.0000', '14.37', '10.64', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(797, 'FPSAU9000006', 'FPSAU9000006', 'Piz. New York 9 ', '0.00', '0.0000', '10.75', '7.96', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(798, 'FPSAU9000005', 'FPSAU9000005', 'Piz. Millan 9 ', '0.00', '0.0000', '10.89', '8.05', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(799, 'FPSAU9000004', 'FPSAU9000004', 'Piz. Manhattan 9 ', '0.00', '0.0000', '14.37', '10.64', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(800, 'FPSAU9000003', 'FPSAU9000003', 'Piz. Junior 9 ', '0.00', '0.0000', '10.89', '8.05', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(801, 'FPSAU9000001', 'FPSAU9000001', 'Piz. De Caza 9 ', '0.00', '0.0000', '14.37', '10.64', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(802, 'FPSAU9000002', 'FPSAU9000002', 'Piz. Del Chef 9 ', '0.00', '0.0000', '14.37', '10.64', 0, 0, 0, 54, 63, 67, 204, 51, NULL, NULL, NULL, NULL, NULL),
(803, 'FPSAU7100007', 'FPSAU7100007', 'Piz. Tradicional 9 - NM', '0.00', '0.0000', '2357.14', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(804, 'FPSAU7100002', 'FPSAU7100002', 'Piz. Del Chef 9 - NM', '0.00', '0.0000', '3879.46', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(805, 'FPSAU7100003', 'FPSAU7100003', 'Piz. Junior 9 - NM', '0.00', '0.0000', '2946.42', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(806, 'FPSAU7100004', 'FPSAU7100004', 'Piz. Manhattan 9 - NM', '0.00', '0.0000', '3879.46', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(807, 'FPSAU7100006', 'FPSAU7100006', 'Piz. New York 9 - NM', '0.00', '0.0000', '2897.32', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(808, 'FPSAU7100008', 'FPSAU7100008', 'Piz. Vegana 9 - NM', '0.00', '0.0000', '3879.46', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(809, 'FPSAU7100009', 'FPSAU7100009', 'Piz. Venecia 9 - NM', '0.00', '0.0000', '3241.07', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(810, 'FPSAU7100001', 'FPSAU7100001', 'Piz. De Caza 9 - NM', '0.00', '0.0000', '3879.46', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(811, 'FPSAU7100005', 'FPSAU7100005', 'Piz. Millan 9 - NM', '0.00', '0.0000', '2946.42', '-1.00', 1, 0, 0, 54, 67, 63, 205, 51, NULL, NULL, NULL, NULL, NULL),
(812, 'FPSAU2500003', 'PIZ48', 'Piz. Full Pollo G. Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 206, 51, NULL, NULL, NULL, NULL, NULL),
(813, 'FPSAU2500008', 'PIZ39', 'Piz.Manhatan Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 206, 51, NULL, NULL, NULL, NULL, NULL),
(814, 'FPSAU2500007', 'PIZ38', 'Piz. Tradicional Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 206, 51, NULL, NULL, NULL, NULL, NULL),
(815, 'FPSAU2500006', 'PIZ42', 'Piz. New York Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 206, 51, NULL, NULL, NULL, NULL, NULL),
(816, 'FPSAU2500004', 'PIZ44', 'Piz. Full Tocineta Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 206, 51, NULL, NULL, NULL, NULL, NULL),
(817, 'FPSAU2500002', 'PIZ43', 'Piz. Full Pepperoni Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 206, 51, NULL, NULL, NULL, NULL, NULL),
(818, 'FPSAU2500001', 'PIZ15', 'Piz. Full Maiz Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 206, 51, NULL, NULL, NULL, NULL, NULL),
(819, 'FPSAU2500005', 'PIZ41', 'Piz. Full Vegetariana Gde - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 206, 51, NULL, NULL, NULL, NULL, NULL),
(820, 'FPSAU2700003', 'PIZ37', 'Piz. Full Pollo Guisado Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 207, 51, NULL, NULL, NULL, NULL, NULL),
(821, 'FPSAU2700008', 'PIZ27', 'Piz. Tradicional Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 207, 51, NULL, NULL, NULL, NULL, NULL),
(822, 'FPSAU2700007', 'PIZ31', 'Piz. New York Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 207, 51, NULL, NULL, NULL, NULL, NULL),
(823, 'FPSAU2700006', 'PIZ28', 'Piz. Manhathan Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 207, 51, NULL, NULL, NULL, NULL, NULL),
(824, 'FPSAU2700004', 'PIZ33', 'Piz. Full Tocineta Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 207, 51, NULL, NULL, NULL, NULL, NULL),
(825, 'FPSAU2700002', 'PIZ32', 'Piz. Full Pepperoni Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 207, 51, NULL, NULL, NULL, NULL, NULL),
(826, 'FPSAU2700001', 'PIZ14', 'Piz. Full Maiz Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 207, 51, NULL, NULL, NULL, NULL, NULL),
(827, 'FPSAU2700005', 'PIZ30', 'Piz. Full Vegetariana Med - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 207, 51, NULL, NULL, NULL, NULL, NULL),
(828, 'FPSAU3000001', 'PIZ13', 'Piz. Full Maiz Peq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 244, 51, NULL, NULL, NULL, NULL, NULL),
(829, 'FPSAU3000007', 'PIZ20', 'Piz. New York Peq - T', '0.00', '0.0000', '8.10', '7.96', 1, 0, 0, 54, 67, 63, 244, 51, NULL, NULL, NULL, NULL, NULL),
(830, 'FPSAU3000006', 'PIZ17', 'Piz. Manhattan Peq - T', '0.00', '0.0000', '10.83', '10.64', 1, 0, 0, 54, 67, 63, 244, 51, NULL, NULL, NULL, NULL, NULL),
(831, 'FPSAU3000005', 'PIZ19', 'Piz. Full Vegetariana Pq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 244, 51, NULL, NULL, NULL, NULL, NULL),
(832, 'FPSAU3000008', 'PIZ16', 'Piz. Tradicional Peq - T', '0.00', '0.0000', '6.50', '6.38', 1, 0, 0, 54, 67, 63, 244, 51, NULL, NULL, NULL, NULL, NULL),
(833, 'FPSAU3000004', 'PIZ22', 'Piz. Full Tocineta Peq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 244, 51, NULL, NULL, NULL, NULL, NULL),
(834, 'FPSAU3000003', 'PIZ26', 'Piz. Full Pollo Guisado Peq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 244, 51, NULL, NULL, NULL, NULL, NULL),
(835, 'FPSAU3000002', 'PIZ21', 'Piz. Full Pepperoni Peq - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 244, 51, NULL, NULL, NULL, NULL, NULL),
(836, 'FPSAU9100002', 'FPSAU9100002', 'Gelatina ', '0.00', '0.0000', '1.05', '1.23', 1, 0, 0, 54, 67, 63, 208, 51, NULL, NULL, NULL, NULL, NULL),
(837, 'FPSAU9100003', 'FPSAU9100003', 'Mini-Brownie ', '0.00', '0.0000', '1.90', '1.33', 0, 0, 0, 54, 63, 67, 208, 51, NULL, NULL, NULL, NULL, NULL),
(839, 'FPSAU7900003', 'FPSAU7900003', 'Quesillo de coco - NM', '0.00', '0.0000', '1129.46', '-1.00', 1, 0, 0, 54, 67, 63, 209, 51, NULL, NULL, NULL, NULL, NULL),
(840, 'FPSAU7900004', 'FPSAU7900004', 'Brownie - NM', '0.00', '0.0000', '883.92', '-1.00', 1, 0, 0, 54, 67, 63, 209, 51, NULL, NULL, NULL, NULL, NULL),
(841, 'FPSAU7900005', 'FPSAU7900005', 'Mini-Brownie - NM', '0.00', '0.0000', '456.69', '-1.00', 1, 0, 0, 54, 67, 63, 209, 51, NULL, NULL, NULL, NULL, NULL),
(842, 'FPSAU7900001', 'FPSAU7900001', 'Quesillo - NM', '0.00', '0.0000', '1129.46', '-1.00', 1, 0, 0, 54, 67, 63, 209, 51, NULL, NULL, NULL, NULL, NULL),
(843, 'FPSAU7900006', 'FPSAU7900006', 'Gelatina - NM', '0.00', '0.0000', '687.49', '-1.00', 1, 0, 0, 54, 67, 63, 209, 51, NULL, NULL, NULL, NULL, NULL),
(844, 'FPSAU7900002', 'FPSAU7900002', 'Quesillo de chocolate - NM', '0.00', '0.0000', '1522.32', '-1.00', 1, 0, 0, 54, 67, 63, 209, 51, NULL, NULL, NULL, NULL, NULL),
(845, 'FPSAU3100003', 'POS6', 'Quesillo de coco - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 210, 51, NULL, NULL, NULL, NULL, NULL),
(846, 'FPSAU3100002', 'POS7', 'Quesillo de chocolate - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 210, 51, NULL, NULL, NULL, NULL, NULL),
(847, 'FPSAU3100001', 'POS4', 'Quesillo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 210, 51, NULL, NULL, NULL, NULL, NULL),
(848, 'FPSBU3200001', 'BEB30', '7up bomba 600ml - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 235, 51, NULL, NULL, NULL, NULL, NULL),
(849, 'FPSBU3200002', 'BEB28', 'Kolita Bomba 600ml - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 235, 51, NULL, NULL, NULL, NULL, NULL),
(850, 'FPSBU3200003', 'BEB29', 'Naranja Bomba 600ml - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 235, 51, NULL, NULL, NULL, NULL, NULL),
(851, 'FPSBU3200004', 'BEB27', 'Pepsi Bomba 600ml - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 235, 51, NULL, NULL, NULL, NULL, NULL),
(852, 'FPSAU9200003', 'FPSAU9200003', 'Agua Mineral 330 ml ', '0.00', '0.0000', '7.85', '-1.00', 1, 0, 0, 54, 67, 63, 236, 51, NULL, NULL, NULL, NULL, NULL),
(853, 'FPSAU9200002', 'FPSAU9200002', 'Agua 600 ml ', '0.00', '0.0000', '58.92', '-1.00', 1, 0, 0, 54, 67, 63, 236, 51, NULL, NULL, NULL, NULL, NULL),
(854, 'FPSAU9200001', 'FPSAU9200001', '7 Up Ligth Lata ', '0.00', '0.0000', '4.80', '4.71', 0, 0, 0, 54, 67, 63, 236, 51, NULL, NULL, NULL, NULL, NULL),
(855, 'FPSAU9200004', 'FPSAU9200004', 'Pepsi Ligth Lata ', '0.00', '0.0000', '4.80', '4.71', 0, 0, 0, 54, 67, 63, 236, 51, NULL, NULL, NULL, NULL, NULL),
(856, 'FPSAU7400004', 'FPSAU7400004', 'Pepsi Ligth Lata - NM', '0.00', '0.0000', '2651.78', '-1.00', 1, 0, 0, 54, 67, 63, 237, 51, NULL, NULL, NULL, NULL, NULL),
(857, 'FPSAU7400001', 'FPSAU7400001', '7 Up Ligth Lata - NM', '0.00', '0.0000', '2651.78', '-1.00', 1, 0, 0, 54, 67, 63, 237, 51, NULL, NULL, NULL, NULL, NULL),
(858, 'FPSAU7400002', 'FPSAU7400002', 'Agua 600 ml - NM', '0.00', '0.0000', '58.93', '-1.00', 1, 0, 0, 54, 67, 63, 237, 51, NULL, NULL, NULL, NULL, NULL),
(859, 'FPSAU7400003', 'FPSAU7400003', 'Agua Mineral 330 ml - NM', '0.00', '0.0000', '7.86', '-1.00', 1, 0, 0, 54, 67, 63, 237, 51, NULL, NULL, NULL, NULL, NULL),
(860, 'FPSBU3300003', 'BEB21', 'Agua Mineral - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 238, 51, NULL, NULL, NULL, NULL, NULL),
(861, 'FPSBU3300002', 'BEB26', 'Agua 600 ml - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 238, 51, NULL, NULL, NULL, NULL, NULL),
(862, 'FPSBU3300004', 'BEB23', 'Pepsi Ligth Lata - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 238, 51, NULL, NULL, NULL, NULL, NULL),
(863, 'FPSBU3300001', 'BEB24', '7 Up Ligth Lata - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 238, 51, NULL, NULL, NULL, NULL, NULL),
(864, 'FPSAU9300008', 'FPSAU9300008', 'Sin Jamon de Pierna 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(865, 'FPSAU9300005', 'FPSAU9300005', 'Sin Anchoas 12', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(866, 'FPSAU9300004', 'FPSAU9300004', 'Sin Ajonjoli 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(867, 'FPSAU9300003', 'FPSAU9300003', 'Sin Ajo Porro 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(868, 'FPSAU9300006', 'FPSAU9300006', 'Sin Cebollin 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(869, 'FPSAU9300007', 'FPSAU9300007', 'Sin Champinones 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(870, 'FPSAU9300002', 'FPSAU9300002', 'Sin Aceitunas 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(871, 'FPSAU9300013', 'FPSAU9300013', 'Sin Salchichon 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(872, 'FPSAU9300001', 'FPSAU9300001', 'Sin  Maiz 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(873, 'FPSAU9300010', 'FPSAU9300010', 'Sin Pepperoni 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(874, 'FPSAU9300011', 'FPSAU9300011', 'Sin Pimenton 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(875, 'FPSAU9300009', 'FPSAU9300009', 'Sin Oregano 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(876, 'FPSAU9300014', 'FPSAU9300014', 'Sin Salsa Para Pizza 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(877, 'FPSAU9300015', 'FPSAU9300015', 'Sin Tocineta 12 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(878, 'FPSAU9300012', 'FPSAU9300012', 'Sin Q. Mozzarella 12', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 211, 51, NULL, NULL, NULL, NULL, NULL),
(879, 'FPSAU7700001', 'FPSAU7700001', 'Sin Aceitunas 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(880, 'FPSAU7700006', 'FPSAU7700006', 'Sin  Maiz 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(881, 'FPSAU7700005', 'FPSAU7700005', 'Sin Jamon de Pierna 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(882, 'FPSAU7700015', 'FPSAU7700015', 'Sin Ajo Porro 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(883, 'FPSAU7700002', 'FPSAU7700002', 'Sin Anchoas 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(884, 'FPSAU7700012', 'FPSAU7700012', 'Sin Tocineta 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(885, 'FPSAU7700014', 'FPSAU7700014', 'Sin Ajonjoli 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(886, 'FPSAU7700013', 'FPSAU7700013', 'Sin Oregano 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(887, 'FPSAU7700003', 'FPSAU7700003', 'Sin Cebollin 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(888, 'FPSAU7700009', 'FPSAU7700009', 'Sin Q. Mozzarella 12 -NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(889, 'FPSAU7700004', 'FPSAU7700004', 'Sin Champinones 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(890, 'FPSAU7700007', 'FPSAU7700007', 'Sin Pepperoni 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(891, 'FPSAU7700010', 'FPSAU7700010', 'Sin Salchichon 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(892, 'FPSAU7700011', 'FPSAU7700011', 'Sin Salsa Para Pizza 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(893, 'FPSAU7700008', 'FPSAU7700008', 'Sin Pimenton 12 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 212, 51, NULL, NULL, NULL, NULL, NULL),
(894, 'FPSAU9400004', 'FPSAU9400004', 'Sin Ajonjoli 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(895, 'FPSAU9400003', 'FPSAU9400003', 'Sin Ajo Porro 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(896, 'FPSAU9400011', 'FPSAU9400011', 'Sin Pimenton 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(897, 'FPSAU9400005', 'FPSAU9400005', 'Sin Anchoas 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(898, 'FPSAU9400010', 'FPSAU9400010', 'Sin Pepperoni 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(899, 'FPSAU9400002', 'FPSAU9400002', 'Sin Aceitunas 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(900, 'FPSAU9400001', 'FPSAU9400001', 'Sin  Maiz 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(901, 'FPSAU9400008', 'FPSAU9400008', 'Sin Jamon de Pierna 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(902, 'FPSAU9400009', 'FPSAU9400009', 'Sin Oregano 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(903, 'FPSAU9400006', 'FPSAU9400006', 'Sin Cebollin 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(904, 'FPSAU9400007', 'FPSAU9400007', 'Sin Champinones 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(905, 'FPSAU9400012', 'FPSAU9400012', 'Sin Q. Mozzarella 16', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(906, 'FPSAU9400013', 'FPSAU9400013', 'Sin Salchichon 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(907, 'FPSAU9400014', 'FPSAU9400014', 'Sin Salsa Para Pizza 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(908, 'FPSAU9400015', 'FPSAU9400015', 'Sin Tocineta 16 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 213, 51, NULL, NULL, NULL, NULL, NULL),
(909, 'FPSAU7800001', 'FPSAU7800001', 'Sin Aceitunas 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(910, 'FPSAU7800006', 'FPSAU7800006', 'Sin  Maiz 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(911, 'FPSAU7800002', 'FPSAU7800002', 'Sin Anchoas 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(912, 'FPSAU7800007', 'FPSAU7800007', 'Sin Pepperoni 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(913, 'FPSAU7800008', 'FPSAU7800008', 'Sin Pimenton 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(914, 'FPSAU7800009', 'FPSAU7800009', 'Sin Q. Mozzarella 16 -NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(915, 'FPSAU7800003', 'FPSAU7800003', 'Sin Cebollin 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(916, 'FPSAU7800013', 'FPSAU7800013', 'Sin Oregano 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(917, 'FPSAU7800011', 'FPSAU7800011', 'Sin Salsa Para Pizza 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(918, 'FPSAU7800014', 'FPSAU7800014', 'Sin Ajonjoli 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(919, 'FPSAU7800012', 'FPSAU7800012', 'Sin Tocineta 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(920, 'FPSAU7800004', 'FPSAU7800004', 'Sin Champinones 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(921, 'FPSAU7800015', 'FPSAU7800015', 'Sin Ajo Porro 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(922, 'FPSAU7800005', 'FPSAU7800005', 'Sin Jamon de Pierna 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(923, 'FPSAU7800010', 'FPSAU7800010', 'Sin Salchichon 16 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 214, 51, NULL, NULL, NULL, NULL, NULL),
(924, 'FPSAU9500012', 'FPSAU9500012', 'Sin Q. Mozzarella 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(925, 'FPSAU9500011', 'FPSAU9500011', 'Sin Pimenton 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(926, 'FPSAU9500007', 'FPSAU9500007', 'Sin Champinones 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(927, 'FPSAU9500006', 'FPSAU9500006', 'Sin Cebollin 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(928, 'FPSAU9500005', 'FPSAU9500005', 'Sin Anchoas 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(929, 'FPSAU9500004', 'FPSAU9500004', 'Sin Ajonjoli  7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(930, 'FPSAU9500003', 'FPSAU9500003', 'Sin Ajo Porro  7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(931, 'FPSAU9500002', 'FPSAU9500002', 'Sin Aceitunas 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(932, 'FPSAU9500001', 'FPSAU9500001', 'Sin  Maiz 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(933, 'FPSAU9500014', 'FPSAU9500014', 'Sin Salsa Para Pizza 7', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(934, 'FPSAU9500010', 'FPSAU9500010', 'Sin Pepperoni 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(935, 'FPSAU9500008', 'FPSAU9500008', 'Sin Jamon de Pierna 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(936, 'FPSAU9500013', 'FPSAU9500013', 'Sin Salchichon 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(937, 'FPSAU9500015', 'FPSAU9500015', 'Sin Tocineta 7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(938, 'FPSAU9500009', 'FPSAU9500009', 'Sin Oregano  7 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 215, 51, NULL, NULL, NULL, NULL, NULL),
(939, 'FPSAU7500010', 'FPSAU7500010', 'Sin Salchichon 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(940, 'FPSAU7500002', 'FPSAU7500002', 'Sin Anchoas 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(941, 'FPSAU7500001', 'FPSAU7500001', 'Sin Aceitunas 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(942, 'FPSAU7500014', 'FPSAU7500014', 'Sin Ajo Porro  7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(943, 'FPSAU7500015', 'FPSAU7500015', 'Sin Ajonjoli  7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(944, 'FPSAU7500013', 'FPSAU7500013', 'Sin Oregano  7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(945, 'FPSAU7500003', 'FPSAU7500003', 'Sin Cebollin 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(946, 'FPSAU7500004', 'FPSAU7500004', 'Sin Champinones 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(947, 'FPSAU7500005', 'FPSAU7500005', 'Sin Jamon de Pierna 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(948, 'FPSAU7500007', 'FPSAU7500007', 'Sin Pepperoni 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(949, 'FPSAU7500012', 'FPSAU7500012', 'Sin Tocineta 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(950, 'FPSAU7500011', 'FPSAU7500011', 'Sin Salsa Para Pizza 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(951, 'FPSAU7500008', 'FPSAU7500008', 'Sin Pimenton 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(952, 'FPSAU7500009', 'FPSAU7500009', 'Sin Q. Mozzarella 7 -NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(953, 'FPSAU7500006', 'FPSAU7500006', 'Sin  Maiz 7 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 216, 51, NULL, NULL, NULL, NULL, NULL),
(954, 'FPSAU3500009', 'SAP1', '-Pimenton 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(955, 'FPSAU3500002', 'SAP2', '-Cebolla 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(956, 'FPSAU3500003', 'SAP3', '-Champiñon 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(957, 'FPSAU3500004', 'SAP4', '-Jamon de Pierna 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(958, 'FPSAU3500005', 'SAP6', '-Maiz 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(959, 'FPSAU3500006', 'SAP8', '-Mozzarella 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(960, 'FPSAU3500007', 'SAP15', '-Oregano 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(961, 'FPSAU3500001', 'SAP7', '-Aceituna 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(962, 'FPSAU3500008', 'SAP9', '-Peperoni 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(963, 'FPSAU3500010', 'SAP14', '-Pollo Guisado 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(964, 'FPSAU3500011', 'SAP16', '-Salsa 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(965, 'FPSAU3500012', 'SAP10', '-Tocineta 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(966, 'FPSAU3500013', 'FPSAU3500013', '-Parmesano 8 - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 217, 51, NULL, NULL, NULL, NULL, NULL),
(967, 'FPSAU9600004', 'FPSAU9600004', 'Sin Ajonjoli  9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(968, 'FPSAU9600001', 'FPSAU9600001', 'Sin  Maiz 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(969, 'FPSAU9600015', 'FPSAU9600015', 'Sin Tocineta 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(970, 'FPSAU9600003', 'FPSAU9600003', 'Sin Ajo Porro  9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(971, 'FPSAU9600005', 'FPSAU9600005', 'Sin Anchoas 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(972, 'FPSAU9600006', 'FPSAU9600006', 'Sin Cebollin 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(973, 'FPSAU9600007', 'FPSAU9600007', 'Sin Champinones 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(974, 'FPSAU9600008', 'FPSAU9600008', 'Sin Jamon de Pierna 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(975, 'FPSAU9600009', 'FPSAU9600009', 'Sin Oregano  9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(976, 'FPSAU9600010', 'FPSAU9600010', 'Sin Pepperoni 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(977, 'FPSAU9600011', 'FPSAU9600011', 'Sin Pimenton 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(978, 'FPSAU9600012', 'FPSAU9600012', 'Sin Q. Mozzarella 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(979, 'FPSAU9600013', 'FPSAU9600013', 'Sin Salchichon 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(980, 'FPSAU9600014', 'FPSAU9600014', 'Sin Salsa Para Pizza 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(981, 'FPSAU9600002', 'FPSAU9600002', 'Sin Aceitunas 9 ', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(982, 'FPSAU7600003', 'FPSAU7600003', 'Sin Cebollin 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 218, 51, NULL, NULL, NULL, NULL, NULL),
(983, 'FPSAU7600006', 'FPSAU7600006', 'Sin  Maiz 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(984, 'FPSAU7600015', 'FPSAU7600015', 'Sin Ajonjoli  9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(985, 'FPSAU7600005', 'FPSAU7600005', 'Sin Jamon de Pierna 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(986, 'FPSAU7600001', 'FPSAU7600001', 'Sin Aceitunas 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(987, 'FPSAU7600004', 'FPSAU7600004', 'Sin Champinones 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(988, 'FPSAU7600007', 'FPSAU7600007', 'Sin Pepperoni 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(989, 'FPSAU7600008', 'FPSAU7600008', 'Sin Pimenton 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(990, 'FPSAU7600009', 'FPSAU7600009', 'Sin Q. Mozzarella 9 -NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(991, 'FPSAU7600010', 'FPSAU7600010', 'Sin Salchichon 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(992, 'FPSAU7600011', 'FPSAU7600011', 'Sin Salsa Para Pizza 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(993, 'FPSAU7600012', 'FPSAU7600012', 'Sin Tocineta 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(994, 'FPSAU7600013', 'FPSAU7600013', 'Sin Oregano  9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(995, 'FPSAU7600014', 'FPSAU7600014', 'Sin Ajo Porro  9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(996, 'FPSAU7600002', 'FPSAU7600002', 'Sin Anchoas 9 - NM', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 219, 51, NULL, NULL, NULL, NULL, NULL),
(997, 'FPSAU3700003', 'SAP53', '-Champiñon Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(998, 'FPSAU3700009', 'SAP60', '-Peperoni Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(999, 'FPSAU3700013', 'SAP61', '-Tocineta Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1000, 'FPSAU3700012', 'SAP36', '-Salsa Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1001, 'FPSAU3700011', 'SAP65', '-Pollo Guisado Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1002, 'FPSAU3700010', 'SAP51', '-Pimenton Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1003, 'FPSAU3700008', 'SAP55', '-Parmesano Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1004, 'FPSAU3700007', 'SAP35', '-Oregano Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1005, 'FPSAU3700006', 'SAP59', '-Mozzarella Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1006, 'FPSAU3700004', 'SAP54', '-J.Pierna Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `receta_id`) VALUES
(1007, 'FPSAU3700002', 'SAP52', '-Cebolla Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1008, 'FPSAU3700001', 'SAP58', '-Aceituna Gde', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1009, 'FPSAU3700005', 'SAP57', '-Maiz Gde - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 220, 51, NULL, NULL, NULL, NULL, NULL),
(1010, 'FPSAU3900008', 'SAP45', '-Peperoni Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1011, 'FPSAU3900003', 'SAP39', '-Champiñon Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1012, 'FPSAU3900012', 'SAP46', '-Tocineta Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1013, 'FPSAU3900011', 'SAP34', '-Salsa Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1014, 'FPSAU3900010', 'SAP50', '-Pollo G. Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1015, 'FPSAU3900009', 'SAP37', '-Pimenton Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1016, 'FPSAU3900007', 'SAP33', '-Oregano Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1017, 'FPSAU3900006', 'SAP44', '-Mozzarella Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1018, 'FPSAU3900004', 'SAP40', '-J.Pierna Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1019, 'FPSAU3900002', 'SAP38', '-Cebolla Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1020, 'FPSAU3900001', 'SAP43', '-Aceituna Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1021, 'FPSAU3900005', 'SAP42', '-Maiz Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1022, 'FPSAU3900013', 'FPSAU3900013', '-Parmesano Med - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 221, 51, NULL, NULL, NULL, NULL, NULL),
(1023, 'FPSAU4100007', 'SAP31', '-Oregano Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1024, 'FPSAU4100012', 'SAP26', '-Tocineta Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1025, 'FPSAU4100011', 'SAP32', '-Salsa Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1026, 'FPSAU4100010', 'SAP30', '-Pollo Guisado Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1027, 'FPSAU4100009', 'SAP17', '-Pimenton Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1028, 'FPSAU4100013', 'FPSAU4100013', '-Parmesano Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1029, 'FPSAU4100006', 'SAP24', '-Mozzarella Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1030, 'FPSAU4100005', 'SAP22', '-Maiz Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1031, 'FPSAU4100004', 'SAP20', '-Jamon de Pierna Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1032, 'FPSAU4100003', 'SAP19', '-Champiñon Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1033, 'FPSAU4100002', 'SAP18', '-Cebolla Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1034, 'FPSAU4100001', 'SAP23', '-Aceituna Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1035, 'FPSAU4100008', 'SAP25', '-Peperoni Peq - T', '0.00', '0.0000', '0.00', '-1.00', 0, 0, 0, 54, 67, 63, 222, 51, NULL, NULL, NULL, NULL, NULL),
(1036, 'FPCAU4200001', '250001', 'Tipo Plumita - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 223, 51, NULL, NULL, NULL, NULL, NULL),
(1037, 'FPCAU4200002', '250002', 'Tipo Tornillo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 223, 51, NULL, NULL, NULL, NULL, NULL),
(1038, 'FPCAU4200003', '250003', 'Tipo Vermicelli - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 223, 51, NULL, NULL, NULL, NULL, NULL),
(1039, 'FPSAU4300001', 'W001', 'Wrap Cesar con Pollo - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 224, 51, NULL, NULL, NULL, NULL, NULL),
(1040, 'FPSAU4300002', 'W002', 'Wrap Club House - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 224, 51, NULL, NULL, NULL, NULL, NULL),
(1041, 'FPSAU4300003', 'W005', 'Wrap Ligero - T', '0.00', '0.0000', '0.00', '-1.00', 1, 0, 0, 54, 67, 63, 224, 51, NULL, NULL, NULL, NULL, NULL),
(1044, '432342', '', 'Producto Prueba', '10.00', '0.0000', '12.00', '13.00', 0, 0, 0, 54, 63, 67, 98, 83, NULL, NULL, NULL, NULL, NULL),
(1045, 'MUSBU0100006', 'MU010012', 'REFRESCO DE LATA', '9.48', '0.0000', '4000.00', '3928.57', 0, 0, 0, 54, 63, 67, 249, 86, NULL, NULL, NULL, NULL, NULL),
(1046, 'MUSBU0100005', 'MU010013', 'REFRESCO BOMBA 600 ML', '10.26', '0.0000', '4500.00', '4419.64', 0, 0, 0, 54, 63, 67, 249, 86, NULL, NULL, NULL, NULL, NULL),
(1047, 'MUSBU0100008', 'MU010014', 'TE LIPTON 600 ML', '9.85', '0.0000', '4500.00', '4419.64', 0, 0, 0, 54, 63, 67, 249, 86, NULL, NULL, NULL, NULL, NULL),
(1048, 'MUSBU0300002', 'MU070001', 'CAFE GRANDE', '1.26', '0.0000', '1900.00', '1866.07', 0, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1049, 'MUSBU0300003', 'MU070002', 'CAFE PEQUENO', '1.70', '0.0000', '1400.00', '1375.00', 0, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1050, 'MUSAU0400001', 'MU020002', 'CANOLI', '12.33', '0.0000', '6500.00', '6383.93', 0, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1051, 'MUSAU0500001', 'MU020003', 'CHEESECAKE DE AREQUIPE', '22.31', '0.0000', '7.50', '7.37', 1, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1052, 'MUSAU0500002', 'MU020004', 'CHESSECAKE DE FRESA', '22.31', '0.0000', '7.50', '7.37', 1, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1053, 'MUSAU0500003', 'MU020005 ', 'CHESSECAKE DE OREO', '22.31', '0.0000', '7.50', '7.37', 1, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1054, 'MUSAU0500004', 'MU020006', 'ENS. FRUTAS', '18.07', '0.0000', '2.20', '2160.71', 0, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1055, 'MUSAU0500006', 'MU020007', 'PROFITEROL.', '12.83', '0.0000', '6500.00', '6383.93', 0, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1056, 'MUSAU0500011', 'MU020008', 'TARTALETA DE LIMON', '11.33', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1057, 'MUSAU0500010', 'MU020009', 'TARTALETA  DE PARCHITA', '11.33', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1058, 'MUSAU0500008', 'MU020011', 'QUESILLO DE COCO', '14.50', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1059, 'MUSAU0500007', 'MU020010', 'QUESILLO DE CHOCOLATE', '13.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1060, 'MUSAU0800001', 'MU030002', 'YOGURT CASERO', '8.77', '0.0000', '5200.00', '5107.15', 0, 0, 0, 54, 63, 67, 251, 86, NULL, NULL, NULL, NULL, NULL),
(1061, 'MUSAU0400002', 'MU040003', 'MUFFIN DE CAMBUR', '9.62', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1062, 'MUSAU0400003', 'MU040004', 'MUFFIN DE CHOCOLATE', '9.62', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1063, 'MUSAU0400005', 'MU040006', 'PALITO DE MANZANA', '12.81', '0.0000', '6500.00', '6383.93', 0, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1064, 'MUSAU0400004', 'MU040005', 'MUFFIN DE ZANAHORIA', '9.62', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1065, 'MUSAU0400006', 'MU040007', 'PIE DE CIRUELA', '14.62', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1066, 'MUSAU0400007', 'MU040008', 'PIE DE MANZANA', '13.12', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1067, 'MUSAU0700002', 'MU060002', 'DONAS', '10.81', '0.0000', '4500.00', '4419.65', 0, 0, 0, 54, 63, 67, 255, 86, NULL, NULL, NULL, NULL, NULL),
(1068, 'MUSAU0700004', 'MU060004', 'GRANOLA', '4.50', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 255, 86, NULL, NULL, NULL, NULL, NULL),
(1069, 'MUSBU0100004', 'MU010018', 'MALTA', '0.00', '0.0000', '3200.00', '3142.36', 0, 0, 0, 54, 63, 67, 249, 86, NULL, NULL, NULL, NULL, NULL),
(1070, 'MUSBU0300004', 'MU070003', 'CAPUCHINO AMERICANO (GDE)', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1071, 'MUSBU0300005', 'MU070004', 'CAPUCHINO ITALIANO (GDE)', '0.00', '0.0000', '2000.00', '1964.28', 1, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1072, 'MUSBU0300007', 'MU070005', 'MOCACCINO AMERICANO (GDE)', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1073, 'MUSBU0300008', 'MU070006', 'MOCACCINO ITALIANO (GDE)', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1074, 'MUSBU0300001', 'MU070007', 'CAFE DOBLE', '0.00', '0.0000', '2400.00', '2357.14', 1, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1075, 'MUSBU0100002', 'MU010019', 'BEBIDA ENERGIZANTE BURN', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 249, 86, NULL, NULL, NULL, NULL, NULL),
(1076, 'MUSAP0700005', 'MU060008', 'PASTA SECA POR KILO', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 68, 255, 86, NULL, NULL, NULL, NULL, NULL),
(1077, 'MUSAP0700003', 'MU060009', 'GALLETERIA POR KILO', '0.00', '0.0000', '65.00', '58.03', 0, 0, 0, 54, 63, 68, 255, 86, NULL, NULL, NULL, NULL, NULL),
(1078, 'MUSBU0300006', 'MU070008', 'MANZANILLA', '0.00', '0.0000', '600.00', '589.28', 1, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1079, 'MUSAU0500009', 'MU020012', 'QUESILLO DE TRADICIONAL', '9.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1080, 'MUSAU0400008', 'MU040010', 'TORTAS', '0.00', '0.0000', '7500.00', '7366.07', 0, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1081, 'MUSAU0700001', 'MU060010', 'CANAPES', '0.00', '0.0000', '55.00', '49.11', 0, 0, 0, 54, 63, 68, 255, 86, NULL, NULL, NULL, NULL, NULL),
(1082, 'MUSAU0700006', 'MU060011', 'PASTELES', '0.00', '0.0000', '6500.00', '6383.93', 0, 0, 0, 54, 63, 67, 255, 86, NULL, NULL, NULL, NULL, NULL),
(1083, 'MUSAU0600001', 'MU090001', 'ENSALADAS', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 257, 86, NULL, NULL, NULL, NULL, NULL),
(1084, 'MUSBU0100003', 'MU010020', 'JUGOS DEL VALLE', '0.00', '0.0000', '4000.00', '3928.57', 0, 0, 0, 54, 63, 67, 249, 86, NULL, NULL, NULL, NULL, NULL),
(1085, 'MUSAU0500005', 'MU020013', 'MILHOJA', '0.00', '0.0000', '6500.00', '6383.93', 0, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1086, 'MUSBU0100007', 'MU010021', 'SHAKE IT', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 249, 86, NULL, NULL, NULL, NULL, NULL),
(1087, 'MUSBU0100001', 'MU010022', 'BEBIDA ENERGETICA', '0.00', '0.0000', '3000.00', '2946.42', 1, 0, 0, 54, 63, 67, 249, 86, NULL, NULL, NULL, NULL, NULL),
(1088, 'MUSAU0200001', 'MU100001', 'BOMBONES 6 UND', '0.00', '0.0000', '1890.00', '1856.25', 0, 0, 0, 54, 63, 67, 258, 86, NULL, NULL, NULL, NULL, NULL),
(1089, 'MUSAU0400009', 'MUSAU0400009', 'MUFFIN', '0.00', '0.0000', '3000.00', '2946.43', 0, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1090, 'MUSAU0400009', 'MUSAU0400009', 'PIE (RACION)', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1091, 'MUSAU0500012', 'MUSAU0500012', 'CHEESECAKE (RACION)', '0.00', '0.0000', '7500.00', '7366.07', 0, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1092, 'MUSAU0500013', 'MUSAU0500013', 'TARTALETA', '0.00', '0.0000', '6500.00', '6383.93', 0, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1093, 'MUSAU0500014', 'MUSAU0500014', 'GELATINA', '0.00', '0.0000', '2500.00', '2455.35', 0, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1094, 'MUSAU0700007', 'MUSAU0700007', 'CACHITO (PASTORA)', '0.00', '0.0000', '3500.00', '3437.50', 0, 0, 0, 54, 63, 67, 255, 86, NULL, NULL, NULL, NULL, NULL),
(1095, 'MUSAU0700008', 'MUSAU0700008', 'PASTEL DE HOJALDRE (PASTORA)', '0.00', '0.0000', '3500.00', '3437.50', 0, 0, 0, 54, 63, 67, 255, 86, NULL, NULL, NULL, NULL, NULL),
(1096, 'MUSAU0500015', 'MUSAU0500015', 'QUESILLOS', '0.00', '0.0000', '3800.00', '3732.14', 0, 0, 0, 54, 63, 67, 253, 86, NULL, NULL, NULL, NULL, NULL),
(1097, 'MUSBU0300009', 'MUSBU0300009', 'INFUSIONES', '0.00', '0.0000', '1000.00', '982.15', 0, 0, 0, 54, 63, 67, 252, 86, NULL, NULL, NULL, NULL, NULL),
(1098, 'MUSAU0400010', 'MUSAU0400010', 'BROWNIE', '0.00', '0.0000', '4500.00', '4419.65', 0, 0, 0, 54, 63, 67, 254, 86, NULL, NULL, NULL, NULL, NULL),
(1099, 'PLSAU1100001', 'PLK09001', 'Pizza 1 + Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 264, 155, NULL, NULL, NULL, NULL, NULL),
(1102, 'PLSAU1400001', 'PLK08001', 'Para Llevar Pizza 16 - B', '21.00', '0.0000', '40.00', '38.93', 0, 0, 0, 54, 63, 67, 267, 155, NULL, NULL, NULL, NULL, NULL),
(1103, 'PLSAU1500001', 'PLK04006', 'Pastel de Carne - B', '9.00', '0.0000', '1.00', '982.00', 1, 0, 0, 54, 63, 67, 260, 155, NULL, NULL, NULL, NULL, NULL),
(1104, 'PLSAU1500002', 'PLK04007', 'Pastel de Pollo - B', '9.00', '0.0000', '1.00', '982.00', 1, 0, 0, 54, 63, 67, 260, 155, NULL, NULL, NULL, NULL, NULL),
(1105, 'PLSAU1500003', 'PLK04005', 'Pastel de Queso - B', '9.00', '0.0000', '1.00', '982.00', 1, 0, 0, 54, 63, 67, 260, 155, NULL, NULL, NULL, NULL, NULL),
(1106, 'PLSAU1600001', 'PLK02001', 'Pizza 1 - B', '48.00', '0.0000', '19.80', '19.45', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1107, 'PLSAU1600002', 'PLK02002', 'Pizza 2 - B', '52.00', '0.0000', '17.50', '17.19', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1108, 'PLSAU1600003', 'PLK02003', 'Pizza 3 - B', '52.00', '0.0000', '17.50', '17.19', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1109, 'PLSAU1600004', 'PLK02004', 'Pizza 4 - B', '59.00', '0.0000', '17.50', '17.19', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1110, 'PLSAU1600005', 'PLK02005', 'Pizza 5 - B', '54.00', '0.0000', '17.50', '17.19', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1111, 'PLSAU1600006', 'PLK02006', 'Pizza 6 - B', '55.00', '0.0000', '17.50', '17.19', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1112, 'PLSAU1600007', 'PLK02007', 'Pizza 7 - B', '55.00', '0.0000', '17.50', '17.19', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1113, 'PLSAU1700003', 'PLSAU1700003', 'Slice 16 - C', '8.00', '0.0000', '32.50', '31.63', 0, 0, 0, 54, 63, 67, 262, 155, NULL, NULL, NULL, NULL, NULL),
(1114, 'PLSAU1700004', 'PLSAU1700004', 'Pizzas Cuadradas - C', '0.00', '0.0000', '2.50', '1.70', 0, 0, 0, 54, 63, 67, 262, 155, NULL, NULL, NULL, NULL, NULL),
(1115, 'PLSAU2200002', 'PLSAU2200002', 'Mini-Brownie - C', '0.00', '0.0000', '1.90', '1.28', 1, 0, 0, 54, 63, 67, 263, 155, NULL, NULL, NULL, NULL, NULL),
(1116, 'PLSBU1000001', 'PLK03001', 'Agua Mineral 300Ml - B', '3.00', '0.0000', '200.00', '196.00', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1117, 'PLSBU1000002', 'PLK03005', 'Agua Mineral 600Ml - B', '0.00', '0.0000', '350.00', '343.00', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1118, 'PLSBU1000003', 'PLK03002', 'Malta - B', '7.00', '0.0000', '1.50', '1.47', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1119, 'PLSBU1000004', 'PLK03003', 'Refresco - B', '6.00', '0.0000', '2.00', '1.96', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1120, 'PLSBU1000005', 'PLK03004', 'Te 12 Oz - B', '3.00', '0.0000', '2.00', '1.96', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1121, 'PLSBU1000006', 'PLSBU1000006', 'Refresco 1,5 Lt - B', '0.00', '0.0000', '1.63', '1.60', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1122, 'PLSBU1000007', 'PLSBU1000007', 'Jugo de Naranja - B', '0.00', '0.0000', '1.00', '982.00', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1123, 'PLSBU1000008', 'PLSBU1000008', 'Infusiones - B', '0.00', '0.0000', '390.00', '383.00', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1124, 'PLSAU1200001', 'PLK01001', 'Combo 1 Slice - B', '134.00', '0.0000', '1.69', '1.66', 1, 0, 0, 54, 63, 67, 265, 155, NULL, NULL, NULL, NULL, NULL),
(1125, 'PLSAU1200002', 'PLK01002', 'Combo 2 Slices - B', '17.00', '0.0000', '2.78', '2.73', 1, 0, 0, 54, 63, 67, 265, 155, NULL, NULL, NULL, NULL, NULL),
(1126, 'PLSAU1100002', 'PLK09002', 'Pizza 2  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 264, 155, NULL, NULL, NULL, NULL, NULL),
(1127, 'PLSAU1100003', 'PLK09003', 'Pizza 3  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 264, 155, NULL, NULL, NULL, NULL, NULL),
(1128, 'PLSAU1100004', 'PLK09004', 'Pizza 4  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 264, 155, NULL, NULL, NULL, NULL, NULL),
(1129, 'PLSAU1100005', 'PLK09005', 'Pizza 5  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 264, 155, NULL, NULL, NULL, NULL, NULL),
(1130, 'PLSAU1100006', 'PLK09006', 'Pizza 6  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 264, 155, NULL, NULL, NULL, NULL, NULL),
(1131, 'PLSAU1100007', 'PLK09007', 'Pizza 7  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 264, 155, NULL, NULL, NULL, NULL, NULL),
(1132, 'PLSAU1100001', 'PLK09001', 'Pizza 1 + Refresco 1,5 Lt - B', '0.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 273, 156, NULL, NULL, NULL, NULL, NULL),
(1133, 'PLSAU1300001', 'PLK06002', 'Refresco Personal - B', '6.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 275, 156, NULL, NULL, NULL, NULL, NULL),
(1134, 'PLSAU1300002', 'PLK06001', 'Slice 16 - B Personal', '8.00', '0.0000', '0.00', '10.00', 1, 0, 0, 54, 63, 67, 275, 156, NULL, NULL, NULL, NULL, NULL),
(1135, 'PLSAU1400001', 'PLK08001', 'Para Llevar Pizza 16 - B', '21.00', '0.0000', '45.00', '43.79', 0, 0, 0, 54, 63, 67, 276, 156, NULL, NULL, NULL, NULL, NULL),
(1136, 'PLSAU1500001', 'PLK04006', 'Pastel de Carne - B', '9.00', '0.0000', '12.00', '11.68', 1, 0, 0, 54, 63, 67, 269, 156, NULL, NULL, NULL, NULL, NULL),
(1137, 'PLSAU1500002', 'PLK04007', 'Pastel de Pollo - B', '9.00', '0.0000', '11.50', '11.19', 1, 0, 0, 54, 63, 67, 269, 156, NULL, NULL, NULL, NULL, NULL),
(1138, 'PLSAU1500003', 'PLK04005', 'Pastel de Queso - B', '9.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 269, 156, NULL, NULL, NULL, NULL, NULL),
(1139, 'PLSAU1600001', 'PLK02001', 'Pizza 1 - B', '48.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 270, 156, NULL, NULL, NULL, NULL, NULL),
(1140, 'PLSAU1600002', 'PLK02002', 'Pizza 2 - B', '52.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 270, 156, NULL, NULL, NULL, NULL, NULL),
(1141, 'PLSAU1600003', 'PLK02003', 'Pizza 3 - B', '52.00', '0.0000', '195.00', '189.78', 1, 0, 0, 54, 63, 67, 270, 156, NULL, NULL, NULL, NULL, NULL),
(1142, 'PLSAU1600004', 'PLK02004', 'Pizza 4 - B', '59.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 270, 156, NULL, NULL, NULL, NULL, NULL),
(1143, 'PLSAU1600005', 'PLK02005', 'Pizza 5 - B', '54.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 270, 156, NULL, NULL, NULL, NULL, NULL),
(1144, 'PLSAU1600006', 'PLK02006', 'Pizza 6 - B', '55.00', '0.0000', '25.00', '24.55', 1, 0, 0, 54, 63, 67, 270, 156, NULL, NULL, NULL, NULL, NULL),
(1145, 'PLSAU1600007', 'PLK02007', 'Pizza 7 - B', '55.00', '0.0000', '25.00', '24.55', 1, 0, 0, 54, 63, 67, 270, 156, NULL, NULL, NULL, NULL, NULL),
(1146, 'PLSAU1700001', 'PLSAU1700002', 'Slice 16 - B', '8.00', '0.0000', '33.90', '32.99', 0, 0, 0, 54, 63, 67, 271, 156, NULL, NULL, NULL, NULL, NULL),
(1147, 'PLSAU1700002', 'PLSAU1700002', 'Pizzas Cuadradas - B', '0.00', '0.0000', '3.30', '3.21', 1, 0, 0, 54, 63, 67, 271, 156, NULL, NULL, NULL, NULL, NULL),
(1148, 'PLSAU2100001', 'PLSAU1700002', 'Mini-Brownie - B', '0.00', '0.0000', '1.90', '1.28', 1, 0, 0, 54, 63, 67, 272, 156, NULL, NULL, NULL, NULL, NULL),
(1149, 'PLSBU1000001', 'PLK03001', 'Agua Mineral 300Ml - B', '3.00', '0.0000', '200.00', '196.00', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(1150, 'PLSBU1000002', 'PLK03005', 'Agua Mineral 600Ml - B', '0.00', '0.0000', '350.00', '343.00', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(1151, 'PLSBU1000003', 'PLK03002', 'Malta - B', '7.00', '0.0000', '1.50', '1.47', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(1152, 'PLSBU1000004', 'PLK03003', 'Refresco - B', '6.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(1153, 'PLSBU1000005', 'PLK03004', 'Te 12 Oz - B', '3.00', '0.0000', '2.00', '1.96', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(1154, 'PLSBU1000006', 'PLSBU1000006', 'Refresco 1,5 Lt - B', '0.00', '0.0000', '1.63', '1.60', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(1155, 'PLSBU1000007', 'PLSBU1000007', 'Jugo de Naranja - B', '0.00', '0.0000', '1.30', '1.23', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(1156, 'PLSBU1000008', 'PLSBU1000008', 'Infusiones - B', '0.00', '0.0000', '390.00', '383.00', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(1157, 'PLSAU1200001', 'PLK01001', 'Combo 1 Slice - B', '134.00', '0.0000', '1.69', '1.66', 1, 0, 0, 54, 63, 67, 274, 156, NULL, NULL, NULL, NULL, NULL),
(1158, 'PLSAU1200002', 'PLK01002', 'Combo 2 Slices - B', '17.00', '0.0000', '2.78', '2.73', 1, 0, 0, 54, 63, 67, 274, 156, NULL, NULL, NULL, NULL, NULL),
(1159, 'PLSAU1100002', 'PLK09002', 'Pizza 2  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 273, 156, NULL, NULL, NULL, NULL, NULL),
(1160, 'PLSAU1100003', 'PLK09003', 'Pizza 3  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 273, 156, NULL, NULL, NULL, NULL, NULL),
(1161, 'PLSAU1100004', 'PLK09004', 'Pizza 4  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 273, 156, NULL, NULL, NULL, NULL, NULL),
(1162, 'PLSAU1100005', 'PLK09005', 'Pizza 5  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 273, 156, NULL, NULL, NULL, NULL, NULL),
(1163, 'PLSAU1100006', 'PLK09006', 'Pizza 6  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 273, 156, NULL, NULL, NULL, NULL, NULL),
(1164, 'PLSAU1100007', 'PLK09007', 'Pizza 7  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 273, 156, NULL, NULL, NULL, NULL, NULL),
(1165, 'FPSAU0100001', '170013', 'Adic. Aceite de Oliva 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1166, 'FPSAU0100002', '170001', 'Adic. Aceitunas Verdes 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1167, 'FPSAU0100003', '170002', 'Adic. Aji Picante 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1168, 'FPSAU0100004', '170015', 'Adic. Anchoas 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1169, 'FPSAU0100005', '170007', 'Adic. Cebolla 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1170, 'FPSAU0100006', '170003', 'Adic. Cebollin 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1171, 'FPSAU0100007', '170019', 'Adic. Champinones 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1172, 'FPSAU0100008', '170004', 'Adic. Guisantes 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1173, 'FPSAU0100009', '170017', 'Adic. Jamon de Pierna 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1174, 'FPSAU0100010', '170016', 'Adic. Maiz 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1175, 'FPSAU0100011', '170008', 'Adic. Pepperoni 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1176, 'FPSAU0100012', '170014', 'Adic. Pimenton 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1177, 'FPSAU0100013', '170009', 'Adic. Pollo Guisado 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1178, 'FPSAU0100014', '170012', 'Adic. Queso Mozzarella 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1179, 'FPSAU0100015', '170011', 'Adic. Queso Parmesano 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1180, 'FPSAU0100016', '170005', 'Adic. Salchicha Romana 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1181, 'FPSAU0100017', '170006', 'Adic. Salchicha Viena 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1182, 'FPSAU0100018', '170010', 'Adic. Salchichon 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1183, 'FPSAU0100019', '170018', 'Adic. Tocineta 8 - R', '0.00', '0.0000', '1120.00', '1100.00', 1, 0, 0, 54, 63, 67, 145, 52, NULL, NULL, NULL, NULL, NULL),
(1184, 'FPSAU0300001', '180007', 'Adic. Aceite de Oliva Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1185, 'FPSAU0300002', '180001', 'Adic. Aceitunas Verdes Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1186, 'FPSAU0300003', '180002', 'Adic. Aji Picante Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1187, 'FPSAU0300004', '180008', 'Adic. Anchoas Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1188, 'FPSAU0300005', '180010', 'Adic. Cebolla Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1189, 'FPSAU0300006', '180003', 'Adic. Cebollin Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1190, 'FPSAU0300007', '180011', 'Adic. Champinones Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1191, 'FPSAU0300008', '180004', 'Adic. Guisantes Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1192, 'FPSAU0300009', '180012', 'Adic. Jamon de Pierna Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1193, 'FPSAU0300010', '180014', 'Adic. Maiz Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1194, 'FPSAU0300011', '180016', 'Adic. Pepperoni Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1195, 'FPSAU0300012', '180009', 'Adic. Pimenton Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1196, 'FPSAU0300013', '180018', 'Adic. Pollo Guisado Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1197, 'FPSAU0300014', '180015', 'Adic. Queso Mozzarella Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1198, 'FPSAU0300015', '180013', 'Adic. Queso Parmesano Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1199, 'FPSAU0300016', '180005', 'Adic. Salchicha Romana Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1200, 'FPSAU0300017', '180006', 'Adic. Salchicha Viena Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1201, 'FPSAU0300018', '180019', 'Adic. Salchichon Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1202, 'FPSAU0300019', '180017', 'Adic. Tocineta Gde - R', '0.00', '0.0000', '2820.00', '2769.64', 1, 0, 0, 54, 63, 67, 146, 52, NULL, NULL, NULL, NULL, NULL),
(1203, 'FPSAU0500001', '190007', 'Adic. Aceite de Oliva Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1204, 'FPSAU0500002', '190001', 'Adic. Aceitunas Verdes Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1205, 'FPSAU0500003', '190002', 'Adic. Aji Picante Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1206, 'FPSAU0500004', '190008', 'Adic. Anchoas Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1207, 'FPSAU0500005', '190010', 'Adic. Cebolla Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1208, 'FPSAU0500006', '190003', 'Adic. Cebollin Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1209, 'FPSAU0500007', '190011', 'Adic. Champinones Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1210, 'FPSAU0500008', '190004', 'Adic. Guisantes Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1211, 'FPSAU0500009', '190012', 'Adic. Jamon de Pierna Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1212, 'FPSAU0500010', '190014', 'Adic. Maiz Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1213, 'FPSAU0500011', '190016', 'Adic. Pepperoni Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1214, 'FPSAU0500012', '190009', 'Adic. Pimenton Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1215, 'FPSAU0500013', '190018', 'Adic. Pollo Guisado Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1216, 'FPSAU0500014', '190015', 'Adic. Queso Mozzarella Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1217, 'FPSAU0500015', '190013', 'Adic. Queso Parmesano Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1218, 'FPSAU0500016', '190005', 'Adic. Salchicha Romana Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1219, 'FPSAU0500017', '190006', 'Adic. Salchicha Viena Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1220, 'FPSAU0500018', '190019', 'Adic. Salchichon Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1221, 'FPSAU0500019', '190017', 'Adic. Tocineta Med - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 147, 52, NULL, NULL, NULL, NULL, NULL),
(1222, 'FPSAU0700001', '200007', 'Adic. Aceite de Oliva Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1223, 'FPSAU0700002', '200001', 'Adic. Aceitunas Verdes Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1224, 'FPSAU0700003', '200002', 'Adic. Aji Picante Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1225, 'FPSAU0700004', '200008', 'Adic. Anchoas Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1226, 'FPSAU0700005', '200010', 'Adic. Cebolla Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1227, 'FPSAU0700006', '200003', 'Adic. Cebollin Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1228, 'FPSAU0700007', '200011', 'Adic. Champinones Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1229, 'FPSAU0700008', '200004', 'Adic. Guisamtes Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1230, 'FPSAU0700009', '200012', 'Adic. Jamon de Pierna Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1231, 'FPSAU0700010', '200014', 'Adic. Maiz Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1232, 'FPSAU0700011', '200016', 'Adic. Pepperoni Peq- R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1233, 'FPSAU0700012', '200009', 'Adic. Pimenton Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1234, 'FPSAU0700013', '200018', 'Adic. Pollo Guisado Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1235, 'FPSAU0700014', '200015', 'Adic. Queso Mozzarella Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1236, 'FPSAU0700015', '200013', 'Adic. Queso Parmesano Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1237, 'FPSAU0700016', '200005', 'Adic. Salchicha Romana Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1238, 'FPSAU0700017', '200006', 'Adic. Salchicha Viena Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1239, 'FPSAU0700018', '200019', 'Adic. Salchichon Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1240, 'FPSAU0700019', '200017', 'Adic. Tocineta Peq - R', '0.00', '0.0000', '1350.00', '1325.89', 1, 0, 0, 54, 63, 67, 148, 52, NULL, NULL, NULL, NULL, NULL),
(1241, 'FPSBU4800001', 'FPSBU0900001', '7 UP 32oz Gde - R', '0.00', '0.0000', '1030.00', '1011.61', 1, 0, 0, 54, 63, 67, 149, 52, NULL, NULL, NULL, NULL, NULL),
(1242, 'FPSBU4800002', 'FPSBU0900002', 'Kolita 32oz Gde - R', '0.00', '0.0000', '1030.00', '1011.61', 1, 0, 0, 54, 63, 67, 149, 52, NULL, NULL, NULL, NULL, NULL),
(1243, 'FPSBU4800003', 'FPSBU0900003', 'Naranja 32oz Gde - R', '0.00', '0.0000', '1030.00', '1011.61', 1, 0, 0, 54, 63, 67, 149, 52, NULL, NULL, NULL, NULL, NULL),
(1244, 'FPSBU4800004', 'FPSBU0900004', 'Pepsi Cola 32oz Gde - R', '0.00', '0.0000', '1030.00', '1011.61', 1, 0, 0, 54, 63, 67, 149, 52, NULL, NULL, NULL, NULL, NULL),
(1245, 'FPSBU4800005', 'FPSBU0900005', 'Poco/Hielo - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 149, 52, NULL, NULL, NULL, NULL, NULL),
(1246, 'FPSBU4800006', 'FPSBU0900006', 'Sin/Hielo - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 149, 52, NULL, NULL, NULL, NULL, NULL),
(1247, 'FPSBU4800007', 'FPSBU0900007', 'Te Lipton Durazno Gde - R', '0.00', '0.0000', '1030.00', '1011.61', 1, 0, 0, 54, 63, 67, 149, 52, NULL, NULL, NULL, NULL, NULL),
(1248, 'FPSBU4800008', 'FPSBU0900008', 'Te Lipton Limon Gde - R', '0.00', '0.0000', '1030.00', '1011.61', 1, 0, 0, 54, 63, 67, 149, 52, NULL, NULL, NULL, NULL, NULL),
(1249, 'FPSBU5100001', 'FPSBU5100001', 'Cafe Gde - R', '0.00', '0.0000', '480.00', '471.43', 1, 0, 0, 54, 63, 67, 150, 52, NULL, NULL, NULL, NULL, NULL),
(1250, 'FPSBU5100002', 'FPSBU5100002', 'Cafe Peq - R', '0.00', '0.0000', '330.00', '324.11', 1, 0, 0, 54, 63, 67, 150, 52, NULL, NULL, NULL, NULL, NULL),
(1251, 'FPSBU5200001', 'FPSBU5200001', 'Yukery Durazno - R', '0.00', '0.0000', '470.00', '461.61', 1, 0, 0, 54, 63, 67, 151, 52, NULL, NULL, NULL, NULL, NULL),
(1252, 'FPSBU5200002', 'FPSBU5200002', 'Yukery Mango - R', '0.00', '0.0000', '470.00', '461.61', 1, 0, 0, 54, 63, 67, 151, 52, NULL, NULL, NULL, NULL, NULL),
(1253, 'FPSBU5200003', 'FPSBU5200003', 'Yukery Manzana - R', '0.00', '0.0000', '470.00', '461.61', 1, 0, 0, 54, 63, 67, 151, 52, NULL, NULL, NULL, NULL, NULL),
(1254, 'FPSBU5200004', 'FPSBU5200004', 'Yukery Pera - R', '0.00', '0.0000', '470.00', '461.61', 1, 0, 0, 54, 63, 67, 151, 52, NULL, NULL, NULL, NULL, NULL),
(1255, 'FPSAU5300001', 'FPSAU5300005', 'Para Llevar Pizza 8 - R', '0.00', '0.0000', '130.00', '127.68', 1, 0, 0, 54, 63, 67, 152, 52, NULL, NULL, NULL, NULL, NULL),
(1256, 'FPSAU5300002', 'FPSAU5300006', 'Para Llevar Pizza PQ - R', '0.00', '0.0000', '130.00', '127.68', 1, 0, 0, 54, 63, 67, 152, 52, NULL, NULL, NULL, NULL, NULL),
(1257, 'FPSAU5300004', 'FPSAU5300004', 'Para Llevar Pz. Med - R', '0.00', '0.0000', '150.00', '147.32', 1, 0, 0, 54, 63, 67, 152, 52, NULL, NULL, NULL, NULL, NULL),
(1258, 'FPSAU5500001', 'FPSAU5500001', 'Piz. Pers. Full Junior 8 - R', '0.00', '0.0000', '0.01', '0.01', 1, 0, 0, 59, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1259, 'FPSAU5500002', 'FPSAU5500002', 'Piz. Pers. Full Mozzarella 8 - R', '0.00', '0.0000', '0.01', '0.01', 1, 0, 0, 59, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1260, 'FPSAU5500003', 'FPSAU5500003', 'Piz. Pers. Full Pepperoni 8 -R', '0.00', '0.0000', '0.01', '0.01', 1, 0, 0, 59, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1261, 'FPSAU5500004', 'FPSAU5500004', 'Piz. Prueba - R', '0.00', '0.0000', '0.01', '0.01', 1, 0, 0, 54, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1262, 'FPSAU2100001', '010042', 'Piz Romana 8 - R', '0.00', '0.0000', '3760.00', '3692.86', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1263, 'FPSAU2100002', '010044', 'Piz Variada 8 - R', '0.00', '0.0000', '3310.00', '3250.89', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1264, 'FPSAU2100003', '010039', 'Piz. de la Casa  8 - R', '0.00', '0.0000', '2210.00', '2170.54', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1265, 'FPSAU2100004', '010043', 'Piz. del Corral 8 - R', '0.00', '0.0000', '3060.00', '3005.36', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1266, 'FPSAU2100005', '010040', 'Piz. Full Clasica 8 - R', '0.00', '0.0000', '2180.00', '2141.07', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1267, 'FPSAU2100006', '010041', 'Piz. Full con Todo 8 - R', '0.00', '0.0000', '3600.00', '3535.71', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1268, 'FPSAU2100007', '010035', 'Piz. Full Jamon 8 - R', '0.00', '0.0000', '1890.00', '1856.25', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1269, 'FPSAU2100008', '010037', 'Piz. Full Junior 8 - R', '0.00', '0.0000', '2160.00', '2121.43', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1270, 'FPSAU2100009', '010034', 'Piz. Full Mozzarella 8 - R', '0.00', '0.0000', '1820.00', '1787.50', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1271, 'FPSAU2100010', '010036', 'Piz. Full Pepperoni 8 - R', '0.00', '0.0000', '2140.00', '2101.79', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1272, 'FPSAU2100011', '010045', 'Piz. Full Salad Light 8 - R', '0.00', '0.0000', '3410.00', '3349.11', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1273, 'FPSAU2100012', '010038', 'Piz. Salchipicante 8 - R', '0.00', '0.0000', '3370.00', '3309.82', 1, 0, 0, 54, 63, 67, 158, 52, NULL, NULL, NULL, NULL, NULL),
(1274, 'FPSAU2400001', '040042', 'Piz Romana Gde - R', '0.00', '0.0000', '10040.00', '9860.71', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1275, 'FPSAU2400002', '040039', 'Piz. de la Casa Gde - R', '0.00', '0.0000', '7420.00', '7287.50', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1276, 'FPSAU2400003', '040043', 'Piz. del Corral Gde  - R', '0.00', '0.0000', '8830.00', '8672.32', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1277, 'FPSAU2400004', '040040', 'Piz. Full Clasica Gde - R', '0.00', '0.0000', '7400.00', '7267.86', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1278, 'FPSAU2400005', '040041', 'Piz. Full con Todo Gde - R', '0.00', '0.0000', '9650.00', '9477.68', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1279, 'FPSAU2400006', '040035', 'Piz. Full Jamon Gde - R', '0.00', '0.0000', '6560.00', '6442.86', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1280, 'FPSAU2400007', '040037', 'Piz. Full Junior Gde - R', '0.00', '0.0000', '6710.00', '6590.18', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1281, 'FPSAU2400008', '040034', 'Piz. Full Mozzarella Gde - R', '0.00', '0.0000', '5210.00', '5116.96', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1282, 'FPSAU2400009', '040036', 'Piz. Full Pepperoni Gde - R', '0.00', '0.0000', '6640.00', '6521.43', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1283, 'FPSAU2400010', '040045', 'Piz. Full Salad Light Gde - R', '0.00', '0.0000', '9460.00', '9291.07', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1284, 'FPSAU2400011', '040038', 'Piz. Salchipicante Gde - R', '0.00', '0.0000', '9100.00', '8937.50', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1285, 'FPSAU2400012', '040044', 'Piz. Variada Gde - R', '0.00', '0.0000', '8910.00', '8750.89', 1, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1286, 'FPSAU2600001', '030039', 'Piz. de la Casa Med - R', '0.00', '0.0000', '4940.00', '4851.79', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1287, 'FPSAU2600002', '030043', 'Piz. del Corral Med - R', '0.00', '0.0000', '5520.00', '5421.43', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1288, 'FPSAU2600003', '030040', 'Piz. Full Clasica Med - R', '0.00', '0.0000', '4880.00', '4792.86', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1289, 'FPSAU2600004', '030041', 'Piz. Full con Todo Med - R', '0.00', '0.0000', '7380.00', '7248.21', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1290, 'FPSAU2600005', '030035', 'Piz. Full Jamon Med - R', '0.00', '0.0000', '4350.00', '4272.32', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1291, 'FPSAU2600006', '030037', 'Piz. Full Junior Med - R', '0.00', '0.0000', '4660.00', '4576.79', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1292, 'FPSAU2600007', '030034', 'Piz. Full Mozzarella Med - R', '0.00', '0.0000', '3760.00', '3692.86', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1293, 'FPSAU2600008', '030036', 'Piz. Full Pepperoni Med - R', '0.00', '0.0000', '4950.00', '4861.61', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1294, 'FPSAU2600009', '030045', 'Piz. Full Salad Light Med - R', '0.00', '0.0000', '7180.00', '7051.79', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1295, 'FPSAU2600010', '030042', 'Piz. Romana Med - R', '0.00', '0.0000', '7570.00', '7434.82', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1296, 'FPSAU2600011', '030038', 'Piz. Salchipicante Med - R', '0.00', '0.0000', '6630.00', '6511.61', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1297, 'FPSAU2600012', '030044', 'Piz. Variada Med - R', '0.00', '0.0000', '6570.00', '6452.68', 1, 0, 0, 54, 63, 67, 160, 52, NULL, NULL, NULL, NULL, NULL),
(1298, 'FPSAU2900002', '020036', 'Piz Full Pepperoni Peq - R', '0.00', '0.0000', '2500.00', '2455.36', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1299, 'FPSAU2900003', '020039', 'Piz. de la Casa Peq - R', '0.00', '0.0000', '2770.00', '2720.54', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1300, 'FPSAU2900004', '020043', 'Piz. del Corral Peq - R', '0.00', '0.0000', '3470.00', '3408.04', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1301, 'FPSAU2900005', '020040', 'Piz. Full Clasica Peq - R', '0.00', '0.0000', '2750.00', '2700.89', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1302, 'FPSAU2900006', '020041', 'Piz. Full con Todo Peq - R', '0.00', '0.0000', '4170.00', '4095.54', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1303, 'FPSAU2900007', '020035', 'Piz. Full Jamon Peq - R', '0.00', '0.0000', '2210.00', '2170.54', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1304, 'FPSAU2900008', '020037', 'Piz. Full Junior Peq - R', '0.00', '0.0000', '2360.00', '2317.86', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1305, 'FPSAU2900001', '020034', 'Piz. Full Mozzarella Peq - R', '0.00', '0.0000', '1890.00', '1856.25', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1306, 'FPSAU2900009', '020045', 'Piz. Full Salad Light Peq - R', '0.00', '0.0000', '3790.00', '3722.32', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1307, 'FPSAU2900010', '020042', 'Piz. Romana Peq - R', '0.00', '0.0000', '4350.00', '4272.32', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1308, 'FPSAU2900011', '020038', 'Piz. Salchipicante Peq - R', '0.00', '0.0000', '3560.00', '3496.43', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1309, 'FPSAU2900012', '020044', 'Piz. Variada Peq - R', '0.00', '0.0000', '3530.00', '3466.96', 1, 0, 0, 54, 63, 67, 161, 52, NULL, NULL, NULL, NULL, NULL),
(1310, 'FPSAU5600001', 'FPSAU6000001', 'Quesillo - R', '0.00', '0.0000', '1495.00', '1468.30', 1, 0, 0, 54, 63, 67, 162, 52, NULL, NULL, NULL, NULL, NULL),
(1311, 'FPSAU5600002', 'FPSAU6000002', 'Quesillo de chocolate - R', '0.00', '0.0000', '1495.00', '1468.30', 1, 0, 0, 54, 63, 67, 162, 52, NULL, NULL, NULL, NULL, NULL),
(1312, 'FPSAU5600003', 'FPSAU6000003', 'Quesillo de coco - R', '0.00', '0.0000', '1495.00', '1468.30', 1, 0, 0, 54, 63, 67, 162, 52, NULL, NULL, NULL, NULL, NULL),
(1313, 'FPSBU5700001', 'FPSBU5700001', '7up bomba 600ml - R', '0.00', '0.0000', '610.00', '599.11', 1, 0, 0, 54, 63, 67, 163, 52, NULL, NULL, NULL, NULL, NULL),
(1314, 'FPSBU5700002', 'FPSBU5700002', 'Kolita Bomba 600ml - R', '0.00', '0.0000', '610.00', '599.11', 1, 0, 0, 54, 63, 67, 163, 52, NULL, NULL, NULL, NULL, NULL),
(1315, 'FPSBU5700003', 'FPSBU5700003', 'Naranja Bomba 600ml - R', '0.00', '0.0000', '610.00', '599.11', 1, 0, 0, 54, 63, 67, 163, 52, NULL, NULL, NULL, NULL, NULL),
(1316, 'FPSBU5700004', 'FPSBU5700004', 'Pepsi Bomba 600ml - R', '0.00', '0.0000', '610.00', '599.11', 1, 0, 0, 54, 63, 67, 163, 52, NULL, NULL, NULL, NULL, NULL),
(1317, 'FPSBU5800002', 'FPSBU5800002', 'Agua 600 ml - R', '0.00', '0.0000', '350.00', '343.75', 1, 0, 0, 54, 63, 67, 164, 52, NULL, NULL, NULL, NULL, NULL),
(1318, 'FPSBU5800003', 'FPSBU5800003', 'Agua Mineral - R', '0.00', '0.0000', '200.00', '196.43', 1, 0, 0, 54, 63, 67, 164, 52, NULL, NULL, NULL, NULL, NULL),
(1319, 'FPSAU3400001', '260001', '-Aceitunas Verdes 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1320, 'FPSAU3400002', '260002', '-Aji Picante 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1321, 'FPSAU3400003', '260003', '-Albahaca 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1322, 'FPSAU3400004', '260004', '-Anchoas 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1323, 'FPSAU3400005', '260005', '-Cebolla 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1324, 'FPSAU3400006', '260006', '-Cebollin 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1325, 'FPSAU3400007', '260007', '-Champinones 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1326, 'FPSAU3400008', '260008', '-Guisantes 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1327, 'FPSAU3400009', '260009', '-Jamon de Pierna 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1328, 'FPSAU3400010', '260010', '-Maiz 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1329, 'FPSAU3400011', '260011', '-Oregano 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `receta_id`) VALUES
(1330, 'FPSAU3400012', '260012', '-Pepperoni 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1331, 'FPSAU3400013', '260013', '-Pimenton 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1332, 'FPSAU3400014', '260014', '-Pollo Guisado 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1333, 'FPSAU3400015', '260015', '-Q. Mozzarella 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1334, 'FPSAU3400016', '260016', '-Q. Parmesano 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1335, 'FPSAU3400017', '260017', '-Salchicha Romana 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1336, 'FPSAU3400018', '260018', '-Salchicha Viena 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1337, 'FPSAU3400019', '260019', '-Salsa Pizza 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1338, 'FPSAU3400020', '260020', '-Tocineta 8 - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 165, 52, NULL, NULL, NULL, NULL, NULL),
(1339, 'FPSAU3600001', '290001', '-Aceitunas Verdes Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1340, 'FPSAU3600002', '290002', '-Aji Picante Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1341, 'FPSAU3600003', '290003', '-Albahaca Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1342, 'FPSAU3600004', '290004', '-Anchoas Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1343, 'FPSAU3600005', '290005', '-Cebolla Gde GD - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1344, 'FPSAU3600006', '290006', '-Cebollin Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1345, 'FPSAU3600007', '290007', '-Champinones Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1346, 'FPSAU3600008', '290008', '-Guisantes Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1347, 'FPSAU3600009', '290009', '-Jamon de Pierna Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1348, 'FPSAU3600010', '290010', '-Maiz Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1349, 'FPSAU3600011', '290011', '-Oregano Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1350, 'FPSAU3600012', '290012', '-Pepperoni Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1351, 'FPSAU3600013', '290013', '-Pimenton Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1352, 'FPSAU3600014', '290014', '-Pollo Guisado Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1353, 'FPSAU3600015', '290015', '-Q. Mozzarella Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1354, 'FPSAU3600016', '290016', '-Q. Parmesano Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1355, 'FPSAU3600017', '290017', '-Salchicha Romana Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1356, 'FPSAU3600018', '290018', '-Salchicha Viena - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1357, 'FPSAU3600019', '290019', '-Salsa Pizza Gde - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1358, 'FPSAU3600020', '290020', '-Tocineta - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 166, 52, NULL, NULL, NULL, NULL, NULL),
(1359, 'FPSAU3800001', '280001', '-Aceitunas Verdes Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1360, 'FPSAU3800002', '280002', '-Aji Picante Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1361, 'FPSAU3800003', '280003', '-Albahaca Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1362, 'FPSAU3800004', '280004', '-Anchoas Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1363, 'FPSAU3800005', '280005', '-Cebolla Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1364, 'FPSAU3800006', '280006', '-Cebollin Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1365, 'FPSAU3800007', '280007', '-Champinones Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1366, 'FPSAU3800008', '280008', '-Guisantes Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1367, 'FPSAU3800009', '280009', '-Jamon de Pierna Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1368, 'FPSAU3800010', '280010', '-Maiz Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1369, 'FPSAU3800011', '280011', '-Oregano Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1370, 'FPSAU3800012', '280012', '-Pepperoni Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1371, 'FPSAU3800013', '280013', '-Pimenton Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1372, 'FPSAU3800014', '280014', '-Pollo Guisado Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1373, 'FPSAU3800015', '280015', '-Q. Mozzarella Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1374, 'FPSAU3800016', '280016', '-Q. Parmesano Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1375, 'FPSAU3800017', '280017', '-Salchicha Romana Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1376, 'FPSAU3800018', '280018', '-Salchicha Viena Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1377, 'FPSAU3800019', '280019', '-Salsa Pizza Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1378, 'FPSAU3800020', '280020', '-Tocineta Med - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 167, 52, NULL, NULL, NULL, NULL, NULL),
(1379, 'FPSAU4000001', '270001', '-Aceitunas Verdes Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1380, 'FPSAU4000002', '270002', '-Aji Picante Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1381, 'FPSAU4000003', '270003', '-Albahaca Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1382, 'FPSAU4000004', '270004', '-Anchoas Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1383, 'FPSAU4000005', '270005', '-Cebolla Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1384, 'FPSAU4000006', '270006', '-Cebollin Peq- R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1385, 'FPSAU4000007', '270007', '-Champinones Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1386, 'FPSAU4000008', '270008', '-Guisantes Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1387, 'FPSAU4000009', '270009', '-Jamon de Pierna Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1388, 'FPSAU4000010', '270010', '-Maiz Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1389, 'FPSAU4000011', '270011', '-Oregano Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1390, 'FPSAU4000012', '270012', '-Pepperoni Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1391, 'FPSAU4000013', '270013', '-Pimenton Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1392, 'FPSAU4000014', '270014', '-Pollo Guisado Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1393, 'FPSAU4000015', '270015', '-Q. Mozzarella Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1394, 'FPSAU4000016', '270016', '-Q. Parmesano Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1395, 'FPSAU4000017', '270017', '-Salchicha Romana Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1396, 'FPSAU4000018', '270018', '-Salchicha Viena Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1397, 'FPSAU4000019', '270019', '-Salsa para Pizza Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1398, 'FPSAU4000020', '270020', '-Tocineta Peq - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 168, 52, NULL, NULL, NULL, NULL, NULL),
(1399, 'FPSBU4900001', 'FPSBU1000001', '7 UP Med - R', '0.00', '0.0000', '3000.00', '2946.43', 0, 0, 0, 54, 63, 67, 169, 52, NULL, NULL, NULL, NULL, NULL),
(1400, 'FPSBU4900002', 'FPSBU1000002', 'Kolita Med - R', '0.00', '0.0000', '3000.00', '2946.43', 0, 0, 0, 54, 63, 67, 169, 52, NULL, NULL, NULL, NULL, NULL),
(1401, 'FPSBU4900003', 'FPSBU1000003', 'Naranja Med - R', '0.00', '0.0000', '3000.00', '2946.43', 0, 0, 0, 54, 63, 67, 169, 52, NULL, NULL, NULL, NULL, NULL),
(1402, 'FPSBU4900004', 'FPSBU1000004', 'Pepsi Cola Med - R', '0.00', '0.0000', '3000.00', '2946.43', 0, 0, 0, 54, 63, 67, 169, 52, NULL, NULL, NULL, NULL, NULL),
(1403, 'FPSBU4900007', 'FPSBU4900007', 'Poco/Hielo Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 169, 52, NULL, NULL, NULL, NULL, NULL),
(1404, 'FPSBU4900008', 'FPSBU4900008', 'Sin/Hielo Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 169, 52, NULL, NULL, NULL, NULL, NULL),
(1405, 'FPSBU4900005', 'FPSBU1000005', 'Te Lipton Durazno Med - R', '0.00', '0.0000', '3000.00', '2946.43', 0, 0, 0, 54, 63, 67, 169, 52, NULL, NULL, NULL, NULL, NULL),
(1406, 'FPSBU4900006', 'FPSBU1000006', 'Te Lipton Limon Med - R', '0.00', '0.0000', '3000.00', '2946.43', 0, 0, 0, 54, 63, 67, 169, 52, NULL, NULL, NULL, NULL, NULL),
(1407, 'FPSBU5000001', 'FPSBU1100001', '7 Up Pq - R', '0.00', '0.0000', '2200.00', '2160.71', 0, 0, 0, 54, 63, 67, 170, 52, NULL, NULL, NULL, NULL, NULL),
(1408, 'FPSBU5000002', 'FPSBU1100002', 'Kolita Pq - R', '0.00', '0.0000', '2200.00', '2160.71', 0, 0, 0, 54, 63, 67, 170, 52, NULL, NULL, NULL, NULL, NULL),
(1409, 'FPSBU5000003', 'FPSBU1100003', 'Naranja Pq - R', '0.00', '0.0000', '2200.00', '2160.71', 0, 0, 0, 54, 63, 67, 170, 52, NULL, NULL, NULL, NULL, NULL),
(1410, 'FPSBU5000004', 'FPSBU1100004', 'Pepsi Cola Pq - R', '0.00', '0.0000', '2200.00', '2160.71', 0, 0, 0, 54, 63, 67, 170, 52, NULL, NULL, NULL, NULL, NULL),
(1411, 'FPSBU5000007', 'FPSBU5000007', 'Poco/Hielo Pq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 170, 52, NULL, NULL, NULL, NULL, NULL),
(1412, 'FPSBU5000008', 'FPSBU5000008', 'Sin/Hielo Pq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 170, 52, NULL, NULL, NULL, NULL, NULL),
(1413, 'FPSBU5000005', 'FPSBU1100005', 'Te Lipton Durazno Pq - R', '0.00', '0.0000', '2200.00', '2160.71', 0, 0, 0, 54, 63, 67, 170, 52, NULL, NULL, NULL, NULL, NULL),
(1414, 'FPSBU5000006', 'FPSBU1100006', 'Te Lipton Limon Pq - R', '0.00', '0.0000', '2200.00', '2160.71', 0, 0, 0, 54, 63, 67, 170, 52, NULL, NULL, NULL, NULL, NULL),
(1415, 'FPSAU5300003', 'FPSAU5300003', 'Para Llevar Pz. Grd - R', '0.00', '0.0000', '1420.00', '1394.64', 0, 0, 0, 54, 63, 67, 152, 52, NULL, NULL, NULL, NULL, NULL),
(1416, 'FPSAU5400001', 'FPSAU5400001', 'Pastelito de Carne - R', '0.00', '0.0000', '850.00', '834.82', 0, 0, 0, 54, 63, 67, 179, 52, NULL, NULL, NULL, NULL, NULL),
(1417, 'FPSAU5400002', 'FPSAU5400002', 'Pastelito de Pollo - R', '0.00', '0.0000', '850.00', '834.82', 0, 0, 0, 54, 63, 67, 179, 52, NULL, NULL, NULL, NULL, NULL),
(1418, 'FPSAU5400003', 'FPSAU5400003', 'Pastelito de Queso - R', '0.00', '0.0000', '850.00', '834.82', 0, 0, 0, 54, 63, 67, 179, 52, NULL, NULL, NULL, NULL, NULL),
(1419, 'FPSAU5500005', 'FPSAU5500005', 'Bebida Personal 7UP - R', '0.00', '0.0000', '0.01', '0.01', 0, 0, 0, 54, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1420, 'FPSAU5500006', 'FPSAU5500006', 'Bebida Personal Kolita - R', '0.00', '0.0000', '0.01', '0.01', 0, 0, 0, 54, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1421, 'FPSAU5500007', 'FPSAU5500007', 'Bebida Personal Naranja - R', '0.00', '0.0000', '0.01', '0.01', 0, 0, 0, 54, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1422, 'FPSAU5500008', 'FPSAU5500008', 'Bebida Personal Pepsi - R', '0.00', '0.0000', '0.01', '0.01', 0, 0, 0, 54, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1423, 'FPSAU5500009', 'FPSAU5500009', 'Bebida Personal Te Lipton Durazno - R', '0.00', '0.0000', '0.01', '0.01', 0, 0, 0, 54, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1424, 'FPSAU5500010', 'FPSAU5500010', 'Bebida Personal Te Lipton Limon - R', '0.00', '0.0000', '0.01', '0.01', 0, 0, 0, 54, 63, 67, 178, 52, NULL, NULL, NULL, NULL, NULL),
(1425, 'FPSAU5500011', 'FPSAU5500011', 'Piz. Pers. Ovalada - R', '0.00', '0.0000', '0.01', '0.01', 0, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1426, 'FPSAU6100001', 'FPSAU6100001', 'Alemana Gde - R', '0.00', '0.0000', '15550.00', '15272.32', 0, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1427, 'FPSAU6100002', 'FPSAU6100002', 'Jardinera Gde - R', '0.00', '0.0000', '16050.00', '15763.39', 0, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1428, 'FPSAU6100007', 'FPSAU6100007', 'Libertadora Gde - R', '0.00', '0.0000', '15160.00', '14889.29', 0, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1429, 'FPSAU6100003', 'FPSAU6100003', 'New Jersey Gde - R', '0.00', '0.0000', '15380.00', '15105.36', 0, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1430, 'FPSAU6100004', 'FPSAU6100004', 'Pepperoni Gde - R', '0.00', '0.0000', '15740.00', '15458.93', 0, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1431, 'FPSAU6100005', 'FPSAU6100005', 'Primavera Gde - R', '0.00', '0.0000', '15770.00', '15488.39', 0, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1432, 'FPSAU6100006', 'FPSAU6100006', 'Romana Gde - R', '0.00', '0.0000', '15160.00', '14889.29', 0, 0, 0, 54, 63, 67, 159, 52, NULL, NULL, NULL, NULL, NULL),
(1433, 'FPSAU6200001', 'FPSAU6200001', 'Alemana Ovlda - R', '0.00', '0.0000', '2080.00', '2042.86', 0, 0, 0, 54, 63, 67, 278, 52, NULL, NULL, NULL, NULL, NULL),
(1434, 'FPSAU6200002', 'FPSAU6200002', 'Jardinera Ovlda - R', '0.00', '0.0000', '2080.00', '2042.86', 0, 0, 0, 54, 63, 67, 278, 52, NULL, NULL, NULL, NULL, NULL),
(1435, 'FPSAU6200007', 'FPSAU6200007', 'Libertadora Ovlda - R', '0.00', '0.0000', '2080.00', '2042.86', 0, 0, 0, 54, 63, 67, 278, 52, NULL, NULL, NULL, NULL, NULL),
(1436, 'FPSAU6200003', 'FPSAU6200003', 'New Jersey Ovlda - R', '0.00', '0.0000', '2080.00', '2042.86', 0, 0, 0, 54, 63, 67, 278, 52, NULL, NULL, NULL, NULL, NULL),
(1437, 'FPSAU6200004', 'FPSAU6200004', 'Pepperoni Ovlda - R', '0.00', '0.0000', '2080.00', '2042.86', 0, 0, 0, 54, 63, 67, 278, 52, NULL, NULL, NULL, NULL, NULL),
(1438, 'FPSAU6200005', 'FPSAU6200005', 'Primavera Ovlda - R', '0.00', '0.0000', '2080.00', '2042.86', 0, 0, 0, 54, 63, 67, 278, 52, NULL, NULL, NULL, NULL, NULL),
(1439, 'FPSAU6200006', 'FPSAU6200006', 'Romana Ovlda - R', '0.00', '0.0000', '2080.00', '2042.86', 0, 0, 0, 54, 63, 67, 278, 52, NULL, NULL, NULL, NULL, NULL),
(1440, 'FPSAU5600004', 'FPSAU5600004', 'Brownie - R', '0.00', '0.0000', '1700.00', '1669.64', 0, 0, 0, 54, 63, 67, 162, 52, NULL, NULL, NULL, NULL, NULL),
(1441, 'FPSAU5600006', 'FPSAU5600006', 'Gelatina - R', '0.00', '0.0000', '1050.00', '1031.25', 0, 0, 0, 54, 63, 67, 162, 52, NULL, NULL, NULL, NULL, NULL),
(1442, 'FPSAU5600005', 'FPSAU5600005', 'Mini-Brownie - R', '0.00', '0.0000', '970.00', '952.68', 0, 0, 0, 54, 63, 67, 162, 52, NULL, NULL, NULL, NULL, NULL),
(1443, 'FPSBU5800001', 'FPSBU5800001', '7 Up Ligth Lata - R', '0.00', '0.0000', '4000.00', '3928.57', 0, 0, 0, 54, 63, 67, 164, 52, NULL, NULL, NULL, NULL, NULL),
(1444, 'FPSBU5800004', 'FPSBU5800004', 'Pepsi Ligth Lata - R', '0.00', '0.0000', '4000.00', '3928.57', 0, 0, 0, 54, 63, 67, 164, 52, NULL, NULL, NULL, NULL, NULL),
(1445, 'FPSBU4800001', 'FPSBU0900001', '7 UP 32oz Gde - R', '0.00', '0.0000', '1340.00', '1316.07', 1, 0, 0, 54, 63, 67, 294, 50, NULL, NULL, NULL, NULL, NULL),
(1446, 'FPSBU4800002', 'FPSBU0900002', 'Kolita 32oz Gde - R', '0.00', '0.0000', '1340.00', '1316.07', 1, 0, 0, 54, 63, 67, 294, 50, NULL, NULL, NULL, NULL, NULL),
(1447, 'FPSBU4800003', 'FPSBU0900003', 'Naranja 32oz Gde - R', '0.00', '0.0000', '1340.00', '1316.07', 1, 0, 0, 54, 63, 67, 294, 50, NULL, NULL, NULL, NULL, NULL),
(1448, 'FPSBU4800004', 'FPSBU0900004', 'Pepsi Cola 32oz Gde - R', '0.00', '0.0000', '1340.00', '1316.07', 1, 0, 0, 54, 63, 67, 294, 50, NULL, NULL, NULL, NULL, NULL),
(1449, 'FPSBU4800005', 'FPSBU0900005', 'Poco/Hielo - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 294, 50, NULL, NULL, NULL, NULL, NULL),
(1450, 'FPSBU4800006', 'FPSBU0900006', 'Sin/Hielo - R', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 294, 50, NULL, NULL, NULL, NULL, NULL),
(1451, 'FPSBU4800007', 'FPSBU0900007', 'Te Lipton Durazno Gde - R', '0.00', '0.0000', '1340.00', '1316.07', 1, 0, 0, 54, 63, 67, 294, 50, NULL, NULL, NULL, NULL, NULL),
(1452, 'FPSBU4800008', 'FPSBU0900008', 'Te Lipton Limon Gde - R', '0.00', '0.0000', '1340.00', '1316.07', 1, 0, 0, 54, 63, 67, 294, 50, NULL, NULL, NULL, NULL, NULL),
(1453, 'FPSBU5200001', 'FPSBU5200001', 'Yukery Durazno - R', '0.00', '0.0000', '700.00', '687.49', 1, 0, 0, 54, 63, 67, 298, 50, NULL, NULL, NULL, NULL, NULL),
(1454, 'FPSBU5200002', 'FPSBU5200002', 'Yukery Mango - R', '0.00', '0.0000', '700.00', '687.49', 1, 0, 0, 54, 63, 67, 298, 50, NULL, NULL, NULL, NULL, NULL),
(1455, 'FPSBU5200003', 'FPSBU5200003', 'Yukery Manzana - R', '0.00', '0.0000', '700.00', '687.49', 1, 0, 0, 54, 63, 67, 298, 50, NULL, NULL, NULL, NULL, NULL),
(1456, 'FPSBU5200004', 'FPSBU5200004', 'Yukery Pera - R', '0.00', '0.0000', '700.00', '687.49', 1, 0, 0, 54, 63, 67, 298, 50, NULL, NULL, NULL, NULL, NULL),
(1457, 'FPSAU5400001', 'FPSAU5400001', 'Pastelito de Carne - R', '0.00', '0.0000', '875.00', '859.00', 0, 0, 0, 54, 63, 67, 284, 50, NULL, NULL, NULL, NULL, NULL),
(1458, 'FPSAU5400002', 'FPSAU5400002', 'Pastelito de Pollo - R', '0.00', '0.0000', '875.00', '859.00', 0, 0, 0, 54, 63, 67, 284, 50, NULL, NULL, NULL, NULL, NULL),
(1459, 'FPSAU5400003', 'FPSAU5400003', 'Pastelito de Queso - R', '0.00', '0.0000', '875.00', '859.00', 0, 0, 0, 54, 63, 67, 284, 50, NULL, NULL, NULL, NULL, NULL),
(1460, 'FPSAU5600001', 'FPSAU6000001', 'Quesillo - R', '0.00', '0.0000', '1500.00', '1473.21', 1, 0, 0, 54, 63, 67, 289, 50, NULL, NULL, NULL, NULL, NULL),
(1461, 'FPSAU5600002', 'FPSAU6000002', 'Quesillo de chocolate - R', '0.00', '0.0000', '1500.00', '1473.21', 1, 0, 0, 54, 63, 67, 289, 50, NULL, NULL, NULL, NULL, NULL),
(1462, 'FPSAU5600003', 'FPSAU6000003', 'Quesillo de coco - R', '0.00', '0.0000', '1500.00', '1473.21', 1, 0, 0, 54, 63, 67, 289, 50, NULL, NULL, NULL, NULL, NULL),
(1463, 'FPSBU5700001', 'FPSBU5700001', '7up bomba 600ml - R', '0.00', '0.0000', '700.00', '687.49', 1, 0, 0, 54, 63, 67, 299, 50, NULL, NULL, NULL, NULL, NULL),
(1464, 'FPSBU5700002', 'FPSBU5700002', 'Kolita Bomba 600ml - R', '0.00', '0.0000', '700.00', '687.49', 1, 0, 0, 54, 63, 67, 299, 50, NULL, NULL, NULL, NULL, NULL),
(1465, 'FPSBU5700003', 'FPSBU5700003', 'Naranja Bomba 600ml - R', '0.00', '0.0000', '700.00', '687.49', 1, 0, 0, 54, 63, 67, 299, 50, NULL, NULL, NULL, NULL, NULL),
(1466, 'FPSBU5700004', 'FPSBU5700004', 'Pepsi Bomba 600ml - R', '0.00', '0.0000', '700.00', '687.49', 1, 0, 0, 54, 63, 67, 299, 50, NULL, NULL, NULL, NULL, NULL),
(1467, 'FPSBU5800002', 'FPSBU5800002', 'Agua 600 ml - R', '0.00', '0.0000', '60.00', '58.92', 1, 0, 0, 54, 63, 67, 300, 50, NULL, NULL, NULL, NULL, NULL),
(1468, 'FPSBU5800003', 'FPSBU5800003', 'Agua Mineral - R', '0.00', '0.0000', '8.00', '7.85', 1, 0, 0, 54, 63, 67, 300, 50, NULL, NULL, NULL, NULL, NULL),
(1469, 'FPSAU0100001', '170013', 'Adic. Aceite de Oliva 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1470, 'FPSAU0100002', '170001', 'Adic. Aceitunas Verdes 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1471, 'FPSAU0100003', '170002', 'Adic. Aji Picante 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1472, 'FPSAU0100004', '170015', 'Adic. Anchoas 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1473, 'FPSAU0100005', '170007', 'Adic. Cebolla 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1474, 'FPSAU0100006', '170003', 'Adic. Cebollin 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1475, 'FPSAU0100007', '170019', 'Adic. Champinones 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1476, 'FPSAU0100008', '170004', 'Adic. Guisantes 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1477, 'FPSAU0100009', '170017', 'Adic. Jamon de Pierna 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1478, 'FPSAU0100010', '170016', 'Adic. Maiz 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1479, 'FPSAU0100011', '170008', 'Adic. Pepperoni 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1480, 'FPSAU0100012', '170014', 'Adic. Pimenton 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1481, 'FPSAU0100013', '170009', 'Adic. Pollo Guisado 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1482, 'FPSAU0100014', '170012', 'Adic. Queso Mozzarella 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1483, 'FPSAU0100015', '170011', 'Adic. Queso Parmesano 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1484, 'FPSAU0100016', '170005', 'Adic. Salchicha Romana 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1485, 'FPSAU0100017', '170006', 'Adic. Salchicha Viena 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1486, 'FPSAU0100018', '170010', 'Adic. Salchichon 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1487, 'FPSAU0100019', '170018', 'Adic. Tocineta 8 - R', '0.00', '0.0000', '3.30', '3.24', 0, 0, 0, 54, 63, 67, 279, 50, NULL, NULL, NULL, NULL, NULL),
(1488, 'FPSAU0300001', '180007', 'Adic. Aceite de Oliva Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1489, 'FPSAU0300002', '180001', 'Adic. Aceitunas Verdes Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1490, 'FPSAU0300003', '180002', 'Adic. Aji Picante Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1491, 'FPSAU0300004', '180008', 'Adic. Anchoas Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1492, 'FPSAU0300005', '180010', 'Adic. Cebolla Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1493, 'FPSAU0300006', '180003', 'Adic. Cebollin Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1494, 'FPSAU0300007', '180011', 'Adic. Champinones Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1495, 'FPSAU0300008', '180004', 'Adic. Guisantes Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1496, 'FPSAU0300009', '180012', 'Adic. Jamon de Pierna Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1497, 'FPSAU0300010', '180014', 'Adic. Maiz Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1498, 'FPSAU0300011', '180016', 'Adic. Pepperoni Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1499, 'FPSAU0300012', '180009', 'Adic. Pimenton Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1500, 'FPSAU0300013', '180018', 'Adic. Pollo Guisado Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1501, 'FPSAU0300014', '180015', 'Adic. Queso Mozzarella Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1502, 'FPSAU0300015', '180013', 'Adic. Queso Parmesano Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1503, 'FPSAU0300016', '180005', 'Adic. Salchicha Romana Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1504, 'FPSAU0300017', '180006', 'Adic. Salchicha Viena Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1505, 'FPSAU0300018', '180019', 'Adic. Salchichon Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1506, 'FPSAU0300019', '180017', 'Adic. Tocineta Gde - R', '0.00', '0.0000', '8.28', '8.13', 0, 0, 0, 54, 63, 67, 281, 50, NULL, NULL, NULL, NULL, NULL),
(1507, 'FPSAU0500001', '190007', 'Adic. Aceite de Oliva Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1508, 'FPSAU0500002', '190001', 'Adic. Aceitunas Verdes Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1509, 'FPSAU0500003', '190002', 'Adic. Aji Picante Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1510, 'FPSAU0500004', '190008', 'Adic. Anchoas Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1511, 'FPSAU0500005', '190010', 'Adic. Cebolla Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1512, 'FPSAU0500006', '190003', 'Adic. Cebollin Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1513, 'FPSAU0500007', '190011', 'Adic. Champinones Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1514, 'FPSAU0500008', '190004', 'Adic. Guisantes Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1515, 'FPSAU0500009', '190012', 'Adic. Jamon de Pierna Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1516, 'FPSAU0500010', '190014', 'Adic. Maiz Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1517, 'FPSAU0500011', '190016', 'Adic. Pepperoni Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1518, 'FPSAU0500012', '190009', 'Adic. Pimenton Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1519, 'FPSAU0500013', '190018', 'Adic. Pollo Guisado Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1520, 'FPSAU0500014', '190015', 'Adic. Queso Mozzarella Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1521, 'FPSAU0500015', '190013', 'Adic. Queso Parmesano Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1522, 'FPSAU0500016', '190005', 'Adic. Salchicha Romana Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1523, 'FPSAU0500017', '190006', 'Adic. Salchicha Viena Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1524, 'FPSAU0500018', '190019', 'Adic. Salchichon Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1525, 'FPSAU0500019', '190017', 'Adic. Tocineta Med - R', '0.00', '0.0000', '6.34', '6.23', 0, 0, 0, 54, 63, 67, 282, 50, NULL, NULL, NULL, NULL, NULL),
(1526, 'FPSAU0700001', '200007', 'Adic. Aceite de Oliva Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1527, 'FPSAU0700002', '200001', 'Adic. Aceitunas Verdes Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1528, 'FPSAU0700003', '200002', 'Adic. Aji Picante Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1529, 'FPSAU0700004', '200008', 'Adic. Anchoas Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1530, 'FPSAU0700005', '200010', 'Adic. Cebolla Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1531, 'FPSAU0700006', '200003', 'Adic. Cebollin Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1532, 'FPSAU0700007', '200011', 'Adic. Champinones Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1533, 'FPSAU0700008', '200004', 'Adic. Guisamtes Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1534, 'FPSAU0700009', '200012', 'Adic. Jamon de Pierna Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1535, 'FPSAU0700010', '200014', 'Adic. Maiz Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1536, 'FPSAU0700011', '200016', 'Adic. Pepperoni Peq- R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1537, 'FPSAU0700012', '200009', 'Adic. Pimenton Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1538, 'FPSAU0700013', '200018', 'Adic. Pollo Guisado Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1539, 'FPSAU0700014', '200015', 'Adic. Queso Mozzarella Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1540, 'FPSAU0700015', '200013', 'Adic. Queso Parmesano Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1541, 'FPSAU0700016', '200005', 'Adic. Salchicha Romana Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1542, 'FPSAU0700017', '200006', 'Adic. Salchicha Viena Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1543, 'FPSAU0700018', '200019', 'Adic. Salchichon Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1544, 'FPSAU0700019', '200017', 'Adic. Tocineta Peq - R', '0.00', '0.0000', '3.95', '3.88', 0, 0, 0, 54, 63, 67, 283, 50, NULL, NULL, NULL, NULL, NULL),
(1545, 'FPSBU4900001', 'FPSBU1000001', '7 UP Med - R', '0.00', '0.0000', '3.00', '2.95', 0, 0, 0, 54, 63, 67, 295, 50, NULL, NULL, NULL, NULL, NULL),
(1546, 'FPSBU4900002', 'FPSBU1000002', 'Kolita Med - R', '0.00', '0.0000', '3.00', '2.95', 0, 0, 0, 54, 63, 67, 295, 50, NULL, NULL, NULL, NULL, NULL),
(1547, 'FPSBU4900003', 'FPSBU1000003', 'Naranja Med - R', '0.00', '0.0000', '3.00', '2.95', 0, 0, 0, 54, 63, 67, 295, 50, NULL, NULL, NULL, NULL, NULL),
(1548, 'FPSBU4900004', 'FPSBU1000004', 'Pepsi Cola Med - R', '0.00', '0.0000', '3.00', '2.95', 0, 0, 0, 54, 63, 67, 295, 50, NULL, NULL, NULL, NULL, NULL),
(1549, 'FPSBU4900007', 'FPSBU4900007', 'Poco/Hielo Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 295, 50, NULL, NULL, NULL, NULL, NULL),
(1550, 'FPSBU4900008', 'FPSBU4900008', 'Sin/Hielo Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 295, 50, NULL, NULL, NULL, NULL, NULL),
(1551, 'FPSBU4900005', 'FPSBU1000005', 'Te Lipton Durazno Med - R', '0.00', '0.0000', '3.00', '2.95', 0, 0, 0, 54, 63, 67, 295, 50, NULL, NULL, NULL, NULL, NULL),
(1552, 'FPSBU4900006', 'FPSBU1000006', 'Te Lipton Limon Med - R', '0.00', '0.0000', '3.00', '2.95', 0, 0, 0, 54, 63, 67, 295, 50, NULL, NULL, NULL, NULL, NULL),
(1553, 'FPSBU5000001', 'FPSBU1100001', '7 Up Pq - R', '0.00', '0.0000', '2.20', '2.16', 0, 0, 0, 54, 63, 67, 296, 50, NULL, NULL, NULL, NULL, NULL),
(1554, 'FPSBU5000002', 'FPSBU1100002', 'Kolita Pq - R', '0.00', '0.0000', '2.20', '2.16', 0, 0, 0, 54, 63, 67, 296, 50, NULL, NULL, NULL, NULL, NULL),
(1555, 'FPSBU5000003', 'FPSBU1100003', 'Naranja Pq - R', '0.00', '0.0000', '2.20', '2.16', 0, 0, 0, 54, 63, 67, 296, 50, NULL, NULL, NULL, NULL, NULL),
(1556, 'FPSBU5000004', 'FPSBU1100004', 'Pepsi Cola Pq - R', '0.00', '0.0000', '2.20', '2.16', 0, 0, 0, 54, 63, 67, 296, 50, NULL, NULL, NULL, NULL, NULL),
(1557, 'FPSBU5000007', 'FPSBU5000007', 'Poco/Hielo Pq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 296, 50, NULL, NULL, NULL, NULL, NULL),
(1558, 'FPSBU5000008', 'FPSBU5000008', 'Sin/Hielo Pq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 296, 50, NULL, NULL, NULL, NULL, NULL),
(1559, 'FPSBU5000005', 'FPSBU1100005', 'Te Lipton Durazno Pq - R', '0.00', '0.0000', '2.20', '2.16', 0, 0, 0, 54, 63, 67, 296, 50, NULL, NULL, NULL, NULL, NULL),
(1560, 'FPSBU5000006', 'FPSBU1100006', 'Te Lipton Limon Pq - R', '0.00', '0.0000', '2.20', '2.16', 0, 0, 0, 54, 63, 67, 296, 50, NULL, NULL, NULL, NULL, NULL),
(1561, 'FPSBU5100001', 'FPSBU5100001', 'Cafe Gde - R', '0.00', '0.0000', '1.50', '1.47', 0, 0, 0, 54, 63, 67, 297, 50, NULL, NULL, NULL, NULL, NULL),
(1562, 'FPSBU5100002', 'FPSBU5100002', 'Cafe Peq - R', '0.00', '0.0000', '1.10', '1.08', 0, 0, 0, 54, 63, 67, 297, 50, NULL, NULL, NULL, NULL, NULL),
(1563, 'FPSAU5300001', 'FPSAU5300005', 'Para Llevar Pizza 8 - R', '0.00', '0.0000', '780.00', '766.00', 0, 0, 0, 54, 63, 67, 301, 50, NULL, NULL, NULL, NULL, NULL),
(1564, 'FPSAU5300002', 'FPSAU5300006', 'Para Llevar Pizza PQ - R', '0.00', '0.0000', '780.00', '766.00', 0, 0, 0, 54, 63, 67, 301, 50, NULL, NULL, NULL, NULL, NULL),
(1565, 'FPSAU5300003', 'FPSAU5300003', 'Para Llevar Pz. Grd - R', '0.00', '0.0000', '1.70', '1.67', 0, 0, 0, 54, 63, 67, 301, 50, NULL, NULL, NULL, NULL, NULL),
(1566, 'FPSAU5300004', 'FPSAU5300004', 'Para Llevar Pz. Med - R', '0.00', '0.0000', '1.38', '1.34', 0, 0, 0, 54, 63, 67, 301, 50, NULL, NULL, NULL, NULL, NULL),
(1567, 'FPSAU5500005', 'FPSAU5500005', 'Bebida Personal 7UP - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1568, 'FPSAU5500006', 'FPSAU5500006', 'Bebida Personal Kolita - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1569, 'FPSAU5500007', 'FPSAU5500007', 'Bebida Personal Naranja - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1570, 'FPSAU5500008', 'FPSAU5500008', 'Bebida Personal Pepsi - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1571, 'FPSAU5500009', 'FPSAU5500009', 'Bebida Personal Te Lipton Durazno - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1572, 'FPSAU5500010', 'FPSAU5500010', 'Bebida Personal Te Lipton Limon - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1573, 'FPSAU5500001', 'FPSAU5500001', 'Piz. Pers. Full Junior 8 - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 59, 59, 59, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1574, 'FPSAU5500002', 'FPSAU5500002', 'Piz. Pers. Full Mozzarella 8 - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 59, 59, 59, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1575, 'FPSAU5500003', 'FPSAU5500003', 'Piz. Pers. Full Pepperoni 8 -R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 59, 59, 59, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1576, 'FPSAU5500004', 'FPSAU5500004', 'Piz. Prueba - R', '0.00', '0.0000', '0.01', '0.00', 0, 0, 0, 54, 63, 67, 302, 50, NULL, NULL, NULL, NULL, NULL),
(1577, 'FPSAU2100001', '010042', 'Piz Romana 8 - R', '0.00', '0.0000', '11.03', '10.83', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1578, 'FPSAU2100002', '010044', 'Piz Variada 8 - R', '0.00', '0.0000', '9.73', '9.55', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1579, 'FPSAU2100003', '010039', 'Piz. de la Casa  8 - R', '0.00', '0.0000', '6.50', '6.38', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1580, 'FPSAU2100004', '010043', 'Piz. del Corral 8 - R', '0.00', '0.0000', '8.99', '8.83', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1581, 'FPSAU2100005', '010040', 'Piz. Full Clasica 8 - R', '0.00', '0.0000', '6.42', '6.30', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1582, 'FPSAU2100006', '010041', 'Piz. Full con Todo 8 - R', '0.00', '0.0000', '10.66', '10.47', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1583, 'FPSAU2100007', '010035', 'Piz. Full Jamon 8 - R', '0.00', '0.0000', '5.56', '5.46', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1584, 'FPSAU2100008', '010037', 'Piz. Full Junior 8 - R', '0.00', '0.0000', '6.32', '6.20', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1585, 'FPSAU2100009', '010034', 'Piz. Full Mozzarella 8 - R', '0.00', '0.0000', '5.37', '5.27', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1586, 'FPSAU2100010', '010036', 'Piz. Full Pepperoni 8 - R', '0.00', '0.0000', '6.30', '6.19', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1587, 'FPSAU2100011', '010045', 'Piz. Full Salad Light 8 - R', '0.00', '0.0000', '9.99', '9.81', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1588, 'FPSAU2100012', '010038', 'Piz. Salchipicante 8 - R', '0.00', '0.0000', '11.33', '11.12', 0, 0, 0, 54, 63, 67, 285, 50, NULL, NULL, NULL, NULL, NULL),
(1589, 'FPSAU2400001', '040042', 'Piz Romana Gde - R', '0.00', '0.0000', '29.53', '29.00', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1590, 'FPSAU2400002', '040039', 'Piz. de la Casa Gde - R', '0.00', '0.0000', '21.82', '21.43', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1591, 'FPSAU2400003', '040043', 'Piz. del Corral Gde  - R', '0.00', '0.0000', '25.95', '25.49', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1592, 'FPSAU2400004', '040040', 'Piz. Full Clasica Gde - R', '0.00', '0.0000', '21.79', '21.40', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1593, 'FPSAU2400005', '040041', 'Piz. Full con Todo Gde - R', '0.00', '0.0000', '27.10', '26.62', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1594, 'FPSAU2400006', '040035', 'Piz. Full Jamon Gde - R', '0.00', '0.0000', '19.29', '18.95', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1595, 'FPSAU2400007', '040037', 'Piz. Full Junior Gde - R', '0.00', '0.0000', '19.72', '19.36', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1596, 'FPSAU2400008', '040034', 'Piz. Full Mozzarella Gde - R', '0.00', '0.0000', '15.38', '15.10', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1597, 'FPSAU2400009', '040036', 'Piz. Full Pepperoni Gde - R', '0.00', '0.0000', '19.54', '19.19', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1598, 'FPSAU2400010', '040045', 'Piz. Full Salad Light Gde - R', '0.00', '0.0000', '27.83', '27.33', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1599, 'FPSAU2400011', '040038', 'Piz. Salchipicante Gde - R', '0.00', '0.0000', '26.79', '26.31', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1600, 'FPSAU2400012', '040044', 'Piz. Variada Gde - R', '0.00', '0.0000', '26.23', '25.76', 0, 0, 0, 54, 63, 67, 286, 50, NULL, NULL, NULL, NULL, NULL),
(1601, 'FPSAU2600001', '030039', 'Piz. de la Casa Med - R', '0.00', '0.0000', '14.53', '14.27', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1602, 'FPSAU2600002', '030043', 'Piz. del Corral Med - R', '0.00', '0.0000', '16.22', '15.93', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1603, 'FPSAU2600003', '030040', 'Piz. Full Clasica Med - R', '0.00', '0.0000', '14.34', '14.08', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1604, 'FPSAU2600004', '030041', 'Piz. Full con Todo Med - R', '0.00', '0.0000', '21.71', '21.32', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1605, 'FPSAU2600005', '030035', 'Piz. Full Jamon Med - R', '0.00', '0.0000', '12.82', '12.59', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1606, 'FPSAU2600006', '030037', 'Piz. Full Junior Med - R', '0.00', '0.0000', '13.67', '13.42', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1607, 'FPSAU2600007', '030034', 'Piz. Full Mozzarella Med - R', '0.00', '0.0000', '11.03', '10.83', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1608, 'FPSAU2600008', '030036', 'Piz. Full Pepperoni Med - R', '0.00', '0.0000', '14.56', '14.30', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1609, 'FPSAU2600009', '030045', 'Piz. Full Salad Light Med - R', '0.00', '0.0000', '21.14', '20.76', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1610, 'FPSAU2600010', '030042', 'Piz. Romana Med - R', '0.00', '0.0000', '22.25', '21.85', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1611, 'FPSAU2600011', '030038', 'Piz. Salchipicante Med - R', '0.00', '0.0000', '19.52', '19.17', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1612, 'FPSAU2600012', '030044', 'Piz. Variada Med - R', '0.00', '0.0000', '19.34', '18.99', 0, 0, 0, 54, 63, 67, 287, 50, NULL, NULL, NULL, NULL, NULL),
(1613, 'FPSAU2900002', '020036', 'Piz Full Pepperoni Peq - R', '0.00', '0.0000', '7.36', '7.23', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1614, 'FPSAU2900003', '020039', 'Piz. de la Casa Peq - R', '0.00', '0.0000', '8.10', '7.96', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1615, 'FPSAU2900004', '020043', 'Piz. del Corral Peq - R', '0.00', '0.0000', '10.20', '10.02', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1616, 'FPSAU2900005', '020040', 'Piz. Full Clasica Peq - R', '0.00', '0.0000', '8.08', '7.93', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1617, 'FPSAU2900006', '020041', 'Piz. Full con Todo Peq - R', '0.00', '0.0000', '12.27', '12.05', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1618, 'FPSAU2900007', '020035', 'Piz. Full Jamon Peq - R', '0.00', '0.0000', '6.50', '6.38', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1619, 'FPSAU2900008', '020037', 'Piz. Full Junior Peq - R', '0.00', '0.0000', '6.92', '6.79', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1620, 'FPSAU2900001', '020034', 'Piz. Full Mozzarella Peq - R', '0.00', '0.0000', '5.56', '5.46', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1621, 'FPSAU2900009', '020045', 'Piz. Full Salad Light Peq - R', '0.00', '0.0000', '11.14', '10.94', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1622, 'FPSAU2900010', '020042', 'Piz. Romana Peq - R', '0.00', '0.0000', '13.53', '13.28', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1623, 'FPSAU2900011', '020038', 'Piz. Salchipicante Peq - R', '0.00', '0.0000', '10.46', '10.27', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1624, 'FPSAU2900012', '020044', 'Piz. Variada Peq - R', '0.00', '0.0000', '10.37', '10.18', 0, 0, 0, 54, 63, 67, 288, 50, NULL, NULL, NULL, NULL, NULL),
(1625, 'FPSAU5600004', 'FPSAU5600004', 'Brownie - R', '0.00', '0.0000', '1.88', '1.84', 0, 0, 0, 54, 63, 67, 289, 50, NULL, NULL, NULL, NULL, NULL),
(1626, 'FPSAU5600006', 'FPSAU5600006', 'Gelatina - R', '0.00', '0.0000', '1.04', '1.02', 0, 0, 0, 54, 63, 67, 289, 50, NULL, NULL, NULL, NULL, NULL),
(1627, 'FPSAU5600005', 'FPSAU5600005', 'Mini-Brownie - R', '0.00', '0.0000', '1.13', '1.10', 0, 0, 0, 54, 63, 67, 289, 50, NULL, NULL, NULL, NULL, NULL),
(1628, 'FPSBU5800001', 'FPSBU5800001', '7 Up Ligth Lata - R', '0.00', '0.0000', '4000.00', '3928.57', 0, 0, 0, 54, 63, 67, 300, 50, NULL, NULL, NULL, NULL, NULL),
(1629, 'FPSBU5800004', 'FPSBU5800004', 'Pepsi Ligth Lata - R', '0.00', '0.0000', '4000.00', '3928.57', 0, 0, 0, 54, 63, 67, 300, 50, NULL, NULL, NULL, NULL, NULL),
(1630, 'FPSAU3400001', '260001', '-Aceitunas Verdes 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1631, 'FPSAU3400002', '260002', '-Aji Picante 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1632, 'FPSAU3400003', '260003', '-Albahaca 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1633, 'FPSAU3400004', '260004', '-Anchoas 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1634, 'FPSAU3400005', '260005', '-Cebolla 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1635, 'FPSAU3400006', '260006', '-Cebollin 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1636, 'FPSAU3400007', '260007', '-Champinones 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1637, 'FPSAU3400008', '260008', '-Guisantes 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1638, 'FPSAU3400009', '260009', '-Jamon de Pierna 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1639, 'FPSAU3400010', '260010', '-Maiz 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1640, 'FPSAU3400011', '260011', '-Oregano 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1641, 'FPSAU3400012', '260012', '-Pepperoni 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1642, 'FPSAU3400013', '260013', '-Pimenton 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1643, 'FPSAU3400014', '260014', '-Pollo Guisado 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1644, 'FPSAU3400015', '260015', '-Q. Mozzarella 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1645, 'FPSAU3400016', '260016', '-Q. Parmesano 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1646, 'FPSAU3400017', '260017', '-Salchicha Romana 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1647, 'FPSAU3400018', '260018', '-Salchicha Viena 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1648, 'FPSAU3400019', '260019', '-Salsa Pizza 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1649, 'FPSAU3400020', '260020', '-Tocineta 8 - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 290, 50, NULL, NULL, NULL, NULL, NULL),
(1650, 'FPSAU3600001', '290001', '-Aceitunas Verdes Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `receta_id`) VALUES
(1651, 'FPSAU3600002', '290002', '-Aji Picante Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1652, 'FPSAU3600003', '290003', '-Albahaca Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1653, 'FPSAU3600004', '290004', '-Anchoas Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1654, 'FPSAU3600005', '290005', '-Cebolla Gde GD - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1655, 'FPSAU3600006', '290006', '-Cebollin Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1656, 'FPSAU3600007', '290007', '-Champinones Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1657, 'FPSAU3600008', '290008', '-Guisantes Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1658, 'FPSAU3600009', '290009', '-Jamon de Pierna Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1659, 'FPSAU3600010', '290010', '-Maiz Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1660, 'FPSAU3600011', '290011', '-Oregano Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1661, 'FPSAU3600012', '290012', '-Pepperoni Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1662, 'FPSAU3600013', '290013', '-Pimenton Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1663, 'FPSAU3600014', '290014', '-Pollo Guisado Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1664, 'FPSAU3600015', '290015', '-Q. Mozzarella Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1665, 'FPSAU3600016', '290016', '-Q. Parmesano Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1666, 'FPSAU3600017', '290017', '-Salchicha Romana Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1667, 'FPSAU3600018', '290018', '-Salchicha Viena - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1668, 'FPSAU3600019', '290019', '-Salsa Pizza Gde - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1669, 'FPSAU3600020', '290020', '-Tocineta - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 291, 50, NULL, NULL, NULL, NULL, NULL),
(1670, 'FPSAU3800001', '280001', '-Aceitunas Verdes Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1671, 'FPSAU3800002', '280002', '-Aji Picante Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1672, 'FPSAU3800003', '280003', '-Albahaca Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1673, 'FPSAU3800004', '280004', '-Anchoas Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1674, 'FPSAU3800005', '280005', '-Cebolla Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1675, 'FPSAU3800006', '280006', '-Cebollin Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1676, 'FPSAU3800007', '280007', '-Champinones Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1677, 'FPSAU3800008', '280008', '-Guisantes Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1678, 'FPSAU3800009', '280009', '-Jamon de Pierna Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1679, 'FPSAU3800010', '280010', '-Maiz Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1680, 'FPSAU3800011', '280011', '-Oregano Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1681, 'FPSAU3800012', '280012', '-Pepperoni Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1682, 'FPSAU3800013', '280013', '-Pimenton Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1683, 'FPSAU3800014', '280014', '-Pollo Guisado Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1684, 'FPSAU3800015', '280015', '-Q. Mozzarella Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1685, 'FPSAU3800016', '280016', '-Q. Parmesano Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1686, 'FPSAU3800017', '280017', '-Salchicha Romana Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1687, 'FPSAU3800018', '280018', '-Salchicha Viena Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1688, 'FPSAU3800019', '280019', '-Salsa Pizza Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1689, 'FPSAU3800020', '280020', '-Tocineta Med - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 292, 50, NULL, NULL, NULL, NULL, NULL),
(1690, 'FPSAU4000001', '270001', '-Aceitunas Verdes Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1691, 'FPSAU4000002', '270002', '-Aji Picante Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1692, 'FPSAU4000003', '270003', '-Albahaca Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1693, 'FPSAU4000004', '270004', '-Anchoas Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1694, 'FPSAU4000005', '270005', '-Cebolla Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1695, 'FPSAU4000006', '270006', '-Cebollin Peq- R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1696, 'FPSAU4000007', '270007', '-Champinones Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1697, 'FPSAU4000008', '270008', '-Guisantes Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1698, 'FPSAU4000009', '270009', '-Jamon de Pierna Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1699, 'FPSAU4000010', '270010', '-Maiz Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1700, 'FPSAU4000011', '270011', '-Oregano Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1701, 'FPSAU4000012', '270012', '-Pepperoni Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1702, 'FPSAU4000013', '270013', '-Pimenton Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1703, 'FPSAU4000014', '270014', '-Pollo Guisado Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1704, 'FPSAU4000015', '270015', '-Q. Mozzarella Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1705, 'FPSAU4000016', '270016', '-Q. Parmesano Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1706, 'FPSAU4000017', '270017', '-Salchicha Romana Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1707, 'FPSAU4000018', '270018', '-Salchicha Viena Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1708, 'FPSAU4000019', '270019', '-Salsa para Pizza Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1709, 'FPSAU4000020', '270020', '-Tocineta Peq - R', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 293, 50, NULL, NULL, NULL, NULL, NULL),
(1717, 'PLSBU1000009', '', 'PAPELON CON LIMON - B', '1.00', '0.0000', '1.60', '1.57', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1721, 'PLSBU0100001', 'PLK05001', 'Cafe Grande - A', '0.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 306, 84, NULL, NULL, NULL, NULL, NULL),
(1722, 'PLSBU0100002', 'PLK05002', 'Cafe Pequeno - A', '0.00', '0.0000', '9.00', '8.76', 0, 0, 0, 54, 63, 67, 306, 84, NULL, NULL, NULL, NULL, NULL),
(1723, 'PLSAU1300002', 'PLK06001', 'Slice 16 Personal - B', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 266, 155, NULL, NULL, NULL, NULL, NULL),
(1724, 'PLSAU1300001', 'PLK06002', 'Refresco Personal - B', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 266, 155, NULL, NULL, NULL, NULL, NULL),
(1725, 'PLSAU1300004', 'PLSAU1300004', 'Refresco Personal - C', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 266, 155, NULL, NULL, NULL, NULL, NULL),
(1726, 'PLSAU1300005', 'PLSAU1300005', 'Slice 16 Personal - C', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 266, 155, NULL, NULL, NULL, NULL, NULL),
(1727, 'PLSBU1000009', 'PLSBU1000009', 'Infusiones - C', '0.00', '0.0000', '390.00', '383.00', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1728, 'PLSBU1000010', 'PLSBU1000010', 'Jugo de Naranja - C', '0.00', '0.0000', '1.30', '687.00', 0, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1729, 'PLSBU1000011', 'PLSBU1000011', 'Refresco - C', '0.00', '0.0000', '11.00', '10.71', 0, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1730, 'PLSBU1000012', 'PLSBU1000012', 'Te 12 Oz - C', '0.00', '0.0000', '2.00', '1.96', 1, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(1731, 'PLSAU1600008', 'PLSAU1600008', 'Pizza 1 - C', '0.00', '0.0000', '195.00', '189.78', 0, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1732, 'PLSAU1600009', 'PLSAU1600009', 'Pizza 2 - C', '0.00', '0.0000', '195.00', '189.78', 0, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1733, 'PLSAU1600010', 'PLSAU1600010', 'Pizza 3 - C', '0.00', '0.0000', '195.00', '189.78', 0, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1734, 'PLSAU1600011', 'PLSAU1600011', 'Pizza 4 - C', '0.00', '0.0000', '195.00', '189.78', 0, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1735, 'PLSAU1600012', 'PLSAU1600012', 'Pizza 5 - C', '0.00', '0.0000', '195.00', '189.78', 0, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1736, 'PLSAU1600013', 'PLSAU1600013', 'Pizza 6 - C', '0.00', '0.0000', '17.50', '17.19', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1737, 'PLSAU1600014', 'PLSAU1600014', 'Pizza 7 - C', '0.00', '0.0000', '17.50', '17.19', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(1738, 'PLSAU1400002', 'PLSAU1400002', 'Para Llevar Pizza 16 - C', '0.00', '0.0000', '40.00', '38.93', 0, 0, 0, 54, 63, 67, 267, 155, NULL, NULL, NULL, NULL, NULL),
(1739, 'PLSAU1500004', 'PLSAU1500004', 'Pastel de Carne - C', '9.00', '0.0000', '11.50', '11.19', 0, 0, 0, 54, 63, 67, 260, 155, NULL, NULL, NULL, NULL, NULL),
(1740, 'PLSAU1500005', 'PLSAU1500005', 'Pastel de Pollo - C', '9.00', '0.0000', '11.50', '11.19', 0, 0, 0, 54, 63, 67, 260, 155, NULL, NULL, NULL, NULL, NULL),
(1741, 'PLSAU1500006', 'PLSAU1500006', 'Pastel de Queso - C', '9.00', '0.0000', '11.50', '11.19', 0, 0, 0, 54, 63, 67, 260, 155, NULL, NULL, NULL, NULL, NULL),
(1742, 'PLSAU1800001', 'PLSAU1800004', 'Napolitana Ovlda - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 307, 155, NULL, NULL, NULL, NULL, NULL),
(1743, 'PLSAU1800002', 'PLSAU1800002', 'Caraquena Ovlda - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 307, 155, NULL, NULL, NULL, NULL, NULL),
(1744, 'PLSAU1800003', 'PLSAU1800005', 'Pepperoni Ovlda - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 307, 155, NULL, NULL, NULL, NULL, NULL),
(1745, 'PLSAU1800004', 'PLSAU1800001', 'Campestre Ovlda - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 307, 155, NULL, NULL, NULL, NULL, NULL),
(1746, 'PLSAU1800005', 'PLSAU1800007', 'Tendencia Ovlda - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 307, 155, NULL, NULL, NULL, NULL, NULL),
(1747, 'PLSAU1800006', 'PLSAU1800003', 'Ligera Ovlda - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 307, 155, NULL, NULL, NULL, NULL, NULL),
(1748, 'PLSAU1800007', 'PLSAU1800006', 'Suprema Ovlda - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 307, 155, NULL, NULL, NULL, NULL, NULL),
(1749, 'PLSAU1900001', 'PLSAU1900001', 'Campestre Gde - B', '0.00', '0.0000', '12.00', '11.79', 1, 0, 0, 54, 63, 67, 308, 155, NULL, NULL, NULL, NULL, NULL),
(1750, 'PLSAU1900002', 'PLSAU1900002', 'Caraquena Gde - B', '0.00', '0.0000', '12.00', '11.79', 1, 0, 0, 54, 63, 67, 308, 155, NULL, NULL, NULL, NULL, NULL),
(1751, 'PLSAU1900003', 'PLSAU1900003', 'Ligera Gde - B', '0.00', '0.0000', '12.00', '11.79', 1, 0, 0, 54, 63, 67, 308, 155, NULL, NULL, NULL, NULL, NULL),
(1752, 'PLSAU1900004', 'PLSAU1900004', 'Napolitana Gde - B', '0.00', '0.0000', '12.00', '11.79', 1, 0, 0, 54, 63, 67, 308, 155, NULL, NULL, NULL, NULL, NULL),
(1753, 'PLSAU1900005', 'PLSAU1900005', 'Pepperoni Gde - B', '0.00', '0.0000', '12.00', '11.79', 1, 0, 0, 54, 63, 67, 308, 155, NULL, NULL, NULL, NULL, NULL),
(1754, 'PLSAU1900006', 'PLSAU1900006', 'Suprema Gde - B', '0.00', '0.0000', '12.00', '11.79', 1, 0, 0, 54, 63, 67, 308, 155, NULL, NULL, NULL, NULL, NULL),
(1755, 'PLSAU1900007', 'PLSAU1900007', 'Tendencia Gde - B', '0.00', '0.0000', '12.00', '11.79', 1, 0, 0, 54, 63, 67, 308, 155, NULL, NULL, NULL, NULL, NULL),
(1756, 'PLSAU1300003', 'PLSAU1300003', 'Piz. Pers. Ovlda - B', '0.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 266, 155, NULL, NULL, NULL, NULL, NULL),
(1757, 'PLSAU2200001', 'PLSAU2200001', 'Mini-Brownie - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 263, 155, NULL, NULL, NULL, NULL, NULL),
(1758, 'PLSAU1700001', 'PLK00001', 'Slice  16 - B', '0.00', '0.0000', '3.90', '1.55', 1, 0, 0, 54, 63, 67, 262, 155, NULL, NULL, NULL, NULL, NULL),
(1759, 'PLSAU1700002', 'PLSAU1700002', 'Pizzas Cuadradas - B', '0.00', '0.0000', '850.00', '834.00', 1, 0, 0, 54, 63, 67, 262, 155, NULL, NULL, NULL, NULL, NULL),
(1760, 'PLSBU0200008', '', 'Papelon con limon - A', '1.00', '0.0000', '11.00', '10.71', 0, 0, 0, 54, 63, 67, 81, 84, NULL, NULL, NULL, NULL, NULL),
(11760, 'PLSAU1100001', 'PLK09001', 'Pizza 1 + Refresco 1,5 Lt - B', '0.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 314, 157, NULL, NULL, NULL, NULL, NULL),
(11761, 'PLSAU1300001', 'PLK06002', 'Refresco Personal - B', '6.00', '0.0000', '0.00', '0.00', 1, 0, 0, 54, 63, 67, 316, 157, NULL, NULL, NULL, NULL, NULL),
(11762, 'PLSAU1300002', 'PLK06001', 'Slice 16 - B Personal', '8.00', '0.0000', '0.00', '10.00', 1, 0, 0, 54, 63, 67, 316, 157, NULL, NULL, NULL, NULL, NULL),
(11763, 'PLSAU1400001', 'PLK08001', 'Para Llevar Pizza 16 - B', '21.00', '0.0000', '45.00', '43.79', 0, 0, 0, 54, 63, 67, 317, 157, NULL, NULL, NULL, NULL, NULL),
(11764, 'PLSAU1500001', 'PLK04006', 'Pastel de Carne - B', '9.00', '0.0000', '11.50', '11.19', 1, 0, 0, 54, 63, 67, 310, 157, NULL, NULL, NULL, NULL, NULL),
(11765, 'PLSAU1500002', 'PLK04007', 'Pastel de Pollo - B', '9.00', '0.0000', '11.50', '11.19', 1, 0, 0, 54, 63, 67, 310, 157, NULL, NULL, NULL, NULL, NULL),
(11766, 'PLSAU1500003', 'PLK04005', 'Pastel de Queso - B', '9.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 310, 157, NULL, NULL, NULL, NULL, NULL),
(11767, 'PLSAU1600001', 'PLK02001', 'Pizza 1 - B', '48.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 311, 157, NULL, NULL, NULL, NULL, NULL),
(11768, 'PLSAU1600002', 'PLK02002', 'Pizza 2 - B', '52.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 311, 157, NULL, NULL, NULL, NULL, NULL),
(11769, 'PLSAU1600003', 'PLK02003', 'Pizza 3 - B', '52.00', '0.0000', '195.00', '189.78', 1, 0, 0, 54, 63, 67, 311, 157, NULL, NULL, NULL, NULL, NULL),
(11770, 'PLSAU1600004', 'PLK02004', 'Pizza 4 - B', '59.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 311, 157, NULL, NULL, NULL, NULL, NULL),
(11771, 'PLSAU1600005', 'PLK02005', 'Pizza 5 - B', '54.00', '0.0000', '200.00', '194.64', 0, 0, 0, 54, 63, 67, 311, 157, NULL, NULL, NULL, NULL, NULL),
(11772, 'PLSAU1600006', 'PLK02006', 'Pizza 6 - B', '55.00', '0.0000', '25.00', '24.55', 1, 0, 0, 54, 63, 67, 311, 157, NULL, NULL, NULL, NULL, NULL),
(11773, 'PLSAU1600007', 'PLK02007', 'Pizza 7 - B', '55.00', '0.0000', '25.00', '24.55', 1, 0, 0, 54, 63, 67, 311, 157, NULL, NULL, NULL, NULL, NULL),
(11774, 'PLSAU1700001', 'PLSAU1700002', 'Slice 16 - B', '8.00', '0.0000', '33.90', '32.99', 0, 0, 0, 54, 63, 67, 312, 157, NULL, NULL, NULL, NULL, NULL),
(11775, 'PLSAU1700002', 'PLSAU1700002', 'Pizzas Cuadradas - B', '0.00', '0.0000', '3.30', '3.21', 1, 0, 0, 54, 63, 67, 312, 157, NULL, NULL, NULL, NULL, NULL),
(11776, 'PLSAU2100001', 'PLSAU1700002', 'Mini-Brownie - B', '0.00', '0.0000', '1.70', '0.00', 0, 0, 0, 54, 63, 67, 313, 157, NULL, NULL, NULL, NULL, NULL),
(11777, 'PLSBU1000001', 'PLK03001', 'Agua Mineral 300Ml - B', '3.00', '0.0000', '200.00', '196.00', 1, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11778, 'PLSBU1000002', 'PLK03005', 'Agua Mineral 600Ml - B', '0.00', '0.0000', '350.00', '343.00', 1, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11779, 'PLSBU1000003', 'PLK03002', 'Malta - B', '7.00', '0.0000', '1.50', '1.47', 1, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11780, 'PLSBU1000004', 'PLK03003', 'Refresco - B', '6.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11781, 'PLSBU1000005', 'PLK03004', 'Te 12 Oz - B', '3.00', '0.0000', '2.00', '1.96', 1, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11782, 'PLSBU1000006', 'PLSBU1000006', 'Refresco 1,5 Lt - B', '0.00', '0.0000', '1.63', '1.60', 1, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11783, 'PLSBU1000007', 'PLSBU1000007', 'Jugo de Naranja - B', '0.00', '0.0000', '1.30', '1.23', 1, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11784, 'PLSBU1000008', 'PLSBU1000008', 'Infusiones - B', '0.00', '0.0000', '390.00', '383.00', 1, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11785, 'PLSAU1200001', 'PLK01001', 'Combo 1 Slice - B', '134.00', '0.0000', '1.69', '1.66', 1, 0, 0, 54, 63, 67, 315, 157, NULL, NULL, NULL, NULL, NULL),
(11786, 'PLSAU1200002', 'PLK01002', 'Combo 2 Slices - B', '17.00', '0.0000', '2.78', '2.73', 1, 0, 0, 54, 63, 67, 315, 157, NULL, NULL, NULL, NULL, NULL),
(11787, 'PLSAU1100002', 'PLK09002', 'Pizza 2  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 314, 157, NULL, NULL, NULL, NULL, NULL),
(11788, 'PLSAU1100003', 'PLK09003', 'Pizza 3  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 314, 157, NULL, NULL, NULL, NULL, NULL),
(11789, 'PLSAU1100004', 'PLK09004', 'Pizza 4  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 314, 157, NULL, NULL, NULL, NULL, NULL),
(11790, 'PLSAU1100005', 'PLK09005', 'Pizza 5  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 314, 157, NULL, NULL, NULL, NULL, NULL),
(11791, 'PLSAU1100006', 'PLK09006', 'Pizza 6  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 314, 157, NULL, NULL, NULL, NULL, NULL),
(11792, 'PLSAU1100007', 'PLK09007', 'Pizza 7  Refresco 1,5 Lt - B', '68.00', '0.0000', '6.24', '6.13', 1, 0, 0, 54, 63, 67, 314, 157, NULL, NULL, NULL, NULL, NULL),
(11795, 'PLSAU1600015', '', 'Minipizza - C', '0.00', '0.0000', '2.80', '0.00', 1, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(11796, 'PLSAU1600008', '', 'Minipizzas - B', '0.00', '0.0000', '2.80', '0.00', 1, 0, 0, 54, 63, 67, 311, 157, NULL, NULL, NULL, NULL, NULL),
(11797, 'PLPE0011797', '', 'Minipizza 1T - C', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(11798, 'PLPE0011798', '', 'Combo Mini - C', '0.00', '0.0000', '2.80', '0.00', 0, 0, 0, 54, 63, 67, 261, 155, NULL, NULL, NULL, NULL, NULL),
(11799, 'PLSAU1000009', '', 'PAPELON CON LIMON - B', '0.00', '0.0000', '11.00', '10.71', 0, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(11800, 'PLSBU1000013', '', 'PAPELON CON LIMON - C', '0.00', '0.0000', '9.50', '9.25', 0, 0, 0, 54, 63, 67, 259, 155, NULL, NULL, NULL, NULL, NULL),
(11801, 'PLSAU1000009', '', 'PAPELON CON LIMON - B', '0.00', '0.0000', '11.00', '10.71', 0, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(11802, 'PLSAU1600016', '', 'Minipizza - A', '0.00', '0.0000', '3.50', '0.00', 1, 0, 0, 54, 63, 67, 88, 84, NULL, NULL, NULL, NULL, NULL),
(11805, 'PLSAU1600017', '', 'Minipizza - B', '0.00', '0.0000', '3.50', '0.00', 1, 0, 0, 54, 63, 67, 270, 156, NULL, NULL, NULL, NULL, NULL),
(11806, 'DESAU0100001', '', 'Americana Med', '0.00', '0.0000', '19.98', '19.78', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11807, 'DESAU0100002', '', 'Barbacoa Med', '0.00', '0.0000', '22.64', '22.62', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11808, 'DESAU0100003', '', 'Bolognesa Med', '0.00', '0.0000', '19.80', '19.78', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11809, 'DESAU0100004', '', 'Carnivora Med', '0.00', '0.0000', '22.64', '22.62', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11810, 'DESAU0100005', '', 'Continental Med', '0.00', '0.0000', '19.98', '19.78', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11811, 'DESAU0100006', '', 'Especial de la Casa Med', '0.00', '0.0000', '22.64', '22.62', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11812, 'DESAU0100007', '', 'Margarita Med', '0.00', '0.0000', '19.98', '19.78', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11813, 'DESAU0100008', '', 'Pepperoni Med', '0.00', '0.0000', '22.64', '22.62', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11814, 'DESAU0100009', '', 'Primavera Med', '0.00', '0.0000', '19.98', '19.78', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11815, 'DESAU0100010', '', 'Suprema Med', '0.00', '0.0000', '22.64', '22.62', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11816, 'DESAU0100011', '', 'Vegetariana Med', '0.00', '0.0000', '19.98', '19.78', 0, 0, 0, 54, 63, 67, 337, 100, NULL, NULL, NULL, NULL, NULL),
(11817, 'DESAU0200001', '', 'Americana Gde', '0.00', '0.0000', '28.86', '28.83', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11818, 'DESAU0200002', '', 'Barbacoa Gde', '0.00', '0.0000', '30.63', '30.60', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11819, 'DESAU0200003', '', 'Bolognesa Gde', '0.00', '0.0000', '28.86', '28.83', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11820, 'DESAU0200004', '', 'Carnivora Gde', '0.00', '0.0000', '30.63', '30.60', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11821, 'DESAU0200005', '', 'Continental Gde', '0.00', '0.0000', '28.86', '28.83', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11822, 'DESAU0200006', '', 'Especial de la Casa Gde', '0.00', '0.0000', '30.63', '30.60', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11823, 'DESAU0200007', '', 'Margarita Gde', '0.00', '0.0000', '28.86', '28.83', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11824, 'DESAU0200008', '', 'Pepperoni Gde', '0.00', '0.0000', '30.63', '30.60', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11825, 'DESAU0200009', '', 'Primavera Gde', '0.00', '0.0000', '28.86', '28.83', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11826, 'DESAU0200010', '', 'Suprema Gde', '0.00', '0.0000', '30.63', '30.60', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11827, 'DESAU0200011', '', 'Vegetariana Gde', '0.00', '0.0000', '28.86', '28.83', 0, 0, 0, 54, 63, 67, 338, 100, NULL, NULL, NULL, NULL, NULL),
(11828, 'DESAU0300001', '', 'Minis', '0.00', '0.0000', '5.50', '5.40', 0, 0, 0, 54, 63, 67, 339, 100, NULL, NULL, NULL, NULL, NULL),
(11829, 'DESAU0300002', '', 'Minis de Tocineta', '0.00', '0.0000', '5.50', '5.40', 0, 0, 0, 54, 63, 67, 339, 100, NULL, NULL, NULL, NULL, NULL),
(11830, 'DESAU0300003', '', 'Minis de Pepperoni', '0.00', '0.0000', '5.50', '5.40', 0, 0, 0, 54, 63, 67, 339, 100, NULL, NULL, NULL, NULL, NULL),
(11831, 'DESAU0300004', '', 'Palitos a la Parmesana', '0.00', '0.0000', '4.10', '4.10', 0, 0, 0, 54, 63, 67, 339, 100, NULL, NULL, NULL, NULL, NULL),
(11832, 'DESAU0300005', '', 'Alitas de Pollo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 339, 100, NULL, NULL, NULL, NULL, NULL),
(11833, '0001', '', 'Bono de apertura', '0.00', '0.0000', '4.20', '0.00', 0, 0, 0, 54, 63, 67, 339, 100, NULL, NULL, NULL, NULL, NULL),
(11834, 'DESAU0400001', '', 'Quesillo Tradicional', '0.00', '0.0000', '3.50', '3.44', 0, 0, 0, 54, 63, 67, 340, 100, NULL, NULL, NULL, NULL, NULL),
(11835, 'DESAU0400002', '', 'Quesillo de Coco', '0.00', '0.0000', '4.50', '4.42', 0, 0, 0, 54, 63, 67, 340, 100, NULL, NULL, NULL, NULL, NULL),
(11836, 'DESAU0400003', '', 'Quesillo de Cafe', '0.00', '0.0000', '4.50', '4.42', 0, 0, 0, 54, 63, 67, 340, 100, NULL, NULL, NULL, NULL, NULL),
(11837, 'DESAU0400004', '', 'Quesillo de Chocolate', '0.00', '0.0000', '4.50', '4.42', 0, 0, 0, 54, 63, 67, 340, 100, NULL, NULL, NULL, NULL, NULL),
(11838, 'DESAU0400005', '', 'Palitos de Canela', '0.00', '0.0000', '5.50', '5.40', 0, 0, 0, 54, 63, 67, 340, 100, NULL, NULL, NULL, NULL, NULL),
(11839, 'DESBU0500001', '', 'Agua Nevada 600 ml', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11840, 'DESBU0500004', '', 'Coca Cola Original 2 Lt', '0.00', '0.0000', '6.90', '6.79', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11841, 'DESBU0500003', '', 'Coca Cola original 600 Ml', '0.00', '0.0000', '4.50', '4.50', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11842, 'DESBU0500005', '', 'Coca Cola Sin Calorias 2 Lt', '0.00', '0.0000', '6.90', '6.79', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11843, 'DESBU0500006', '', 'Coca Cola Sin Calorias 600 Ml', '0.00', '0.0000', '4.50', '4.50', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11844, 'DESBU0500007', '', 'Coca Cola Ligera 2 Lt', '0.00', '0.0000', '6.90', '6.79', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11845, 'DESBU0500008', '', 'Coca Cola Ligera 600 Ml', '0.00', '0.0000', '4.50', '4.50', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11846, 'DESBU0500009', '', 'Frescolita Sin Calorias 2 Lt', '0.00', '0.0000', '6.90', '6.79', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11847, 'DESBU0500010', '', 'Frescolita Sin Calorias 600 Ml', '0.00', '0.0000', '4.50', '4.50', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11848, 'DESBU0500011', '', 'Chinotto Sin Calorias 2 Lt', '0.00', '0.0000', '6.90', '6.79', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(11849, 'DESBU0500012', '', 'Chinotto Sin Calorias 600 Ml', '0.00', '0.0000', '4.50', '4.50', 0, 0, 0, 54, 63, 67, 341, 100, NULL, NULL, NULL, NULL, NULL),
(12266, 'RB1600', NULL, 'Burrito Carne Molida', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 372, 178, NULL, NULL, NULL, NULL, NULL),
(12267, 'RB628', NULL, 'Plato Burrero Carne Molida', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12268, 'RB631', NULL, 'Pote Light Carne Mechada', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 376, 178, NULL, NULL, NULL, NULL, NULL),
(12269, 'RB506', NULL, 'Combo Nacho Especial 12 Oz', '0.00', '0.0000', '3.25', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12270, 'RB507', NULL, 'Combo Nacho Especial 16 Oz', '0.00', '0.0000', '3.65', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12271, 'RB508', NULL, 'Combo Nacho Especial 22 Oz', '0.00', '0.0000', '3.99', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12272, 'RB100', NULL, 'Combo Nacho con Queso 12 Oz', '0.00', '0.0000', '2.25', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12273, 'RB501', NULL, 'Combo Nacho con Queso 16 Oz', '0.00', '0.0000', '2.65', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12274, 'RB502', NULL, 'Combo Nacho con Queso 22 Oz', '0.00', '0.0000', '2.99', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12275, 'RB503', NULL, 'Combo Papa Western 12 Oz', '0.00', '0.0000', '2.35', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12276, 'RB504', NULL, 'Combo Papa Western 16 Oz', '0.00', '0.0000', '2.75', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12277, 'RB505', NULL, 'Combo Papa Western 22 Oz', '0.00', '0.0000', '3.15', '0.00', 0, 0, 0, 54, 64, 67, 377, 178, NULL, NULL, NULL, NULL, NULL),
(12278, 'RB632', NULL, 'Pote Light Carne Molida', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 376, 178, NULL, NULL, NULL, NULL, NULL),
(12279, 'RB633', NULL, 'Pote Light Pollo Mechado ', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 376, 178, NULL, NULL, NULL, NULL, NULL),
(12280, 'RB634', NULL, 'Pote Light Pollo a la Parrilla', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 376, 178, NULL, NULL, NULL, NULL, NULL),
(12281, 'RB630', NULL, 'Plato Burrero Ropa Vieja', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12282, 'RB635', NULL, 'Pote Light Puerco Guisado', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 376, 178, NULL, NULL, NULL, NULL, NULL),
(12283, 'RB409', NULL, 'Combo Pa 2 12 Oz', '0.00', '0.0000', '14.99', '0.00', 0, 0, 0, 54, 64, 67, 378, 178, NULL, NULL, NULL, NULL, NULL),
(12284, 'RB410', NULL, 'Combo BBB 12 Oz', '0.00', '0.0000', '3.99', '0.00', 0, 0, 0, 54, 64, 67, 378, 178, NULL, NULL, NULL, NULL, NULL),
(12285, 'RB1213', NULL, 'X-Frijoles Rojos 500 Gr', '0.00', '0.0000', '1.75', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12286, 'RB1214', NULL, 'X-Nachos por Paquete', '0.00', '0.0000', '5.25', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12287, 'RB1215', NULL, 'X-Tortilla 10\"', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12288, 'RB1601', NULL, 'Burrito Pollo Mechado', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 372, 178, NULL, NULL, NULL, NULL, NULL),
(12289, 'RB627', NULL, 'Plato Burrero Pollo Mechado', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12290, 'RB625', NULL, 'Plato Burrero Pollo a la Parrilla', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12291, 'RB1216', NULL, 'X-Papas Western', '0.00', '0.0000', '1.50', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12292, 'RB1217', NULL, 'X-Nachos Especial', '0.00', '0.0000', '2.50', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12293, 'RB1409', NULL, 'X-Pollo a la Parrilla 12\"', '0.00', '0.0000', '1.50', '0.00', 0, 0, 0, 54, 63, 67, 386, 178, NULL, NULL, NULL, NULL, NULL),
(12294, 'RB1410', NULL, 'X-Puerco Guisado 12\"', '0.00', '0.0000', '1.50', '0.00', 0, 0, 0, 54, 63, 67, 386, 178, NULL, NULL, NULL, NULL, NULL),
(12295, 'RB1310', NULL, 'X-Maiz', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12296, 'RB1509', NULL, 'X-Crema de Leche 1 Oz', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12297, 'RB1510', NULL, 'X-Mojjto 1 Oz', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12298, 'RB1511', NULL, 'X-Picante D Lias 1 Oz', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12299, 'RB1512', NULL, 'X-Salsa Chipotle 1 Oz', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12300, 'RB1513', NULL, 'X-Salsa Moyonesa Chipotle 1 Oz', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12301, 'RB1514', NULL, 'X-Salsa Tartara 1 Oz', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12302, 'RB1515', NULL, 'X-Salsa Verde 1 Oz', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12303, 'RB106', NULL, 'Coca-Cola 12 Oz', '0.00', '0.0000', '1.25', '0.00', 0, 0, 0, 54, 63, 67, 379, 178, NULL, NULL, NULL, NULL, NULL),
(12304, 'RB1602', NULL, 'Burrito Ropa Vieja', '0.00', '0.0000', '3.50', '0.00', 0, 0, 0, 54, 63, 67, 372, 178, NULL, NULL, NULL, NULL, NULL),
(12305, 'RB1603', NULL, 'Burrito Pollo a la Parrilla', '0.00', '0.0000', '3.50', '0.00', 0, 0, 0, 54, 63, 67, 372, 178, NULL, NULL, NULL, NULL, NULL),
(12306, 'RB1604', NULL, 'Burrito Puerco Guisado', '0.00', '0.0000', '3.50', '0.00', 0, 0, 0, 54, 63, 67, 372, 178, NULL, NULL, NULL, NULL, NULL),
(12307, 'RB1700', NULL, 'Burro Carne Molida', '0.00', '0.0000', '5.50', '0.00', 0, 0, 0, 54, 63, 67, 373, 178, NULL, NULL, NULL, NULL, NULL),
(12308, 'RB1701', NULL, 'Burro Pollo Mechado', '0.00', '0.0000', '5.50', '0.00', 0, 0, 0, 54, 63, 67, 373, 178, NULL, NULL, NULL, NULL, NULL),
(12309, 'RB1702', NULL, 'Burro Ropa Vieja', '0.00', '0.0000', '6.50', '0.00', 0, 0, 0, 54, 63, 67, 373, 178, NULL, NULL, NULL, NULL, NULL),
(12310, 'RB901', NULL, 'Combo Coca Cola', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 390, 178, NULL, NULL, NULL, NULL, NULL),
(12311, 'RB906', NULL, 'Combo Te Fuze', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 390, 178, NULL, NULL, NULL, NULL, NULL),
(12312, 'RB1703', NULL, 'Burro Pollo a la Parrilla', '0.00', '0.0000', '6.50', '0.00', 0, 0, 0, 54, 63, 67, 373, 178, NULL, NULL, NULL, NULL, NULL),
(12313, 'RB1704', NULL, 'Burro Puerco Guisado', '0.00', '0.0000', '6.50', '0.00', 0, 0, 0, 54, 63, 67, 373, 178, NULL, NULL, NULL, NULL, NULL),
(12314, 'RB1800', NULL, 'Mata Burro 10\" Carne Molida', '0.00', '0.0000', '7.25', '0.00', 0, 0, 0, 54, 63, 67, 374, 178, NULL, NULL, NULL, NULL, NULL),
(12315, 'RB1801', NULL, 'Mata Burro 10\" Pollo Mechado', '0.00', '0.0000', '7.25', '0.00', 0, 0, 0, 54, 63, 67, 374, 178, NULL, NULL, NULL, NULL, NULL),
(12316, 'RB1802', NULL, 'Mata Burro 10\" Ropa Vieja', '0.00', '0.0000', '7.75', '0.00', 0, 0, 0, 54, 63, 67, 374, 178, NULL, NULL, NULL, NULL, NULL),
(12317, 'RB1803', NULL, 'Mata Burro 10\" Pollo a la Parrilla', '0.00', '0.0000', '7.75', '0.00', 0, 0, 0, 54, 63, 67, 374, 178, NULL, NULL, NULL, NULL, NULL),
(12318, 'RB1804', NULL, 'Mata Burro 10\" Puerco Guisado', '0.00', '0.0000', '7.75', '0.00', 0, 0, 0, 54, 63, 67, 374, 178, NULL, NULL, NULL, NULL, NULL),
(12319, 'RB1900', NULL, 'Mata Burro 12\" Carne Molida', '0.00', '0.0000', '8.25', '0.00', 0, 0, 0, 54, 63, 67, 375, 178, NULL, NULL, NULL, NULL, NULL),
(12320, 'RB1901', NULL, 'Mata Burro 12\" Pollo Mechado', '0.00', '0.0000', '8.25', '0.00', 0, 0, 0, 54, 63, 67, 375, 178, NULL, NULL, NULL, NULL, NULL),
(12321, 'RB1902', NULL, 'Mata Burro 12\" Ropa Vieja', '0.00', '0.0000', '8.75', '0.00', 0, 0, 0, 54, 63, 67, 375, 178, NULL, NULL, NULL, NULL, NULL),
(12322, 'RB1903', NULL, 'Mata Burro 12\" Pollo a la Parrilla', '0.00', '0.0000', '8.75', '0.00', 0, 0, 0, 54, 63, 67, 375, 178, NULL, NULL, NULL, NULL, NULL),
(12323, 'RB1904', NULL, 'Mata Burro 12\" Puerco Guisado', '0.00', '0.0000', '8.75', '0.00', 0, 0, 0, 54, 63, 67, 375, 178, NULL, NULL, NULL, NULL, NULL),
(12324, 'RB629', NULL, 'Plato Burrero Puerco Guisado', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12325, 'RB618', NULL, 'Pote Burrero Ropa Vieja', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12326, 'RB619', NULL, 'Pote Burrero Puerco Guisado', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12327, 'RB620', NULL, 'Pote Nachos Ropa Vieja', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12328, 'RB621', NULL, 'Pote Nachos Carne Molida', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12329, 'RB622', NULL, 'Pote Nachos Pollo Mechado', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12330, 'RB623', NULL, 'Pote Nachos Pollo a la Parrilla', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12331, 'RB624', NULL, 'Pote Nachos Puerco Guisado', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12332, 'RB903', NULL, 'Combo Fresca', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 390, 178, NULL, NULL, NULL, NULL, NULL),
(12333, 'RB904', NULL, 'Combo Kist Fresa', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 390, 178, NULL, NULL, NULL, NULL, NULL),
(12334, 'RB902', NULL, 'Combo Coca Light', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 390, 178, NULL, NULL, NULL, NULL, NULL),
(12335, 'RB907', NULL, 'Combo Kist Naranja', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 390, 178, NULL, NULL, NULL, NULL, NULL),
(12336, 'RB900', NULL, 'Combo Agua Mineral', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 390, 178, NULL, NULL, NULL, NULL, NULL),
(12337, 'RB411', NULL, 'Combo Pa´2 16 Oz', '0.00', '0.0000', '15.99', '0.00', 0, 0, 0, 54, 64, 67, 378, 178, NULL, NULL, NULL, NULL, NULL),
(12338, 'RB412', NULL, 'Combo Pa´2 22 Oz', '0.00', '0.0000', '16.49', '0.00', 0, 0, 0, 54, 64, 67, 378, 178, NULL, NULL, NULL, NULL, NULL),
(12339, 'RB413', NULL, 'Combo BBB 16 Oz', '0.00', '0.0000', '4.49', '0.00', 0, 0, 0, 54, 64, 67, 378, 178, NULL, NULL, NULL, NULL, NULL),
(12340, 'RB414', NULL, 'Combo BBB 22 Oz', '0.00', '0.0000', '4.74', '0.00', 0, 0, 0, 54, 64, 67, 378, 178, NULL, NULL, NULL, NULL, NULL),
(12341, 'RB617', NULL, 'Pote Burrero Carne Molida', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12342, 'RB616', NULL, 'Pote Burrero Pollo Mechado', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12343, 'RB615', NULL, 'Pote Burrero Pollo a la Parrilla', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12344, 'RB602', '0001', 'Nacho Especial', '0.00', '0.0000', '2.50', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12345, 'RB604', '0002', 'Plato Burrero Para Llevar Ropa Vieja', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12346, 'RB607', '0003', 'Plato Burrero Para Llevar Puerco Guisado', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12347, 'RB102', '0007', 'Fresca 12 Oz', '0.00', '0.0000', '1.25', '0.00', 0, 0, 0, 54, 63, 67, 379, 178, NULL, NULL, NULL, NULL, NULL),
(12348, 'RB103', '0008', 'Kist Naranja 12 Oz', '0.00', '0.0000', '1.25', '0.00', 0, 0, 0, 54, 63, 67, 379, 178, NULL, NULL, NULL, NULL, NULL),
(12349, 'RB104', '0009', 'Kist Fresa 12 Oz', '0.00', '0.0000', '1.25', '0.00', 0, 0, 0, 54, 63, 67, 379, 178, NULL, NULL, NULL, NULL, NULL),
(12350, 'RB105', '0010', 'Te Fuze 12 Oz', '0.00', '0.0000', '1.25', '0.00', 0, 0, 0, 54, 63, 67, 379, 178, NULL, NULL, NULL, NULL, NULL),
(12351, 'RB201', '0011', 'Coca Cola 16 Oz', '0.00', '0.0000', '1.45', '0.00', 0, 0, 0, 54, 63, 67, 380, 178, NULL, NULL, NULL, NULL, NULL),
(12352, 'RB204', '0012', 'Fresca 16 Oz', '0.00', '0.0000', '1.45', '0.00', 0, 0, 0, 54, 63, 67, 380, 178, NULL, NULL, NULL, NULL, NULL),
(12353, 'RB206', '0013', 'Kist Fresa 16 Oz', '0.00', '0.0000', '1.45', '0.00', 0, 0, 0, 54, 63, 67, 380, 178, NULL, NULL, NULL, NULL, NULL),
(12354, 'RB205', '0014', 'Kist Naranja 16 Oz', '0.00', '0.0000', '1.45', '0.00', 0, 0, 0, 54, 63, 67, 380, 178, NULL, NULL, NULL, NULL, NULL),
(12355, 'RB207', '0015', 'Te Fuze 16 Oz', '0.00', '0.0000', '1.45', '0.00', 0, 0, 0, 54, 63, 67, 380, 178, NULL, NULL, NULL, NULL, NULL),
(12356, 'RB300', '0016', 'Coca Cola 22 Oz', '0.00', '0.0000', '1.80', '0.00', 0, 0, 0, 54, 63, 67, 381, 178, NULL, NULL, NULL, NULL, NULL),
(12357, 'RB302', '0017', 'Fresca 22 Oz', '0.00', '0.0000', '1.80', '0.00', 0, 0, 0, 54, 63, 67, 381, 178, NULL, NULL, NULL, NULL, NULL),
(12358, 'RB304', '0018', 'Kist Fresa 22 Oz', '0.00', '0.0000', '1.80', '0.00', 0, 0, 0, 54, 63, 67, 381, 178, NULL, NULL, NULL, NULL, NULL),
(12359, 'RB303', '0019', 'Kist Naranja 22 Oz', '0.00', '0.0000', '1.80', '0.00', 0, 0, 0, 54, 63, 67, 381, 178, NULL, NULL, NULL, NULL, NULL),
(12360, 'RB305', '0020', 'Te Fuze 22 Oz', '0.00', '0.0000', '1.80', '0.00', 0, 0, 0, 54, 63, 67, 381, 178, NULL, NULL, NULL, NULL, NULL),
(12361, 'RB1104', '0022', 'Pollo al Grill ', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 389, 178, NULL, NULL, NULL, NULL, NULL),
(12362, 'RB1107', '0023', 'Ropa Vieja', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 389, 178, NULL, NULL, NULL, NULL, NULL),
(12363, 'RB1105', '0024', 'Pollo Desmechado', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 389, 178, NULL, NULL, NULL, NULL, NULL),
(12364, 'RB200', '0036', 'Agua Mineral', '0.00', '0.0000', '1.75', '0.00', 0, 0, 0, 54, 63, 67, 380, 178, NULL, NULL, NULL, NULL, NULL),
(12365, 'RB1403', '0039', 'X- Pollo a la Parrilla 10\"', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 385, 178, NULL, NULL, NULL, NULL, NULL),
(12366, 'RB1401', '0040', 'X-Pollo Mechado 10\"', '0.00', '0.0000', '0.35', '0.00', 0, 0, 0, 54, 63, 67, 385, 178, NULL, NULL, NULL, NULL, NULL),
(12367, 'RB1404', '0041', 'X- Puerco Guisado 10\"', '0.00', '0.0000', '0.70', '0.00', 0, 0, 0, 54, 63, 67, 385, 178, NULL, NULL, NULL, NULL, NULL),
(12368, 'RB1405', '0042', 'X-Carne Molida 12\"', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 386, 178, NULL, NULL, NULL, NULL, NULL),
(12369, 'RB1402', '0043', 'X-Ropa Vieja 10\"', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 385, 178, NULL, NULL, NULL, NULL, NULL),
(12370, 'RB1502', '0044', 'X- Guacamole 2 Oz', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12371, 'RB1500', '0045', 'X- Crema de Leche 2 Oz', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12372, 'RB1200', '0046', 'X- Arroz Blanco', '0.00', '0.0000', '0.30', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12373, 'RB1206', '0047', 'X- Tajadas', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12374, 'RB1203', '0048', 'X- Frijoles Negros', '0.00', '0.0000', '0.30', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12375, 'RB1202', '0049', 'X- Frigoles Rojos', '0.00', '0.0000', '0.30', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12376, 'RB1201', '0050', 'X- Congri', '0.00', '0.0000', '0.30', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12377, 'RB1205', '0051', 'X- Queso Fundido', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12378, 'RB1207', '0052', 'X- Vegetales Salteados', '0.00', '0.0000', '0.50', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12379, 'RB1300', '0053', 'X- Cebollin', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12380, 'RB1303', '0054', 'X- Pico de Gallo', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12381, 'RB1302', '0055', 'X- Lechuga', '0.00', '0.0000', '1.25', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12382, 'RB1307', '0056', 'X- Tomate Picado', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12383, 'RB1304', '0057', 'X- Queso Rallado Amarillo', '0.00', '0.0000', '0.90', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12384, 'RB1305', '0058', 'X- Queso Rallado Blanco', '0.00', '0.0000', '0.90', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12385, 'RB1503', '0059', 'X- Mojito 2 Oz', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12386, 'RB1504', '0060', 'X- Picante D Lidas 2 Oz', '0.00', '0.0000', '0.85', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12387, 'RB1505', '0061', 'X- Salsa Chipotle 2 Oz', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12388, 'RB1507', '0062', 'X- Salsa Tartara 2 Oz', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12389, 'RB1508', '0063', 'X- Salsa Verde 2 Oz', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12390, 'RB1506', '0064', 'X- Salsa Mayonesa Chipotle 2 Oz', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12391, 'RB1306', '0072', 'X- Tomate con Maiz', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12392, 'RB1208', '0074', 'X-Nachos Solos', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12393, 'RB1204', '0075', 'X- Nachos con Queso', '0.00', '0.0000', '1.75', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12394, 'RB1406', '0076', 'X-Pollo Mechado 12\"', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 386, 178, NULL, NULL, NULL, NULL, NULL),
(12395, 'RB1301', '0079', 'X- Jalapenos', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12396, 'RB1308', '0081', 'X-Tortilla 12\"', '0.00', '0.0000', '0.90', '0.00', 0, 0, 0, 54, 63, 67, 383, 178, NULL, NULL, NULL, NULL, NULL),
(12397, 'RB1400', '0083', 'X- Carne Molida 10\"', '0.00', '0.0000', '0.35', '0.00', 0, 0, 0, 54, 63, 67, 385, 178, NULL, NULL, NULL, NULL, NULL),
(12398, 'RB1106', '0084', 'Puerco Guisado Combo', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 389, 178, NULL, NULL, NULL, NULL, NULL),
(12399, 'RB603', '0087', 'Plato Burrero Para Llevar Carne Molida', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12400, 'RB606', '0088', 'Plato Burrero Para Llevar Pollo Mechado', '0.00', '0.0000', '5.99', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12401, 'RB1102', '0091', 'Carne Molida', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 389, 178, NULL, NULL, NULL, NULL, NULL),
(12402, 'RB1407', '0092', 'X-Ropa Vieja 12\"', '0.00', '0.0000', '1.50', '0.00', 0, 0, 0, 54, 63, 67, 386, 178, NULL, NULL, NULL, NULL, NULL),
(12403, 'RB601', '0096', 'Papas Western', '0.00', '0.0000', '1.50', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12404, 'RB605', '0099', 'Plato Burrero Para Llevar Pollo Parrilla', '0.00', '0.0000', '6.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12405, 'RB800', '0101', 'Brownie de Manjar', '0.00', '0.0000', '2.50', '0.00', 0, 0, 0, 54, 63, 67, 382, 178, NULL, NULL, NULL, NULL, NULL),
(12406, 'RB801', '0102', 'Brownie de Oreo', '0.00', '0.0000', '2.50', '0.00', 0, 0, 0, 54, 63, 67, 382, 178, NULL, NULL, NULL, NULL, NULL),
(12407, 'RB802', '0103', 'Brownie de Snicker', '0.00', '0.0000', '2.50', '0.00', 0, 0, 0, 54, 63, 67, 382, 178, NULL, NULL, NULL, NULL, NULL),
(12408, 'RB803', '0104', 'Brownie- Clasico', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 382, 178, NULL, NULL, NULL, NULL, NULL),
(12409, 'RB101', '0105', 'Coca Ligth 12 Oz', '0.00', '0.0000', '1.25', '0.00', 0, 0, 0, 54, 64, 67, 379, 178, NULL, NULL, NULL, NULL, NULL),
(12410, 'RB202', '0106', 'Coca Light 16 Oz', '0.00', '0.0000', '1.45', '0.00', 0, 0, 0, 54, 63, 67, 380, 178, NULL, NULL, NULL, NULL, NULL),
(12411, 'RB301', '0107', 'Coca Ligth 22 Oz', '0.00', '0.0000', '1.80', '0.00', 0, 0, 0, 54, 63, 67, 381, 178, NULL, NULL, NULL, NULL, NULL),
(12412, 'RB1501', '0109', 'X- Guacamole 1 OZ', '0.00', '0.0000', '0.75', '0.00', 0, 0, 0, 54, 63, 67, 387, 178, NULL, NULL, NULL, NULL, NULL),
(12413, 'RB1209', '0111', 'X- Tortilla 12\"', '0.00', '0.0000', '0.90', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12414, 'RB1210', '0112', 'X- Pollo Guisado 500 Gr.', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12415, 'RB613', '0113', 'Quesadilla de Queso', '0.00', '0.0000', '2.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12416, 'RB611', '0114', 'Quesadilla de Carne', '0.00', '0.0000', '3.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL),
(12417, 'RB612', '0115', 'Quesadilla de Pollo', '0.00', '0.0000', '3.75', '0.00', 0, 0, 0, 54, 63, 67, 388, 178, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `receta_id`) VALUES
(12418, 'RB1211', '0116', 'X- Puerco Guisado 500 Gr', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12419, 'RB1212', '0117', 'X- Ropa Vieja 500 Gr', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 63, 67, 384, 178, NULL, NULL, NULL, NULL, NULL),
(12421, 'PLSA0037', '', 'Bolsa para llevar', '273.00', '0.0000', '1.00', '973.00', 1, 0, 0, 54, 63, 67, 276, 156, NULL, NULL, NULL, NULL, NULL),
(12422, 'PLCH0037', '', 'Bolsa para llevar', '210.00', '0.0000', '1.20', '1.17', 1, 0, 0, 54, 63, 67, 317, 157, NULL, NULL, NULL, NULL, NULL),
(12423, 'PLSA0038', '', 'Limonada', '2.30', '0.0000', '2.50', '2.43', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(12425, 'FP21019', NULL, '-Tocino/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12426, 'FP19014', NULL, 'Combo Uni (izza Queso+1Lts Soda)', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 63, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12427, 'FP7017', NULL, '+Tocino/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12428, 'FP8018', NULL, '+Tocino/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12429, 'FP9018', NULL, '+Tocino/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12430, 'FP20018', NULL, '-Tocino/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12431, 'FP22018', NULL, '-Tocino/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12432, 'FP17005', NULL, 'Galleta Macadamia Combo', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 370, 177, NULL, NULL, NULL, NULL, NULL),
(12433, 'FP25016', NULL, 'Agran- Coca Cola/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12434, 'FP25017', NULL, 'Agran- Coca Light/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12435, 'FP25018', NULL, 'Agran- Fanta/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12436, 'FP25019', NULL, 'Agran- Fresca Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12437, 'FP25020', NULL, 'Agran- Kitz/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12438, 'FP25021', NULL, 'Agran- Sprite/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12439, 'FP25022', NULL, 'Agran- Te Fuze Limon/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12440, 'FP25023', NULL, 'Agran- Uva/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12441, 'FP4011', NULL, 'Cb Pizza Dulce+Pepperoni 2 Pers', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12442, 'FP4015', NULL, 'Cb Pizza Dulce+Champiñones 2 Pers', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12443, 'FP4014', NULL, 'Cb Pizza Dulce+Chorizo 2 Pers', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12444, 'FP4010', NULL, 'Cb Pizza Dulce+Jamon 2 Pers', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12445, 'FP4012', NULL, 'Cb Pizza Dulce+Pollo 2 Pers', '0.00', '0.0000', '11.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12446, 'FP4013', NULL, 'Cb Pizza Dulce+Tocino 2 Pers', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12447, 'FP4009', NULL, 'Cb Pizza Dulce+Queso 2 Pers', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12448, 'FP4016', NULL, 'Cb Pizza Dulce+Vegetales 2 Pers', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12449, 'FP0038', NULL, 'Full Queso 14\"', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12450, 'FP0039', NULL, 'Full Jamon 14\"', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12451, 'FP0040', NULL, 'Full Pepperoni 14\"', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12452, 'FP0045', NULL, 'Full Combinacion 14\"', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12453, 'FP365', NULL, 'Full Ranchera 14\"', '0.00', '0.0000', '11.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12454, 'FP0041', NULL, 'Full Pollo 14\"', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12455, 'FP0042', NULL, 'Full Tocino 14\"', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12456, 'FP0044', NULL, 'Full Chorizo 14\"', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12457, 'FP0046', NULL, 'Full Champiñones 14\"', '0.00', '0.0000', '7.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12458, 'FP0047', NULL, 'Full vegetales 14\"', '0.00', '0.0000', '7.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12459, 'FP361', NULL, 'Full Pepperoni Deluxe 14\"', '0.00', '0.0000', '11.00', '0.00', 0, 0, 0, 54, 63, 67, 344, 177, NULL, NULL, NULL, NULL, NULL),
(12460, 'FP27011', NULL, 'Full Combo 2 de Queso 14', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 348, 177, NULL, NULL, NULL, NULL, NULL),
(12461, 'FP27012', NULL, 'Full Combo 2 de Pollo 14', '0.00', '0.0000', '14.00', '0.00', 0, 0, 0, 54, 64, 67, 348, 177, NULL, NULL, NULL, NULL, NULL),
(12462, 'FP27013', NULL, 'Full Combo 2 de Jamon 14', '0.00', '0.0000', '12.00', '0.00', 0, 0, 0, 54, 64, 67, 348, 177, NULL, NULL, NULL, NULL, NULL),
(12463, 'FP27014', NULL, 'Full Combo 2 de Champiñon 14', '0.00', '0.0000', '12.00', '0.00', 0, 0, 0, 54, 64, 67, 348, 177, NULL, NULL, NULL, NULL, NULL),
(12464, 'FP27015', NULL, 'Full Combo 2 de Chorizo 14', '0.00', '0.0000', '12.00', '0.00', 0, 0, 0, 54, 64, 67, 348, 177, NULL, NULL, NULL, NULL, NULL),
(12465, 'FP27017', NULL, 'Full Combo 2 de Peperoni 14', '0.00', '0.0000', '12.00', '0.00', 0, 0, 0, 54, 64, 67, 348, 177, NULL, NULL, NULL, NULL, NULL),
(12466, 'FP27020', NULL, 'Full Combo 2 de Tocino 14', '0.00', '0.0000', '14.00', '0.00', 0, 0, 0, 54, 64, 67, 348, 177, NULL, NULL, NULL, NULL, NULL),
(12467, 'FP27021', NULL, 'Full Combo 2 de Vegetales 14', '0.00', '0.0000', '12.00', '0.00', 0, 0, 0, 54, 64, 67, 348, 177, NULL, NULL, NULL, NULL, NULL),
(12468, 'FP14020', NULL, 'Full Queso 7', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12469, 'FP14021', NULL, 'Full Pepperoni 7', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12470, 'FP14022', NULL, 'Full Jamon 7', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12471, 'FP19015', NULL, 'Alitas Originales', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12472, 'FP19017', NULL, 'Alitas BBQ', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12473, 'FP19018', NULL, 'Alitas Picantes', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12474, 'FP18010', NULL, 'Deep-Blue Chesse', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12475, 'FP18011', NULL, 'Deep-Rach', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12476, 'FP18012', NULL, 'Deep-Salsa Tartara', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12477, 'FP28002', NULL, 'X- Mozzarella 14', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12478, 'FP28003', NULL, 'X- Jamon 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12479, 'FP28004', NULL, 'X- Pepperoni 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12480, 'FP28005', NULL, 'X- Pollo 14', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12481, 'FP28006', NULL, 'X- Tocino 14', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12482, 'FP28007', NULL, 'X- Chorizo 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12483, 'FP28008', NULL, 'X- Cebolla 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12484, 'FP28009', NULL, 'X- Champiñones 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12485, 'FP28010', NULL, 'X- Aceitunas 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12486, 'FP28011', NULL, 'X- Salsa Pizza 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12487, 'FP28012', NULL, 'X- Pimentones 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12488, 'FP28013', NULL, 'X- Maiz 14', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 356, 177, NULL, NULL, NULL, NULL, NULL),
(12489, 'FP19019', NULL, 'Pizza MM (A)', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12490, 'FP19020', NULL, 'Combo Full MM', '0.00', '0.0000', '12.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12491, 'FP19023', NULL, 'Combo Cine Individual', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12492, 'FP11000', '000', 'Para/Llevar', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 357, 177, NULL, NULL, NULL, NULL, NULL),
(12493, 'FP24001', '0001', 'Coca Cola 2 Lts.', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12494, 'FP25002', '0002', 'Coca Cola 1 lts.', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12495, 'FP15008', '0003', 'Galleta Macadamia', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12496, 'FP6003', '0004', 'COMBO Chorizo 9\"', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12497, 'FP14003', '0006', 'FULL Italiana 9\"', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12498, 'FP12003', '0007', 'FULL Italiana 12\"', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12499, 'FP13004', '0008', 'FULL Italiana 16\"', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12500, 'FP3011', '0009', 'X- Salch Italiana/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12501, 'FP22017', '001', '-Salsa/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12502, 'FP2011', '0010', 'X- Salch Itlaina/ 12', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12503, 'FP1011', '0011', 'X- Salch Italiana/16', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12504, 'FP6002', '0012', 'Combo Champiñones 9\"', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12505, 'FP19013', '0013', 'Pizza Premiun 9\"', '0.00', '0.0000', '7.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12506, 'FP17001', '0014', 'Flan de la Casa', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 370, 177, NULL, NULL, NULL, NULL, NULL),
(12507, 'FP26004', '0015', 'Fresca Peq.', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12508, 'FP25007', '0016', 'Fresca Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12509, 'FP24008', '0017', 'Fresca Grd.', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12510, 'FP14002', '0018', 'Full Combinación 9´´', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12511, 'FP12002', '0019', 'Full Combinación 12´´', '0.00', '0.0000', '7.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12512, 'FP21018', '002', '-Salsa/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12513, 'FP13003', '0020', 'Full Combinacióm 16´´', '0.00', '0.0000', '14.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12514, 'FP16009', '0021', 'P Coca Cola 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12515, 'FP23000', '0022', 'Slice Jamon', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 64, 67, 366, 177, NULL, NULL, NULL, NULL, NULL),
(12516, 'FP23001', '0023', 'Slice Peperoni', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 64, 67, 366, 177, NULL, NULL, NULL, NULL, NULL),
(12517, 'FP16013', '0024', 'P Sprite 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12518, 'FP16010', '0025', 'P Fresa 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12519, 'FP16011', '0026', 'P Fresca 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12520, 'FP23002', '0027', 'Slice Queso', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 64, 67, 366, 177, NULL, NULL, NULL, NULL, NULL),
(12521, 'FP4000', '0028', 'Combo Chorizo 2 Prs', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12522, 'FP4002', '0029', 'Combo de Jamón  2 Prs', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12523, 'FP20016', '003', '-Salsa/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12524, 'FP4007', '0030', 'Combo Peperoni 2 Prs', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12525, 'FP4008', '0031', 'Combo Salchicha 2 Prs', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12526, 'FP4003', '0032', 'Combo de Pollo 2 Prs', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12527, 'FP4005', '0033', 'Combo de Tocino 2 Prs', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12528, 'FP19001', '0034', 'Combo Full Pasiero', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12529, 'FP4006', '0035', 'Combo de vegetales 2 Prs', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12530, 'FP16001', '0036', 'Coca Cola 1 Lts (o)', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 0, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12531, 'FP16003', '0037', 'Coca Cola 2 Lts  (o)', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12532, 'FP13001', '0038', 'FULL Champinones 9´', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12533, 'FP4004', '0039', 'Combo de Queso 2 Pers', '0.00', '0.0000', '7.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12534, 'FP10003', '004', 'Toping/Fresa', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 367, 177, NULL, NULL, NULL, NULL, NULL),
(12535, 'FP16012', '0040', 'P Naranja 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12536, 'FP16016', '0041', 'P Uva 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12537, 'FP16014', '0042', 'P Te Duraz  12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12538, 'FP4001', '0043', 'Combo de Champiñones 2 Prs', '0.00', '0.0000', '9.00', '0.00', 0, 0, 0, 54, 64, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12539, 'FP5000', '0044', 'COMBO Champiñones 4Prs', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12540, 'FP14000', '0045', 'FULL Champiñones 12', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12541, 'FP25015', '0046', 'Uva/Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12542, 'FP24021', '0047', 'Uva/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12543, 'FP26012', '0048', 'Uva/Pq', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12544, 'FP1010', '0049', 'X- Pollo/16', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12545, 'FP10002', '005', 'Toping/Chocolate', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 367, 177, NULL, NULL, NULL, NULL, NULL),
(12546, 'FP2010', '0050', 'X- Pollo/12', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12547, 'FP3010', '0051', 'X- Pollo/9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12548, 'FP12000', '0052', 'FULL Champiñones 16', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12549, 'FP6006', '0053', 'COMBO Pollo 9\"', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12550, 'FP12007', '0054', 'FULL Pollo 12', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12551, 'FP13008', '0055', 'FULL Pollo 16', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12552, 'FP14007', '0056', 'FULL Pollo 9', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12553, 'FP26002', '0058', 'Coca Zero/Peq', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12554, 'FP25000', '0059', 'Coca  Zero/Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12555, 'FP25012', '006', 'Sin/Hielo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12556, 'FP24004', '0060', 'Coca Zero/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12557, 'FP30000', '0061', 'Vasos', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 347, 177, NULL, NULL, NULL, NULL, NULL),
(12558, 'FP30008', '0062', 'Vasos', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12559, 'FP16006', '0063', 'Freska 2 ltros', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 0, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12560, 'FP30009', '0064', 'Combo/Coca Cola', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12561, 'FP30010', '0065', 'Combo/Coca Zero', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12562, 'FP24016', '0066', 'Sin/Hielo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12563, 'FP30006', '0067', 'Sin/Hielo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12564, 'FP30011', '0068', 'Combo/Fanta', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12565, 'FP30012', '0069', 'Combo/Fresca', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12566, 'FP26013', '007', 'VASO SIN SODA', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12567, 'FP30013', '0070', 'Combo/Kist', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12568, 'FP30014', '0071', 'Combo/Sprite', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12569, 'FP30015', '0072', 'Full Economica', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12570, 'FP30016', '0073', 'Sab/Aceitunas', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12571, 'FP30017', '0074', 'Sab/Cebolla', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12572, 'FP30018', '0075', 'Sab/Champiñones', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12573, 'FP30019', '0076', 'Sab/Chorizo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12574, 'FP24015', '0077', 'Poco/Hielo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12575, 'FP30005', '0078', 'Poco/Hielo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12576, 'FP30020', '0079', 'Sab/Jamon', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12577, 'FP26009', '008', 'Sin/Hielo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12578, 'FP30021', '0080', 'Sab/Peperoni', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12579, 'FP30022', '0081', 'Sab/Pimenton', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12580, 'FP30023', '0082', 'Sab/Pollo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12581, 'FP30024', '0083', 'Sab/Tocino', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 0, 67, 394, 177, NULL, NULL, NULL, NULL, NULL),
(12582, 'FP26007', '0084', 'Nestea Durazno/Pq', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 67, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12583, 'FP25009', '0085', 'Nestea Durazno/Med', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12584, 'FP24013', '0086', 'Nestea Durazno/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12585, 'FP16015', '0087', 'P Te Limon 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12586, 'FP16008', '0088', 'P Agua Mineral 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12587, 'FP14017', '0089', 'Togo Queso', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12588, 'FP25011', '009', 'Poco/Hielo', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12589, 'FP14014', '0090', 'Togo Jamon', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12590, 'FP14015', '0091', 'Togo Peperoni', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12591, 'FP14016', '0092', 'Togo Pollo', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12592, 'FP14013', '0093', 'Togo Combinacion', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12593, 'FP16024', '0094', 'S Coca Cola Slice 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12594, 'FP16025', '0095', 'S Fresa Slice 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12595, 'FP3006', '0096', 'X- Maiz/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12596, 'FP3015', '0097', 'X- Tomate/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12597, 'FP16026', '0098', 'S Fresca Slice 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12598, 'FP16027', '0099', 'S Naranja Slice 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12599, 'FP9017', '010', '+Salsa/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12600, 'FP16028', '0100', 'S Sprite Slice 12 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12601, 'FP2006', '0101', 'X- Maiz/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12602, 'FP2015', '0102', 'X- Tomate/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12603, 'FP17000', '0103', 'F Kids Cake Marmoleado', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 370, 177, NULL, NULL, NULL, NULL, NULL),
(12604, 'FP19008', '0104', 'Full Kids 7\" Queso', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12605, 'FP19005', '0105', 'Full Kids 7\" Jamon', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12606, 'FP1006', '0106', 'X- Maiz/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12607, 'FP1015', '0107', 'X- Tomate/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12608, 'FP18004', '0108', 'Jamon Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12609, 'FP18005', '0109', 'Peperoni Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12610, 'FP8017', '011', '+Salsa/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12611, 'FP18001', '0110', 'Chorizo Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12612, 'FP18000', '0111', 'Champinon Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12613, 'FP18006', '0112', 'Pollo Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12614, 'FP18008', '0113', 'Tocino Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12615, 'FP18009', '0114', 'Vegetales Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12616, 'FP18007', '0115', 'Queso Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12617, 'FP17004', '0116', 'Galleta Chocolate Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 370, 177, NULL, NULL, NULL, NULL, NULL),
(12618, 'FP17003', '0117', 'Galleta Chispas Choc Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 370, 177, NULL, NULL, NULL, NULL, NULL),
(12619, 'FP17002', '0118', 'Galleta Avena Pasiero', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 370, 177, NULL, NULL, NULL, NULL, NULL),
(12620, 'FP15007', '0119', 'Galleta Chocolate', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12621, 'FP7015', '012', '+Salsa/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12622, 'FP15005', '0120', 'Galleta Avena', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12623, 'FP15006', '0121', 'Galleta Chispas Chocolate', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12624, 'FP19006', '0122', 'Full Kids 7\" Pepperoni', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12625, 'FP19007', '0123', 'Full Kids 7\" Pollo', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12626, 'FP16004', '0124', 'F Kids Jugo Nadanja', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12627, 'FP26005', '0125', 'Jugo DV Fresh 250 ml', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12628, 'FP15000', '0126', 'Biscocho Marmoleado', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12629, 'FP3001', '0127', 'X- Carne Molida /9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12630, 'FP2001', '0128', 'X- Carne Molida/ 12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12631, 'FP1001', '0129', 'X- Carne Molida/ 16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12632, 'FP15003', '0130', 'Flan Full Pizza', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12633, 'FP3016', '0131', 'X-Tasajo/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12634, 'FP2013', '0132', 'X- Tasajo/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12635, 'FP1013', '0133', 'X- Tasajo/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12636, 'FP25003', '0134', 'Coca Cola Ligth Lata', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12637, 'FP26011', '0135', 'Te Fuze Limon/Pq', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12638, 'FP25014', '0136', 'Te Fuze Limon/Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12639, 'FP24020', '0137', 'Te Fuze Limon/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12640, 'FP24002', '0138', 'Coca Cola 32 onz', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12641, 'FP24005', '0139', 'Fanta 32 onz', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12642, 'FP24010', '0140', 'Kist 32 onz', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12643, 'FP24017', '0141', 'Sprite 32 onz', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12644, 'FP24007', '0142', 'Fresca 32 onz', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12645, 'FP24019', '0143', 'Te Fuze Limon 32 onz', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12646, 'FP15004', '0144', 'Full Pizza de Chocolate', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12647, 'FP19003', '0145', 'Full Bruchetta', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12648, 'FP19009', '0146', 'Full Palito', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12649, 'FP14005', '0147', 'Full Peperoni Deluxe 9\"', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12650, 'FP12005', '0148', 'Full Peperoni Deluxe 12\"', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12651, 'FP13006', '0149', 'Full Peperoni Deluxe 16\"', '0.00', '0.0000', '14.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12652, 'FP13000', '0150', 'Fll Ranchera de 16\"', '0.00', '0.0000', '14.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12653, 'FP14009', '0151', 'Full Ranchera 9\"', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12654, 'FP12009', '0152', 'Full Ranchera de 12\"', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12655, 'FP19000', '0153', 'Combo  Peperoni Deluxe 2 Prs', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12656, 'FP19002', '0154', 'Combo Ranchera 2 Prs', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12657, 'FP18003', '0155', 'Con Full Palito', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12658, 'FP18002', '0156', 'Con Full Bruscheta', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 371, 177, NULL, NULL, NULL, NULL, NULL),
(12659, 'FP16017', '0157', 'RL Coca Cola 16 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12660, 'FP16019', '0158', 'RL Kist Fresa 16 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12661, 'FP16018', '0159', 'RL Fresca 16 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12662, 'FP16023', '0160', 'RL Te Fuze 16 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12663, 'FP16021', '0161', 'RL Naranja 16 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12664, 'FP16022', '0162', 'RL Sprote 16 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12665, 'FP16020', '0163', 'RL Kitz Uva 16 Oz', '0.00', '0.0000', '0.00', '0.00', 0, 1, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12666, 'FP19004', '0164', 'Full Dolar -1', '0.00', '0.0000', '-1.00', '0.00', 0, 0, 0, 54, 63, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12667, 'FP15002', '0165', 'Crumble de Manzana y Nueces', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12668, 'FP15009', '0166', 'Marquesa con Biscocho', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12669, 'FP15010', '0167', 'Merengue Limeño', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12670, 'FP19011', '0168', 'Masa 0.100 Gr', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12671, 'FP19010', '0169', 'Lasagna Carne', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 64, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12672, 'FP19012', '0170', 'Pan con Ajo ()', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 350, 177, NULL, NULL, NULL, NULL, NULL),
(12673, 'FP24009', '0171', 'Freska 1.25 Lts', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12674, 'FP24011', '0172', 'Kist Fresa 1.25', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12675, 'FP16005', '0173', 'Freska 1.25', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12676, 'FP16007', '0174', 'Kist Frea 1.25', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 67, 393, 177, NULL, NULL, NULL, NULL, NULL),
(12677, 'FP14008', '100', 'FULL Queso 9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12678, 'FP6009', '1002', 'COMBO Tocino 9\"', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12679, 'FP6008', '1003', 'COMBO Salchicha 9\"', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12680, 'FP5005', '1004', 'COMBO Queso 4Prs', '0.00', '0.0000', '11.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12681, 'FP5002', '1005', 'COMBO Jamon 4Prs', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12682, 'FP5003', '1006', 'COMBO Pepperoni 4Prs', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12683, 'FP5001', '1009', 'COMBO Chorizo 4Prs', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12684, 'FP14006', '101', 'FULL Pepperoni 9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12685, 'FP5006', '1010', 'COMBO Salchicha 4Prs', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12686, 'FP5007', '1011', 'COMBO Tocino 4Prs', '0.00', '0.0000', '15.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12687, 'FP5004', '1012', 'COMBO Pollo 4Prs', '0.00', '0.0000', '15.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12688, 'FP5008', '1013', 'COMBO Vegetales 4Prs', '0.00', '0.0000', '13.00', '0.00', 0, 0, 0, 54, 64, 67, 349, 177, NULL, NULL, NULL, NULL, NULL),
(12689, 'FP6010', '1014', 'COMBO Vegetales 9\"', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12690, 'FP14001', '1017', 'FULL Chorizo 9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12691, 'FP14010', '1018', 'FULL Salchicha 9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12692, 'FP14011', '1019', 'FULL Tocino 9', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12693, 'FP12001', '1022', 'FULL Chorizo 12', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12694, 'FP12010', '1023', 'FULL Salchicha 12', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12695, 'FP12011', '1024', 'FULL Tocino 12', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12696, 'FP13002', '1027', 'FULL Chorizo 16', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12697, 'FP13010', '1028', 'FULL Salchicha 16', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12698, 'FP13011', '1029', 'FULL Tocino 16', '0.00', '0.0000', '10.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12699, 'FP14012', '103', 'FULL Vegetales 9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12700, 'FP6001', '1032', 'Combo Agrandado', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12701, 'FP3004', '1034', 'X- Chorizo/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12702, 'FP3012', '1035', 'X- Salchicha/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12703, 'FP3014', '1036', 'X- Tocino/9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12704, 'FP2004', '1039', 'X- Chorizo/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12705, 'FP2012', '1040', 'X- Salchicha/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12706, 'FP2014', '1041', 'X- Tocino/12', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12707, 'FP1004', '1044', 'X- Chorizo/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12708, 'FP1012', '1045', 'X- Salchicha/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12709, 'FP1014', '1046', 'X- Tocino/16', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12710, 'FP12008', '106', 'FULL Queso 12', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12711, 'FP12006', '107', 'FULL Pepperoni 12', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12712, 'FP12012', '109', 'FULL Vegetales 12', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12713, 'FP13009', '112', 'FULL Queso 16', '0.00', '0.0000', '6.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12714, 'FP13007', '113', 'FULL Pepperoni 16', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12715, 'FP13012', '115', 'FULL Vegetales 16', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12716, 'FP3008', '118', 'X- Peperoni/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12717, 'FP3003', '120', 'X- Champiñon/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12718, 'FP3007', '121', 'X- Mozzarella/9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12719, 'FP3000', '124', 'X- Aceituna/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12720, 'FP3005', '126', 'X- J.Pierna/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12721, 'FP3013', '127', 'X- Salchichon/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12722, 'FP3009', '132', 'X- Pimenton/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12723, 'FP3002', '133', 'X- Cebolla/9', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 354, 177, NULL, NULL, NULL, NULL, NULL),
(12724, 'FP2008', '140', 'X- Peperoni/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12725, 'FP2003', '142', 'X- Champiñon/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12726, 'FP2007', '143', 'X- Mozzarella/12', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12727, 'FP2000', '146', 'X- Aceituna/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12728, 'FP2005', '148', 'X- J.Pierna/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12729, 'FP2009', '154', 'X- Pimenton/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12730, 'FP2002', '155', 'X- Cebolla/12', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 355, 177, NULL, NULL, NULL, NULL, NULL),
(12731, 'FP1008', '170', 'X- Peperoni/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12732, 'FP1003', '172', 'X- Champiñon/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12733, 'FP1007', '173', 'X- Mozzarella/16', '0.00', '0.0000', '4.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12734, 'FP1000', '176', 'X- Aceituna/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12735, 'FP1005', '178', 'X- J.Pierna/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12736, 'FP1009', '184', 'X- Pimenton/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12737, 'FP1002', '185', 'X- Cebolla/16', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 392, 177, NULL, NULL, NULL, NULL, NULL),
(12738, 'FP15011', '201', 'Pie De Manzana', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 0, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12739, 'FP15012', '203', 'Torta De Queso', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 0, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12740, 'FP10001', '207', 'Porc.Sirope Choc', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 367, 177, NULL, NULL, NULL, NULL, NULL),
(12741, 'FP15001', '208', 'Brownie', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 0, 365, 177, NULL, NULL, NULL, NULL, NULL),
(12742, 'FP26008', '251', 'Nestea Limon/Pq', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 67, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12743, 'FP26000', '254', 'Agua Mineral', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 67, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12744, 'FP25010', '256', 'Nestea Limon/Med', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 67, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12745, 'FP30001', '259', 'Jugo Fresa', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 368, 177, NULL, NULL, NULL, NULL, NULL),
(12746, 'FP24014', '265', 'Nestea Limon/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 1, 0, 54, 63, 67, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12747, 'FP26001', '270', 'Coca Cola/pq', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12748, 'FP26010', '272', 'Sprite/Pq', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12749, 'FP26006', '273', 'Kitz/Pq', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12750, 'FP26003', '274', 'Fanta/Pq', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 351, 177, NULL, NULL, NULL, NULL, NULL),
(12751, 'FP25004', '275', 'Coca Cola/Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12752, 'FP25005', '276', 'Coca Light/Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12753, 'FP25013', '277', 'Sprite/Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12754, 'FP25006', '278', 'Fanta/Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12755, 'FP25008', '279', 'Kitz/Med', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 352, 177, NULL, NULL, NULL, NULL, NULL),
(12756, 'FP24003', '280', 'Coca Cola/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12757, 'FP24018', '282', 'Sprite/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12758, 'FP24012', '283', 'Kizt/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12759, 'FP24006', '284', 'Fanta/Gde', '0.00', '0.0000', '1.00', '0.00', 0, 0, 0, 54, 63, 0, 353, 177, NULL, NULL, NULL, NULL, NULL),
(12760, 'FP13005', '285', 'FULL Jamon 16', '0.00', '0.0000', '8.00', '0.00', 0, 0, 0, 54, 63, 67, 345, 177, NULL, NULL, NULL, NULL, NULL),
(12761, 'FP12004', '286', 'FULL Jamon 12', '0.00', '0.0000', '5.00', '0.00', 0, 0, 0, 54, 63, 67, 343, 177, NULL, NULL, NULL, NULL, NULL),
(12762, 'FP14004', '287', 'FULL Jamon 9', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 63, 67, 342, 177, NULL, NULL, NULL, NULL, NULL),
(12763, 'FP22011', '300', '-Peperoni/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12764, 'FP22007', '301', '-J.Serrano/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12765, 'FP22005', '302', '-Champiñon/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12766, 'FP22009', '303', '-Mozzarella/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12767, 'FP22010', '304', '-Parmesano/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12768, 'FP22002', '305', '-Alcachofa/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12769, 'FP22001', '306', '-Aceituna/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12770, 'FP22000', '307', '-A.Oliva/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12771, 'FP22006', '308', '-J.Pierna/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12772, 'FP22016', '309', '-Salchichon/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12773, 'FP22003', '310', '-Anchoa/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12774, 'FP22015', '311', '-Q.Munster/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `receta_id`) VALUES
(12775, 'FP22014', '312', '-Q.Gouda/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12776, 'FP22013', '313', '-Q.Azul/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12777, 'FP22012', '314', '-Pimenton/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12778, 'FP22004', '315', '-Cebolla/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12779, 'FP22008', '316', '-Maiz/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 362, 177, NULL, NULL, NULL, NULL, NULL),
(12780, 'FP9010', '320', '+Peperoni/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12781, 'FP9007', '321', '+J.Serrano/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12782, 'FP9005', '322', '+Champiñon/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12783, 'FP9014', '323', '+Q.Mozzarrella/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12784, 'FP9009', '324', '+Parmesano/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12785, 'FP9002', '325', '+Alcachofa/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12786, 'FP9001', '326', '+Aceituna/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12787, 'FP9000', '327', '+A.Oliva/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12788, 'FP9006', '328', '+J.Pierna/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12789, 'FP9016', '329', '+Salchichon/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12790, 'FP9003', '330', '+Anchoa/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12791, 'FP9015', '331', '+Q.Munster/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12792, 'FP9013', '332', '+Q.Gouda/Peq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12793, 'FP9012', '333', '+Q.Azul/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12794, 'FP9011', '334', '+Pimenton/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12795, 'FP9004', '335', '+Cebolla/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12796, 'FP9008', '336', '+Maiz/Pq', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 358, 177, NULL, NULL, NULL, NULL, NULL),
(12797, 'FP21012', '340', '-Peperoni/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12798, 'FP21005', '342', '-Champiñon/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12799, 'FP21010', '343', '-Mozzarella/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12800, 'FP21011', '344', '-Parmesano/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12801, 'FP21002', '345', '-Alcachofa/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12802, 'FP21001', '346', '-Aceituna/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12803, 'FP21000', '347', '-A.Oliva/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12804, 'FP21006', '348', '-J.Pierna/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12805, 'FP21017', '349', '-Salchichon/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12806, 'FP21003', '350', '-Anchoa/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12807, 'FP21016', '351', '-Q.Munster/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12808, 'FP21015', '352', '-Q.Gouda/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12809, 'FP21014', '353', '-Q.Azul/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12810, 'FP21013', '354', '-Pimenton/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12811, 'FP21004', '355', '-Cebolla/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12812, 'FP21009', '356', '-Maiz/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 363, 177, NULL, NULL, NULL, NULL, NULL),
(12813, 'FP8009', '360', '+Peperoni/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12814, 'FP8007', '361', '+J.Serrano/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12815, 'FP8005', '362', '+Champiñon/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12816, 'FP8013', '363', '+Q.Mozzarella/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12817, 'FP8015', '364', '+Q.Parmesano/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12818, 'FP8002', '365', '+Alcachofa/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12819, 'FP8001', '366', '+Aceituna/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12820, 'FP8000', '367', '+A.Oliva/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12821, 'FP8006', '368', '+J.Pierna/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12822, 'FP8016', '369', '+Salchichon/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12823, 'FP8003', '370', '+Anchoa/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12824, 'FP8014', '371', '+Q.Munster/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12825, 'FP8012', '372', '+Q.Gouda/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12826, 'FP8011', '373', '+Q.Azul/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12827, 'FP8010', '374', '+Pimenton/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12828, 'FP8004', '375', '+Cebolla/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12829, 'FP8008', '376', '+Maiz/Med', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 359, 177, NULL, NULL, NULL, NULL, NULL),
(12830, 'FP20010', '380', '-Peperoni/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12831, 'FP20005', '382', '-Champiñon/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12832, 'FP20008', '383', '-Mozzarella/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12833, 'FP20009', '384', '-Parmesano/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12834, 'FP20002', '385', '-Alcachofa/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12835, 'FP20001', '386', '-Aceituna/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12836, 'FP20000', '387', '-A.Oliva/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12837, 'FP20006', '388', '-J.Pierna/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12838, 'FP20015', '389', '-Salchichon/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12839, 'FP20003', '390', '-Anchoa/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12840, 'FP20014', '391', '-Q.Munster/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12841, 'FP20013', '392', '-Q.Gouda/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12842, 'FP20012', '393', '-Q.Azul/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12843, 'FP20011', '394', '-Pimenton/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12844, 'FP20004', '395', '-Cebolla/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12845, 'FP20007', '396', '-Maiz/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12846, 'FP20017', '397', '-Salsa/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 364, 177, NULL, NULL, NULL, NULL, NULL),
(12847, 'FP7009', '400', '+Peperoni/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12848, 'FP7006', '401', '+J.Serrano/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12849, 'FP7004', '402', '+Champiñon/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12850, 'FP7007', '403', '+Mozzarella/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12851, 'FP7008', '404', '+Parmesano/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12852, 'FP7001', '406', '+Aceituna/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12853, 'FP7000', '407', '+A.Oliva/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12854, 'FP7005', '408', '+J.Pierna/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12855, 'FP7014', '409', '+Salchichon/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12856, 'FP7002', '410', '+Anchoa/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12857, 'FP7013', '411', '+Q.Munster/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12858, 'FP7012', '412', '+Q.Gouda/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12859, 'FP7011', '413', '+Q.Azul/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12860, 'FP7010', '414', '+Pimenton/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12861, 'FP7003', '415', '+Cebolla/Gde', '0.00', '0.0000', '0.00', '0.00', 0, 0, 0, 54, 63, 0, 361, 177, NULL, NULL, NULL, NULL, NULL),
(12862, 'FP6007', '677', 'COMBO Queso 9\"', '0.00', '0.0000', '2.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12863, 'FP6004', '678', 'COMBO Jamon 9\"', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12864, 'FP6005', '681', 'COMBO Pepperoni 9\"', '0.00', '0.0000', '3.00', '0.00', 0, 0, 0, 54, 64, 67, 346, 177, NULL, NULL, NULL, NULL, NULL),
(12865, 'PLSA0039', '', 'pastel jamon y queso', '9.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 269, 156, NULL, NULL, NULL, NULL, NULL),
(12866, 'PLSAU1500007', '', 'PASTEL JAMON Y QUESO', '9.00', '0.0000', '11.50', '11.19', 0, 0, 0, 54, 63, 67, 260, 155, NULL, NULL, NULL, NULL, NULL),
(12868, 'PLSAU1500003', '', 'PASTEL JAMON Y QUESO', '9.00', '0.0000', '9.70', '9.44', 1, 0, 0, 54, 63, 67, 310, 157, NULL, NULL, NULL, NULL, NULL),
(12869, 'PLPE0075', '', 'BOLSA PARA LLEVAR', '2.00', '0.0000', '1.20', '1.17', 0, 0, 0, 54, 63, 67, 267, 155, NULL, NULL, NULL, NULL, NULL),
(12870, 'PLSAU0700004', 'PLSAU0700004', 'Pastel de Jamon y Queso - A', '9.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 86, 84, NULL, NULL, NULL, NULL, NULL),
(12871, 'PLSAU0600002', 'PLAE0039', 'Bolsa para Llevar - A', '0.00', '0.0000', '1.50', '1.46', 0, 0, 0, 54, 63, 67, 108, 84, NULL, NULL, NULL, NULL, NULL),
(12873, 'PLSB1000011', '', 'Limonada - B', '1.00', '0.0000', '2.30', '2.43', 1, 0, 0, 54, 63, 67, 309, 157, NULL, NULL, NULL, NULL, NULL),
(12876, 'PLSAU1500007', '', 'Pastel Jamon y Queso - B', '9.00', '0.0000', '12.00', '11.68', 0, 0, 0, 54, 63, 67, 310, 157, NULL, NULL, NULL, NULL, NULL),
(12877, 'PLSAU1400003', '', 'Bolsa para Llevar - B', '1.00', '0.0000', '1.50', '1.46', 0, 0, 0, 54, 63, 67, 317, 157, NULL, NULL, NULL, NULL, NULL),
(12878, 'PLSB1000011', '', 'Limonada - B', '1.00', '0.0000', '2.30', '2.43', 1, 0, 0, 54, 63, 67, 268, 156, NULL, NULL, NULL, NULL, NULL),
(12879, 'PLSAU1400003', '', 'Bolsa para Llevar - B', '1.00', '0.0000', '1.50', '1.46', 0, 0, 0, 54, 63, 67, 276, 156, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_orden`
--

CREATE TABLE `producto_has_orden` (
  `producto_id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_unidad_negocio`
--

CREATE TABLE `producto_has_unidad_negocio` (
  `producto_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `stock_venta` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_has_unidad_negocio`
--

INSERT INTO `producto_has_unidad_negocio` (`producto_id`, `unidad_negocio_id`, `stock_venta`) VALUES
(1, 1, 2),
(2, 1, 10),
(3, 1, 20),
(4, 1, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `ubicacion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `razon_social`, `correo`, `status`, `ubicacion_id`) VALUES
(1, 'DAFILCA,C.A.', NULL, NULL, 0, 1),
(2, 'PRODOTTI IL BUONGUSTAIO', NULL, NULL, 0, 3),
(3, 'DIST. GOUPIGOIS, C.A.', NULL, NULL, 0, 8),
(4, 'DISTRIBUIDORA  PACK & FOOD', NULL, NULL, 0, 10),
(5, 'Pepsi Cola Venezuela, C.A.', NULL, NULL, 0, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_has_mercancia`
--

CREATE TABLE `proveedor_has_mercancia` (
  `mercancia_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `codigo_x_proveedor` varchar(30) DEFAULT NULL,
  `precio` decimal(19,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor_has_mercancia`
--

INSERT INTO `proveedor_has_mercancia` (`mercancia_id`, `proveedor_id`, `codigo_x_proveedor`, `precio`, `status`) VALUES
(1, 1, 'pv200', '780.00', 0),
(2, 5, 'pa333', '800.00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_has_telefono`
--

CREATE TABLE `proveedor_has_telefono` (
  `proveedor_id` int(11) NOT NULL,
  `telefono_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor_has_telefono`
--

INSERT INTO `proveedor_has_telefono` (`proveedor_id`, `telefono_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `costo` decimal(19,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id`, `nombre`, `costo`) VALUES
(1, 'Refresco Coca-cola', NULL),
(2, 'Arroz Primor', NULL),
(3, 'Brownie', NULL),
(4, 'Pepsi Cola 16 Oz ', NULL),
(5, 'Atun Margarita', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_has_receta`
--

CREATE TABLE `receta_has_receta` (
  `receta_id` int(11) NOT NULL,
  `sub_receta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `receta_has_receta`
--

INSERT INTO `receta_has_receta` (`receta_id`, `sub_receta_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia`
--

CREATE TABLE `referencia` (
  `id` int(11) NOT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `referencia`
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
(122, 'Compra directa', 121),
(123, 'Reposicion de mercancia', 121),
(124, 'Remision de mercancia', 121),
(125, 'status_notificaciones', NULL),
(126, 'Solicitud de remision', 125),
(127, 'Remision enviada', 125),
(128, 'Remision Recibida', 125),
(129, 'Reposicion de mercancia', 125),
(130, 'tipo_movimiento', NULL),
(131, 'Entra', 130),
(132, 'Sale', 130),
(133, 'Error', 121),
(134, 'Procesada', 125);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remision`
--

CREATE TABLE `remision` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(20) NOT NULL,
  `descripcion` text,
  `cantidad` int(5) DEFAULT NULL,
  `unidad_medida_id` int(11) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mercancia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `remision`
--

INSERT INTO `remision` (`id`, `fecha`, `hora`, `descripcion`, `cantidad`, `unidad_medida_id`, `unidad_negocio_id`, `usuario_id`, `mercancia_id`) VALUES
(1, '2017-08-19', '2:23:04 am', 'solicitud de prueba', 2, 5, 1, 15, 1),
(2, '2017-08-19', '2:24:40 am', 'solicitud de prueba', 2, 5, 1, 15, 1),
(3, '2017-08-19', '2:25:42 am', 'se perdio el ultimo litro que quedaba', 1, 4, 1, 15, 4),
(4, '2017-08-19', '2:41:47 am', 'se perdio el ultimo litro que quedaba', 1, 4, 1, 15, 4),
(5, '2017-08-21', '8:10:38 pm', 'prueba con tienda no asignada', 3, 19, 1, 3, 1),
(6, '2017-08-22', '11:17:04 pm', 'solicitud de prueba', 2, 5, 3, 15, 1),
(7, '2017-08-22', '11:24:41 pm', 'solo necesitamos 1 kg', 1, 5, 1, 15, 1),
(8, '2017-08-31', '6:14:21 am', 'pruebas', 2, 4, 1, 15, 4),
(9, '2017-09-08', '6:30:23 pm', 'prueba 1', 2, 7, 1, 15, 9),
(10, '2017-11-30', '2:35:28 pm', 'prueba', 2, 4, 1, 15, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reposicion_mercancia`
--

CREATE TABLE `reposicion_mercancia` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(15) NOT NULL,
  `total` varchar(20) DEFAULT NULL,
  `tipo_reposicion` varchar(45) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reposicion_mercancia`
--

INSERT INTO `reposicion_mercancia` (`id`, `fecha`, `hora`, `total`, `tipo_reposicion`, `unidad_negocio_id`, `usuario_id`) VALUES
(1, '2017-11-30', '3:37:56 pm', '6.000,00', 'compra a proveedores', 1, 15),
(2, '2017-11-30', '4:33:45 pm', '36.000,00', 'compra a proveedores', 1, 15),
(3, '2017-11-30', '4:39:37 pm', '3.002,00', 'compra a proveedores', 1, 15),
(4, '2017-11-30', '4:40:28 pm', '9.002,00', 'compra a proveedores', 1, 15),
(5, '2017-11-30', '4:48:06 pm', '144.048,00', 'compra a proveedores', 1, 15),
(6, '2017-11-30', '4:02:48 pm', '7.560,00', 'compra a proveedores', 59, 15),
(7, '2017-11-30', '4:49:25 pm', '3.960,00', 'compra a proveedores', 59, 15),
(8, '2017-11-30', '4:53:55 pm', '1.560,00', 'compra a proveedores', 59, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id` int(11) NOT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `codigo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `telefono`
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
-- Estructura de tabla para la tabla `telefono_has_cliente`
--

CREATE TABLE `telefono_has_cliente` (
  `telefono_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL,
  `edificio` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `urbanizacion` varchar(45) NOT NULL,
  `nro_intercomunicador` varchar(45) NOT NULL,
  `punto_referencia` varchar(150) NOT NULL,
  `parroquia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `edificio`, `calle`, `urbanizacion`, `nro_intercomunicador`, `punto_referencia`, `parroquia_id`) VALUES
(1, '24', 'san juan', 'Guarenas', '6', 'Conjunto residencial ubicado Frente a la farmacia', 36),
(3, '235b', 'san rafael', 'brisas de propatria', '2', 'escaleras san vicente', 36),
(8, 'monaquito', 'Av Monaco', 'La california', '22a', 'a una cuadra de la estacion de metrobus la california', 70),
(10, '10 D', 'calle', 'Nueva casarapa', '3-33', 'a dos cuadras del centro comercial rojo', 92),
(11, 'Sanduvi Plaza', '3ra Transversal', 'Sta Eduvigis', '104', 'Frente a la Iglesia Preciosisima Sangre (Santa Eduvigis)', 95);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id` int(11) NOT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidad_medida`
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
(20, 'Cuñete(s)', 'Cte', 2),
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
-- Estructura de tabla para la tabla `unidad_negocio`
--

CREATE TABLE `unidad_negocio` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `rif` varchar(45) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `numero_autorizacion` varchar(45) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `modelo_has_submodelo_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidad_negocio`
--

INSERT INTO `unidad_negocio` (`id`, `codigo`, `rif`, `nombre`, `razon_social`, `numero_autorizacion`, `correo`, `modelo_has_submodelo_id`, `empresa_id`) VALUES
(1, '0030', 'J-29468624-9', 'FP AEROPUERTO', 'Operadora Aeropuerto 2007 C.A.', '582946524', 'fpaeropuerto@fullpizza.com', 1, 59),
(2, '0011', 'J-29706562-8', 'FP BOLEITA', 'Operadora FpBoleita 011 C.A.', '558865103', 'fpboleita@fullpizza.com', 1, 59),
(3, '0029', 'J-29637315-5', 'FP CCCT', 'Operadora Tamanaco 2008 C.A.', '708751670', 'fpccct@fullpizza.com', 1, 59),
(4, '26', 'J-29600796-9', 'FP IPSFA', 'Operadora FP Los Proceres C.A.', '218262314', 'fpipsfa@fullpizza.com', 1, 59),
(5, '7', 'J-29706585-7', 'FP LIDO', 'Operadora FP Lido 007 C.A.', '520421640', 'fplido@fullpizza.com', 1, 59),
(6, '25', 'J-29637305-1', 'FP MILLENIUM', 'Operadora Millenium 2008 C.A.', '589228495', 'fpmillenium@fullpizza.com', 1, 59),
(7, '61', 'J-29830763-3', 'FP BICENTENARIO', 'Operadora Plaza Venezuela 2009 C.A.', '593151194', 'fp.ccs.bicentenario@fullpizza.com', 1, 59),
(8, '10', 'J-29706547-4', 'FP RECREO', 'Operadora FP El Recreo 010 C.A.', '737410268', 'fprecreo@fullpizza.com', 1, 59),
(9, '9', 'J-29706492-3', 'FP SAMBIL DIVERSION', 'Operadora FP Diversion009 C.A.', '570456763', 'fpdiversion@fullpizza.com', 1, 59),
(10, '8', 'J-29737409-4', 'FP SAMBIL FERIA', 'Operadora FP Feria CCS 008 C.A.', '256706677', 'fpferia@fullpizza.com', 1, 59),
(11, '22', 'J-30895190-0', 'FP TOLON', 'Productora La Confitiure de Oro C.A.', '845661486', 'fptolon@fullpizza.com', 1, 59),
(12, '2000', 'J-30895190-0', 'CHIPCOOKIE TOLON', 'Productora La Confitiure de Oro C.A.', '164869818', 'fptolon@fullpizza.com', 11, 59),
(13, '2', 'J-29706491-5', 'FP UCAB', 'Operadora UCAB 002 C.A.', '121649327', 'fpucab@fullpizza.com', 1, 59),
(14, '34', 'J-29638215-8', 'FP ACARIGUA', 'Operadora El Llano 2008 C.A.', '944126839', 'fpllanomall@fullpizza.com', 1, 59),
(15, '63', 'J-29800629-3', 'FP AVIADORES', 'Operadora Maracay 2009 C.A.', '432893570', 'fp.may.sigo@fullpizza.com', 1, 59),
(16, '17', 'J-29521250-0', 'FP S. BARQUISIMETO', 'Operadora Barquisimeto C.A.', '926740298', 'fpsambbarquisimeto', 1, 59),
(17, '54', 'J- 31749880-1', 'FP S. MARACAIBO', 'Operadora FP El Lago 2011 C.A.', '892605624', 'fpmaracaibo@fullpizza.com', 1, 59),
(18, '0020', 'J-29370529-0', 'FP MTRP BARQUISIMETO', 'Operadora Lara-0632006 C.A.', '977261513', 'fpbarquisimeto@fullpizza.com', 1, 59),
(19, '12', 'J-29706495-8', 'FP MTRP VALENCIA', 'Operadora FPMetropolis 012 C.A.', '118410771', 'fpmetropolis@fullpizza.com', 1, 59),
(20, '42', 'J-29871770-0', 'FP PARAGUANA', 'Operadora FP Paraguana 2009 C.A.', '784354406', 'fpparaguana@fullpizza.com', 1, 59),
(21, '0', 'J-29706489-3', 'FP LAS TRINITARIAS', 'Operadora Este C.A.', '915468342', 'fpparis@fullpizza.com', 1, 59),
(22, '31', 'J-29724582-0', 'FP PLAZA MAYOR', 'Operadora Plaza Puerto C.A.', '557479912', 'fpplzmayor@fullpizza.com', 1, 59),
(23, '14', 'J-29706490-7', 'FP S. MARGARITA', 'Operadora FP Margarita 014 C.A.', '291160155', 'fpmargarita@fullpizza.com', 1, 59),
(24, '13', 'J-29706494-0', 'FP SAMBIL VALENCIA', 'Operadora FP Valencia 013 C.A.', '631763844', 'fpsambvalencia@fullpiza.com', 1, 59),
(25, '4', 'J-29365112-3', 'FP TACHIRA', 'Operadora FPST2007 C.A.', '679193173', 'fpsncristobal@fullpizza.com', 1, 59),
(26, '58', 'J-40125261-3', 'FP PUENTE REAL', 'Pizza Real C.A.', '414606929', 'fppuentereal@fullpizza.com', 1, 59),
(27, '56', 'J-40064201-9', 'FP PROPATRIA', 'Pizzerias del Oeste 132, C.A. ', '990971977', 'fppropatria@fullpizza.com', 1, 59),
(28, '37', 'J-29449227-4', 'FP LIDER', 'Representaciones Pasadena C.A.', '470604320', 'fplider@fullpizza.com', 1, 59),
(29, '21', 'J-30948141-0', 'FP GALERIAS MARACAY', 'XLunch C.A.', '963799571', 'fpgalmaracay@fullpizza.com', 1, 59),
(31, '39', 'J-29839358-0', 'FP LA VELA', 'Inversiones Pampatar C.A.', '413388225', 'fplavela@fullpizza.com', 1, 59),
(32, '38', 'J-29848534-1', 'FP ALTAVISTA II', 'Representaciones Nemar C.A.', '899787596', 'fpaltavistaii@fullpizza.com', 1, 59),
(33, '18', 'J-29369833-9', 'FP PZA ATLANTICO', 'Inversiones Lamo C.A.', '934240973', 'fpptoordaz@fullpizza.com', 1, 59),
(34, '52', 'J-30707128-1', 'PLK CHACAO', 'Operadora PLK Elice C.A.', '278183304', 'plchacao@fullpizza.com', NULL, 59),
(35, '47', 'J-29997801-9', 'PLK PETARE', 'Operadora PLS Petare C.A.', '953912705', 'plpetare@fullpizza.com', NULL, 59),
(36, '45', 'J-29600831-0', 'PLK SABANA GRANDE', 'Operadora Los Ilustres C.A.', '473309215', 'plsabanagrande@fullpizza.com', NULL, 59),
(37, '62', 'J-40232165-1', 'PLK AEROPUERTO', 'Inversiones 3055530 C.A.', '903710294', 'pl.mqt.aeropuerto@pizzaloka.com.ve', NULL, 59),
(38, '32', 'J-29980564-5', 'PLK CIUDAD TRAKI', 'Inversora Nesi C.A.', '268297438', 'plciudadtraki@fullpizza.com', NULL, 59),
(39, '1024', 'J-30757227-2', 'OH LALA CHACAITO', 'Operadora DLV003 C.A.', '749733641', 'ccs.expreso@ohlala.com.ve', 6, 59),
(40, '1008', 'J-29896375-1', 'OHLALA METROPOLIS', 'Corporacion Prestigio PQM C.A.', '773982449', 'oh.val.metropolis@ohlala.com', 6, 59),
(41, '1002', 'J-29637224-1', 'OHLALA RECREO FERIA', 'Representaciones Somaroma 2009 C.A.', '610219931', 'oh.ccs.recreo@ohlala.com.ve', 6, 59),
(42, '1027', 'J- 40232151-1', 'OH RECREO KIOSKO', 'Inversiones OH Recreo 2012 C.A.', '897915414', 'oh.ccs.recreo@ohlala.com.ve', 6, 59),
(43, '902', 'J-317690060', 'MUFFIN CAFE ', 'Inversiones 238882 C.A.', '650368289', 'mcaeropuerto@fullpizza.com', NULL, 59),
(44, '1010', 'J-31749269-2', 'OHLALA METROPOLIS BQ', 'Inversiones JCR, C.A. ', '615914811', 'iqpm1421@gmail.com', 6, 59),
(45, '1009', 'J-29350955-6', 'OHLALA SAMBIL BQMTO', 'Inversiones QP1421 C.A.', '671526111', 'iqpm1421@gmail.com', 6, 59),
(46, '1000', 'J-31578297-9', 'OHLALA EMBAJADA ', 'Bh Pack C.A.', '229366884', 'oh.ccs.embajada@ohlala.com.ve', 6, 59),
(47, '901', 'J-30757411-9', 'RB MILLENIUM', 'Operadora DLV005 C.A.', '122334469', 'rbmillenium@fullpizza.com', NULL, 59),
(48, '3005', 'J-40232160-0', 'RB RECREO', 'Operadora RB Recreo 2012 C.A.', '237766659', 'rb.oh.ccs.recreo@ricoburrito.com', NULL, 59),
(49, '3002', 'J-40232150-3', 'RB LIDER', 'Inversiones RB lider 2012 C.A.', '227880793', 'rb.ccs.lider@ricoburrito.com', NULL, 59),
(50, '3004', 'J-40232147-3', 'RB METROPOLIS', 'Operadora RB Metropolis 2012 C.A.', '378767461', 'rb.val.metropolis@ricoburrito.com', NULL, 59),
(51, '3000', 'J-40148998-2', 'RB CHACAITO', 'Operadora Popular Rondon 2012', '208208162', 'rb.ccs.expreso@ricoburrito.com', NULL, 59),
(52, '5', 'J-29869805-5', 'ANTILLANA', 'Operadora de Alimentos Antillana 2010 C.A.', '554774117', 'antillana@fullpizza.com', NULL, 59),
(53, '57', 'J-40107855-9', 'GREEN MARTINI', 'Representaciones Green Margarita C.A.', '724265130', 'greenmartini@fullpizza.com', NULL, 59),
(54, '6', 'J-29724633-9', 'PICCOLA', 'Operadora FP Piccola 006 C.A.', '568751869', 'piccola@fullpizza.com', NULL, 59),
(55, '3', 'J-31329666-0', 'ALLEGRE TRATTORIA', 'Cooperativa El Nazareno 1562 RL', '314665353', 'trattoria@fullpizza.com', NULL, 59),
(56, '8000', 'J-313017167', 'BAGEL NOSH', 'Corporacion ORLICA', '428802584', NULL, NULL, 59),
(57, '5000', 'J-40520881-3', 'RESTAURANT LA MAR', 'AyB Hernandez Sanchez C.A.', '316460380', 'nelsonrhernandez10@gmail.com', NULL, 59),
(58, '59', 'J-30756999-9', 'FP DELIVERY TIENDA', 'Operadora DLV001 C.A.', '814231707', NULL, NULL, 59),
(59, '8888', NULL, 'Corporacion multifranquicia', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
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
-- Estructura de tabla para la tabla `usuario_has_unidad_negocio`
--

CREATE TABLE `usuario_has_unidad_negocio` (
  `usuario_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_has_unidad_negocio`
--

INSERT INTO `usuario_has_unidad_negocio` (`usuario_id`, `unidad_negocio_id`) VALUES
(1, 1),
(3, 1),
(15, 1),
(1, 2),
(1, 3),
(15, 3),
(3, 4),
(15, 4),
(3, 5),
(2, 7),
(1, 39),
(3, 39),
(15, 39),
(1, 59),
(15, 59);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  ADD KEY `fk_cliente_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_cliente_ubicacion1_idx` (`ubicacion_id`);

--
-- Indices de la tabla `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_combo_modelo1_idx` (`submodelo_id`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_direccion_direccion1_idx` (`padre_id`),
  ADD KEY `fk_direccion_referencia1_idx` (`referencia_id`);

--
-- Indices de la tabla `explosion`
--
ALTER TABLE `explosion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_id` (`grupo`),
  ADD KEY `producto_id` (`producto`),
  ADD KEY `unidad_negocio_id` (`unidad_negocio_id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingrediente_has_receta`
--
ALTER TABLE `ingrediente_has_receta`
  ADD KEY `fk_materia_prima_has_receta_receta1_idx` (`receta_id`),
  ADD KEY `fk_materia_prima_has_receta_materia_prima1_idx` (`ingrediente_id`),
  ADD KEY `fk_ingrediente_has_receta_unidad_medida1_idx` (`unidad_medida_id`);

--
-- Indices de la tabla `kardex`
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
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_unidad_negocio1_idx` (`unidad_negocio_id`);

--
-- Indices de la tabla `mercancia`
--
ALTER TABLE `mercancia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mercancia_referencia1_idx` (`familia_id`),
  ADD KEY `fk_mercancia_unidad_medida1_idx` (`unidad_medida_compra_id`),
  ADD KEY `fk_mercancia_unidad_medida2_idx` (`unidad_medida_consumo_id`),
  ADD KEY `fk_mercancia_unidad_medida3_idx` (`unidad_medida_sistema_id`),
  ADD KEY `receta_id` (`receta_id`);

--
-- Indices de la tabla `mercancia_has_reposicion`
--
ALTER TABLE `mercancia_has_reposicion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingrediente_id` (`ingrediente_id`),
  ADD KEY `unidad_medida_id` (`unidad_medida_id`),
  ADD KEY `proveedor_id` (`proveedor_id`),
  ADD KEY `unidad_medida_id_2` (`unidad_medida_id`),
  ADD KEY `reposicion_id` (`reposicion_id`);

--
-- Indices de la tabla `mercancia_has_unidad_negocio`
--
ALTER TABLE `mercancia_has_unidad_negocio`
  ADD PRIMARY KEY (`mercancia_id`,`unidad_negocio_id`),
  ADD KEY `fk_inventario_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_mercancia_has_unidad_negocio_mercancia1_idx` (`mercancia_id`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_modelo_modelo1_idx` (`padre_id`);

--
-- Indices de la tabla `modelo_has_grupo`
--
ALTER TABLE `modelo_has_grupo`
  ADD PRIMARY KEY (`modelo_id`,`grupo_id`),
  ADD KEY `fk_modelo_has_grupo_grupo1_idx` (`grupo_id`),
  ADD KEY `fk_modelo_has_grupo_modelo1_idx` (`modelo_id`);

--
-- Indices de la tabla `modelo_has_receta`
--
ALTER TABLE `modelo_has_receta`
  ADD PRIMARY KEY (`modelo_id`,`receta_id`),
  ADD KEY `fk_modelo_has_receta_receta1_idx` (`receta_id`),
  ADD KEY `fk_modelo_has_receta_modelo1_idx` (`modelo_id`);

--
-- Indices de la tabla `modelo_has_submodelo`
--
ALTER TABLE `modelo_has_submodelo`
  ADD PRIMARY KEY (`id`,`modelo_id`,`sub_modelo_id`),
  ADD KEY `fk_modelo_has_modelo_modelo2_idx` (`sub_modelo_id`),
  ADD KEY `fk_modelo_has_modelo_modelo1_idx` (`modelo_id`);

--
-- Indices de la tabla `notificacion_has_remision`
--
ALTER TABLE `notificacion_has_remision`
  ADD PRIMARY KEY (`reposicion_id`,`unidad_negocio_id`,`remision_id`),
  ADD KEY `fk_kardex_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_kardex_has_unidad_negocio_reposicion1_idx` (`reposicion_id`),
  ADD KEY `fk_kardex_has_unidad_negocio_remision1_idx` (`remision_id`),
  ADD KEY `fk_notificacion_has_remision_referencia1_idx` (`status_id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orden_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_orden_referencia1_idx` (`tipo_pago_id`),
  ADD KEY `fk_orden_referencia2_idx` (`status_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_grupo1_idx` (`grupo_id`),
  ADD KEY `fk_producto_receta1_idx` (`receta_id`);

--
-- Indices de la tabla `producto_has_orden`
--
ALTER TABLE `producto_has_orden`
  ADD PRIMARY KEY (`producto_id`,`orden_id`),
  ADD KEY `fk_producto_has_orden_orden1_idx` (`orden_id`),
  ADD KEY `fk_producto_has_orden_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `producto_has_unidad_negocio`
--
ALTER TABLE `producto_has_unidad_negocio`
  ADD PRIMARY KEY (`producto_id`,`unidad_negocio_id`),
  ADD KEY `fk_producto_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_producto_has_unidad_negocio_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ubicacion_id` (`ubicacion_id`);

--
-- Indices de la tabla `proveedor_has_mercancia`
--
ALTER TABLE `proveedor_has_mercancia`
  ADD PRIMARY KEY (`mercancia_id`,`proveedor_id`),
  ADD KEY `fk_proveedor_has_mercancia_mercancia1_idx` (`mercancia_id`),
  ADD KEY `fk_proveedor_has_mercancia_proveedor1_idx` (`proveedor_id`);

--
-- Indices de la tabla `proveedor_has_telefono`
--
ALTER TABLE `proveedor_has_telefono`
  ADD PRIMARY KEY (`proveedor_id`,`telefono_id`),
  ADD KEY `fk_proveedor_has_telefono_telefono1_idx` (`telefono_id`),
  ADD KEY `fk_proveedor_has_telefono_proveedor1_idx` (`proveedor_id`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receta_has_receta`
--
ALTER TABLE `receta_has_receta`
  ADD PRIMARY KEY (`receta_id`,`sub_receta_id`),
  ADD KEY `fk_receta_has_receta_receta2_idx` (`sub_receta_id`),
  ADD KEY `fk_receta_has_receta_receta1_idx` (`receta_id`);

--
-- Indices de la tabla `referencia`
--
ALTER TABLE `referencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_referencia_referencia1_idx` (`padre_id`);

--
-- Indices de la tabla `remision`
--
ALTER TABLE `remision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_remision_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_remision_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_remision_ingrediente1_idx` (`mercancia_id`),
  ADD KEY `unimedida` (`unidad_medida_id`);

--
-- Indices de la tabla `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_carga_compra_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_carga_compra_usuario1_idx` (`usuario_id`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_telefono_referencia1_idx` (`codigo_id`);

--
-- Indices de la tabla `telefono_has_cliente`
--
ALTER TABLE `telefono_has_cliente`
  ADD PRIMARY KEY (`telefono_id`,`cliente_id`),
  ADD KEY `fk_telefono_has_cliente_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_telefono_has_cliente_telefono1_idx` (`telefono_id`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ubicacion_direccion1_idx` (`parroquia_id`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_unidad_medida_unidad_medida1_idx` (`padre_id`);

--
-- Indices de la tabla `unidad_negocio`
--
ALTER TABLE `unidad_negocio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_unidad_negocio_modelo_has_submodelo1_idx` (`modelo_has_submodelo_id`),
  ADD KEY `fk_unidad_negocio_unidad_negocio1_idx` (`empresa_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_referencia1_idx` (`tipo_usuario_id`),
  ADD KEY `fk_usuario_referencia2_idx` (`pregunta_id`);

--
-- Indices de la tabla `usuario_has_unidad_negocio`
--
ALTER TABLE `usuario_has_unidad_negocio`
  ADD PRIMARY KEY (`usuario_id`,`unidad_negocio_id`),
  ADD KEY `fk_usuario_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`),
  ADD KEY `fk_usuario_has_unidad_negocio_usuario1_idx` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `combo`
--
ALTER TABLE `combo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT de la tabla `explosion`
--
ALTER TABLE `explosion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;
--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT de la tabla `mercancia`
--
ALTER TABLE `mercancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `mercancia_has_reposicion`
--
ALTER TABLE `mercancia_has_reposicion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12880;
--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `referencia`
--
ALTER TABLE `referencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT de la tabla `remision`
--
ALTER TABLE `remision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_ubicacion1` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `combo`
--
ALTER TABLE `combo`
  ADD CONSTRAINT `fk_combo_modelo1` FOREIGN KEY (`submodelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_direccion_direccion1` FOREIGN KEY (`padre_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_direccion_referencia1` FOREIGN KEY (`referencia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `explosion`
--
ALTER TABLE `explosion`
  ADD CONSTRAINT `fk_unidad_negocio_id` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingrediente_has_receta`
--
ALTER TABLE `ingrediente_has_receta`
  ADD CONSTRAINT `fk_ingrediente_has_receta_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mercancia_id` FOREIGN KEY (`ingrediente_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `fk_kardex_mercancia1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kardex_motivo_id` FOREIGN KEY (`motivo_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_tipo_movimiento_id` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kardex_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mercancia`
--
ALTER TABLE `mercancia`
  ADD CONSTRAINT `fk_mercancia_referencia1` FOREIGN KEY (`familia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida1` FOREIGN KEY (`unidad_medida_compra_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida2` FOREIGN KEY (`unidad_medida_consumo_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida3` FOREIGN KEY (`unidad_medida_sistema_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mercancia_has_reposicion`
--
ALTER TABLE `mercancia_has_reposicion`
  ADD CONSTRAINT `fk_ingrediente_id` FOREIGN KEY (`ingrediente_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prov_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reposicion_id` FOREIGN KEY (`reposicion_id`) REFERENCES `reposicion_mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mercancia_has_unidad_negocio`
--
ALTER TABLE `mercancia_has_unidad_negocio`
  ADD CONSTRAINT `fk_inventario_has_unidad_negocio_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_has_unidad_negocio_mercancia1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `fk_modelo_modelo1` FOREIGN KEY (`padre_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelo_has_grupo`
--
ALTER TABLE `modelo_has_grupo`
  ADD CONSTRAINT `fk_modelo_has_grupo_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelo_has_receta`
--
ALTER TABLE `modelo_has_receta`
  ADD CONSTRAINT `fk_modelo_has_receta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelo_has_submodelo`
--
ALTER TABLE `modelo_has_submodelo`
  ADD CONSTRAINT `fk_modelo_has_modelo_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modelo_has_modelo_modelo2` FOREIGN KEY (`sub_modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_orden_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden_referencia1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden_referencia2` FOREIGN KEY (`status_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_receta_id` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_has_orden`
--
ALTER TABLE `producto_has_orden`
  ADD CONSTRAINT `fk_producto_has_orden_orden1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_has_unidad_negocio`
--
ALTER TABLE `producto_has_unidad_negocio`
  ADD CONSTRAINT `fk_producto_has_unidad_negocio_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_ubicacion_proveedor` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor_has_mercancia`
--
ALTER TABLE `proveedor_has_mercancia`
  ADD CONSTRAINT `fk_proveedor_has_mercancia_mercancia1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedor_has_mercancia_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor_has_telefono`
--
ALTER TABLE `proveedor_has_telefono`
  ADD CONSTRAINT `fk_proveedor_has_telefono_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedor_has_telefono_telefono1` FOREIGN KEY (`telefono_id`) REFERENCES `telefono` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `referencia`
--
ALTER TABLE `referencia`
  ADD CONSTRAINT `fk_referencia_referencia1` FOREIGN KEY (`padre_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `remision`
--
ALTER TABLE `remision`
  ADD CONSTRAINT `fk_remision_ingrediente1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_remision_um1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_remision_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_remision_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
  ADD CONSTRAINT `fk_carga_compra_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carga_compra_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `fk_telefono_referencia1` FOREIGN KEY (`codigo_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefono_has_cliente`
--
ALTER TABLE `telefono_has_cliente`
  ADD CONSTRAINT `fk_telefono_has_cliente_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_telefono_has_cliente_telefono1` FOREIGN KEY (`telefono_id`) REFERENCES `telefono` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `fk_ubicacion_direccion1` FOREIGN KEY (`parroquia_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD CONSTRAINT `fk_unidad_medida_unidad_medida1` FOREIGN KEY (`padre_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `unidad_negocio`
--
ALTER TABLE `unidad_negocio`
  ADD CONSTRAINT `fk_unidad_negocio_modelo_has_submodelo1` FOREIGN KEY (`modelo_has_submodelo_id`) REFERENCES `modelo_has_submodelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_unidad_negocio_unidad_negocio1` FOREIGN KEY (`empresa_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_referencia1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_referencia2` FOREIGN KEY (`pregunta_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_has_unidad_negocio`
--
ALTER TABLE `usuario_has_unidad_negocio`
  ADD CONSTRAINT `fk_usuario_has_unidad_negocio_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_unidad_negocio_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
