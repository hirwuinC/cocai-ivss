-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 28, 2017 at 08:59 AM
-- Server version: 5.5.40
-- PHP Version: 5.4.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
-- Table structure for table `grupo`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grupo`
--

INSERT INTO `grupo` (`id`, `ordNum`, `codigo`, `nombre`, `recetaInactiva`, `subGrupo`, `imagenProducto`, `familia_id`) VALUES
(1, '3', NULL, 'PIZZAS 12', 0, NULL, NULL, 116),
(2, '4', NULL, 'PIZZAS 16', 0, NULL, NULL, 116);

-- --------------------------------------------------------

--
-- Table structure for table `ingrediente_has_receta`
--

CREATE TABLE `ingrediente_has_receta` (
  `ingrediente_id` int(11) DEFAULT NULL,
  `receta_id` int(11) NOT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingrediente_has_receta`
--

INSERT INTO `ingrediente_has_receta` (`ingrediente_id`, `receta_id`, `cantidad`, `unidad_medida_id`) VALUES
(1, 1, 1, 5),
(1, 2, 2, 5),
(2, 1, 4, 4),
(2, 2, 2, 4),
(3, 1, 4, 15),
(3, 2, 3, 15),
(4, 1, 3, 4),
(4, 2, 4, 4),
(6, 1, 3, 5),
(6, 2, 44, 5),
(7, 1, 1, 5),
(7, 2, 4, 5),
(8, 1, 1, 5),
(8, 2, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kardex`
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kardex`
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
(33, '2017-11-22', '12:38:20', 0, '33600', 132, 3, 59, 15, 12, 133),
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
(58, '2017-11-27', '12:46:59', 5500, 'prueba 2', 132, 2, 59, 15, 12, 122);

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

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
(57, '2017-11-27', '12:46:59', 'Producto', 'Refresco', 'Modificado', 'Freddy Diaz', 59);

-- --------------------------------------------------------

--
-- Table structure for table `mercancia`
--

CREATE TABLE `mercancia` (
`id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `codigo_anterior` varchar(45) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` text,
  `precio_unitario` varchar(20) DEFAULT NULL,
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
  `rendimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia`
--

INSERT INTO `mercancia` (`id`, `codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`, `peso_escurrido`, `descripcion`, `exento_impuesto`, `rendimiento`) VALUES
(1, 'A001', '', 'Arroz', 'Primor', '1.000,00', 990, 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, 19, 5, 6, NULL, NULL, NULL, NULL),
(2, 'B002', '', 'Refresco', 'Coca-cola', '3.000,00', 2000, 12, 'Cja * 2000', 'Ltrs *', 'Ml *', 117, 11, 4, 12, NULL, NULL, NULL, NULL),
(3, 'AT001', NULL, 'Atun', 'Eveba', '1.500,00', 600, 24, 'Cja * 600', NULL, NULL, 116, 11, 15, 6, NULL, NULL, NULL, NULL),
(4, 'AC001', NULL, 'Aceite', 'Vatel', '5.000,00', 1000, 12, 'Cja * 1000', NULL, NULL, 116, 11, 4, 12, NULL, NULL, NULL, NULL),
(6, 'Q0010', '', 'Queso amarillo', 'Paisa', '10.000,00', 600, 12, 'Cja * 600', NULL, NULL, 116, 11, 5, 6, NULL, NULL, NULL, NULL),
(7, 'H0012', '', 'Harina', 'Pan', '8.000,00', 990, 24, 'Blto * 990', 'Kgs *', 'Gr *', 116, 19, 5, 6, NULL, NULL, NULL, NULL),
(8, 'J0041', NULL, 'Jamon', 'Plumrose', '50.000,00', 25000, 1, 'Pza * 2500', '', '', 116, 14, 5, 6, NULL, NULL, NULL, NULL),
(9, '59006', NULL, 'Agua saborizada', 'Los andes', '1.000,00', 700, 24, 'Cja * 700', NULL, NULL, 117, 11, 7, 12, NULL, NULL, 1, NULL),
(11, '59007', 'abcd', 'harina', 'juana', '40.000,00', 1000, 24, 'Blto * 1000', 'Kgs *', 'Gr *', 116, 19, 5, 6, 1000, 'harina de maiz', 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `mercancia_has_resposicion`
--

CREATE TABLE `mercancia_has_resposicion` (
`id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(19,0) NOT NULL,
  `ingrediente_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mercancia_has_unidad_negocio`
--

CREATE TABLE `mercancia_has_unidad_negocio` (
  `mercancia_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL DEFAULT '0',
  `codigo_modelo` varchar(45) DEFAULT NULL,
  `existencia` float DEFAULT NULL,
  `stock_min` int(11) DEFAULT NULL,
  `stock_max` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia_has_unidad_negocio`
--

INSERT INTO `mercancia_has_unidad_negocio` (`mercancia_id`, `unidad_negocio_id`, `codigo_modelo`, `existencia`, `stock_min`, `stock_max`, `status`, `descripcion`) VALUES
(1, 59, NULL, 3000, 30000, 60000, 0, NULL),
(2, 1, NULL, 26500, 6000, 9000, 0, NULL),
(2, 59, NULL, 5500, 30000, 60000, 1, NULL),
(3, 39, NULL, 5000, 4000, 8000, 0, NULL),
(3, 59, NULL, 33600, 50, 100, 0, NULL),
(4, 39, NULL, 4500, 3000, 6000, 0, NULL),
(4, 59, NULL, 33600, 50, 1000, 1, NULL),
(6, 59, NULL, 7200, 5000, 10000, 0, NULL),
(11, 59, NULL, 2000, 10000, 50000, 0, 'harina de maiz');

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

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
(7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `modelo_has_submodelo`
--

CREATE TABLE `modelo_has_submodelo` (
  `id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  `sub_modelo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(18, 21, 25);

-- --------------------------------------------------------

--
-- Table structure for table `notificacion_has_remision`
--

CREATE TABLE `notificacion_has_remision` (
  `reposicion_id` int(11) NOT NULL,
  `remision_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notificacion_has_remision`
--

INSERT INTO `notificacion_has_remision` (`reposicion_id`, `remision_id`, `unidad_negocio_id`, `status_id`) VALUES
(0, 8, 2, 126),
(0, 5, 3, 126),
(0, 9, 3, 126),
(0, 1, 5, 126),
(0, 2, 5, 126),
(0, 7, 5, 126),
(0, 3, 7, 126),
(0, 6, 7, 126),
(0, 4, 1, 127);

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
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
`id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `codigo_tcr` varchar(45) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `costo` varchar(20) DEFAULT NULL,
  `precioVta_A` varchar(20) DEFAULT NULL,
  `precioVta_B` varchar(20) DEFAULT NULL,
  `producto_Inactivo` tinyint(1) DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  `ocultar` tinyint(1) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `stock_maximo` int(11) DEFAULT NULL,
  `grupo_id` int(11) NOT NULL,
  `receta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `codigo_tcr`, `nombre`, `costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `tipo`, `ocultar`, `status`, `existencia`, `stock_minimo`, `stock_maximo`, `grupo_id`, `receta_id`) VALUES
(1, 'FPSAU8700004', 'FPSAU8700004', 'Piz. Manhattan 12', '0,00', '35.640,00', '26.360,71', 0, 0, 0, '0', 20, 30, 40, 1, 1),
(2, 'FPSAU8800004', 'FPSAU8800004', 'Piz. Manhattan 16', '0,00', '44.490,00', '32.901,79', 0, 0, 0, '0', 20, 30, 40, 2, 2);

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
  `stock_venta` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto_has_unidad_negocio`
--

INSERT INTO `producto_has_unidad_negocio` (`producto_id`, `unidad_negocio_id`, `stock_venta`) VALUES
(1, 1, NULL),
(2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
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
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `razon_social`, `correo`, `status`, `ubicacion_id`) VALUES
(1, 'DAFILCA,C.A.', NULL, NULL, 0, 1),
(2, 'PRODOTTI IL BUONGUSTAIO', NULL, NULL, 0, 3),
(3, 'DIST. GOUPIGOIS, C.A.', NULL, NULL, 0, 8),
(4, 'DISTRIBUIDORA  PACK & FOOD', NULL, NULL, 0, 10),
(5, 'Pepsi Cola Venezuela, C.A.', NULL, NULL, 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor_has_mercancia`
--

CREATE TABLE `proveedor_has_mercancia` (
  `mercancia_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `codigo_x_proveedor` varchar(30) DEFAULT NULL,
  `precio` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveedor_has_mercancia`
--

INSERT INTO `proveedor_has_mercancia` (`mercancia_id`, `proveedor_id`, `codigo_x_proveedor`, `precio`, `status`) VALUES
(3, 5, 'pa333', '800,00', 0);

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
  `costo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receta`
--

INSERT INTO `receta` (`id`, `nombre`, `costo`) VALUES
(1, 'receta pizza manhattan 12', '15.000,00'),
(2, 'Piz. Manhattan 16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receta_has_receta`
--

CREATE TABLE `receta_has_receta` (
  `receta_id` int(11) NOT NULL,
  `sub_receta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referencia`
--

CREATE TABLE `referencia` (
`id` int(11) NOT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

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
-- Table structure for table `remision`
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `remision`
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
(9, '2017-09-08', '6:30:23 pm', 'prueba 1', 2, 7, 1, 15, 9);

-- --------------------------------------------------------

--
-- Table structure for table `reposicion_mercancia`
--

CREATE TABLE `reposicion_mercancia` (
`id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` varchar(20) DEFAULT NULL,
  `tipo_reposicion` varchar(45) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `proveedor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(4, 'Litro', 'Ltrs', 2),
(5, 'Kilogramo', 'Kgs', 1),
(6, 'Gramo', 'Gr', 1),
(7, 'Botella', 'Btl', 2),
(8, 'Fardo', 'Frdo', 30),
(9, 'Guacal', 'Gcl', 1),
(10, 'Saco', 'Sco', 1),
(11, 'Caja', 'Cja', 30),
(12, 'Mililitro', 'Ml', 2),
(13, 'Unidad', 'Un', 29),
(14, 'Pieza', 'Pza', 29),
(15, 'Lata', 'Lta', 1),
(16, 'Paquete', 'Pqte', 29),
(17, 'Bovina', 'Bvna', 1),
(18, 'Barra', 'Brra', 1),
(19, 'Bulto', 'Blto', 1),
(20, 'Cuñete', 'Cte', 2),
(21, 'Galon', 'Glon', 2),
(22, 'Resma', 'Rsma', 3),
(23, 'Docena', 'Dcna', 29),
(24, 'Frasco', 'Fco', 30),
(25, 'Cuenta', 'Cuen', 1),
(26, 'Metros', 'Mtrs', 3),
(27, 'Centimetro', 'Cm', 3),
(28, 'Bandeja', 'Bdj', 1),
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
  `nombre` varchar(200) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `numero_autorizacion` varchar(45) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `modelo_has_submodelo_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad_negocio`
--

INSERT INTO `unidad_negocio` (`id`, `codigo`, `rif`, `nombre`, `razon_social`, `numero_autorizacion`, `correo`, `modelo_has_submodelo_id`, `empresa_id`) VALUES
(1, '30', 'J-29468624-9', 'FP AEROPUERTO', 'Operadora Aeropuerto 2007 C.A.', '582946524', 'fpaeropuerto@fullpizza.com', 1, 59),
(2, '11', 'J-29706562-8', 'FP BOLEITA', 'Operadora FpBoleita 011 C.A.', '558865103', 'fpboleita@fullpizza.com', 1, 59),
(3, '29', 'J-29637315-5', 'FP CCCT', 'Operadora Tamanaco 2008 C.A.', '708751670', 'fpccct@fullpizza.com', 1, 59),
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
(18, '20', 'J-29370529-0', 'FP MTRP BARQUISIMETO', 'Operadora Lara-0632006 C.A.', '977261513', 'fpbarquisimeto@fullpizza.com', 1, 59),
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
(59, NULL, NULL, 'Corporacion multifranquicia', NULL, NULL, NULL, NULL, NULL);

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
(3, 1),
(15, 1),
(1, 2),
(15, 3),
(3, 4),
(15, 4),
(3, 5),
(2, 7),
(3, 39),
(15, 39),
(15, 59);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `cedula_UNIQUE` (`cedula`), ADD KEY `fk_cliente_usuario1_idx` (`usuario_id`), ADD KEY `fk_cliente_ubicacion1_idx` (`ubicacion_id`);

--
-- Indexes for table `combo`
--
ALTER TABLE `combo`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_combo_modelo1_idx` (`submodelo_id`);

--
-- Indexes for table `direccion`
--
ALTER TABLE `direccion`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_direccion_direccion1_idx` (`padre_id`), ADD KEY `fk_direccion_referencia1_idx` (`referencia_id`);

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_grupo_referencia1_idx` (`familia_id`);

--
-- Indexes for table `ingrediente_has_receta`
--
ALTER TABLE `ingrediente_has_receta`
 ADD KEY `fk_materia_prima_has_receta_receta1_idx` (`receta_id`), ADD KEY `fk_materia_prima_has_receta_materia_prima1_idx` (`ingrediente_id`), ADD KEY `fk_ingrediente_has_receta_unidad_medida1_idx` (`unidad_medida_id`);

--
-- Indexes for table `kardex`
--
ALTER TABLE `kardex`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_kardex_mercancia1_idx` (`mercancia_id`), ADD KEY `fk_kardex_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_kardex_referencia2_idx` (`tipo_movimiento_id`), ADD KEY `fk_kardex_usuario1_idx` (`usuario_id`), ADD KEY `fk_kardex_unidad_medida1_idx` (`unidad_medida_id`), ADD KEY `motivo_id` (`motivo_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_log_unidad_negocio1_idx` (`unidad_negocio_id`);

--
-- Indexes for table `mercancia`
--
ALTER TABLE `mercancia`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_mercancia_referencia1_idx` (`familia_id`), ADD KEY `fk_mercancia_unidad_medida1_idx` (`unidad_medida_compra_id`), ADD KEY `fk_mercancia_unidad_medida2_idx` (`unidad_medida_consumo_id`), ADD KEY `fk_mercancia_unidad_medida3_idx` (`unidad_medida_sistema_id`);

--
-- Indexes for table `mercancia_has_resposicion`
--
ALTER TABLE `mercancia_has_resposicion`
 ADD PRIMARY KEY (`id`), ADD KEY `ingrediente_id` (`ingrediente_id`), ADD KEY `unidad_medida_id` (`unidad_medida_id`);

--
-- Indexes for table `mercancia_has_unidad_negocio`
--
ALTER TABLE `mercancia_has_unidad_negocio`
 ADD PRIMARY KEY (`mercancia_id`,`unidad_negocio_id`), ADD KEY `fk_inventario_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_mercancia_has_unidad_negocio_mercancia1_idx` (`mercancia_id`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_modelo_modelo1_idx` (`padre_id`);

--
-- Indexes for table `modelo_has_grupo`
--
ALTER TABLE `modelo_has_grupo`
 ADD PRIMARY KEY (`modelo_id`,`grupo_id`), ADD KEY `fk_modelo_has_grupo_grupo1_idx` (`grupo_id`), ADD KEY `fk_modelo_has_grupo_modelo1_idx` (`modelo_id`);

--
-- Indexes for table `modelo_has_receta`
--
ALTER TABLE `modelo_has_receta`
 ADD PRIMARY KEY (`modelo_id`,`receta_id`), ADD KEY `fk_modelo_has_receta_receta1_idx` (`receta_id`), ADD KEY `fk_modelo_has_receta_modelo1_idx` (`modelo_id`);

--
-- Indexes for table `modelo_has_submodelo`
--
ALTER TABLE `modelo_has_submodelo`
 ADD PRIMARY KEY (`id`,`modelo_id`,`sub_modelo_id`), ADD KEY `fk_modelo_has_modelo_modelo2_idx` (`sub_modelo_id`), ADD KEY `fk_modelo_has_modelo_modelo1_idx` (`modelo_id`);

--
-- Indexes for table `notificacion_has_remision`
--
ALTER TABLE `notificacion_has_remision`
 ADD PRIMARY KEY (`reposicion_id`,`unidad_negocio_id`,`remision_id`), ADD KEY `fk_kardex_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_kardex_has_unidad_negocio_reposicion1_idx` (`reposicion_id`), ADD KEY `fk_kardex_has_unidad_negocio_remision1_idx` (`remision_id`), ADD KEY `fk_notificacion_has_remision_referencia1_idx` (`status_id`);

--
-- Indexes for table `orden`
--
ALTER TABLE `orden`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_orden_cliente1_idx` (`cliente_id`), ADD KEY `fk_orden_referencia1_idx` (`tipo_pago_id`), ADD KEY `fk_orden_referencia2_idx` (`status_id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_producto_grupo1_idx` (`grupo_id`), ADD KEY `fk_producto_receta1_idx` (`receta_id`);

--
-- Indexes for table `producto_has_orden`
--
ALTER TABLE `producto_has_orden`
 ADD PRIMARY KEY (`producto_id`,`orden_id`), ADD KEY `fk_producto_has_orden_orden1_idx` (`orden_id`), ADD KEY `fk_producto_has_orden_producto1_idx` (`producto_id`);

--
-- Indexes for table `producto_has_unidad_negocio`
--
ALTER TABLE `producto_has_unidad_negocio`
 ADD PRIMARY KEY (`producto_id`,`unidad_negocio_id`), ADD KEY `fk_producto_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_producto_has_unidad_negocio_producto1_idx` (`producto_id`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
 ADD PRIMARY KEY (`id`), ADD KEY `ubicacion_id` (`ubicacion_id`);

--
-- Indexes for table `proveedor_has_mercancia`
--
ALTER TABLE `proveedor_has_mercancia`
 ADD PRIMARY KEY (`mercancia_id`,`proveedor_id`), ADD KEY `fk_proveedor_has_mercancia_mercancia1_idx` (`mercancia_id`), ADD KEY `fk_proveedor_has_mercancia_proveedor1_idx` (`proveedor_id`);

--
-- Indexes for table `proveedor_has_telefono`
--
ALTER TABLE `proveedor_has_telefono`
 ADD PRIMARY KEY (`proveedor_id`,`telefono_id`), ADD KEY `fk_proveedor_has_telefono_telefono1_idx` (`telefono_id`), ADD KEY `fk_proveedor_has_telefono_proveedor1_idx` (`proveedor_id`);

--
-- Indexes for table `receta`
--
ALTER TABLE `receta`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receta_has_receta`
--
ALTER TABLE `receta_has_receta`
 ADD PRIMARY KEY (`receta_id`,`sub_receta_id`), ADD KEY `fk_receta_has_receta_receta2_idx` (`sub_receta_id`), ADD KEY `fk_receta_has_receta_receta1_idx` (`receta_id`);

--
-- Indexes for table `referencia`
--
ALTER TABLE `referencia`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_referencia_referencia1_idx` (`padre_id`);

--
-- Indexes for table `remision`
--
ALTER TABLE `remision`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_remision_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_remision_usuario1_idx` (`usuario_id`), ADD KEY `fk_remision_ingrediente1_idx` (`mercancia_id`), ADD KEY `unimedida` (`unidad_medida_id`);

--
-- Indexes for table `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_carga_compra_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_carga_compra_usuario1_idx` (`usuario_id`), ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indexes for table `telefono`
--
ALTER TABLE `telefono`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_telefono_referencia1_idx` (`codigo_id`);

--
-- Indexes for table `telefono_has_cliente`
--
ALTER TABLE `telefono_has_cliente`
 ADD PRIMARY KEY (`telefono_id`,`cliente_id`), ADD KEY `fk_telefono_has_cliente_cliente1_idx` (`cliente_id`), ADD KEY `fk_telefono_has_cliente_telefono1_idx` (`telefono_id`);

--
-- Indexes for table `ubicacion`
--
ALTER TABLE `ubicacion`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ubicacion_direccion1_idx` (`parroquia_id`);

--
-- Indexes for table `unidad_medida`
--
ALTER TABLE `unidad_medida`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_unidad_medida_unidad_medida1_idx` (`padre_id`);

--
-- Indexes for table `unidad_negocio`
--
ALTER TABLE `unidad_negocio`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_unidad_negocio_modelo_has_submodelo1_idx` (`modelo_has_submodelo_id`), ADD KEY `fk_unidad_negocio_unidad_negocio1_idx` (`empresa_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_usuario_referencia1_idx` (`tipo_usuario_id`), ADD KEY `fk_usuario_referencia2_idx` (`pregunta_id`);

--
-- Indexes for table `usuario_has_unidad_negocio`
--
ALTER TABLE `usuario_has_unidad_negocio`
 ADD PRIMARY KEY (`usuario_id`,`unidad_negocio_id`), ADD KEY `fk_usuario_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_usuario_has_unidad_negocio_usuario1_idx` (`usuario_id`);

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
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kardex`
--
ALTER TABLE `kardex`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `mercancia`
--
ALTER TABLE `mercancia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `mercancia_has_resposicion`
--
ALTER TABLE `mercancia_has_resposicion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `orden`
--
ALTER TABLE `orden`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `receta`
--
ALTER TABLE `receta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `referencia`
--
ALTER TABLE `referencia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `remision`
--
ALTER TABLE `remision`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
ADD CONSTRAINT `fk_mercancia_unidad_medida3` FOREIGN KEY (`unidad_medida_sistema_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
ADD CONSTRAINT `fk_proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
