-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2017 a las 18:47:49
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
(13, 2404, 'plc', 'Prueba 2', 'Respuesta\r\n\r\nBla \r\n\r\nBla\r\n\r\nBla\r\n\r\nDemanda\r\n\r\nBla\r\n\r\nBla\r\n\r\nBla\r\n\r\nCuantiosas multas', NULL, '', 0, '2017-12-01 10:15:52');

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
(1, 'Prueba 1', '<!--[if gte mso 9]><xml> <o:OfficeDocumentSettings>  <o:RelyOnVML/>  <o:AllowPNG/> </o:OfficeDocumentSettings></xml><![endif]--><!--[if gte mso 9]><xml> <w:WordDocument>  <w:View>Normal</w:View>  <w:Zoom>0</w:Zoom>  <w:TrackMoves/>  <w:TrackFormatting/>  <w:HyphenationZone>21</w:HyphenationZone>  <w:PunctuationKerning/>  <w:ValidateAgainstSchemas/>  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>  <w:DoNotPromoteQF/>  <w:LidThemeOther>ES</w:LidThemeOther>  <w:LidThemeAsian>JA</w:LidThemeAsian> AR-S  <w:Compatibility>   <w:BreakWrappedTables/>   <w:SnapToGridInCell/>   <w:WrapTextWithPunct/>   <w:UseAsianBreakRules/>   <w:DontGrowAutofit/>   <w:SplitPgBreakAndParaMark/>   <w:EnableOpenTypeKerning/>   <w:DontFlipMirrorIndents/>   <w:OverrideTableStyleHps/>  </w:Compatibility>  <m:mathPr>   <m:mathFont m:val=\"Cambria Math\"/>   <m:brkBin m:val=\"before\"/>   <m:brkBinSub m:val=\"&#45;-\"/>   <m:smallFrac m:val=\"off\"/>   <m:dispDef/>   <m:lMargin m:val=\"0\"/>   <m:rMargin m:val=\"0\"/>   <m:defJc m:val=\"centerGroup\"/>   <m:wrapIndent m:val=\"1440\"/>   <m:intLim m:val=\"subSup\"/>   <m:naryLim m:val=\"undOvr\"/>  </m:mathPr></w:WordDocument></xml><![endif]--><!--[if gte mso 9]><xml> <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"  LatentStyleCount=\"374\">  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 5\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 6\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 7\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 8\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index 9\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Normal Indent\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"footnote text\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"annotation text\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"header\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"footer\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"index heading\"/>  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"table of figures\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"envelope address\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"envelope return\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"footnote reference\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"annotation reference\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"line number\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"page number\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"endnote reference\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"endnote text\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"table of authorities\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"macro\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"toa heading\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Bullet\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Number\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List 5\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Bullet 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Bullet 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Bullet 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Bullet 5\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Number 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Number 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Number 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Number 5\"/>  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Closing\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Signature\"/>  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Body Text\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Body Text Indent\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Continue\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Continue 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Continue 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Continue 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"List Continue 5\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Message Header\"/>  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Salutation\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Date\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Body Text First Indent\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Body Text First Indent 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Note Heading\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Body Text 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Body Text 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Body Text Indent 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Body Text Indent 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Block Text\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Hyperlink\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"FollowedHyperlink\"/>  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Document Map\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Plain Text\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"E-mail Signature\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Top of Form\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Bottom of Form\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Normal (Web)\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Acronym\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Address\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Cite\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Code\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Definition\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Keyboard\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Preformatted\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Sample\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Typewriter\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"HTML Variable\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Normal Table\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"annotation subject\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"No List\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Outline List 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Outline List 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Outline List 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Simple 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Simple 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Simple 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Classic 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Classic 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Classic 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Classic 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Colorful 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Colorful 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Colorful 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Columns 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Columns 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Columns 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Columns 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Columns 5\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Grid 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Grid 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Grid 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Grid 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Grid 5\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Grid 6\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Grid 7\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Grid 8\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table List 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table List 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table List 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table List 4\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table List 5\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table List 6\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table List 7\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table List 8\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table 3D effects 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table 3D effects 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table 3D effects 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Contemporary\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Elegant\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Professional\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Subtle 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Subtle 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Web 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Web 2\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Web 3\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Balloon Text\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Table Theme\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"   Name=\"List Paragraph\"/>  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"   Name=\"Intense Quote\"/>  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"   Name=\"Subtle Emphasis\"/>  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"   Name=\"Intense Emphasis\"/>  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"   Name=\"Subtle Reference\"/>  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"   Name=\"Intense Reference\"/>  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"Grid Table 1 Light Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"Grid Table 6 Colorful Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"Grid Table 7 Colorful Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"Grid Table 1 Light Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"Grid Table 6 Colorful Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"Grid Table 7 Colorful Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"Grid Table 1 Light Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"Grid Table 6 Colorful Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"Grid Table 7 Colorful Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"Grid Table 1 Light Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"Grid Table 6 Colorful Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"Grid Table 7 Colorful Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"Grid Table 1 Light Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"Grid Table 6 Colorful Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"Grid Table 7 Colorful Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"Grid Table 1 Light Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"Grid Table 6 Colorful Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"Grid Table 7 Colorful Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"List Table 1 Light Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"List Table 6 Colorful Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"List Table 7 Colorful Accent 1\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"List Table 1 Light Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"List Table 6 Colorful Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"List Table 7 Colorful Accent 2\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"List Table 1 Light Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"List Table 6 Colorful Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"List Table 7 Colorful Accent 3\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"List Table 1 Light Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"List Table 6 Colorful Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"List Table 7 Colorful Accent 4\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"List Table 1 Light Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"List Table 6 Colorful Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"List Table 7 Colorful Accent 5\"/>  <w:LsdException Locked=\"false\" Priority=\"46\"   Name=\"List Table 1 Light Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"51\"   Name=\"List Table 6 Colorful Accent 6\"/>  <w:LsdException Locked=\"false\" Priority=\"52\"   Name=\"List Table 7 Colorful Accent 6\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Mention\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Smart Hyperlink\"/>  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"   Name=\"Hashtag\"/> </w:LatentStyles></xml><![endif]--><!--[if gte mso 10]><style> /* Style Definitions */ table.MsoNormalTable	{mso-style-name:\"Tabla normal\";	mso-tstyle-rowband-size:0;	mso-tstyle-colband-size:0;	mso-style-noshow:yes;	mso-style-priority:99;	mso-style-parent:\"\";	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;	mso-para-margin:0cm;	mso-para-margin-bottom:.0001pt;	mso-pagination:widow-orphan;	font-size:10.0pt;	font-family:\"Calibri\",sans-serif;	mso-bidi-font-family:\"Times New Roman\";	mso-ansi-language:ES;	mso-fareast-language:JA;}</style><![endif]--><p align=\"center\"><b style=\"msofont-weight:normal\"><span style=\"font-size:23.0pt;msofont-family:Calibri\">JOVÁN ALEXANDER GONZALEZ MANDUJANO</span></b></p><p align=\"center\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Tres Monte#760 Depto. 2404 – Condominio Plaza Los Castaños - Quilicura - Santiago</span></p><p align=\"center\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">22 628 09 75/ 9 4840 46 55</span></p><p><span style=\"font-size:11.5pt;msofont-family:Calibri\"> </span></p><p><b style=\"msofont-weight:normal\"><u><span style=\"font-size:15.0pt;msofont-family:Calibri\">Antecedentes Personales</span></u></b></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:15.0pt;msofont-family:Calibri\"> </span></b></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Fecha deNacimiento</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"><span style=\"msocount:2\">                  </span>17 de Marzo de 1990</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Cédula deIdentidad</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"><span style=\"msocount:2\">                   </span>17.427.300-6</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Edad</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"> <span style=\"msocount:2\">                    </span><span style=\"msocount:2\">                        </span>26 años</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Sexo</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"> <span style=\"msocount:4\">                                             </span>Masculino</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">EstadoCivil<span style=\"msocount:3\">                                  </span></span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\">Casado</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Nacionalidad</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"> <span style=\"msocount:3\">                               </span>Chilena</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Licencia deConducir<span style=\"msocount:2\">                  </span></span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\">B - C</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">CorreoElectrónico</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"><span style=\"msocount:2\">                     </span></span><a href=\"mailto:jovan.gonzalez@outlook.com\"><span style=\"color:windowtext;msofont-weight:bold;text-decoration:none;text-underline:none\">jovan.gonzalez@outlook.com</span></a><span style=\"msofont-weight:bold\"></span></p><p><span style=\"font-size:11.5pt;msofont-family:Calibri\"> </span></p><p><b style=\"msofont-weight:normal\"><u><span style=\"font-size:15.0pt;msofont-family:Calibri\">Antecedentes Académicos</span></u></b></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:15.0pt;msofont-family:Calibri\"> </span></b></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Enseñanza Básica</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"> <span style=\"msocount:2\">                        </span>Escuela PresidenteAlessandri - Independencia</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Enseñanza Media</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"> <span style=\"msocount:2\">                         </span>Liceo Politécnico AndesFundación Duoc UC – Renca</span></p><p><span style=\"font-size:11.5pt;msofont-family:Calibri\">            Especialidad: Técnico en Telecomunicaciones conmención en<br>            conectividad y redes <span style=\"color:black\">(la carrera sedesarrolla durante los cuatro años de <br>            enseñanza media).</span></span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">EnseñanzaSuperior</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"><span style=\"msocount:2\">                    </span>Analista ProgramadorComputacional - Instituto Duoc UC<br> <span style=\"msocount:4\">                                                       </span>TituloObtenido</span></p><p><b style=\"msofont-weight:normal\"><span style=\"font-size:11.5pt;msofont-family:Calibri\">Títulos y Grados</span></b><span style=\"font-size:11.5pt;msofont-family:Calibri\"> <span style=\"msocount:2\">                            </span></span></p><p><span style=\"font-size:11.5pt;font-family:Symbol;msofont-family:Symbol;msofont-family:Symbol\"><span style=\"mso-list:Ignore\">·<span style=\"font:7.0pt &quot;Times New Roman&quot;\">        </span></span></span><span style=\"font-size:11.5pt;msofont-family:Calibri\">Certificación CISCO - CCNA1</span></p><p><span style=\"font-size:11.5pt;font-family:Symbol;msofont-family:Symbol;msofont-family:Symbol\"><span style=\"mso-list:Ignore\">·<span style=\"font:7.0pt &quot;Times New Roman&quot;\">        </span></span></span><span style=\"font-size:11.5pt;msofont-family:Calibri\">Certificación D-Link DBCEX</span></p><p><span style=\"font-size:11.5pt;font-family:Symbol;msofont-family:Symbol;msofont-family:Symbol\"><span style=\"mso-list:Ignore\">·<span style=\"font:7.0pt &quot;Times New Roman&quot;\">        </span></span></span><span style=\"font-size:11.5pt;msofont-family:Calibri\">Certificación Eset – Seguridad Informática</span></p><p><span style=\"font-size:11.5pt;font-family:Symbol;msofont-family:Symbol;msofont-family:Symbol;msolanguage:EN-US\"><span style=\"mso-list:Ignore\">·<span style=\"font:7.0pt &quot;Times New Roman&quot;\">        </span></span></span><span style=\"font-size:11.5pt;msofont-family:Calibri;msolanguage:EN-US\">Certificación ITEssentials: PC Hardware and Software</span></p><p><span style=\"font-size:11.5pt;font-family:Symbol;msofont-family:Symbol;msofont-family:Symbol;msolanguage:ES\"><span style=\"mso-list:Ignore\">·<span style=\"font:7.0pt &quot;Times New Roman&quot;\">        </span></span></span><span style=\"font-size:11.5pt;msofont-family:Calibri;msolanguage:ES\">Curso de armado y <span style=\"color:black\">configuración</span> de computadores.</span></p>', 'plc', '2017-12-01 15:44:39', '2017-12-06 15:38:21', 4, 1);

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
  MODIFY `idConv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
