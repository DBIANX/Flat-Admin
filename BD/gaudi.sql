-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2017 a las 13:52:04
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gaudi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condominios`
--

CREATE TABLE `condominios` (
  `idCond` varchar(4) NOT NULL,
  `Nombre` text NOT NULL,
  `Direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `condominios`
--

INSERT INTO `condominios` (`idCond`, `Nombre`, `Direccion`) VALUES
('plc', 'Plaza los Castaños', 'Tres Montes 760, Quilicura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deptos`
--

CREATE TABLE `deptos` (
  `depto` int(11) NOT NULL,
  `cond` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deptos`
--

INSERT INTO `deptos` (`depto`, `cond`) VALUES
(2404, 'plc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastocomun`
--

CREATE TABLE `gastocomun` (
  `idGC` int(11) NOT NULL,
  `idCond` varchar(4) NOT NULL,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `adjunto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastocomun`
--

INSERT INTO `gastocomun` (`idGC`, `idCond`, `mes`, `anio`, `adjunto`) VALUES
(12, 'plc', 11, 2017, 'GC_Noviembre_2017_Plaza los Castaños.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `idConv` int(11) NOT NULL,
  `depto` int(11) NOT NULL,
  `cond` varchar(4) NOT NULL,
  `titulo` text NOT NULL,
  `mensajeDepto` text,
  `mensajeAdmin` text,
  `adjunto` text,
  `flagadjunto` tinyint(1) DEFAULT NULL,
  `fechahora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`idConv`, `depto`, `cond`, `titulo`, `mensajeDepto`, `mensajeAdmin`, `adjunto`, `flagadjunto`, `fechahora`) VALUES
(10, 2404, 'plc', 'Prueba 1', '', 'Hola', '', 0, '2017-11-28 13:46:02'),
(11, 2404, 'plc', 'Prueba 2', NULL, 'Prueba\r\n\r\nMensaje\r\n\r\n1 \r\n\r\n2\r\n\r\n3', '5802.pdf', 1, '2017-11-28 16:34:00'),
(12, 2404, 'plc', 'Prueba 1', 'Respuesta prueba 1', '', '', 0, '2017-11-30 15:59:14'),
(13, 2404, 'plc', 'Prueba 2', 'Respuesta\r\n\r\nBla \r\n\r\nBla\r\n\r\nBla\r\n\r\nDemanda\r\n\r\nBla\r\n\r\nBla\r\n\r\nBla\r\n\r\nCuantiosas multas', NULL, '', 0, '2017-12-01 10:15:52'),
(14, 2404, 'plc', 'Prueba 1', 'Hola', NULL, '', 0, '2017-12-11 13:06:33'),
(15, 2404, 'plc', 'Prueba 10', 'Hola', NULL, '', 0, '2017-12-11 13:24:32'),
(16, 2404, 'plc', 'Prueba 11', 'Hola', NULL, '', 0, '2017-12-11 15:13:59'),
(17, 2404, 'plc', 'Prueba 1', 'Hola', NULL, '', 0, '2017-12-11 15:20:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meses`
--

CREATE TABLE `meses` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `meses`
--

INSERT INTO `meses` (`id`, `Nombre`) VALUES
(1, 'Enero'),
(2, 'Febrero'),
(3, 'Marzo'),
(4, 'Abril'),
(5, 'Mayo'),
(6, 'Junio'),
(7, 'Julio'),
(8, 'Agosto'),
(9, 'Septiembre'),
(10, 'Octubre'),
(11, 'Noviembre'),
(12, 'Diciembre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` text NOT NULL,
  `html` text NOT NULL,
  `idCond` varchar(4) NOT NULL,
  `creacion` datetime NOT NULL,
  `modificacion` datetime DEFAULT NULL,
  `idUsu` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `html`, `idCond`, `creacion`, `modificacion`, `idUsu`, `visible`) VALUES
(2, 'Corte de luz', '<div><p><font size=\"4\"><span style=\"font-family: arial, helvetica, sans-serif;\">Estimados Residentes: </span></font></p></div><div><p> </p></div><div><p><font size=\"3\"><span>Les informamos que </span><span>durante el día miércoles 04 de octubre</span><span>, se </span><span>realizará conexión de cargas eléctricas al grupo electrógeno.</span> </font></p></div><div><p><font size=\"3\"><span>Para efectuar dicho trabajo</span><span> se</span><span> debe realizar</span> <span> un corte de luz </span><span>en las áreas comunes del edificio por 2 hrs</span><span>.</span></font></p></div><div><p> </p></div><div><p> <font size=\"3\"><span>Proveedor encargado</span> </font></p></div><div><p><font size=\"3\"><span>INGECOTA - Claudio Ulloa M.</span> </font></p></div><div><p><font size=\"3\"> </font></p></div><div><p><font size=\"3\"><span>Gracias por </span><span> su colaboración.</span></font> <br></p></div>', 'plc', '2017-12-11 11:23:16', '2017-12-11 12:38:57', 4, 1),
(3, 'Asamblea ordinaria', '<div style=\"direction: ltr; text-align: center;\"><p><span style=\"font-weight: bold; font-size: 12pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 19px;\"><span style=\"background-color: inherit;\"> </span></span><span style=\"font-weight: bold; font-size: 12pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 19px;\"><span style=\"background-color: inherit;\">CITACION</span></span><span style=\"font-size: 12pt; line-height: 19px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr; text-align: center;\"><p><span style=\"font-weight: bold; font-size: 12pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 19px;\"><span style=\"background-color: inherit;\">ASAMBLEA ORDINARIA  DE COPROPIETARIOS </span></span><span style=\"font-size: 12pt; line-height: 19px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr; text-align: center;\"><p><span style=\"font-weight: bold; font-size: 12pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 19px;\"><span style=\"background-color: inherit;\">COMUNIDAD EDIFICIO GENTIL UNO</span></span><span style=\"font-size: 12pt; line-height: 19px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 12pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 19px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 12pt; line-height: 19px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 12pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 19px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 12pt; line-height: 19px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 12pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 19px;\"><span style=\"background-color: inherit;\">Santiago, 14 de abril de 2016</span></span><span style=\"font-size: 12pt; line-height: 19px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 12pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 19px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 12pt; line-height: 19px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">De acuerdo al Art. 19 del Reglamento de Copropiedad, se cita a Asamblea or</span></span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">dinaria de Copropietarios de Comunidad Edificio Gentil Uno</span></span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">, a celebrarse en</span></span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"> el Hall de la Comunidad </span></span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"> del  condominio</span></span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">, el día </span></span><span style=\"font-weight: bold; font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">jueves, 5 de mayo</span></span><span style=\"font-weight: bold; font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"> </span></span><span style=\"font-weight: bold; font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"> de 2016</span></span><span style=\"font-weight: bold; font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">, a las 19:30 horas en primera citación, y a las  20:00 horas en segunda citación.</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">Se solicita a los copropietarios que no puedan asistir, otorgar poder simple para ser representados (a personas de su confianza), para lo cual se anexa formato poder, puesto que las decisiones tomadas serán legalmente obligatorias para todos los departamentos.</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">Se recuerda que de acuerdo al Art. 2 N* 6 y Art. 20 de la Ley N* 19537, sólo tienen derechos las personas que se encuentren al día en sus gastos comunes, y que los arrendatarios no tienen derecho a representar a los propietarios a menos que se encuentren autorizados en el contrato de arriendo.</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-weight: bold; font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">TABLA</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">1.- Lectura Acta Anterior.</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">2.- </span></span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">Trabajos Realizados.</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">3.- Mejoras en Seguridad.</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">4.- Cambio de Administración.</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">5.-Otros.</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> </span></p></div><div style=\"direction: ltr;\"><p><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\"></span></span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"></span><span style=\"font-size: 11pt; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif; line-height: 18px;\"><span style=\"background-color: inherit;\">LA ADMINISTRACION</span></span><span style=\"font-size: 11pt; line-height: 18px; font-family: Times New Roman, &quot;Times New Roman_MSFontService&quot;, serif;\"> <br></span></p></div>', 'plc', '2017-12-11 11:26:45', '2017-12-11 11:32:18', 4, 1),
(10, 'Mascotas', '<p><b>COMUNIDAD  EDIFICIO  AMUNDSEN </b></p><p><b>LUIS AMUNDSEN 2170 – PROVIDENCIA </b><br></p><p><br></p><p> </p><p> </p><p> </p><p>Santiago, 17 de abril de 2015 <br></p><p><br></p><p> </p><p>Estimado Residente </p><p> </p><p>La administración debe velar por la buena convivencia dentro de la comunidad como un trabajo constante que requiere de mucho respeto y buena voluntad para el bienestar de todos. </p><p> </p><p>Por esta razón le recuerdo que el Reglamento de Copropiedad en su Art. 7º, letra d, indica que: “La tenencia de mascotas en los departamentos requiere que las circunstancias de su alojamiento en el aspecto higiénico y sanitario, de alimentos y custodia, sean las adecuadas, y que no se produzca ninguna situación de peligro o incomodidad para los vecinos o para el propio animal” Dicho artículo otorga además facultades para que la administración se reserve el derecho de prohibir la tenencia de alguna mascota, si de cualquier manera ésta es la causante de algún hecho grave de agresión, daño o incomodidad razonable a los demás propietarios o residentes. </p><p> </p><p>Teniendo en cuenta lo anterior, le solicitamos no baldear los balcones ya que el agua mezclada con deposiciones de animales escurre y contamina dependencias de uso común y privado, más allá de los límites de su propiedad. <br></p><p><br></p><p> </p><p> </p><p>Esperando contar con toda su colaboración, se despide <br></p><p><br></p><p> </p><p> </p><p>La Administración</p>', 'plc', '2017-12-11 12:27:10', '2017-12-11 12:27:14', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `loginUsu` varchar(30) NOT NULL,
  `notGC` int(11) NOT NULL,
  `notMensaje` int(11) NOT NULL,
  `notArticulos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`loginUsu`, `notGC`, `notMensaje`, `notArticulos`) VALUES
('jgonzalez', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsu` int(11) NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `Nombre` text NOT NULL,
  `telefono` text NOT NULL,
  `correo` text NOT NULL,
  `tipo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsu`, `login`, `password`, `Nombre`, `telefono`, `correo`, `tipo`) VALUES
(0, 'admin', 'admin', 'Admin', '0', 'correo', 'Administrador'),
(4, 'gonzaja25', '1plSY2/cMbyMOip8p93JqLoUKP8=', 'Jován González', 'González', 'jovan.gonzalez@abbott.com', 'Administrador'),
(7, 'jgonzalez', 'TDj0FYaocta7bhaH/qGQC6AX6lM=', 'Jován González', '226280975', 'shadowdebian@hotmail.com', 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosdeptos`
--

CREATE TABLE `usuariosdeptos` (
  `idUsu` int(11) NOT NULL,
  `depto` int(11) NOT NULL,
  `cond` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuariosdeptos`
--

INSERT INTO `usuariosdeptos` (`idUsu`, `depto`, `cond`) VALUES
(7, 2404, 'plc');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `condominios`
--
ALTER TABLE `condominios`
  ADD PRIMARY KEY (`idCond`);

--
-- Indices de la tabla `gastocomun`
--
ALTER TABLE `gastocomun`
  ADD PRIMARY KEY (`idGC`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`idConv`);

--
-- Indices de la tabla `meses`
--
ALTER TABLE `meses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`loginUsu`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gastocomun`
--
ALTER TABLE `gastocomun`
  MODIFY `idGC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `idConv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
