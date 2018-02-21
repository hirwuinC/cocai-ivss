-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-01-2018 a las 09:08:14
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
  `monto` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `porcentaje_vta` decimal(19,4) DEFAULT '0.0000',
  `costo` decimal(19,4) DEFAULT '0.0000',
  `costo_total` decimal(19,4) DEFAULT '0.0000',
  `porcentaje_costo` decimal(19,4) DEFAULT '0.0000',
  `unidad_negocio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `explosion`
--

INSERT INTO `explosion` (`id`, `fecha`, `fecha_ranking`, `grupo`, `codigo_prod`, `producto`, `cantidad`, `monto`, `porcentaje_vta`, `costo`, `costo_total`, `porcentaje_costo`, `unidad_negocio_id`) VALUES
(1, '2018-01-12', '2018-01-11', 'Alimentos', 'ST0187', 'Ensalada de papas', 2, '30000.0000', '70.0000', '0.0000', '0.0000', '0.0000', 506),
(2, '2018-01-12', '2018-01-11', 'Alimentos', 'ST0013', 'Arroz con pollo', 4, '50000.0000', '85.0000', '0.0000', '0.0000', '0.0000', 506),
(3, '2018-01-12', '2018-01-12', 'Alimentos', 'ST0187', 'Ensalada de papas', 2, '30000.0000', '70.0000', '0.0000', '0.0000', '0.0000', 506),
(4, '2018-01-12', '2018-01-12', 'Alimentos', 'ST0013', 'Arroz con pollo', 4, '50000.0000', '85.0000', '0.0000', '0.0000', '0.0000', 506);

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
  `familia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `ordNum`, `codigo`, `nombre`, `recetaInactiva`, `subGrupo`, `imagenProducto`, `familia_id`) VALUES
(1, '3', NULL, 'PIZZAS 12', 0, NULL, NULL, 116),
(2, '4', NULL, 'PIZZAS 16', 0, NULL, NULL, 116),
(3, '1', NULL, 'POSTRES', 0, NULL, NULL, 116),
(4, '2', NULL, 'BEBIDAS 16 Oz', 0, NULL, NULL, 117),
(5, '5', NULL, 'Ensaladas', 0, NULL, NULL, 116);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_has_explosion`
--

CREATE TABLE `ingredientes_has_explosion` (
  `explosion_id` int(11) NOT NULL,
  `ingrediente_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingredientes_has_explosion`
--

INSERT INTO `ingredientes_has_explosion` (`explosion_id`, `ingrediente_id`, `producto_id`, `cantidad`, `unidad_medida_id`) VALUES
(1, 49, NULL, '1600.0000', 6),
(1, 39, NULL, '100.0000', 6),
(1, 37, NULL, '100.0000', 6),
(1, 50, NULL, '2.0000', 13),
(1, 43, NULL, '10.0000', 6),
(1, 51, NULL, '200.0000', 6),
(1, 52, NULL, '20.0000', 6),
(1, 47, NULL, '10.0000', 6),
(1, 45, NULL, '2.0000', 6),
(1, 53, NULL, '2.0000', 13),
(2, 4, NULL, '320.0000', 12),
(2, 33, NULL, '320.0000', 6),
(2, 35, NULL, '300.0000', 6),
(2, 36, NULL, '100.0000', 6),
(2, 37, NULL, '1000.0000', 6),
(2, 38, NULL, '10000.0000', 6),
(2, 39, NULL, '1000.0000', 6),
(2, 40, NULL, '4000.0000', 12),
(2, 41, NULL, '100.0000', 6),
(2, 43, NULL, '100.0000', 6),
(2, 44, NULL, '1000.0000', 6),
(2, 45, NULL, '20.0000', 6),
(2, 46, NULL, '5000.0000', 6),
(2, 47, NULL, '100.0000', 6),
(2, 48, NULL, '300.0000', 6),
(3, 49, NULL, '1600.0000', 6),
(3, 39, NULL, '100.0000', 6),
(3, 37, NULL, '100.0000', 6),
(3, 50, NULL, '2.0000', 13),
(3, 43, NULL, '10.0000', 6),
(3, 51, NULL, '200.0000', 6),
(3, 52, NULL, '20.0000', 6),
(3, 47, NULL, '10.0000', 6),
(3, 45, NULL, '2.0000', 6),
(3, 53, NULL, '2.0000', 13),
(4, 4, NULL, '320.0000', 12),
(4, 33, NULL, '320.0000', 6),
(4, 35, NULL, '300.0000', 6),
(4, 36, NULL, '100.0000', 6),
(4, 37, NULL, '1000.0000', 6),
(4, 38, NULL, '10000.0000', 6),
(4, 39, NULL, '1000.0000', 6),
(4, 40, NULL, '4000.0000', 12),
(4, 41, NULL, '100.0000', 6),
(4, 43, NULL, '100.0000', 6),
(4, 44, NULL, '1000.0000', 6),
(4, 45, NULL, '20.0000', 6),
(4, 46, NULL, '5000.0000', 6),
(4, 47, NULL, '100.0000', 6),
(4, 48, NULL, '300.0000', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente_has_receta`
--

CREATE TABLE `ingrediente_has_receta` (
  `ingrediente_id` int(11) DEFAULT NULL,
  `receta_id` int(11) NOT NULL,
  `cantidad` decimal(19,4) DEFAULT '0.0000',
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingrediente_has_receta`
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
(16, 17, '2.0000', 6),
(17, 17, '3.0000', 12),
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
(22, 17, '333.0021', 6),
(23, 17, '2.0000', 13),
(29, 13, '1.0000', 12),
(26, 18, '200.0000', 6),
(15, 17, '2323.0000', 12),
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
(47, 20, '25.0000', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cantidad` decimal(19,4) DEFAULT '0.0000',
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
(2, '2017-08-15', '10:12:10', '24000.0000', 'bulto de arroz', 131, 1, 1, 15, 6, 122),
(3, '2017-08-15', '15:19:05', '22800.0000', 'medio bulto de arroz', 131, 1, 1, 15, 6, 122),
(4, '2017-08-15', '15:44:08', '48000.0000', 'refresco de 2 litro', 131, 2, 1, 15, 12, 122),
(5, '2017-08-15', '15:00:45', '2000.0000', 'Solicitud de emergencia por que se acabo el arroz', 131, 1, 1, 3, 6, 122),
(6, '2017-08-15', '15:09:38', '21600.0000', 'Solicitud de emergencia por que se acabo el arroz', 131, 1, 5, 15, 6, 122),
(7, '2017-08-15', '15:19:22', '24000.0000', 'Compra de arroz aprovechando una oferta de un proveedor', 131, 1, 7, 1, 6, 122),
(8, '2017-08-18', '08:38:17', '71280.0000', '', 132, 1, 59, 15, 6, 133),
(9, '2017-08-18', '08:38:49', '71280.0000', '', 132, 1, 59, 15, 6, 133),
(14, '2017-08-18', '08:42:15', '71280.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(15, '2017-08-21', '02:57:43', '90000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(16, '2017-08-21', '03:00:26', '90000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(17, '2017-08-21', '03:00:36', '90000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(18, '2017-08-21', '03:01:54', '90000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(19, '2017-08-21', '03:01:55', '90000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(20, '2017-08-21', '03:01:56', '90000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(21, '2017-08-21', '03:01:56', '90000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(22, '2017-08-21', '03:03:11', '90000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(23, '2017-08-21', '03:09:33', '108000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(24, '2017-08-21', '03:11:55', '108000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(25, '2017-08-21', '03:14:51', '108000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(26, '2017-08-21', '03:16:24', '108000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(27, '2017-08-21', '03:16:54', '108000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(29, '2017-11-22', '12:12:13', '0.0000', '33600', 132, 1, 59, 15, 12, 133),
(30, '2017-11-22', '12:18:38', '0.0000', '33600', 132, 1, 59, 15, 12, 133),
(31, '2017-11-22', '12:37:04', '0.0000', '33600', 132, 1, 59, 15, 12, 133),
(32, '2017-11-22', '12:38:08', '0.0000', '33600', 132, 1, 59, 15, 12, 133),
(34, '2017-11-22', '12:38:31', '0.0000', '33600', 132, 4, 59, 15, 12, 133),
(35, '2017-11-22', '01:02:46', '0.0000', '2000', 132, 11, 59, 15, 6, 133),
(36, '2017-11-22', '01:03:03', '0.0000', '2000', 132, 11, 59, 15, 6, 133),
(37, '2017-11-22', '01:15:45', '0.0000', '50', 132, 2, 59, 15, 12, 133),
(38, '2017-11-22', '01:16:13', '0.0000', '1000', 132, 2, 59, 15, 12, 133),
(39, '2017-11-22', '01:16:57', '0.0000', '3000', 132, 2, 59, 15, 12, 133),
(40, '2017-11-22', '03:56:49', '3000.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(41, '2017-11-23', '09:48:33', '3500.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(42, '2017-11-23', '10:41:50', '2500.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(43, '2017-11-23', '02:54:47', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(44, '2017-11-23', '02:55:14', '2500.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(45, '2017-11-23', '02:55:27', '3500.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(46, '2017-11-23', '02:55:34', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(47, '2017-11-24', '03:11:56', '1206500.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(48, '2017-11-24', '03:13:23', '8500.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(49, '2017-11-24', '03:13:54', '10500.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(50, '2017-11-24', '03:39:47', '11100.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(51, '2017-11-24', '03:41:20', '11100.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(52, '2017-11-24', '03:42:30', '20100.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(53, '2017-11-24', '05:17:03', '22100.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(54, '2017-11-27', '09:52:03', '23300.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(55, '2017-11-27', '10:42:59', '24300.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(56, '2017-11-27', '10:45:47', '25300.0000', 'Error cargando los datos del producto', 132, 2, 1, 15, 12, 133),
(57, '2017-11-27', '10:48:39', '26500.0000', 'se derramo un litro ', 132, 2, 1, 15, 12, 122),
(58, '2017-11-27', '12:46:59', '5500.0000', 'prueba 2', 132, 2, 59, 15, 12, 122),
(59, '2017-12-04', '10:15:30', '2970.0000', 'Producto creado', 131, 12, 59, 15, 6, 123),
(60, '2017-12-04', '11:09:57', '81.0000', 'Producto creado', 131, 13, 59, 15, 12, 123),
(61, '2017-12-04', '02:46:34', '2000.0000', 'Producto creado', 131, 14, 59, 15, 6, 123),
(62, '2017-12-04', '02:49:55', '6000.0000', 'Producto creado', 131, 15, 59, 15, 12, 123),
(63, '2017-12-04', '03:00:37', '1000.0000', 'Producto creado', 131, 16, 59, 15, 6, 123),
(64, '2017-12-04', '03:05:04', '6000.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(65, '2017-12-04', '03:05:41', '6000.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(66, '2017-12-04', '03:26:37', '6000.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(67, '2017-12-04', '03:26:52', '6000.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(68, '2017-12-04', '03:28:13', '6000.0000', 'Error cargando los datos del producto', 132, 15, 59, 15, 12, 133),
(69, '2017-12-04', '04:05:43', '5000.0000', 'Producto creado', 131, 17, 59, 15, 12, 123),
(70, '2017-12-04', '04:27:15', '2000.0000', 'Producto creado', 131, 18, 59, 15, 6, 123),
(71, '2017-12-06', '02:55:43', '0.0000', 'Error cargando los datos del producto', 132, 15, 1, 15, 12, 133),
(75, '2017-12-27', '10:48:01', '3000.0000', 'Producto creado', 131, 31, 59, 15, 6, 123),
(76, '2017-12-27', '10:48:35', '5600.0000', 'Error cargando los datos del producto', 132, 2, 59, 15, 12, 133),
(77, '2017-12-27', '10:49:26', '2970.0000', 'Error cargando los datos del producto', 132, 12, 59, 15, 6, 133),
(78, '2017-12-28', '09:33:04', '3000.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133),
(79, '2017-12-28', '11:05:32', '3000.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133),
(80, '2017-12-28', '11:10:55', '3000.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133),
(81, '2017-12-28', '11:11:59', '3000.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133),
(82, '2017-12-28', '11:15:47', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(83, '2017-12-28', '11:17:25', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(84, '2017-12-28', '11:17:51', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(85, '2017-12-28', '11:18:15', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(86, '2017-12-28', '11:18:33', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(87, '2017-12-28', '11:20:30', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(88, '2017-12-28', '11:41:28', '42240.0000', 'Producto creado', 131, 32, 59, 15, 6, 123),
(89, '2017-12-28', '11:43:03', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(90, '2018-01-08', '12:05:12', '3000.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133),
(91, '2018-01-08', '12:05:27', '3000.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133),
(92, '2018-01-08', '12:05:37', '3000.0000', 'Error cargando los datos del producto', 132, 1, 1, 15, 6, 133),
(93, '2018-01-08', '12:48:58', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(94, '2018-01-08', '12:49:09', '3000.0000', 'Error cargando los datos del producto', 132, 1, 59, 15, 6, 133),
(95, '2018-01-11', '03:24:00', '3000.0000', 'Error cargando los datos del producto', 132, 21, 59, 1, 13, 133),
(96, '2018-01-17', '02:31:27', '10000.0000', 'Producto creado', 131, 54, 60, 10, 6, 123),
(99, '2018-01-22', '04:57:52', '0.0000', 'Producto semi terminado, registrado en sistema', 131, 59, 59, 15, 6, 123);

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
(104, '2018-01-22', '04:57:52', 'Producto', 'masa para pizza 2', 'Creado', 'Freddy Diaz', 59);

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
  `tipo_mercancia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mercancia`
--

INSERT INTO `mercancia` (`id`, `codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `sub_familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`, `peso_escurrido`, `descripcion`, `exento_impuesto`, `receta_id`, `tipo_mercancia_id`) VALUES
(1, 'A001', '', 'Arroz', 'Primor', '1000.0000', '990.0000', 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, 18, 160),
(2, 'B002', '', 'Refresco', 'Coca-cola', '5000.0000', '2000.0000', 12, 'Cja * 2000', 'Ltrs *', 'Ml *', 117, NULL, 11, 4, 12, NULL, NULL, NULL, 12, 160),
(4, 'AC001', NULL, 'Aceite', 'Vatel', '0.0000', '1000.0000', 12, 'Cja * 1000', NULL, NULL, 116, NULL, 11, 4, 12, NULL, NULL, NULL, NULL, 160),
(6, 'Q0010', '', 'Queso', 'Mozarella', '10000.0000', '600.0000', 12, 'Cja * 600', NULL, NULL, 116, NULL, 11, 5, 6, NULL, NULL, NULL, NULL, 160),
(7, 'H0012', '', 'Harina', 'Pan', '8000.0000', '990.0000', 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, NULL, 160),
(8, 'J0041', NULL, 'Jamon', 'Plumrose', '50000.0000', '25000.0000', 1, 'Pza * 2500', '', '', 116, NULL, 14, 5, 6, NULL, NULL, NULL, NULL, 160),
(9, '59006', NULL, 'Agua saborizada', 'Los andes', '1000.0000', '700.0000', 24, 'Cja * 700', NULL, NULL, 117, NULL, 11, 7, 12, NULL, NULL, 1, NULL, 160),
(11, '59007', 'abcdf', 'harina', 'juana', '40000.0000', '1000.0000', 24, 'Blto * 1000', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, '1000.0000', 'harina de maiz', 1, NULL, 160),
(12, '59007', 'abcd', 'arroz', 'mary', '4000.0000', '990.0000', 3, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, '1000.0000', 'arroz mary 1 kg', 0, NULL, 160),
(13, '59008', 'p003', 'Refresco', 'refresco pepsi de 1 litro', '50.0000', '1000.0000', 9, 'Cja * 9', 'null', 'null', 117, NULL, 11, 4, 12, NULL, NULL, NULL, NULL, 160),
(14, '59009', NULL, 'pasta', 'primor', '40.0000', '1000.0000', 2, 'Kgs * 1000', 'null', 'null', 116, NULL, 5, 5, 6, '1000.0000', 'probando', 0, NULL, 160),
(15, '5900101', '', 'Refresco', 'Sevenup', '50000.0000', '2000.0000', 3, 'Cja * 2000', 'null', 'null', 117, NULL, 11, 4, 12, NULL, NULL, NULL, NULL, 160),
(16, '590010', NULL, 'Atun', 'Margarita', '3000.0000', '500.0000', 2, 'Lta * 500', 'null', 'null', 116, NULL, 15, 15, 6, '450.0000', 'atun enlatado margarita 500gr', 0, 13, 160),
(17, '590011', NULL, 'salsa', 'ketchup', '2000.0000', '250.0000', 20, 'Ltrs * 250', 'null', 'null', 116, NULL, 4, 4, 12, '250.0000', 'prueba precio proveedor', 0, NULL, 160),
(18, '590012', NULL, 'azucar', 'la lucha', '25000.0000', '1000.0000', 2, 'Kgs * 1000', 'null', 'null', 116, NULL, 5, 5, 6, '1000.0000', 'probando', 0, NULL, 160),
(21, 'BRI001', '', 'Brownie', 'Savoy', '1000.0000', '600.0000', 12, 'Cja * 600', 'Un *', 'Un *', 116, NULL, 11, 13, 13, NULL, NULL, NULL, 23, 160),
(22, 'CM001', '', 'Caramelos', 'Menta', '1000.0000', '1.0000', 24, 'Cja * 1', 'Gr *', 'Gr *', 116, NULL, 11, 6, 6, NULL, NULL, NULL, NULL, 160),
(23, 'CC001', '', 'Cucharitas', 'de postre', '1000.0000', '20.0000', 24, 'Pqte * 20', 'Un *', 'Un *', 119, NULL, 16, 13, 13, NULL, NULL, NULL, NULL, 160),
(24, 'SVZ001', '', 'Servilletas z', 'Paveca', '5000.0000', '100.0000', 100, 'Pqte * 100', 'Un *', 'Un *', 119, NULL, 16, 13, 13, NULL, NULL, NULL, NULL, 160),
(26, 'AL001', '', 'Albahaca', '', '1000.0000', '990.0000', 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, NULL, 160),
(27, 'TM001', '', 'Tomate', '', '700.0000', '1.0000', 1, 'Blto * 1', 'Kgs *', 'Gr *', 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160),
(28, 'CP001', '', 'Cuchillos', 'Plasticos', '6000.0000', '100.0000', 100, 'Pqte * 100', 'Un *', 'Un *', 119, NULL, 16, 13, 13, NULL, NULL, NULL, NULL, 160),
(29, 'ADC001', '', 'Aderezo', 'Caprese', '1000.0000', '990.0000', 24, 'Caja * 990', 'Ltr *', 'Ml *', 116, NULL, 11, 4, 12, NULL, NULL, NULL, NULL, 160),
(30, 'TND001', '', 'Tenedores', 'Plasticos', '6000.0000', '100.0000', 100, 'Pqte * 100', 'Un *', 'Un *', 119, NULL, 16, 13, 13, NULL, NULL, NULL, NULL, 160),
(31, '5900121', '', 'arroz', 'casa', '2000.0000', '1000.0000', 3, 'Kgs * 1000', '', '', 116, NULL, 5, 5, 6, '1100.0000', 'arroz prueba', 0, NULL, 160),
(32, '590021', '', 'probadita', 'wasa', '2000.0000', '2112.0000', 10, 'Cja * 2112', '', '', 116, NULL, 11, 5, 6, NULL, NULL, NULL, NULL, 160),
(33, 'AC003', '', 'Aceitunas verdes', '', '2000.0000', '990.0000', 1, 'Fr * 990', 'Gr *', 'Gr *', 116, NULL, 24, 6, 6, NULL, NULL, NULL, NULL, 160),
(35, 'ACH01', NULL, 'Achiote', ' ', '12000.0000', '1000.0000', 1, 'Paq * 1000', NULL, NULL, 116, NULL, 16, 6, 6, NULL, NULL, NULL, NULL, 160),
(36, 'AJ001', NULL, 'Ajo', ' ', '1000.0000', '1000.0000', 1, 'Paq * 1000', NULL, NULL, 116, NULL, 16, 6, 6, NULL, NULL, NULL, NULL, 160),
(37, 'AP001', NULL, 'Apio', ' ', '10000.0000', '1000.0000', 1, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160),
(38, 'A005', '', 'Arroz', 'Santoni', '20000.0000', '990.0000', 1, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, NULL, 160),
(39, 'CE0002', NULL, 'Cebolla', ' ', '10000.0000', '1000.0000', 1, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160),
(40, 'CO001', NULL, 'Consome', ' ', '2000.0000', '1000.0000', 1, 'Ltr * 1000', NULL, NULL, 116, NULL, 4, 4, 12, NULL, NULL, NULL, NULL, 160),
(41, 'CP002', NULL, 'Cubito', 'Magi', '1000.0000', '100.0000', 10, 'Paq * 100', NULL, NULL, 116, NULL, 16, 6, 6, NULL, NULL, NULL, NULL, 160),
(42, 'CU001', NULL, 'Culantro', ' ', '10000.0000', '1000.0000', 1000, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160),
(43, 'PI0001', NULL, 'Perejil', ' ', '10000.0000', '1000.0000', 1000, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160),
(44, 'PI0002', NULL, 'Pimenton', ' ', '10000.0000', '1000.0000', 1, 'Un * 1000', NULL, NULL, 116, NULL, 13, 6, 6, NULL, NULL, NULL, NULL, 160),
(45, 'Pi0003', NULL, 'Pimienta Molida', ' ', '15000.0000', '1000.0000', 1, 'Paq * 1000', NULL, NULL, 116, NULL, 16, 6, 6, NULL, NULL, NULL, NULL, 160),
(46, 'PO001', '', 'Pollo cocido', ' ', '10000.0000', '1000.0000', 1, 'Kgr * 2000', 'Kgr *', 'Gr *', 116, NULL, 13, 5, 6, NULL, NULL, NULL, NULL, 160),
(47, 'SA001', '', 'Sal', 'casa', '20000.0000', '990.0000', 1, 'Blto * 990', 'Kgs *', 'Gr *', 116, NULL, 19, 5, 6, NULL, NULL, NULL, NULL, 160),
(48, 'G00001', NULL, 'Guisantes', ' ', '10000.0000', '1000.0000', 1, 'Lta * 1000', NULL, NULL, 116, NULL, 15, 6, 6, NULL, NULL, NULL, NULL, 160),
(49, 'PA0001', NULL, 'Papa', ' ', '10000.0000', '1000.0000', 1, 'Gua * 1000', NULL, NULL, 116, NULL, 9, 6, 6, NULL, NULL, NULL, NULL, 160),
(50, 'HU001', '', 'Huevos', 'ovomar', '6000.0000', '1.0000', 24, 'Cja * 1', '', '', 116, NULL, 11, 13, 13, NULL, NULL, NULL, NULL, 160),
(51, 'MY001', '', 'Mayonesa', 'Craft', '30000.0000', '1000.0000', 12, 'Cja * 1000', '', '', 116, NULL, 11, 6, 6, NULL, NULL, NULL, NULL, 160),
(52, 'MT001', '', 'Mostaza', 'Craft', '30000.0000', '1000.0000', 12, 'Cja * 1000', '', '', 116, NULL, 11, 6, 6, NULL, NULL, NULL, NULL, 160),
(53, 'HU001', '', 'Yema de huevo', ' ', '6000.0000', '1.0000', 24, 'Cja * 1', '', '', 116, NULL, 11, 13, 13, NULL, NULL, NULL, NULL, 160),
(54, '600022', '', 'masa para pizza', ' ', '11000.0000', '1000.0000', 10, 'Kgs * 1000', '', '', 116, NULL, 5, 6, 6, '1.0000', '', 0, 24, 160),
(59, 'mp2', '', 'masa para pizza 12', '', NULL, '0.0000', 1, NULL, '', '', 135, 158, NULL, 13, 13, '1.0000', 'prueba', NULL, NULL, 161);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mercancia_has_reposicion`
--

CREATE TABLE `mercancia_has_reposicion` (
  `id` int(11) NOT NULL,
  `cantidad` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `precio` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `ingrediente_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `proveedor_id` int(11) DEFAULT '0',
  `reposicion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mercancia_has_reposicion`
--

INSERT INTO `mercancia_has_reposicion` (`id`, `cantidad`, `precio`, `ingrediente_id`, `unidad_medida_id`, `proveedor_id`, `reposicion_id`) VALUES
(25, '2.0000', '3000.0000', 1, 0, NULL, 1),
(35, '2.0000', '3000.0000', 2, 0, NULL, 1),
(36, '2.0000', '3000.0000', 1, 0, NULL, 2),
(38, '2.0000', '3000.0000', 2, 0, NULL, 2),
(39, '1.0000', '3000.0000', 2, 0, NULL, 3),
(40, '2.0000', '1.0000', 1, 0, NULL, 3),
(41, '2.0000', '1.0000', 1, 0, NULL, 4),
(42, '3.0000', '3000.0000', 2, 0, NULL, 4),
(43, '2.0000', '1.0000', 1, 19, NULL, 5),
(44, '2.0000', '3000.0000', 2, 4, NULL, 5),
(45, '2.0000', '780.0000', 1, 5, NULL, 6),
(46, '3.0000', '800.0000', 2, 4, NULL, 6),
(47, '2.0000', '780.0000', 1, 5, NULL, 7),
(48, '3.0000', '800.0000', 2, 4, NULL, 7),
(49, '2.0000', '780.0000', 1, 5, NULL, 8),
(51, '2.0000', '800.0000', 2, 4, NULL, 8),
(52, '2.0000', '50000.0000', 15, 4, NULL, 9),
(53, '4.0000', '2000.0000', 17, 4, NULL, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mercancia_has_unidad_negocio`
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
-- Volcado de datos para la tabla `mercancia_has_unidad_negocio`
--

INSERT INTO `mercancia_has_unidad_negocio` (`mercancia_id`, `unidad_negocio_id`, `codigo_modelo`, `existencia`, `stock_min`, `stock_max`, `status`, `descripcion`) VALUES
(1, 1, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(1, 39, NULL, '7500.0000', '3000.0000', '9000.0000', 0, NULL),
(1, 59, NULL, '3000.0000', '20000.0000', '60000.0000', 0, NULL),
(1, 60, NULL, '3000.0000', '20000.0000', '60000.0000', 0, NULL),
(1, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(2, 59, NULL, '5600.0000', '30000.0000', '60000.0000', 1, NULL),
(2, 60, NULL, '5600.0000', '30000.0000', '60000.0000', 1, NULL),
(2, 501, NULL, '20.0000', '10.0000', '40.0000', 0, NULL),
(2, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(4, 39, NULL, '4500.0000', '3000.0000', '6000.0000', 0, NULL),
(4, 59, NULL, '33600.0000', '50.0000', '1000.0000', 1, NULL),
(4, 60, NULL, '33600.0000', '50.0000', '1000.0000', 1, NULL),
(4, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(4, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(6, 1, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(6, 59, NULL, '7200.0000', '5000.0000', '10000.0000', 0, NULL),
(6, 60, NULL, '7200.0000', '5000.0000', '10000.0000', 0, NULL),
(6, 501, NULL, '60.0000', '20.0000', '40.0000', 0, NULL),
(6, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(11, 59, NULL, '2000.0000', '10000.0000', '50000.0000', 0, 'harina de maiz'),
(11, 60, NULL, '2000.0000', '10000.0000', '50000.0000', 0, 'harina de maiz'),
(11, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(12, 59, NULL, '2970.0000', '10000.0000', '60000.0000', 0, 'arroz mary 1 kg'),
(12, 60, NULL, '2970.0000', '10000.0000', '60000.0000', 0, 'arroz mary 1 kg'),
(12, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(14, 59, NULL, '2000.0000', '2000.0000', '10000.0000', 0, 'probando'),
(14, 60, NULL, '2000.0000', '2000.0000', '10000.0000', 0, 'probando'),
(14, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(15, 1, NULL, '0.0000', NULL, NULL, 0, NULL),
(15, 59, NULL, '6000.0000', '8000.0000', '60000.0000', 0, '2'),
(15, 60, NULL, '6000.0000', '8000.0000', '60000.0000', 0, '2'),
(15, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(16, 1, NULL, '0.0000', NULL, NULL, 0, NULL),
(16, 59, NULL, '1000.0000', '2000.0000', '50000.0000', 0, 'atun enlatado margarita 500gr'),
(16, 60, NULL, '1000.0000', '2000.0000', '50000.0000', 0, 'atun enlatado margarita 500gr'),
(16, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(17, 1, NULL, '0.0000', NULL, NULL, 0, NULL),
(17, 59, NULL, '5000.0000', '6000.0000', '20000.0000', 0, 'prueba precio proveedor'),
(17, 60, NULL, '5000.0000', '6000.0000', '20000.0000', 0, 'prueba precio proveedor'),
(17, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(18, 1, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(18, 59, NULL, '2000.0000', '5000.0000', '30000.0000', 0, 'probando'),
(18, 60, NULL, '2000.0000', '5000.0000', '30000.0000', 0, 'probando'),
(18, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(21, 1, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(21, 59, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(21, 60, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(21, 501, NULL, '100.0000', '10.0000', '120.0000', 0, NULL),
(22, 1, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(22, 59, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(22, 60, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(22, 501, NULL, '20.0000', '10.0000', '20.0000', 0, NULL),
(22, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(23, 1, NULL, '200.0000', '100.0000', '1000.0000', 0, NULL),
(23, 59, NULL, '200.0000', '100.0000', '1000.0000', 0, NULL),
(23, 60, NULL, '200.0000', '100.0000', '1000.0000', 0, NULL),
(23, 501, NULL, '100.0000', '20.0000', '1200.0000', 0, NULL),
(23, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(24, 1, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(24, 59, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(24, 60, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(24, 501, NULL, '100.0000', '100.0000', '200.0000', 0, NULL),
(24, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(24, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(26, 1, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(26, 59, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(26, 60, NULL, '3000.0000', '30000.0000', '60000.0000', 0, NULL),
(26, 501, NULL, '100.0000', '50.0000', '150.0000', 0, NULL),
(26, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(27, 1, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(27, 59, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(27, 60, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(27, 501, NULL, '20.0000', '10.0000', '70.0000', 0, NULL),
(27, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(27, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(28, 1, NULL, '7500.0000', '3000.0000', '9000.0000', 0, NULL),
(28, 59, NULL, '7500.0000', '3000.0000', '9000.0000', 0, NULL),
(28, 60, NULL, '7500.0000', '3000.0000', '9000.0000', 0, NULL),
(28, 501, NULL, '10.0000', '10.0000', '60.0000', 0, NULL),
(28, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(29, 1, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(29, 59, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(29, 60, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(29, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(30, 1, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(30, 59, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(30, 60, NULL, '1000.0000', '100.0000', '1000.0000', 0, NULL),
(30, 501, NULL, '300.0000', '100.0000', '300.0000', 0, NULL),
(30, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(33, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(35, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(36, 60, NULL, '200.0000', '100.0000', '1000.0000', 0, NULL),
(37, 60, NULL, '5600.0000', '30000.0000', '60000.0000', 1, NULL),
(38, 506, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
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
(54, 505, NULL, '0.0000', '0.0000', '0.0000', 0, NULL),
(59, 59, NULL, '0.0000', '1.0000', '1.0000', 0, 'prueba');

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
(8, 24);

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
(18, 21, 25),
(19, 8, 34),
(20, 12, 35),
(21, 20, 36);

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
(0, 12, 2, 126),
(0, 13, 2, 126),
(0, 5, 3, 126),
(0, 9, 3, 126),
(0, 10, 3, 126),
(0, 11, 3, 126),
(0, 14, 3, 126),
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
(8, 0, 59, 129),
(9, 0, 59, 129),
(10, 0, 59, 129);

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
  `receta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `porcentaje_costo`, `precioVta_A`, `precioVta_B`, `precioVta_C`, `producto_Inactivo`, `tipo`, `ocultar`, `status`, `grupo_id`, `receta_id`) VALUES
(1, 'FPSAU8700004', 'FPSAU8700004', 'Piz. Manhattan 12', '69000.0000', '193.6027', '35640.0000', '26360.7100', '0.0000', 0, 0, 0, '0', 1, 1),
(2, 'FPSAU8800004', 'FPSAU8800004', 'Piz. Manhattan 16', '54000.0000', '121.3800', '44490.0000', '32901.7900', '0.0000', 0, 0, 0, '0', 2, 2),
(3, 'FPSAU9100001', NULL, 'Brownie', '9000.0000', '295081.9672', '3.0500', '37000.0000', '0.0000', 0, 0, 0, '0', 3, 16),
(4, 'FPSAU8300004', NULL, 'Pepsi Cola 16 Oz', '57000.0000', '101.7857', '56000.0000', '48000.0000', '0.0000', 0, 0, 0, '0', 4, 17),
(5, 'FPSE0001118', NULL, 'Ensalada Capresa', '25700.0000', '128.5000', '60000.0000', '17000.0000', '0.0000', 0, 0, 0, '0', 5, 22),
(6, 'ST0013', NULL, 'Arroz con pollo', '133000.0000', '221.6667', '60000.0000', '17000.0000', '0.0000', 0, 0, 0, '0', 5, 20),
(7, 'ST0187', NULL, 'Ensalada de papas', '147000.0000', '735.0000', '20000.0000', '17000.0000', '0.0000', 0, 0, 0, '0', 5, 21);

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
  `stock_venta` decimal(19,4) DEFAULT '0.0000',
  `stock_minimo` decimal(19,4) DEFAULT '0.0000',
  `stock_maximo` decimal(19,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_has_unidad_negocio`
--

INSERT INTO `producto_has_unidad_negocio` (`producto_id`, `unidad_negocio_id`, `stock_venta`, `stock_minimo`, `stock_maximo`) VALUES
(1, 1, '2.0000', '0.0000', '0.0000'),
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
(4, 59, '21.0000', '0.0000', '0.0000'),
(4, 60, '21.0000', '0.0000', '0.0000'),
(4, 501, '21.0000', '0.0000', '0.0000'),
(4, 505, '0.0000', '0.0000', '0.0000'),
(5, 1, '21.0000', '0.0000', '0.0000'),
(5, 59, '21.0000', '0.0000', '0.0000'),
(5, 60, '21.0000', '0.0000', '0.0000'),
(5, 501, '21.0000', '0.0000', '0.0000'),
(6, 59, '21.0000', '0.0000', '0.0000'),
(6, 60, '21.0000', '0.0000', '0.0000'),
(6, 506, '21.0000', '0.0000', '0.0000'),
(7, 59, '10.0000', '0.0000', '0.0000'),
(7, 60, '10.0000', '0.0000', '0.0000'),
(7, 506, '0.0000', '0.0000', '0.0000');

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
(1, 'DAFILCA, C.A.', NULL, NULL, 0, 1),
(2, 'PRODOTTI IL BUONGUSTAIO', NULL, NULL, 0, 3),
(3, 'DIST. GOUPIGOIS, C.A.', NULL, NULL, 0, 8),
(4, 'DISTRIBUIDORA PACK AND FOOD', NULL, NULL, 0, 10),
(5, 'Pepsi Cola Venezuela, C.A.', NULL, NULL, 0, 11),
(6, 'Nuevoproveedor', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_has_mercancia`
--

CREATE TABLE `proveedor_has_mercancia` (
  `mercancia_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `codigo_x_proveedor` varchar(30) DEFAULT NULL,
  `precio` decimal(19,4) DEFAULT '0.0000',
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor_has_mercancia`
--

INSERT INTO `proveedor_has_mercancia` (`mercancia_id`, `proveedor_id`, `codigo_x_proveedor`, `precio`, `status`) VALUES
(1, 1, 'pv200', '780.0000', 0),
(2, 5, 'pa333', '800.0000', 0);

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
  `costo` decimal(19,4) DEFAULT '0.0000',
  `rendimiento` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `receta`
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
(24, 'masa para pizza  ', '0.0000', '1.0000', 5);

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
(134, 'Procesada', 125),
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
(162, 'Asociado', 159);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remision`
--

CREATE TABLE `remision` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(20) NOT NULL,
  `descripcion` text,
  `cantidad` decimal(19,4) DEFAULT '0.0000',
  `unidad_medida_id` int(11) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mercancia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `remision`
--

INSERT INTO `remision` (`id`, `fecha`, `hora`, `descripcion`, `cantidad`, `unidad_medida_id`, `unidad_negocio_id`, `usuario_id`, `mercancia_id`) VALUES
(1, '2017-08-19', '2:23:04 am', 'solicitud de prueba', '2.0000', 5, 1, 15, 1),
(2, '2017-08-19', '2:24:40 am', 'solicitud de prueba', '2.0000', 5, 1, 15, 1),
(3, '2017-08-19', '2:25:42 am', 'se perdio el ultimo litro que quedaba', '1.0000', 4, 1, 15, 4),
(4, '2017-08-19', '2:41:47 am', 'se perdio el ultimo litro que quedaba', '1.0000', 4, 1, 15, 4),
(5, '2017-08-21', '8:10:38 pm', 'prueba con tienda no asignada', '3.0000', 19, 1, 3, 1),
(6, '2017-08-22', '11:17:04 pm', 'solicitud de prueba', '2.0000', 5, 3, 15, 1),
(7, '2017-08-22', '11:24:41 pm', 'solo necesitamos 1 kg', '1.0000', 5, 1, 15, 1),
(8, '2017-08-31', '6:14:21 am', 'pruebas', '2.0000', 4, 1, 15, 4),
(9, '2017-09-08', '6:30:23 pm', 'prueba 1', '2.0000', 7, 1, 15, 9),
(10, '2017-11-30', '2:35:28 pm', 'prueba', '2.0000', 4, 1, 15, 2),
(11, '2017-12-28', '12:07:52 pm', 'probar', '222.0000', 6, 1, 15, 22),
(12, '2017-12-28', '12:09:49 pm', 'prueba 2', '23.0000', 6, 1, 15, 1),
(13, '2017-12-28', '12:12:04 pm', 'prueba 3', '42.2003', 29, 1, 15, 21),
(14, '2018-01-08', '12:53:48 pm', 'abc', '3.0000', 6, 1, 15, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reposicion_mercancia`
--

CREATE TABLE `reposicion_mercancia` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(15) NOT NULL,
  `total` decimal(19,4) DEFAULT '0.0000',
  `tipo_reposicion` varchar(45) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reposicion_mercancia`
--

INSERT INTO `reposicion_mercancia` (`id`, `fecha`, `hora`, `total`, `tipo_reposicion`, `unidad_negocio_id`, `usuario_id`) VALUES
(1, '2017-11-30', '3:37:56 pm', '6.0000', 'compra a proveedores', 1, 15),
(2, '2017-11-30', '4:33:45 pm', '36.0000', 'compra a proveedores', 1, 15),
(3, '2017-11-30', '4:39:37 pm', '3.0020', 'compra a proveedores', 1, 15),
(4, '2017-11-30', '4:40:28 pm', '9.0020', 'compra a proveedores', 1, 15),
(5, '2017-11-30', '4:48:06 pm', '144.0480', 'compra a proveedores', 1, 15),
(6, '2017-11-30', '4:02:48 pm', '7.5600', 'compra a proveedores', 59, 15),
(7, '2017-11-30', '4:49:25 pm', '3.9600', 'compra a proveedores', 59, 15),
(8, '2017-11-30', '4:53:55 pm', '1.5600', 'compra a proveedores', 59, 15),
(9, '2018-01-08', '12:55:11 pm', '108.0000', 'compra a proveedores', 1, 15),
(10, '2018-01-11', '2:22:58 pm', '17.0000', 'compra a proveedores', 1, 15);

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
-- Estructura de tabla para la tabla `unidad_negocio`
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
  `empresa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidad_negocio`
--

INSERT INTO `unidad_negocio` (`id`, `codigo`, `rif`, `razon_social`, `nombre`, `numero_autorizacion`, `modelo_has_submodelo_id`, `correo`, `empresa_id`) VALUES
(1, '0030', 'J-29468624-9', 'Operadora Aeropuerto 2007 C.A.', 'FP AEROPUERTO', '582946524', 1, 'fpaeropuerto@fullpizza.com', 59),
(2, '0011', 'J-29706562-8', 'Operadora FpBoleita 011 C.A.', 'FP BOLEITA', '558865103', 1, 'fpboleita@fullpizza.com', 59),
(3, '0029', 'J-29637315-5', 'Operadora Tamanaco 2008 C.A.', 'FP CCCT', '708751670', 1, 'fpccct@fullpizza.com', 59),
(4, '26', 'J-29600796-9', 'Operadora FP Los Proceres C.A.', 'FP IPSFA', '218262314', 1, 'fpipsfa@fullpizza.com', 59),
(5, '7', 'J-29706585-7', 'Operadora FP Lido 007 C.A.', 'FP LIDO', '520421640', 1, 'fplido@fullpizza.com', 59),
(6, '25', 'J-29637305-1', 'Operadora Millenium 2008 C.A.', 'FP MILLENIUM', '589228495', 1, 'fpmillenium@fullpizza.com', 59),
(7, '61', 'J-29830763-3', 'Operadora Plaza Venezuela 2009 C.A.', 'FP BICENTENARIO', '593151194', 1, 'fp.ccs.bicentenario@fullpizza.com', 59),
(8, '10', 'J-29706547-4', 'Operadora FP El Recreo 010 C.A.', 'FP RECREO', '737410268', 1, 'fprecreo@fullpizza.com', 59),
(9, '9', 'J-29706492-3', 'Operadora FP Diversion009 C.A.', 'FP SAMBIL DIVERSION', '570456763', 1, 'fpdiversion@fullpizza.com', 59),
(10, '8', 'J-29737409-4', 'Operadora FP Feria CCS 008 C.A.', 'FP SAMBIL FERIA', '256706677', 1, 'fpferia@fullpizza.com', 59),
(11, '22', 'J-30895190-0', 'Productora La Confitiure de Oro C.A.', 'FP TOLON', '845661486', 1, 'fptolon@fullpizza.com', 59),
(12, '2000', 'J-30895190-0', 'Productora La Confitiure de Oro C.A.', 'CHIPCOOKIE TOLON', '164869818', 11, 'fptolon@fullpizza.com', 59),
(13, '2', 'J-29706491-5', 'Operadora UCAB 002 C.A.', 'FP UCAB', '121649327', 1, 'fpucab@fullpizza.com', 59),
(14, '34', 'J-29638215-8', 'Operadora El Llano 2008 C.A.', 'FP ACARIGUA', '944126839', 1, 'fpllanomall@fullpizza.com', 59),
(15, '63', 'J-29800629-3', 'Operadora Maracay 2009 C.A.', 'FP AVIADORES', '432893570', 1, 'fp.may.sigo@fullpizza.com', 59),
(16, '17', 'J-29521250-0', 'Operadora Barquisimeto C.A.', 'FP S. BARQUISIMETO', '926740298', 1, 'fpsambbarquisimeto', 59),
(17, '54', 'J- 31749880-1', 'Operadora FP El Lago 2011 C.A.', 'FP S. MARACAIBO', '892605624', 1, 'fpmaracaibo@fullpizza.com', 59),
(18, '0020', 'J-29370529-0', 'Operadora Lara-0632006 C.A.', 'FP MTRP BARQUISIMETO', '977261513', 1, 'fpbarquisimeto@fullpizza.com', 59),
(19, '12', 'J-29706495-8', 'Operadora FPMetropolis 012 C.A.', 'FP MTRP VALENCIA', '118410771', 1, 'fpmetropolis@fullpizza.com', 59),
(20, '42', 'J-29871770-0', 'Operadora FP Paraguana 2009 C.A.', 'FP PARAGUANA', '784354406', 1, 'fpparaguana@fullpizza.com', 59),
(21, '0', 'J-29706489-3', 'Operadora Este C.A.', 'FP LAS TRINITARIAS', '915468342', 1, 'fpparis@fullpizza.com', 59),
(22, '31', 'J-29724582-0', 'Operadora Plaza Puerto C.A.', 'FP PLAZA MAYOR', '557479912', 1, 'fpplzmayor@fullpizza.com', 59),
(23, '14', 'J-29706490-7', 'Operadora FP Margarita 014 C.A.', 'FP S. MARGARITA', '291160155', 1, 'fpmargarita@fullpizza.com', 59),
(24, '13', 'J-29706494-0', 'Operadora FP Valencia 013 C.A.', 'FP SAMBIL VALENCIA', '631763844', 1, 'fpsambvalencia@fullpiza.com', 59),
(25, '4', 'J-29365112-3', 'Operadora FPST2007 C.A.', 'FP TACHIRA', '679193173', 1, 'fpsncristobal@fullpizza.com', 59),
(26, '58', 'J-40125261-3', 'Pizza Real C.A.', 'FP PUENTE REAL', '414606929', 1, 'fppuentereal@fullpizza.com', 59),
(27, '56', 'J-40064201-9', 'Pizzerias del Oeste 132, C.A. ', 'FP PROPATRIA', '990971977', 1, 'fppropatria@fullpizza.com', 59),
(28, '37', 'J-29449227-4', 'Representaciones Pasadena C.A.', 'FP LIDER', '470604320', 1, 'fplider@fullpizza.com', 59),
(29, '21', 'J-30948141-0', 'XLunch C.A.', 'FP GALERIAS MARACAY', '963799571', 1, 'fpgalmaracay@fullpizza.com', 59),
(31, '39', 'J-29839358-0', 'Inversiones Pampatar C.A.', 'FP LA VELA', '413388225', 1, 'fplavela@fullpizza.com', 59),
(32, '38', 'J-29848534-1', 'Representaciones Nemar C.A.', 'FP ALTAVISTA II', '899787596', 1, 'fpaltavistaii@fullpizza.com', 59),
(33, '18', 'J-29369833-9', 'Inversiones Lamo C.A.', 'FP PZA ATLANTICO', '934240973', 1, 'fpptoordaz@fullpizza.com', 59),
(34, '52', 'J-30707128-1', 'Operadora PLK Elice C.A.', 'PLK CHACAO', '278183304', NULL, 'plchacao@fullpizza.com', 59),
(35, '47', 'J-29997801-9', 'Operadora PLS Petare C.A.', 'PLK PETARE', '953912705', NULL, 'plpetare@fullpizza.com', 59),
(36, '45', 'J-29600831-0', 'Operadora Los Ilustres C.A.', 'PLK SABANA GRANDE', '473309215', NULL, 'plsabanagrande@fullpizza.com', 59),
(37, '62', 'J-40232165-1', 'Inversiones 3055530 C.A.', 'PLK AEROPUERTO', '903710294', NULL, 'pl.mqt.aeropuerto@pizzaloka.com.ve', 59),
(38, '32', 'J-29980564-5', 'Inversora Nesi C.A.', 'PLK CIUDAD TRAKI', '268297438', NULL, 'plciudadtraki@fullpizza.com', 59),
(39, '1024', 'J-30757227-2', 'Operadora DLV003 C.A.', 'OH LALA CHACAITO', '749733641', 6, 'ccs.expreso@ohlala.com.ve', 59),
(40, '1008', 'J-29896375-1', 'Corporacion Prestigio PQM C.A.', 'OHLALA METROPOLIS', '773982449', 6, 'oh.val.metropolis@ohlala.com', 59),
(41, '1002', 'J-29637224-1', 'Representaciones Somaroma 2009 C.A.', 'OHLALA RECREO FERIA', '610219931', 6, 'oh.ccs.recreo@ohlala.com.ve', 59),
(42, '1027', 'J- 40232151-1', 'Inversiones OH Recreo 2012 C.A.', 'OH RECREO KIOSKO', '897915414', 6, 'oh.ccs.recreo@ohlala.com.ve', 59),
(43, '902', 'J-317690060', 'Inversiones 238882 C.A.', 'MUFFIN CAFE ', '650368289', NULL, 'mcaeropuerto@fullpizza.com', 59),
(44, '1010', 'J-31749269-2', 'Inversiones JCR, C.A. ', 'OHLALA METROPOLIS BQ', '615914811', 6, 'iqpm1421@gmail.com', 59),
(45, '1009', 'J-29350955-6', 'Inversiones QP1421 C.A.', 'OHLALA SAMBIL BQMTO', '671526111', 6, 'iqpm1421@gmail.com', 59),
(46, '1000', 'J-31578297-9', 'Bh Pack C.A.', 'OHLALA EMBAJADA ', '229366884', 6, 'oh.ccs.embajada@ohlala.com.ve', 59),
(47, '901', 'J-30757411-9', 'Operadora DLV005 C.A.', 'RB MILLENIUM', '122334469', NULL, 'rbmillenium@fullpizza.com', 59),
(48, '3005', 'J-40232160-0', 'Operadora RB Recreo 2012 C.A.', 'RB RECREO', '237766659', NULL, 'rb.oh.ccs.recreo@ricoburrito.com', 59),
(49, '3002', 'J-40232150-3', 'Inversiones RB lider 2012 C.A.', 'RB LIDER', '227880793', NULL, 'rb.ccs.lider@ricoburrito.com', 59),
(50, '3004', 'J-40232147-3', 'Operadora RB Metropolis 2012 C.A.', 'RB METROPOLIS', '378767461', NULL, 'rb.val.metropolis@ricoburrito.com', 59),
(51, '3000', 'J-40148998-2', 'Operadora Popular Rondon 2012', 'RB CHACAITO', '208208162', NULL, 'rb.ccs.expreso@ricoburrito.com', 59),
(52, '5', 'J-29869805-5', 'Operadora de Alimentos Antillana 2010 C.A.', 'ANTILLANA', '554774117', NULL, 'antillana@fullpizza.com', 59),
(53, '57', 'J-40107855-9', 'Representaciones Green Margarita C.A.', 'GREEN MARTINI', '724265130', NULL, 'greenmartini@fullpizza.com', 59),
(54, '6', 'J-29724633-9', 'Operadora FP Piccola 006 C.A.', 'PICCOLA', '568751869', NULL, 'piccola@fullpizza.com', 59),
(55, '3', 'J-31329666-0', 'Cooperativa El Nazareno 1562 RL', 'ALLEGRE TRATTORIA', '314665353', NULL, 'trattoria@fullpizza.com', 59),
(56, '8000', 'J-313017167', 'Corporacion ORLICA', 'BAGEL NOSH', '428802584', NULL, NULL, 59),
(57, '5000', 'J-40520881-3', 'AyB Hernandez Sanchez C.A.', 'RESTAURANT LA MAR', '316460380', NULL, 'nelsonrhernandez10@gmail.com', 59),
(58, '59', 'J-30756999-9', 'Operadora DLV001 C.A.', 'FP DELIVERY TIENDA', '814231707', NULL, NULL, 59),
(59, '8888', NULL, NULL, 'Corporacion multifranquicia', NULL, NULL, NULL, NULL),
(60, '8889', NULL, NULL, 'Multifranquicia (PTY)', NULL, NULL, NULL, NULL),
(501, '0501', '2429074-1-808935 DV ', 'Franquicias Pizza Panama, S.A.', 'FP CARRUSEL(PTY)', '528821415', 19, NULL, 60),
(502, '0502', '1390804-1-626179 DV ', 'Full Inversiones Panama, S.A.', 'FP MAGIC ZONE(PTY)', '903877581', 19, 'fpalbrook3@fullpizza.com', 60),
(503, '0503', '1261127-1-595525 DV6', 'FRANQUICIAS FULL PANAMA', 'FP ALBROOK CINES(PTY)', '624581873', 19, 'fpalbrook2@fullpizza', 60),
(504, '0504', '1818282-1-708554', 'Grupo Full pizza, S.A.', 'FP ALBROOK TERMINAL(PTY)', '768672660', 19, 'fpterminal@fullpizza.com', 60),
(505, '0505', '2429074-1-808935 DV ', 'Franquicias Pizza Panama, S.A.', 'RB I ALBROOK(PTY)', '236548855', 20, NULL, 60),
(506, '0506', '470523-1-708576 DV ', 'RESTAURANTE BROOKAL S.A.', 'BOULEVARD ALBROOK CAFE(PTY)', '673230906', 21, 'boulevardalbrook1@fullpizza.com', 60),
(508, '0508', '1818282-1-708554 DV ', 'Grupo Pizza, S.A.', 'FP WESTLAND(PTY)', '241857645', 19, 'fpwestland1@fullpizza.com', 60),
(509, '0509', '1818282-1-708554 DV ', 'Grupo Pizza, S.A.', 'BOULEVARD WESTLAND(PTY)', '763196583', 21, NULL, 60),
(510, '0510', '2429074-1-808935 DV ', 'FRANQUICIAS PIZZA PANAMA S,A.', 'FP LOS ANDES(PTY)', '184859354', 19, 'fp.pty.losandes1@fullpizza.com', 60),
(511, '0511', '155593908-2-2015 DV', 'Inversiones Capsal, S.A', 'FP EL DORADO(PTY)', '633300452', 19, NULL, 60),
(512, '0512', '13908041-1-626179 DV', 'Full Inversiones Panama, S.A', 'RB II MAGIC ZONE(PTY)', '838312228', 20, NULL, 60),
(513, '0513', '2469180-1-814587 DV4', 'Franquicias F Pizza Santiago,S.A.', 'FP SANTIAGO(PTY)', '242858646', 19, 'fpsantiago@fullpizza.com', 60),
(514, '0514', '155619048-2-2015 DV42', 'Franquicias Stoners Pizza,S.A.', 'FP VILLA LUCRE(PTY)', '242858647', 19, 'fpstoners@fullpizza.com', 60);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_grupo_referencia1_idx` (`familia_id`);

--
-- Indices de la tabla `ingredientes_has_explosion`
--
ALTER TABLE `ingredientes_has_explosion`
  ADD KEY `producto_id` (`producto_id`);

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
  ADD KEY `receta_id` (`receta_id`),
  ADD KEY `subfamilia` (`sub_familia_id`),
  ADD KEY `tipo_ing` (`tipo_mercancia_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `unidad_m_id` (`unidad_medida_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT de la tabla `mercancia`
--
ALTER TABLE `mercancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT de la tabla `mercancia_has_reposicion`
--
ALTER TABLE `mercancia_has_reposicion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `modelo_has_submodelo`
--
ALTER TABLE `modelo_has_submodelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `referencia`
--
ALTER TABLE `referencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;
--
-- AUTO_INCREMENT de la tabla `remision`
--
ALTER TABLE `remision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupo_referencia1` FOREIGN KEY (`familia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingrediente_has_receta`
--
ALTER TABLE `ingrediente_has_receta`
  ADD CONSTRAINT `fk_ingrediente_has_receta_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mercancia_id` FOREIGN KEY (`ingrediente_id`) REFERENCES `mercancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_receta_id` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_tipom_id` FOREIGN KEY (`tipo_mercancia_id`) REFERENCES `referencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mercancia_referencia1` FOREIGN KEY (`familia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida1` FOREIGN KEY (`unidad_medida_compra_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida2` FOREIGN KEY (`unidad_medida_consumo_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mercancia_unidad_medida3` FOREIGN KEY (`unidad_medida_sistema_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receta_id2` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subfamilia_id` FOREIGN KEY (`sub_familia_id`) REFERENCES `referencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_modelo_has_grupo_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modelo_has_grupo_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelo_has_receta`
--
ALTER TABLE `modelo_has_receta`
  ADD CONSTRAINT `fk_modelo_has_receta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modelo_has_receta_receta1` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_producto_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_receta1` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_orden`
--
ALTER TABLE `producto_has_orden`
  ADD CONSTRAINT `fk_producto_has_orden_orden1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producto_has_orden_producto1_idx` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_has_unidad_negocio`
--
ALTER TABLE `producto_has_unidad_negocio`
  ADD CONSTRAINT `fk_producto_has_unidad_negocio_producto1_idx	` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
-- Filtros para la tabla `receta_has_receta`
--
ALTER TABLE `receta_has_receta`
  ADD CONSTRAINT `fk_receta_has_receta_receta1` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receta_has_receta_receta2` FOREIGN KEY (`sub_receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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