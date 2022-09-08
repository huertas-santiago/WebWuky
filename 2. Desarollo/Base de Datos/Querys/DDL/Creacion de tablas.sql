DROP DATABASE IF EXISTS DB_ecommerce;
CREATE DATABASE IF NOT EXISTS DB_ecommerce DEFAULT CHARACTER SET utf8;
USE DB_ecommerce;

CREATE TABLE IF NOT EXISTS marca(
  id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca',
  nombre VARCHAR(45) NULL COMMENT 'Nombre de la marca',
  #descripcion VARCHAR(45) NULL COMMENT 'Detalle o caracteristicas de la marca',
  PRIMARY KEY (id_marca));

CREATE TABLE IF NOT EXISTS cliente (
	id_cliente INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase',
    
	correo VARCHAR (100) UNIQUE NOT  NULL COMMENT 'Correo de usuario',
    contrasenna  VARCHAR (50)NOT NULL COMMENT 'contraseña de correo de usuario',
    nombre VARCHAR (100) NOT NULL COMMENT 'nombre de usuario',
    genero VARCHAR (1) COMMENT 'genero de usuario',
    tipo_documento VARCHAR (3) COMMENT 'tipo de documento de usuario',
    numero_documento VARCHAR (15) COMMENT 'numero de documento de identifidad',
    fecha_nacimiento date COMMENT '',
    direccion  VARCHAR (100)  COMMENT 'direccion de usuario',
    facebook_vinculado VARCHAR (50) UNIQUE NULL COMMENT 'cuenta de facebook asociada del cliente',
    correo_vinculado VARCHAR (50) UNIQUE NULL COMMENT 'cuenta de correo asociada del cliente',
    
    PRIMARY KEY (id_cliente)
);


CREATE TABLE IF NOT EXISTS producto (
  id_producto INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase imagenes producto',
  id_marca INT UNSIGNED NULL COMMENT  'llave foranea a la tabla marca',
  
  codigo_externo VARCHAR(45) NULL COMMENT 'Referencia UNICA del producto que tiene el proveedor',
  codigo_facebook VARCHAR(45) NULL COMMENT 'Referencia UNICA del producto que tiene facebook',
  
  fabricado BOOLEAN NULL COMMENT 'Valor que dice si el producto es fabricado o comprado',
   
  PRIMARY KEY (id_producto),

	CONSTRAINT fk_producto_marca
		FOREIGN KEY (id_marca)
		REFERENCES marca (id_marca)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS variante (
	id_variante INT UNSIGNED NOT NULL COMMENT 'PK de la clase variante, contador de variantes para un producto',
	id_producto INT UNSIGNED NOT NULL COMMENT 'ID de la clase acual',
	#id_material INT NULL COMMENT 'llave foranea a la tabla material',  

	precio INT UNSIGNED NOT NULL COMMENT 'Precio del producto',
	descuento INT UNSIGNED NULL DEFAULT 0 COMMENT 'Porcentaje de disminución del precio de un bien o un servicio',
	visualizacion_eCommerce BOOLEAN NULL DEFAULT 1 COMMENT 'Verdadero si esta habilitada la visualizacion, compra... en el e-commerce',
	visualización_facebook BOOLEAN NOT NULL DEFAULT 1 COMMENT 'Verdadero si esta habilitada la visualizacion, compra... en facebook',
	sexo VARCHAR(45) NULL COMMENT 'hace referencia a las características biológicas y fisiológicas que definen a los machos de las hembras',
	descripción VARCHAR(10000) NULL COMMENT 'Texto donde describe el producto',
	
    stock INT UNSIGNED DEFAULT 0 COMMENT 'Cantidad de productos en el inventario',
    
    PRIMARY KEY (id_variante,id_producto),

    
	CONSTRAINT fk_variante_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS material (
	id_material INT UNSIGNED AUTO_INCREMENT NOT NULL  COMMENT 'PK de la clase materiales',
    
    tipo_material VARCHAR(45) NOT NULL COMMENT 'Tipo de la variante como PESO, DIMENSION, COLOR, TELA',
	medida VARCHAR(45) NULL COMMENT 'Como se mide el tipo, si es peso la medida es Kg',

    PRIMARY KEY(id_material)
);

CREATE TABLE IF NOT EXISTS variante_material (
	id_variante INT UNSIGNED NOT NULL,
    id_material INT UNSIGNED NOT NULL,
    
    cantidad VARCHAR(45) NULL COMMENT 'Valor tomado por el tipo_material en material',
    
    PRIMARY KEY (id_variante,id_material),
    
    
	CONSTRAINT fk_variante_material_variante
		FOREIGN KEY (id_variante)
		REFERENCES variante (id_variante)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_variante_material_material
		FOREIGN KEY (id_material)
		REFERENCES material (id_material)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	
    
);

CREATE TABLE IF NOT EXISTS categoria (
	id_categoria INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase categoria',
    nombre VARCHAR (45),
    descripcion VARCHAR(45),
    
    PRIMARY KEY (id_categoria)
);

CREATE TABLE IF NOT EXISTS categoria_producto (
	id_categoria INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    
    PRIMARY KEY (id_categoria,id_producto),
    
    CONSTRAINT fk_categoria_producto_categoria
		FOREIGN KEY (id_categoria)
		REFERENCES categoria (id_categoria)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	
    CONSTRAINT fk_categoria_producto_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS imagen(
	id_imagen INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase imagenes',
    url VARCHAR(45) NOT NULL COMMENT 'dirección web de donde está guardada la imagen',
	descripcion VARCHAR(45) NULL COMMENT 'caracteristicas de la imagen',
    tamaño VARCHAR (1) DEFAULT 'P' COMMENT 'Puede estar la misma imagen con diferente tamaño (PEQUEÑO,MEDIANO,GRANDE), para la carga responsive',
    
    #Este campo esta para debatir si quitarlo
    #codigo INT NULL COMMENT 'conjunto de caracteres que identifican la imagen del producto',
	
	PRIMARY KEY (id_imagen)
);
	
CREATE TABLE IF NOT EXISTS producto_favorito (
	id_producto INT UNSIGNED NOT NULL COMMENT 'PK de la clase producto_favorito',
    id_cliente INT UNSIGNED NOT NULL COMMENT 'PK de la clase cliente',
    cantidad INT UNSIGNED DEFAULT 1 COMMENT '',
    
    #Este campo se puede calcular con las facturas del cliente
    #comprado INT UNSIGNED DEFAULT 0 COMMENT ''
    
    CONSTRAINT fk_producto_favorito_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_producto_favorito_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES cliente (id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    
);

CREATE TABLE IF NOT EXISTS factura_cliente (
	id_factura_cliente INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase factura_cliente',
    
    fecha DATETIME,
	rete_ica FLOAT,
	rete_fuente FLOAT,
	iva FLOAT,
	subtotal FLOAT,
    compra_neta FLOAT,
	dijitos_tarjeta VARCHAR(20),
	id_banco VARCHAR(20) NULL,
	codigo_facturado VARCHAR(20),
	
	respuesta_banco BOOL,
	forma_pago VARCHAR(2),
    
    #Datos del DESTINATARIO
	nombre_destinatario VARCHAR(20),
    tipo_documento VARCHAR(20),
	numero_documento VARCHAR(20),
    
    PRIMARY KEY (id_factura_cliente)
);

CREATE TABLE IF NOT EXISTS estado_factura_cliente (
	id_estado_factura_cliente INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase estados_facturas_cliente',
	id_factura_cliente INT UNSIGNED NOT NULL COMMENT 'FK a la clase factura_cliente',
    
	estado VARCHAR (10) NOT NULL COMMENT 'Accion "Pendiente", "Pagada"',
	fecha_inicio DATETIME NOT NULL,
	#Este campo ya no es necesario se puede saber cual fué el estado anterior por el orden de los id
    #id_estado_anterior INT UNSIGNED NULL COMMENT 'PK de la clase factura_cliente',
    
    PRIMARY KEY (id_estado_factura_cliente),
    
    CONSTRAINT fk_estado_factura_cliente_factura_cliente
		FOREIGN KEY (id_factura_cliente)
		REFERENCES factura_cliente (id_factura_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

);

CREATE TABLE IF NOT EXISTS pedido(
	id_pedido INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase pedido',
    id_cliente INT UNSIGNED NULL COMMENT 'FK a la clase cliente, si es un pedido de un proveedor este campo va en null',
    id_factura_cliente INT UNSIGNED NULL COMMENT 'FK a la clase factura_cliente',
    
    contador  INT UNSIGNED DEFAULT 1 COMMENT 'cuenta cuantos pedidos tiene el cliente',
    fecha DATE NOT NULL COMMENT 'Fecha en la que se encargó el pedido',
    origen VARCHAR (2) DEFAULT 'EC' COMMENT 'De donde se originó el pedido, Facebook, Instagram, eCommerce',
    
    PRIMARY KEY (id_pedido),
    
    CONSTRAINT fk_pedido_factura_cliente
		FOREIGN KEY (id_factura_cliente)
		REFERENCES factura_cliente (id_factura_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    
    CONSTRAINT fk_pedido_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES cliente (id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	
);

CREATE TABLE IF NOT EXISTS estados_pedidos(
	id_estados_pedidos INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase estados_pedidos',
	id_pedido INT UNSIGNED NOT NULL COMMENT 'FK a la clase pedido',
    
    #Este campo ya no es necesario se puede saber cual fué el estado anterior por el orden de los id
    #id_estando_anterior  INT UNSIGNED NULL COMMENT 'Referencia a esta misma tabla, para ver el estado anterior',
	
    estado VARCHAR (10) NOT NULL COMMENT '',
    nota VARCHAR(200) NULL COMMENT '',
    
    fecha_inicio DATETIME,
    tiempo TIME  NOT NULL,
    
    PRIMARY KEY (id_estados_pedidos),
    
    
    CONSTRAINT fk_estados_pedidos_pedido
		FOREIGN KEY (id_pedido)
		REFERENCES pedido (id_pedido)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION	
);





#Santiago
CREATE TABLE IF NOT EXISTS carrito (
    id_cliente INT UNSIGNED NOT NULL COMMENT 'FK a la clase cliente',
    id_producto INT UNSIGNED NOT NULL COMMENT 'FK a la clase producto',
    
    cantidad_producto VARCHAR(45) NULL COMMENT 'Número determinado de unidades adquiridos',
    
    PRIMARY KEY (id_cliente,id_producto),
    
    
	CONSTRAINT fk_carrito_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES cliente (id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    
	CONSTRAINT fk_carrito_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS producto_imagen (
	id_imagen INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    
    PRIMARY KEY ( id_producto , id_imagen ),
    
    
    CONSTRAINT fk_producto_imagen_imagen
		FOREIGN KEY (id_imagen)
		REFERENCES imagen (id_imagen)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	
    CONSTRAINT fk_producto_imagen_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	
);

CREATE TABLE IF NOT EXISTS producto_pedido (
	id_producto INT UNSIGNED NOT NULL COMMENT 'FK a la clase producto',
	id_pedido INT UNSIGNED NOT NULL COMMENT 'FK a la clase pedido',
    cantidad INT UNSIGNED DEFAULT 1 COMMENT '',
    
    PRIMARY KEY (id_producto , id_pedido),
    
    
    CONSTRAINT fk_producto_pedido_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_producto_pedido_pedido
		FOREIGN KEY (id_pedido)
		REFERENCES pedido (id_pedido)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);