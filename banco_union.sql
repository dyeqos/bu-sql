-- --------------------------------------------------------

--
-- Base de datos: `banco_union`
-- CREATE DATABASE BANCO_UNION;
-- USE BANCO_UNION;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRES` varchar(50) NOT NULL,
  `PATERNO` varchar(50) DEFAULT NULL,
  `MATERNO` varchar(50) DEFAULT NULL,
  `TIPO_DOCUMENTO` int(11) NOT NULL,
  `DOCUMENTO_IDENTIDAD` varchar(15) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `GENERO` char(1) NOT NULL,
  `AUD_ESTADO` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_CLIENTE`, `NOMBRES`, `PATERNO`, `MATERNO`, `TIPO_DOCUMENTO`, `DOCUMENTO_IDENTIDAD`, `FECHA_NACIMIENTO`, `GENERO`, `AUD_ESTADO`) VALUES
(1, 'DIEGO', 'PAT5', 'MAT5', 1, '123456', '2015-10-10', 'F', 3),
(2, 'NOM2', 'PAT2', 'MAT2', 1, '123456', '2010-10-10', 'F', 3),
(3, 'NOM3', 'PAT3', 'MAT2', 1, '123456', '2010-10-10', 'F', 3),
(4, 'DIEGO MIJAIL', 'CALVI', 'LUNA', 1, '6769227', '1991-10-28', 'M', 2),
(5, 'CINCO', 'PAT3', 'MAT2', 1, '123456', '2010-10-10', 'M', 3),
(6, 'NOM5', 'PAT3', 'MAT2', 1, '123456', '2010-10-10', 'F', 3),
(7, 'NOM5', 'PAT3', 'MAT2', 1, '123456', '2010-10-10', 'F', 3),
(8, 'NOM5', 'PAT3', 'MAT2', 1, '123456', '2010-10-10', 'F', 3),
(9, 'NOM5', 'PAT3', 'MAT2', 1, '123456', '2010-10-10', 'F', 3),
(10, 'NOM5', 'PAT3', 'MAT2', 1, '123456', '2010-10-10', 'F', 3),
(11, 'HI123', '123', 'ASDFAF', 1, '213123', '2022-04-13', 'F', 3),
(12, 'ADSF', 'ASDF', 'ASDF', 2, '234234', '2022-03-30', 'F', 3),
(13, 'ASDFAFD', 'asdfasdf', 'null', 2, '123123', '2022-04-07', 'M', 3),
(14, 'DDDD', 'aaaa', '', 2, '123123', '2022-04-06', 'M', 3),
(15, 'OTRO', 'EJEMPLO', '', 2, '123123', '2022-04-08', 'M', 3),
(16, 'ASDF', 'asdf', '', 2, '123123123', '2022-04-07', 'M', 3),
(17, 'AADFAF', 'ASFASF', '', 1, '12312312', '2022-04-01', 'M', 3),
(18, 'ASDF', 'ASDF', '', 2, '123123', '2022-03-31', 'F', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `ID_CUENTA` int(11) NOT NULL,
  `TIPO_PRODUCTO` int(11) NOT NULL,
  `NUMERO_CUENTA` int(11) NOT NULL,
  `MONEDA` int(11) NOT NULL,
  `MONTO` decimal(11,2) NOT NULL,
  `FECHA_CREACION` datetime NOT NULL,
  `SUCURSAL` int(11) NOT NULL,
  `CLIENTE_ID` int(11) NOT NULL,
  `AUD_ESTADO` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`ID_CUENTA`, `TIPO_PRODUCTO`, `NUMERO_CUENTA`, `MONEDA`, `MONTO`, `FECHA_CREACION`, `SUCURSAL`, `CLIENTE_ID`, `AUD_ESTADO`) VALUES
(1, 4, 10000002, 5, '1500.00', '2015-10-01 00:00:00', 7, 4, 3),
(2, 3, 10000001, 6, '1500.00', '2015-10-01 00:00:00', 8, 4, 1),
(3, 3, 123, 5, '123.00', '2022-04-15 00:00:00', 8, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `ID_PARAMETRO` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `TIPO` varchar(30) NOT NULL,
  `OBSERVACION` varchar(50) DEFAULT NULL,
  `AUD_ESTADO` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`ID_PARAMETRO`, `NOMBRE`, `TIPO`, `OBSERVACION`, `AUD_ESTADO`) VALUES
(1, 'CARNET', 'TIPO_DOCUMENTO', '', 1),
(2, 'PASAPORTE', 'TIPO_DOCUMENTO', '', 1),
(3, 'CAJA DE AHORRO', 'TIPO_PRODUCTO', '', 1),
(4, 'CUENTA CORRIENTE', 'TIPO_PRODUCTO', '', 1),
(5, 'BS', 'MONEDA', 'BOLIVIANOS', 1),
(6, 'US', 'MONEDA', 'DOLARES AMERICANOS', 1),
(7, 'LA PAZ', 'SUCURSAL', '', 1),
(8, 'COCHABAMBA', 'SUCURSAL', '', 1),
(9, 'SANTA CRUZ', 'SUCURSAL', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`ID_CUENTA`),
  ADD KEY `FK_CUENTAS_CLIENTE` (`CLIENTE_ID`),
  ADD KEY `FK_CUENTAS_PRODUCTO` (`TIPO_PRODUCTO`),
  ADD KEY `FK_CUENTAS_MONEDA` (`MONEDA`),
  ADD KEY `FK_CUENTAS_SUCURSAL` (`SUCURSAL`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`ID_PARAMETRO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `ID_CUENTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `ID_PARAMETRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `FK_CUENTAS_CLIENTE` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `clientes` (`ID_CLIENTE`),
  ADD CONSTRAINT `FK_CUENTAS_MONEDA` FOREIGN KEY (`MONEDA`) REFERENCES `parametros` (`ID_PARAMETRO`),
  ADD CONSTRAINT `FK_CUENTAS_PRODUCTO` FOREIGN KEY (`TIPO_PRODUCTO`) REFERENCES `parametros` (`ID_PARAMETRO`),
  ADD CONSTRAINT `FK_CUENTAS_SUCURSAL` FOREIGN KEY (`SUCURSAL`) REFERENCES `parametros` (`ID_PARAMETRO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
