-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2022 a las 03:57:01
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbwuky`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones_realizadas`
--

CREATE TABLE `acciones_realizadas` (
  `id_acciones_realizadas` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase acciones_realizadas',
  `id_logs_empleado` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase logs_empleado',
  `tipo_accion` varchar(45) NOT NULL COMMENT 'Nombre de la accion realizada',
  `descripción` varchar(200) DEFAULT NULL COMMENT 'descripcion clase accion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliacion`
--

CREATE TABLE `afiliacion` (
  `id_entidad_afiliada` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase entidad_afiliada',
  `id_empleado` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase empleado',
  `nombre_afiliacion` varchar(10) DEFAULT NULL COMMENT 'Nombre de la afiliciacion del empleado, puede ser EPS',
  `fecha_afiliacion` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `codigo_afiliacion` varchar(15) DEFAULT NULL COMMENT 'Codigo que el empleado tiene es ésta entidad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_cliente` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase cliente',
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase producto',
  `cantidad_producto` varchar(45) DEFAULT NULL COMMENT 'Número determinado de unidades adquiridos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_cliente`, `id_producto`, `cantidad_producto`) VALUES
(3, 1, '4'),
(4, 3, '10'),
(5, 4, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase categoria',
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Alimentos', 'Comida para gato y perro'),
(2, 'Juguetes', 'Jugueteria para gato y perro'),
(3, 'Camas y Maletas', 'Camas y maletas para gato y perro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `id_producto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id_categoria`, `id_producto`) VALUES
(1, 1),
(2, 1),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase cliente y FK de la tabla Usuario',
  `facebook_vinculado` varchar(50) DEFAULT NULL COMMENT 'cuenta de facebook asociada del cliente',
  `correo_vinculado` varchar(50) DEFAULT NULL COMMENT 'cuenta de correo asociada del cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_usuario`, `facebook_vinculado`, `correo_vinculado`) VALUES
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'FK de la clase Usuario',
  `id_tipo_contrato` int(10) UNSIGNED NOT NULL COMMENT 'FK de la clase tipo_contrato, Especifica el contrato que el usuario tendra',
  `id_rol` int(10) UNSIGNED NOT NULL COMMENT 'FK de la clase rol',
  `foto` int(10) UNSIGNED NOT NULL COMMENT 'FK de la clase imagen',
  `grupo_sanguineo_RH` varchar(3) DEFAULT NULL COMMENT 'Tipo de sangre',
  `fecha_contratacion` date DEFAULT NULL COMMENT 'fecha de proceso contrato usuario',
  `fecha_fin_contratacion` date DEFAULT NULL COMMENT 'fecha de proceso contrato usuario',
  `codigo_contrato` int(10) UNSIGNED DEFAULT NULL COMMENT 'Numero único de contratación',
  `activo` tinyint(1) DEFAULT 0,
  `cargo` varchar(45) DEFAULT NULL COMMENT 'Especifica el cargo que manejara'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_usuario`, `id_tipo_contrato`, `id_rol`, `foto`, `grupo_sanguineo_RH`, `fecha_contratacion`, `fecha_fin_contratacion`, `codigo_contrato`, `activo`, `cargo`) VALUES
(1, 2, 2, 3, 'O-', '2021-12-12', '2022-12-12', 3, 1, 'Auxiliar de Contabilidad'),
(2, 2, 2, 1, 'O+', '2022-05-12', '2022-10-12', 1, 1, 'Auxiliar de Contabilidad'),
(6, 3, 1, 2, 'AB+', '2022-01-01', '2022-03-15', 2, 1, 'Administradora de Plataformas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad_afiliada`
--

CREATE TABLE `entidad_afiliada` (
  `id_entidad_afiliada` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase entidad_afiliada',
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id_envio` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase envio',
  `id_transportadora` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK de la tabla transportadora',
  `codigo_envio` varchar(15) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `largo` int(10) UNSIGNED DEFAULT NULL,
  `ancho` int(10) UNSIGNED DEFAULT NULL,
  `alto` int(10) UNSIGNED DEFAULT NULL,
  `valor_declarado` float DEFAULT NULL,
  `direccion_envio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id_envio`, `id_transportadora`, `codigo_envio`, `peso`, `largo`, `ancho`, `alto`, `valor_declarado`, `direccion_envio`) VALUES
(1, NULL, '001', 2.5, 10, 12, 5, 8.5, 'carrera 1 #30-76'),
(2, NULL, '002', 5.2, 20, 17, 45, 10.5, 'carrera 1 #30-76'),
(3, NULL, '003', 28.5, 44, 18, 42, 11, 'carrera 2 #20-56'),
(4, NULL, '004', 20, 60, 60, 10, 8.5, 'calle 30 #2-66');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie`
--

CREATE TABLE `especie` (
  `id_especie` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase especie',
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especie`
--

INSERT INTO `especie` (`id_especie`, `nombre`) VALUES
(1, 'Gato'),
(2, 'Perro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_pedidos`
--

CREATE TABLE `estados_pedidos` (
  `id_estados_pedidos` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase estados_pedidos',
  `id_pedido` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase pedido',
  `estado` varchar(10) NOT NULL,
  `nota` varchar(200) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `tiempo` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_factura_cliente`
--

CREATE TABLE `estado_factura_cliente` (
  `id_estado_factura_cliente` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase estados_facturas_cliente',
  `id_factura_cliente` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase factura_cliente',
  `estado` varchar(10) NOT NULL COMMENT 'Accion "Pendiente", "Pagada"',
  `fecha_inicio` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_factura_cliente`
--

INSERT INTO `estado_factura_cliente` (`id_estado_factura_cliente`, `id_factura_cliente`, `estado`, `fecha_inicio`) VALUES
(1, 2, 'Pendiente', '2022-02-03 00:00:00'),
(2, 1, 'Pagada', '2020-02-02 00:00:00'),
(3, 3, 'Pagada', '2022-01-02 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_cliente`
--

CREATE TABLE `factura_cliente` (
  `id_factura_cliente` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase factura_cliente',
  `fecha` datetime DEFAULT NULL,
  `rete_ica` float DEFAULT NULL,
  `rete_fuente` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `compra_neta` float DEFAULT NULL,
  `dijitos_tarjeta` varchar(20) DEFAULT NULL,
  `id_banco` varchar(20) DEFAULT NULL,
  `codigo_facturado` varchar(20) DEFAULT NULL,
  `respuesta_banco` tinyint(1) DEFAULT NULL,
  `forma_pago` varchar(2) DEFAULT NULL,
  `nombre_destinatario` varchar(20) DEFAULT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `numero_documento` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura_cliente`
--

INSERT INTO `factura_cliente` (`id_factura_cliente`, `fecha`, `rete_ica`, `rete_fuente`, `iva`, `subtotal`, `compra_neta`, `dijitos_tarjeta`, `id_banco`, `codigo_facturado`, `respuesta_banco`, `forma_pago`, `nombre_destinatario`, `tipo_documento`, `numero_documento`) VALUES
(1, '2022-06-07 00:00:00', 0, 0, 23456.6, 123456, 146913, '956', 'B12', '67545h6767', 1, 'Tj', 'Santiago Huertas', 'C', '8706833565'),
(2, '2019-10-01 00:00:00', 0, 0, 110200, 580000, 690200, '970', 'B13', '67545h6768', 0, 'Tj', 'Marlon Martinez', 'C', '378120729'),
(3, '2022-10-20 00:00:00', 0, 0, 6460, 34000, 40460, '226', 'B14', '67545h6769', 1, 'Tj', 'Lucas Contreras', 'C', '1038055081'),
(4, '2020-10-12 00:00:00', 0, 0, 22800, 120000, 142800, '142', 'B15', '67545h6770', 1, 'Tj', 'Milena Castro ', 'C', '4592966760');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_proveedor`
--

CREATE TABLE `factura_proveedor` (
  `id_factura` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase factura_proveedor',
  `id_empleado` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase empleado, Quien realizó el pedido',
  `id_proveedor` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase proveedor',
  `fecha` datetime NOT NULL COMMENT 'Fecha en que se realizó el pedido',
  `fecha_cancelado` datetime DEFAULT NULL COMMENT 'Fecha en que se pagó el pedido',
  `rete_ica` varchar(45) DEFAULT NULL COMMENT 'Impuesto de retención',
  `rete_fuente` varchar(45) DEFAULT NULL COMMENT 'Impuesto de retención',
  `iva` int(11) DEFAULT NULL COMMENT 'Impuesto asociado al producto',
  `subtotal` int(11) DEFAULT NULL COMMENT 'Valor de la suma de los productos',
  `precio_total` float DEFAULT NULL COMMENT 'total de  la suma de los productos',
  `abono` float DEFAULT NULL COMMENT 'Total abonado a la factura',
  `tipo_pago` varchar(45) DEFAULT NULL COMMENT 'forma con que se genera el pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id_imagen` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase imagenes',
  `url` varchar(45) NOT NULL COMMENT 'dirección web de donde está guardada la imagen',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'caracteristicas de la imagen',
  `tamaño` varchar(1) DEFAULT 'P' COMMENT 'Puede estar la misma imagen con diferente tamaño (PEQUEÑO,MEDIANO,GRANDE), para la carga responsive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id_imagen`, `url`, `descripcion`, `tamaño`) VALUES
(1, 'https://images.app.goo.gl/Y1Z5PurqitfCGRgCA', 'Foto de Lupe Gomez', 'P'),
(2, 'https://images.app.goo.gl/Qer9qCJbQdSBSm8e9', 'Foto de Alejandra Herrera', 'P'),
(3, 'https://images.app.goo.gl/4D36yBeYVHQUtydN6', 'Foto de Pepito Perez', 'P'),
(4, 'https://images.app.goo.gl/K13DUXHQ5qsEsMeU8', 'Foto de Gato Persa', 'P'),
(5, 'https://images.app.goo.gl/uehwDKNMPRK1JQKZ6', 'Foto de Perro Bulldog', 'M'),
(6, 'https://images.app.goo.gl/ycwSQ3F64iZHe84Q9', 'Foto de Perro Pastor Aleman', 'P'),
(7, 'https://images.app.goo.gl/ab4xVUdBBDTMgwbZ7', 'Foto de Gato Maine Coon', 'P'),
(8, 'https://images.app.goo.gl/megbGYmqbQTuiCL28', 'Foto de Gato Bengala', 'G'),
(9, 'https://images.app.goo.gl/v1KruVYAqJSb32c79', 'Comida para perro', 'G'),
(10, 'https://images.app.goo.gl/7Ma5PQPGkc52NXYi6', 'Comida para gato', 'G'),
(11, 'https://images.app.goo.gl/wAVwM72au2mR1NBH7', 'Cama para perro', 'G'),
(12, 'https://images.app.goo.gl/pJSghSXj4qyLd74i6', 'Maleta para gato', 'G');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_infografia`
--

CREATE TABLE `imagenes_infografia` (
  `id_imagen` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase imagen',
  `id_infografia` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase infografia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infografia`
--

CREATE TABLE `infografia` (
  `id_infografia` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase infografia',
  `texto` text DEFAULT NULL,
  `seccion` int(10) UNSIGNED DEFAULT NULL COMMENT 'En que posicion esta ubicado la infografia en el home del cliente',
  `nombre_infografia` varchar(45) DEFAULT NULL,
  `habilitado` tinyint(1) DEFAULT 1 COMMENT 'Representa si se muestra o no la infografia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `información`
--

CREATE TABLE `información` (
  `id_información` int(10) UNSIGNED NOT NULL,
  `id_imagen` int(10) UNSIGNED DEFAULT NULL,
  `texto` text NOT NULL,
  `titulo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_cliente`
--

CREATE TABLE `logs_cliente` (
  `id_logs_cliente` int(10) UNSIGNED NOT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `direccion_ip` int(11) NOT NULL,
  `Tiempo_en_plataforma` time NOT NULL,
  `hora_inicio` time NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `dispositivo` varchar(50) NOT NULL COMMENT 'nombre del dispositivo con el que se conectó, PC..Celular'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_empleado`
--

CREATE TABLE `logs_empleado` (
  `id_logs_empleado` int(10) UNSIGNED NOT NULL,
  `id_empleado` int(10) UNSIGNED NOT NULL,
  `direccion_ip` int(11) NOT NULL,
  `Tiempo_en_plataforma` time NOT NULL,
  `hora_inicio` time NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `dispositivo` varchar(50) NOT NULL COMMENT 'nombre del dispositivo con el que se conectó, PC..Celular'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase marca',
  `nombre` varchar(45) DEFAULT NULL COMMENT 'Nombre de la marca'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre`) VALUES
(1, 'GUAMBA'),
(2, 'FURRY'),
(3, 'PETYS'),
(4, 'MAX'),
(5, 'PURINA ONE'),
(6, 'EQUILIBRIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `id_mascota` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase mascota',
  `id_raza` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase raza',
  `id_cliente` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase cliente',
  `id_foto` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase imagen',
  `nombre` varchar(45) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `tamaño` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`id_mascota`, `id_raza`, `id_cliente`, `id_foto`, `nombre`, `sexo`, `tamaño`, `fecha_nacimiento`) VALUES
(1, 1, 3, 5, 'lucas', 'M', 'Grande', '2015-05-12'),
(2, 6, 4, 4, 'Anastacia', 'H', 'Pequeño', '2020-08-02'),
(3, 7, 5, 7, 'Horacio', 'M', 'Grande', '2018-12-16'),
(4, 8, 3, 8, 'Pancho', 'H', 'Pequeña', '2018-12-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `id_material` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase materiales',
  `tipo_material` varchar(45) NOT NULL COMMENT 'Tipo de la variante como PESO, DIMENSION, COLOR, TELA',
  `medida` varchar(45) DEFAULT NULL COMMENT 'Como se mide el tipo, si es peso la medida es Kg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`id_material`, `tipo_material`, `medida`) VALUES
(1, 'Peso', '25kg'),
(2, 'Peso', '50kg'),
(3, 'Material nacional', 'Alto: 42 Cm Ancho 44 cm & Profundo 17,5 cm'),
(4, 'Material nacional', '60cmX60cm y 70cmX70 cm.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase pedido',
  `id_cliente` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK a la clase cliente, si es un pedido de un proveedor este campo va en null',
  `id_envio` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK a la clase envio',
  `id_factura_cliente` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK a la clase factura_cliente',
  `contador` int(10) UNSIGNED DEFAULT 1 COMMENT 'cuenta cuantos pedidos tiene el cliente',
  `fecha` date NOT NULL COMMENT 'Fecha en la que se encargó el pedido',
  `origen` varchar(2) DEFAULT 'EC' COMMENT 'De donde se originó el pedido, Facebook, Instagram, eCommerce'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `id_envio`, `id_factura_cliente`, `contador`, `fecha`, `origen`) VALUES
(1, 3, 1, NULL, 1, '2022-03-25', 'EC'),
(2, 3, 2, NULL, 1, '2022-04-13', 'EC'),
(3, 4, 3, NULL, 1, '2022-04-25', 'EC'),
(4, 5, 4, NULL, 1, '2022-05-15', 'EC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(10) UNSIGNED NOT NULL,
  `nombre_permiso` varchar(45) NOT NULL COMMENT 'nombre del rol del usuario',
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `nombre_permiso`, `descripcion`) VALUES
(1, 'Editar Producto', NULL),
(2, 'Agregar Producto', NULL),
(3, 'Eliminar Producto', NULL),
(4, 'Agregar Empleado', NULL),
(5, 'Editar Empleado', NULL),
(6, 'Eliminar Empleado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_frecuentes`
--

CREATE TABLE `preguntas_frecuentes` (
  `id_preguntas_frecuentes` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase preguntas_frecuentes',
  `id_tema_preguntas` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase tema_preguntas',
  `pregunta` varchar(45) DEFAULT NULL,
  `respuesta` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase imagenes producto',
  `id_marca` int(10) UNSIGNED DEFAULT NULL COMMENT 'llave foranea a la tabla marca',
  `id_proveedor` int(10) UNSIGNED NOT NULL COMMENT 'llave foranea a la tabla proveedor',
  `codigo_externo` varchar(45) DEFAULT NULL COMMENT 'Referencia UNICA del producto que tiene el proveedor',
  `codigo_facebook` varchar(45) DEFAULT NULL COMMENT 'Referencia UNICA del producto que tiene facebook',
  `fabricado` tinyint(1) DEFAULT NULL COMMENT 'Valor que dice si el producto es fabricado o comprado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_marca`, `id_proveedor`, `codigo_externo`, `codigo_facebook`, `fabricado`) VALUES
(1, 4, 8, 'COD03', 'FAC002', 0),
(2, 5, 7, 'COD04', 'FAC003', 0),
(3, 1, 7, 'COD05', 'FAC004', 0),
(4, 2, 7, 'COD06', 'FAC005', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_factura_proveedor`
--

CREATE TABLE `producto_factura_proveedor` (
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase producto',
  `id_pedido` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase pedido',
  `cantidad` int(10) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_favorito`
--

CREATE TABLE `producto_favorito` (
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase producto_favorito',
  `id_cliente` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase cliente',
  `cantidad` int(10) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_favorito`
--

INSERT INTO `producto_favorito` (`id_producto`, `id_cliente`, `cantidad`) VALUES
(1, 3, 5),
(3, 4, 2),
(4, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_imagen`
--

CREATE TABLE `producto_imagen` (
  `id_imagen` int(10) UNSIGNED NOT NULL,
  `id_producto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_imagen`
--

INSERT INTO `producto_imagen` (`id_imagen`, `id_producto`) VALUES
(9, 1),
(10, 2),
(12, 3),
(11, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_pedido`
--

CREATE TABLE `producto_pedido` (
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase producto',
  `id_pedido` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase pedido',
  `cantidad` int(10) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_pedido`
--

INSERT INTO `producto_pedido` (`id_producto`, `id_pedido`, `cantidad`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'FK de la clase Usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_usuario`) VALUES
(7),
(8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `id_raza` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase raza',
  `id_especie` int(10) UNSIGNED DEFAULT NULL COMMENT 'PK de la clase especie',
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`id_raza`, `id_especie`, `nombre`) VALUES
(1, 2, 'Bulldog'),
(2, 2, 'Pastor Aleman'),
(3, 2, 'Boxer'),
(4, 2, 'Pug'),
(5, 2, 'Labrador'),
(6, 1, 'Gato Persa'),
(7, 1, 'Maine Coon'),
(8, 1, 'Bengala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase rol',
  `nombre_rol` varchar(45) NOT NULL COMMENT 'nombre del rol del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `id_rol` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase rol',
  `id_permiso` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase permiso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`id_rol`, `id_permiso`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id_telefono` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase telefono',
  `numero` varchar(10) DEFAULT NULL COMMENT 'Número Telefono Celular',
  `fijo` tinyint(1) DEFAULT 0 COMMENT 'Representa si el Número Telefono ES FIJO',
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'FK a la clase usuario',
  `observacion` varchar(150) DEFAULT NULL COMMENT 'Si hace referencia a un numero de telefono de una empresa, este puede tener un cargo...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema_preguntas`
--

CREATE TABLE `tema_preguntas` (
  `id_tema_preguntas` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase tema_preguntas',
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE `tipo_contrato` (
  `id_tipo_contrato` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase tipo_contrato',
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_contrato`
--

INSERT INTO `tipo_contrato` (`id_tipo_contrato`, `nombre`) VALUES
(1, 'Termino Indefinido'),
(2, 'Termino Fijo'),
(3, 'Obra a Labor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportadora`
--

CREATE TABLE `transportadora` (
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase transportadora y FK de la tabla Usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase usuario',
  `correo` varchar(100) NOT NULL COMMENT 'Correo de usuario',
  `contrasenna` varchar(50) NOT NULL COMMENT 'contraseña de correo de usuario',
  `nombre` varchar(100) NOT NULL COMMENT 'nombre de usuario',
  `genero` varchar(1) DEFAULT NULL COMMENT 'genero de usuario',
  `tipo_documento` varchar(3) DEFAULT NULL COMMENT 'tipo de documento de usuario',
  `numero_documento` varchar(15) DEFAULT NULL COMMENT 'numero de documento de identifidad',
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL COMMENT 'direccion de usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `correo`, `contrasenna`, `nombre`, `genero`, `tipo_documento`, `numero_documento`, `fecha_nacimiento`, `direccion`) VALUES
(1, 'pepito@perez.com', 'xxxxx', 'Pepito Perez', 'M', 'CC', '1001000000', '1999-05-25', 'KR 150 #18-68 Bgta'),
(2, 'lupe@gomez.com', 'xxxxx', 'Lupe Gomez', 'F', 'CC', '1001000001', '1998-05-25', 'KR 50 #10-23 Bgta'),
(3, 'hernan@gomez.com', 'xxxxx', 'Hernan Gomez', 'M', 'CC', '1001000023', '1998-05-10', 'CLL 01 #10-23 Bgta'),
(4, 'santiago@huertas.com', 'xxxxx', 'Santiago Huertas', 'M', 'TI', '1001000121', '2003-10-10', 'CLL 9 #10-23 Bgta'),
(5, 'jessica@perez.com', 'xxxxx', 'Jessica Perez', 'F', 'CC', '1001000523', '1989-10-20', 'KR 50 #10-28 Bgta'),
(6, 'alejandra@herrera.com', 'xxxxx', 'Alejandra Herrera', 'F', 'TI', '1001569881', '2005-01-10', 'KR 50 #10-23 Bgta'),
(7, 'hillscolombia@hillspet.com', 'xxxxx', 'HILLS', 'N', 'NIT', '800777654', NULL, 'EEUU'),
(8, 'sacpet@adm.com', 'xxxxx', 'MAX TOTAL', 'N', 'NIT', '900345762', NULL, 'Bgta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variante`
--

CREATE TABLE `variante` (
  `id_variante` int(10) UNSIGNED NOT NULL COMMENT 'PK de la clase variante, contador de variantes para un producto',
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'ID de la clase acual',
  `precio` int(10) UNSIGNED NOT NULL COMMENT 'Precio del producto',
  `descuento` int(10) UNSIGNED DEFAULT 0 COMMENT 'Porcentaje de disminución del precio de un bien o un servicio',
  `visualizacion_eCommerce` tinyint(1) DEFAULT 1 COMMENT 'Verdadero si esta habilitada la visualizacion, compra... en el e-commerce',
  `visualización_facebook` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Verdadero si esta habilitada la visualizacion, compra... en facebook',
  `sexo` varchar(45) DEFAULT NULL COMMENT 'hace referencia a las características biológicas y fisiológicas que definen a los machos de las hembras',
  `descripción` varchar(10000) DEFAULT NULL COMMENT 'Texto donde describe el producto',
  `stock` int(10) UNSIGNED DEFAULT 0 COMMENT 'Cantidad de productos en el inventario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `variante`
--

INSERT INTO `variante` (`id_variante`, `id_producto`, `precio`, `descuento`, `visualizacion_eCommerce`, `visualización_facebook`, `sexo`, `descripción`, `stock`) VALUES
(1, 1, 20, 0, 1, 1, NULL, 'Comida para perro', 34),
(2, 2, 40, 0, 1, 1, NULL, 'Comida para perro', 5),
(3, 3, 110, 0, 1, 1, NULL, 'Cama trenza para perro', 10),
(4, 4, 150, 0, 1, 1, NULL, 'Portamascota - Cargador para mascota', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variante_material`
--

CREATE TABLE `variante_material` (
  `id_variante` int(10) UNSIGNED NOT NULL,
  `id_material` int(10) UNSIGNED NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL COMMENT 'Valor tomado por el tipo_material en material'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `variante_material`
--

INSERT INTO `variante_material` (`id_variante`, `id_material`, `cantidad`) VALUES
(1, 1, '20'),
(2, 2, '30'),
(3, 4, '10'),
(4, 3, '67');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones_realizadas`
--
ALTER TABLE `acciones_realizadas`
  ADD PRIMARY KEY (`id_acciones_realizadas`),
  ADD KEY `fk_acciones_realizadas_logs_empleado` (`id_logs_empleado`);

--
-- Indices de la tabla `afiliacion`
--
ALTER TABLE `afiliacion`
  ADD PRIMARY KEY (`id_entidad_afiliada`,`id_empleado`),
  ADD KEY `fk_afiliacion_empleado` (`id_empleado`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_cliente`,`id_producto`),
  ADD KEY `fk_carrito_producto` (`id_producto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id_categoria`,`id_producto`),
  ADD KEY `fk_categoria_producto_producto` (`id_producto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `facebook_vinculado` (`facebook_vinculado`),
  ADD UNIQUE KEY `correo_vinculado` (`correo_vinculado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_empleado_tipo_contrato` (`id_tipo_contrato`),
  ADD KEY `fk_empleado_rol` (`id_rol`);

--
-- Indices de la tabla `entidad_afiliada`
--
ALTER TABLE `entidad_afiliada`
  ADD PRIMARY KEY (`id_entidad_afiliada`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `fk_envio_transportadora` (`id_transportadora`);

--
-- Indices de la tabla `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`id_especie`);

--
-- Indices de la tabla `estados_pedidos`
--
ALTER TABLE `estados_pedidos`
  ADD PRIMARY KEY (`id_estados_pedidos`),
  ADD KEY `fk_estados_pedidos_pedido` (`id_pedido`);

--
-- Indices de la tabla `estado_factura_cliente`
--
ALTER TABLE `estado_factura_cliente`
  ADD PRIMARY KEY (`id_estado_factura_cliente`),
  ADD KEY `fk_estado_factura_cliente_factura_cliente` (`id_factura_cliente`);

--
-- Indices de la tabla `factura_cliente`
--
ALTER TABLE `factura_cliente`
  ADD PRIMARY KEY (`id_factura_cliente`);

--
-- Indices de la tabla `factura_proveedor`
--
ALTER TABLE `factura_proveedor`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_factura_proveedor_empleado` (`id_empleado`),
  ADD KEY `fk_factura_proveedor_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imagen`);

--
-- Indices de la tabla `imagenes_infografia`
--
ALTER TABLE `imagenes_infografia`
  ADD PRIMARY KEY (`id_imagen`,`id_infografia`),
  ADD KEY `fk_imagenes_infografia_id_infografia` (`id_infografia`);

--
-- Indices de la tabla `infografia`
--
ALTER TABLE `infografia`
  ADD PRIMARY KEY (`id_infografia`);

--
-- Indices de la tabla `información`
--
ALTER TABLE `información`
  ADD PRIMARY KEY (`id_información`),
  ADD KEY `fk_información_imagen` (`id_imagen`);

--
-- Indices de la tabla `logs_cliente`
--
ALTER TABLE `logs_cliente`
  ADD PRIMARY KEY (`id_logs_cliente`),
  ADD KEY `fk_logs_cliente_cliente` (`id_cliente`);

--
-- Indices de la tabla `logs_empleado`
--
ALTER TABLE `logs_empleado`
  ADD PRIMARY KEY (`id_logs_empleado`),
  ADD KEY `fk_logs_empleado_empleado` (`id_empleado`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`id_mascota`),
  ADD KEY `fk_mascota_raza` (`id_raza`),
  ADD KEY `fk_mascota_cliente` (`id_cliente`),
  ADD KEY `fk_mascota_imagen` (`id_foto`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_factura_cliente` (`id_factura_cliente`),
  ADD KEY `fk_pedido_cliente` (`id_cliente`),
  ADD KEY `fk_pedido_envio` (`id_envio`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `preguntas_frecuentes`
--
ALTER TABLE `preguntas_frecuentes`
  ADD PRIMARY KEY (`id_preguntas_frecuentes`),
  ADD KEY `fk_preguntas_frecuentes_tema_preguntas` (`id_tema_preguntas`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_marca` (`id_marca`),
  ADD KEY `fk_producto_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `producto_factura_proveedor`
--
ALTER TABLE `producto_factura_proveedor`
  ADD PRIMARY KEY (`id_producto`,`id_pedido`),
  ADD KEY `fk_producto_factura_proveedor_pedido` (`id_pedido`);

--
-- Indices de la tabla `producto_favorito`
--
ALTER TABLE `producto_favorito`
  ADD KEY `fk_producto_favorito_producto` (`id_producto`),
  ADD KEY `fk_producto_favorito_cliente` (`id_cliente`);

--
-- Indices de la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD PRIMARY KEY (`id_producto`,`id_imagen`),
  ADD KEY `fk_producto_imagen_imagen` (`id_imagen`);

--
-- Indices de la tabla `producto_pedido`
--
ALTER TABLE `producto_pedido`
  ADD PRIMARY KEY (`id_producto`,`id_pedido`),
  ADD KEY `fk_producto_pedido_pedido` (`id_pedido`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD KEY `fk_proveedor_usuario` (`id_usuario`);

--
-- Indices de la tabla `raza`
--
ALTER TABLE `raza`
  ADD PRIMARY KEY (`id_raza`),
  ADD KEY `fk_raza_especie` (`id_especie`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`id_rol`,`id_permiso`),
  ADD KEY `fk_rol_permiso_permiso` (`id_permiso`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `id_telefono_usuario` (`id_usuario`);

--
-- Indices de la tabla `tema_preguntas`
--
ALTER TABLE `tema_preguntas`
  ADD PRIMARY KEY (`id_tema_preguntas`);

--
-- Indices de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  ADD PRIMARY KEY (`id_tipo_contrato`);

--
-- Indices de la tabla `transportadora`
--
ALTER TABLE `transportadora`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `variante`
--
ALTER TABLE `variante`
  ADD PRIMARY KEY (`id_variante`,`id_producto`),
  ADD KEY `fk_variante_producto` (`id_producto`);

--
-- Indices de la tabla `variante_material`
--
ALTER TABLE `variante_material`
  ADD PRIMARY KEY (`id_variante`,`id_material`),
  ADD KEY `fk_variante_material_material` (`id_material`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones_realizadas`
--
ALTER TABLE `acciones_realizadas`
  MODIFY `id_acciones_realizadas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase acciones_realizadas';

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase categoria', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `entidad_afiliada`
--
ALTER TABLE `entidad_afiliada`
  MODIFY `id_entidad_afiliada` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase entidad_afiliada';

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `id_envio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase envio', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `especie`
--
ALTER TABLE `especie`
  MODIFY `id_especie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase especie', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados_pedidos`
--
ALTER TABLE `estados_pedidos`
  MODIFY `id_estados_pedidos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase estados_pedidos';

--
-- AUTO_INCREMENT de la tabla `estado_factura_cliente`
--
ALTER TABLE `estado_factura_cliente`
  MODIFY `id_estado_factura_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase estados_facturas_cliente', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura_cliente`
--
ALTER TABLE `factura_cliente`
  MODIFY `id_factura_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase factura_cliente', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `factura_proveedor`
--
ALTER TABLE `factura_proveedor`
  MODIFY `id_factura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase factura_proveedor';

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase imagenes', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `infografia`
--
ALTER TABLE `infografia`
  MODIFY `id_infografia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase infografia';

--
-- AUTO_INCREMENT de la tabla `información`
--
ALTER TABLE `información`
  MODIFY `id_información` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs_cliente`
--
ALTER TABLE `logs_cliente`
  MODIFY `id_logs_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs_empleado`
--
ALTER TABLE `logs_empleado`
  MODIFY `id_logs_empleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase marca', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `id_mascota` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase mascota', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `id_material` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase materiales', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase pedido', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `preguntas_frecuentes`
--
ALTER TABLE `preguntas_frecuentes`
  MODIFY `id_preguntas_frecuentes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase preguntas_frecuentes';

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase imagenes producto', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `raza`
--
ALTER TABLE `raza`
  MODIFY `id_raza` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase raza', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase rol', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `id_telefono` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase telefono';

--
-- AUTO_INCREMENT de la tabla `tema_preguntas`
--
ALTER TABLE `tema_preguntas`
  MODIFY `id_tema_preguntas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase tema_preguntas';

--
-- AUTO_INCREMENT de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  MODIFY `id_tipo_contrato` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase tipo_contrato', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK de la clase usuario', AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acciones_realizadas`
--
ALTER TABLE `acciones_realizadas`
  ADD CONSTRAINT `fk_acciones_realizadas_logs_empleado` FOREIGN KEY (`id_logs_empleado`) REFERENCES `logs_empleado` (`id_logs_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `afiliacion`
--
ALTER TABLE `afiliacion`
  ADD CONSTRAINT `fk_afiliacion_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_afiliacion_entidad_afiliada` FOREIGN KEY (`id_entidad_afiliada`) REFERENCES `entidad_afiliada` (`id_entidad_afiliada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_carrito_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carrito_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD CONSTRAINT `fk_categoria_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categoria_producto_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_id_usuario__cliente` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_tipo_contrato` FOREIGN KEY (`id_tipo_contrato`) REFERENCES `tipo_contrato` (`id_tipo_contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `fk_envio_transportadora` FOREIGN KEY (`id_transportadora`) REFERENCES `transportadora` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estados_pedidos`
--
ALTER TABLE `estados_pedidos`
  ADD CONSTRAINT `fk_estados_pedidos_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estado_factura_cliente`
--
ALTER TABLE `estado_factura_cliente`
  ADD CONSTRAINT `fk_estado_factura_cliente_factura_cliente` FOREIGN KEY (`id_factura_cliente`) REFERENCES `factura_cliente` (`id_factura_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura_proveedor`
--
ALTER TABLE `factura_proveedor`
  ADD CONSTRAINT `fk_factura_proveedor_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_proveedor_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagenes_infografia`
--
ALTER TABLE `imagenes_infografia`
  ADD CONSTRAINT `fk_imagenes_infografia_id_imagen` FOREIGN KEY (`id_imagen`) REFERENCES `imagen` (`id_imagen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_imagenes_infografia_id_infografia` FOREIGN KEY (`id_infografia`) REFERENCES `infografia` (`id_infografia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `información`
--
ALTER TABLE `información`
  ADD CONSTRAINT `fk_información_imagen` FOREIGN KEY (`id_imagen`) REFERENCES `imagen` (`id_imagen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `logs_cliente`
--
ALTER TABLE `logs_cliente`
  ADD CONSTRAINT `fk_logs_cliente_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `logs_empleado`
--
ALTER TABLE `logs_empleado`
  ADD CONSTRAINT `fk_logs_empleado_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `fk_mascota_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mascota_imagen` FOREIGN KEY (`id_foto`) REFERENCES `imagen` (`id_imagen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mascota_raza` FOREIGN KEY (`id_raza`) REFERENCES `raza` (`id_raza`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_envio` FOREIGN KEY (`id_envio`) REFERENCES `envio` (`id_envio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_factura_cliente` FOREIGN KEY (`id_factura_cliente`) REFERENCES `factura_cliente` (`id_factura_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `preguntas_frecuentes`
--
ALTER TABLE `preguntas_frecuentes`
  ADD CONSTRAINT `fk_preguntas_frecuentes_tema_preguntas` FOREIGN KEY (`id_tema_preguntas`) REFERENCES `tema_preguntas` (`id_tema_preguntas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_factura_proveedor`
--
ALTER TABLE `producto_factura_proveedor`
  ADD CONSTRAINT `fk_producto_factura_proveedor_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_factura_proveedor_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_favorito`
--
ALTER TABLE `producto_favorito`
  ADD CONSTRAINT `fk_producto_favorito_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_favorito_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD CONSTRAINT `fk_producto_imagen_imagen` FOREIGN KEY (`id_imagen`) REFERENCES `imagen` (`id_imagen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_imagen_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_pedido`
--
ALTER TABLE `producto_pedido`
  ADD CONSTRAINT `fk_producto_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_pedido_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `raza`
--
ALTER TABLE `raza`
  ADD CONSTRAINT `fk_raza_especie` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id_especie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `fk_rol_permiso_permiso` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_permiso_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `id_telefono_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `transportadora`
--
ALTER TABLE `transportadora`
  ADD CONSTRAINT `fk_transportadora_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `variante`
--
ALTER TABLE `variante`
  ADD CONSTRAINT `fk_variante_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `variante_material`
--
ALTER TABLE `variante_material`
  ADD CONSTRAINT `fk_variante_material_material` FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_variante_material_variante` FOREIGN KEY (`id_variante`) REFERENCES `variante` (`id_variante`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
