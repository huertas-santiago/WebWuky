#No se ha agregado el iva por producto   iva FLOAT UNSIGNED NULL COMMENT 'Impuesto asociado al producto\n',
#No se ha agregado el stok cantidad_stock INT UNSIGNED NULL COMMENT 'cantidad de prodcutos en el inventario',

DROP DATABASE IF EXISTS DBWuky;
CREATE DATABASE IF NOT EXISTS DBWuky DEFAULT CHARACTER SET utf8;
USE DBWuky;

CREATE TABLE IF NOT EXISTS marca(
  id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca',
  nombre VARCHAR(45) NULL COMMENT 'Nombre de la marca',
  descripcion VARCHAR(45) NULL COMMENT 'Detalle o caracteristicas de la marca',
  PRIMARY KEY (id_marca))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS producto (
  id_interno INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'id de clase ',
  id_externo VARCHAR(45) NULL COMMENT 'id de la clase',
  id_facebook VARCHAR(45) NULL COMMENT 'id de la clase ',
  marca VARCHAR(45) NULL COMMENT ' identificador comercial de los bienes y servicios que ofrece una empresa',
  
  fabricado BOOLEAN NULL COMMENT '',
  descripción VARCHAR(400) NULL COMMENT 'Detalle o caracteristicas de la clase',
  
  #Estos campos no irían en esta tabla
  #moneda VARCHAR(10) NULL COMMENT 'Nombre de la moneda con la que esta el precio',
  #descuento INT UNSIGNED NULL COMMENT 'Porcentaje de disminución del precio de un bien o un servicio',
  #visualizacion_eCommerce BOOLEAN NOT NULL COMMENT 'Verdadero si esta habilitada la visualizacion, compra... en el e-commerce',
  #visualización_facebook BOOLEAN NOT NULL COMMENT 'Verdadero si esta habilitada la visualizacion, compra... en facebook',
  #sexo VARCHAR(45) NULL COMMENT 'hace referencia a las características biológicas y fisiológicas que definen a los machos de las hembras',

  #Este campo esta para debatir si quitarlo
  #disponible_facebook VARCHAR(45) NULL COMMENT 'Inventario de los productos disponibles de la aplicación',
  id_marca INT NULL COMMENT 'id clase',
  proveedor_idproveedor INT NOT NULL COMMENT 'id clase',
  #version VARCHAR(45) NULL COMMENT 'Valor númerico de la actualización del producto',
  PRIMARY KEY (id_interno),
  INDEX id_marca_idx (id_marca ASC) VISIBLE,
  CONSTRAINT id_marca
    FOREIGN KEY (id_marca)
    REFERENCES marca (id_marca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Imagenes(
	id_imagenes INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase imagenes'
    
);

CREATE TABLE IF NOT EXISTS caracteristicas(
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS telefono (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS rol (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS usuario (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS cliente (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS producto_favorito (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS categoria (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS especie (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS raza (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS mascota (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS tipo_contrato (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS empleado (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS entidad_afiliada (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS afiliacion (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS pedido (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS estados_pedidos (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS factura (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS factura_cliente (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS estados_facturas_cliente (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS proveedor (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS factura_proveedor (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS carrito (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS infografia (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS tema_preguntas (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS preguntas_frecuentes (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS dispositivo (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS logs_empleado (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS acciones (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS acciones_realizadas (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS información (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS logs_cliente (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS permisos (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS producto_imagenes (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS caracteristicas_productos (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS categoria_productos (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS tipo_material (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS materiales (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS productos_materiales (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS rol_permiso (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS transportadora (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS envio (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS producto_pedido (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS producto_facturaProveedor (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS producto_carrito (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS imagenes_infografia (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');
