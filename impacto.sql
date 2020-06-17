-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2020 a las 22:20:18
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `impacto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adelantos`
--

CREATE TABLE `adelantos` (
  `id_adelanto` int(11) NOT NULL,
  `monto_adelanto` int(11) NOT NULL,
  `fecha_adelanto` date NOT NULL,
  `funcionarios_id_func` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` int(11) NOT NULL,
  `tabla_auditoria` varchar(45) NOT NULL,
  `descripcion_audirotia` varchar(300) NOT NULL,
  `accion_auditoria` varchar(45) NOT NULL,
  `fecha_auditoria` datetime NOT NULL,
  `usuario_auditoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL,
  `ingreso_caja` int(11) NOT NULL,
  `egreso_caja` int(11) NOT NULL,
  `fecha_caja` datetime NOT NULL,
  `apertura_caja` int(11) NOT NULL,
  `cierre_caja` int(11) NOT NULL,
  `monto_caja` int(11) NOT NULL,
  `movimiento_caja_idmov_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cli` varchar(60) NOT NULL,
  `apellido_cli` varchar(60) NOT NULL,
  `telefono_cli` varchar(60) NOT NULL,
  `ruc_cli` varchar(60) NOT NULL,
  `direccion_cli` varchar(60) NOT NULL,
  `ci_cli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cli`, `apellido_cli`, `telefono_cli`, `ruc_cli`, `direccion_cli`, `ci_cli`) VALUES
(1, 'Oscar', 'Ferreira', '0986454060', '-', 'Nrj', 4290766);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `total_compra` double NOT NULL,
  `hora_compra` time NOT NULL,
  `total5_compra` double NOT NULL,
  `total10_compra` double NOT NULL,
  `nrofac_compra` varchar(45) NOT NULL,
  `estado_compra` varchar(3) NOT NULL,
  `proveedores_id_proveedores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasxproductos`
--

CREATE TABLE `comprasxproductos` (
  `compras_id_compra` int(11) NOT NULL,
  `productos_id_producto` int(11) NOT NULL,
  `cantidad_cxp` double NOT NULL,
  `preciocompra_cxp` int(11) NOT NULL,
  `subto5_cxp` double NOT NULL,
  `subto10_cxp` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentacorriente`
--

CREATE TABLE `cuentacorriente` (
  `id_cuentac` int(11) NOT NULL,
  `saldo_cuentac` int(11) NOT NULL,
  `clientes_id_cliente` int(11) NOT NULL,
  `facturas_id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_empresa`
--

CREATE TABLE `datos_empresa` (
  `iddatos_empresa` int(11) NOT NULL,
  `ruc_empresa` varchar(45) NOT NULL,
  `numfac_empresa` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `nro_factura` varchar(45) NOT NULL,
  `total_factura` double DEFAULT NULL,
  `estado_factura` varchar(10) NOT NULL,
  `hora_factura` time NOT NULL,
  `totaliva_factura` double NOT NULL,
  `totaliva10_factura` double NOT NULL,
  `totaliva5_factura` double NOT NULL,
  `tipo_factura` varchar(4) NOT NULL,
  `descuento_factura` double NOT NULL,
  `clientes_id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `fecha_factura`, `nro_factura`, `total_factura`, `estado_factura`, `hora_factura`, `totaliva_factura`, `totaliva10_factura`, `totaliva5_factura`, `tipo_factura`, `descuento_factura`, `clientes_id_cliente`) VALUES
(1, '2020-05-29', '5', 10000, 'activo', '16:52:33', 5, 5, 5, '1', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturasxproductos`
--

CREATE TABLE `facturasxproductos` (
  `facturas_id_factura` int(11) NOT NULL,
  `productos_id_producto` int(11) NOT NULL,
  `cantidad_fxp` double NOT NULL,
  `precio_fxp` int(11) NOT NULL,
  `subto5_fxp` double NOT NULL,
  `subto10_fxp` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_func` int(11) NOT NULL,
  `nombre_func` varchar(60) NOT NULL,
  `apellido_func` varchar(60) NOT NULL,
  `telefono_func` varchar(45) NOT NULL,
  `salario_func` int(11) NOT NULL,
  `seguro_func` int(11) NOT NULL,
  `deuda_func` double NOT NULL,
  `saldo_func` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionariosxorden`
--

CREATE TABLE `funcionariosxorden` (
  `funcionarios_id_func` int(11) NOT NULL,
  `ordenserv_id_orden` int(11) NOT NULL,
  `ganancia_fxo` int(11) NOT NULL,
  `fecha_fxo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE `iva` (
  `id_iva` int(11) NOT NULL,
  `descrip_iva` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `iva`
--

INSERT INTO `iva` (`id_iva`, `descrip_iva`) VALUES
(1, '5%'),
(2, '10%'),
(3, '15%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marcas` int(11) NOT NULL,
  `descrip_marcas` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marcas`, `descrip_marcas`) VALUES
(1, 'abc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_caja`
--

CREATE TABLE `movimiento_caja` (
  `idmov_caja` int(11) NOT NULL,
  `monto_mov` double NOT NULL,
  `tipo_mov` varchar(2) NOT NULL,
  `descrip_mov` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenserv`
--

CREATE TABLE `ordenserv` (
  `id_orden` int(11) NOT NULL,
  `fechainicio_orden` date NOT NULL,
  `fechaentrega_orden` date NOT NULL,
  `descrip_orden` varchar(200) NOT NULL,
  `estado_orden` varchar(2) NOT NULL,
  `total_orden` int(11) NOT NULL,
  `clientes_id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenxproductos`
--

CREATE TABLE `ordenxproductos` (
  `ordenserv_id_orden` int(11) NOT NULL,
  `productos_id_producto` int(11) NOT NULL,
  `cantidad_oxp` double NOT NULL,
  `subtotal_oxp` double NOT NULL,
  `fecha_oxp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `monto_pago` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `funcionarios_id_func` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(60) NOT NULL,
  `ubicacion_producto` varchar(120) NOT NULL,
  `precio_producto` int(11) NOT NULL,
  `cantidad_producto` double NOT NULL,
  `fechaultimacompra_producto` date NOT NULL DEFAULT current_timestamp(),
  `descripcion_producto` varchar(150) NOT NULL,
  `preciocompra_producto` int(11) NOT NULL,
  `marcas_id_marcas` int(11) NOT NULL DEFAULT 1,
  `iva_id_iva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `ubicacion_producto`, `precio_producto`, `cantidad_producto`, `fechaultimacompra_producto`, `descripcion_producto`, `preciocompra_producto`, `marcas_id_marcas`, `iva_id_iva`) VALUES
(3, 'Llave', 'a-1', 10000, 2, '2020-05-29', 'Inglesa', 7000, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedores` int(11) NOT NULL,
  `nombre_prov` varchar(60) NOT NULL,
  `telefono_prov` varchar(60) NOT NULL,
  `ruc_prov` varchar(60) NOT NULL,
  `correo_prov` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedores`, `nombre_prov`, `telefono_prov`, `ruc_prov`, `correo_prov`) VALUES
(1, 'sla', '85', 'a@b', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibos`
--

CREATE TABLE `recibos` (
  `id_recibo` int(11) NOT NULL,
  `monto_recibo` double NOT NULL,
  `fecha_recibo` date NOT NULL,
  `pago_recibo` int(11) NOT NULL,
  `cuentacorriente_id_cuentac` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `descrip_roles` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usu` int(11) NOT NULL,
  `nombre_usu` varchar(60) NOT NULL,
  `contra_usu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosxroles`
--

CREATE TABLE `usuariosxroles` (
  `usuarios_id_usu` int(11) NOT NULL,
  `roles_id_roles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adelantos`
--
ALTER TABLE `adelantos`
  ADD PRIMARY KEY (`id_adelanto`),
  ADD KEY `fk_adelantos_funcionarios_idx` (`funcionarios_id_func`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`),
  ADD KEY `fk_caja_movimiento_caja1_idx` (`movimiento_caja_idmov_caja`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `fk_compras_proveedores1_idx` (`proveedores_id_proveedores`);

--
-- Indices de la tabla `comprasxproductos`
--
ALTER TABLE `comprasxproductos`
  ADD PRIMARY KEY (`compras_id_compra`,`productos_id_producto`),
  ADD KEY `fk_compras_has_productos_productos1_idx` (`productos_id_producto`),
  ADD KEY `fk_compras_has_productos_compras1_idx` (`compras_id_compra`);

--
-- Indices de la tabla `cuentacorriente`
--
ALTER TABLE `cuentacorriente`
  ADD PRIMARY KEY (`id_cuentac`),
  ADD KEY `fk_cuentacorriente_clientes1_idx` (`clientes_id_cliente`),
  ADD KEY `fk_cuentacorriente_facturas1_idx` (`facturas_id_factura`);

--
-- Indices de la tabla `datos_empresa`
--
ALTER TABLE `datos_empresa`
  ADD PRIMARY KEY (`iddatos_empresa`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_facturas_clientes1_idx` (`clientes_id_cliente`);

--
-- Indices de la tabla `facturasxproductos`
--
ALTER TABLE `facturasxproductos`
  ADD PRIMARY KEY (`facturas_id_factura`,`productos_id_producto`),
  ADD KEY `fk_facturas_has_productos_productos1_idx` (`productos_id_producto`),
  ADD KEY `fk_facturas_has_productos_facturas1_idx` (`facturas_id_factura`);

--
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_func`);

--
-- Indices de la tabla `funcionariosxorden`
--
ALTER TABLE `funcionariosxorden`
  ADD PRIMARY KEY (`funcionarios_id_func`,`ordenserv_id_orden`),
  ADD KEY `fk_funcionarios_has_ordenserv_ordenserv1_idx` (`ordenserv_id_orden`),
  ADD KEY `fk_funcionarios_has_ordenserv_funcionarios1_idx` (`funcionarios_id_func`);

--
-- Indices de la tabla `iva`
--
ALTER TABLE `iva`
  ADD PRIMARY KEY (`id_iva`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marcas`);

--
-- Indices de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  ADD PRIMARY KEY (`idmov_caja`);

--
-- Indices de la tabla `ordenserv`
--
ALTER TABLE `ordenserv`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `fk_ordenserv_clientes1_idx` (`clientes_id_cliente`);

--
-- Indices de la tabla `ordenxproductos`
--
ALTER TABLE `ordenxproductos`
  ADD PRIMARY KEY (`ordenserv_id_orden`,`productos_id_producto`),
  ADD KEY `fk_ordenserv_has_productos_productos1_idx` (`productos_id_producto`),
  ADD KEY `fk_ordenserv_has_productos_ordenserv1_idx` (`ordenserv_id_orden`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_Pagos_funcionarios1_idx` (`funcionarios_id_func`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_productos_marcas1_idx` (`marcas_id_marcas`),
  ADD KEY `fk_productos_iva1_idx` (`iva_id_iva`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedores`);

--
-- Indices de la tabla `recibos`
--
ALTER TABLE `recibos`
  ADD PRIMARY KEY (`id_recibo`),
  ADD KEY `fk_recibos_cuentacorriente1_idx` (`cuentacorriente_id_cuentac`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usu`);

--
-- Indices de la tabla `usuariosxroles`
--
ALTER TABLE `usuariosxroles`
  ADD PRIMARY KEY (`usuarios_id_usu`,`roles_id_roles`),
  ADD KEY `fk_usuarios_has_roles_roles1_idx` (`roles_id_roles`),
  ADD KEY `fk_usuarios_has_roles_usuarios1_idx` (`usuarios_id_usu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adelantos`
--
ALTER TABLE `adelantos`
  MODIFY `id_adelanto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_auditoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentacorriente`
--
ALTER TABLE `cuentacorriente`
  MODIFY `id_cuentac` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_empresa`
--
ALTER TABLE `datos_empresa`
  MODIFY `iddatos_empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_func` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `iva`
--
ALTER TABLE `iva`
  MODIFY `id_iva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marcas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  MODIFY `idmov_caja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenserv`
--
ALTER TABLE `ordenserv`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recibos`
--
ALTER TABLE `recibos`
  MODIFY `id_recibo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usu` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adelantos`
--
ALTER TABLE `adelantos`
  ADD CONSTRAINT `fk_adelantos_funcionarios` FOREIGN KEY (`funcionarios_id_func`) REFERENCES `funcionarios` (`id_func`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `fk_caja_movimiento_caja1` FOREIGN KEY (`movimiento_caja_idmov_caja`) REFERENCES `movimiento_caja` (`idmov_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_compras_proveedores1` FOREIGN KEY (`proveedores_id_proveedores`) REFERENCES `proveedores` (`id_proveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprasxproductos`
--
ALTER TABLE `comprasxproductos`
  ADD CONSTRAINT `fk_compras_has_productos_compras1` FOREIGN KEY (`compras_id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compras_has_productos_productos1` FOREIGN KEY (`productos_id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuentacorriente`
--
ALTER TABLE `cuentacorriente`
  ADD CONSTRAINT `fk_cuentacorriente_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuentacorriente_facturas1` FOREIGN KEY (`facturas_id_factura`) REFERENCES `facturas` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_facturas_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturasxproductos`
--
ALTER TABLE `facturasxproductos`
  ADD CONSTRAINT `fk_facturas_has_productos_facturas1` FOREIGN KEY (`facturas_id_factura`) REFERENCES `facturas` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_facturas_has_productos_productos1` FOREIGN KEY (`productos_id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funcionariosxorden`
--
ALTER TABLE `funcionariosxorden`
  ADD CONSTRAINT `fk_funcionarios_has_ordenserv_funcionarios1` FOREIGN KEY (`funcionarios_id_func`) REFERENCES `funcionarios` (`id_func`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_funcionarios_has_ordenserv_ordenserv1` FOREIGN KEY (`ordenserv_id_orden`) REFERENCES `ordenserv` (`id_orden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenserv`
--
ALTER TABLE `ordenserv`
  ADD CONSTRAINT `fk_ordenserv_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenxproductos`
--
ALTER TABLE `ordenxproductos`
  ADD CONSTRAINT `fk_ordenserv_has_productos_ordenserv1` FOREIGN KEY (`ordenserv_id_orden`) REFERENCES `ordenserv` (`id_orden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordenserv_has_productos_productos1` FOREIGN KEY (`productos_id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_Pagos_funcionarios1` FOREIGN KEY (`funcionarios_id_func`) REFERENCES `funcionarios` (`id_func`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_iva1` FOREIGN KEY (`iva_id_iva`) REFERENCES `iva` (`id_iva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_marcas1` FOREIGN KEY (`marcas_id_marcas`) REFERENCES `marcas` (`id_marcas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recibos`
--
ALTER TABLE `recibos`
  ADD CONSTRAINT `fk_recibos_cuentacorriente1` FOREIGN KEY (`cuentacorriente_id_cuentac`) REFERENCES `cuentacorriente` (`id_cuentac`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariosxroles`
--
ALTER TABLE `usuariosxroles`
  ADD CONSTRAINT `fk_usuarios_has_roles_roles1` FOREIGN KEY (`roles_id_roles`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_has_roles_usuarios1` FOREIGN KEY (`usuarios_id_usu`) REFERENCES `usuarios` (`id_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
