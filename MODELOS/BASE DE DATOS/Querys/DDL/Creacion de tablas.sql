#No se ha agregado el iva por producto   iva FLOAT UNSIGNED NULL COMMENT 'Impuesto asociado al producto',
#No se ha agregado el stok cantidad_stock INT UNSIGNED NULL COMMENT 'cantidad de prodcutos en el inventario',

DROP DATABASE IF EXISTS DBWuky;
CREATE DATABASE IF NOT EXISTS DBWuky DEFAULT CHARACTER SET utf8;
USE DBWuky;

#Santiago
CREATE TABLE IF NOT EXISTS marca(
  id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca',
  nombre VARCHAR(45) NULL COMMENT 'Nombre de la marca',
  descripcion VARCHAR(45) NULL COMMENT 'Detalle o caracteristicas de la marca',
  PRIMARY KEY (id_marca))
ENGINE = InnoDB;

#Santiago
CREATE TABLE IF NOT EXISTS producto (
  id_interno INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase imagenes producto',
  id_externo VARCHAR(45) NULL COMMENT 'Referencia UNICA del producto que tiene el proveedor',
  id_facebook VARCHAR(45) NULL COMMENT 'Referencia UNICA del producto que tiene facebook',
  
  fabricado BOOLEAN NULL COMMENT 'Valor que dice si el producto es fabricado o comprado',
  descripción VARCHAR(400) NULL COMMENT 'Detalle o caracteristicas de la clase',
  id_marca INT UNSIGNED NULL COMMENT  'llave foranea a la tabla marca',
  proveedor_idproveedor INT NOT NULL COMMENT 'id clase',
  
  #Estos campos no irían en esta tabla
	  #moneda VARCHAR(10) NULL COMMENT 'Nombre de la moneda con la que esta el precio',
	  #descuento INT UNSIGNED NULL COMMENT 'Porcentaje de disminución del precio de un bien o un servicio',
	  #visualizacion_eCommerce BOOLEAN NOT NULL COMMENT 'Verdadero si esta habilitada la visualizacion, compra... en el e-commerce',
	  #visualización_facebook BOOLEAN NOT NULL COMMENT 'Verdadero si esta habilitada la visualizacion, compra... en facebook',
	  #sexo VARCHAR(45) NULL COMMENT 'hace referencia a las características biológicas y fisiológicas que definen a los machos de las hembras',
      #version VARCHAR(45) NULL COMMENT 'Valor númerico de la actualización del producto',
  
  #Este campo esta para debatir si quitarlo
	#disponible_facebook VARCHAR(45) NULL COMMENT 'Inventario de los productos disponibles de la aplicación',
	#marca VARCHAR(45) NULL COMMENT 'identificador comercial de los bienes y servicios que ofrece una empresa',
  PRIMARY KEY (id_interno),
  #INDEX id_marca_idx (id_marca ASC) VISIBLE,
  CONSTRAINT id_marca
    FOREIGN KEY (id_marca)
    REFERENCES marca (id_marca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) 
ENGINE = InnoDB;

#Santiago
CREATE TABLE IF NOT EXISTS imagen(
	id_imagen INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase imagenes',
    url VARCHAR(45) NOT NULL COMMENT 'dirección web de donde está guardada la imagen',
	descripcion VARCHAR(45) NULL COMMENT 'caracteristicas de la imagen',
    
    #Este campo esta para debatir si quitarlo
    #codigo INT NULL COMMENT 'conjunto de caracteres que identifican la imagen del producto',
    	
	PRIMARY KEY (id_imagen)
);

#Santiago
CREATE TABLE IF NOT EXISTS variante(
	id_variante INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase caracteristica',
	tipo VARCHAR(20) NULL COMMENT 'Nombre de la ',
	descripcion VARCHAR(45) NULL COMMENT 'Detalle o caracteristicas de la clase',
	medida VARCHAR(45) NULL COMMENT 'Proporción o correspondencia',
	PRIMARY KEY (id_variante)
);

#Santiago
CREATE TABLE IF NOT EXISTS variante_productos (
    id_variante INT UNSIGNED NOT NULL COMMENT 'ID de la clase acual',
	idproducto INT NOT NULL COMMENT 'ID de la clase acual',
	nombre VARCHAR(45) NULL COMMENT 'Nombrre de la categoría ',
	id_producto INT NULL COMMENT 'ID de la clase ',
	descripcion VARCHAR(45) NULL COMMENT 'clase que resulta de una especifica el producto según un criterio o jerarquía',
	id_materiales INT NULL COMMENT 'ID de la clase ',
	id_marca INT NULL COMMENT 'ID de la clase ',
	INDEX fk_caracteristicas_productos_caracteristicas1_idx (caracteristicas_id ASC) VISIBLE,
	INDEX fk_caracteristicas_productos_producto_actual1_idx (idproducto ASC) VISIBLE,
	CONSTRAINT fk_caracteristicas_productos_caracteristicas1
		FOREIGN KEY (caracteristicas_id)
		REFERENCES caracteristicas (id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_caracteristicas_productos_producto_actual
		FOREIGN KEY (idproducto)
		REFERENCES producto (id_interno)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS rol (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

#Jessica
CREATE TABLE IF NOT EXISTS usuario (
	id_usuario INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase usuario',
	correo VARCHAR (50) UNIQUE NOT  NULL COMMENT'Correo de usuario',
    contrasenna  VARCHAR (50)NOT NULL COMMENT 'contraseña de correo de usuario',
    nombre VARCHAR (50) NOT NULL COMMENT 'nombre de usuario',
    genero VARCHAR (1 ) COMMENT 'genero de usuario',
    tipo_documento VARCHAR (1 ) COMMENT 'tipo de documento de usuario',
    numero_documento VARCHAR (10) COMMENT 'numero de documento de identifidad',
    direccion  VARCHAR (100)  COMMENT 'direccion de usuario'); 
    
    #jessica
CREATE TABLE IF NOT EXISTS telefono (
	id_telefono INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT  'PK de la clase telefono',
    celular VARCHAR (10) UNIQUE COMMENT 'Número Telefono Celular',
    fijo VARCHAR (10) UNIQUE COMMENT 'Número Telefono fijo',
	id_usuario INT UNSIGNED NOT NULL COMMENT 'FK a la clase usuario',
    CONSTRAINT id_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
		

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
