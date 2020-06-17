-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2020 a las 21:54:14
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
-- Base de datos: `bd_proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cabeceracompra` (IN `id_proveedorv` INT, IN `nrofacv` VARCHAR(45), IN `fechav` DATE, IN `totalv` INT, IN `total5v` INT, IN `total10v` INT, OUT `idv` INT)  NO SQL
BEGIN
INSERT INTO compras(fecha_compra,total,total5,total10,nrofac,Proveedores_id_proveedores)
VALUES(fechav,totalv,total5v,total10v,nrofacv,id_proveedorv);
SET idv=last_insert_id();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardarfactura` (IN `fechav` DATE, IN `nrofacv` VARCHAR(60), IN `montototalv` DOUBLE, IN `Clientes_id_clientev` INT, IN `Estado_id_estadov` VARCHAR(18), IN `Tipo_venta_id_tipoventav` VARCHAR(45), IN `total10v` DOUBLE, IN `total5v` DOUBLE, IN `descuentov` DOUBLE, OUT `idv` INT)  NO SQL
BEGIN
INSERT INTO factura (fecha,nrofac,montototal,Clientes_id_cliente,Estado_id_estado,Tipo_venta_id_tipoventa,total10,total5,descuento)
VALUES(fechav,nrofacv,montototalv,Clientes_id_clientev,Estado_id_estadov,Tipo_venta_id_tipoventav,total10v,total5v,descuentov);
SET idv=last_insert_id();
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adelantos`
--

CREATE TABLE `adelantos` (
  `id_adelanto` int(11) NOT NULL,
  `monto_adelanto` int(11) NOT NULL,
  `fecha_adelanto` date NOT NULL,
  `funcionarios_id_func` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `tabla` varchar(45) NOT NULL,
  `descrip` varchar(600) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `fecha_auditoria` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario` varchar(45) NOT NULL,
  `id_auditoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`tabla`, `descrip`, `accion`, `fecha_auditoria`, `usuario`, `id_auditoria`) VALUES
('Clientes', 'Es para probar todo esto a ver si es que funciona', 'Actualizar', '2019-02-03 21:23:21', 'admin', 1),
('Clientes', '#4, CI de: 4424142 a: 4424177', 'Actualizar', '2019-02-03 21:30:35', '0983838238', 3),
('Clientes', '#9 Nombre: Walter', 'Eliminar', '2019-02-03 21:54:55', '', 4),
('Clientes', '#10 Nombre: WalterAgregado', 'Agregar', '2019-02-03 21:56:09', '', 5),
('Clientes', '#11 Nombre: Prueba Agregado', 'Agregar', '2019-02-03 22:14:22', 'admin', 6),
('Productos', '#6 Producto: BombillaEliminado', 'Eliminar', '2019-02-03 23:02:31', 'admin', 7),
('Productos', '#7 Producto: Bombilla Agregado', 'Agregar', '2019-02-03 23:06:56', 'admin', 8),
('Productos', '#7, Ubicación de: Pasillo 5-9 a: Pasillo 5-9/10', 'Actualizar', '2019-02-03 23:08:27', 'admin', 9),
('Productos', '#7, Iva de: null a: 10%', 'Actualizar', '2019-02-03 23:09:44', 'admin', 10),
('Productos', '#7 Producto: Bombilla Eliminado', 'Eliminar', '2019-02-03 23:10:22', 'admin', 11),
('Marcas', '#6 Marca: Voopoo Agregada', 'Agregar', '2019-02-04 00:16:28', 'admin', 12),
('Marcas', '#1 Marca de: Asmodusa: naked', 'Actualizar', '2019-02-04 00:18:50', 'admin', 13),
('Ventas', ' Factura Venta Nro: 001-001-141 TipoContado Agregada', 'Agregar', '2019-02-04 00:30:29', 'admin', 14),
('Ventas', ' Factura Venta Nro: 001-001-138 Tipo: Credito  Anulada', 'Anular', '2019-02-04 00:54:13', 'admin', 15),
('Proveedores', '#7 Proveedor: 151 Vapor Agregado', 'Agregar', '2019-02-04 01:33:01', 'admin', 16),
('Proveedores', '#7 Nombre de: 151 Vapora: 151 Vaporr, Ruc de: 1664884-2 a: 1664888-7', 'Actualizar', '2019-02-04 01:33:31', 'admin', 17),
('Proveedor', '#7 Proveedor: 151 VaporrEliminado', 'Eliminar', '2019-02-04 01:34:37', 'admin', 18),
('Clientes', '#12 Cliente: Desde Agregado', 'Agregar', '2019-02-04 01:42:00', 'admin', 19),
('Compras', ' Factura Compra Nro: 78787887878  Agregada', 'Agregar', '2019-02-04 01:50:39', 'admin', 20),
('Compras', ' Factura Compra Nro: 100  Agregada', 'Agregar', '2019-02-04 02:05:06', 'admin', 21),
('Compras', ' Factura Venta Nro: 100  Anulada', 'Anular', '2019-02-04 02:05:19', 'admin', 22),
('Ventas', 'Monto: 0 a Razó de: Reponer Extraccinon  Agregado', 'Agregar', '2019-02-04 02:48:00', 'admin', 23),
('Ventas', 'Monto: 15000 a Razó de: Ganar Bingo  Agregado', 'Agregar', '2019-02-04 02:49:47', 'admin', 24),
('Caja', 'Monto: 70000 a Razó de: Robar un Ciego  Agregado', 'Agregar', '2019-02-04 02:51:38', 'admin', 25),
('Caja', 'Monto: 80 a Razón de: AA  Agregado', 'Agregar', '2019-02-04 02:58:26', 'admin', 26),
('Caja', 'Monto: 31000 a Razón de: Dejar Positivo  Agregado', 'Agregar', '2019-02-04 02:58:52', 'admin', 27),
('Caja', 'Monto: 10000 a Razón de: AAsss  Agregado', 'Agregar', '2019-02-04 03:02:17', 'admin', 28),
('Caja', 'Monto: 10000 a Razón de: Sumar  Extraido', 'Extraer', '2019-02-04 03:23:53', 'admin', 29),
('Caja', 'Monto: 10000 a Razón de: asasas  Extraido', 'Extraer', '2019-02-04 03:25:23', 'admin', 30),
('Caja', 'Monto: 10000 a Razón de: dfgdfgdfg  Agregado', 'Agregar', '2019-02-04 03:25:49', 'admin', 31),
('Caja', 'Monto: 2000 a Razón de: Probando  Agregado', 'Agregar', '2019-02-04 03:29:07', 'admin', 32),
('Cuenta Corriente', 'Pago Parcial Fac Nro: 001-001-140  Agregado', 'Agregar', '2019-02-04 03:45:04', 'admin', 33),
('Cuenta Corriente', 'Pago Total Fac Nro: 001-001-140  Agregado', 'Agregar', '2019-02-04 03:45:35', 'admin', 34),
('Cuenta Corriente', 'Pago Parcial Fac Nro: 001-001-143  Agregado', 'Agregar', '2019-02-04 14:50:11', 'admin', 35),
('Cuenta Corriente', 'Pago Total Fac Nro: 001-001-143  Agregado', 'Agregar', '2019-02-04 14:50:17', 'admin', 36),
('Ventas', ' Factura Venta Nro: 001-001-001 Tipo: Contado  Agregada', 'Agregar', '2020-05-29 16:16:31', 'Admin', 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL,
  `Ingreso` int(11) DEFAULT 0,
  `Egreso` int(11) DEFAULT 0,
  `Fecha` datetime DEFAULT current_timestamp(),
  `apertura_caja` int(11) DEFAULT 0,
  `cierre_caja` int(11) DEFAULT 0,
  `montocaja` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_caja`, `Ingreso`, `Egreso`, `Fecha`, `apertura_caja`, `cierre_caja`, `montocaja`) VALUES
(1, 0, 0, '2019-02-02 11:17:42', 20000, 0, 0),
(2, 0, 0, '2019-02-02 11:20:59', 50000, 0, 0),
(3, 0, 0, '2019-02-02 11:22:27', 9000, 0, 0),
(4, 0, 0, '2019-02-02 20:52:14', 1, 0, 0),
(14, 186508, 110000, '2019-02-03 12:21:37', 20000, 76508, 0),
(20, 223582, 110000, '2019-02-04 00:21:03', 0, 113582, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `RUC` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `ci` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `telefono`, `RUC`, `direccion`, `ci`) VALUES
(1, 'Akio', 'Hayashidaa', '+595994860197', '5090531-7', 'Encarnacion', 5090531),
(2, 'Karin Milena', 'Kistmacher Ulrich', '+595971155645', '5004645-0', 'Encarnación', 5004645),
(3, 'Abel ', 'Ruiz Diaz', '0975610739', '4279375-0', 'Ma. Aux.', 4279375),
(4, 'Fernando ', 'Weschenfelder', '0983838238', '4424142-9', 'Natalio', 4424177),
(7, 'Walter Fabian', 'Rojas Centurion', '0985956356', '4864874-0', 'Mar. Aux.', 4864874),
(8, 'Oscarr', 'Ferreirar', '0985746820111', '4593692-011', 'Naranjitoeee', 459369222),
(10, 'Walter', 'Rojas', '+595985775444', '1305331-0', 'Encarnacion', 1305331),
(11, 'Prueba', 'Prue', '222', '44-0', 'Encar ', 44),
(12, 'Desde', 'La', '656565', '45454', 'venta', 222),
(13, 'carin', 'asd', '6954', '654', 'asd', 321);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compras` int(11) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `total5` int(11) DEFAULT NULL,
  `total10` int(11) DEFAULT NULL,
  `nrofac` varchar(45) DEFAULT NULL,
  `Proveedores_id_proveedores` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL DEFAULT 'Pagado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compras`, `fecha_compra`, `total`, `total5`, `total10`, `nrofac`, `Proveedores_id_proveedores`, `Estado`) VALUES
(1, '2019-01-08', 15000, 5000, 10000, '46546546', 1, 'Anulado'),
(2, '2019-01-10', 50000, 25000, 25000, '001-0101-2560', 4, 'Pagado'),
(3, NULL, 2000, 0, 2000, NULL, 4, 'Pagado'),
(4, NULL, 115555, 4444, 111111, NULL, 4, 'Pagado'),
(5, '2019-01-14', 5000, 3000, 2000, NULL, 4, 'Pagado'),
(6, '2019-01-14', 2000, 0, 2000, NULL, 4, 'Pagado'),
(7, '2019-01-14', 61205, 48884, 12321, NULL, 4, 'Pagado'),
(8, '2019-01-14', 91304, 49490, 41814, 'agora vai porraaaa', 4, 'Pagado'),
(9, '2019-01-14', 91304, 49490, 41814, 'agora vai porraaaa', 4, 'Pagado'),
(10, '2019-01-14', 730553, 508553, 222000, '000000000', 1, 'Pagado'),
(11, '2019-01-14', 1000000, 0, 1000000, '11111', 2, 'Pagado'),
(12, '2019-01-14', 989901, 0, 989901, '111111111111111111111111', 2, 'Pagado'),
(13, '2019-01-14', 735326, 733326, 2000, 'prueba de hoy', 4, 'Pagado'),
(14, '2019-01-14', 222000, 0, 222000, 'asasasasas', 2, 'Pagado'),
(15, '2019-01-14', 100000, 0, 100000, '2000000000', 2, 'Pagado'),
(16, '2019-01-14', 1234321, 0, 1234321, '111111111', 1, 'Pagado'),
(17, '2019-01-14', 80000, 0, 80000, '123456\\789', 1, 'Pagado'),
(18, '2019-01-14', 900000, 0, 900000, 'este de aca para las cantidades', 4, 'Pagado'),
(19, '2019-01-14', 1125000, 1125000, 0, '22222222222222', 2, 'Pagado'),
(20, '2019-01-14', 920000, 920000, 0, '444444444444444222', 4, 'Pagado'),
(21, '2019-01-14', 240000, 0, 240000, '20000000', 2, 'Pagado'),
(22, '2019-01-14', 18000, 0, 18000, '111111', 1, 'Pagado'),
(23, '2019-01-14', 6000, 0, 6000, '121212121212', 2, 'Pagado'),
(24, '2019-01-15', 150000, 0, 150000, '001-001-356090', 4, 'Pagado'),
(25, '2019-01-17', 120000, 0, 120000, '444-444-444444', 4, 'Pagado'),
(26, '2019-01-19', 43000, 0, 43000, '909-090-909090', 2, 'Pagado'),
(27, '2019-01-19', 195000, 150000, 45000, '797-979-797979', 4, 'Pagado'),
(28, '2019-01-23', 120000, 100000, 20000, '977-979-797977', 2, 'Pagado'),
(29, '2019-01-24', 406000, 0, 406000, '779-798-998798', 4, 'Pagado'),
(30, '2019-01-27', 1476000, 0, 1476000, '112-341-234123', 4, 'Pagado'),
(31, '2019-01-29', 724000, 0, 724000, '445-454-5454__', 4, 'Pagado'),
(32, '2019-02-02', 20000, 0, 20000, '564-654-564564', 4, 'Pagado'),
(33, '2019-02-02', 60000, 50000, 10000, '13212312313213212313', 2, 'Pagado'),
(34, '2019-02-02', 60000, 50000, 10000, '13212312313213212313', 2, 'Pagado'),
(35, '2019-02-03', 64000, 50000, 14000, '55555559999999999999', 4, 'Anulado'),
(36, '2019-02-03', 60000, 50000, 10000, '56565656565656565', 2, 'Anulado'),
(37, '2019-02-03', 10000, 0, 10000, '56565656565656565656', 2, 'Anulado'),
(38, '2019-02-03', 50000, 50000, 0, '11111111122222', 5, 'Pagado'),
(39, '2019-02-03', 50000, 50000, 0, '11111111122222', 5, 'Anulado'),
(40, '2019-02-03', 12000, 0, 12000, '90', 4, 'Pagado'),
(41, '2019-02-03', 12000, 0, 12000, '90', 4, 'Pagado'),
(42, '2019-02-04', 30000, 0, 30000, '78787887878', 5, 'Anulado'),
(43, '2019-02-04', 60000, 50000, 10000, '100', 4, 'Anulado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentacorriente`
--

CREATE TABLE `cuentacorriente` (
  `idCuentaCorriente` int(11) NOT NULL,
  `Saldo` double DEFAULT NULL,
  `Clientes_id_cliente` int(11) NOT NULL,
  `Factura_id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentacorriente`
--

INSERT INTO `cuentacorriente` (`idCuentaCorriente`, `Saldo`, `Clientes_id_cliente`, `Factura_id_factura`) VALUES
(1, 0, 1, 7),
(2, 0, 2, 8),
(3, 15000, 2, 9),
(4, 0, 1, 10),
(5, 0, 2, 12),
(6, 210000, 2, 12),
(7, 20000, 2, 13),
(8, 85002, 1, 14),
(9, 85002, 1, 14),
(10, 85002, 1, 14),
(11, 85002, 1, 14),
(12, 0, 1, 15),
(13, 0, 1, 16),
(14, 0, 3, 18),
(15, 0, 1, 69),
(16, 0, 3, 81),
(17, 0, 3, 87),
(18, 5002, 3, 103),
(19, 0, 3, 105),
(20, 0, 4, 116),
(21, 0, 1, 117),
(22, 0, 7, 138),
(23, 0, 7, 140),
(24, 20002, 7, 142),
(25, 0, 7, 143);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_empresa`
--

CREATE TABLE `datos_empresa` (
  `id_datos_empresa` int(11) NOT NULL,
  `RUC` varchar(45) DEFAULT NULL,
  `numfac` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datos_empresa`
--

INSERT INTO `datos_empresa` (`id_datos_empresa`, `RUC`, `numfac`) VALUES
(1, '4279375-0', '001-001-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `nrofac` varchar(60) NOT NULL,
  `montototal` double DEFAULT NULL,
  `Clientes_id_cliente` int(11) NOT NULL,
  `Estado_id_estado` varchar(18) NOT NULL,
  `Tipo_venta_id_tipoventa` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `total10` double DEFAULT NULL,
  `total5` double DEFAULT NULL,
  `descuento` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `fecha`, `nrofac`, `montototal`, `Clientes_id_cliente`, `Estado_id_estado`, `Tipo_venta_id_tipoventa`, `total10`, `total5`, `descuento`) VALUES
(3, '2019-01-16', '777-777-77777_', 36000, 1, 'Anulado', 'Contado', 40000, 0, 4000),
(4, '2019-01-16', '', 10000, 2, 'Anulado', 'Credito', 10000, 0, 0),
(5, '2019-01-16', '575-757-57575_', 10000, 1, 'Pagado', 'Contado', 10000, 0, 0),
(6, '2019-01-16', '445-454-______', 20000, 1, 'Pendiente', 'Credito', 20000, 0, 0),
(7, '2019-01-16', '202-022-020200', 5000, 1, 'Anulado', 'Credito', 5000, 0, 0),
(8, '2019-01-17', '787-878-787878', 40000, 2, 'Pendiente', 'Credito', 40000, 0, 0),
(9, '2019-01-17', '454-545-4545__', 15000, 2, 'Pendiente', 'Credito', 20000, 0, 5000),
(10, '2019-01-17', '001-001-256368', 40000, 1, 'Anulado', 'Credito', 40000, 0, 0),
(11, '2019-01-19', '707-070-707070', 20000, 2, 'Pagado', 'Contado', 20000, 0, 0),
(12, '2019-01-19', '808-080-808080', 210000, 2, 'Pendiente', 'Credito', 220000, 0, 10000),
(13, '2019-01-19', '666-666-666666', 20000, 2, 'Pendiente', 'Credito', 20000, 0, 0),
(14, '2019-01-19', '503-235-622211', 85002, 1, 'Pendiente', 'Credito', 85000, 2, 0),
(15, '2019-01-23', '121-212-121212', 50004, 1, 'Pagado', 'Credito', 50000, 4, 0),
(16, '2019-01-23', '123-123-123123', 170008, 1, 'Pagado', 'Credito', 170000, 8, 0),
(17, '2019-01-24', '', 5600000, 3, 'Pagado', 'Contado', 5600000, 0, 0),
(18, '2019-01-24', '878-787-878787', 180000, 3, 'Pagado', 'Credito', 180000, 0, 0),
(19, '2019-01-27', '787-887-887878', 120000, 3, 'Pagado', 'Contado', 120000, 0, 0),
(20, '2019-01-27', '272-727-227272', 120000, 3, 'Pagado', 'Contado', 120000, 0, 0),
(21, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(22, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(23, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(24, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(25, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(26, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(27, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(28, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(29, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(30, '2019-01-27', '707-070-707070', 1560000, 3, 'Pagado', 'Contado', 1560000, 0, 0),
(31, '2019-01-30', '001-001-31', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(32, '2019-01-30', '001-001-31', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(33, '2019-01-30', '001-001-31', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(34, '2019-01-30', '001-001-34', 2, 3, 'Pagado', 'Contado', 0, 2, 0),
(35, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(36, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(37, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(38, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(39, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(40, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(41, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(42, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(43, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(44, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(45, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(46, '2019-01-30', '001-001-35', 25000, 3, 'Pagado', 'Contado', 25000, 0, 0),
(47, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(48, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(49, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(50, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(51, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(52, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(53, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(54, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(55, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(56, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(57, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(58, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(59, '2019-01-30', '001-001-47', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(60, '2019-01-30', '001-001-60', 4, 3, 'Pagado', 'Contado', 0, 4, 0),
(61, '2019-01-30', '001-001-61', 700000, 1, 'Pagado', 'Contado', 700000, 0, 0),
(62, '2019-01-30', '001-001-62', 20000, 3, 'Pagado', 'Contado', 20000, 0, 0),
(63, '2019-01-30', '001-001-62', 20000, 3, 'Pagado', 'Contado', 20000, 0, 0),
(64, '2019-01-30', '001-001-62', 20000, 3, 'Pagado', 'Contado', 20000, 0, 0),
(65, '2019-01-30', '001-001-62', 20000, 3, 'Pagado', 'Contado', 20000, 0, 0),
(66, '2019-01-30', '001-001-66', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(67, '2019-01-30', '001-001-67', 10000, 3, 'Pagado', 'Contado', 10000, 0, 0),
(68, '2019-01-30', '001-001-68', 700000, 2, 'Pagado', 'Contado', 700000, 0, 0),
(69, '2019-01-30', '001-001-69', 60000, 1, 'Pendiente', 'Credito', 60000, 0, 0),
(70, '2019-01-30', '001-001-70', 705000, 3, 'Pagado', 'Contado', 705000, 0, 0),
(71, '2019-01-30', '001-001-71', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(72, '2019-01-30', '001-001-72', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(73, '2019-01-30', '001-001-73', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(74, '2019-01-30', '001-001-74', 25002, 1, 'Pagado', 'Contado', 25000, 2, 0),
(75, '2019-01-30', '001-001-75', 2, 1, 'Pagado', 'Contado', 0, 2, 0),
(76, '2019-01-30', '001-001-75', 2, 1, 'Pagado', 'Contado', 0, 2, 0),
(77, '2019-01-30', '001-001-77', 20002, 2, 'Pagado', 'Contado', 20000, 2, 0),
(78, '2019-01-30', '001-001-78', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(79, '2019-01-30', '001-001-79', 60000, 3, 'Pagado', 'Contado', 60000, 0, 0),
(80, '2019-01-30', '001-001-80', 20000, 2, 'Pagado', 'Contado', 20000, 0, 0),
(81, '2019-01-30', '001-001-81', 80002, 3, 'Anulado', 'Credito', 80000, 2, 0),
(82, '2019-01-30', '001-001-82', 60004, 3, 'Pagado', 'Contado', 60000, 4, 0),
(83, '2019-01-30', '001-001-83', 2, 2, 'Pagado', 'Contado', 0, 2, 0),
(84, '2019-01-30', '001-001-83', 60000, 1, 'Pagado', 'Contado', 60000, 0, 0),
(85, '2019-01-30', '001-001-85', 2, 3, 'Pagado', 'Contado', 0, 2, 0),
(86, '2019-01-31', '001-001-86', 60002, 3, 'Pagado', 'Contado', 60000, 2, 0),
(87, '2019-01-31', '001-001-87', 2, 3, 'Pagado', 'Credito', 0, 2, 0),
(88, '2019-01-31', '001-001-88', 500002, 1, 'Pagado', 'Contado', 0, 2, 0),
(89, '2019-01-31', '001-001-88', 500002, 1, 'Pagado', 'Contado', 0, 2, 0),
(90, '2019-01-31', '001-001-90', 500002, 3, 'Pagado', 'Contado', 0, 2, 0),
(91, '2019-01-31', '001-001-91', 500002, 1, 'Pagado', 'Contado', 0, 2, 0),
(92, '2019-01-31', '001-001-92', 500002, 3, 'Pagado', 'Contado', 0, 2, 0),
(93, '2019-01-31', '001-001-93', 500002, 1, 'Pagado', 'Contado', 0, 2, 0),
(94, '2019-01-31', '001-001-94', 500002, 1, 'Pagado', 'Contado', 0, 2, 0),
(95, '2019-01-31', '001-001-95', 1200000, 1, 'Pagado', 'Contado', 700000, 0, 0),
(96, '2019-01-31', '001-001-96', 25002, 2, 'Pagado', 'Contado', 25000, 2, 0),
(97, '2019-01-31', '001-001-97', 25000, 2, 'Pagado', 'Contado', 25000, 0, 0),
(98, '2019-01-31', '001-001-98', 2, 1, 'Pagado', 'Contado', 0, 2, 0),
(99, '2019-01-31', '001-001-99', 2, 2, 'Pagado', 'Contado', 0, 2, 0),
(100, '2019-01-31', '001-001-100', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(101, '2019-01-31', '001-001-100', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(102, '2019-01-31', '001-001-102', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(103, '2019-01-31', '001-001-103', 5002, 3, 'Pendiente', 'Credito', 5000, 2, 0),
(104, '2019-01-31', '001-001-104', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(105, '2019-01-31', '001-001-105', 5000, 3, 'Pagado', 'Credito', 5000, 2, 2),
(106, '2019-02-01', '001-001-106', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(107, '2019-02-01', '001-001-106', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(108, '2019-02-01', '001-001-108', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(109, '2019-02-01', '001-001-108', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(110, '2019-02-01', '001-001-110', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(111, '2019-02-01', '001-001-111', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(112, '2019-02-01', '001-001-111', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(113, '2019-02-01', '001-001-113', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(114, '2019-02-01', '001-001-113', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(115, '2019-02-01', '001-001-115', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(116, '2019-02-01', '001-001-116', 5002, 4, 'Pendiente', 'Credito', 5000, 2, 0),
(117, '2019-02-02', '001-001-117', 5000, 1, 'Pagado', 'Credito', 5000, 2, 2),
(118, '2019-02-02', '001-001-118', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(119, '2019-02-02', '001-001-119', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(120, '2019-02-02', '001-001-120', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(121, '2019-02-02', '001-001-121', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(122, '2019-02-02', '001-001-121', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(123, '2019-02-02', '001-001-123', 2, 2, 'Pagado', 'Contado', 0, 2, 0),
(124, '2019-02-02', '001-001-123', 2, 2, 'Pagado', 'Contado', 0, 2, 0),
(125, '2019-02-02', '001-001-125', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(126, '2019-02-02', '001-001-125', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(127, '2019-02-02', '001-001-125', 5000, 2, 'Pagado', 'Contado', 5000, 0, 0),
(128, '2019-02-02', '001-001-128', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(129, '2019-02-02', '001-001-129', 5000, 3, 'Anulado', 'Contado', 5000, 0, 0),
(130, '2019-02-02', '001-001-130', 10004, 4, 'Pagado', 'Contado', 10000, 4, 0),
(131, '2019-02-02', '001-001-131', 20004, 4, 'Anulado', 'Contado', 20000, 4, 0),
(132, '2019-02-02', '001-001-132', 5000, 1, 'Pagado', 'Contado', 5000, 0, 0),
(133, '2019-02-03', '001-001-133', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(134, '2019-02-03', '001-001-133', 5000, 3, 'Pagado', 'Contado', 5000, 0, 0),
(135, '2019-02-03', '001-001-135', 37000, 7, 'Pagado', 'Contado', 40000, 0, 3000),
(136, '2019-02-03', '001-001-136', 2, 2, 'Pagado', 'Contado', 0, 2, 0),
(137, '2019-02-03', '001-001-137', 20002, 7, 'Pagado', 'Contado', 20000, 2, 0),
(138, '2019-02-03', '001-001-138', 20002, 7, 'Anulado', 'Credito', 20000, 2, 0),
(139, '2019-02-03', '001-001-139', 20002, 7, 'Anulado', 'Contado', 20000, 2, 0),
(140, '2019-02-03', '001-001-140', 20000, 7, 'Pagado', 'Credito', 20000, 0, 0),
(141, '2019-02-04', '001-001-141', 2, 10, 'Anulado', 'Contado', 0, 2, 0),
(142, '2019-02-04', '001-001-142', 20002, 7, 'Pendiente', 'Credito', 20000, 2, 0),
(143, '2019-02-04', '001-001-143', 20000, 7, 'Pagado', 'Credito', 20000, 0, 0),
(144, '2020-05-29', '001-001-001', 0, 4, 'Pagado', 'Contado', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_func` int(11) NOT NULL,
  `nombre_func` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_func` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_func` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `salario_func` int(11) NOT NULL,
  `seguro_func` int(11) NOT NULL,
  `deuda_func` double NOT NULL,
  `saldo_func` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `funcionarios`
--

INSERT INTO `funcionarios` (`id_func`, `nombre_func`, `apellido_func`, `telefono_func`, `salario_func`, `seguro_func`, `deuda_func`, `saldo_func`) VALUES
(1, 'Oscar', 'Ferreira', '0985', 2000, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionariosxorden`
--

CREATE TABLE `funcionariosxorden` (
  `funcionarios_id_func` int(11) NOT NULL,
  `ordenserv_id_orden` int(11) NOT NULL,
  `ganancia_fxo` int(11) NOT NULL,
  `fecha_fxo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE `iva` (
  `id_iva` int(11) NOT NULL,
  `descrip_iva` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `iva`
--

INSERT INTO `iva` (`id_iva`, `descrip_iva`) VALUES
(1, '5%'),
(2, '10%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marcas` int(11) NOT NULL,
  `descrip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marcas`, `descrip`) VALUES
(1, 'naked'),
(2, 'pruebasss'),
(3, 'Henglida'),
(4, 'Profield'),
(5, 'Tupper'),
(6, 'Voopoo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_caja`
--

CREATE TABLE `movimiento_caja` (
  `id_movimiento_caja` int(11) NOT NULL,
  `monto` int(11) DEFAULT NULL,
  `tipo` varchar(100) NOT NULL,
  `nrofac` varchar(20) NOT NULL,
  `Caja_id_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movimiento_caja`
--

INSERT INTO `movimiento_caja` (`id_movimiento_caja`, `monto`, `tipo`, `nrofac`, `Caja_id_caja`) VALUES
(3, 2000, 'Ingreso', '001-001-86', 1),
(4, 5000, 'Ingreso', '00-001-89', 1),
(5, 4000, 'Egreso', '066656', 1),
(6, 2000, 'Ingreso', '5454545', 1),
(7, 5000, 'Ingreso', '001-001-129', 4),
(8, 20000, 'Egreso', '564-654-564564', 4),
(9, 5000, 'Anul. Venta', '5454646', 4),
(10, 10004, 'Ingreso', '001-001-130', 4),
(11, 10004, 'Ingreso', '001-001-130', 4),
(12, 20004, 'Ingreso', '001-001-131', 4),
(13, 20004, 'Anul. Venta', '001-001-131', 4),
(14, 60000, 'Egreso', '13212312313213212313', 4),
(15, 60000, 'Egreso', '13212312313213212313', 4),
(16, 60000, 'Egreso', '13212312313213212313', 4),
(17, 60000, 'Egreso', '13212312313213212313', 4),
(18, 5000, 'Ingreso', '001-001-132', 4),
(19, 64000, 'Egreso', '55555559999999999999', 4),
(20, 64000, 'Egreso', '55555559999999999999', 4),
(21, 64000, 'Egreso', '55555559999999999999', 4),
(22, 64000, 'Anul. Compra', '55555559999999999999', 4),
(23, 25000, 'Anul. Compra', '54564654564', 4),
(24, 60000, 'Egreso', '56565656565656565', 4),
(25, 60000, 'Egreso', '56565656565656565', 4),
(26, 60000, 'Anul. Compra', '56565656565656565', 4),
(27, 5000, 'Ingreso', '001-001-133', 4),
(28, 5000, 'Ingreso', '001-001-133', 4),
(29, 36000, 'Anul. Venta', '777-777-77777_', 14),
(30, 37000, 'Ingreso', '001-001-135', 14),
(31, 15000, 'Anul. Compra', '46546546', 14),
(32, 50000, 'Egreso', '11111111122222', 14),
(33, 50000, 'Anul. Compra', '11111111122222', 14),
(34, 10000, 'Anul. Compra', '56565656565656565656', 14),
(35, 12000, 'Egreso', '90', 14),
(36, 12000, 'Egreso', '90', 14),
(37, 2, 'Ingreso', '001-001-136', 14),
(38, 20002, 'Ingreso', '001-001-137', 14),
(39, 20002, 'Pago Total Fac.', '001-001-138', 14),
(40, 20002, 'Ingreso', '001-001-139', 14),
(41, 10000, 'Pago Parcial Fac.', '', 14),
(42, 2000, 'Pago Parcial Fac.', '', 14),
(43, 2500, 'Pago Parcial Fac.', '001-001-140', 14),
(45, 30000, 'Egreso', '78787887878', 20),
(46, 60000, 'Egreso', '100', 20),
(47, 60000, 'Anul. Compra', '100', 20),
(48, 0, 'Reponer Extraccinon', 'Inserción de dinero', 20),
(49, 15000, 'Ganar Bingo', 'Inserción de dinero', 20),
(50, 70000, 'Robar un Ciego', 'Inserción de dinero', 20),
(51, 80, 'AA', 'Inserción de dinero', 20),
(52, 31000, 'Dejar Positivo', 'Inserción de dinero', 20),
(53, 10000, 'AAsss', 'Inserción de dinero', 20),
(54, 10000, 'Sumar', 'Inserción de dinero', 20),
(55, 10000, 'asasas', 'Inserción de dinero', 20),
(56, 10000, 'dfgdfgdfg', 'Inserción de dinero', 20),
(57, 2000, 'Probando', 'Inserción de dinero', 20),
(58, 2000, 'Pago Parcial Fac.', '001-001-140', 20),
(59, 3500, 'Pago Total Fac.', '001-001-140', 20),
(60, 15000, 'Pago Parcial Fac.', '001-001-143', 20),
(61, 5000, 'Pago Total Fac.', '001-001-143', 20),
(62, 0, 'Ingreso', '001-001-001', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenserv`
--

CREATE TABLE `ordenserv` (
  `id_orden` int(11) NOT NULL,
  `fechainicio_orden` date NOT NULL,
  `fechaentrega_orden` date DEFAULT NULL,
  `descrip_orden` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `estado_orden` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `total_orden` int(11) NOT NULL,
  `clientes_id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `monto_pago` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `funcionarios_id_func` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(45) DEFAULT NULL,
  `ubicacion` text DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 0,
  `fecha_ultimacompra` date DEFAULT '2019-01-01',
  `descripcion_produ` text DEFAULT NULL,
  `preciocompra` int(11) DEFAULT 0,
  `Iva_id_iva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `ubicacion`, `precio`, `cantidad`, `fecha_ultimacompra`, `descripcion_produ`, `preciocompra`, `Iva_id_iva`) VALUES
(1, 'p', 'r', 5000, 1, '2019-02-04', 'ba', 10000, 2),
(2, 'a', 'a', 2, 15, '2019-02-04', 'a', 50000, 1),
(3, 'Llave Inglesa', 'Tercer Cajón', 20000, 28, '2019-02-03', 'Solo soporta 200mm. De 8\'\'', 4000, 2),
(4, 'Cinta Métrica', 'Tercer Cajón', 60000, 31, '2019-02-03', '3m x 300mm', 8000, 2),
(5, 'Eje', '8 der. 1-2', 700000, 16, '2019-01-29', 'BM100-110 blabla', 350000, 2),
(6, 'flinston', 'asd', 10, 2, '2019-01-01', 'a', 5, 1),
(7, 'laaaeeeeeeeeeeee', 'aa', 2, 3, '2019-01-01', 'asdasdasdsad', 1, 1),
(8, '123', 'aaa', 4, 5, '2019-01-01', 'asddas', 2, 1),
(9, '321', 'aa', 1, 2, '2019-01-01', 'asda', 4, 1),
(10, 'aaaaaaaaaaa', 'aa', 21, 11, '2019-01-01', 'aqweqeq', 12, 1),
(11, 'ddddddddddd', 'aasd', 2112, 21, '2019-01-01', 'ssssssss', 12, 1),
(12, 'ccccccccccccc', 'fgffffff', 3321, 321, '2019-01-01', 'asda', 12312, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producxcompras`
--

CREATE TABLE `producxcompras` (
  `Productos_id_producto` int(11) NOT NULL,
  `Compras_id_compras` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `compraprecio` int(11) DEFAULT NULL,
  `Iva_id_iva` int(11) NOT NULL,
  `subtcom5` int(11) DEFAULT NULL,
  `subtcom10` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producxfacturas`
--

CREATE TABLE `producxfacturas` (
  `Productos_id_producto` int(11) NOT NULL,
  `Facturacion_id_venta` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `subtotal10` double DEFAULT NULL,
  `subtotal5` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedores` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `RUC` varchar(45) DEFAULT NULL,
  `correo` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedores`, `nombre`, `telefono`, `RUC`, `correo`) VALUES
(1, 'oscar1', '1231231', '0985-3', '-2aaaaaaaa'),
(2, 'aaaaaa', '1231231', '22', '55'),
(4, 'ffffffff', '666', '777', '@'),
(5, 'hola', '09855555555', '5555-3', '@@');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibos`
--

CREATE TABLE `recibos` (
  `idRecibos` int(11) NOT NULL,
  `monto` double DEFAULT NULL,
  `CuentaCorriente_idCuentaCorriente` int(11) NOT NULL,
  `fecha_recibo` date DEFAULT NULL,
  `Pago` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timbrado`
--

CREATE TABLE `timbrado` (
  `id_timbrado` int(11) NOT NULL,
  `nro_timbrado` varchar(45) DEFAULT NULL,
  `factura_numeracion_inicio` int(11) DEFAULT NULL,
  `factura_numeracion_final` int(11) DEFAULT NULL,
  `fecha_vigencia_inicio` date DEFAULT NULL,
  `fecha_vigencia_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usua`
--

CREATE TABLE `tipos_usua` (
  `id_tipous` int(11) NOT NULL,
  `descrip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_usua`
--

INSERT INTO `tipos_usua` (`id_tipous`, `descrip`) VALUES
(1, 'administrador'),
(2, 'cajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Tipos_usua_id_tipous` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nombre`, `password`, `Tipos_usua_id_tipous`) VALUES
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(3, 'cajero', 'f80bb5a954ee71b40f1c31b79734d82d', 2),
(4, 'cajero', '81dc9bdb52d04dc20036dbd8313ed055', 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viista_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viista_productos` (
);

-- --------------------------------------------------------

--
-- Estructura para la vista `viista_productos`
--
DROP TABLE IF EXISTS `viista_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viista_productos`  AS  select `p`.`id_producto` AS `id_producto`,`p`.`nombre_producto` AS `nombre_producto`,`p`.`ubicacion` AS `ubicacion`,`p`.`precio` AS `precio`,`p`.`cantidad` AS `cantidad`,`p`.`fecha_ultimacompra` AS `fecha_ultimacompra`,`p`.`descripcion_produ` AS `descripcion_produ`,`p`.`preciocompra` AS `preciocompra`,`i`.`descrip_iva` AS `descrip_iva`,`m`.`descrip` AS `descrip` from ((`productos` `p` join `marcas` `m`) join `iva` `i`) where `i`.`id_iva` = `p`.`Iva_id_iva` and `m`.`id_marcas` = `p`.`Marcas_id_marcas` ;

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
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `fk_Compras_Proveedores1_idx` (`Proveedores_id_proveedores`);

--
-- Indices de la tabla `cuentacorriente`
--
ALTER TABLE `cuentacorriente`
  ADD PRIMARY KEY (`idCuentaCorriente`),
  ADD KEY `fk_CuentaCorriente_Clientes1_idx` (`Clientes_id_cliente`),
  ADD KEY `fk_CuentaCorriente_Factura1_idx` (`Factura_id_factura`);

--
-- Indices de la tabla `datos_empresa`
--
ALTER TABLE `datos_empresa`
  ADD PRIMARY KEY (`id_datos_empresa`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_Factura_Clientes1_idx` (`Clientes_id_cliente`);

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
  ADD PRIMARY KEY (`id_movimiento_caja`),
  ADD KEY `fk_Movimiento_Caja_Caja1_idx` (`Caja_id_caja`);

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
  ADD KEY `fk_Productos_Iva1_idx` (`Iva_id_iva`);

--
-- Indices de la tabla `producxcompras`
--
ALTER TABLE `producxcompras`
  ADD PRIMARY KEY (`Productos_id_producto`,`Compras_id_compras`),
  ADD KEY `fk_Productos_has_Compras_Compras1_idx` (`Compras_id_compras`),
  ADD KEY `fk_Productos_has_Compras_Productos1_idx` (`Productos_id_producto`),
  ADD KEY `Iva_id_ivakkk` (`Iva_id_iva`) USING BTREE;

--
-- Indices de la tabla `producxfacturas`
--
ALTER TABLE `producxfacturas`
  ADD PRIMARY KEY (`Productos_id_producto`,`Facturacion_id_venta`),
  ADD KEY `fk_Productos_has_Facturacion_Facturacion1_idx` (`Facturacion_id_venta`),
  ADD KEY `fk_Productos_has_Facturacion_Productos1_idx` (`Productos_id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedores`);

--
-- Indices de la tabla `recibos`
--
ALTER TABLE `recibos`
  ADD PRIMARY KEY (`idRecibos`),
  ADD KEY `fk_Recibos_CuentaCorriente1` (`CuentaCorriente_idCuentaCorriente`);

--
-- Indices de la tabla `timbrado`
--
ALTER TABLE `timbrado`
  ADD PRIMARY KEY (`id_timbrado`);

--
-- Indices de la tabla `tipos_usua`
--
ALTER TABLE `tipos_usua`
  ADD PRIMARY KEY (`id_tipous`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD KEY `fk_Usuarios_Tipos_usua1_idx` (`Tipos_usua_id_tipous`);

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
  MODIFY `id_auditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `cuentacorriente`
--
ALTER TABLE `cuentacorriente`
  MODIFY `idCuentaCorriente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `datos_empresa`
--
ALTER TABLE `datos_empresa`
  MODIFY `id_datos_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_func` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `iva`
--
ALTER TABLE `iva`
  MODIFY `id_iva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marcas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  MODIFY `id_movimiento_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

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
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `recibos`
--
ALTER TABLE `recibos`
  MODIFY `idRecibos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `timbrado`
--
ALTER TABLE `timbrado`
  MODIFY `id_timbrado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_usua`
--
ALTER TABLE `tipos_usua`
  MODIFY `id_tipous` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adelantos`
--
ALTER TABLE `adelantos`
  ADD CONSTRAINT `fk_adelantos_funcionarios` FOREIGN KEY (`funcionarios_id_func`) REFERENCES `funcionarios` (`id_func`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_Compras_Proveedores1` FOREIGN KEY (`Proveedores_id_proveedores`) REFERENCES `proveedores` (`id_proveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuentacorriente`
--
ALTER TABLE `cuentacorriente`
  ADD CONSTRAINT `fk_CuentaCorriente_Clientes1` FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CuentaCorriente_Factura1` FOREIGN KEY (`Factura_id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_Factura_Clientes1` FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funcionariosxorden`
--
ALTER TABLE `funcionariosxorden`
  ADD CONSTRAINT `fk_funcionarios_has_ordenserv_funcionarios1` FOREIGN KEY (`funcionarios_id_func`) REFERENCES `funcionarios` (`id_func`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_funcionarios_has_ordenserv_ordenserv1` FOREIGN KEY (`ordenserv_id_orden`) REFERENCES `ordenserv` (`id_orden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  ADD CONSTRAINT `fk_Movimiento_Caja_Caja1` FOREIGN KEY (`Caja_id_caja`) REFERENCES `caja` (`id_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_Productos_Iva1` FOREIGN KEY (`Iva_id_iva`) REFERENCES `iva` (`id_iva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producxcompras`
--
ALTER TABLE `producxcompras`
  ADD CONSTRAINT `fk_Productos_has_Compras_Compras1` FOREIGN KEY (`Compras_id_compras`) REFERENCES `compras` (`id_compras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_has_Compras_Productos1` FOREIGN KEY (`Productos_id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producxcompras_Iva1` FOREIGN KEY (`Iva_id_iva`) REFERENCES `iva` (`id_iva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producxfacturas`
--
ALTER TABLE `producxfacturas`
  ADD CONSTRAINT `fk_Productos_has_Facturacion_Facturacion1` FOREIGN KEY (`Facturacion_id_venta`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_has_Facturacion_Productos1` FOREIGN KEY (`Productos_id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recibos`
--
ALTER TABLE `recibos`
  ADD CONSTRAINT `fk_Recibos_CuentaCorriente1` FOREIGN KEY (`CuentaCorriente_idCuentaCorriente`) REFERENCES `cuentacorriente` (`idCuentaCorriente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_Usuarios_Tipos_usua1` FOREIGN KEY (`Tipos_usua_id_tipous`) REFERENCES `tipos_usua` (`id_tipous`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
