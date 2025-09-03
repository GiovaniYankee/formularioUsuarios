-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-08-2025 a las 22:34:47
-- Versión del servidor: 10.11.10-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_educativo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

CREATE TABLE `aula` (
  `idaula` int(11) NOT NULL,
  `nombreAula` varchar(50) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `tipoAula` varchar(20) DEFAULT NULL,
  `habilitada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aula`
--

INSERT INTO `aula` (`idaula`, `nombreAula`, `capacidad`, `tipoAula`, `habilitada`) VALUES
(1, 'Aula 1-2', 60, 'Fisica', 1),
(2, 'Aula Youtube', 500, 'Virtual', 1),
(3, 'Aula 3', 60, 'Fisica', 1),
(5, 'Aula 5', 60, 'Fisica', 1),
(6, 'Aula 6', 60, 'Fisica', 1),
(7, 'Aula 7', 60, 'Fisica', 1),
(8, 'Aula 8', 60, 'Fisica', 1),
(12, 'Aula 12', 60, 'Fisica', 1),
(13, 'Informática', 60, 'Fisica', 1),
(14, 'Laboratorio', 60, 'Fisica', 1),
(15, 'Aula 1 externa', 60, 'Fisica', 1),
(16, 'Aula 2 externa', 60, 'Fisica', 1),
(17, 'Aula 3-4 externa', 60, 'Fisica', 1),
(18, 'Pecera chica', 60, 'Fisica', 1),
(19, 'Pecera grande', 60, 'Fisica', 1),
(20, 'Aula 4', 60, 'Fisica', 1),
(21, 'Casa de la Cultura', 300, 'Fisica', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `idconcepto` int(11) NOT NULL,
  `concepto` varchar(45) DEFAULT NULL,
  `detalle` varchar(100) DEFAULT NULL,
  `tipoconcepto` enum('T','E') DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`idconcepto`, `concepto`, `detalle`, `tipoconcepto`, `habilitado`) VALUES
(1, 'inscripción', NULL, 'E', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentacion`
--

CREATE TABLE `documentacion` (
  `iddocumentacion` int(11) NOT NULL,
  `fotoDNI1` mediumtext DEFAULT NULL,
  `fotoDNI2` mediumtext DEFAULT NULL,
  `fotoPartidaNacimiento` mediumtext DEFAULT NULL,
  `tituloSecundario` varchar(45) DEFAULT NULL,
  `estadoTS` enum('T','P') DEFAULT NULL,
  `fotoTitulo1` mediumtext DEFAULT NULL,
  `fotoTitulo2` mediumtext DEFAULT NULL,
  `tituloGrado` varchar(45) DEFAULT NULL,
  `estadoTG` enum('T','P') DEFAULT NULL,
  `certificadoDomicilio` mediumtext DEFAULT NULL,
  `estadoCF` enum('T','P') DEFAULT NULL,
  `libretaSanitaria` mediumtext DEFAULT NULL,
  `estadoAC` enum('N','T','P') DEFAULT NULL,
  `libretaVacuna` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoalumno`
--

CREATE TABLE `estadoalumno` (
  `idestadoAlumno` int(11) NOT NULL,
  `estadoAlumno` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadoalumno`
--

INSERT INTO `estadoalumno` (`idestadoAlumno`, `estadoAlumno`, `detalle`, `habilitado`) VALUES
(1, 'aspirante', NULL, 1),
(2, 'regular', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `idfacultad` int(11) NOT NULL,
  `nombreFacultad` varchar(500) DEFAULT NULL,
  `tipoFacultad_idtipoFacultad` int(11) DEFAULT NULL,
  `resolucion_idresolucion` int(11) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL,
  `corte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`idfacultad`, `nombreFacultad`, `tipoFacultad_idtipoFacultad`, `resolucion_idresolucion`, `habilitado`, `corte`) VALUES
(1, '14° Congreso de Educación Integral, Alfabetización y Literatura', 5, 1, 1, 2025),
(2, 'Tecnicatura', 4, 3, 1, 2025);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

CREATE TABLE `formapago` (
  `idformapago` int(11) NOT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `cuotaFinal` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `persona_idpersona` int(11) DEFAULT NULL,
  `importe_idimporte` int(11) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formapago`
--

INSERT INTO `formapago` (`idformapago`, `fechaInicio`, `cuotaFinal`, `detalle`, `persona_idpersona`, `importe_idimporte`, `habilitado`) VALUES
(1, '2025-08-21 15:54:26', '12000', '1', 1, 1, 1),
(2, '2025-08-22 08:39:05', '12000', '1', 84, 1, 1),
(3, '2025-08-22 12:57:40', '12000', '1', 1, 1, 1),
(4, '2025-08-22 14:26:26', '12000', '1', 1, 1, 1),
(5, '2025-08-22 14:32:42', '12000', '1', 1, 1, 1),
(6, '2025-08-22 14:43:35', '12000', '1', 1, 1, 1),
(7, '2025-08-22 15:29:44', '12000', '1', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `importe`
--

CREATE TABLE `importe` (
  `idimporte` int(11) NOT NULL,
  `fechaImporte` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `montopesos` decimal(10,2) DEFAULT NULL,
  `cantidadCuota` int(11) DEFAULT NULL,
  `concepto_idconcepto` int(11) DEFAULT NULL,
  `tipoFacultad_idtipoFacultad` int(11) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `importe`
--

INSERT INTO `importe` (`idimporte`, `fechaImporte`, `fechaFin`, `montopesos`, `cantidadCuota`, `concepto_idconcepto`, `tipoFacultad_idtipoFacultad`, `habilitado`) VALUES
(1, '2025-08-21 15:48:39', '2025-08-28 15:48:39', 30000.00, 1, 1, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `idinscripcion` int(11) NOT NULL,
  `fechaInscripcion` datetime DEFAULT NULL,
  `persona_idpersona` int(11) DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `detalle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`detalle`)),
  `habilitado` tinyint(4) DEFAULT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  `estadoalumno_idestadoAlumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`idinscripcion`, `fechaInscripcion`, `persona_idpersona`, `fechaFinal`, `detalle`, `habilitado`, `facultad_idfacultad`, `estadoalumno_idestadoAlumno`) VALUES
(1, '2025-08-21 15:54:26', 1, NULL, '{\"idmateria\":\"7\"}', 0, 1, 1),
(2, '2025-08-22 08:39:05', 84, NULL, '{\"idmateria\":\"5\"}', 0, 1, 1),
(3, '2025-08-22 12:57:40', 1, NULL, '{\"idmateria\":\"10\"}', 0, 1, 1),
(4, '2025-08-22 14:26:26', 1, NULL, '{\"idmateria\":\"19\"}', 0, 1, 1),
(5, '2025-08-22 14:32:42', 1, NULL, '{\"idmateria\":\"18\"}', 0, 1, 1),
(6, '2025-08-22 14:43:35', 1, NULL, '{\"idmateria\":\"10\"}', 0, 1, 1),
(7, '2025-08-22 15:29:44', 1, NULL, '{\"idmateria\":\"14\"}', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL,
  `materia` varchar(150) NOT NULL,
  `anioCurso` int(4) NOT NULL,
  `horaCursado` int(5) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `persona_idpersona` int(11) DEFAULT NULL,
  `habilitado` tinyint(4) NOT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  `aula_idaula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idmateria`, `materia`, `anioCurso`, `horaCursado`, `fechaInicio`, `fechaFin`, `persona_idpersona`, `habilitado`, `facultad_idfacultad`, `aula_idaula`) VALUES
(10, '1-Retroalimentación formativa: pilar del aprendizaje activo-Mariana De Cara y Julio Navarro', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 21),
(11, '2- La obra artística y cultural de Bettina Ba', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 3),
(12, '3- En relación a “Cómo (no) enseñar gramática', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 18),
(13, '4-“Abordaje de estrategias inclusivas en la f', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 5),
(14, '5- Narrativas en movimiento para re-imaginar ', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 6),
(15, '6- Autocuidado integral para docentes: Aporte', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 7),
(16, '7- Tiempo de rondas: Aprendizaje basado en ex', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 8),
(17, '8- Administrar también es leer: alfabetizació', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 14),
(18, '9- Escape Matemático: activando funciones eje', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 12),
(19, '10- Valorar la afectividad en la convivencia ', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 13),
(21, '1-(Virtual)Retroalimentación formativa: pilar del aprendizaje activo-Mariana De Cara y Julio Navarro', 2025, 17, '2025-09-05', '2025-09-05', NULL, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idpais` int(11) NOT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `pais`, `habilitado`) VALUES
(2, 'Argentina', 1),
(3, 'Chile', 1),
(4, 'Bolivia', 1),
(5, 'Brasil', 1),
(6, 'Uruguay', 1),
(7, 'Paraguay', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tipoDocumento` varchar(10) DEFAULT NULL,
  `numDocumento` int(20) DEFAULT NULL,
  `cuil` varchar(11) DEFAULT NULL,
  `fechaNacimiento` varchar(45) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `pais_idpais` int(11) DEFAULT NULL,
  `provincia_idprovincia` int(11) DEFAULT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `fechaAlta` datetime DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `tipoPersona_idtipoPersona` int(11) DEFAULT NULL,
  `situacion` varchar(45) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `apellido`, `nombre`, `tipoDocumento`, `numDocumento`, `cuil`, `fechaNacimiento`, `correo`, `telefono`, `direccion`, `pais_idpais`, `provincia_idprovincia`, `localidad`, `fechaAlta`, `genero`, `tipoPersona_idtipoPersona`, `situacion`, `habilitado`) VALUES
(1, 'Terán', 'Sergio Esteban', 'DNI', 25356869, '20252568691', '', 'sergio.teran1@gmai.com', '2615182938', '', 2, 3, 'Vistalba', '2025-08-22 16:46:59', '', 3, 'Suplente', 1),
(2, 'Olarte', 'Micaela', 'DNI', 39381902, '0', '0000-00-00', 'micaolarte@gmail.com', '2615196193', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(3, 'Aburto ', 'Cintia Mariana ', 'DNI', 38581315, '0', '0000-00-00', 'aburtomari32@gmail.com', '2616265668', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(4, 'Ríos', 'Fernando Ariel', 'DNI', 24317286, '0', '0000-00-00', 'riosfernando@ymail.com', '2616663351', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(5, 'Man ', 'Karen Estefan?a ', 'DNI', 42669600, '0', '0000-00-00', 'Prof.karenman@gmail.com', '2616686166', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(6, 'Cáceres', '?ngela', 'DNI', 23043655, '0', '0000-00-00', 'caceresacevedo750@gmail.com', '2614181743', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(7, 'Giangiulio', 'Sabrina', 'DNI', 45360985, '0', '0000-00-00', 'sabrinagiangiulio612@gmail.com', '2616913761', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(8, 'Mayorga ', 'Juanita ', 'DNI', 47448172, '0', '0000-00-00', 'juanitaavila055@gmail.com', '2616214936', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(9, 'Videla ', 'Patricia beatriz ', 'DNI', 37622914, '0', '0000-00-00', 'patito_1704@live.com.ar', '2616334909', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(10, 'Zarate', 'Lucia', 'DNI', 32855577, '0', '0000-00-00', 'Lucia2021pastran@gmail.com', '2612529353', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(11, 'Aranega ', 'Melanie ', 'DNI', 45258269, '0', '0000-00-00', 'melaniearanega618@gmail.com', '2612732759', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(12, 'fernandez', 'Jesica belen', 'DNI', 39086791, '0', '0000-00-00', 'jesicabelenfernandez108@gmail.com', '261593513', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(13, 'Fernández', 'Leandro Francisco', 'DNI', 36753316, '0', '0000-00-00', 'fernandezleandrofrancisco@gmail.com', '2616830355', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(14, 'Sarale ', 'Gustavo Nicol?s ', 'DNI', 24996398, '0', '0000-00-00', 'saralegn@yahoo.com.ar ', '26160038', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(15, 'Albert', 'María Antonia ', 'DNI', 23350210, '0', '0000-00-00', 'jesicafernandez108@gmail.com', '261593513', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(16, 'Sánchez', 'Cristian David', 'DNI', 23712089, '0', '0000-00-00', 'cristiands@yahoo.com', '2615790565', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(17, 'jatib', 'leila lorena', 'DNI', 38306838, '0', '0000-00-00', 'yurizone3000@gmail.com', '2615029283', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(18, 'Vallecillo ', 'Daniela ', 'DNI', 36582077, '0', '0000-00-00', 'danielabelenvallecillo@gmail.com', '2616715955', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(19, 'Alvarez', 'Mar?a Soledad', 'DNI', 31432246, '0', '0000-00-00', 'soledadalvarez84@gmail.com', '2616396309', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(20, 'Olmedo', 'Silvina gabriela', 'DNI', 29648304, '0', '0000-00-00', 'silvinaolmedo89@gmail.com', '156120723', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(21, 'Rodríguez Di Leo', 'Morena Anastasia ', 'DNI', 46547090, '0', '0000-00-00', 'rodriguezanastasia37@gmail.com', '2616683766', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(22, 'Alonso', 'Mariela Susana ', 'DNI', 26922880, '0', '0000-00-00', 'marielalonsoelregreso@gmail.com', '2616979480', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(23, 'Ozan Luna', 'Candela Nicol ', 'DNI', 47154592, '0', '0000-00-00', 'candelanicolluna00@gmail.com', '2615040802', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(24, 'Oviedo', 'Oriana Nahir', 'DNI', 45720354, '0', '0000-00-00', 'oviedooriana260@gmail.com', '2615603587', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(25, 'Romero', 'Marina Luján ', 'DNI', 34696957, '0', '0000-00-00', 'alemari3525@gmail.com', '2615136729', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(26, 'Recio ', 'Katherina Denis', 'DNI', 39843453, '0', '0000-00-00', 'krecio2017.ni@gmail.com', '2616749727', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(27, 'Carabajal', 'Jessica Johanna', 'DNI', 34786155, '0', '0000-00-00', 'jessmic.jc@gmail.com', '2616707579', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(28, 'Lorente ', 'Micaela Abigail ', 'DNI', 42469355, '0', '0000-00-00', 'lorenteabi@gmail.com', '2612174003', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(29, 'Quiroga', 'Alicia', 'DNI', 36913464, '0', '0000-00-00', 'aliciaquiroga1p2013@gmail.com', '2634782253', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(30, 'Silva', 'Andrea Alejandra', 'DNI', 24461823, '0', '0000-00-00', 'andreaalejandrasilva39@gmail.com', '2614691067', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(31, 'Gonzalez', 'Lisi', 'DNI', 35545917, '0', '0000-00-00', 'luisemily260518@gmail.com', '2616908150', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(32, 'Gomez', 'Viviana Micaela ', 'DNI', 44538567, '0', '0000-00-00', 'gomezmicaela209@gmail.com', '2634557873', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(33, 'Pavon', 'Cecilia ', 'DNI', 34786188, '0', '0000-00-00', 'Ceciliarjpavon@gmail.com', '2616791530', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(34, 'MAYORGA', 'CECILIA', 'DNI', 27984538, '0', '0000-00-00', 'mcecilia.30@gmail.com', '2616413689', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(35, 'Ortubia ', 'Florencia Antonela ', 'DNI', 44757774, '0', '0000-00-00', 'Florenciaortubia6@gmail.com ', '2613663733', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(36, 'Gonzalez', 'Edgardo Adrián', 'DNI', 36581977, '0', '0000-00-00', 'adriangonza3101@gmail.com', '2617772301', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(37, 'Zarate Pisarro', 'Lourdes Anabella ', 'DNI', 45360913, '0', '0000-00-00', 'anabellazarate02@gmail.com ', '2615925972', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(38, 'Pablo', 'Stella Maris ', 'DNI', 34068823, '0', '0000-00-00', 'prof.stellamarispablo@gmail.com', '2615167022', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(39, 'Arias', 'Celia Viviana ', 'DNI', 20563047, '0', '0000-00-00', 'viviana15arias@yahoo.com.ar', '2616507783', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(40, 'Barrientos Soliz', 'Franco Javier ', 'DNI', 38912016, '0', '0000-00-00', 'franco9562@gmail.com', '2616073447', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(41, 'Gadea', 'Verónica Noemí', '', 0, '0', '0000-00-00', '2615023260', '0', '2', 3, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(42, 'Palacios ', 'Romina Natacha ', 'DNI', 32667033, '0', '0000-00-00', 'romicudeiro@gmail.com', '2615978272', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(43, 'G?MEZ', 'MARIA EUGENIA ', 'DNI', 30546473, '0', '0000-00-00', 'eugegom33@gmail.com', '2615103584', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(44, 'Anconetani', 'Graciela Sonia ', 'DNI', 24085319, '0', '0000-00-00', 'ganconetani@mendoza.edu.ar', '2616299666', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(45, 'Segura Rigo', 'Gastón Alejandro ', 'DNI', 40371918, '0', '0000-00-00', 'gastonrigo0708@gmail.com', '2615563348', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(46, 'Figueroa', 'Ana Macarena', 'DNI', 41728207, '0', '0000-00-00', 'obredorana313@gmail.com', '2615009910', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(47, 'Donadel ', 'María Cecilia ', 'DNI', 24705286, '0', '0000-00-00', 'mariaceciliadonadel@yahoo.com.ar', '2634666030', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(48, 'Sanchez', 'Ruth', 'DNI', 42357638, '0', '0000-00-00', 'ruthanabelsanchez99@gmail.com', '2616811781', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(49, 'Leguiza', 'Vanesa ', 'DNI', 39234624, '0', '0000-00-00', 'vaneluzleguiza@gmal.com', '2616932857', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(50, 'Cáceres ', 'Antonella ', 'DNI', 40690058, '0', '0000-00-00', 'georginacaceres25@gmail.com ', '2612307761', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(51, 'Montenegro ', 'Teresita ', 'DNI', 30773509, '0', '0000-00-00', 'Teremontenegro1984@gmail.com', '2612142288', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(52, 'Herrera Gonz?lez ', 'Alejandra ', 'DNI', 26298091, '0', '0000-00-00', 'alehhp@gmail.com', '2616991080', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(53, 'Araya', 'Gabriela ', 'DNI', 39239243, '0', '0000-00-00', 'gabiaraya005@gmail.com', '2616944575', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(54, 'Olarte', 'Mirta Carina ', 'DNI', 24423438, '0', '0000-00-00', 'carina.olarte.cn@gmail.com', '2616043790', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(55, 'Alvarado', 'Janet', 'DNI', 43829842, '0', '0000-00-00', 'alvaradojanet503@gmail.com', '2634724699', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(56, 'Zagaglia', 'D?borah Beatriz', 'DNI', 32510730, '0', '0000-00-00', 'deborahbzagaglia@gmail.com', '2613024781', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(57, 'Dávila', 'Julieta', 'DNI', 39017265, '0', '0000-00-00', 'julieta.davilanogara@gmail.com', '2614170867', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(58, 'NAVARRA', 'Darío ', 'DNI', 20115250, '0', '0000-00-00', 'darionavarra@yahoo.com', '2616721868', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(59, 'Jofr? ', 'Camila', 'DNI', 47079835, '0', '0000-00-00', 'jofrecamila152@gmail.com', '2615048370', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(60, 'Janco', 'Marina Alejandra', 'DNI', 46237496, '0', '0000-00-00', 'jancomarina8@gmail.com', '2612732245', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(61, 'SILIPRANDI', 'VANESA', 'DNI', 30179207, '0', '0000-00-00', 'vanesasiliprandi@gmail.com', '2613424204', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(62, 'Pont', 'Guadalupe ', 'DNI', 37779562, '0', '0000-00-00', 'pontguadalupe17@gmail.com', '2613868178', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(63, 'Alonso', 'Andrea', 'DNI', 28340011, '0', '0000-00-00', 'andreaalonsocarboni@gmail.com', '2616575269', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(64, 'Pastran', 'Rocio', 'DNI', 44878520, '0', '0000-00-00', 'ropastran3@gmail.com', '2612704235', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(65, 'Cairo ', 'Flavia Pamela ', 'DNI', 22603543, '0', '0000-00-00', 'viamelacai@gmail.com', '2634734915', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(66, 'Martinez', 'Julián Omar', 'DNI', 42072882, '0', '0000-00-00', 'pitymartinez513@gmail.com', '2612338270', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(67, 'Paredes', 'Luciana ', 'DNI', 46062576, '0', '0000-00-00', 'paredesluciana10@gmail.com', '2612729112', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(68, 'Larpin', 'Andrés Carlos', 'DNI', 23901247, '0', '0000-00-00', 'andrescarloslarpin@gmail.com', '2612766449', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(69, 'Mendoza Ayarachi ', 'Maria Ester ', 'DNI', 33967781, '0', '0000-00-00', 'maryamdz88@gmail.com', '2616708638', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(70, 'Capponetto', 'Milagros Celeste ', 'DNI', 43119679, '0', '0000-00-00', 'milagroscelestecapponetto@gmail.com', '2612525736', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(71, 'Llugany L?pez ', 'Heidi Melanie ', 'DNI', 37412626, '0', '0000-00-00', 'melanie.llugany.1717@gmail.com', '2612629421', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(72, 'Falcón', 'Carina', 'DNI', 0, '0', '0000-00-00', '2613361488', '0', '2', 3, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(73, 'Savariego ', 'Vanesa ', 'DNI', 27984729, '0', '0000-00-00', 'sabariegovanesa@gmail.com', '2614850774', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(74, 'Cruz', 'Carla', 'DNI', 35091191, '0', '0000-00-00', 'soficruz2020@gmail.com', '2516807888', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(75, 'Faunder ', 'Micaela Ayelén ', 'DNI', 41191875, '0', '0000-00-00', 'faundermicaela@gmail.com', '2615956901', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(76, 'Suvia Hinojosa ', 'Natalí Haydeé ', 'DNI', 46474718, '0', '0000-00-00', 'natalisuvia258@gmail.com', '2612371146', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(77, 'Carro', 'Ana Carolina', 'DNI', 23339357, '0', '0000-00-00', 'caritocarro@gmail.com', '2616184720', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(78, 'Villalba ', 'Clara Milagros ', 'DNI', 42751301, '0', '0000-00-00', 'villalbamilagros301@gmail.com', '2615753592', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(79, 'Cardozo ', 'Juli?n ', 'DNI', 43684198, '0', '0000-00-00', 'julianbleachjesus@gmail.com', '2613034589', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(80, 'Vera', 'Adriana', 'DNI', 28797253, '0', '0000-00-00', 'adrianavera278@gmail.com', '2616814219', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(81, 'Videla ', 'Mayra Malena ', 'DNI', 44123558, '0', '0000-00-00', 'orosmayra558@gmail.com', '2612730034', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(82, 'Reynoso ', 'Evelyn ', 'DNI', 44904026, '0', '0000-00-00', 'evelynmilagrosreynoso141@gmail.com', '2616453229', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(83, 'Carbone', 'Eugenia ', 'DNI', 43215119, '0', '0000-00-00', 'eugeniacarbone05@gmail.com', '2616802604', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(84, 'Recio', 'Karen Denise', 'DNI', 37270332, '0', '0000-00-00', 'karenrecio.bedelia@gmail.com', '2616749721', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(85, 'Motos', 'Nahuel ', 'DNI', 44820627, '0', '0000-00-00', 'nahuelaxelmotosromera@gmail.com', '2616317187', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(86, 'Saavedra PUPPATO ', 'Romina ', 'DNI', 32433838, '0', '0000-00-00', 'rogisecar2016@gmail.com', '2634356928', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(87, 'Cespedes', 'Milagros', 'DNI', 47373224, '0', '0000-00-00', 'Mili10cch@gmail.com ', '2616008093', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(88, 'Guirado', 'Gonzalo', 'DNI', 43545561, '0', '0000-00-00', 'gonzalogui104@gmail.com', '2615530049', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(89, 'Garay', 'Ester Elizabeth ', 'DNI', 31737637, '0', '0000-00-00', 'egaray008@gmail.com', '2615604552', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(90, 'Brizuela', 'Marcia Alejandra ', 'DNI', 22783378, '0', '0000-00-00', 'brizuelamarciaalejandra@gmail.com', '2615328350', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(91, 'Avila Gimenez', 'Candela Magali', 'DNI', 44747427, '0', '0000-00-00', 'candela.avila@gmail.com', '2613334949', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(92, 'Vercesi', 'Lorena  Ivana', 'DNI', 28406723, '0', '0000-00-00', 'lorena_vercesi@yahoo.com.ar', '2615879101', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(93, 'Camaño', 'Caren', 'DNI', 0, '0', '0000-00-00', '2616962468', '0', '2', 3, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(94, 'Gonzalez', 'Maira Josefa ', 'DNI', 39383249, '0', '0000-00-00', 'gonzalezmaira317@gmail.com', '2612055188', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(95, 'Camaño', 'Melisa Gisela', 'DNI', 0, '0', '0000-00-00', '3412768672', '0', '2', 3, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(96, 'Palma', 'Julieta ', 'DNI', 46399543, '0', '0000-00-00', 'palmaaa979@gmail.com', '261', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(97, 'Quispe', 'Lautaro', 'DNI', 47373333, '0', '0000-00-00', 'quispefausto2006@gmail.com', '2612650830', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(98, 'TORREZ', 'Jose', 'DNI', 95149227, '0', '0000-00-00', 'jmtm.29.12@gmail.com', '2616662174', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(99, 'Silva Rivera ', 'Nicol Shirley ', 'DNI', 44437985, '0', '0000-00-00', 'silvanicol48@gmail.com', '2616216860', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(100, 'Loyola', 'Anabel', 'DNI', 45144818, '0', '0000-00-00', 'loyolaanabel21@gmail.com', '2634719152', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(101, 'Moyano ', 'Débora Angélica ', 'DNI', 28838201, '0', '0000-00-00', 'debomoya35@gmail.com', '2616220421', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(102, 'Ojeda', 'Adrián Alejandro', 'DNI', 34194858, '0', '0000-00-00', 'adrianalejandroojeda21@gmail.com', '2617000385', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(103, 'Ortega', 'Maria Sol', 'DNI', 37085800, '0', '0000-00-00', 'Sortegani2018@gmail.com', '2613037110', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(104, 'Oliva Leveque ', 'Julieta Valentina ', 'DNI', 45361032, '0', '0000-00-00', 'nailsmoon17@gmail.com', '2616996002', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(105, 'NAVARRA', 'EVA BEATRIZ', 'DNI', 25101191, '0', '0000-00-00', 'navarrabeatriz@gmail.com', '2616968209', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(106, 'G?MEZ', 'MARIA EUGENIA ', 'DNI', 30546473, '0', '0000-00-00', 'eugegom33@gmail.com', '2615103584', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(107, 'Alonso', 'Gabriela Leonor', 'DNI', 29333981, '0', '0000-00-00', 'gabialonso82@yahoo.com.ar', '2616961217', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(108, 'Cabrera ', 'Gaston Emmanuel', 'DNI', 46235600, '0', '0000-00-00', 'cgastoncabrera2021@gmail.com', '2612639753', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(109, 'Fernandez ', 'Brenda', 'DNI', 44904057, '0', '0000-00-00', 'fernandezbren39@gmail.com', '2615868834', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(110, 'Barrera ', 'Candela ', 'DNI', 47193593, '0', '0000-00-00', 'candelabarrera068@gmail.com', '2617119598', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(111, 'Fuerte', 'Johana', 'DNI', 35507201, '0', '0000-00-00', 'johannafuerte90@gmail.com', '2616372611', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(112, 'Bustos', 'Andrea', 'DNI', 40371910, '0', '0000-00-00', 'bustosandrea73@gmail.com', '261339963', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(113, 'Cuello', 'Julieta', 'DNI', 45875608, '0', '0000-00-00', 'Abriljulieta006@gmail.com', '2634223753', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(114, 'Cataldo ', 'Brian Isaac ', 'DNI', 42478460, '0', '0000-00-00', 'briansitocataldo@gmail.com', '2616242740', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(115, 'Perez ', 'Brisa Michelle ', 'DNI', 43749615, '0', '0000-00-00', 'brisamichelleperez815@gmail.com', '2616434802', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(116, 'Caña', 'María Fernanda ', 'DNI', 0, '0', '0000-00-00', '2612302852', '0', '2', 3, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(117, 'Tapia', 'María Eugenia', 'DNI', 39088570, '0', '0000-00-00', 'Eugeniatapia2018@gmail.com', '2612628520', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(118, 'Traslaviña ', 'Mariela Elizabeth ', 'DNI', 23339324, '0', '0000-00-00', 'mtraslavia23@gmail.com', '2617050764', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(119, 'Reyes ', 'Daiana ', 'DNI', 44756983, '0', '0000-00-00', 'daianareyes3322@gmail.com', '2613902878', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(120, 'Flores', 'Brenda Rocio', 'DNI', 42169003, '0', '0000-00-00', 'brendarociof5@gmail.com', '2616232583', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(121, 'Garay', 'Angel David', 'DNI', 38580982, '0', '0000-00-00', 'angelgaray59@gmail.com', '261632378', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(122, 'Cortez', 'Débora ', 'DNI', 46476232, '0', '0000-00-00', 'cortezmagdalena342@gmail.com', '2617014139', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(123, 'Garcia', 'Shirley Laura Mariana', 'DNI', 30889723, '0', '0000-00-00', 'shirleylaura45@gmail.com', '2616152551', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(124, 'Quipildor', 'Mar?a Elena', 'DNI', 29588584, '0', '0000-00-00', 'melequipi@gmail.com', '2613469885', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(125, 'Paredes', 'Jimena ', 'DNI', 43829832, '0', '0000-00-00', 'agusparedes321@gmail.com', '2613909013', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(126, 'Cisterna', 'Nerina', 'DNI', 46620816, '0', '0000-00-00', 'silvana.511.1193@gmail.com', '2617145933', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(127, 'Dominichi', 'Maria Eugenia ', 'DNI', 20488531, '0', '0000-00-00', 'eugeniadominichi@gmail.com', '2613352203', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(128, 'Genaulaz ', 'Cecilia ', 'DNI', 29944627, '0', '0000-00-00', 'ceciliagenaulaz@gmail.com', '2615341655', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(129, 'Echegaray', 'Vanesa Soledad', 'DNI', 34726939, '0', '0000-00-00', 'soledadechegarayabarzua@gmail.com', '2616934884', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(130, 'Torrent Fernandez', 'Tania Abril', 'DNI', 46164160, '0', '0000-00-00', 'torrenttania04@gmail.com', '2612633696', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(131, 'Montenegro ', 'Keila Carina', 'DNI', 43416682, '0', '0000-00-00', 'Keilamontenegro76@gmail.com', '2616697253', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(132, 'Escalona', 'María Cecilia', 'DNI', 30108610, '0', '0000-00-00', 'mescalona175@gmail.com', '2616816502', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(133, 'Jimenez', 'Janet Marianela', 'DNI', 39381940, '0', '0000-00-00', 'Jannijimenez13@gmail.com', '2612402016', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(134, 'Porra', 'Priscila ', 'DNI', 47373203, '0', '0000-00-00', 'priscilaporra7@gmail.com', '2612315880', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(135, 'Flores', 'Nerea', 'DNI', 39081175, '0', '0000-00-00', 'nereaflores244@gmail.com', '2615038356', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(136, 'Castro', 'Rosa Natali ', 'DNI', 33274951, '0', '0000-00-00', 'ashleyrosarodriguez@gmail.com', '2612175853', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(137, 'Aguilera', 'Yésica ', 'DNI', 32116916, '0', '0000-00-00', 'aguilerayesica@gmail.com', '2615715614', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(138, 'Olivares ', 'Walter ', 'DNI', 28844514, '0', '0000-00-00', 'walterolivareshys@gmail.com', '2616881617', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(139, 'Abadie', 'NICOLAS', 'DNI', 26643517, '0', '0000-00-00', 'abadie_nd@yahoo.com.ar', '2612544565', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(140, 'SARMIENTO', 'SANTIAGO TOMÁS', 'DNI', 28689415, '0', '0000-00-00', 'SANTIAGOTOMASSARMIENTO222@GMAIL.COM022', '2617082586', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(141, 'Sosa', 'Vanesa Paola ', 'DNI', 28809073, '0', '0000-00-00', 'sosavane08@yahoo.com.ar', '2622551664', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(142, 'Brugo', 'Josefina', 'DNI', 34800744, '0', '0000-00-00', 'josebrugo@gmail.com', '115311606', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(143, 'Ramos', 'Alejandra Jennifer', 'DNI', 39383220, '0', '0000-00-00', 'rjenny626@gmail.com', '2616223311', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(144, 'Ten', 'Melina Soledad', 'DNI', 38306787, '0', '0000-00-00', 'meliten.94@gmail.com', '2612479198', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(145, 'Pi?a diaz ', 'Iris aldana ', 'DNI', 39081280, '0', '0000-00-00', 'aldanadiaz819@gmail.com', '2617673559', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(146, 'G?mez Vergara', 'Mar?a Gracia', 'DNI', 25291175, '0', '0000-00-00', 'mgraciagomezv@gmail.com', '2613462899', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(147, 'de Cara', 'Mariana', 'DNI', 28341274, '0', '0000-00-00', 'marianadecara@gmail.com', '2616636091', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(148, 'Lemos', 'Tania', 'DNI', 45965350, '0', '0000-00-00', 'tanialemos527@gmail.com ', '2615938307', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(149, 'Manzano', 'Bricia', 'DNI', 41863232, '0', '0000-00-00', 'manzanobricia33@gmail.com', '2612091858', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(150, 'Lenes Avendaño ', '?lida ', 'DNI', 41794291, '0', '0000-00-00', 'elidalenes1p2013@gmail.com', '2613605031', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(151, 'Alla', 'Gustavo', 'DNI', 18297838, '0', '0000-00-00', 'allgus02@gmail.com', '2613058503', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(152, 'Atienza', 'Melina', 'DNI', 36279271, '0', '0000-00-00', 'mechy_01191@hotmail.com.ar', '2615448539', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(153, 'Rodríguez ', 'Romina Andrea ', 'DNI', 32122869, '0', '0000-00-00', 'rominarodriguez.tics.2015@gmail.com', '2617097761', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(154, 'Fernandez', 'Daiana Desireé', '', 0, '0', '0000-00-00', '2615759370', '0', '2', 3, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(155, 'De la vega', 'Paula', 'DNI', 34191645, '0', '0000-00-00', 'dlvegap.87@gmail.com', '2613330122', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(156, 'Ramos', 'Alejandra Jennifer', 'DNI', 39383220, '0', '0000-00-00', 'rjenny626@gmail.com', '2616223311', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(157, 'Vonkunoschy', 'Enzo Adrian', 'DNI', 20112421, '0', '0000-00-00', 'enzovonkunoschy@gmail.com', '2612443928', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(158, 'ARAMAYO', 'Karen Michelle', 'DNI', 41338984, '0', '0000-00-00', 'karenestudios0@gmail.com', '2617744704', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(159, 'Ter?n', 'Sergio Esteban', 'DNI', 25356869, '', '', 'sergio.teran1@gmail.com', '2615182938', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(160, 'Cejas', 'Celeste ', 'DNI', 40907040, '0', '0000-00-00', 'Celecejasloria98@gmail.com', '2612122768', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(161, 'Carrizo Narváez ', 'Nicol Abril Guadalupe ', 'DNI', 46163322, '0', '0000-00-00', 'ncarrizo971@gmail.com', '2612391444', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(162, 'Herrera Vasquez', 'Melina Nahir ', 'DNI', 41869370, '0', '0000-00-00', 'mherrera2023.ni@gmail.com', '2616917807', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(163, 'Romera', 'Analía', 'DNI', 30920621, '0', '0000-00-00', 'analiaromera.mza@gmail.com', '2078522', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(164, 'Lia', 'Yamina Elizabeth ', 'DNI', 39019323, '0', '0000-00-00', 'yaminalia.jerez@gmail.com', '2634779188', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(165, 'Uano', 'Maria Elina', 'DNI', 26462556, '0', '0000-00-00', 'maryelina@yahoo.com.ar', '2634537994', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(166, 'Maurino ', 'Agustina ', 'DNI', 44986372, '0', '0000-00-00', 'Agusmaurino0@gmail.com ', '2615189043', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(167, 'Guzmán ', 'Rocío Victoria ', 'DNI', 42403374, '0', '0000-00-00', 'rguzmanni2018@gmail.com', '2613892915', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(168, 'Verna', 'Bárbara ', 'DNI', 40561281, '0', '0000-00-00', 'babiverna22@gmail.com', '2615013608', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(169, 'Guzm?n ', 'Micaela Fernanda ', 'DNI', 43485655, '0', '0000-00-00', 'mguzman.2019.p@gmail.com', '2616677352', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(170, 'lupo', 'lucas daniel', 'DNI', 32510897, '0', '0000-00-00', 'lucas_luppo87@hotmail.com', '2616545237', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(171, 'Spigarolo', 'Leandro Gabriel', 'DNI', 33392199, '0', '0000-00-00', 'leandro.spigarolo@gmail.com', '2613380866', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(172, 'Aguero', 'Milagros ', 'DNI', 46162754, '0', '0000-00-00', 'milagrosgiselaguero@gmail.com', '2617217584', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(173, 'Torres', 'Juan Marcelo ', 'DNI', 46062554, '0', '0000-00-00', 'torresjuan509@gmail.com', '2612389477', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(174, 'Sullca', 'Rocío Ana ', 'DNI', 42167547, '0', '0000-00-00', 'rocioanasullca@gmail.com', '2617023584', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(175, 'Perez ', 'Martina Agustina ', 'DNI', 45967030, '0', '0000-00-00', 'perezmartina509@gmail.com', '2617544606', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(176, 'NAVARRA ', 'María Concepción Virginia ', 'DNI', 17799813, '0', '0000-00-00', 'mariavirginianavarra@yahoo.com.ar', '2616479604', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(177, 'Diaz Gonzalez ', 'Melina isabel ', 'DNI', 43119729, '0', '0000-00-00', 'diazgonzalezmelinaisabel@gmail.com', '2616883903', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(178, 'Romera', 'Analía', 'DNI', 30920621, '0', '0000-00-00', 'analiaromera.mza@gmail.com', '2078522', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(179, 'Menconi', 'Ana', 'DNI', 23339348, '0', '0000-00-00', 'anamenconi@gmail.com', '2616721874', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(180, 'Asevedo ', 'Brisa Alejandra ', 'DNI', 44904078, '0', '0000-00-00', 'brisaarmy104@gmail.com', '2616502087', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(181, 'Banno', 'Rubén Antonio ', 'DNI', 34063091, '0', '0000-00-00', 'banex_22@hotmail.com', '2615401723', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(182, 'Benenati', 'Analía', 'DNI', 23709896, '0', '0000-00-00', 'analia.benenati@gmail.com', '2615915141', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(183, 'Paura', 'Andrea del Carmen', 'DNI', 22941772, '0', '0000-00-00', 'andreapaura03@gmail.com', '2615332871', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(184, 'Molina', ' Romina Eliana ', 'DNI', 36582018, '0', '0000-00-00', 'rominamolina234@gmail.com', '2613748945', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(185, 'Albertti ', 'Ricardo Martin ', 'DNI', 44756917, '0', '0000-00-00', 'martin.albertti.2003@gmail.com', '2616045543', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(186, 'Alvornoz ', 'Brenda ', 'DNI', 42749734, '0', '0000-00-00', 'alvornozbrenda86@gmail.com', '2616065695', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(187, 'Paura', 'Andrea del  Carmen', 'DNI', 22941772, '0', '0000-00-00', 'andreapaura03@gmail.com', '2515332871', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(188, 'Gonzalez ', 'Lorena', 'DNI', 44058304, '0', '0000-00-00', 'lorenagonzalez99114@gmail.com', '2617160719', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(189, 'PAURA', 'ANDREA DEL CARMEN', 'DNI', 22941772, '0', '0000-00-00', 'andreapaura03@gmail.com', '2615332871', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(190, 'Paurs', 'Andrea', 'DNI', 22941772, '0', '0000-00-00', 'andreapaura03@gmail.com', '2615332871', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(191, 'Guzmán ', 'Rocío Victoria ', 'DNI', 42403274, '0', '0000-00-00', 'rguzmanni2018@gmail.com', '2613892915', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(192, 'Paura', 'Andrea', 'DNI', 22941772, '0', '0000-00-00', 'andreapaura03@gmail.com', '2615332871', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(193, 'Asevedo ', 'Brisa Alejandra ', 'DNI', 44904078, '0', '0000-00-00', 'brisaarmy104@gmail.com', '2616502087', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(194, 'Villafañe', 'María', 'DNI', 0, '0', '0000-00-00', '2616672565', '0', '2', 3, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(195, 'Oviedo ', 'Laura Ayelén ', 'DNI', 42669490, '0', '0000-00-00', 'ayeeoviiedo19@Gmail.com', '2612658583', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(196, 'Estudillo', 'Laura Gisel', 'DNI', 31902512, '0', '0000-00-00', 'laurinchy86@gmail.com', '2615', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(197, 'Natel', 'Thiago israel', 'DNI', 46869240, '0', '0000-00-00', 'Natelthiago6@gmail.com', '2613028826', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(198, 'Cayo', 'Noemi Sabrina ', 'DNI', 42169189, '0', '0000-00-00', 'sabrinacayo62@gmail.com', '2613826981', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(199, 'Romera', 'Analía', 'DNI', 30920621, '0', '0000-00-00', 'analiaromera.mza@gmail.com', '2078522', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(200, 'Mendoza ', 'Jannetteh ', 'DNI', 93097426, '0', '0000-00-00', 'jm2022mdz@gmail.com', '2616356363', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(201, 'Gillio ', 'José Mariano ', 'DNI', 27612078, '0', '0000-00-00', 'marianogillio09@gmail.com', '2616536768', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(202, 'Appugliese ', 'Josefina del. Rosario ', 'DNI', 27505729, '0', '0000-00-00', 'josefinappugliese@gmail.com', '2615468694', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(203, 'Cáceres', 'Ángela', 'DNI', 23043655, '0', '0000-00-00', 'caceresacevedo750@gmail.com', '2614181743', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(204, 'Lucero ', 'Jorge ', 'DNI', 34356684, '0', '0000-00-00', 'jorge.mlucero@gmail.com', '2616573425', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(205, 'Castro', 'Pamela', 'DNI', 31714995, '0', '0000-00-00', 'pamelacastro995@gmail.com', '2616157902', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(206, 'Fusco', 'Daniela', 'DNI', 24964778, '0', '0000-00-00', 'dfusconones@gmail.com', '2613240015', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(207, 'BENEGAS ', 'NEFTALí', 'DNI', 29333964, '0', '0000-00-00', 'neftalibenegas@gmail.com', '2614676894', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(208, 'Curioni', 'Francisco', 'DNI', 26339811, '0', '0000-00-00', 'franciscocurioni@gmail.com', '2615169309', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(209, 'RAMIRO MARTIN', 'MERCADO', 'DNI', 45448796, '0', '0000-00-00', 'rodrimercadomartin@gmail.com', '2616182922', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(210, 'Masman', 'Adriana Cintia', 'DNI', 25881563, '0', '0000-00-00', 'masmanadriana82@gmail.com', '2634568390', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(211, 'Masman', 'Adriana Cintia', 'DNI', 25881563, '0', '0000-00-00', 'pminambremasman@gmail.com', '2634568390', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(212, 'AMAYA', 'IVANA GISEL', 'DNI', 39087389, '0', '0000-00-00', 'ivigisel95@gmail.com', '2616662009', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(213, 'Ferreyra', 'Carla', 'DNI', 37001683, '0', '0000-00-00', 'carlajulietaferreyra@gmail.com', '2614707293', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(214, 'Cabrera', 'Irina', 'DNI', 37622988, '0', '0000-00-00', 'cabrerairinaveronica@gmail.com', '2612150756', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(215, 'Colque', 'Hernan', 'DNI', 41863238, '0', '0000-00-00', 'hernancolque012@gmail.com', '2616351616', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(216, 'Córdoba Bordón', 'María José', 'DNI', 25938318, '0', '0000-00-00', '', '2', '3', 0, 0, '', '0000-00-00 00:00:00', '', 0, NULL, NULL),
(217, 'NAVARRA', 'MARIANA ANALIA', 'DNI', 27983068, '0', '0000-00-00', 'naninavarra@yahoo.com.ar', '2615263057', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(218, 'FORNARI', 'NOEMI ELIZABETH', 'DNI', 31636337, '0', '0000-00-00', 'fornarinoemi@gmail.com', '2612063175', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(219, 'Olarte ', 'Angelica Romina ', 'DNI', 32510725, '0', '0000-00-00', 'rosantiangel@gmail.com', '2616219548', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(220, 'Miguez', 'Laura', 'DNI', 25309049, '0', '0000-00-00', 'laurapostitulo2014@gmail.com', '2615742063', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(221, 'Siliprandi', 'Andrea Daniela', 'DNI', 24964762, '0', '0000-00-00', 'andreasiliprandi09@gmail.com', '2614679173', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(222, 'Carrió ', 'Ruth ', 'DNI', 20677936, '0', '0000-00-00', 'prof.ruth.escuela@gmail.com', '2613904729', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(223, 'Gonzales', 'Pablo', 'DNI', 27096496, '0', '0000-00-00', 'pablovet_79@yahoo.com.ar', '2614169960', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(224, 'Rodriguez ', 'Romina ', 'DNI', 32122869, '0', '0000-00-00', 'rominarodriguez.tics.2015@gmail.com', '261', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(225, 'Narvaez ', 'Cecilia Verónica ', 'DNI', 26828803, '0', '0000-00-00', 'ceciliaveronicanarvaez@gmail.com', '2615430034', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(226, 'Sidoti', 'María Antonella', 'DNI', 36653154, '0', '0000-00-00', 'mariantonella.sidoti@gmail.com', '2616693766', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(227, 'Navarra Preziosa ', 'Maria Guadalupe', 'DNI', 42793563, '0', '0000-00-00', 'maria.preziosa2020@gmail.com', '2612430549', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(228, 'Spontón ', 'Daniela Loreley ', 'DNI', 41403304, '0', '0000-00-00', 'spontondaniela@gmail.com', '3482253831', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(229, 'Bergas', 'Mauricio Esteban ', 'DNI', 35908638, '0', '0000-00-00', 'meb140491@gmail.com', '2613463009', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(230, 'Traslaviña;Camila Nicol ', 'Camila Nicol ', 'DNI', 0, '0', '0000-00-00', '2612788232', '0', '2', 3, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(231, 'Cañizare', 'Abril', 'DNI', 42266907, '0', '0000-00-00', 'abrilczare@gmail.com', '2615668142', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(232, 'Simi Rosales', 'Luciana Abigail', 'DNI', 45720111, '0', '0000-00-00', 'simirosaleslucianaabigail@gmail.com', '2617019135', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(233, 'Simi Rosales', 'Luciana Abigail', 'DNI', 45720111, '', '', 'simirosaleslucianaabigail@gmail.com', '2617019135', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(234, 'Messi', 'Lionel', '', 32455788, '0', '0000-00-00', 'sergio.teran1@gmail.com', '2615182938', '', 2, 3, '', '0000-00-00 00:00:00', '', 4, '', 0),
(235, 'Abalo', ' Inal?n', 'DNI', 35936186, '', '', 'inarodleon@yahoo.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(236, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'Alessandra ', 'Carla', 'DNI', 38759298, NULL, NULL, 'alessandracarla950@gmail.com', '2616306275', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'PERÉZ', 'ÑÑDSAW', 'DNI', 12122122, '20253568691', '1976-12-30', 'sergio.teran1@gmail.com', '+542615182938', '546 calle 1', 2, 3, 'LUJAN DE CUYO', '2025-08-21 14:02:24', 'M', 5, 'Otro', 1),
(239, 'apellido', 'nombre', 'tipoDocume', 0, 'cuil', 'fechaNacimiento', 'correo', 'telefono', 'direccion', 0, 0, 'localidad', '0000-00-00 00:00:00', 'genero', 0, 'situacion', 0),
(240, 'Acosta Salom?n; Nicol?s Sebast?an', 'DNI', '45720395', 0, '', 'sr.acosta2004@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(241, 'Aguilera', ' Antonio', 'DNI', 42912554, '', '', 'enolo.aguilera2024@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(242, 'Aguilera', ' Gonzalo Federico', 'DNI', 43215109, '', '', 'goanzaloaguilera@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(243, 'Aguirre Villa', ' Daniela Roc?o', 'DNI', 46474897, '', '', 'hys.aguirredaniela@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(244, 'Aguirre', ' Joana Alejandra', 'DNI', 34463187, '', '', 'aguirrejoana89@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(245, 'Ag?ero Duperut', ' Natali Emilce', 'DNI', 47373288, '', '', 'agueroemi40@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(246, 'Ag?ero Zangrandi', ' Lourdes Guadalupe', 'DNI', 43354428, '', '', 'guadalupeaguero203@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(247, 'Ag?ero', ' Angeles', 'DNI', 44531243, '', '', 'angelesaguero200@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(248, 'Ag?ero', ' Emilce Gabriela', 'DNI', 57270615, '', '', 'gabrielaaguero009@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(249, 'Ag?ero', ' Federico Martin', 'DNI', 32178155, '', '', 'federicomaguero@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(250, 'Ag?ero', ' Selene Nicol', 'DNI', 45965371, '', '', 'selenenicolaa@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(251, 'Alaniz', ' Javier Andres', 'DNI', 44756904, '', '', 'javieroficialok@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(252, 'ALANIZ', ' MARIANELA LUCIA', 'DNI', 48968841, '', '', 'virginialaura090580@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(253, 'Albertti', ' Lucia Belen', 'DNI', 43417883, '', '', 'lucialbertti16@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(254, 'Albertti', ' Maria Victoria', 'DNI', 33578917, '', '', 'mariavictoriaalbertti@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(255, 'Albertti', ' Ricardo Martin', 'DNI', 44756917, '', '', 'martin.albertti.2003@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(256, 'Alcaraz', ' Mauro Ezequiel', 'DNI', 46869337, '', '', 'alcarazmauro67@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(257, 'Aldalla', ' Natasha Aldana', 'DNI', 39088869, '', '', 'analdalla1212@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(258, 'Alday', ' Ivana Aida', 'DNI', 44746152, '', '', 'ivaaidaalday14@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(259, 'Aldaya', ' Agust?n Alejandro', 'DNI', 45361034, '', '', 'aldaya4536@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(260, 'Aldaya', ' Lucia Lourdes', 'DNI', 45965276, '', '', 'luciaaldaya09@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(261, 'Alegre', ' Chiara Ayelen', 'DNI', 47269143, '', '', 'chiaraayelena@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(262, 'Alessandra', ' Carla Alicia', 'DNI', 38759298, '', '', 'alessandracarla950@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(263, 'Alessi', ' Martina', 'DNI', 43417871, '', '', 'martialessi6@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(264, 'Alga?araz Arezo', ' Mariano Andr?s', 'DNI', 28411200, '', '', 'marianoalganaraz9@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(265, 'ALGA?ARAZ', ' MAURO ALFREDO', 'DNI', 47373218, '', '', 'maro.cuenta001@outlook.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(266, 'Almaz?n Marquez', ' Anabela Rosal?;DNI', '46475105', 0, '', 'anabelacnco@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(267, 'Almuna Carrizo', ' Vera Lucia', 'DNI', 31902530, '', '', 'almunalucia@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(268, 'Alonso', ' Federico', 'DNI', 43681940, '', '', 'federicoam@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(269, 'ALVARADO', ' Lourdes Janet', 'DNI', 43829842, '', '', 'alvaradojanet503@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(270, 'Alvornoz', ' Brenda Ludmila', 'DNI', 42749734, '', '', 'alvornozbrenda86@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(271, 'Alvornoz', ' D?bora', 'DNI', 41885036, '', '', 'alvornozdebora3@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(272, 'Alvornoz', ' Laura Sthefania', 'DNI', 45361044, '', '', 'alvornozlaura2020@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(273, 'Amaya', ' Ivana Gisel', 'DNI', 39087389, '', '', 'ivigissel95@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(274, 'Amaya', ' Martin Gabriel', 'DNI', 45448756, '', '', 'martingamaya04@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(275, 'Anco', ' Lucas Delfin', 'DNI', 42478442, '', '', 'lucas.anco00@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(276, 'Angulo', ' Gonzalo Daniel', 'DNI', 46235537, '', '', 'gonzaloangulo18@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(277, 'Angulo', ' Jesus', 'DNI', 45023466, '', '', 'angulojesus1975@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(278, 'Antequera', ' Agustina Erica', 'DNI', 43117535, '', '', 'antequeraagustina@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(279, 'Antequera', ' Mar?a Jos?;DNI', '44820885', 0, '', 'mariantequera39@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(280, 'Antunez', ' Ailen Sthefania', 'DNI', 46235696, '', '', 'antunezailen118@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(281, 'ARAMAYO', ' Karen Michelle', 'DNI', 41338984, '', '', 'karenestudios0@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(282, 'Arancibia', ' Brisa Beatriz', 'DNI', 44538600, '', '', 'beatrizarancibia181@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(283, 'Arancibia', ' Ignacio Nahuel', 'DNI', 46161716, '', '', 'nahuelaran3@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(284, 'Aranega', ' Melanie', 'DNI', 45258269, '', '', 'melaniearanega618@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(285, 'Arangue', ' Analia', 'DNI', 36230557, '', '', 'arangueanalia76@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(286, 'Araujo Benegas', ' Daniela Carolina', 'DNI', 47371093, '', '', 'minigordanegrin@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(287, 'Araya', ' Carlos', 'DNI', 46163810, '', '', '48208111abuela@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(288, 'Araya', ' Gabriela Ivana', 'DNI', 39239243, '', '', 'gabiaraya005@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(289, 'Arcibia Lujan', ' Melanie Emilce', 'DNI', 44404710, '', '', 'melarcibia@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(290, 'Arcos', ' Eugenia Lorena', 'DNI', 40272072, '', '', 'eugeearcoss@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(291, 'ARIAS', ' ARIEL', 'DNI', 43828847, '', '', 'broly4679@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(292, 'Arias', ' Facundo', 'DNI', 45717240, '', '', 'facundoa534@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(293, 'Arias', ' Jehiel Leandro', 'DNI', 19095150, '', '', 'jehieljxl@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(294, 'Arnaez', ' Celeste', 'DNI', 50516159, '', '', 'celestearnaez3@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(295, 'Arrieta', ' Aitana', 'DNI', 46620532, '', '', 'aitanaarrieta08@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(296, 'Arroyo Narvaez', ' Paula Daniela', 'DNI', 43119168, '', '', 'arroyopd29@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(297, 'Arrula', ' Federico', 'DNI', 35560278, '', '', 'fede.arrula@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(298, 'Asevedo', ' Brisa', 'DNI', 44904078, '', '', 'brisaarmy104@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(299, 'Avalos', ' Samanta Priscila', 'DNI', 37001517, '', '', 'priscilaavalos082@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(300, 'Avenda?o Llanos', ' Paola', 'DNI', 94912184, '', '', 'avendanopaola2626@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(301, 'avenda?o; franco', 'DNI', '94912188', 0, '', 'avendanofranco657@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(302, 'Avila', ' Axel Jesus Miguel', 'DNI', 46397320, '', '', 'ja052641@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(303, 'Avila', ' Candela', 'DNI', 44747427, '', '', 'candela.avila@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(304, 'Avila', ' Macarena Yanira', 'DNI', 47531424, '', '', 'avilamacarena441@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(305, 'Baez', ' Yanina Antonela', 'DNI', 39081186, '', '', 'baezyanina58@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(306, 'Baigorria', ' Angela Yasmin', 'DNI', 45142257, '', '', 'yasminbaigorria18@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(307, 'Baigorria', ' Milena Alejandra', 'DNI', 45142258, '', '', 'milenabaigorria21@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(308, 'Balvoa', ' Carla Agostina', 'DNI', 42403389, '', '', 'balvoacarla@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(309, 'Barahona Tejada', ' Paulina', 'DNI', 45256202, '', '', 'pauliinab01@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(310, 'BARBOZA', ' Gabriel Alfredo', 'DNI', 46328689, '', '', 'gabrielbarboza21040512@outlook.es', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(311, 'Barrera Nievas', ' Martina Jazm?n', 'DNI', 47373379, '', '', 'martinabarrera617@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(312, 'Barrera', ' Candela', 'DNI', 47193593, '', '', 'candelabarrera068@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(313, 'barrera', ' joaquin', 'DNI', 45023517, '', '', 'barrerajoaquin24@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(314, 'Barrera', ' Mar?a Emilia', 'DNI', 38474695, '', '', 'marytabarrera2014@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(315, 'BARRIOS SARAVIA', ' LEONEL HERNAN', 'DNI', 45172858, '', '', 'barriosleo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(316, 'Barros', ' Adriana Ney?n', 'DNI', 46162399, '', '', 'neyenbarros46@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(317, 'Barroso Diaz', ' Brenda Agostina', 'DNI', 45716972, '', '', 'barroso.bren47@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(318, 'Bazan', ' Celeste', 'DNI', 40371946, '', '', 'bceleste023@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(319, 'Beamonte', ' Macarena', 'DNI', 37964942, '', '', 'beamontemaqui@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0);
INSERT INTO `persona` (`idpersona`, `apellido`, `nombre`, `tipoDocumento`, `numDocumento`, `cuil`, `fechaNacimiento`, `correo`, `telefono`, `direccion`, `pais_idpais`, `provincia_idprovincia`, `localidad`, `fechaAlta`, `genero`, `tipoPersona_idtipoPersona`, `situacion`, `habilitado`) VALUES
(320, 'Benitez', ' Leandro', 'DNI', 48332405, '', '', 'leo.benite.lb@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(321, 'Bergas', ' Mauricio Esteban', 'DNI', 35908638, '', '', 'meb140491@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(322, 'Bermejo', ' Isabella', 'DNI', 43279594, '', '', 'isabellabermejo33@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(323, 'Berti', ' Sandra', 'DNI', 20111554, '', '', 'bertisandra780@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(324, 'Bilardo', ' Aldana Silvina Lorenza', 'DNI', 38306807, '', '', 'bilardoaldana64@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(325, 'Blanco Guakinchay', ' Alam Uriel', 'DNI', 46235502, '', '', 'alamblanco18@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(326, 'Bonarrico', ' Emanuel Mario', 'DNI', 46934491, '', '', 'mariobonarrico@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(327, 'Bortolin Jofre', ' Selena Lis', 'DNI', 45256983, '', '', 'selenabortolin@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(328, 'Bueno', ' ?ngel', 'DNI', 45531296, '', '', 'angelbuenocarp@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(329, 'Bugue?o; Fabricio', 'DNI', '47372628', 0, '', 'gonzalezfabri79@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(330, 'BURGOS', ' Sabrina Chiara', 'DNI', 41364792, '', '', 'sabrinachiara.ok@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(331, 'BUSTOS ROJAS', ' Julieta Anahi', 'DNI', 38209025, '', '', 'bustosrojasjulietaanahi@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(332, 'Bustos', ' Ail?n Lihu?;DNI', '44904049', 0, '', 'ailin.lihue.2512@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(333, 'Bustos', ' Andrea', 'DNI', 40371910, '', '', 'bustosandrea73@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(334, 'Cabaez', ' Selene Nicole', 'DNI', 45965382, '', '', 'cabanezselene82@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(335, 'Caba?a; Sofia Julieta', 'DNI', '45258421', 0, '', 'sofi.cabana.03@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(336, 'Cabrera', ' Carina Magali', 'DNI', 45874386, '', '', 'magalicabrera092@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(337, 'Cabrera', ' Carolina', 'DNI', 42357891, '', '', 'cabreracaro409@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(338, 'Caceres', ' Daniel Francisco', 'DNI', 43943717, '', '', 'franciscocaceres2311@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(339, 'CALCINA GIRONI', ' FIDEL MARTIN', 'DNI', 48078624, '', '', 'calcinafidel2@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(340, 'Caldentey', ' Uriel', 'DNI', 46869283, '', '', 'urielcaldentey222@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(341, 'Calvo Riveros', ' Yasmin Oriana', 'DNI', 47967042, '', '', 'orianacalvo39@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(342, 'Cama?o; Caren', 'DNI', '31790775', 0, '', 'carencamano@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(343, 'Campos', ' Mar?a de los ?ngeles', 'DNI', 48751205, '', '', '48751205mc@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(344, 'Canales', ' Valentina', 'DNI', 48750522, '', '', 'canalesvalentina15@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(345, 'Canciani', ' Andres', 'DNI', 30676259, '', '', 'cadseal@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(346, 'Candido Alvarez', ' Facundo Agust?n', 'DNI', 43943121, '', '', 'facundocandido81@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(347, 'CANIZARE', ' EVELIN YESICA', 'DNI', 34607903, '', '', 'evelyncanizare@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(348, 'Cano Olivares', ' Brisa Ailin', 'DNI', 44538962, '', '', 'brisaailin.2018@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(349, 'Canselmo Oliva', ' Maximo Ariel', 'DNI', 47373261, '', '', 'maximocanselmo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(350, 'Capponetto', ' mariana Milena', 'DNI', 4737339, '', '', 'milenacapponettolenguaylit@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(351, 'Capponetto', ' Milagros Celeste', 'DNI', 43119679, '', '', 'capponettomilagroseduesp@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(352, 'Carbone', ' Eugenia', 'DNI', 43215119, '', '', 'eugeniacarbone05@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(353, 'Carbone', ' Rosa Antonella', 'DNI', 45965245, '', '', 'rosacarbone155@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(354, 'Carboni Castillo', ' Jerem?as Emanuel', 'DNI', 47079896, '', '', 'jeremiasemanuelcarboni.15@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(355, 'Cardozo', ' Juli?n Rosendo Jes?s', 'DNI', 43684198, '', '', 'julianbleachjesus@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(356, 'Carmona', ' Clara Agustina', 'DNI', 48543347, '', '', 'claritacarmona720@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(357, 'Carmona', ' Olga Del Carmen', 'DNI', 44985960, '', '', 'carmonaolga2003@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(358, 'Carrizo Narv?ez', ' Nicol Abril Guadalupe', 'DNI', 46163322, '', '', 'ncarrizo971@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(359, 'Carrizo', ' Erica Marcela', 'DNI', 35547368, '', '', 'carrizoerica848@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(360, 'Carrizo', ' Gianella Ailen', 'DNI', 45448265, '', '', 'agianellac2@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(361, 'Carrizo', ' Maciel Diego Jair', 'DNI', 42714670, '', '', 'macielcarrizo1@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(362, 'carrizo', ' maira', 'DNI', 47611064, '', '', 'mairazancanella@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(363, 'Casanova Perez', ' Juan Alberto', 'DNI', 42751172, '', '', 'javgg479@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(364, 'Casas Martinez', ' Mara Gianella', 'DNI', 46233614, '', '', 'maracasasmartinez1@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(365, 'Caseres', ' Aldana Sof?a', 'DNI', 39767907, '', '', 'aldiicaseres@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(366, 'Casta?eda', ' Brenda Micaela', 'DNI', 41702457, '', '', 'micaelabrenda1234@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(367, 'Castro Buenanueva', ' Alejo Hernan', 'DNI', 45965339, '', '', 'ac677777@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(368, 'Castro Videla', ' Mauro Eduardo', 'DNI', 46474729, '', '', 'maurocastrovidela11@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(369, 'Castro', ' Brenda Natali', 'DNI', 43683159, '', '', 'natalibrenda182@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(370, 'CASTRO', ' NATASHA', 'DNI', 44746936, '', '', 'natashacastrosm@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(371, 'Cataldo', ' Daiana Abigail', 'DNI', 42713312, '', '', 'cataldodaiana0@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(372, 'Catal?n', ' Alicia Lorena', 'DNI', 33438971, '', '', 'lorenaagostina30@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(373, 'Cayo', ' Noemi Sabrina', 'DNI', 42169189, '', '', 'sabrinacayo62@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(374, 'Ca?a Perez', ' Valentin Damian', 'DNI', 46869278, '', '', '404valem@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(375, 'Ca?a; Florencia Ail?n', 'DNI', '39383252', 0, '', 'florenciaailen010811@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(376, 'Ca?izare', ' Antonella Abril', 'DNI', 42266907, '', '', 'abrilczare@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(377, 'Cespedes', ' Milagros', 'DNI', 47373224, '', '', 'mili10cch@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(378, 'Chacon', ' Jes?s Leandro', 'DNI', 43151597, '', '', 'jesuucha1234@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(379, 'Chac?n Gonzales', ' Priscila Brisa', 'DNI', 46867022, '', '', 'lilianajocoli@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(380, 'Chambi', ' Sol', 'DNI', 44103386, '', '', 'solchambi44103@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(381, 'Chaves', ' Gabriela', 'DNI', 38474515, '', '', 'estefaniachaves.94@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(382, 'Chavez Ponce', ' Alexander Leonel', 'DNI', 46546212, '', '', 'chavezleo04@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(383, 'Chirino', ' Sof?a Agustina', 'DNI', 45965388, '', '', 'sofiachirinoesc@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(384, 'Chulve', ' Valentina Yael', 'DNI', 48049506, '', '', 'chulvevalentina@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(385, 'Cipollone', ' Lucas Alejo', 'DNI', 45966642, '', '', 'lucascipollone2@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(386, 'Cirolin', ' Laura', 'DNI', 27969387, '', '', 'lauracirolin@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(387, 'Claudia', ' Cabrera', 'DNI', 45720304, '', '', 'beluclaudiacabrera@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(388, 'Colque', ' Hernan', 'DNI', 41863238, '', '', 'hernancolque012@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(389, 'Comparin', ' Yamila Ayelen', 'DNI', 45721921, '', '', 'yamiladiaz2129@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(390, 'Contrera', ' Dalma Rocio', 'DNI', 40788037, '', '', 'dalmacontrera.job@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(391, 'Contreras', ' Ezequiel', 'DNI', 44406385, '', '', 'ezequiel.contreras.mza@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(392, 'Coronel Martinez ', ' Santiago Ezequiel', 'DNI', 47726683, '', '', 'santycorocoronel20@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(393, 'Correa', ' Magali Antonella', 'DNI', 46474786, '', '', 'antonellacorrea999@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(394, 'Cortez Leyes', ' Gonzalo Wenceslao', 'DNI', 46327199, '', '', 'gonzacortez057@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(395, 'Cortez Pannochia', ' Angeles Lourdes', 'DNI', 44987434, '', '', 'leandangeles@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(396, 'Cortez', ' Debora Mar?a Magdalena', 'DNI', 46476232, '', '', 'cortezmagdalena342@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(397, 'CORTEZ', ' ENZO OMAR GABRIEL', 'DNI', 43213572, '', '', 'enzocortez2000@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(398, 'Cortez', ' Noelia', 'DNI', 47195395, '', '', 'noeliamagalicortez@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(399, 'Cortez', ' Octavio Andres', 'DNI', 43213252, '', '', 'oc31549@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(400, 'Cortez', ' Samuel Esteban', 'DNI', 38205913, '', '', 'samescor.1994@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(401, 'Costa', ' Brisa Valentina', 'DNI', 47373220, '', '', 'costabrisa41@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(402, 'Cruz', ' Alvaro Delfin', 'DNI', 93999716, '', '', 'alvarocruz30217@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(403, 'Cruz', ' Carla', 'DNI', 35091191, '', '', 'soficruz2020@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(404, 'Cuello Rodio', ' Julieta Abril', 'DNI', 45875608, '', '', 'abriljulieta006@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(405, 'Curallanca', ' Exequiel Adolfo', 'DNI', 47810141, '', '', 'exequielcurallanca8@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(406, 'Cutifani', ' Milena Lourdes', 'DNI', 48331833, '', '', 'cutifanilourdes3@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(407, 'C?ceres', ' Antonella', 'DNI', 40690058, '', '', 'georginacaceres25@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(408, 'Diaz Correa', ' Jaqueline', 'DNI', 40561206, '', '', 'maii.diaz.39@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(409, 'Diaz Gonzalez', ' MELINA ISABEL', 'DNI', 43119729, '', '', 'diazgonzalezmelinaisabel@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(410, 'Diaz Macacaro', ' Luca miguel', 'DNI', 41418139, '', '', 'lucahysmigueldiazmacacaro@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(411, 'diaz palacio', ' Mar?a Brunela', 'DNI', 45448268, '', '', 'bruneladiaz045@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(412, 'Diaz Soliz', ' Edhy Marysol', 'DNI', 94358418, '', '', 'edhydiaz37@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(413, 'Diaz', ' Aldana Yanela', 'DNI', 46474834, '', '', 'diazyanela477@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(414, 'Diaz', ' Elias samuel', 'DNI', 47810466, '', '', 'elsamuu2007@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(415, 'Diaz', ' Griselda', 'DNI', 47373235, '', '', 'griseldadiaz2006@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(416, 'Diaz', ' Nelson William', 'DNI', 31125816, '', '', 'nelsondiaz86@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(417, 'Dominguez', ' Melisa Abigail', 'DNI', 45717003, '', '', 'abigail2004melisa@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(418, 'Dominguez', ' Tiziana', 'DNI', 47270607, '', '', 'domingueztiziana798@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(419, 'Domizi', ' Gisella Ayel?n', 'DNI', 43943105, '', '', 'giselladomizi72@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(420, 'DOMIZI', ' Melisa In?s', 'DNI', 45967021, '', '', 'mdomizi03@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(421, 'Donoso Sigot', ' Emanuel Eduardo', 'DNI', 43279810, '', '', 'emanueldonosouni@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(422, 'DURAN', ' DANIEL ALEJANDRO', 'DNI', 28487860, '', '', 'danduran.dd@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(423, 'D?vila', ' Julieta Leonor', 'DNI', 39017265, '', '', 'julieta.davilanogara@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(424, 'Echegaray', ' Lucas Manuel', 'DNI', 34324069, '', '', 'lucasechegaray2011@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(425, 'elst', ' luna', 'DNI', 46620585, '', '', 'lunaelst259@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(426, 'Elst', ' Sebasti?n', 'DNI', 45530472, '', '', 'sebithaelst@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(427, 'Escudero', ' Laureano Sebastian', 'DNI', 47373337, '', '', 'dragonballz917391@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(428, 'Escudero', ' Romina', 'DNI', 41363979, '', '', 'rominaescudero199@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(429, 'Esmoris Jitar', ' Ana Mar?a Vassilia', 'DNI', 95972445, '', '', 'anamariaesmorisjitar1997@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(430, 'Esper', ' Ana Luz', 'DNI', 47079873, '', '', 'aniiesper36@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(431, 'Eyzaguirre', ' Guadalupe', 'DNI', 46163882, '', '', 'guadaeyzaguirre12@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(432, 'Faillace', ' Abril', 'DNI', 44001978, '', '', 'abrilfllc@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(433, 'Fari?a Fleitas', ' Wilian Ram?n;DNI', '94841949', 0, '', 'wilian18f@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(434, 'Farruggia', ' Agustin', 'DNI', 46235577, '', '', 'agua345farru@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(435, 'Farruggia', ' Lorena Beatriz', 'DNI', 32510808, '', '', 'farruggialorena@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(436, 'Felippe', ' Nadia', 'DNI', 37512718, '', '', 'nadiafelippe93@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(437, 'Fernandes', ' Rocio Leonela', 'DNI', 43119706, '', '', 'rfernandez9359603@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(438, 'FERNANDEZ MAMANI', ' CARLOS RA?L', 'DNI', 42669500, '', '', '123carlosfernandez@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(439, 'Fernandez', ' Brenda', 'DNI', 44904057, '', '', 'fernandezbren39@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(440, 'Fernandez', ' Carlos Gabriel', 'DNI', 4170452, '', '', 'gabrielfernandez.374@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(441, 'fernandez', ' Elisa Elena', 'DNI', 30817654, '', '', 'elyelena3030@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(442, 'Fernandez', ' Esteban Gonzalo', 'DNI', 47810489, '', '', 'estebanfenan@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(443, 'Fernandez', ' Gabriela Noemi', 'DNI', 46234778, '', '', 'noeminoelia15@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(444, 'Fernandez', ' Jeremias', 'DNI', 42009051, '', '', 'jere.fer1999@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(445, 'Fernandez', ' Lucas Facundo', 'DNI', 44247393, '', '', 'fernandezfacundo951@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(446, 'Fernandez', ' Mar?a Laura', 'DNI', 42669479, '', '', 'zoecande300@gmial.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(447, 'Fern?ndez Godoy', ' Micaela Nicol', 'DNI', 40560582, '', '', 'fernandez.n.micaela20@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(448, 'Fern?ndez', ' Ianara Eimi Nulin', 'DNI', 43943649, '', '', 'fernandezianara3@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(449, 'Fern?ndez', ' Ludmila Nerea', 'DNI', 46473680, '', '', 'luly12ferdavila@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(450, 'Ferreira', ' Abril Agustina', 'DNI', 42478409, '', '', 'aferreirani2019@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(451, 'Ferrer', ' Milagros', 'DNI', 45258275, '', '', 'miliferrer48@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(452, 'Ferrer', ' Tiago jeremias', 'DNI', 47726698, '', '', 'tiaguitofer25@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(453, 'Figueroa', ' Ana Macarena', 'DNI', 41728207, '', '', 'Obredorana313@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(454, 'Figueroa', ' Fabrizio Nicolas', 'DNI', 46869298, '', '', 'fabriziofigueroa47@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(455, 'Figueroa', ' Ivana', 'DNI', 46474847, '', '', 'ivanafigueroa324@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(456, 'Flores Cassino', ' Luciana Fernanda', 'DNI', 47726558, '', '', 'lucianaflores7589@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(457, 'Flores', ' Brenda Rocio', 'DNI', 42169003, '', '', 'brendarociof5@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(458, 'Flores', ' Celina', 'DNI', 47726559, '', '', '11celinaflores@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(459, 'Flores', ' Jes?s Alessandro', 'DNI', 45361009, '', '', 'jesuflores73@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(460, 'Flores', ' Magali Ariadna', 'DNI', 44538593, '', '', 'magaflorez08@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(461, 'Flores', ' Milagros Lidia', 'DNI', 45023539, '', '', 'miliflores070@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(462, 'FLORES', ' Nerea Evangelina', 'DNI', 39081175, '', '', 'nereaflores244@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(463, 'Fornari', ' Noemi Elisabeth', 'DNI', 31636337, '', '', 'fornarinoemi@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(464, 'fornari', ' romina marisa', 'DNI', 30082120, '', '', 'romyfornari@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(465, 'Fretes', ' Natalia Yamina', 'DNI', 41752785, '', '', 'nataliayaminafretes@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(466, 'Fuentes', ' Diego Alejandro', 'DNI', 37001647, '', '', 'alefuentess1992@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(467, 'Fuentes', ' Morena', 'DNI', 48332401, '', '', 'fuentesmorena22@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(468, 'Funes Ag?ero', ' Maria Lucia', 'DNI', 44820698, '', '', 'lucia.funes.ag@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(469, 'Funez', ' Luisa Gladys', 'DNI', 17390465, '', '', 'gladiola2305@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(470, 'Gadea', ' Ver?nica Noem?;DNI', '33631403', 0, '', 'gadea_v@yahoo.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(471, 'Galbani', ' Agustina', 'DNI', 43279529, '', '', 'agustinagalbani02.29@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(472, 'Galvan', ' Celeste Abigail', 'DNI', 43943115, '', '', 'abinatura2307@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(473, 'GARAY', ' ANGEL DAVID', 'DNI', 38580982, '', '', 'angelgaray59@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(474, 'Garay', ' Mar?a Milagros', 'DNI', 42469300, '', '', 'miluhgaray@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(475, 'Garay', ' Mat?as Ezequiel', 'DNI', 43417656, '', '', 'matymgcgaray@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(476, 'Garro', ' Alicia Oriana', 'DNI', 45965353, '', '', 'milenagarro64@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(477, 'Gatica', ' Abril Aldana', 'DNI', 44905015, '', '', 'abrilgatica44@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(478, 'Gatica', ' D?maris', 'DNI', 46867006, '', '', 'gaticadamaris617@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(479, 'GAUTE', ' ALEJANDRA NOEMI', 'DNI', 24796297, '', '', 'gautealejandra@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(480, 'GENEM', ' EVELYN NATALI', 'DNI', 38205590, '', '', 'evegenem@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(481, 'Giangiulio Benol', ' Sabrina Abigail', 'DNI', 45360985, '', '', 'sabrinagiangiulio612@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(482, 'GIL', ' MAR?A JOS?', 'DNI', 42084495, '', '', 'gilm23321@gmailcom', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(483, 'Gil', ' Yael Emilce Mailen', 'DNI', 43749621, '', '', 'gilyael81@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(484, 'Gimenez Villegas', ' Fernando Jos?;DNI', '43681417', 0, '', 'fernandogimenez707@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(485, 'Godoy', ' Antonella Beatriz', 'DNI', 39677829, '', '', 'godoya471@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(486, 'Godoy', ' Florencia', 'DNI', 41967200, '', '', 'flor_g3899@hotmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(487, 'GODOY', ' Karen Nicol', 'DNI', 43353746, '', '', 'godoykarennicol686@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(488, 'Godoy', ' Luciana', 'DNI', 36581908, '', '', 'lucianagodoy@jbalberdi4026.edu.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(489, 'Gomez Villacorta', ' Ignacio Javier', 'DNI', 30536057, '', '', 'ignaciojaviergomez2015@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(490, 'Gomez', ' Vanesa Roxana', 'DNI', 26344838, '', '', 'vanesaroxana2014@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(491, 'Gomez', ' Viviana Micaela', 'DNI', 44538567, '', '', 'gomezmicaela209@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(492, 'Gonzalez Peralta', ' Ariadna Mercedes', 'DNI', 46234420, '', '', 'ag2200602@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(493, 'Gonzalez', ' Cintia gisel', 'DNI', 33439720, '', '', 'cintia.7.gonzalez@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(494, 'Gonzalez', ' Daniela Yasm?n', 'DNI', 43749033, '', '', 'danielagonzalez.2001.15@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(495, 'Gonzalez', ' Jimena Milagros', 'DNI', 41643195, '', '', 'jimelias919@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(496, 'Gonzalez', ' Julieta', 'DNI', 41004784, '', '', 'julyterapista@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(497, 'Gonzalez', ' Lorena', 'DNI', 44058304, '', '', 'lorenagonzalez99114@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(498, 'Gonzalez', ' Macarena Antonella', 'DNI', 36964611, '', '', 'macaanto.1991@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(499, 'Gonzalez', ' Maira', 'DNI', 39383249, '', '', 'gonzalezmaira317@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(500, 'Gonzalez', ' Octavio Hernan', 'DNI', 45587623, '', '', 'gonzalezoctavio356@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(501, 'Gonzalez', ' Paula Camila', 'DNI', 42357634, '', '', 'pgonzalez.2019.p@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(502, 'Gonzalez', ' Paula Gisel', 'DNI', 36581876, '', '', 'paulagiselgonzalez4@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(503, 'Gonzalez', ' Rocio Gabriela', 'DNI', 43151576, '', '', 'rg462643@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(504, 'Gonzalez', ' Rocio Michelle', 'DNI', 45720305, '', '', 'rociomichelleg21@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(505, 'Gonzalez', ' Zamira Lilian', 'DNI', 45965259, '', '', 'gzamira469@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(506, 'GONZALVES FARFAN', ' MELINA MARIEL DALILA', 'DNI', 39019222, '', '', 'melinagonzalves@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(507, 'Gonz?lez Blasco', ' David Luciano Leonel', 'DNI', 46474795, '', '', 'davidblasco3511w@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(508, 'Gonz?lez valencia', ' Ang?lica penelope rubi', 'DNI', 45877170, '', '', 'lopegonzalez7735@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(509, 'Gonz?lez', ' Mar?a Antonela', 'DNI', 43749724, '', '', 'antonelagonzalezj11@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(510, 'Guajardo olmos', ' Candela lucia', 'DNI', 47726623, '', '', 'guajardocandela2022@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(511, 'Guakinchay', ' Ingrid', 'DNI', 43075958, '', '', 'ingridguakinchay@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(512, 'Guardia', ' Cintia Paola', 'DNI', 44538578, '', '', 'cintiaguardia54@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(513, 'Guardia', ' Marianela Aim?;DNI', '43543231', 0, '', 'aimeguardia961@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(514, 'Guirado', ' Gonzalo', 'DNI', 43545561, '', '', 'villafaneegon104@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(515, 'Guiraldez', ' Ornella', 'DNI', 39679220, '', '', 'guiraldezornella320@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(516, 'Gui?az? Bonarrico', ' Gast?n Ariel', 'DNI', 45360987, '', '', 'guinazugaston1@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(517, 'Gui?az? Veron', ' Lucas Mart?n', 'DNI', 45361038, '', '', 'Lmgv2016@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(518, 'Gutierrez Sayavedra', ' Eduardo Daniel', 'DNI', 45258272, '', '', 'edaxxgz@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(519, 'Guti?rrez', ' Mauricio benjam?n', 'DNI', 45469584, '', '', 'mauri194jk@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(520, 'guzman', ' juan', 'DNI', 46397724, '', '', 'juampiguzman2005@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(521, 'Guzm?n Lucero ', ' Juan Manuel', 'DNI', 47079897, '', '', 'juanmanuelguzman947@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(522, 'Guzm?n', ' Jazm?n', 'DNI', 47965893, '', '', 'guzmanjazmin227@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(523, 'Guzm?n', ' Karen Nicole', 'DNI', 45023497, '', '', 'karennicoleguzman@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(524, 'Guzm?n', ' Mariela', 'DNI', 42976311, '', '', 'marielag.43499@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(525, 'Heredia', ' Melanie Sofia', 'DNI', 44746186, '', '', 'melaniesofi759@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(526, 'Herrera aguilar', ' Alexis joel', 'DNI', 46869309, '', '', 'herreralexis72@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(527, 'Herrera Gonz?lez', ' Alejandra Hayd?e', 'DNI', 26298091, '', '', 'alehhp@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(528, 'Herrera', ' Franco Nicolas', 'DNI', 39381925, '', '', 'herrerafranc96@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(529, 'Herrera', ' Lucas', 'DNI', 43828833, '', '', 'everlucash@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(530, 'Hunkalo', ' Brenda Aldana', 'DNI', 42750185, '', '', 'brendaahunkalo2022@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(531, 'Iluminatti', ' Andrea', 'DNI', 29224704, '', '', 'andreailuminatti@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(532, 'Irrutia', ' Gabriela Jaquelina', 'DNI', 30116097, '', '', 'irrutiajaquelina@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(533, 'irrutia', ' ismael', 'DNI', 50665766, '', '', 'iirrutia36@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(534, 'Irusta', ' Adriana Gabriela', 'DNI', 34675069, '', '', 'irustagabi90@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(535, 'Jaime', ' Camila', 'DNI', 45023491, '', '', 'camilajaime91@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(536, 'Janco', ' Arnaldo Mat?as', 'DNI', 43543473, '', '', 'matiasjanco805@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(537, 'Janco', ' Marina Alejandra', 'DNI', 46237496, '', '', 'jancomarina8@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(538, 'Jauven', ' Fabian Alejandro', 'DNI', 20551631, '', '', 'fabianjauven2018@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(539, 'Jofee', ' Sasha', 'DNI', 47371096, '', '', 'sashajofre21@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(540, 'Jofre', ' Alfonso Maximiliano', 'DNI', 46663366, '', '', 'alfonsojofre@jbalberdi4026.edu.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(541, 'Jofre', ' Ana Belen', 'DNI', 39843488, '', '', 'beljofre@766gmail', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(542, 'Jofre', ' Geraldina Aymar?;DNI', '46619193', 0, '', 'aymarajofre43@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(543, 'Jofre', ' Lucas Jeremias', 'DNI', 42793561, '', '', 'jeremiasjofre2015@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(544, 'JOFRE', ' MARTIN ESTEBAN', 'DNI', 43544095, '', '', 'mjofre454@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(545, 'Jofre', ' Valeria', 'DNI', 46235521, '', '', 'valeriajofre916@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(546, 'Jofr? Vargas', ' Camila Emilce', 'DNI', 47079835, '', '', 'jofrecamila152@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(547, 'Jurado L?pez', ' Alex Fernando Rafael', 'DNI', 45360981, '', '', 'alex45360981@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(548, 'Jurado', ' Sabrina Antonela', 'DNI', 46234442, '', '', 'antonelasabrinajurado@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(549, 'Lacoume Lembeye', ' Victor Luis', 'DNI', 29771942, '', '', 'victorlacoume@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(550, 'Lara', ' Ramiro Valentino', 'DNI', 44905096, '', '', 'valen280803lara@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(551, 'Leguiza', ' Vanesa Alejandra', 'DNI', 39234624, '', '', 'vaneluzleguiza@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(552, 'Leit?n; Ricardo Ivan', 'DNI', '30543143', 0, '', 'ricardo.leiton@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(553, 'Lencinas', ' Daiana Alexandra', 'DNI', 37001631, '', '', 'dasha_77@live.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(554, 'Lencinas', ' Estefania', 'DNI', 37001780, '', '', '1994araceli.len@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(555, 'Lencinas', ' Gabriel Jes?s', 'DNI', 39081196, '', '', 'jesu9556@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(556, 'Ligorria', ' Nicole Abigail', 'DNI', 47372356, '', '', 'ligorrianicole58@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(557, 'Lisantti', ' Marcelo Tomas', 'DNI', 41368500, '', '', 'marcelo.lisantti18@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(558, 'Llanos Ibarra', ' Romina Antonela', 'DNI', 44309203, '', '', 'rominallanosz.com.ar@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(559, 'Llugany L?pez', ' Heidi Melanie', 'DNI', 37412626, '', '', 'melanie.llugany.1717@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(560, 'Lopez', ' Brian', 'DNI', 46062506, '', '', 'brianlopez2404@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(561, 'Lopez', ' Miguel Angel', 'DNI', 29281688, '', '', 'miguelopez104@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(562, 'Loyola', ' Hilda Luciana Anabel', 'DNI', 45144818, '', '', 'loyolaanabel21@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(563, 'Loza', ' Aldana', 'DNI', 44405479, '', '', 'aldanaloza15@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(564, 'Lozano', ' Nahuel Mateo', 'DNI', 43486243, '', '', 'lozano.nahuel41@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(565, 'Lucero', ' Guadalupe Trinidad', 'DNI', 46234448, '', '', 'luceroguadalupe535@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(566, 'Lucero', ' Miriam Ayel?n', 'DNI', 44536595, '', '', 'luceroayelen08@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(567, 'Lucero', ' Sandra Yanet', 'DNI', 38205918, '', '', 'sandralucero494@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(568, 'Lujan Berrios', ' Milagros', 'DNI', 46869345, '', '', 'lujan6428@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(569, 'Lujan', ' Claudia Eliana', 'DNI', 26386352, '', '', 'enigsoe@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(570, 'Lujan', ' Pablo Lautaro', 'DNI', 46867045, '', '', 'pablolujanlautaro@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(571, 'Luj?n', ' Claudia Eliana', 'DNI', 26386352, '', '', 'elianalujan33@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(572, 'Luj?n', ' Eugenia Sthefani', 'DNI', 38580527, '', '', 'menguanteferia23@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(573, 'Luj?n', ' Mar?a Micaela', 'DNI', 46549094, '', '', 'mikumicalujan@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(574, 'Madaf', ' Brisa Antonella', 'DNI', 46062538, '', '', 'madafbrisa345@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(575, 'magallanes', ' sebastian', 'DNI', 47371064, '', '', 'sebastianmagallanes607@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(576, 'Malatesta Fiorentini', ' Mar?a Bel?n', 'DNI', 37160910, '', '', 'mbmalatesta@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(577, 'Maldonado', ' Gimena Lucia', 'DNI', 44905047, '', '', 'gimemaldonado2002@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(578, 'Maldonado', ' Mauro Fernando Gabriel', 'DNI', 47726615, '', '', 'maumaldonado727@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(579, 'Man', ' Maira Daiana', 'DNI', 37622940, '', '', 'mman86220@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(580, 'Mancilla', ' Araceli Vanesa', 'DNI', 30820041, '', '', 'aruss0584@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(581, 'Manresa', ' Yasmin Natalia', 'DNI', 43943113, '', '', 'manresayasmin@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(582, 'Manriquez', ' Brisa', 'DNI', 44905045, '', '', 'manriquezbrisapamela@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(583, 'Marano', ' Fernando', 'DNI', 40919302, '', '', 'marano01121997@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(584, 'Martinez Murgo ', ' Milagros Valentina', 'DNI', 47373339, '', '', 'valentinamartinezmurgo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(585, 'Martinez', ' Carla Antonella', 'DNI', 35200575, '', '', 'cm316222@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(586, 'Martinez', ' Lucia', 'DNI', 45360965, '', '', 'martinezluciavictoria1899@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(587, 'Martinez', ' Rodrigo', 'DNI', 30116054, '', '', 'eltrombonrodrigo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(588, 'Martinez', ' Sabrina Abril', 'DNI', 45587608, '', '', 'abrilsabrina19@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(589, 'Matteucci', ' Nahir Iv?n;DNI', '39383386', 0, '', 'nahirmatteucci@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(590, 'Mattioli', ' Antonella Elizabeth', 'DNI', 39239209, '', '', 'antonella081295@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(591, 'Maureira Vicari', ' Lautaro', 'DNI', 47609705, '', '', 'maureiralautaro33@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(592, 'Maurino', ' Agustina Magali', 'DNI', 44986372, '', '', 'agustinamaurino9@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(593, 'Mayorga', ' Camila Alejandra', 'DNI', 47195388, '', '', 'camiimayorga.uncu@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(594, 'Mayorga', ' Juanita Valentina', 'DNI', 47448172, '', '', 'juanitaavila055@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(595, 'Mayorga', ' Martin Leonel', 'DNI', 45360923, '', '', 'mayorgamartin102@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(596, 'Mayorga', ' Ramona Evangelina', 'DNI', 31452160, '', '', 'mayorgaevangelina9@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(597, 'Maza', ' Sheila Milagros', 'DNI', 47876855, '', '', 'sheilamaza62@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(598, 'Mendez Godoy', ' Lucas Leandro Ezequiel', 'DNI', 47612118, '', '', 'mendezgodoylucas@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(599, 'Mendez Godoy', ' Maira Andrea Celeste', 'DNI', 41644007, '', '', 'mendezgodoyandrea@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(600, 'Mendoza Ayarachi ', ' Jannetteh', 'DNI', 93097426, '', '', 'jm2022mdz@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(601, 'Mendoza', ' Clarisa Macarena', 'DNI', 41645289, '', '', 'clarimaca15@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(602, 'Mendoza', ' Noem? Cristina', 'DNI', 46869255, '', '', 'mendozacristina234@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(603, 'Mercado Soliz', ' Micaela Agustina', 'DNI', 45966972, '', '', 'agustinamicelasoliz@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(604, 'Mercado', ' Magali', 'DNI', 41369349, '', '', 'magamercado74@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(605, 'Mercado', ' Ramiro Martin', 'DNI', 45448796, '', '', 'rodrimercadomartin@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(606, 'Merino', ' uriel', 'DNI', 42082002, '', '', 'uriel.merino012@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(607, 'Mezzenasco', ' Ricardo Ariel', 'DNI', 21911231, '', '', 'charlymezzenasco@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(608, 'Micarelli', ' Pablo Gabriel', 'DNI', 47726695, '', '', 'micarellipablo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(609, 'Miguez', ' Antonella Victoria', 'DNI', 45361001, '', '', 'antomiguez04@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(610, 'Milagros', ' Alaniz', 'DNI', 47726678, '', '', 'mili20alaniz@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(611, 'Milagros', ' Silva', 'DNI', 42912544, '', '', 'milisilva0915@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(612, 'Miranda', ' Delfina del Valle', 'DNI', 47195011, '', '', 'delfinamiranda_07@hotmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(613, 'Molina Arancibia', ' Naomi Abril', 'DNI', 44878502, '', '', 'molinaarancibianaomi@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(614, 'molina cortez', ' sandra flavia', 'DNI', 37512758, '', '', 'sandrachimi32@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(615, 'Molina', ' Lucas Ezequiel', 'DNI', 45965216, '', '', 'jneo90957@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(616, 'Molina', ' Luciana', 'DNI', 46063126, '', '', 'lucianamolinanaza04@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(617, 'Molina', ' Romina Eliana', 'DNI', 36582018, '', '', 'rominamolina234@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(618, 'Molto', ' Alma Lucia', 'DNI', 47373363, '', '', 'almamoltoo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(619, 'Monta?a; Guadalupe', 'DNI', '45023522', 0, '', 'guadazmontana09@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(620, 'MONTENEGRO VERON', ' GIULIANA SOFIA', 'DNI', 43544071, '', '', 'giulianasofia941@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(621, 'Montenegro', ' Natalia Estefania', 'DNI', 40689633, '', '', 'natymontenegro17@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(622, 'Montenegro', ' Santiago Jesus', 'DNI', 47373314, '', '', 'noejesusmontenegro@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(623, 'Montenegro', ' Teresita', 'DNI', 30773509, '', '', 'teremontenegro1984@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(624, 'Mora', ' Agustin', 'DNI', 44437979, '', '', 'agustinmora959@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(625, 'Mora', ' Orina Ayelen', 'DNI', 46867009, '', '', 'orianaayelenmora@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(626, 'Morales', ' Ana Laura', 'DNI', 46869398, '', '', 'moralesana14142006@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(627, 'Morales', ' Carla Denis', 'DNI', 36581993, '', '', 'moralescarla1992@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(628, 'Morales', ' Evelyn Ailen', 'DNI', 46060611, '', '', 'evheemorales2004@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(629, 'Morales', ' Gianella', 'DNI', 46869366, '', '', 'moralesgianella1913@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(630, 'Morales', ' Ivo Miguel Uriel', 'DNI', 42669456, '', '', 'moralesivo83@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(631, 'Morales', ' Martina Nerina', 'DNI', 42318446, '', '', 'martimorales96@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(632, 'Morales', ' Mauro Gabriel', 'DNI', 44746937, '', '', 'maurogmorales2@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(633, 'Morales', ' Sandra Estefania', 'DNI', 39239296, '', '', 'sandraestefaniamorales@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(634, 'Moreno Asignato', ' Rodrigo Javier', 'DNI', 39604652, '', '', 'rodrigo.moreno.asignato@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(635, 'Moreno', ' Marianela', 'DNI', 43941661, '', '', 'marianelaalexandramoreno@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(636, 'MOSCOSO', ' YAMILA GISEL', 'DNI', 33704402, '', '', 'yami88.gise@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(637, 'Motos Romera', ' Nahuel Axel', 'DNI', 44820627, '', '', 'nahuelaxelmotosromera@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(638, 'Moyano', ' D?bora Ang?lica', 'DNI', 28838201, '', '', 'angelicamoyano35@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(639, 'Mu?oz', ' Ana Luz', 'DNI', 45023536, '', '', 'anaa.balmaceda31@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(640, 'natel', ' thiago israel', 'DNI', 46869240, '', '', 'natelthiago6@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(641, 'Navarra', ' Erika Silvana', 'DNI', 36582130, '', '', 'erikanavarra56@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(642, 'NAVARRA', ' MARIANA ANALIA', 'DNI', 27983068, '', '', 'naninavarra@yahoo.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(643, 'Navarro Dur?n', ' Alexis Benjam?n', 'DNI', 46475007, '', '', 'alexisnavarro@jbalberdi4026.edu.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(644, 'Navarro', ' Johana', 'DNI', 40561239, '', '', 'yoanavarro6@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(645, 'Navarro', ' Manuel Tom?s', 'DNI', 44538576, '', '', 'navarromanu2002@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(646, 'Nebot', ' Andres Gabriel', 'DNI', 41863250, '', '', 'andresnevot@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(647, 'Nieto', ' Sergio Samuel', 'DNI', 43941702, '', '', 'samuelnieto869@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(648, 'Nieva', ' Angeles Ayl?n', 'DNI', 45382459, '', '', 'angeles.nieva.83@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(649, 'Nievas', ' Lorena', 'DNI', 37512875, '', '', 'lorenasoledadnievas@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(650, 'Noguera Vega', ' Sabrina Leonela', 'DNI', 46235649, '', '', 'vegasabri9@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(651, 'Nu?ez', ' Lucila Nerea', 'DNI', 37512997, '', '', 'lucilanuneztava@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(652, 'Nu?ez', ' Ver?nica Dolores', 'DNI', 29425767, '', '', 'veronicadolores81@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(653, 'Nu?ez', ' Yanela Ailen', 'DNI', 45875781, '', '', 'nunezailen888@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(654, 'Ocampo', ' Ignacio', 'DNI', 46869382, '', '', 'ignaciodelfinocampo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(655, 'Ocampo', ' Nadia Jaqueline', 'DNI', 45966102, '', '', 'ocampojaqueline95@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(656, 'Ochoa', ' Maria Jose Dolores', 'DNI', 39019928, '', '', 'ochoamariajose205@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(657, 'Ochoa', ' Melanie', 'DNI', 45360999, '', '', 'melaniochoa67@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(658, 'Ojeda', ' Ailen Nair', 'DNI', 40963400, '', '', 'ailen.ojeda21@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(659, 'Ojeda', ' Alejandra Lourdes', 'DNI', 25292046, '', '', 'lomalejandra.369@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(660, 'Ojeda', ' Jos? Alejandro', 'DNI', 47079860, '', '', 'joseterciariopersonal1@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(661, 'Oliva Leveque', ' Julieta Valentina', 'DNI', 45361032, '', '', 'julietavalentinaoliva@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(662, 'Oliva', ' Gisel Abigail', 'DNI', 45361037, '', '', 'olivagisel405@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(663, 'Olivar Mora', ' Facundo Alejandro', 'DNI', 46548724, '', '', 'facundomora2005@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(664, 'Olme', ' Micaela Deolinda', 'DNI', 40711885, '', '', 'mikaolmedo2021@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(665, 'Olmos Coria', ' Priscila Sasha', 'DNI', 47448186, '', '', 'priscilaolmos43@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0);
INSERT INTO `persona` (`idpersona`, `apellido`, `nombre`, `tipoDocumento`, `numDocumento`, `cuil`, `fechaNacimiento`, `correo`, `telefono`, `direccion`, `pais_idpais`, `provincia_idprovincia`, `localidad`, `fechaAlta`, `genero`, `tipoPersona_idtipoPersona`, `situacion`, `habilitado`) VALUES
(666, 'Olmos', ' Angelina Lourdes', 'DNI', 47373230, '', '', 'olmosangelina966@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(667, 'Olmos', ' Leandro Nicolas', 'DNI', 47808286, '', '', 'nicolasolmos797@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(668, 'Orellano', ' Magali Roxana', 'DNI', 44757940, '', '', 'orellanomagali395@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(669, 'Orellano', ' Mar?a Bel?n', 'DNI', 42063642, '', '', 'belenorellanooo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(670, 'orme?o; valentina', 'DNI', '47876585', 0, '', 'ormenovalentina18@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(671, 'ORO', ' MARIA DE LOS ?NGELES', 'DNI', 41004775, '', '', 'oromaria0721@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(672, 'Oro', ' Paloma Eugenia', 'DNI', 45720398, '', '', 'palomaoro01@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(673, 'Orosco Aldaya', ' Carlos Sebastian', 'DNI', 46619769, '', '', 'sebastianaldaya42@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(674, 'Ortiz', ' Federico', 'DNI', 47902753, '', '', 'ofederico398@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(675, 'Ortiz', ' Gabriel', 'DNI', 46476646, '', '', 'gabrielericortiz46@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(676, 'Ortiz', ' Nicol Abigail', 'DNI', 45965249, '', '', 'nicolortiz2021@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(677, 'ORTIZ', ' NURIA ESTEFANIA', 'DNI', 31106827, '', '', 'ncejoc@yahoo.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(678, 'Ortolan', ' Graciela Lourdes', 'DNI', 22728514, '', '', 'graciel0808@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(679, 'Ortubia', ' Florencia Antonela', 'DNI', 44757774, '', '', 'florenciaortubia632@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(680, 'Ortubia', ' Orlando David', 'DNI', 32882721, '', '', 'thiagodavidortubia@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(681, 'Ovando', ' Nancy Karen', 'DNI', 41084071, '', '', 'karenovando2023@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(682, 'Oviedo', ' Benjamin Fernando', 'DNI', 47726502, '', '', 'lesyben2023@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(683, 'Oviedo', ' Carla Ornella Natali', 'DNI', 48075290, '', '', 'carlaoviedo172@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(684, 'Oviedo', ' Guadalupe Beatriz', 'DNI', 44905088, '', '', 'guadalupeoviedo03@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(685, 'Oviedo', ' Laura Ayel?n', 'DNI', 42669490, '', '', 'ayeeoviiedo19@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(686, 'Oviedo', ' Oriana', 'DNI', 45720354, '', '', 'oviedooriana260@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(687, 'Oyola', ' Edgardo Jos?;DNI', '44405391', 0, '', 'oyolajose233@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(688, 'Oyola', ' Sof?a Milagros', 'DNI', 44908334, '', '', 'oyolasofia31@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(689, 'O?o Videla', ' Alexander Iber', 'DNI', 45361428, '', '', 'alex10videla@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(690, 'Paez', ' Brisa Roc?o', 'DNI', 44309229, '', '', 'bpaez911@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(691, 'Paez', ' Nadia Milagros', 'DNI', 44746166, '', '', 'nadiapaez@jbalberdi4026.edu.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(692, 'Paileman', ' Osvaldo Omar', 'DNI', 41795613, '', '', 'osvaldopailemanos@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(693, 'PALACIO', ' ADRIANA GRACIELA', 'DNI', 26051550, '', '', 'gracielaadrianapalacio@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(694, 'Palacios', ' Romina Natacha', 'DNI', 32667033, '', '', 'romicudeiro@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(695, 'Palma Fernandez', ' Irina y', 'DNI', 42912546, '', '', 'irinayanela52@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(696, 'Palma', ' Abril', 'DNI', 46399543, '', '', 'palmaaa979@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(697, 'Palma', ' Sabrina', 'DNI', 43829838, '', '', 'ayelenpalma763@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(698, 'Paredes', ' Jimena Agustina', 'DNI', 43829832, '', '', 'agusparedes080@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(699, 'Parlante', ' Agustin Nicolas', 'DNI', 44246575, '', '', 'agustinparlante5@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(700, 'Parlante', ' Juan Gabriel', 'DNI', 45965202, '', '', 'juanparlante02@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(701, 'Pastran', ' Roc?o Bel?n', 'DNI', 44878520, '', '', 'ropastran3@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(702, 'Patricia Torres', ' Patricia Silvana', 'DNI', 35924842, '', '', 'patriciatorressilvana@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(703, 'Pav?n; Cecilia Elizabeth', 'DNI', '34786188', 0, '', 'ceciliarjpavon@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(704, 'Pecas', ' Camila Nicol', 'DNI', 44746948, '', '', 'camilanicolpecas2022@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(705, 'Pedot ybarra', ' Mar?a Fernanda', 'DNI', 32192826, '', '', 'fernandadot22@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(706, 'Pedraza', ' Malaquias Abraham', 'DNI', 44058880, '', '', 'malaquiaspedraza5@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(707, 'Pelaytay Rosales', ' Uriel Pablo', 'DNI', 46163392, '', '', 'uripelaytay05@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(708, 'Pereyra', ' Ariel', 'DNI', 43279086, '', '', 'pereyraariel1990@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(709, 'Pereyra', ' Maria Jaquelina', 'DNI', 21877754, '', '', 'mariajaquelinapereyra@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(710, 'Perez', ' Brian', 'DNI', 44746168, '', '', 'bep49300@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(711, 'Perez', ' Gimena Andrea', 'DNI', 35546014, '', '', 'gimeperez1991@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(712, 'Perez', ' Martina Agustina', 'DNI', 45967030, '', '', 'perezmartina509@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(713, 'Perulan', ' Malena', 'DNI', 46474793, '', '', 'perulanmalena@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(714, 'Perulan', ' Maria Jose', 'DNI', 45587903, '', '', 'majoperulan68@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(715, 'Perulan', ' Milagros', 'DNI', 46328883, '', '', 'miliyadrian29@hotmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(716, 'Pescetti', ' Javier Lautaro', 'DNI', 45531604, '', '', 'javierpescetti12@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(717, 'Pe?a; Macarena Idalia', 'DNI', '43942738', 0, '', 'penamacarena27@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(718, 'Pi?a; Iris', 'DNI', '39081280', 0, '', 'irispina780@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(719, 'Ponce', ' Alam Daniel', 'DNI', 47373270, '', '', 'alamponce25@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(720, 'Pont', ' Guadalupe Erika', 'DNI', 37779562, '', '', 'pontguadalupe17@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(721, 'PONTIS', ' Fernando Oscar', 'DNI', 33094997, '', '', 'fpontis@mendoza.edu.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(722, 'Principe', ' Matias Leonel', 'DNI', 47726532, '', '', 'principematias08@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(723, 'puebla', ' abril', 'DNI', 48396496, '', '', 'avipuebla79@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(724, 'PUEBLA', ' SEBASTIAN DANIEL', 'DNI', 37528983, '', '', 'seba4120@yahoo.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(725, 'Pusec', ' Julieta Valentina', 'DNI', 47726672, '', '', 'valentinaapusec2017@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(726, 'Quiavetta Morales', ' Sof?a Morena', 'DNI', 45588123, '', '', 'moramorales04@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(727, 'Quiroga Basualdo', ' Luciano Baltasar', 'DNI', 45720389, '', '', 'lucianoquiroga07@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(728, 'Quiroga', ' Hector Nehemias', 'DNI', 45965215, '', '', 'quiroganehemias2@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(729, 'QUIROGA', ' MARIA VERONICA', 'DNI', 24925520, '', '', 'mvquirogaspatola@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(730, 'Quiroga', ' Priscila Alejandra', 'DNI', 46062593, '', '', 'priscilaquiroga123456@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(731, 'Quiroga', ' Sheila Antonela', 'DNI', 45142256, '', '', 'qsheila363@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(732, 'Quiroz', ' Mayerly', 'DNI', 46867835, '', '', 'mayerlyquiroz22@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(733, 'Quispe', ' Lautaro', 'DNI', 47373333, '', '', 'quispefausto@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(734, 'Quispe', ' Teresa Belen', 'DNI', 45976830, '', '', 'quispeteresa833@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(735, 'Rajoy', ' Yamila Elizabeth', 'DNI', 43152581, '', '', 'yamilarajoy00@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(736, 'Ramirez', ' Gianella', 'DNI', 45720331, '', '', 'rgianella678@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(737, 'Ramos', ' Celeste Beatriz', 'DNI', 36633829, '', '', 'celee1.2.3.4..5ramos@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(738, 'Reggio', ' Emanuel', 'DNI', 42357626, '', '', 'reggio.emanuel@yahoo.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(739, 'Reyes', ' Daiana', 'DNI', 44756983, '', '', 'daianareyes3322@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(740, 'Reynoso', ' Evelyn', 'DNI', 44904026, '', '', 'evelynmilagrosreynoso141@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(741, 'Righi', ' Milagros Balvina', 'DNI', 42912563, '', '', 'milagrosrighi72@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(742, 'Rios Guakinchay ', ' Yanina Vanesa', 'DNI', 36581901, '', '', 'yaninarios492@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(743, 'Rios Guakinchay', ' Sofia Anabel', 'DNI', 39843417, '', '', 'riosssssanabellllsofiaaaa29@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(744, 'Rivarola', ' F?tima D?maris', 'DNI', 39383854, '', '', 'fatimarivarola006@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(745, 'Rivera Carazo', ' Rocio Yasm?n', 'DNI', 42751200, '', '', 'rociirivera00@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(746, 'Rivera Rodr?guez', ' Lilian Marlene', 'DNI', 44706553, '', '', 'riveraliliam8@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(747, 'Rivero Lucero', ' Rodrigo Yoel', 'DNI', 47967639, '', '', 'rodrigorivero323@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(748, 'Riveros Gonz?lez ', ' Iara Ail?n', 'DNI', 46060666, '', '', 'iarariveros600@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(749, 'Roatta', ' Gabriel', 'DNI', 30819082, '', '', 'gabrielroatta@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(750, 'Robles Maldonado', ' Alicia Yanil', 'DNI', 45257567, '', '', 'roblesyanil76@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(751, 'Rodriguez Cabrera', ' Juan Daniel', 'DNI', 43750324, '', '', 'cabrerajuandaiel@hotmail.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(752, 'Rodriguez Rivarola', ' Melisa Ayel?n', 'DNI', 39843206, '', '', 'melisa.1996.rodriguez@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(753, 'Rodriguez', ' Macarena Allison', 'DNI', 53039672, '', '', 'amrallisonrodri@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(754, 'Rodr?guez Flores', ' Brisa Milagros', 'DNI', 46663678, '', '', 'brisa4954@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(755, 'Rodr?guez', ' Melanie Magali', 'DNI', 44905633, '', '', 'maguirodrig123@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(756, 'Rodr?guez', ' Morena Anastasia', 'DNI', 46547090, '', '', 'rodriguezanastasia37@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(757, 'Rodr?guez', ' Nadia maria', 'DNI', 46869274, '', '', 'nadiamariarodriguez.45@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(758, 'Rojas Fernandez', ' Ingrid Mailen', 'DNI', 45529761, '', '', 'ingridroja849@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(759, 'Rojas', ' Cibels Ariana', 'DNI', 44438805, '', '', 'rcibels@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(760, 'Rojas', ' Milagros Victoria', 'DNI', 46397721, '', '', 'rojasmilagros651@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(761, 'Roldan', ' Lihuel Alejandro', 'DNI', 44010472, '', '', 'aleroldan156@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(762, 'Romera', ' Rocio Georgina', 'DNI', 43417894, '', '', 'romerarocio275@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(763, 'Romero Tupa', ' Ismael Francisco', 'DNI', 95614651, '', '', 'ismaeltromero1999@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(764, 'Romero Tupa', ' Jose Luis', 'DNI', 95162509, '', '', 'jlrt.tkm@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(765, 'romero', ' fiama', 'DNI', 43485631, '', '', 'teor13699@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(766, 'Romero', ' Ignacio', 'DNI', 45529727, '', '', 'nachorome45678@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(767, 'Romero', ' Luz maria', 'DNI', 42751183, '', '', 'luz486787@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(768, 'Romero', ' Marina Luj?n', 'DNI', 34696957, '', '', 'alemari3525@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(769, 'Romo', ' Pedro Renzo', 'DNI', 43829839, '', '', 'pedrorenzor@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(770, 'Romo', ' Priscila Olga', 'DNI', 46474605, '', '', 'romoo2780@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(771, 'Rosales', ' Juan Martin', 'DNI', 47373318, '', '', 'tinchoorosales4@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(772, 'ROSALES', ' LUCIA MARGARITA', 'DNI', 27754458, '', '', 'luciamrosal@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(773, 'Rubio', ' Agustin', 'DNI', 43544079, '', '', 'rubioagustin66@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(774, 'Rueda', ' Facundo', 'DNI', 44904068, '', '', 'facurueda26@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(775, 'Ruiz', ' Franco Emanuel', 'DNI', 46234276, '', '', 'francoruiz05g@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(776, 'Sabatini', ' Priscila', 'DNI', 46235538, '', '', 'priscilasabatini021@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(777, 'Saccone', ' Mauro Damian', 'DNI', 31130097, '', '', 'maurodamiansaccone@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(778, 'Saccone', ' Nahuel Hern?n', 'DNI', 45965329, '', '', 'sacconenahuel562@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(779, 'Sagua', ' Brenda Melisa', 'DNI', 37779567, '', '', 'brendasagua186@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(780, 'SALAS', ' Gonzalo David', 'DNI', 23734764, '', '', 'gonsalas2020@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(781, 'salavaguion', ' nery', 'DNI', 46546646, '', '', 'nerysalavaguion551@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(782, 'Salavagui?n Espirito', ' Carla Abril', 'DNI', 46474779, '', '', 'carlitasalavaguion750@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(783, 'Salinas', ' Leonela', 'DNI', 47532040, '', '', 'salinasleonela06@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(784, 'SALINAS', ' PAOLA DANIELA', 'DNI', 30889796, '', '', 'paolasalinasturismo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(785, 'Sanchez', ' Matias Leonel', 'DNI', 47726572, '', '', 'matii080207@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(786, 'Santoni Pallicer', ' Agustin', 'DNI', 46738668, '', '', 'agustinsantoni86@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(787, 'Santoni', ' Gianella Melina', 'DNI', 45529796, '', '', 'gianellasantoni22@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(788, 'Sarmiento', ' Yamla', 'DNI', 40660895, '', '', 'sarmientoyamila24@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(789, 'scacciante', ' sabrina alejandra', 'DNI', 43683456, '', '', 'sabrinascacciante10@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(790, 'Segovia', ' Claudia', 'DNI', 21515894, '', '', 'csegovia@mendoza.edu.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(791, 'Segura Rigo', ' Gast?n Alejandro', 'DNI', 40371918, '', '', 'gastonrigo0708@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(792, 'Segura', ' Lidia Lourdes', 'DNI', 42062698, '', '', 'seguralidialourdes@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(793, 'Silva Berrios', ' Iv?n Tomas', 'DNI', 42669466, '', '', 'ivansilvaok@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(794, 'Silva Rivera', ' Nicol Shirley', 'DNI', 44437985, '', '', 'silvanicol48@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(795, 'Silva', ' Nazareno', 'DNI', 45967016, '', '', 'nazarenosilvaever@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(796, 'Sivila', ' Brenda Gisela', 'DNI', 45597348, '', '', 'brendasivila17@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(797, 'Sivila', ' Yamila', 'DNI', 45597349, '', '', 'yamisivila6@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(798, 'Sosa', ' Abril', 'DNI', 47726647, '', '', 'abrilsosa491@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(799, 'Sosa', ' Eliana', 'DNI', 44438810, '', '', 'eli5osa212@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(800, 'SOTOMAYOR', ' Alejandro Andr?s', 'DNI', 29834852, '', '', 'ales_28@yahoo.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(801, 'Suarez', ' Jazmin', 'DNI', 45717947, '', '', 'jazminsuarez586@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(802, 'Sub?a', ' Sofia', 'DNI', 47270381, '', '', 'ssubia357@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(803, 'Sullca', ' Roc?o Ana', 'DNI', 42167547, '', '', 'rocioanasullca@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(804, 'Suvia Hinojosa', ' Natal? Hayde?;DNI', '46474718', 0, '', 'natalihaydeesuviahinojosa@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(805, 'Tamara Antonela', ' Oca?a;DNI', '41368636', 0, '', 'tamaraocana10@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(806, 'Tapia', ' Mar?a Eugenia', 'DNI', 39088570, '', '', 'eugeniatapia2018@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(807, 'Tarateta', ' Antonio Pablo', 'DNI', 18551183, '', '', 'aptarateta@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(808, 'Tayura', ' Priscila Rayen', 'DNI', 42712762, '', '', 'priscilatayura@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(809, 'Tejada', ' Josefa Valeria', 'DNI', 28813850, '', '', 'leoian2021g@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(810, 'Tejero', ' Mauricio', 'DNI', 28627415, '', '', 'mtejerocereda@yahoo.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(811, 'Terrero', ' Maximiliano Nicolas', 'DNI', 46397730, '', '', 'terreromaxi10@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(812, 'Terrero', ' Roberto Emanuel', 'DNI', 40661121, '', '', 'emanulrt1998@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(813, 'Teves', ' Melina', 'DNI', 44124288, '', '', 'nicolteves36@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(814, 'Torrengo', ' Camila', 'DNI', 42507561, '', '', 'camitorrengo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(815, 'Torrent Fernandez', ' Tania Abril', 'DNI', 46164160, '', '', 'torrenttania04@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(816, 'Torres Martinez ', ' Nicol? Abigail', 'DNI', 47448482, '', '', 'nicoleabigailtm18@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(817, 'Torres Narvaez', ' Juan Marcelo', 'DNI', 46062554, '', '', 'torresjuann509@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(818, 'Torres', ' Flavia Vanesa', 'DNI', 28600470, '', '', 'flaviatorres1981@yahoo.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(819, 'Torrez', ' Jos?;DNI', '95149227', 0, '', 'jmtm.29.12@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(820, 'Toscano', ' Valentina Mariela', 'DNI', 42507569, '', '', 'vtoscanoni2019@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(821, 'Traslavi?a; Camila Nicol', 'DNI', '45360982', 0, '', 'camilanicoltraslavina@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(822, 'Urbani', ' Enzo David', 'DNI', 40844698, '', '', 'enzourbani1@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(823, 'Valdez', ' Jonathan Brian Emiliano', 'DNI', 45874365, '', '', 'jv3400501@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(824, 'Valdez', ' Julieta Ariadna', 'DNI', 44904041, '', '', 'julietavaldez462@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(825, 'Valencia', ' Luciana', 'DNI', 47373366, '', '', 'lucianavalencia0k@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(826, 'Vallecillo', ' Daniela', 'DNI', 36582077, '', '', 'danielabelenvallecillo@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(827, 'Vallejos', ' Carina Varonica', 'DNI', 26507383, '', '', 'k_rinaval@hotmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(828, 'Vargas Legurguro', ' Ana Laura', 'DNI', 47726590, '', '', 'zuzuharumi2@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(829, 'Vargas', ' Camila', 'DNI', 46062523, '', '', 'camilavaleriacv5930540@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(830, 'Vera Ansaldo', ' Nahir Tatiana', 'DNI', 41699475, '', '', 'tatianakletschke@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(831, 'Vera', ' Adriana Angela', 'DNI', 28797253, '', '', 'adrianavera278@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(832, 'Vera', ' Gabriela', 'DNI', 23185053, '', '', 'enologa1gabrielavera@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(833, 'Vergara', ' Magali Clide Daniela', 'DNI', 46546632, '', '', 'magalivergara64@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(834, 'veron', ' Lourdes Mariana', 'DNI', 28225561, '', '', 'louma317@yahoo.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(835, 'Veron', ' Sofia Malena', 'DNI', 46233691, '', '', 'sofi.veron222@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(836, 'Ver?n; Lionel', 'DNI', '47373322', 0, '', 'veronlionel3@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(837, 'Vicencio', ' Camila Antonella', 'DNI', 41967495, '', '', 'camilavicencio1999@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(838, 'Videla Aranela', ' Sofia Evangelina', 'DNI', 44878528, '', '', 'videlasofiaeva@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(839, 'Videla Aranela', ' Solange Valentina', 'DNI', 46548789, '', '', 'solangearanela23@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(840, 'Videla', ' Abril Dalma', 'DNI', 47373262, '', '', 'abrildalmavidela@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(841, 'Videla', ' Huilen Luna', 'DNI', 46235505, '', '', 'videlaluna03@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(842, 'Videla', ' Jonathan Alexis', 'DNI', 44405397, '', '', 'alexisvidela588@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(843, 'Videla', ' Mayra Malena', 'DNI', 44123558, '', '', 'orosmayra558@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(844, 'Videla', ' Patricia Beatriz', 'DNI', 37622914, '', '', 'selenakiaraoliva14072015@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(845, 'Villa Aguirre', ' Pamela Anahi', 'DNI', 42307351, '', '', 'anahiivilla1999@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(846, 'Villafa?e; Maria Valeria', 'DNI', '38086074', 0, '', 'villafanevale13@gmail.com', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(847, 'Villca', ' Gonzalo Ariel', 'DNI', 43278561, '', '', 'arielvillca4327@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(848, 'Villegas Vera', ' Claudio Rafael', 'DNI', 33821696, '', '', 'claudiovillegas24@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(849, 'Villegas', ' Lucia Elizabeth', 'DNI', 42478445, '', '', 'luciavillegas467@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(850, 'Villegas', ' Mois?s Daniel', 'DNI', 44820630, '', '', 'moisesvillegas452@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(851, 'Vonkunoschy Navarra', ' Marco Ivan', 'DNI', 43829806, '', '', 'marcoivanvonkunoschynavarra@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(852, 'Wiedo', ' Milagros', 'DNI', 45965204, '', '', 'milagroswiedo2@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(853, 'Yacante', ' Federica Lourdes', 'DNI', 42750910, '', '', 'federicayacante@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(854, 'Yanz?n Gonzalez', ' Julieta Agostina', 'DNI', 44309206, '', '', 'yanzonjulieta804@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(855, 'Zabala Donoso', ' Daiana', 'DNI', 38414374, '', '', 'daizabala09@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(856, 'Zabaleta', ' Estefania', 'DNI', 47726524, '', '', 'zabaletaestefania73@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(857, 'Zalazar', ' Caren Belen', 'DNI', 41364006, '', '', 'carenz931@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(858, 'Zamora', ' Daiana Zamora', 'DNI', 36965525, '', '', 'dayizamora003@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(859, 'Zangrandi Jossier', ' Dana', 'DNI', 46619150, '', '', 'jossiernerea@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(860, 'Zarate Pisarro', ' Lourdes Anabella', 'DNI', 45360913, '', '', 'zarateanabella395@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(861, 'Zarate', ' Lucia', 'DNI', 32855577, '', '', 'lucia2021.pastran@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(862, 'ZELADA FERN?NDEZ', ' Jazm?n', 'DNI', 40102496, '', '', 'jazmines97@outlook.com.ar', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(863, 'Zenteno', ' Valeria', 'DNI', 45448217, '', '', 'valeriazenteno167@gmail.com', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(864, 'Fernandez Romina Natalia', '', 'DNI', 44537694, '', '', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(865, 'Cano Oviedo', ' Nicol Valentina', 'DNI', 47531528, '', '', '', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(866, 'Tapia', 'Mar?a Eugenia ', 'DNI', 39099570, '', '', 'Eugeniatapia2018@gmail.com', '2612628520', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(867, 'Villegas ', 'Mois?s ', 'DNI', 44820630, '', '', 'moisesvillegas452@gmail.com', '2617084380', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(868, 'Irusta', 'Adriana', 'DNI', 34675069, '', '', 'irustagabi90@gmail.com', '2617610620', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(869, 'Godoy', 'Antonella', 'DNI', 39677829, '', '', 'godoya471@gmail.com', '2616019857', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(870, 'Silva Rivera', 'Nicol Shirley ', 'DNI', 44437985, '', '', 'silvanicol48@gmail.com', '2616216860', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(871, 'Banno', 'Rub?n ', 'DNI', 34063091, '', '', 'banex_22@hotmail.com', '2615401723', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(872, 'Hunkalo ', 'Brenda ', 'DNI', 42750185, '', '', 'brendaahunkalo2022@gmail.com', '2615630535', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(873, 'Araujo', 'Franco', 'DNI', 40217970, '', '', 'francoaraujo2497@gmail.com', '2616736161', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(874, 'Alvarez', 'Soledad ', 'DNI', 31432246, '', '', 'soledadalvarez84@gmail.com', '2616396309', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(875, 'Olivares ', 'Walter ', 'DNI', 28844514, '', '', 'walterolivareshys@gmail.com', '2616881617', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(876, 'Pe?a;Macarena Idalia', 'DNI', '43942738', 0, '', 'penamacarena27@gmail.com', '2617752483', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(877, 'Aldalla ', 'Aldana', 'DNI', 39088869, '', '', 'analdalla1212@gmail.com', '2613048699', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(878, 'Ort?z ', 'Victoria', 'DNI', 44405463, '', '', 'victoriaortiz724@gmail.com', '2616666606', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(879, 'Villegas', 'Bricia', 'DNI', 42063256, '', '', 'ailenbricia42@gmail.com', '2617695652', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(880, 'Oyola', 'Sofia', 'DNI', 44908334, '', '', 'oyolasofia31@gmail.com', '2617618262', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(881, 'Reynoso Oribe', 'Marianela ', 'DNI', 44246954, '', '', 'marianela.oribe@gmail.com', '2616233315', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(882, 'Nieto', 'Samuel', 'DNI', 43941702, '', '', 'samuelnieto869@gmail.com', '2617007228', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(883, 'Oliva ', 'Gisel', 'DNI', 45361037, '', '', 'olivagisel405@gmail.com', '2616445506', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(884, 'Gonzalez ', 'Paula Camila ', 'DNI', 42357634, '', '', 'pgonzalez.2019.p@gmail.com', '2617166834', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(885, 'Mayorga', 'Carla Rocio', 'DNI', 44746187, '', '', 'carlarocio2119@gmail.com', '2616941518', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(886, 'Jofre', 'Aymar? Geraldine', 'DNI', 46619193, '', '', 'Jofrea148@gmail.com', '2617083211', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(887, 'Oro', 'Maria', 'DNI', 41004775, '', '', 'oromaria0721@gmail.com', '2616041934', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(888, 'Diaz macacaro ', 'Luca Miguel ', 'DNI', 41418139, '', '', 'Lucadiazmacacaro@gmail.com', '2616650842', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(889, 'Sandovares ', 'Aldana Maria ', 'DNI', 45587584, '', '', 'aldanasandovares@gmail.com', '2616903248', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(890, 'Ag?ero Zangrandi ', 'Lourdes Guadalupe ', 'DNI', 43354428, '', '', 'guadalupeaguero203@gmail.com', '2615162556', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(891, 'Alessandra', 'Carla Alicia', 'DNI', 38759298, '', '', 'alessandracarla950@gmail.com', '2616306275', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(892, 'Perez', 'Gimena Andrea', 'DNI', 35546014, '', '', 'gimeperez1991@gmail.com', '2614169237', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(893, 'FERN?NDEZ', 'LEANDRO FRANCISCO', 'DNI', 36753316, '', '', 'fernandezleandrofrancisco@gmail.com', '2616830355', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(894, 'Ortiz Fazio', 'Renzo Emiliano', 'DNI', 40371970, '', '', 'renzoortizlbk@gmail.com', '2616178386', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(895, 'Anconetani ', 'Graciela Sonia ', 'DNI', 24085319, '', '', 'ganconetani@mendoza.edu.ar', '2616299666', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(896, 'Quiroga ', 'H?ctor Nehemias ', 'DNI', 45965215, '', '', 'quiroganehemias2@gmail.com', '2616947884', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(897, 'Morales', 'Mauro Gabriel', 'DNI', 44746937, '', '', 'maurogmorales2@gmail.com', '2617023640', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(898, 'Silva Berrios', 'Iv?n Tomas', 'DNI', 42669466, '', '', 'ivansilvaok@gmail.com', '2612629617', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(899, 'Olarte', 'Mirta Carina ', 'DNI', 24423438, '', '', 'carina.olarte.cn@gmail.com', '2616043790', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(900, 'Jurado', 'ALEX', 'DNI', 45360981, '', '', 'alex45360981@gmail.com', '2612066678', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(901, 'Garc?a', 'Gustavo Daniel ', 'DNI', 44403746, '', '', 'izucumidoriya.007@gmail.com', '2616275186', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(902, 'Ruiz', 'Sofia Mercedes', 'DNI', 45023530, '', '', 'sofiruiz4502@gmail.com', '2615511005', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(903, 'Fernandez', 'Jeremias', 'DNI', 42009051, '', '', 'jere.fer1999@gmail.com', '2615432616', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(904, 'Vasquez Rivera', 'Roger Giovani', 'DNI', 39843387, '', '', 'gvasquezrivera1995@gmail.com', '2612168423', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(905, 'Rojas', 'Maria', 'DNI', 94222013, '', '', 'marielene975jkm@gmail.com', '2616375320', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(906, 'Domizi', 'Gisella Ayelen ', 'DNI', 43943105, '', '', 'giselladomizi72@gmail.com', '2613052664', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(907, 'Gonzalez', 'Aldana Gisela', 'DNI', 39677858, '', '', 'gonzalezgisela065@gmail.com', '2617611770', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(908, 'Gregorio', 'Gabriel', 'DNI', 39677821, '', '', 'gabriel95jk@gmail.com', '2616015353', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(909, 'Cortez', 'Octavio Andres ', 'DNI', 43213252, '', '', 'oc31549@gmail.com', '2616551307', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(910, 'Lucero', 'Brisa', 'DNI', 46162802, '', '', 'brisalucero.eli@gmail.com', '2615592323', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(911, 'Natalini Diaz ', 'Alfredo Agust?n ', 'DNI', 45023463, '', '', 'nata2003alfredo@gmail.com', '2613093874', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(912, 'Ter?n', 'Sergio Esteban', 'DNI', 25356886, '', '', 'sergio.teran1@gmail.com', '2615182938', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(913, 'Guirado', 'Gonzalo', 'DNI', 43545561, '', '', 'gonzalogui104@gmail.com', '2616857792', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(914, 'Alonso ', 'Andrea', 'DNI', 28340011, '', '', 'andreaalonsocarboni@gmail.com', '2616575269', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(915, 'Camargo', 'Tom?s Ezequiel', 'DNI', 42509171, '', '', 'camargo.tomasezequiel@gmail.com', '2613658326', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(916, 'Tayura', 'Priscila', 'DNI', 42712762, '', '', 'priscilatayura@gmail.com', '2612645654', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(917, 'FERNANDEZ', 'GABRIEL', 'DNI', 41702452, '', '', 'gabrielfernandez.374@gmail.com', '2616808358', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(918, 'Candido', 'Facundo', 'DNI', 43943121, '', '', 'facundocandido81@gmail.com', '2612511070', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(919, 'Vonkunoschy', 'Enzo Adrian', 'DNI', 20112421, '', '', 'enzovonkunoschy@gmail.com', '2612443928', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(920, 'Vasquez Rivera', 'Giovani Vasquez', 'DNI', 39843387, '', '', 'gvasquezrivera1995@gmail.com', '2612168423', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(921, 'Fern?ndez', 'Leandro Francisco', 'DNI', 36753316, '', '', 'fernandezleandrofrancisco@gmail.com', '2616830355', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(922, 'Alvarez', 'Maria', 'DNI', 31432246, '', '', 'soledadalvarez84@gmail.com', '2515396309', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(923, 'dfgdfg', 'gdfgdf', 'DNI', 45245645, '', '', 'gvasquezrivera1995@gmail.com', '2225525252', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(924, 'Alvarez ', 'Soledad ', 'DNI', 31432246, '', '', 'soledadalvarez84@gmail.com', '2616396309', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(925, 'BURGOS', 'Sabrina Chiara', 'DNI', 41364792, '', '', 'Sabrinachiara.ok@gmail.com', '2615174896', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(926, 'Olivares', 'Walter', 'DNI', 28844514, '', '', 'walterolivareshys@gmail.com', '2616881617', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(927, 'Fern?ndez', 'Leandro Francisco', 'DNI', 36753316, '', '', 'fernandezleandrofrancisco@gmail.com', '2616830355', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(928, 'Pablo', 'Stella Maris', 'DNI', 34068823, '', '', 'prof.stellamarispablo@gmail.com', '2615167022', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(929, 'Alvarez', 'Mar?a Soledad', 'DNI', 31432246, '', '', 'soledadalvarez84@gmail.com', '2616396309', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(930, 'Olarte', 'Mirta Carina ', 'DNI', 24423438, '', '', 'carina.olarte.cn@gmail.com', '2616043790', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(931, 'Villegas ', 'Mois?s Daniel ', 'DNI', 44820630, '', '', 'moisesvillegas452@gmail.com', '2617084380', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(932, 'Domizi', 'Melisa ', 'DNI', 45967021, '', '', 'mdomizi03@gmail.com', '2612459748', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(933, 'Garcia', 'Shirley', 'DNI', 30889723, '', '', 'shirleylaura45@gmail.com', '2616152551', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(934, 'Orellano', 'Magali', 'DNI', 44757940, '', '', 'orellanomagali395@gmail.com', '2612054448', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(935, 'Luj?n ', 'Eugenia Shtefani', 'DNI', 38580527, '', '', 'Menguanteferia23@gmail.com', '2617109008', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(936, 'Toscano', 'Valentina ', 'DNI', 42507569, '', '', 'vtoscanoni2019@gmail.com ', '2615159858', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(937, 'Abdala', 'Ana Laura ', 'DNI', 29125438, '', '', 'abdala.analau@gmail.com', '2616800569', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(938, 'Paez', 'Brisa Roc?o', 'DNI', 44309229, '', '', 'bpaez911@gmail.com', '2617676322', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(939, 'Vicencio', 'Camila', 'DNI', 41967495, '', '', 'Camilavicencio1999@gmail.com', '2615922555', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(940, 'Castro', 'Pamela', 'DNI', 31714995, '', '', 'pamelacastro995@gmail.com', ') 615-7902', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(941, 'Arancibia', 'Brisa Beatriz', 'DNI', 44538600, '', '', 'beatrizarancibia181@gmail.com', '2617464971', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(942, 'Alonso', 'Gabriela Leonor', 'DNI', 29333981, '', '', 'gabialonso82@yahoo.com.ar', '2616961217', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(943, 'Curioni', 'Francisco', 'DNI', 26339811, '', '', 'franciscocurioni@gmail.com', '2615169309', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(944, 'Rivera Rodriguez', 'Liliam Marlene', 'DNI', 44706553, '', '', 'riveraliliam8@gmail.com', '44706553', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(945, 'Paileman ', 'Osvaldo Omar ', 'DNI', 41795613, '', '', 'osvaldopailemanos@gmail.com', '2617678964', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(946, 'Santoni', 'Agustin', 'DNI', 46738668, '', '', 'agustinsantoni86@gmail.com', '2615638687', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(947, 'Arcibia', 'Melani', 'DNI', 44404710, '', '', 'melarcibia@gmail.com', '2612458399', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(948, 'Maldonado ', 'Mauro ', 'DNI', 47726615, '', '', 'maumaldonado727@gmail.com', '2615665459', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(949, 'Fern?ndez Godoy ', 'Micaela Nicol', 'DNI', 40560580, '', '', 'fern?ndez.n.micaela20@gmail.com', '2612334588', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(950, 'Aguirre ', 'Daniela ', 'DNI', 46474897, '', '', '01daniaguirre@gmail.com', '2616802433', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(951, 'Menconi', 'Ana', 'DNI', 23339348, '', '', 'anamenconi@gmail.com', '2616721874', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(952, 'Castro', 'Alejo', 'DNI', 45965339, '', '', 'ac677777@gmail.com', '2615716840', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(953, 'Lucero ', 'Ayel?n ', 'DNI', 44536595, '', '', 'luceroayelen08@gmail.com', '2613094165', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(954, 'Acosta', 'Silvia', 'DNI', 25092146, '', '', 'silviacostalara@gmail.com', '261 627-46', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(955, 'Barrientos Soliz', 'Franco Javier', 'DNI', 38912016, '', '', 'franco9562@gmail.com', '2616073447', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(956, 'Avenda?o;Paola', 'DNI', '94912184', 0, '', 'avendanopaola2626@gmail.com', '2616136212', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(957, 'NAVARRA', 'Dar?o', 'DNI', 20115250, '', '', 'darionavarra@yahoo.com', '2616721868', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(958, 'Yacante', 'Nicol?s', 'DNI', 40561207, '', '', 'nicolasyacante97@gmail.com', '2617127898', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(959, 'Funes Ag?ero ', 'Maria Lucia ', 'DNI', 44820698, '', '', 'lucia.funes.ag@gmail.com', '2616708244', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(960, 'S?nchez', 'Cristian David ', 'DNI', 23712089, '', '', 'cristiansanchezdemendoza@gmail.com', '2615790565', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(961, 'Noguera ', 'Sabrina ', 'DNI', 46235649, '', '', 'vegasabri9@gmail.com', '2615602083', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(962, 'Guinazu', 'Marisa Regina', 'DNI', 17750736, '', '', 'guinazumarisa@gmail.com', '2615728391', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(963, 'Barroso', 'Brenda ', 'DNI', 45716972, '', '', 'barroso.bren47@gmail.com', '2617579984', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(964, 'Hunkalo ', 'Brenda ', 'DNI', 42750185, '', '', 'brendaahunkalo2022@gmail.com', '2615630535', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(965, 'Rajoy', 'Yamila', 'DNI', 43152581, '', '', 'yamilarajoy00@gmail.com', '2613353841', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(966, 'Caba?a;Sofia Julieta', 'DNI', '45258421', 0, '', 'sofi.cabana.03@gmail.com', '2613444702', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(967, 'Felippe', 'Nadia', 'DNI', 37512718, '', '', 'nadiafelippe93@gmail.com', '2616451044', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(968, 'romero', 'Marina Luj?n ', 'DNI', 34696957, '', '', 'alemari3525@gmail.com', '2615136729', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(969, 'Romero ', 'Marina Luj?n ', 'DNI', 34696957, '', '', 'alemari3525@gmail.com', '2615136729', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(970, 'Manresa', 'Yasmin ', 'DNI', 43943113, '', '', 'Manresayasmin@gmail.com', '2613062473', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(971, 'Ortubia ', 'Florencia Antonela ', 'DNI', 44757774, '', '', 'florenciaortubia6@gmail.com', '2613663733', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(972, 'Cataldo ', 'Brian Isaac ', 'DNI', 42478460, '', '', 'briansitocataldo@gmail.com', '2616242740', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(973, 'Gonzalez', 'Jimena', 'DNI', 41643195, '', '', 'jimeliascris408@gmail.com', '2615664285', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(974, 'Gonzalez', 'Jimena', 'DNI', 41673195, '', '', 'jimeliascris408@gmail.com', '2615664285', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(975, 'Gonzalez', 'Jimena', 'DNI', 41643195, '', '', 'jimeliascris408@gmail.com', '2615664285', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(976, 'Romera', 'Rocio', 'DNI', 43417894, '', '', 'romerarocio275@gmail.com', '2612441659', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(977, 'Fern?ndez ', 'Ludmila Nerea ', 'DNI', 46473680, '', '', 'luly12ferdavila@gmail.com', '2616337786', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(978, 'Cabrera', 'Carina Magali', 'DNI', 45874386, '', '', 'magalicabrera092@gmail.com', '2612776449', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(979, 'Miranda', 'Delfina', 'DNI', 47195011, '', '', 'delfinamiranda_07@hotmail.com', '2612054488', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(980, 'Miranda', 'Delfina', 'DNI', 47195011, '', '', 'mirandadelfina493@gmail.com', '2612054488', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(981, 'Traslavi?a ', 'Camila Nicol ', 'DNI', 45360982, '', '', 'camilanicoltraslavina@gmail.com', '2612788232', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(982, 'Martinez ', 'Sabrina Abril ', 'DNI', 45587608, '', '', 'abrilsabrina19@gmail.com', '2612348033', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(983, 'Sosa', 'Eliana ', 'DNI', 44438810, '', '', 'eli5osa212@gmail.com', '2613906541', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(984, 'Diaz Palacio ', 'Maria Brunela', 'DNI', 45448268, '', '', 'bruneladiaz045@gmail.com', '2615614045', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(985, 'Herrera ', 'Franco Nicolas ', 'DNI', 39381925, '', '', 'enanobj00@gmail.com', '2617013997', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(986, 'Romo', 'Priscila Olga ', 'DNI', 46474605, '', '', 'romoo2780@gmail.com', '2613409992', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(987, 'Albertti ', 'Ricardo Martin ', 'DNI', 44756917, '', '', 'martin.albertti.2003@gmail.com', '2616045543', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(988, 'Bortolin J', 'Selena ', 'DNI', 45256983, '', '', 'selenabortolin@gmail.com', '2617111137', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(989, 'Albertti ', 'Ricardo Martin ', 'DNI', 44756917, '', '', 'martin.albertti.2003@gmail.com', '2616045543', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(990, 'Miranda', 'Delfina', 'DNI', 47195011, '', '', 'mirandadelfina493@gamil.com ', '2612054488', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(991, 'Traslavi?a ', 'Camila Nicol ', 'DNI', 45360982, '', '', 'camilanicoltraslavina@gmail.com', '2612788232', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(992, 'Gil', 'Yael Emilce Mailen ', 'DNI', 43749621, '', '', 'yaelgil45@gmail.com', '2613017887', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(993, 'Carbone ', 'Rosa ', 'DNI', 45965245, '', '', 'rosacarbone155@gmail.com', '2612466781', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(994, 'Gonzalez', 'Octavio', 'DNI', 45587623, '', '', 'gonzalezoctavio356@gmail.com', '2612079707', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(995, 'Casas Martinez', 'Mara Gianella', 'DNI', 46233614, '', '', 'maracasasmartinez1@gmail.com', '2615123403', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(996, 'Videla ', 'Jonathan Alexis ', 'DNI', 44405397, '', '', 'alexisvidela588@gmail.com', '261 274-82', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(997, 'Bortolin ', 'Selena ', 'DNI', 45256983, '', '', 'selenabortolin@gmail.com', '2617111137', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(998, 'Rodr?guez  Rivarola ', 'Melisa Ayel?n ', 'DNI', 39843206, '', '', 'melisa.1996.rodriguez@gmail.com', '2613424017', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(999, 'Bortolin ', 'Selena ', 'DNI', 45256984, '', '', 'selenabortolin@gmail.com', '2617111137', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1000, 'Fern?ndez', 'Gabriela Noemi', 'DNI', 46234778, '', '', 'Noeminoelia15@gmail.com', '2615727357', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1001, 'Ca?izare', 'Abril', 'DNI', 42266907, '', '', 'abrilczare@gmail.com', '2616050245', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1002, 'Dominguez', 'Jume', 'DNI', 49083116, '', '', 'jumedominguez@gmail.com', '2615082706', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1003, 'Ortiz ', 'Nicol', 'DNI', 45965249, '', '', 'nicolortiz2021@gmail.com.ar', '2617003875', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1004, 'Sagua', 'Brenda', 'DNI', 37779577, '', '', 'brendasagua186@gmail.com', '2613909773', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1005, 'Gui?azu Veron', 'Lucas Martin', 'DNI', 45361038, '', '', 'Lmgv2016@gmail.com', '2617086484', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0);
INSERT INTO `persona` (`idpersona`, `apellido`, `nombre`, `tipoDocumento`, `numDocumento`, `cuil`, `fechaNacimiento`, `correo`, `telefono`, `direccion`, `pais_idpais`, `provincia_idprovincia`, `localidad`, `fechaAlta`, `genero`, `tipoPersona_idtipoPersona`, `situacion`, `habilitado`) VALUES
(1006, 'Carrizo', 'Rocio del Cielo', 'DNI', 46548780, '', '', 'rociocielocarrizo18@gmail.com', '2612658212', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1007, 'Catal?n ', 'Lorena Alicia ', 'DNI', 46234778, '', '', 'lorenaagostina30@gmail.com', '2613614235', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1008, 'O?o;Alexander ', 'DNI', '45361428', 0, '', 'alex10videla@gmail.com', '2616763782', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(1009, 'Catalan ', ' Alicia Lorena', 'DNI', 33438971, '', '', 'lorenaagostina30@gmail.com', '2613614235', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1010, 'Irusta ', 'Adriana Gabriela ', 'DNI', 34675069, '', '', 'irustagabi90@gmail.com', '2617610620', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1011, 'Godoy ', 'Antonella ', 'DNI', 39677829, '', '', 'godoya471@gmail.com', '2616019857', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1012, 'Perez ', 'Brisa Michelle ', 'DNI', 43749615, '', '', 'brisamichelleperez815@gmail.com', '2616434802', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1013, 'Casanova', 'Juan Alberto ', 'DNI', 42751172, '', '', 'javgg479@gmail.com', '2613824769', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1014, 'Segovia', 'Claudia', 'DNI', 21515894, '', '', 'ccsegovia@mendoza.edu.ar', '2616670757', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1015, 'Cipollone', 'Lucas', 'DNI', 45966642, '', '', 'lucascipollone2@gmail.com', '2615374096', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1016, 'Casas Martinez', 'Mara Gianella', 'DNI', 46233614, '', '', 'maracasasmartinez1@gmail.com', '2615123403', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1017, 'guzm?n', 'juan Paulo', 'DNI', 46397724, '', '', 'juampiguzman2005@gmail.com', '2612755971', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1018, 'Tapia', 'Mar?a Eugenia', 'DNI', 39088570, '', '', 'Eugeniatapia2018@gmail.com', '2612628520', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1019, 'Merino', 'Uriel', 'DNI', 42082002, '', '', 'uriel.merino012@gmail.com', '2613457096', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1020, 'Reyes ', 'Daiana ', 'DNI', 44756983, '', '', 'daianareyes3322@gmail.com', '2613902878', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1021, 'Riveros', 'Cristina', 'DNI', 21926160, '', '', 'crisvalleriveros@gmail.com', '2615034351', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1022, 'Jofre ', 'Aymar? ', 'DNI', 46619193, '', '', 'jofreaymara85@gmail.com', '2615126649', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1023, 'Yanzon', 'Julieta Agostina ', 'DNI', 44309206, '', '', 'Yanzonjulieta804@gmail.com', '2613905959', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1024, 'Silva Rivera ', 'Nicol Shirley ', 'DNI', 44437985, '', '', 'silvanicol48@gmail.com', '2616216860', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1025, 'Jofre', 'Valeria', 'DNI', 46235521, '', '', 'valeriajofre528@gmail.com', '2616025912', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1026, 'Lujan', 'Milagros', 'DNI', 46869345, '', '', 'lujan6428@gmail.com ', '2616925447', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1027, 'Flores Cassino', 'Celina Natalia', 'DNI', 47726559, '', '', '11celinaflores@gmail.com', '2616973369', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1028, 'Quiavetta Morales ', 'Sof?a Morena ', 'DNI', 45588123, '', '', 'moramorales04@gmail.com', '2615020525', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1029, 'Alessandra', 'Carla ', 'DNI', 38759298, '', '', 'alessandracarla950@gmail.com', '2616306275', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1030, 'Oro', 'Maria de los angeles ', 'DNI', 41004775, '', '', 'oromaria0721@gmail.com', '2616041934', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1031, 'Anco', 'Lucas', 'DNI', 42478442, '', '', 'lucas.anco00@gmail.com', '2612727983', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1032, 'Nieto', ' Sergio Samuel ', 'DNI', 43941702, '', '', 'samuelnieto869@gmail.com', '2617007228', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1033, 'Martinez', 'Carla', 'DNI', 35200575, '', '', 'cm316222@gmail.com', '2613824323', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1034, 'Nieto ', 'Sergio Samuel ', 'DNI', 44941702, '', '', 'samuelnieto869@gmail.com', '2617007228', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1035, 'Garro', 'Oriana ', 'DNI', 45965353, '', '', 'milenagarro64@gmail.com', '2612737028', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1036, 'Villegas Vera', 'Claudio ', 'DNI', 33821696, '', '', 'claudiovillegas24@gmail.com', '2617155414', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1037, 'Pe?a;Macarena Idalia ', 'DNI', '43942738', 0, '', 'penamacarena27@gmail.com', '2617752483', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(1038, 'Llugany L?pez ', 'Heidi Melanie ', 'DNI', 37412626, '', '', 'melanie.llugany.1717@gmail.com', '2612629421', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1039, 'Lopez', 'Miguel Angel', 'DNI', 29281688, '', '', 'miguelopez104@gmail.com', '2616126002', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1040, 'Gadea', 'Ver?nica Noem?;DNI', '33631403', 0, '', 'gadea_v@yahoo.com', '2615023260', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(1041, 'Mancilla', 'Araceli Vanesa', 'DNI', 30820041, '', '', 'aruss0584@gmail.com', '2964469015', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1042, 'Gonzalez', 'Maira Josefa ', 'DNI', 39383249, '', '', 'gonzalezmaira317@gmail.com', '2612055188', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1043, 'Pastran ', 'Rocio', 'DNI', 44878520, '', '', 'ropastran3@gmail.com', '2612704235', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1044, 'Gonzalez', 'Lorena', 'DNI', 44058304, '', '', 'lorenagonzalez99114@gmail.com', '2617160719', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1045, 'Lucero', 'Sandra Yanet', 'DNI', 38205918, '', '', 'sandralucero494@gmail.com', '2615762507', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1046, 'Gadea', 'Ver?nica Noem?;DNI', '33631403', 0, '', 'gadea_v@yahoo.com', '261502403', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(1047, 'Reggio', 'Emanuel ', 'DNI', 42357626, '', '', 'reggio.emanuel@yahoo.com', '2613738850', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1048, 'Esper', 'Ana Luz ', 'DNI', 47079873, '', '', 'aniiesper36@gmail.com', '2615557686', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1049, 'Fornari ', 'Noem? Elisabeth ', 'DNI', 31636337, '', '', 'fornarinoemi@gmail.com', '2612063175', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1050, 'Arroyo Narvaez ', 'Paula Daniela ', 'DNI', 43119168, '', '', 'arroyopd29@gmail.com', '2615940133', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1051, 'Pecas', 'Camila Nicol', 'DNI', 44746948, '', '', 'Camilapecas@jbalberdi4026.edu.ar', '2617015818', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1052, 'Baez', 'Yanina Antonela ', 'DNI', 39081185, '', '', 'baezyanina58@gmail.com', '2615605517', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1053, 'Recio', 'Karen', 'DNI', 37270332, '', '', 'rkdenise09@gmail.com', '2616749721', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1054, 'Arias', 'Celia Viviana ', 'DNI', 20563047, '', '', 'viviana15arias@yahoo.com.ar', '2616507783', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1055, 'Arias ', 'Celia Viviana', 'DNI', 20563047, '', '', 'viviana15arias@yahoo.com.ar', '2616507783', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1056, 'Bermejo', 'Isabella', 'DNI', 43279594, '', '', 'isabellabermejo33@gmail.com', '2615051174', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1057, 'Alday', 'Ivana Aida ', 'DNI', 44746152, '', '', 'ivaaidaalday14@gmail.com', '2612358231', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1058, 'Zarate Pisarro', 'Lourdes Anabella', 'DNI', 45360913, '', '', 'anabellazarate02@gmail.com', '2615925972', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1059, 'Aramayo', 'Karen Michelle ', 'DNI', 41338984, '', '', 'karenestudios0@gmail.com', '2617744704', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1060, 'Maurino', 'Agustina ', 'DNI', 44986372, '', '', 'Agustinamaurino9@gmail.com ', '2615189043', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1061, 'Mozas', 'Romina ', 'DNI', 27062206, '', '', 'rmozas@hotmail.com', '2615357340', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1062, 'Mozas', 'Romina', 'DNI', 27062206, '', '', 'rmozas@hotmail.com', '2615357340', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1063, 'Ag?ero ', 'Selene Nicol ', 'DNI', 45965371, '', '', 'selenenicolaa@gmail.com', '2613894759', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1064, 'Bergas ', 'Mauricio Esteban ', 'DNI', 35908638, '', '', 'meb140491@gmail.com', '2613463009', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1065, 'Zagaglia ', 'D?borah Beatriz ', 'DNI', 32510730, '', '', 'deborahbzagaglia@gmail.com', '2613024781', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1066, 'Arancibia ', 'Ignacio Nahuel ', 'DNI', 46161716, '', '', 'nahuelaran3@gmail.com', '2612633390', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1067, 'Silva', 'Iv?n ', 'DNI', 42669466, '', '', 'ivansilvaok@gmail.com', '2612629617', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1068, 'Jurado', 'ALEX', 'DNI', 45360981, '', '', 'alex45360981@gmail.com', '2612066678', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1069, 'Mozas', 'Romina', 'DNI', 27062206, '', '', 'rmozas@hotmail.com', '2615357340', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1070, 'Robles', 'Yanil', 'DNI', 45257567, '', '', 'yanilrobles392@gmail.com', '2616999190', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1071, 'Robles', 'Yanil', 'DNI', 45257567, '', '', 'yanilrobles392@gmail.com', '2616999190', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1072, 'Rodr?guez', 'Melanie Magali', 'DNI', 44905633, '', '', 'maguirodrig123@gmail.com', '2634781124', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1073, 'Luj?n', 'Claudia Eliana', 'DNI', 26386352, '', '', 'elianalujan33@gmail.com', '2612657229', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1074, 'Flores Cassino', 'Celina Natalia', 'DNI', 47726559, '', '', '11celinaflores@gmail.com', '2616973369', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1075, 'Terrero', 'Maximiliano', 'DNI', 46397730, '', '', 'terreromaxi10@gmail.com', '2612302153', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1076, 'Avila', 'Axel ', 'DNI', 46397320, '', '', 'ja052641@gmail.com', '2616074677', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1077, 'Blanco', 'Alam', 'DNI', 46235502, '', '', 'alamblanco18@gmail.com', '2612575959', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1078, 'Mamani ', 'Elian ', 'DNI', 44058898, '', '', 'nahuelvedia33@gmail.com', '2612316632', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1079, 'Avila', 'Axel', 'DNI', 46397320, '', '', 'ja052641@gmail.com', '2616074677', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1080, 'Carmona', 'Clara', 'DNI', 48543347, '', '', 'claritacarmona720@gmail.com', '2612304934', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1081, 'Villegas ', 'Lucia', 'DNI', 42478445, '', '', 'luciavillegas467@gmail.com', '2617028924', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1082, 'Domizi', 'Gisella Ayelen ', 'DNI', 43943106, '', '', 'giselladomizi72@gmail.com', '2613052664', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1083, 'Verna', 'B?rbara ', 'DNI', 40561281, '', '', 'babiverna22@gmail.com', '2615013608', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1084, 'Gonzalez ', 'Paula Camila ', 'DNI', 42357634, '', '', 'pgonzalez.2019.p@gmail.com', '2617166834', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1085, 'Gonzalez', 'Daniela', 'DNI', 43749033, '', '', 'danielagonzalez.2001.15@gmail.com', '2616979066', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1086, 'Gonzalez ', 'Rocio ', 'DNI', 43151576, '', '', 'rg462643@gmail.com', '2613604764', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1087, 'S?nchez', 'Cristian David ', 'DNI', 23712089, '', '', 'cristiansanchezdemendoza@gmail.com', '2615790565', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1088, 'Llanos Ibarra ', 'Romina Antonela ', 'DNI', 44309203, '', '', 'rominallanosz.com.ar@gmail.com', '2617462134', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1089, 'Perez', 'Martina ', 'DNI', 45967030, '', '', 'perezmartina509@gmail.com', '2617544606', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1090, 'Rojas', 'Cibels ', 'DNI', 44438805, '', '', 'rojascibels3009@gmail.com', '2616268072', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1091, 'Angulo ', 'Jesus ', 'DNI', 45023466, '', '', 'angulojesus1975@gmail.com', '2615456092', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1092, 'Mendoza ', 'Clarisa Macarena ', 'DNI', 41645289, '', '', 'clarimaca15@gmail.com ', '2615026859', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1093, 'R?os', 'Fernando Ariel', 'DNI', 24317286, '', '', 'riosfernando@ymail.com', '2616663351', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1094, 'Bustos', 'Andrea ', 'DNI', 40371910, '', '', 'bustosandrea73@gmail.com', '2613398963', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1095, 'Oviedo ', 'Laura Ayel?n ', 'DNI', 42669490, '', '', 'ayeeoviiedo19@Gmail.com', '2612658583', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1096, 'Asevedo', 'Brisa', 'DNI', 44904078, '', '', 'brisaarmy104@gmail.com', '2616502087', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1097, 'Romera', 'Anal?a', 'DNI', 30920621, '', '', 'analiaromera.mza@gmail.com', '2078522', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1098, 'Villafa?e;Maria', 'DNI', '39086074', 0, '', 'Villafanevale13@gmail.com', '2616672565', '', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', NULL),
(1099, 'JANCO', 'Matias Arnaldo', 'DNI', 43543473, '', '', 'matiasjanco805@gmail.com', '2617114173', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1100, 'Perez', 'Gimena Andrea', 'DNI', 35546014, '', '', 'gimeperez1991@gmail.com', '2614169237', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1101, 'Alcaraz ', 'Mauro', 'DNI', 46869337, '', '', 'alcarazmauro67@gmail.com', '2617582519', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1102, 'Contrera', 'Dalma', 'DNI', 40788037, '', '', 'dalmarociocontrera97@gmail.com', '2616995397', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1103, 'Scacciante ', 'Sabrina Alejandra ', 'DNI', 43683456, '', '', 'sabrinascacciante10@gmail.com', '2615564848', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1104, 'Antequera', 'Agustina', 'DNI', 43117535, '', '', 'antequeraagustina@gmail.com', '2615160808', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1105, 'Antequera', 'Agustina', 'DNI', 43117535, '', '', 'antequeraagustina@gmail.com', '2615160808', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1106, 'Almaz?n Marquez', 'Anabela Rosal? ', 'DNI', 46475105, '', '', 'anabelacnco@gmail.com', '2613426554', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1107, 'Amaya', 'Agostina', 'DNI', 45530755, '', '', 'agostinaamaya932@gmail.com', '2615771900', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1108, 'Oro', 'Paloma', 'DNI', 45720398, '', '', 'palomaoro01@gmail.com', '261602282', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1109, 'Aldaya', 'Agust?n', 'DNI', 45361034, '', '', 'aldaya4536@gmail.com', '2617071796', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1110, 'Zapata', 'Maria Rosa', 'DNI', 46233615, '', '', 'zapatamariarosa2005@gmail.com', '2612639010', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1111, 'Balvoa ', 'Carla', 'DNI', 42403389, '', '', 'balvoacarla@gmail.com', '2615195239', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1112, 'Ruiz', 'Franco Emanuel', 'DNI', 46234276, '', '', 'francoruiz05g@gmail.com', '2616219734', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1113, 'Mendoza Ayarachi ', 'Mar?a Ester ', 'DNI', 33967781, '', '', 'maryamdz88@gmail.com', '2616708638', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1114, 'Ligorria ', 'Nicole Abigail ', 'DNI', 47372356, '', '', 'ligorrianicole58@gmail.com', '2616684155', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1115, 'Gonzalez', 'Antonela', 'DNI', 43749724, '', '', 'antonelagonzalezj11@gmail.com ', '2612748200', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1116, 'Esmoris ', 'Ana ', 'DNI', 95972445, '', '', 'anamariaesmorisjitar1997@gmail.com', '2612715121', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1117, 'Romero ', 'Ismael ', 'DNI', 95614651, '', '', 'ismaeltromero1999@gmail.com', '2617009755', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1118, 'Gui?az?', 'Gast?n ', 'DNI', 45360987, '', '', 'guinazugaston1@gmail.com', '2616396042', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1119, 'Palma Fernandez ', 'Irina Yanela ', 'DNI', 42912546, '', '', 'irinayanela52@gmail.com', '2617576954', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1120, 'Rivera', 'Roc?o ', 'DNI', 42751200, '', '', 'rociirivera00@gmail.com', '2613617281', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1121, 'gimenez', 'fernando', 'DNI', 43681417, '', '', 'fernandogimenez707@gmail.com', '2616633196', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1122, 'Tayura ', 'Priscila ', 'DNI', 42712762, '', '', 'priscilatayura@gmail.com', '2612645654', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1123, 'Jimenez', 'Janet Marianela', 'DNI', 39381940, '', '', 'Jannijimenez13@gmail.com', '2612402016', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1124, 'Quiroga', 'Luciano', 'DNI', 45720389, '', '', 'lucianoquiroga07@gmail.com', '2616997917', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1125, 'Llugany L?pez ', 'Heidi Melanie ', 'DNI', 37412626, '', '', 'melanie.llugany.1717@gmail.com', '2612629421', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1126, 'Ca?a Perez', 'Valentin', 'DNI', 46869278, '', '', '404valem@gmail.com', '2612055152', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1127, 'Mayorga', 'Martin', 'DNI', 45360923, '', '', 'mayorgamartin102@gmail.com', '2617041466', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1128, 'Molina Arancibia ', 'Naomi Abril', 'DNI', 44878502, '', '', 'molinaarancibianaomi@gmail.com', '2612075704', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1129, 'Moreno ', 'Marianela ', 'DNI', 43941661, '', '', 'marianelaalexandramoreno@gmail.com', '261718489', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1130, 'Fernandez', 'Romina Natalia', 'DNI', 44537694, '', '', 'Rominafernandez510@gmail.com', '2615889943', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1131, 'Alaniz', 'Javier Andr?s', 'DNI', 44756904, '', '', 'javieroficialok@gmail.com', '2616880108', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1132, 'Cipollone ', 'Lucas', 'DNI', 45966642, '', '', 'lucascipollone2@gmail.com', '2615374096', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1133, 'Caba?ez ', 'Selene Nicole ', 'DNI', 45965382, '', '', 'cabanezselene82@gmail.com', '2612653309', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1134, 'Santoni ', 'Gianella ', 'DNI', 45529796, '', '', 'gianellasantoni22@gmail.com', '261645525', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1135, 'Ruiz', 'Sofia Mercedes', 'DNI', 45023530, '', '', 'Sofiruiz4502@gmail.com', '2615511005', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1136, 'Irrutia ', 'Gabriela Jaquelina ', 'DNI', 30116097, '', '', 'irrutiajaquelina@gmail.com', '2617500977', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1137, 'Mayorga', 'Evangelina ', 'DNI', 31452160, '', '', 'mayorgaevangelina9@gmail.com', '2616257646', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1138, 'Antequera', 'Mar?a Jos?  ', 'DNI', 44820885, '', '', 'mariantequera39@gmail.com', '2615183762', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1139, 'Heredia', 'Melanie Sofia ', 'DNI', 44746186, '', '', 'melaniesofi759@gmail.com', '2615131934', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1140, 'Ag?ero', 'Angeles', 'DNI', 44531243, '', '', 'angelesaguero200@gmail.com', '2616596817', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1141, 'Morales', 'Ivo', 'DNI', 42669456, '', '', 'Moralesivo83@gmail.com', '2612083550', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1142, 'Diaz Soliz ', 'Edhy Marysol ', 'DNI', 94358418, '', '', 'edhydiaz37@gmail.com', '2612311017', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1143, 'Diaz', 'Jaqueline mailen', 'DNI', 40561206, '', '', 'maii.diaz.39@gmail.com', '261623320', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1144, 'Cruz', 'Alvaro ', 'DNI', 93999716, '', '', 'alvarocruz30217@gmail.com', '2616382674', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1145, 'Guzm?n ', 'Juan Manuel ', 'DNI', 47079818, '', '', 'juanmanuelguzman947@gmail.com', '2616660219', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1146, 'Mendoza ', 'Noemi cristina ', 'DNI', 46869255, '', '', 'mendozacristina234@gmail.com', '3875288621', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1147, 'Salavagui?n Espirito', 'Carla Abril ', 'DNI', 46474779, '', '', 'carlitasalavaguion750@gmail.com', '2615003292', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1148, 'Zanetti', 'Maria Ester', 'DNI', 45023423, '', '', 'mariia.zanetti5@gmail.com', '2616250552', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1149, 'Mendez Godoy', 'Andrea', 'DNI', 41644007, '', '', 'mendezgodoyandrea@gmail.com', '2634560489', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1150, 'P?rez ', 'Tania Michelle', 'DNI', 46163492, '', '', 'taniamichelle118@gmail.com', '2613864897', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1151, 'Vonkunoschy', 'Enzo Adrian', 'DNI', 20112421, '', '', 'enzovonkunoschy@gmail.com', '2612443928', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1152, 'Navarra', 'Mariana Analia', 'DNI', 27983068, '', '', 'naninavarra@yahoo.com.ar', '2615263057', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1153, 'ALLAY', 'GUSTA', 'DNI', 18297838, '', '', 'allgus02@gmail.com', '2613058503', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1154, 'Sullca ', 'Rocio Ana ', 'DNI', 42167547, '', '', 'rocioanasullca@gmail.com', '2617023584', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1155, 'Gonzalez', 'Julieta', 'DNI', 41004784, '', '', 'julyterapista@gmail.com', '2617544628', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1156, 'Banno', 'Rub?n Antonio ', 'DNI', 34063091, '', '', 'banex_22@hotmail.com', '2615401723', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1157, 'Motos Romera', 'Nahuel Axel', 'DNI', 44820627, '', '', 'nahuelaxelmotosromera@gmail.com', '2616317187', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1158, 'Martinez ', 'Luc?a victoria ', 'DNI', 45360965, '', '', 'martinezluciavictoria1899@gmail.com ', '2617031002', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1159, 'Sullca', 'Roc?o Ana ', 'DNI', 42167547, '', '', 'rocioanasullca@gmail.com', '2617023584', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1160, 'Flores', 'Milagros ', 'DNI', 45023539, '', '', 'miluflorez027@gmail.com', '2615050793', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1161, 'Herrera ', 'Franco ', 'DNI', 39381925, '', '', 'enanobj00@gmail.com', '2617013997', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1162, 'Morales', 'Jerem?as ', 'DNI', 46548723, '', '', 'moralesjeremias384@gmail.com', '2617617097', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1163, 'Villegas ', 'Milagros antonella ', 'DNI', 41418140, '', '', 'antonellavillegas98@gmail.com', '2617004067', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1164, 'Estefan?a Morales', 'Sandra', 'DNI', 39239296, '', '', 'estefivilma@gmail.com', '2616983386', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1165, 'Garay', 'Matias ', 'DNI', 43417656, '', '', 'matymgcgaray@gmail.com', '2613649842', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1166, 'Mendoza Ayarachi ', 'Jannetteh ', 'DNI', 93097426, '', '', 'jm2022mdz@gmail.com', '2616356363', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1167, 'Alonso', 'Andrea', 'DNI', 28340011, '', '', 'andreaalonsocarboni@gmail.com', '2616575269', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1168, 'Ag?ero', 'Angeles', 'DNI', 44531243, '', '', 'angelesaguero200@gmail.com', '2616596817', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1169, 'Cayo', 'Noemi Sabrina ', 'DNI', 42169189, '', '', 'sabrinacayo62@gmail.com', '2613826981', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1170, 'Miranda ', 'Delfina', 'DNI', 47195011, '', '', 'delfinamiranda_07@hotmail.com', '2612054488', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1171, 'Cortez', 'Gonzalo', 'DNI', 46327199, '', '', 'gonzacortez057@gmail.com', '2613831026', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1172, 'Cortez', 'Gonzalo', 'DNI', 46328199, '', '', 'gonzacortez057@gmail.com', '2613831026', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1173, 'Farruggia', 'Agust?n ', 'DNI', 46235577, '', '', 'agua345farru@gmail.com', '2617043328', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1174, 'Mercado ', 'Magali Evelyn ', 'DNI', 41369349, '', '', 'maga10mercado@gmail.com', '616571457', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1175, 'Robles', 'Yanil', 'DNI', 45257567, '', '', 'roblesyanil76@gmail.com', '2616999190', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1176, 'Diaz', 'Luca', 'DNI', 41418139, '', '', 'Lucahysmigueldiazmacacaro@gmail.com', '2616650842', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1177, 'Anconetani ', 'Graciela Sonia ', 'DNI', 24085319, '', '', 'ganconetani@mendoza.edu.ar', '2616299666', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1178, 'Nu?ez', 'Ailen ', 'DNI', 45875781, '', '', 'nunezailen888@gmail.com', '2613631183', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1179, 'Albertti ', 'Ricardo Martin ', 'DNI', 44756917, '', '', 'martin.albertti.2003@gmail.com', '2616045543', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1180, 'Nu?ez', 'Ailen', 'DNI', 45875781, '', '', 'ailen888@gmail.com', '2613631183', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1181, 'Gatica', 'Abril Aldana ', 'DNI', 44905015, '', '', 'abrilgatica44@gmail.com ', '2613067693', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1182, 'Mercado ', 'Ramiro ', 'DNI', 45448796, '', '', 'rodrimercadomartin@gmail.com', '2616182922', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1183, 'Mercado ', 'Ramiro ', 'DNI', 45448796, '', '', 'rodrimercadomartin@gmail.com', '2616182922', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1184, 'Gimenez', 'Steven', 'DNI', 48012683, '', '', 'stevengimenez1@gmail.com', '2615181751', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1185, 'Rojas', 'Maria Elena', 'DNI', 94222013, '', '', 'marielene975jkm@gmail.com', '2616375320', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1186, 'Pelaytay Rosales ', 'Uriel Pablo ', 'DNI', 46163392, '', '', 'uripelaytay05@gmail.com', '2612443960', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1187, 'Quiroga', 'Mauricio Alejandro', 'DNI', 40823068, '', '', 'mauriquiroga97@gmail.com', '2612708119', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0),
(1188, 'Pelaytay Rosales ', 'Uriel Pablo ', 'DNI', 46163392, '', '', 'uripelaytay05@gmail.com', '2612443960', '', 0, 0, '', '0000-00-00 00:00:00', '', 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `idprovincia` int(11) NOT NULL,
  `nombreProvincia` varchar(45) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`idprovincia`, `nombreProvincia`, `habilitado`) VALUES
(3, 'Mendoza', 1),
(4, 'Mendoza(Mas de 50km de Lavalle)', 1),
(5, 'San Juan', 1),
(6, 'San Luis', 1),
(7, 'Catamarca', 1),
(8, 'Córdoba', 1),
(9, 'Chaco', 1),
(10, 'Chubut', 1),
(11, 'Corrientes', 1),
(12, 'Buenos Aires', 1),
(13, 'Entre Ríos', 1),
(14, 'Formosa', 1),
(15, 'Jujuy', 1),
(16, 'La Pampa', 1),
(17, 'La Rioja', 1),
(18, 'Misiones', 1),
(19, 'Neuquén', 1),
(20, 'Río Negro', 1),
(21, 'Salta', 1),
(22, 'Santa Cruz', 1),
(23, 'Santa Fe', 1),
(24, 'Santiago del Estero', 1),
(25, 'Tierra del Fuego', 1),
(26, 'Tucumán', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

CREATE TABLE `recibo` (
  `idrecibo` int(11) NOT NULL,
  `fechaRecibo` datetime DEFAULT NULL,
  `numCuota` int(11) DEFAULT NULL,
  `metodoPago` varchar(45) DEFAULT NULL,
  `montoPagado` decimal(10,2) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL,
  `formapago_idformapago` int(11) DEFAULT NULL,
  `comprobante` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`comprobante`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resolucion`
--

CREATE TABLE `resolucion` (
  `idresolucion` int(11) NOT NULL,
  `nombreRes` varchar(45) DEFAULT NULL,
  `numResolucion` varchar(100) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL,
  `planEstudio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`planEstudio`)),
  `archivo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`archivo`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resolucion`
--

INSERT INTO `resolucion` (`idresolucion`, `nombreRes`, `numResolucion`, `habilitado`, `planEstudio`, `archivo`) VALUES
(1, 'Res-01', '01', 1, NULL, NULL),
(3, 'Res-02', '02', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipofacultad`
--

CREATE TABLE `tipofacultad` (
  `idtipoFacultad` int(11) NOT NULL,
  `tipoFacultad` varchar(45) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL,
  `inscripcion` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipofacultad`
--

INSERT INTO `tipofacultad` (`idtipoFacultad`, `tipoFacultad`, `habilitado`, `inscripcion`) VALUES
(4, 'Tecnicaturas', 1, 1),
(5, 'Formación Continua', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersona`
--

CREATE TABLE `tipopersona` (
  `idtipoPersona` int(11) NOT NULL,
  `tipoPersona` varchar(45) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipopersona`
--

INSERT INTO `tipopersona` (`idtipoPersona`, `tipoPersona`, `habilitado`) VALUES
(3, 'Administrativo', 1),
(4, 'Docente', 1),
(5, 'Estudiante', 1),
(6, 'Secretario', 1),
(7, 'Celador', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`idaula`),
  ADD UNIQUE KEY `aula_idaula` (`idaula`);

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`idconcepto`);

--
-- Indices de la tabla `documentacion`
--
ALTER TABLE `documentacion`
  ADD PRIMARY KEY (`iddocumentacion`);

--
-- Indices de la tabla `estadoalumno`
--
ALTER TABLE `estadoalumno`
  ADD PRIMARY KEY (`idestadoAlumno`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`idfacultad`),
  ADD KEY `tipoFacultad_idtipoFacultad` (`tipoFacultad_idtipoFacultad`),
  ADD KEY `resolucion_idresolucion` (`resolucion_idresolucion`);

--
-- Indices de la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD PRIMARY KEY (`idformapago`),
  ADD KEY `persona_idpersona` (`persona_idpersona`),
  ADD KEY `importe_idimporte` (`importe_idimporte`);

--
-- Indices de la tabla `importe`
--
ALTER TABLE `importe`
  ADD PRIMARY KEY (`idimporte`),
  ADD KEY `concepto_idconcepto` (`concepto_idconcepto`),
  ADD KEY `tipoFacultad_idtipoFacultad` (`tipoFacultad_idtipoFacultad`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`idinscripcion`),
  ADD KEY `persona_idpersona` (`persona_idpersona`),
  ADD KEY `fk_inscripcion_facultad1_idx` (`facultad_idfacultad`),
  ADD KEY `fk_inscripcion_estadoalumno1_idx` (`estadoalumno_idestadoAlumno`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idmateria`),
  ADD KEY `materia_persona_fk` (`persona_idpersona`),
  ADD KEY `materia_facultad_fk` (`facultad_idfacultad`),
  ADD KEY `materia_aula_fk` (`aula_idaula`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idpais`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`idprovincia`);

--
-- Indices de la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`idrecibo`),
  ADD KEY `formapago_idformapago` (`formapago_idformapago`);

--
-- Indices de la tabla `resolucion`
--
ALTER TABLE `resolucion`
  ADD PRIMARY KEY (`idresolucion`);

--
-- Indices de la tabla `tipofacultad`
--
ALTER TABLE `tipofacultad`
  ADD PRIMARY KEY (`idtipoFacultad`);

--
-- Indices de la tabla `tipopersona`
--
ALTER TABLE `tipopersona`
  ADD PRIMARY KEY (`idtipoPersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `idaula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `idconcepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `documentacion`
--
ALTER TABLE `documentacion`
  MODIFY `iddocumentacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadoalumno`
--
ALTER TABLE `estadoalumno`
  MODIFY `idestadoAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `idfacultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `formapago`
--
ALTER TABLE `formapago`
  MODIFY `idformapago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `importe`
--
ALTER TABLE `importe`
  MODIFY `idimporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `idinscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `idpais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1376;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `recibo`
--
ALTER TABLE `recibo`
  MODIFY `idrecibo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resolucion`
--
ALTER TABLE `resolucion`
  MODIFY `idresolucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipofacultad`
--
ALTER TABLE `tipofacultad`
  MODIFY `idtipoFacultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipopersona`
--
ALTER TABLE `tipopersona`
  MODIFY `idtipoPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `facultad_ibfk_1` FOREIGN KEY (`tipoFacultad_idtipoFacultad`) REFERENCES `tipofacultad` (`idtipoFacultad`),
  ADD CONSTRAINT `facultad_ibfk_2` FOREIGN KEY (`resolucion_idresolucion`) REFERENCES `resolucion` (`idresolucion`);

--
-- Filtros para la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD CONSTRAINT `formapago_ibfk_1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `formapago_ibfk_2` FOREIGN KEY (`importe_idimporte`) REFERENCES `importe` (`idimporte`);

--
-- Filtros para la tabla `importe`
--
ALTER TABLE `importe`
  ADD CONSTRAINT `importe_ibfk_1` FOREIGN KEY (`concepto_idconcepto`) REFERENCES `concepto` (`idconcepto`),
  ADD CONSTRAINT `importe_ibfk_2` FOREIGN KEY (`tipoFacultad_idtipoFacultad`) REFERENCES `tipofacultad` (`idtipoFacultad`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_inscripcion_estadoalumno1` FOREIGN KEY (`estadoalumno_idestadoAlumno`) REFERENCES `estadoalumno` (`idestadoAlumno`),
  ADD CONSTRAINT `fk_inscripcion_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`),
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_aula_fk` FOREIGN KEY (`aula_idaula`) REFERENCES `aula` (`idaula`),
  ADD CONSTRAINT `materia_facultad_fk` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`),
  ADD CONSTRAINT `materia_persona_fk` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`);

--
-- Filtros para la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `recibo_ibfk_1` FOREIGN KEY (`formapago_idformapago`) REFERENCES `formapago` (`idformapago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
