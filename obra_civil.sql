-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2017 a las 08:31:06
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `obra_civil`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cedula` int(11) NOT NULL,
  `fecha_nac` date NOT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `nombre`, `apellido`, `cedula`, `fecha_nac`, `correo`, `password`) VALUES
(100, 'Angel David', 'Ortiz Rivera', 1090480248, '1994-08-20', 'davidortiz20@outlook.com', ''),
(200, 'Andres', 'Orduz', 1024785214, '1990-05-01', 'ingandres@gmail.com', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra`
--

CREATE TABLE `obra` (
  `id_obra` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `obra`
--

INSERT INTO `obra` (`id_obra`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Aeropuerto Oriental', '2017-06-05', '2018-11-11'),
(2, 'ampliacion puente san rafael', '2017-08-20', '2018-12-20'),
(3, 'Hotel Hard Rock', '2017-10-20', '2018-12-23'),
(4, 'Via Cúcuta - Pamplona', '2018-02-21', '2018-10-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra_x_admin`
--

CREATE TABLE `obra_x_admin` (
  `id_obra` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `salario_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `obra_x_admin`
--

INSERT INTO `obra_x_admin` (`id_obra`, `id_admin`, `salario_admin`) VALUES
(1, 100, 4000000),
(1, 200, 10000000),
(2, 100, 10000000),
(3, 100, 25000000),
(4, 200, 4000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra_x_proveedor`
--

CREATE TABLE `obra_x_proveedor` (
  `id_obra` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `contrato` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `obra_x_proveedor`
--

INSERT INTO `obra_x_proveedor` (`id_obra`, `id_proveedor`, `contrato`) VALUES
(1, 1000, NULL),
(2, 1000, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_obra` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_suministro` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_obra`, `id_proveedor`, `id_suministro`, `cantidad`, `fecha`) VALUES
(1, 1, 1000, 123, 100, '2017-06-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cedula` int(11) NOT NULL,
  `fecha_nac` date NOT NULL,
  `salario` int(11) NOT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `id_obra` int(11) NOT NULL,
  `jefe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `nombre`, `apellido`, `cedula`, `fecha_nac`, `salario`, `correo`, `id_obra`, `jefe`) VALUES
(1112535, 'Sofia', 'Carvajal', 104722347, '1982-02-18', 2000000, 'sofi@gmail.com', 1, 100),
(1125475, 'Blanca', 'Rivera', 10474547, '1998-10-05', 2500000, 'blanca@gmail.com', 1, 100),
(1151111, 'Aminta', 'Cruz', 104747, '1962-11-19', 5000000, 'aminta@gmail.com', 1, 200),
(1151140, 'Carmen', 'Barreto', 445750147, '1972-02-05', 2000000, 'car@gmail.com', 2, 100),
(1151455, 'Maria', 'Vargas', 10447, '1972-02-13', 2000000, 'maria@gmail.com', 1, 100),
(1151457, 'Daniel', 'Sandoval', 2147483647, '1982-02-25', 4000000, 'daniel@gmail.com', 1, 100),
(1151461, 'Alvaro', 'Uribe Velez', 25478524, '1960-04-24', 1500000, 'alvarito@hotmail.com', 1, 100),
(1151462, 'Pablo', 'Calarca Jaimes', 15478254, '1980-02-05', 1350000, 'pablito7@hotmail.com', 1, 100),
(1151463, 'Pablo', 'Galviz', 24587425, '1980-08-02', 1350000, 'pablitoconstruye@hotmail.com', 1, 100),
(1151478, 'Pablo', 'Sanchez', 104750147, '1992-02-05', 2000000, 'pablo@gmail.com', 1, 100),
(1154000, 'Jair', 'Garnier', 147, '1952-10-05', 3000000, 'jair@gmail.com', 3, 200),
(1154785, 'Yenny', 'Angarita', 104754547, '1994-08-23', 3000000, 'yenny@gmail.com', 2, 100),
(1157298, 'Angel', 'Peña', 10475597, '1952-10-30', 4000000, 'angel@gmail.com', 1, 100),
(1159874, 'James', 'Beltran', 104578147, '1972-02-05', 1000000, 'james@gmail.com', 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nit` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nit`, `nombre`, `telefono`, `direccion`) VALUES
(1000, '21542014-1', 'Constructora Oriental SA', 5564789, 'Av gran colombia'),
(2000, '254121-1', 'DistriCivil', 5874123, 'Calle 15'),
(3000, '25418521-1', 'Homecenter', 5845723, 'Calle 13'),
(4000, '25411221-1', 'Suministroc civiles', 6574123, 'Diagonal Santander'),
(5000, '478254121-1', 'Suministros del oriente', 5478412, 'Los Patios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_x_suministro`
--

CREATE TABLE `proveedor_x_suministro` (
  `id_proveedor` int(11) NOT NULL,
  `id_suministro` int(11) NOT NULL,
  `precio_suministro` int(11) NOT NULL,
  `unidad_medida` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor_x_suministro`
--

INSERT INTO `proveedor_x_suministro` (`id_proveedor`, `id_suministro`, `precio_suministro`, `unidad_medida`) VALUES
(1000, 123, 26000, 'kg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suministro`
--

CREATE TABLE `suministro` (
  `id_suministro` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `suministro`
--

INSERT INTO `suministro` (`id_suministro`, `nombre`, `descripcion`) VALUES
(123, 'Cemento gris', 'paca de cemento cemex'),
(124, 'Tornillo de acero', 'tornillo cubierto de acero punta broca'),
(125, 'Ladrillo', '15cm X 8cm'),
(126, 'Bloque', '25cm X 10cm'),
(127, 'Arena gruesa', 'Arena gruesa de contenido 40K aprox'),
(128, 'Impermeabilizante', 'tornillo cubierto de acero punta broca'),
(129, 'Arena peña', 'Arena de peña de contenido 40K aprox'),
(130, 'Sika', 'Sikafelt-Fp 30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`id_obra`);

--
-- Indices de la tabla `obra_x_admin`
--
ALTER TABLE `obra_x_admin`
  ADD PRIMARY KEY (`id_obra`,`id_admin`),
  ADD KEY `id_obra` (`id_obra`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_admin_2` (`id_admin`),
  ADD KEY `id_admin_3` (`id_admin`);

--
-- Indices de la tabla `obra_x_proveedor`
--
ALTER TABLE `obra_x_proveedor`
  ADD PRIMARY KEY (`id_obra`,`id_proveedor`),
  ADD KEY `id_obra` (`id_obra`),
  ADD KEY `id_proveedor_2` (`id_proveedor`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_suministro` (`id_suministro`),
  ADD KEY `id_obra` (`id_obra`),
  ADD KEY `id_proveedor_2` (`id_proveedor`),
  ADD KEY `id_suministro_2` (`id_suministro`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `id_obra` (`id_obra`),
  ADD KEY `jefe` (`jefe`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `nit` (`nit`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD UNIQUE KEY `direccion` (`direccion`);

--
-- Indices de la tabla `proveedor_x_suministro`
--
ALTER TABLE `proveedor_x_suministro`
  ADD PRIMARY KEY (`id_proveedor`,`id_suministro`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_suministro` (`id_suministro`);

--
-- Indices de la tabla `suministro`
--
ALTER TABLE `suministro`
  ADD PRIMARY KEY (`id_suministro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `obra_x_admin`
--
ALTER TABLE `obra_x_admin`
  ADD CONSTRAINT `obra_x_admin_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrador` (`id_administrador`) ON UPDATE CASCADE,
  ADD CONSTRAINT `obra_x_admin_ibfk_2` FOREIGN KEY (`id_obra`) REFERENCES `obra` (`id_obra`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `obra_x_proveedor`
--
ALTER TABLE `obra_x_proveedor`
  ADD CONSTRAINT `obra_x_proveedor_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `obra_x_proveedor_ibfk_2` FOREIGN KEY (`id_obra`) REFERENCES `obra` (`id_obra`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_obra`) REFERENCES `obra` (`id_obra`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor_x_suministro` (`id_proveedor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_suministro`) REFERENCES `proveedor_x_suministro` (`id_suministro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`id_obra`) REFERENCES `obra` (`id_obra`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`jefe`) REFERENCES `administrador` (`id_administrador`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor_x_suministro`
--
ALTER TABLE `proveedor_x_suministro`
  ADD CONSTRAINT `proveedor_x_suministro_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedor_x_suministro_ibfk_2` FOREIGN KEY (`id_suministro`) REFERENCES `suministro` (`id_suministro`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
