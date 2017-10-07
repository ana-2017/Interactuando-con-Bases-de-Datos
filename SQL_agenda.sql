

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Base de datos: `agenda`

-- Estructura de tabla para la tabla `eventos`

CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_fin` time NOT NULL,
  `dia_completo` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcado de datos para la tabla `eventos`

INSERT INTO `eventos` (`id`, `usuario`, `titulo`, `fecha_inicio`, `hora_inicio`, `fecha_fin`, `hora_fin`, `dia_completo`, `fecha_creado`) VALUES
(1, 1, 'Mi primer registro', '2017-06-05', '07:00:00', '2017-06-07', '11:00:00', 0, '2017-10-07 20:45:48'),
(2, 1, 'Mi segundo registro', '2017-06-05', '01:00:00', '2017-06-11', '05:00:00', 0, '2017-10-07 05:11:07'),
(4, 1, 'Nuevo desde We', '2017-06-05', '05:30:00', '2017-06-07', '06:00:00', 0, '2017-10-07 16:03:27');

-- Estructura de tabla para la tabla `usuarios`

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_completo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` enum('A','I') COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcado de datos para la tabla `usuarios`

INSERT INTO `usuarios` (`id`, `correo`, `clave`, `nombre_completo`, `fecha_nacimiento`, `estado`, `fecha_creado`) VALUES
(1, 'analuisacaoch7@gmil.com', 'ututg455748hug57iuug68y', 'Analuisa Arenas', '1979-01-5', 'A', '2017-10-07 15:40:13');

-- Índices para tablas volcadas

-- Indices de la tabla `eventos`

ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventos_usuario` (`usuario`);

-- Indices de la tabla `usuarios`

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT de las tablas volcadas

-- AUTO_INCREMENT de la tabla `eventos`

ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;

-- AUTO_INCREMENT de la tabla `usuarios`

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;

-- Restricciones para tablas volcadas

-- Filtros para la tabla `eventos`

ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
