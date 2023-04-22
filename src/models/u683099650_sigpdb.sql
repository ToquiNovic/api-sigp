--
-- Estructura de tabla para la tabla `PERSONA`
--

CREATE TABLE `PERSONA` (
  `PERS_ID_PERSONA` int(11) NOT NULL,
  `PERS_DNI` int(11) NOT NULL,
  `PERS_NOMBRE1` varchar(50) NOT NULL,
  `PERS_NOMBRE2` varchar(50)  DEFAULT NULL,
  `PERS_APELLIDO1` varchar(60) NOT NULL,
  `PERS_APELLIDO2` varchar(60) DEFAULT NULL,
  `PERS_GENERO` varchar(20) NOT NULL,
  `PERS_CORREO` varchar(150) NOT NULL,
  `USUR_ID_USUARIO` int(11) NOT NULL,
  `TIID_ID_TIPOID` int(11) NOT NULL
);

--
-- Volcado de datos para la tabla `PERSONA`
--

INSERT INTO `PERSONA` (`PERS_ID_PERSONA`, `PERS_DNI`, `PERS_NOMBRE1`, `PERS_NOMBRE2`, `PERS_APELLIDO1`, `PERS_APELLIDO2`, `PERS_GENERO`, `PERS_CORREO`, `USUR_ID_USUARIO`, `TIID_ID_TIPOID`) VALUES
(1, 1006458608, 'JOSE', 'DANIEL', 'TOQUICA', 'AGUDELO', '', 'J.TOQUICA@UDLA.EDU.CO', 1, 1),
(2, 1117552739, 'YERSON', 'ARLEY', 'CENON', 'CABRERA', '', 'y.cenon@udla.edu.co', 2, 0),
(3, 1117531976, 'DAIRO', NULL, 'GARCIA', NULL, '', '', 3, 0),
(4, 1003480546, 'ANGIE', 'ALEXANDRA', 'ORTIZ', 'PALACIOS', '', 'angie.ortiz@udla.edu.co', 4, 0),
(5, 0, 'FALCAO', NULL, 'GARCIA', NULL, '', '', 1, 0);

--
-- Estructura de tabla para la tabla `ROL`
--

CREATE TABLE `ROL` (
  `ROLL_ID_ROL` int(11) NOT NULL,
  `ROLL_NOMBREROL` varchar(50) NOT NULL
);

--
-- Volcado de datos para la tabla `ROL`
--

INSERT INTO `ROL` (`ROLL_ID_ROL`, `ROLL_NOMBREROL`) VALUES
(1, 'ESTUDIANTE'),
(2, 'ADMINISTRATIVO'),
(3, 'DOCENTE'),
(4, 'EGRESADO'),
(5, 'Encargado'),
(6, 'AUXILIAR');

--
-- Estructura de tabla para la tabla `TIPOIDENTIFICACION`
--

CREATE TABLE `TIPOIDENTIFICACION` (
  `TIID_ID_TIPOID` int(11) NOT NULL,
  `TIID_NOMBRE_TIPOID` varchar(50) NOT NULL
);

--
-- Volcado de datos para la tabla `TIPOIDENTIFICACION`
--

INSERT INTO `TIPOIDENTIFICACION` (`TIID_ID_TIPOID`, `TIID_NOMBRE_TIPOID`) VALUES
(1, 'Cédula de Ciudadanía'),
(2, 'Tarjeta de Identidad'),
(3, 'Cédula de Extranjería'),
(4, 'Registro Civil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `USUR_ID_USUARIO` int(11) NOT NULL,
  `USUR_NICKNAME` varchar(100) NOT NULL,
  `USUR_PASSWORD` varchar(100) NOT NULL,
  `ROLL_ID_ROL` int(11) NOT NULL
);

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`USUR_ID_USUARIO`, `USUR_NICKNAME`, `USUR_PASSWORD`, `ROLL_ID_ROL`) VALUES
(1, 'J.TOQUICA', '12345', 1),
(2, 'Y.CENON', '12345', 2),
(3, 'D.GARCIA', '12345', 3),
(4, 'A.ORTIZ', '12345', 4),
(5, 'F.GARCIA', '12345', 1),
(1, 'J.TOQUICA', '12345', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `PERSONA`
--
ALTER TABLE `PERSONA`
  ADD PRIMARY KEY (`PERS_ID_PERSONA`);
