-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2023 a las 05:42:49
-- Versión del servidor: 11.3.0-MariaDB
-- Versión de PHP: 8.2.4
-- GENERADO AUTOMATICAMENTE CON PHPMYADMIN
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `simpsons_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amistades`
--

CREATE TABLE `amistades` (
  `ID_Amistad` int(11) NOT NULL,
  `ID_Personaje1` int(11) DEFAULT NULL,
  `ID_Personaje2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `amistades`
--

INSERT INTO `amistades` (`ID_Amistad`, `ID_Personaje1`, `ID_Personaje2`) VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `ID_Familia` int(11) NOT NULL,
  `ID_Personaje` int(11) DEFAULT NULL,
  `Parentesco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`ID_Familia`, `ID_Personaje`, `Parentesco`) VALUES
(1, 1, 'Padre de Bart y Lisa'),
(2, 2, 'Madre de Bart y Lisa'),
(3, 3, 'Hijo de Homer y Marge'),
(4, 4, 'Hija de Homer y Marge');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `ID_Personaje` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Ocupacion` varchar(255) DEFAULT NULL,
  `Relacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`ID_Personaje`, `Nombre`, `Edad`, `Ocupacion`, `Relacion`) VALUES
(1, 'Homero', 40, 'Inspector Nucleare', 'Casado con Marge'),
(2, 'Marge', 38, 'Ama de Casa', 'Casada con Homero'),
(3, 'Bart', 10, 'Estudiante', 'Hijo de Homero y Marge'),
(4, 'Lisa', 8, 'Estudiante', 'Hija de Homero y Marge'),
(5, 'Ned', 45, 'Dueño de la tienda', 'Vecino de los Simpson'),
(6, 'Nelson', 14, 'Bully', 'Ninguna');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amistades`
--
ALTER TABLE `amistades`
  ADD PRIMARY KEY (`ID_Amistad`),
  ADD KEY `ID_Personaje1` (`ID_Personaje1`),
  ADD KEY `ID_Personaje2` (`ID_Personaje2`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`ID_Familia`),
  ADD KEY `ID_Personaje` (`ID_Personaje`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`ID_Personaje`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amistades`
--
ALTER TABLE `amistades`
  ADD CONSTRAINT `amistades_ibfk_1` FOREIGN KEY (`ID_Personaje1`) REFERENCES `personajes` (`ID_Personaje`),
  ADD CONSTRAINT `amistades_ibfk_2` FOREIGN KEY (`ID_Personaje2`) REFERENCES `personajes` (`ID_Personaje`);

--
-- Filtros para la tabla `familia`
--
ALTER TABLE `familia`
  ADD CONSTRAINT `familia_ibfk_1` FOREIGN KEY (`ID_Personaje`) REFERENCES `personajes` (`ID_Personaje`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
