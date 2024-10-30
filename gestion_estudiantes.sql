-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 21:31:03
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_estudiantes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `Id_Admin` int(11) NOT NULL,
  `Id_Roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletin`
--

CREATE TABLE `boletin` (
  `Id_Boletin` int(11) NOT NULL,
  `Id_Estudiante` int(11) DEFAULT NULL,
  `Id_Materia` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Id_Tipo_Informe` int(11) DEFAULT NULL,
  `Nota` decimal(4,2) DEFAULT NULL,
  `Observaciones` text DEFAULT NULL,
  `Ciclolectivo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `Id_Curso` int(11) NOT NULL,
  `Nombre_Curso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `Id_Docente` int(11) NOT NULL,
  `Apellido_Nombre` varchar(100) NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `CUIL` varchar(20) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Barrio` varchar(100) DEFAULT NULL,
  `Id_Roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `Id_Estudiante` int(11) NOT NULL,
  `Apellido_Nombre` varchar(100) NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `CUIL` varchar(20) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Barrio` varchar(100) DEFAULT NULL,
  `NombreTutor` varchar(100) DEFAULT NULL,
  `CelularTutor` varchar(20) DEFAULT NULL,
  `Id_Roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `Id_Materia` int(11) NOT NULL,
  `Nombre_Materia` varchar(100) NOT NULL,
  `Observaciones` text DEFAULT NULL,
  `Id_Curso` int(11) DEFAULT NULL,
  `Id_Docente` int(11) DEFAULT NULL,
  `Id_Situacion_Docente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `Id_Roles` int(11) NOT NULL,
  `Nombre_Rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`Id_Roles`, `Nombre_Rol`) VALUES
(1, 'Estudiante'),
(2, 'Docente'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situacion_docente`
--

CREATE TABLE `situacion_docente` (
  `Id_Situacion_Docente` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `situacion_docente`
--

INSERT INTO `situacion_docente` (`Id_Situacion_Docente`, `Descripcion`) VALUES
(1, 'Titular'),
(2, 'Suplente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_informe`
--

CREATE TABLE `tipo_informe` (
  `Id_Tipo_Informe` int(11) NOT NULL,
  `Nombre_Tipo_Informe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_informe`
--

INSERT INTO `tipo_informe` (`Id_Tipo_Informe`, `Nombre_Tipo_Informe`) VALUES
(1, 'Primer_informe'),
(2, 'Segundo_Informe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_Admin`),
  ADD KEY `Id_Roles` (`Id_Roles`);

--
-- Indices de la tabla `boletin`
--
ALTER TABLE `boletin`
  ADD PRIMARY KEY (`Id_Boletin`),
  ADD KEY `Id_Estudiante` (`Id_Estudiante`),
  ADD KEY `Id_Materia` (`Id_Materia`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`Id_Curso`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`Id_Docente`),
  ADD KEY `Id_Roles` (`Id_Roles`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`Id_Estudiante`),
  ADD KEY `Id_Roles` (`Id_Roles`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`Id_Materia`),
  ADD KEY `Id_Docente` (`Id_Docente`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id_Roles`);

--
-- Indices de la tabla `situacion_docente`
--
ALTER TABLE `situacion_docente`
  ADD PRIMARY KEY (`Id_Situacion_Docente`);

--
-- Indices de la tabla `tipo_informe`
--
ALTER TABLE `tipo_informe`
  ADD PRIMARY KEY (`Id_Tipo_Informe`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `Id_Admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `boletin`
--
ALTER TABLE `boletin`
  MODIFY `Id_Boletin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `Id_Curso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `Id_Docente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `Id_Estudiante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `Id_Materia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `Id_Roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `situacion_docente`
--
ALTER TABLE `situacion_docente`
  MODIFY `Id_Situacion_Docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_informe`
--
ALTER TABLE `tipo_informe`
  MODIFY `Id_Tipo_Informe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`Id_Roles`) REFERENCES `roles` (`Id_Roles`);

--
-- Filtros para la tabla `boletin`
--
ALTER TABLE `boletin`
  ADD CONSTRAINT `boletin_ibfk_1` FOREIGN KEY (`Id_Estudiante`) REFERENCES `estudiantes` (`Id_Estudiante`),
  ADD CONSTRAINT `boletin_ibfk_2` FOREIGN KEY (`Id_Materia`) REFERENCES `materias` (`Id_Materia`);

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`Id_Roles`) REFERENCES `roles` (`Id_Roles`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`Id_Roles`) REFERENCES `roles` (`Id_Roles`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`Id_Docente`) REFERENCES `docentes` (`Id_Docente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
