-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 14, 2017 at 03:21 PM
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
  `padre_id` int(11) NOT NULL,
  `referencia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ingrediente_has_receta`
--

CREATE TABLE `ingrediente_has_receta` (
  `ingrediente_id` int(11) NOT NULL,
  `receta_id` int(11) NOT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kardex`
--

CREATE TABLE `kardex` (
`id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time NOT NULL,
  `cantidad` int(5) DEFAULT NULL,
  `motivo` text,
  `tipo_movimiento` varchar(10) NOT NULL,
  `mercancia_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `modelo` varchar(50) DEFAULT NULL,
  `sub_modelo` varchar(50) DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mercancia`
--

CREATE TABLE `mercancia` (
`id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `familia_id` int(11) NOT NULL,
  `unidad_medida_sistema_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia`
--

INSERT INTO `mercancia` (`id`, `codigo`, `nombre`, `familia_id`, `unidad_medida_sistema_id`) VALUES
(1, 'A001', 'Arroz', 116, 6),
(2, 'B002', 'Refresco', 117, 12),
(3, 'AT001', 'Atun', 116, 6),
(4, 'AC001', 'Aceite', 116, 12);

-- --------------------------------------------------------

--
-- Table structure for table `mercancia_has_unidad_negocio`
--

CREATE TABLE `mercancia_has_unidad_negocio` (
  `mercancia_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL DEFAULT '0',
  `modelo_id` int(11) NOT NULL DEFAULT '0',
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `existencia` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `contenido_neto` int(11) DEFAULT NULL,
  `precio_unitario` varchar(20) NOT NULL,
  `unidad_medida_compra_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mercancia_has_unidad_negocio`
--

INSERT INTO `mercancia_has_unidad_negocio` (`mercancia_id`, `unidad_negocio_id`, `modelo_id`, `stock_min`, `stock_max`, `status`, `existencia`, `descripcion`, `contenido_neto`, `precio_unitario`, `unidad_medida_compra_id`) VALUES
(1, 1, 7, 5000, 10000, 0, 6000, 'Primor', 1000, '', 5),
(1, 59, 0, 10000, 30000, 0, 12000, 'Primor', 1000, '', 19),
(2, 1, 7, 6000, 9000, 0, 8500, 'Pepsi', 2000, '', 13),
(2, 59, 0, 30, 60, 0, 50, 'Pepsi', 2000, '', 11),
(3, 39, 0, 4000, 8000, 0, 5000, 'Eveba', 500, '', 13),
(3, 59, 0, 8000, 12000, 0, 10000, 'Eveba', 500, '', 11),
(4, 39, 0, 3000, 6000, 0, 4500, 'Vatel', 1000, '', 13),
(4, 59, 0, 10000, 16000, 0, 13000, 'Vatel', 1000, '', 11);

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

-- --------------------------------------------------------

--
-- Table structure for table `modelo_has_receta`
--

CREATE TABLE `modelo_has_receta` (
  `modelo_id` int(11) NOT NULL,
  `receta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `receta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor_has_mercancia`
--

CREATE TABLE `proveedor_has_mercancia` (
  `mercancia_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `codigo_x_proveedor` varchar(30) DEFAULT NULL,
  `precio` varchar(20) DEFAULT NULL,
  `precio_unitario` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor_has_telefono`
--

CREATE TABLE `proveedor_has_telefono` (
  `proveedor_id` int(11) NOT NULL,
  `telefono_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `receta`
--

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

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
(120, 'Consumo personal', 13);

-- --------------------------------------------------------

--
-- Table structure for table `remision`
--

CREATE TABLE `remision` (
`id` int(11) NOT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` text,
  `cantidad` int(5) DEFAULT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mercancia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reposicion_mercancia`
--

CREATE TABLE `reposicion_mercancia` (
`id` int(11) NOT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `precio` varchar(20) DEFAULT NULL,
  `total` varchar(20) DEFAULT NULL,
  `tipo_reposicion` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `ingrediente_id` int(11) NOT NULL,
  `unidad_negocio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `telefono`
--

CREATE TABLE `telefono` (
`id` int(11) NOT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `codigo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `correo` varchar(100) DEFAULT NULL,
  `numero_autorizacion` varchar(45) DEFAULT NULL,
  `modelo_has_submodelo_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad_negocio`
--

INSERT INTO `unidad_negocio` (`id`, `codigo`, `rif`, `nombre`, `razon_social`, `correo`, `numero_autorizacion`, `modelo_has_submodelo_id`, `empresa_id`) VALUES
(1, '30', 'J-29468624-9', 'FP AEROPUERTO', 'Operadora Aeropuerto 2007 C.A.', 'fpaeropuerto@fullpizza.com', '582946524', 1, 59),
(2, '11', 'J-29706562-8', 'FP BOLEITA', 'Operadora FpBoleita 011 C.A.', 'fpboleita@fullpizza.com', '558865103', 1, 59),
(3, '29', 'J-29637315-5', 'FP CCCT', 'Operadora Tamanaco 2008 C.A.', 'fpccct@fullpizza.com', '708751670', 1, 59),
(4, '26', 'J-29600796-9', 'FP IPSFA', 'Operadora FP Los Proceres C.A.', 'fpipsfa@fullpizza.com', '218262314', 1, 59),
(5, '7', 'J-29706585-7', 'FP LIDO', 'Operadora FP Lido 007 C.A.', 'fplido@fullpizza.com', '520421640', 1, 59),
(6, '25', 'J-29637305-1', 'FP MILLENIUM', 'Operadora Millenium 2008 C.A.', 'fpmillenium@fullpizza.com', '589228495', 1, 59),
(7, '61', 'J-29830763-3', 'FP BICENTENARIO', 'Operadora Plaza Venezuela 2009 C.A.', 'fp.ccs.bicentenario@fullpizza.com', '593151194', 1, 59),
(8, '10', 'J-29706547-4', 'FP RECREO', 'Operadora FP El Recreo 010 C.A.', 'fprecreo@fullpizza.com', '737410268', 1, 59),
(9, '9', 'J-29706492-3', 'FP SAMBIL DIVERSION', 'Operadora FP Diversion009 C.A.', 'fpdiversion@fullpizza.com', '570456763', 1, 59),
(10, '8', 'J-29737409-4', 'FP SAMBIL FERIA', 'Operadora FP Feria CCS 008 C.A.', 'fpferia@fullpizza.com', '256706677', 1, 59),
(11, '22', 'J-30895190-0', 'FP TOLON', 'Productora La Confitiure de Oro C.A.', 'fptolon@fullpizza.com', '845661486', 1, 59),
(12, '2000', 'J-30895190-0', 'CHIPCOOKIE TOLON', 'Productora La Confitiure de Oro C.A.', 'fptolon@fullpizza.com', '164869818', 11, 59),
(13, '2', 'J-29706491-5', 'FP UCAB', 'Operadora UCAB 002 C.A.', 'fpucab@fullpizza.com', '121649327', 1, 59),
(14, '34', 'J-29638215-8', 'FP ACARIGUA', 'Operadora El Llano 2008 C.A.', 'fpllanomall@fullpizza.com', '944126839', 1, 59),
(15, '63', 'J-29800629-3', 'FP AVIADORES', 'Operadora Maracay 2009 C.A.', 'fp.may.sigo@fullpizza.com', '432893570', 1, 59),
(16, '17', 'J-29521250-0', 'FP S. BARQUISIMETO', 'Operadora Barquisimeto C.A.', 'fpsambbarquisimeto', '926740298', 1, 59),
(17, '54', 'J- 31749880-1', 'FP S. MARACAIBO', 'Operadora FP El Lago 2011 C.A.', 'fpmaracaibo@fullpizza.com', '892605624', 1, 59),
(18, '20', 'J-29370529-0', 'FP MTRP BARQUISIMETO', 'Operadora Lara-0632006 C.A.', 'fpbarquisimeto@fullpizza.com', '977261513', 1, 59),
(19, '12', 'J-29706495-8', 'FP MTRP VALENCIA', 'Operadora FPMetropolis 012 C.A.', 'fpmetropolis@fullpizza.com', '118410771', 1, 59),
(20, '42', 'J-29871770-0', 'FP PARAGUANA', 'Operadora FP Paraguana 2009 C.A.', 'fpparaguana@fullpizza.com', '784354406', 1, 59),
(21, '0', 'J-29706489-3', 'FP LAS TRINITARIAS', 'Operadora Este C.A.', 'fpparis@fullpizza.com', '915468342', 1, 59),
(22, '31', 'J-29724582-0', 'FP PLAZA MAYOR', 'Operadora Plaza Puerto C.A.', 'fpplzmayor@fullpizza.com', '557479912', 1, 59),
(23, '14', 'J-29706490-7', 'FP S. MARGARITA', 'Operadora FP Margarita 014 C.A.', 'fpmargarita@fullpizza.com', '291160155', 1, 59),
(24, '13', 'J-29706494-0', 'FP SAMBIL VALENCIA', 'Operadora FP Valencia 013 C.A.', 'fpsambvalencia@fullpiza.com', '631763844', 1, 59),
(25, '4', 'J-29365112-3', 'FP TACHIRA', 'Operadora FPST2007 C.A.', 'fpsncristobal@fullpizza.com', '679193173', 1, 59),
(26, '58', 'J-40125261-3', 'FP PUENTE REAL', 'Pizza Real C.A.', 'fppuentereal@fullpizza.com', '414606929', 1, 59),
(27, '56', 'J-40064201-9', 'FP PROPATRIA', 'Pizzerias del Oeste 132, C.A. ', 'fppropatria@fullpizza.com', '990971977', 1, 59),
(28, '37', 'J-29449227-4', 'FP LIDER', 'Representaciones Pasadena C.A.', 'fplider@fullpizza.com', '470604320', 1, 59),
(29, '21', 'J-30948141-0', 'FP GALERIAS MARACAY', 'XLunch C.A.', 'fpgalmaracay@fullpizza.com', '963799571', 1, 59),
(31, '39', 'J-29839358-0', 'FP LA VELA', 'Inversiones Pampatar C.A.', 'fplavela@fullpizza.com', '413388225', 1, 59),
(32, '38', 'J-29848534-1', 'FP ALTAVISTA II', 'Representaciones Nemar C.A.', 'fpaltavistaii@fullpizza.com', '899787596', 1, 59),
(33, '18', 'J-29369833-9', 'FP PZA ATLANTICO', 'Inversiones Lamo C.A.', 'fpptoordaz@fullpizza.com', '934240973', 1, 59),
(34, '52', 'J-30707128-1', 'PLK CHACAO', 'Operadora PLK Elice C.A.', 'plchacao@fullpizza.com', '278183304', NULL, 59),
(35, '47', 'J-29997801-9', 'PLK PETARE', 'Operadora PLS Petare C.A.', 'plpetare@fullpizza.com', '953912705', NULL, 59),
(36, '45', 'J-29600831-0', 'PLK SABANA GRANDE', 'Operadora Los Ilustres C.A.', 'plsabanagrande@fullpizza.com', '473309215', NULL, 59),
(37, '62', 'J-40232165-1', 'PLK AEROPUERTO', 'Inversiones 3055530 C.A.', 'pl.mqt.aeropuerto@pizzaloka.com.ve', '903710294', NULL, 59),
(38, '32', 'J-29980564-5', 'PLK CIUDAD TRAKI', 'Inversora Nesi C.A.', 'plciudadtraki@fullpizza.com', '268297438', NULL, 59),
(39, '1024', 'J-30757227-2', 'OH LALA CHACAITO', 'Operadora DLV003 C.A.', 'ccs.expreso@ohlala.com.ve', '749733641', 6, 59),
(40, '1008', 'J-29896375-1', 'OHLALA METROPOLIS', 'Corporacion Prestigio PQM C.A.', 'oh.val.metropolis@ohlala.com', '773982449', 6, 59),
(41, '1002', 'J-29637224-1', 'OHLALA RECREO FERIA', 'Representaciones Somaroma 2009 C.A.', 'oh.ccs.recreo@ohlala.com.ve', '610219931', 6, 59),
(42, '1027', 'J- 40232151-1', 'OH RECREO KIOSKO', 'Inversiones OH Recreo 2012 C.A.', 'oh.ccs.recreo@ohlala.com.ve', '897915414', 6, 59),
(43, '902', 'J-317690060', 'MUFFIN CAFE ', 'Inversiones 238882 C.A.', 'mcaeropuerto@fullpizza.com', '650368289', NULL, 59),
(44, '1010', 'J-31749269-2', 'OHLALA METROPOLIS BQ', 'Inversiones JCR, C.A. ', 'iqpm1421@gmail.com', '615914811', 6, 59),
(45, '1009', 'J-29350955-6', 'OHLALA SAMBIL BQMTO', 'Inversiones QP1421 C.A.', 'iqpm1421@gmail.com', '671526111', 6, 59),
(46, '1000', 'J-31578297-9', 'OHLALA EMBAJADA ', 'Bh Pack C.A.', 'oh.ccs.embajada@ohlala.com.ve', '229366884', 6, 59),
(47, '901', 'J-30757411-9', 'RB MILLENIUM', 'Operadora DLV005 C.A.', 'rbmillenium@fullpizza.com', '122334469', NULL, 59),
(48, '3005', 'J-40232160-0', 'RB RECREO', 'Operadora RB Recreo 2012 C.A.', 'rb.oh.ccs.recreo@ricoburrito.com', '237766659', NULL, 59),
(49, '3002', 'J-40232150-3', 'RB LIDER', 'Inversiones RB lider 2012 C.A.', 'rb.ccs.lider@ricoburrito.com', '227880793', NULL, 59),
(50, '3004', 'J-40232147-3', 'RB METROPOLIS', 'Operadora RB Metropolis 2012 C.A.', 'rb.val.metropolis@ricoburrito.com', '378767461', NULL, 59),
(51, '3000', 'J-40148998-2', 'RB CHACAITO', 'Operadora Popular Rondon 2012', 'rb.ccs.expreso@ricoburrito.com', '208208162', NULL, 59),
(52, '5', 'J-29869805-5', 'ANTILLANA', 'Operadora de Alimentos Antillana 2010 C.A.', 'antillana@fullpizza.com', '554774117', NULL, 59),
(53, '57', 'J-40107855-9', 'GREEN MARTINI', 'Representaciones Green Margarita C.A.', 'greenmartini@fullpizza.com', '724265130', NULL, 59),
(54, '6', 'J-29724633-9', 'PICCOLA', 'Operadora FP Piccola 006 C.A.', 'piccola@fullpizza.com', '568751869', NULL, 59),
(55, '3', 'J-31329666-0', 'ALLEGRE TRATTORIA', 'Cooperativa El Nazareno 1562 RL', 'trattoria@fullpizza.com', '314665353', NULL, 59),
(56, '8000', 'J-313017167', 'BAGEL NOSH', 'Corporacion ORLICA', NULL, '428802584', NULL, 59),
(57, '5000', 'J-40520881-3', 'RESTAURANT LA MAR', 'AyB Hernandez Sanchez C.A.', 'nelsonrhernandez10@gmail.com', '316460380', NULL, 59),
(58, '59', 'J-30756999-9', 'FP DELIVERY TIENDA', 'Operadora DLV001 C.A.', NULL, '814231707', NULL, 59),
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
(15, 1),
(1, 2),
(15, 3),
(15, 4),
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
 ADD PRIMARY KEY (`ingrediente_id`,`receta_id`), ADD KEY `fk_materia_prima_has_receta_receta1_idx` (`receta_id`), ADD KEY `fk_materia_prima_has_receta_materia_prima1_idx` (`ingrediente_id`), ADD KEY `fk_ingrediente_has_receta_unidad_medida1_idx` (`unidad_medida_id`);

--
-- Indexes for table `kardex`
--
ALTER TABLE `kardex`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_kardex_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_kardex_usuario1_idx` (`usuario_id`), ADD KEY `fk_kardex_mercancia1_idx` (`mercancia_id`), ADD KEY `fk_kardex_unidad_medida1_idx` (`unidad_medida_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`), ADD KEY `unidad_negocio_id` (`unidad_negocio_id`);

--
-- Indexes for table `mercancia`
--
ALTER TABLE `mercancia`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_mercancia_referencia1_idx` (`familia_id`), ADD KEY `fk_mercancia_unidad_medida1_idx` (`unidad_medida_sistema_id`);

--
-- Indexes for table `mercancia_has_unidad_negocio`
--
ALTER TABLE `mercancia_has_unidad_negocio`
 ADD PRIMARY KEY (`mercancia_id`,`unidad_negocio_id`,`modelo_id`), ADD KEY `fk_inventario_has_unidad_negocio_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_mercancia_has_unidad_negocio_modelo1_idx` (`modelo_id`), ADD KEY `fk_mercancia_has_unidad_negocio_mercancia1_idx` (`mercancia_id`), ADD KEY `unidad_medida_compra_id` (`unidad_medida_compra_id`);

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
 ADD PRIMARY KEY (`id`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `fk_remision_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_remision_usuario1_idx` (`usuario_id`), ADD KEY `fk_remision_ingrediente1_idx` (`mercancia_id`);

--
-- Indexes for table `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_carga_compra_ingrediente1_idx` (`ingrediente_id`), ADD KEY `fk_carga_compra_unidad_negocio1_idx` (`unidad_negocio_id`), ADD KEY `fk_carga_compra_usuario1_idx` (`usuario_id`), ADD KEY `fk_reposicion_mercancia_unidad_medida1_idx` (`unidad_medida_id`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `fk_unidad_negocio_modelo_has_submodelo1_idx` (`modelo_has_submodelo_id`), ADD KEY `empresa_id` (`empresa_id`), ADD KEY `empresa_id_2` (`empresa_id`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kardex`
--
ALTER TABLE `kardex`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mercancia`
--
ALTER TABLE `mercancia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
-- AUTO_INCREMENT for table `referencia`
--
ALTER TABLE `referencia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `remision`
--
ALTER TABLE `remision`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `telefono`
--
ALTER TABLE `telefono`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ubicacion`
--
ALTER TABLE `ubicacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unidad_medida`
--
ALTER TABLE `unidad_medida`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `unidad_negocio`
--
ALTER TABLE `unidad_negocio`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;
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
ADD CONSTRAINT `fk_ingrediente_has_receta_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_materia_prima_has_receta_materia_prima1` FOREIGN KEY (`ingrediente_id`) REFERENCES `mercancia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_materia_prima_has_receta_receta1` FOREIGN KEY (`receta_id`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kardex`
--
ALTER TABLE `kardex`
ADD CONSTRAINT `fk_kardex_mercancia1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_kardex_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_kardex_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_kardex_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mercancia`
--
ALTER TABLE `mercancia`
ADD CONSTRAINT `fk_mercancia_referencia1` FOREIGN KEY (`familia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mercancia_has_unidad_negocio`
--
ALTER TABLE `mercancia_has_unidad_negocio`
ADD CONSTRAINT `fk_mercancia_has_unidad_negocio_mercancia1` FOREIGN KEY (`mercancia_id`) REFERENCES `mercancia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
ADD CONSTRAINT `fk_producto_has_orden_orden1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_producto_has_orden_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `producto_has_unidad_negocio`
--
ALTER TABLE `producto_has_unidad_negocio`
ADD CONSTRAINT `fk_producto_has_unidad_negocio_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_producto_has_unidad_negocio_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
ADD CONSTRAINT `fk_remision_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_remision_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reposicion_mercancia`
--
ALTER TABLE `reposicion_mercancia`
ADD CONSTRAINT `fk_carga_compra_ingrediente1` FOREIGN KEY (`ingrediente_id`) REFERENCES `mercancia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_carga_compra_unidad_negocio1` FOREIGN KEY (`unidad_negocio_id`) REFERENCES `unidad_negocio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_carga_compra_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_reposicion_mercancia_unidad_medida1` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
