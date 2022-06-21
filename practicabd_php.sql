-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2022 a las 13:19:24
-- Versión del servidor: 8.0.28
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practicabd_php`
--
CREATE DATABASE IF NOT EXISTS `practicabd_php` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;
USE `practicabd_php`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int NOT NULL,
  `sueldoAdministrador` int NOT NULL,
  `idPersonaFK` int NOT NULL,
  `idWebFK` int NOT NULL,
  `idEsJefeDeFKt` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `sueldoAdministrador`, `idPersonaFK`, `idWebFK`, `idEsJefeDeFKt`) VALUES
(1, 1500, 1, 1, 1),
(2, 2000, 5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `claves`
--

CREATE TABLE `claves` (
  `idClave` int NOT NULL,
  `codigoClave` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precioCompraClave` int NOT NULL,
  `ivaAplicableClave` int NOT NULL,
  `precioVentaClave` int NOT NULL,
  `cantidadDisponibleClave` int NOT NULL,
  `idWebFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `claves`
--

INSERT INTO `claves` (`idClave`, `codigoClave`, `precioCompraClave`, `ivaAplicableClave`, `precioVentaClave`, `cantidadDisponibleClave`, `idWebFK`) VALUES
(1, '1784728FWE232', 7, 21, 15, 5, 3),
(2, '7345NIBN87BF34', 10, 21, 20, 32, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int NOT NULL,
  `codigoPostalCliente` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idPersonaFK` int NOT NULL,
  `idClaveFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `codigoPostalCliente`, `idPersonaFK`, `idClaveFK`) VALUES
(1, '41610', 1, 1),
(2, '41610', 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `idOferta` int NOT NULL,
  `porcentajeDescuentoOferta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `ofertas`
--

INSERT INTO `ofertas` (`idOferta`, `porcentajeDescuentoOferta`) VALUES
(1, 15),
(2, 20),
(3, 23),
(4, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int NOT NULL,
  `nombrePersona` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidoPersona` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `dniPersona` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoPersona` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `nombrePersona`, `apellidoPersona`, `dniPersona`, `telefonoPersona`) VALUES
(1, 'Jaime', 'Suarez', '12345678U', 112233445),
(5, 'Rosa', 'Parrilla', '87654321E', 998877665),
(6, 'Juan', 'Saucedo', '15783570N', 123575689);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tener`
--

CREATE TABLE `tener` (
  `idTener` int NOT NULL,
  `idWebFK` int NOT NULL,
  `idOfertaFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tener`
--

INSERT INTO `tener` (`idTener`, `idWebFK`, `idOfertaFK`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `webs`
--

CREATE TABLE `webs` (
  `idWeb` int NOT NULL,
  `nombreWeb` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `webs`
--

INSERT INTO `webs` (`idWeb`, `nombreWeb`) VALUES
(1, 'Steam'),
(2, 'Epic'),
(3, 'Instant'),
(4, 'G2A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`),
  ADD UNIQUE KEY `idPersonaFK` (`idPersonaFK`,`idWebFK`,`idEsJefeDeFKt`),
  ADD KEY `idWebFK` (`idWebFK`),
  ADD KEY `idEsJefeDeFKt` (`idEsJefeDeFKt`);

--
-- Indices de la tabla `claves`
--
ALTER TABLE `claves`
  ADD PRIMARY KEY (`idClave`),
  ADD UNIQUE KEY `idWebFK` (`idWebFK`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `idPersonaFK` (`idPersonaFK`,`idClaveFK`),
  ADD KEY `idClaveFK` (`idClaveFK`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`idOferta`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `tener`
--
ALTER TABLE `tener`
  ADD PRIMARY KEY (`idTener`),
  ADD KEY `idWebFK` (`idWebFK`),
  ADD KEY `idOfertaFK` (`idOfertaFK`);

--
-- Indices de la tabla `webs`
--
ALTER TABLE `webs`
  ADD PRIMARY KEY (`idWeb`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `claves`
--
ALTER TABLE `claves`
  MODIFY `idClave` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `idOferta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tener`
--
ALTER TABLE `tener`
  MODIFY `idTener` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `webs`
--
ALTER TABLE `webs`
  MODIFY `idWeb` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`idWebFK`) REFERENCES `webs` (`idWeb`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `administrador_ibfk_2` FOREIGN KEY (`idPersonaFK`) REFERENCES `persona` (`idPersona`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `administrador_ibfk_3` FOREIGN KEY (`idEsJefeDeFKt`) REFERENCES `administrador` (`idAdministrador`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `claves`
--
ALTER TABLE `claves`
  ADD CONSTRAINT `claves_ibfk_1` FOREIGN KEY (`idWebFK`) REFERENCES `webs` (`idWeb`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idClaveFK`) REFERENCES `claves` (`idClave`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`idPersonaFK`) REFERENCES `persona` (`idPersona`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `tener`
--
ALTER TABLE `tener`
  ADD CONSTRAINT `tener_ibfk_1` FOREIGN KEY (`idWebFK`) REFERENCES `webs` (`idWeb`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tener_ibfk_2` FOREIGN KEY (`idOfertaFK`) REFERENCES `ofertas` (`idOferta`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
