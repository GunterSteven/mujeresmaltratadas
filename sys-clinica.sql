-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-08-2022 a las 17:49:47
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sys-clinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cita` int(200) NOT NULL,
  `id_paciente` int(200) NOT NULL,
  `id_medico` int(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado_cita` varchar(200) NOT NULL,
  `observaciones` varchar(200) NOT NULL,
  `horario` varchar(200) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_cita`, `id_paciente`, `id_medico`, `fecha`, `estado_cita`, `observaciones`, `horario`, `nombre`, `apellido`) VALUES
(4, 3, 1, '2022-08-31 00:00:00', 'pendiente', '', 'todo el dia', NULL, NULL),
(7, 5, 1, '2022-08-26 00:00:00', 'pendiente', '', 'todo el dia', NULL, NULL),
(11, 4, 1, '0000-00-00 00:00:00', 'pendiente', '', 'todo el dia', NULL, NULL),
(12, 3, 1, '2022-08-09 19:48:00', 'pendiente', '', 'todo el dia', NULL, NULL),
(13, 3, 1, '2022-08-09 19:49:00', 'pendiente', '', 'todo el dia', NULL, NULL),
(14, 3, 1, '2022-08-09 19:49:00', 'pendiente', '', 'todo el dia', NULL, NULL),
(15, 3, 1, '2022-09-06 23:42:00', 'pendiente', '', 'todo el dia', NULL, NULL),
(16, 3, 1, '2022-08-19 20:40:00', 'Aceptado', '', 'todo el dia', NULL, NULL),
(19, 3, 1, '2022-08-11 21:26:00', 'Aceptado', '', 'todo el dia', NULL, NULL),
(20, 3, 1, '2022-08-11 12:25:00', 'Aceptado', '', 'todo el dia', NULL, NULL),
(21, 3, 1, '2022-08-20 13:24:00', 'Aceptado', '', 'todo el dia', NULL, NULL),
(22, 3, 1, '2022-09-01 10:21:00', 'Aceptado', '', '2022-09-01T10:21', NULL, NULL),
(23, 4, 4, '2022-08-15 10:22:00', 'Aceptado', '', '2022-08-15T10:22', NULL, NULL),
(24, 3, 1, '2022-08-19 22:27:00', 'Aceptado', '', '2022-08-19T22:27', NULL, NULL),
(28, 3, 1, '2022-08-13 10:25:00', 'Aceptado', '', '2022-08-13T10:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`) VALUES
(1, 'soltera'),
(2, 'en una relacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_medico`
--

CREATE TABLE `horario_medico` (
  `id_horario_medico` int(200) NOT NULL,
  `dia_laborable` varchar(200) NOT NULL,
  `hora_inicio` varchar(200) NOT NULL,
  `hora_fin` varchar(200) NOT NULL,
  `cita_duracion` varchar(200) NOT NULL,
  `id_medico` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario_medico`
--

INSERT INTO `horario_medico` (`id_horario_medico`, `dia_laborable`, `hora_inicio`, `hora_fin`, `cita_duracion`, `id_medico`) VALUES
(2, 'todos', '8:00', '17:00', '30min', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `psicologos`
--

CREATE TABLE `psicologos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `edad` varchar(2) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `especializacion` varchar(255) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `tipo` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `psicologos`
--

INSERT INTO `psicologos` (`id`, `nombre`, `edad`, `correo`, `contraseña`, `especializacion`, `ciudad`, `tipo`) VALUES
(1, 'Danna', '24', 'danna1@gmail.com', '1234', 'Psiscólogo social', 'Barranquilla', 3),
(2, 'Kelly', '30', 'kelly@gmail.com', '1234', 'Neuropsicologo', 'Sincelejo', 3),
(3, 'Belen', '25', 'belen@gmail.com', '1234', 'Piscólogo Edutativo', 'Vaupés', 3),
(4, 'Brenda', '35', 'brenda@gmail.com', '1234', 'Piscólogo Social', 'Guadalajara', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `nombre`) VALUES
(1, 'admin'),
(2, 'psicologo'),
(3, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(200) NOT NULL,
  `usuario` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `password`, `tipo`, `nombre`, `apellido`, `telefono`, `correo`, `id_estado`) VALUES
(1, 'admin', 'admin123', 1, 'admin', 'admin', '21342432', 'admin@gmail.com', 1),
(3, 'fhjagfeiu', 'Andrea123', 3, 'afshjah', 'sdghsjk', '2432432', 'andrea@gmail.com', 1),
(4, 'kell', '1234', 3, 'Kelly', 'Romero', '3229287747', 'kellyroca600@gmail.com', 2),
(5, 'brayner2', '123456', 3, 'brayner', 'perez', '3024144113', 'perezbrayner21@gmail.com', 1),
(6, 'Danna', '1234', 2, 'Danna', 'Rios', '345678', 'danna12@gmail.com', 1),
(9, 'Dani', '1234', 1, 'Daniela', 'Arevalo', '1234567823', 'daniela@gmail.com', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `horario_medico`
--
ALTER TABLE `horario_medico`
  ADD PRIMARY KEY (`id_horario_medico`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `psicologos`
--
ALTER TABLE `psicologos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `tipo` (`tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id_cita` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horario_medico`
--
ALTER TABLE `horario_medico`
  MODIFY `id_horario_medico` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `psicologos`
--
ALTER TABLE `psicologos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario_medico`
--
ALTER TABLE `horario_medico`
  ADD CONSTRAINT `horario_medico_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
