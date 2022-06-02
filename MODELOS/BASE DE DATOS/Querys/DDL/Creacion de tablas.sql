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
	id_producto INT NULL COMMENT 'ID de la clase',
	descripcion VARCHAR(45) NULL COMMENT 'clase que resulta de una especifica el producto según un criterio o jerarquía',
	id_materiales INT NULL COMMENT 'ID de la clase',
	id_marca INT NULL COMMENT 'ID de la clase',
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

#Paula
CREATE TABLE IF NOT EXISTS rol (
	id_rol INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase rol',
    nombre_rol VARCHAR (45)NOT NULL COMMENT'nombre del rol del usuario',
    descripcion VARCHAR (45) NOT NULL COMMENT'detalle o caracteristica del rol',
	FOREIGN KEY (id_cargo)
    REFERENCES cargo(id_cargo),
    FOREIGN KEY (id_permisos)
    REFERENCES permisos (id_permisos));

#Jessica
CREATE TABLE IF NOT EXISTS usuario (
	id_usuario INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase usuario',
	correo VARCHAR (50) UNIQUE NOT  NULL COMMENT'Correo de usuario',
    contrasenna  VARCHAR (50)NOT NULL COMMENT 'contraseña de correo de usuario',
    nombre VARCHAR (50) NOT NULL COMMENT 'nombre de usuario',
    genero VARCHAR (1 ) COMMENT 'genero de usuario',
    tipo_documento VARCHAR (1 ) COMMENT 'tipo de documento de usuario',
    numero_documento VARCHAR (10) COMMENT 'numero de documento de identifidad',
    direccion  VARCHAR (100)  COMMENT 'direccion de usuario	'
);
    
#jessica #Modificado por Santiago
CREATE TABLE IF NOT EXISTS cliente (
	id_usuario INT UNSIGNED NOT NULL COMMENT 'PK de la clase cliente y FK de la tabla Usuario' PRIMARY KEY,
    facebook_vinculado VARCHAR (50) UNIQUE NOT  NULL COMMENT 'cuenta de facebook asociada del cliente',
    correo_vinculado VARCHAR (50) UNIQUE NOT  NULL COMMENT 'cuenta de correo asociada del cliente',
    CONSTRAINT fk_id_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

#Santiago
CREATE TABLE IF NOT EXISTS empleado (
	id_usuario INT UNSIGNED NOT NULL COMMENT 'FK de la clase Usuario',
	id_contrato INT UNSIGNED NULL COMMENT '',
	id_tipo_contrato INT UNSIGNED NOT NULL COMMENT 'tipo de contrato que manejara el usuario',

    telefono_emergencia INT NULL COMMENT 'secuencia de dígitos utilizada para identificar una línea telefónica',
	fecha_contratacion DATETIME NULL COMMENT 'fecha de proceso contrato usuario',
	codigo_contrato INT NULL COMMENT 'conjunto de caracteres que identifican el tipo de contrato que se manejara',
	tipo_contrato VARCHAR(45) NULL COMMENT 'Especifica el contrato que el usuario tendra',
	RH VARCHAR(3) NULL COMMENT 'Tipo de sangre',
	tipo_afialiacion VARCHAR(45) NULL COMMENT 'categoria afilicacion a caja de compensación familiar',
	afialiacion VARCHAR(45) NULL COMMENT 'afilicacion a caja de compensación familiar',
	cargo VARCHAR(45) NULL COMMENT 'Especifica el cargo que manejara'
    /*
	PRIMARY KEY (id_usuario),
	INDEX fk_empleado_usuario1_idx (idusuario ASC) VISIBLE,
	INDEX fk_empleado_tipo_contrato1_idx (tipo_contrato_idtipo_contrato ASC) VISIBLE,
	CONSTRAINT fk_empleado_usuario1
	FOREIGN KEY (idusuario)
	REFERENCES usuario (idusuario)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
    
	CONSTRAINT fk_empleado_tipo_contrato1
	FOREIGN KEY (tipo_contrato_idtipo_contrato)
	REFERENCES tipo_contrato (idtipo_contrato)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION*/
);

#Santiago
CREATE TABLE IF NOT EXISTS transportadora (
	id_usuario INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase transportadora y FK de la tabla Usuario',
	PRIMARY KEY (id_usuario)
    
    /*
	CONSTRAINT fk_transportadora_usuario1
		FOREIGN KEY (iidusuario)
		REFERENCES mydb.usuario (idusuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

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
CREATE TABLE IF NOT EXISTS infografia (
	id_infografia INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase infografia',
	imagenes VARCHAR(45) NULL,
	texto TEXT NULL,
	tamaño_imagen VARCHAR(45) NULL,
    seccion INT UNSIGNED NULL COMMENT 'En que posicion esta ubicado la infografia en el home del cliente',
	nombre VARCHAR(45) NULL,
    habilitado BOOL NOT NULL COMMENT 'Representa si se muestra o no la infografia',
	PRIMARY KEY (id_infografia)
);

#Santiago
CREATE TABLE IF NOT EXISTS imagenes_infografia (
	id_imagen INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'FK a la clase imagen',
	id_infografia INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'FK a la clase infografia',
	PRIMARY KEY (id_imagen, id_infografia)
    
    /*
	INDEX fk_infografia_has_Imagenes_Imagenes1_idx (Imagenes_id ASC) VISIBLE,
	INDEX fk_infografia_has_Imagenes_infografia1_idx (infografia_idinfografia ASC) VISIBLE
	*/
    
	/*
	CONSTRAINT fk_infografia_has_Imagenes_infografia1
		FOREIGN KEY (infografia_idinfografia)
		REFERENCES mydb.infografia (idinfografia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_infografia_has_Imagenes_Imagenes1
		FOREIGN KEY (Imagenes_id)
		REFERENCES Imagenes (idimagenes)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);

#jessica
CREATE TABLE IF NOT EXISTS telefono (
	id_telefono INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT  'PK de la clase telefono',
    celular VARCHAR (10) UNIQUE COMMENT 'Número Telefono Celular',
    fijo VARCHAR (10) UNIQUE COMMENT 'Número Telefono fijo',
	id_usuario INT UNSIGNED NOT NULL COMMENT 'FK a la clase usuario',
    
    #foto VARCHAR(45) NULL COMMENT 'Imgen del usuario',
	contraseña INT NULL COMMENT 'Caracteres para ingreso a la plataforma',
	nombre VARCHAR(45) NULL COMMENT 'Nombrre de la categoría',
	genero VARCHAR(45) NULL COMMENT 'sexo del usuario',
	tipo_documento VARCHAR(45) NULL COMMENT 'Reconoce la clase de identificación que maneja el individuo',
	numero_documento INT NULL COMMENT 'Numero unico  que idefica el individuo',
	direccion VARCHAR(45) NULL COMMENT 'Lugar de residencia habitual.',
	numero_telefono INT NULL COMMENT 'secuencia de dígitos utilizada para identificar una línea telefónica',
	numero_celular INT NULL COMMENT 'secuencia de dígitos utilizada para identificar una línea telefónica',
    
    CONSTRAINT id_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
		
#paula
CREATE TABLE IF NOT EXISTS producto_favorito (
	id_producto_favorito INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase producto_favorito',
    id_cliente INT UNSIGNED NOT NULL COMMENT 'PK de la clase cliente',
    nombre VARCHAR (45),
    cantidad VARCHAR (45),
    comprado VARCHAR (45),
    descuento VARCHAR (45) COMMENT 'disminucion del precio',
    FOREIGN Key (id_cliente)
    REFERENCES cliente (id_cliente));

CREATE TABLE IF NOT EXISTS categoria (
	id_categoria INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase categoria',
    nombre VARCHAR (45),
    descripcion VARCHAR(45));

CREATE TABLE IF NOT EXISTS especie (
	id_especie INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase especie',
    id_mascota INT UNSIGNED NOT NULL COMMENT 'PK de la clase mascota',
    id_raza INT UNSIGNED NOT NULL COMMENT 'PK de la clase raza',
    nombre VARCHAR (45),
    FOREIGN Key (id_mascota)
    REFERENCES mascota (id_mascota),
    FOREIGN Key (id_raza)
    REFERENCES raza (id_raza));

CREATE TABLE IF NOT EXISTS raza (
	id_raza INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase raza',
    id_especie INT UNSIGNED NOT NULL COMMENT 'PK de la clase especie',
    nombre VARCHAR (45),
	FOREIGN Key (id_especie)
    REFERENCES especie (id_especie));

CREATE TABLE IF NOT EXISTS mascota (
	id_mascota INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase mascota',
    id_raza INT UNSIGNED NOT NULL COMMENT 'PK de la clase raza',
    id_cliente INT UNSIGNED NOT NULL COMMENT 'PK de la clase cliente',
    foto VARCHAR (45),
    sexo VARCHAR (45),
    tamaño VARCHAR (45),
    fecha_nacimiento VARCHAR(45),
	FOREIGN Key (id_raza)
    REFERENCES raza (id_raza),
	FOREIGN Key (id_cliente)
    REFERENCES cliente (id_cliente));


CREATE TABLE IF NOT EXISTS tipo_contrato (
	id_tipo_contrato INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase tipo_contrato',
    nombre VARCHAR (45));



CREATE TABLE IF NOT EXISTS entidad_afiliada (
   id_entidad_afiliada INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase entidad_afiliada',
   nombre VARCHAR(45));

CREATE TABLE IF NOT EXISTS afiliacion (
	id_afiliacion INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase afiliacion',
    id_entidad_afiliada INT UNSIGNED NOT NULL COMMENT 'PK de la clase entidad_afiliada',
    fecha_afiliacion DATE );

#PAULA
CREATE TABLE IF NOT EXISTS pedido(
	id_pedido INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'PK de la clase pedido',
    fecha DATE,
    direccion_envio VARCHAR (45));

#PAULA
CREATE TABLE IF NOT EXISTS estados_pedidos(
	id_estados_pedidos INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase estados_pedidos',
    nombre VARCHAR (45),
    fecha_inicio DATE,
    hora_inicio TIME, 
    tiempo TIME  NOT NULL );
#PAULA
CREATE TABLE IF NOT EXISTS factura (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

#PAULA
CREATE TABLE IF NOT EXISTS factura_cliente (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

#PAULA
CREATE TABLE IF NOT EXISTS estados_facturas_cliente (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

#Santiago
CREATE TABLE IF NOT EXISTS proveedor (
	idusuario INT UNSIGNED NOT NULL COMMENT 'FK de la clase Usuario',
    CONSTRAINT fk_id_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

#Santiago
CREATE TABLE IF NOT EXISTS factura_proveedor (
	id_factura INT UNSIGNED NOT NULL COMMENT 'FK a la clase factura',
	id_empleado INT NOT NULL COMMENT 'FK a la clase empleado, Quien realizó el pedido',
	id_proveedor INT NOT NULL COMMENT 'FK a la clase proveedor',
    
	fecha DATETIME NOT NULL COMMENT 'Fecha en que se realizó el pedido',
    
	rete_ica VARCHAR(45) NULL COMMENT 'Impuesto de retención',
	rete_fuente VARCHAR(45) NULL COMMENT 'Impuesto de retención',
	iva INT NULL COMMENT 'Impuesto asociado al producto',
	subtotal INT NULL COMMENT 'Valor de la suma de los productos',
    
	precio_total INT NULL COMMENT 'total de  la suma de los productos',
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
	id_carrito INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase carrito',
    id_cliente INT NOT NULL COMMENT 'FK a la clase cliente'
    
    /*
	PRIMARY KEY (id_cliente),
	CONSTRAINT fk_carrito_cliente1
		FOREIGN KEY (id_usuario)
		REFERENCES cliente (id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	*/
);



#Santiago
CREATE TABLE IF NOT EXISTS tema_preguntas (
	id_tema_preguntas INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase tema_preguntas',
    nombre VARCHAR(45) NULL    
);

#Santiago
CREATE TABLE IF NOT EXISTS preguntas_frecuentes (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca'

);

#jessica
CREATE TABLE IF NOT EXISTS dispositivo (
	id_dispositivo INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase dispositivo',
    Nombre VARCHAR (50) NOT NULL COMMENT 'nombre de usuario'
    );
    
#jessica
CREATE TABLE IF NOT EXISTS logs_empleado (
	id_empleado INT UNSIGNED AUTO_INCREMENT NOT NULL ,
	direccion_ip INT NOT NULL,
    Tiempo_en_plataforma TIME(50) NOT NULL ,
	hora_inicio TIME (50) NOT NULL ,
    fecha_ingreso  DATE NOT NULL
    );
    
#jessica
CREATE TABLE IF NOT EXISTS acciones (
	id_acciones INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca',
    nombre VARCHAR(45) NULL COMMENT 'Nombre de clase la acciones'
    );
    
#jessica 
CREATE TABLE IF NOT EXISTS acciones_realizadas (
	id_usuario INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase id_usuario',
    id_accion INT NOT NULL COMMENT 'Id accion',
    descripción VARCHAR (45) NULL COMMENT 'descripcion clase accion'
    );
    
#jessica
CREATE TABLE IF NOT EXISTS información (
	id_información INT UNSIGNED AUTO_INCREMENT NOT NULL ,
    texto VARCHAR(100) NULL ,
    titulo VARCHAR(50) NULL ,
    id_imagen INT NULL
    );

#jessica
CREATE TABLE IF NOT EXISTS logs_cliente (
	id_logs_cliente INT UNSIGNED AUTO_INCREMENT NOT NULL,
    direccion_ip INT NOT NULL,
    Tiempo_en_plataforma TIME(50) NOT NULL ,
	hora_inicio TIME (50) NOT NULL ,
    fecha_ingreso  DATE NOT NULL
);
    
#Jessica
CREATE TABLE IF NOT EXISTS permisos (
	id_permisos INT UNSIGNED AUTO_INCREMENT NOT NULL,
    Nombre_empleado VARCHAR(45) NULL,
    Descripcion VARCHAR(100) NULL
    );

#Jessica
CREATE TABLE IF NOT EXISTS producto_imagenes (
	id_imagen INT UNSIGNED AUTO_INCREMENT NOT NULL,
    id_producto INT UNSIGNED AUTO_INCREMENT NOT NULL
    );

#Jessica
CREATE TABLE IF NOT EXISTS categoria_productos (
	id_categoria_productos INT UNSIGNED AUTO_INCREMENT NOT NULL,
    id_producto INT UNSIGNED AUTO_INCREMENT NOT NULL
);

#Jessica
CREATE TABLE IF NOT EXISTS tipo_materiales (
	id_tipo_materiales INT UNSIGNED AUTO_INCREMENT NOT NULL
    );

#Jessica
CREATE TABLE IF NOT EXISTS materiales (
	id_materiales INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_tipo_materiales INT UNSIGNED  NOT NULL,
    CONSTRAINT fk_id_tipo_materiales
		FOREIGN KEY (id_tipo_materiales)
        REFERENCES tipo_materiales (id_tipo_materiales)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
        );

#Jessica
CREATE TABLE IF NOT EXISTS productos_materiales (
	id_material INT UNSIGNED NOT NULL ,
    id_producto INT UNSIGNED NOT NULL
    );

#Jessica
CREATE TABLE IF NOT EXISTS rol_permiso (
	nombre_rol  VARCHAR (50)NOT NULL,
    id_permiso INT UNSIGNED AUTO_INCREMENT NOT NULL
);

CREATE TABLE IF NOT EXISTS envio (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS producto_pedido (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');

CREATE TABLE IF NOT EXISTS producto_facturaProveedor (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca');


CREATE TABLE IF NOT EXISTS producto_carrito (
	id_marca INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'PK de la clase marca',
    cantidad_producto VARCHAR(45) NULL COMMENT 'Número determinado de unidades adquiridos'
);

