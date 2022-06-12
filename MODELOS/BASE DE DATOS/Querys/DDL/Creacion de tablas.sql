#No se ha agregado el iva por producto   iva FLOAT UNSIGNED NULL COMMENT 'Impuesto asociado al producto',
#No se ha agregado el stok cantidad_stock INT UNSIGNED NULL COMMENT 'cantidad de prodcutos en el inventario',

DROP DATABASE IF EXISTS DBWuky;
CREATE DATABASE IF NOT EXISTS DBWuky DEFAULT CHARACTER SET utf8;
USE DBWuky;

#Santiago
CREATE TABLE IF NOT EXISTS marca(
  id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca',
  nombre VARCHAR(45) NULL COMMENT 'Nombre de la marca',
  #descripcion VARCHAR(45) NULL COMMENT 'Detalle o caracteristicas de la marca',
  PRIMARY KEY (id_marca));


#Santiago
#Ver si tiene sentido esta clase, o solo se coloca un check en empleado con los diferentes tipos de contrato
CREATE TABLE IF NOT EXISTS tipo_contrato (
	id_tipo_contrato INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase tipo_contrato',
    nombre VARCHAR (45),
    PRIMARY KEY (id_tipo_contrato)
    );

#Santiago
CREATE TABLE IF NOT EXISTS entidad_afiliada (
   id_entidad_afiliada INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase entidad_afiliada',
   nombre VARCHAR(45),
   
   PRIMARY KEY (id_entidad_afiliada)
   );

#Paula #Modificado Santiago
CREATE TABLE IF NOT EXISTS rol (
	id_rol INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase rol',
    nombre_rol VARCHAR (45)NOT NULL COMMENT'nombre del rol del usuario',
    
    PRIMARY KEY (id_rol) 
);

#Jessica #Modificado por Santiago
#DROP TABLE permiso;
CREATE TABLE IF NOT EXISTS permiso (
	id_permiso INT UNSIGNED AUTO_INCREMENT NOT NULL,
    nombre_permiso VARCHAR (45)NOT NULL COMMENT'nombre del rol del usuario',
    descripcion VARCHAR(200) NULL,
    
    PRIMARY KEY (id_permiso) 
);

#Santiago
CREATE TABLE IF NOT EXISTS rol_permiso (
	id_rol INT UNSIGNED NOT NULL COMMENT 'FK a la clase rol',
	id_permiso INT UNSIGNED NOT NULL COMMENT 'FK a la clase permiso',
    
    PRIMARY KEY (id_rol , id_permiso),
    
    CONSTRAINT fk_rol_permiso_rol
		FOREIGN KEY (id_rol)
		REFERENCES rol (id_rol)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    
    CONSTRAINT fk_rol_permiso_permiso
		FOREIGN KEY (id_permiso)
		REFERENCES permiso (id_permiso)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

#Jessica #Modificado Santiago
CREATE TABLE IF NOT EXISTS usuario (
	id_usuario INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase usuario',
    
	correo VARCHAR (100) UNIQUE NOT  NULL COMMENT 'Correo de usuario',
    contrasenna  VARCHAR (50)NOT NULL COMMENT 'contraseña de correo de usuario',
    nombre VARCHAR (100) NOT NULL COMMENT 'nombre de usuario',
    genero VARCHAR (1) COMMENT 'genero de usuario',
    tipo_documento VARCHAR (3) COMMENT 'tipo de documento de usuario',
    numero_documento VARCHAR (15) COMMENT 'numero de documento de identifidad',
    fecha_nacimiento date COMMENT '',
    direccion  VARCHAR (100)  COMMENT 'direccion de usuario',
    
    PRIMARY KEY (id_usuario)
);
    
#jessica #Modificado por Santiago
CREATE TABLE IF NOT EXISTS cliente (
	id_usuario INT UNSIGNED NOT NULL COMMENT 'PK de la clase cliente y FK de la tabla Usuario' PRIMARY KEY,
    facebook_vinculado VARCHAR (50) UNIQUE NULL COMMENT 'cuenta de facebook asociada del cliente',
    correo_vinculado VARCHAR (50) UNIQUE NULL COMMENT 'cuenta de correo asociada del cliente',
    
    CONSTRAINT fk_id_usuario__cliente
		FOREIGN KEY (id_usuario)
		REFERENCES usuario (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

#Santiago
CREATE TABLE IF NOT EXISTS empleado (
	id_usuario INT UNSIGNED NOT NULL COMMENT 'FK de la clase Usuario',
	id_tipo_contrato INT UNSIGNED NOT NULL COMMENT 'FK de la clase tipo_contrato, Especifica el contrato que el usuario tendra',
    #id_tipo_contrato INT UNSIGNED NOT NULL COMMENT 'FK de la clase tipo_contrato, Especifica el contrato que el usuario tendra',
    
    id_rol INT UNSIGNED NOT NULL COMMENT 'FK de la clase rol',
	foto INT UNSIGNED NOT NULL COMMENT 'FK de la clase imagen',

	grupo_sanguineo_RH VARCHAR(3) NULL COMMENT 'Tipo de sangre',
    
    fecha_contratacion DATE NULL COMMENT 'fecha de proceso contrato usuario',
	fecha_fin_contratacion DATE NULL COMMENT 'fecha de proceso contrato usuario',
    codigo_contrato INT UNSIGNED NULL COMMENT 'Numero único de contratación',
    activo BOOL DEFAULT 0 COMMENT '',
	cargo VARCHAR(45) NULL COMMENT 'Especifica el cargo que manejara',
    
    PRIMARY KEY (id_usuario),
    
    /*
	tipo_afialiacion VARCHAR(45) NULL COMMENT 'categoria afilicacion a caja de compensación familiar',
	afialiacion VARCHAR(45) NULL COMMENT 'afilicacion a caja de compensación familiar',
    */
    
    CONSTRAINT fk_empleado_usuario
		FOREIGN KEY (id_usuario)
		REFERENCES usuario (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,

    CONSTRAINT fk_empleado_tipo_contrato
	FOREIGN KEY (id_tipo_contrato)
	REFERENCES tipo_contrato (id_tipo_contrato)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
    
    CONSTRAINT fk_empleado_rol
		FOREIGN KEY (id_rol)
		REFERENCES rol (id_rol)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
        
	/*
	INDEX fk_empleado_usuario1_idx (idusuario ASC) VISIBLE,
	INDEX fk_empleado_tipo_contrato1_idx (tipo_contrato_idtipo_contrato ASC) VISIBLE,
	*/
);

#Santiago
CREATE TABLE IF NOT EXISTS afiliacion (
    id_entidad_afiliada INT UNSIGNED NOT NULL COMMENT 'FK a la clase entidad_afiliada',
    id_empleado INT UNSIGNED NOT NULL COMMENT 'FK a la clase empleado',
    
    nombre_afiliacion VARCHAR (10) NULL COMMENT 'Nombre de la afiliciacion del empleado, puede ser EPS',
    fecha_afiliacion DATE,
    activo BOOL DEFAULT 1 COMMENT '',
    codigo_afiliacion VARCHAR (15) NULL COMMENT 'Codigo que el empleado tiene es ésta entidad',
	
    PRIMARY KEY (id_entidad_afiliada,id_empleado),
    
    CONSTRAINT fk_afiliacion_empleado
		FOREIGN KEY (id_empleado)
		REFERENCES empleado (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
    CONSTRAINT fk_afiliacion_entidad_afiliada
		FOREIGN KEY (id_entidad_afiliada)
		REFERENCES entidad_afiliada (id_entidad_afiliada)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    
    /*
	INDEX fk_empleado_usuario1_idx (idusuario ASC) VISIBLE,
	INDEX fk_empleado_tipo_contrato1_idx (tipo_contrato_idtipo_contrato ASC) VISIBLE,
	*/
);

#Santiago
CREATE TABLE IF NOT EXISTS proveedor (
	id_usuario INT UNSIGNED NOT NULL COMMENT 'FK de la clase Usuario',
        
    CONSTRAINT fk_proveedor_usuario
		FOREIGN KEY (id_usuario)
		REFERENCES usuario (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	
);

#Santiago
CREATE TABLE IF NOT EXISTS transportadora (
	id_usuario INT UNSIGNED NOT NULL COMMENT 'PK de la clase transportadora y FK de la tabla Usuario',
	PRIMARY KEY (id_usuario),
    
    CONSTRAINT fk_transportadora_usuario
		FOREIGN KEY (id_usuario)
		REFERENCES usuario (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

#Santiago
CREATE TABLE IF NOT EXISTS producto (
  id_producto INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase imagenes producto',
  id_marca INT UNSIGNED NULL COMMENT  'llave foranea a la tabla marca',
  id_proveedor INT UNSIGNED NOT NULL COMMENT 'llave foranea a la tabla proveedor',
  
  codigo_externo VARCHAR(45) NULL COMMENT 'Referencia UNICA del producto que tiene el proveedor',
  codigo_facebook VARCHAR(45) NULL COMMENT 'Referencia UNICA del producto que tiene facebook',
  
  fabricado BOOLEAN NULL COMMENT 'Valor que dice si el producto es fabricado o comprado',
  
  #Estos campos no irían en esta tabla
	  #moneda VARCHAR(10) NULL COMMENT 'Nombre de la moneda con la que esta el precio',
	  #version VARCHAR(45) NULL COMMENT 'Valor númerico de la actualización del producto',
  
  #Este campo esta para debatir si quitarlo
	#disponible_facebook VARCHAR(45) NULL COMMENT 'Inventario de los productos disponibles de la aplicación',
	#marca VARCHAR(45) NULL COMMENT 'identificador comercial de los bienes y servicios que ofrece una empresa',
    
  PRIMARY KEY (id_producto),

	CONSTRAINT fk_producto_marca
		FOREIGN KEY (id_marca)
		REFERENCES marca (id_marca)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	
	CONSTRAINT fk_producto_proveedor
		FOREIGN KEY (id_proveedor)
		REFERENCES proveedor (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    
  #INDEX id_marca_idx (id_marca ASC) VISIBLE,
);

#Santiago
#Se elimina la tabla
#CREATE TABLE IF NOT EXISTS variante_producto(
/*	id_variante INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase variante',
	PRIMARY KEY (id_variante)
);
*/

#Santiago
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

	/*
	INDEX fk_caracteristicas_productos_caracteristicas1_idx (caracteristicas_id ASC) VISIBLE,
	INDEX fk_caracteristicas_productos_producto_actual1_idx (idproducto ASC) VISIBLE,
    */
);

#Santiago
#Se elimna esta tabla
#CREATE TABLE IF NOT EXISTS tipo_materiales (
/*	id_tipo_materiales INT UNSIGNED AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (id_tipo_materiales)
    );
*/

#Santiago
CREATE TABLE IF NOT EXISTS material (
	id_material INT UNSIGNED AUTO_INCREMENT NOT NULL  COMMENT 'PK de la clase materiales',
    
    tipo_material INT UNSIGNED NOT NULL COMMENT 'Tipo de la variante como PESO, DIMENSION, COLOR, TELA',
	medida VARCHAR(45) NULL COMMENT 'Como se mide el tipo, si es peso la medida es Kg',

    PRIMARY KEY(id_material)
    
    /*
	CONSTRAINT fk_id_variante
		FOREIGN KEY (id_variante)
		REFERENCES variante (id_variante)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#Santiago
CREATE TABLE IF NOT EXISTS variante_material (
	id_variante INT UNSIGNED NOT NULL,
    id_material INT UNSIGNED NOT NULL,
    
    cantidad VARCHAR(45) NULL COMMENT 'Valor tomado por el tipo_material en material',
    
    PRIMARY KEY (id_variante,id_material)
);

#paula
CREATE TABLE IF NOT EXISTS categoria (
	id_categoria INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase categoria',
    nombre VARCHAR (45),
    descripcion VARCHAR(45),
    
    PRIMARY KEY (id_categoria)
);

#Jessica
CREATE TABLE IF NOT EXISTS categoria_producto (
	id_categoria_producto INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    
    PRIMARY KEY (id_categoria_producto,id_producto)
);


#Santiago
CREATE TABLE IF NOT EXISTS imagen(
	id_imagen INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase imagenes',
    url VARCHAR(45) NOT NULL COMMENT 'dirección web de donde está guardada la imagen',
	descripcion VARCHAR(45) NULL COMMENT 'caracteristicas de la imagen',
    tamaño VARCHAR (1) DEFAULT 'P' COMMENT 'Puede estar la misma imagen con diferente tamaño (PEQUEÑO,MEDIANO,GRANDE), para la carga responsive',
    
    #Este campo esta para debatir si quitarlo
    #codigo INT NULL COMMENT 'conjunto de caracteres que identifican la imagen del producto',
	
	PRIMARY KEY (id_imagen)
);

#Santiago
CREATE TABLE IF NOT EXISTS infografia (
	id_infografia INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase infografia',
	texto TEXT NULL,
    seccion INT UNSIGNED NULL COMMENT 'En que posicion esta ubicado la infografia en el home del cliente',
	nombre_infografia VARCHAR(45) NULL,
    habilitado BOOL DEFAULT 1 COMMENT 'Representa si se muestra o no la infografia',
	PRIMARY KEY (id_infografia)
);

#Santiago
CREATE TABLE IF NOT EXISTS imagenes_infografia (
	id_imagen INT UNSIGNED NOT NULL COMMENT 'FK a la clase imagen',
	id_infografia INT UNSIGNED NOT NULL COMMENT 'FK a la clase infografia',
	PRIMARY KEY (id_imagen, id_infografia)
    
    /*
	INDEX fk_infografia_has_Imagenes_Imagenes1_idx (Imagenes_id ASC) VISIBLE,
	INDEX fk_infografia_has_Imagenes_infografia1_idx (infografia_idinfografia ASC) VISIBLE
	*/
    
	/*
	CONSTRAINT fk_infografia_has_Imagenes_infografia1
		FOREIGN KEY (id_infografia)
		REFERENCES infografia (id_infografia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_infografia_has_Imagenes_Imagenes1
		FOREIGN KEY (id_imagen)
		REFERENCES imagen (id_imagen)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#jessica 
CREATE TABLE IF NOT EXISTS telefono (
	id_telefono INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT  'PK de la clase telefono',
    numero VARCHAR (10) COMMENT 'Número Telefono Celular',
    fijo BOOL DEFAULT 0 COMMENT 'Representa si el Número Telefono ES FIJO',
	id_usuario INT UNSIGNED NOT NULL COMMENT 'FK a la clase usuario',
    observacion  VARCHAR (150) COMMENT 'Si hace referencia a un numero de telefono de una empresa, este puede tener un cargo...',
    
    PRIMARY KEY (id_telefono)
    
    /*
    CONSTRAINT id_usuario
		FOREIGN KEY (id_usuario)
		REFERENCES usuario (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    */
    );
	
#paula #Modificado por Santiago
CREATE TABLE IF NOT EXISTS producto_favorito (
	id_producto INT UNSIGNED NOT NULL COMMENT 'PK de la clase producto_favorito',
    id_cliente INT UNSIGNED NOT NULL COMMENT 'PK de la clase cliente',
    cantidad INT UNSIGNED DEFAULT 1 COMMENT ''
    
    #Este campo se puede calcular con las facturas del cliente
    #comprado INT UNSIGNED DEFAULT 0 COMMENT ''
    
    /*
	CONSTRAINT fk_infografia_has_Imagenes_infografia1
		FOREIGN KEY (infografia_idinfografia)
		REFERENCES infografia (idinfografia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_infografia_has_Imagenes_Imagenes1
		FOREIGN KEY (Imagenes_id)
		REFERENCES Imagenes (idimagenes)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    */
);

#Santiago
CREATE TABLE IF NOT EXISTS envio (
	id_envio INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase envio',
    
    codigo_envio VARCHAR (15) NULL COMMENT '',
	peso FLOAT NULL COMMENT '',
	largo INT UNSIGNED NULL COMMENT '',
	ancho INT UNSIGNED NULL COMMENT '',
	alto INT UNSIGNED NULL COMMENT '',
	valor_declarado FLOAT NULL COMMENT '',
    
    direccion_envio VARCHAR (100),

	PRIMARY KEY(id_envio)
);

#PAULA #Modificado Santiago
CREATE TABLE IF NOT EXISTS pedido(
	id_pedido INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase pedido',
    id_cliente INT UNSIGNED NOT NULL COMMENT 'FK a la clase cliente',
    id_envio INT UNSIGNED NULL COMMENT 'FK a la clase envio',
    
    fecha DATE,
    origen VARCHAR (2) DEFAULT 'EC' COMMENT 'De donde se originó el pedido, Facebook, Instagram, eCommerce',
    
    PRIMARY KEY (id_pedido,id_cliente)
    
    /*
    CONSTRAINT fk_id_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES infografia (id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_envio
		FOREIGN KEY (id_envio)
		REFERENCES envio (id_envio)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    */
);

#PAULA #Modificado Santiago
CREATE TABLE IF NOT EXISTS estados_pedidos(
	id_estados_pedidos INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase estados_pedidos',
	id_pedido INT UNSIGNED NOT NULL COMMENT 'FK a la clase pedido',
    id_estando_anterior  INT UNSIGNED NULL COMMENT 'Referencia a esta misma tabla, para ver el estado anterior',
	
    estado VARCHAR (10) NOT NULL COMMENT '',
    nota VARCHAR(200) NULL COMMENT '',
    
    fecha_inicio DATETIME,
    tiempo TIME  NOT NULL,
    
    PRIMARY KEY (id_estados_pedidos)
    
    /*
    CONSTRAINT fk_pedido
		FOREIGN KEY (id_pedido)
		REFERENCES pedido (id_pedido)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    
    CONSTRAINT fk_estando_anterior
		FOREIGN KEY (estando_anterior)
		REFERENCES estados_pedidos (id_estados_pedidos)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#Santiago
#Tabla no es necesaria, no tiene sentico, con factura_cliente es suficiente 
#CREATE TABLE IF NOT EXISTS factura (
/*	
	id_factura INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase factura',
    fecha DATETIME,
	rete_ica FLOAT,
	rete_fuente FLOAT,
	iva FLOAT,
	subtotal FLOAT
);*/

#Santiago
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

#Santiago
#Revisar PK
CREATE TABLE IF NOT EXISTS estados_facturas_cliente (
	id_estados_facturas_cliente INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase estados_facturas_cliente',
	id_factura_cliente INT UNSIGNED NOT NULL COMMENT 'FK a la clase factura_cliente',
    
	estado VARCHAR (10) NOT NULL COMMENT 'Accion "Pendiente", "Pagada"',
	fecha_inicio DATETIME NOT NULL,
	id_estado_anterior INT UNSIGNED NULL COMMENT 'PK de la clase factura_cliente',
    
    PRIMARY KEY (id_estados_facturas_cliente)
    
    /*
    CONSTRAINT fk_id_factura_cliente
		FOREIGN KEY (id_factura_cliente)
		REFERENCES factura_cliente (id_factura_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_infografia_has_Imagenes_infografia1
		FOREIGN KEY (id_estando_anterior)
		REFERENCES estados_facturas_cliente (id_estados_facturas_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    */

);

#Santiago
CREATE TABLE IF NOT EXISTS factura_proveedor (
	id_factura INT UNSIGNED NOT NULL COMMENT 'FK a la clase factura',
	id_empleado INT NOT NULL COMMENT 'FK a la clase empleado, Quien realizó el pedido',
	id_proveedor INT NOT NULL COMMENT 'FK a la clase proveedor',
    
	fecha DATETIME NOT NULL COMMENT 'Fecha en que se realizó el pedido',
    fecha_cancelado DATETIME NULL COMMENT 'Fecha en que se pagó el pedido',
    
	rete_ica VARCHAR(45) NULL COMMENT 'Impuesto de retención',
	rete_fuente VARCHAR(45) NULL COMMENT 'Impuesto de retención',
	iva INT NULL COMMENT 'Impuesto asociado al producto',
	subtotal INT NULL COMMENT 'Valor de la suma de los productos',
    
	precio_total FLOAT NULL COMMENT 'total de  la suma de los productos',
    abono FLOAT NULL COMMENT 'Total abonado a la factura',
	tipo_pago VARCHAR(45) NULL COMMENT 'forma con que se genera el pago'
	
    /*
    INDEX fk_factura_proveedor_empleado1_idx (id_empleado ASC) VISIBLE,
	PRIMARY KEY (id_factura),
	INDEX fk_factura_proveedor_proveedor1_idx (id_proveedor ASC) VISIBLE,
    */
	
    /*
    CONSTRAINT fk_factura_proveedor_empleado1
		FOREIGN KEY (id_empleado)
		REFERENCES empleado (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_factura_proveedor_proveedor1
		FOREIGN KEY (id_proveedor)
		REFERENCES proveedor (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_factura_proveedor_factura1
		FOREIGN KEY (id_factura)
		REFERENCES factura (id_factura)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	
	*/
);

#Santiago
CREATE TABLE IF NOT EXISTS carrito (
    id_cliente INT NOT NULL COMMENT 'FK a la clase cliente',
    id_producto INT UNSIGNED NOT NULL COMMENT 'FK a la clase producto',
    
    cantidad_producto VARCHAR(45) NULL COMMENT 'Número determinado de unidades adquiridos',
    
    PRIMARY KEY (id_cliente,id_producto)
    
    /*
	PRIMARY KEY (id_cliente),
	CONSTRAINT fk_carrito_cliente1
		FOREIGN KEY (id_usuario)
		REFERENCES cliente (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	PRIMARY KEY (id_cliente),
    
	CONSTRAINT fk_carrito_cliente1
		FOREIGN KEY (id_usuario)
		REFERENCES cliente (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	PRIMARY KEY (id_cliente),
    
	CONSTRAINT fk_carrito_cliente1
		FOREIGN KEY (id_usuario)
		REFERENCES cliente (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#Santiago
#No hay necesidad de esta tabla, para eso está la tabla carrito
#CREATE TABLE IF NOT EXISTS producto_carrito (
/*	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca',
    cantidad_producto VARCHAR(45) NULL COMMENT 'Número determinado de unidades adquiridos'
);
*/

#Santiago
CREATE TABLE IF NOT EXISTS tema_preguntas (
	id_tema_preguntas INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase tema_preguntas',
    nombre VARCHAR(45) NULL COMMENT '',
    
    PRIMARY KEY (id_tema_preguntas)
);

#Santiago
CREATE TABLE IF NOT EXISTS preguntas_frecuentes (
	id_preguntas_frecuentes INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase preguntas_frecuentes',
	id_tema_preguntas INT UNSIGNED NOT NULL COMMENT 'FK a la clase tema_preguntas',

	pregunta VARCHAR(45) NULL COMMENT '',
	respuesta VARCHAR(1000) NULL COMMENT '',
    
    PRIMARY KEY (id_preguntas_frecuentes)
    
    /*
	CONSTRAINT fk_tema_preguntas
		FOREIGN KEY (id_tema_preguntas)
		REFERENCES tema_preguntas (id_tema_preguntas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#jessica
#Eliminada por Santiago, la pasé a cada clase de log
#CREATE TABLE IF NOT EXISTS dispositivo (
/*
	id_dispositivo INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase dispositivo',
    Nombre VARCHAR (50) NOT NULL COMMENT 'nombre del dispositivo'
);*/
    
#jessica #Modificado por Santiago
#Verificar tipo de dato TIME
CREATE TABLE IF NOT EXISTS logs_empleado (
	id_logs_empleado INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT '',
	id_empleado INT UNSIGNED NOT NULL COMMENT '',
	direccion_ip INT NOT NULL COMMENT '',
    Tiempo_en_plataforma TIME NOT NULL COMMENT '',
	hora_inicio TIME  NOT NULL COMMENT '',
    fecha_ingreso  DATE NOT NULL COMMENT '',
    dispositivo VARCHAR (50) NOT NULL COMMENT 'nombre del dispositivo con el que se conectó, PC..Celular',
    
    PRIMARY KEY (id_logs_empleado)
    
    /*
	CONSTRAINT fk_empleado
		FOREIGN KEY (id_empleado)
		REFERENCES empleado (id_empleado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
    );

#jessica #Modificado por Santiago
#Verificar tipo de dato TIME
CREATE TABLE IF NOT EXISTS logs_cliente (
	id_logs_cliente INT UNSIGNED AUTO_INCREMENT NOT NULL,
    id_cliente INT UNSIGNED NOT NULL ,
    
    direccion_ip INT NOT NULL,
    Tiempo_en_plataforma TIME NOT NULL ,
	hora_inicio TIME NOT NULL ,
    fecha_ingreso  DATE NOT NULL,
	dispositivo VARCHAR (50) NOT NULL COMMENT 'nombre del dispositivo con el que se conectó, PC..Celular',
    
    PRIMARY KEY (id_logs_cliente)

	/*
	CONSTRAINT fk_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES cliente (id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#jessica
#Eliminada por Santiago, la pasé a la clase acciones_realizadas
#CREATE TABLE IF NOT EXISTS acciones (
/*	id_acciones INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca',
    nombre VARCHAR(45) NULL COMMENT 'Nombre de clase la acciones'
    );
*/
    
#jessica #Modificado por Santiago
CREATE TABLE IF NOT EXISTS acciones_realizadas (
	id_acciones_realizadas INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase acciones_realizadas',
    id_logs_empleado INT UNSIGNED NOT NULL COMMENT 'FK a la clase logs_empleado',
    tipo_accion VARCHAR(45) NOT NULL COMMENT 'Nombre de la accion realizada',
    descripción VARCHAR (200) NULL COMMENT 'descripcion clase accion',
    
    PRIMARY KEY (id_acciones_realizadas)

    
    /*
    CONSTRAINT fk_logs_empleado
		FOREIGN KEY (id_logs_empleado)
		REFERENCES logs_empleado (id_logs_empleado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    */
);
    
#jessica #Modificado por Santiago
CREATE TABLE IF NOT EXISTS información (
	id_información INT UNSIGNED AUTO_INCREMENT NOT NULL ,
    texto TEXT NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    id_imagen INT UNSIGNED NULL,
    
    PRIMARY KEY (id_información)
    
    /*
    CONSTRAINT fk_tema_preguntas
		FOREIGN KEY (id_tema_preguntas)
		REFERENCES tema_preguntas (id_tema_preguntas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    */
);

#Jessica #Modificado por Santiago
CREATE TABLE IF NOT EXISTS producto_imagenes (
	id_imagen INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    
    PRIMARY KEY ( id_producto , id_imagen )
    
    /*
    CONSTRAINT fk_imagen
		FOREIGN KEY (id_imagen)
		REFERENCES imagen (id_imagen)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	
    CONSTRAINT fk_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    */
);

#Santiago
CREATE TABLE IF NOT EXISTS producto_pedido (
	id_producto INT UNSIGNED NOT NULL COMMENT 'FK a la clase producto',
	id_pedido INT UNSIGNED NOT NULL COMMENT 'FK a la clase pedido',
    cantidad INT UNSIGNED DEFAULT 1 COMMENT '',
    
    PRIMARY KEY (id_producto , id_pedido)
    
    /*
    CONSTRAINT fk_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_pedido
		FOREIGN KEY (id_pedido)
		REFERENCES pedido (id_pedido)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#Santiago
CREATE TABLE IF NOT EXISTS producto_facturaProveedor (
	id_producto INT UNSIGNED NOT NULL COMMENT 'FK a la clase producto',
	id_pedido INT UNSIGNED NOT NULL COMMENT 'FK a la clase pedido',
    cantidad INT UNSIGNED DEFAULT 1 COMMENT '',
    
    PRIMARY KEY (id_producto , id_pedido)
    
    /*
    CONSTRAINT fk_producto
		FOREIGN KEY (id_producto)
		REFERENCES producto (id_producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
        
	CONSTRAINT fk_pedido
		FOREIGN KEY (id_pedido)
		REFERENCES pedido (id_pedido)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#Paula #Modificado por Santiago
CREATE TABLE IF NOT EXISTS especie (
	id_especie INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase especie',
    nombre VARCHAR (45),
    
    PRIMARY KEY (id_especie)
);

#Paula #Modificado por Santiago
CREATE TABLE IF NOT EXISTS raza (
	id_raza INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase raza',
    id_especie INT UNSIGNED NULL COMMENT 'PK de la clase especie',
    nombre VARCHAR (45),
    
    PRIMARY KEY (id_raza)
    
    /*
    CONSTRAINT fk_especie
		FOREIGN KEY (id_especie)
		REFERENCES especie (id_especie)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#Paula #Modificado por Santiago
CREATE TABLE IF NOT EXISTS mascota (
	id_mascota INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase mascota',
    id_raza INT UNSIGNED NOT NULL COMMENT 'PK de la clase raza',
    id_cliente INT UNSIGNED NOT NULL COMMENT 'PK de la clase cliente',
    
    foto VARCHAR (45),
    nombre VARCHAR (45),
    sexo VARCHAR (1),
    tamaño VARCHAR (45),
    fecha_nacimiento VARCHAR(45),
    
    PRIMARY KEY (id_mascota)
    
    /*
    CONSTRAINT fk_tema_preguntas
		FOREIGN KEY (id_tema_preguntas)
		REFERENCES tema_preguntas (id_tema_preguntas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	
    CONSTRAINT fk_tema_preguntas
		FOREIGN KEY (id_tema_preguntas)
		REFERENCES tema_preguntas (id_tema_preguntas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);