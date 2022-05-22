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
  
  fabricado BOOLEAN NULL COMMENT 'Descrpcion del fabricantes',
  descripción VARCHAR(400) NULL COMMENT 'Detalle o caracteristicas de la clase\n',
  moneda VARCHAR(45) NULL COMMENT 'unidad de cambio que facilita la transferencia de bienes y servicios',
  descuento VARCHAR(45) NULL COMMENT 'es una disminución del precio de un bien o un servicio\n',
  habilitado VARCHAR(45) NULL COMMENT 'clase que habilita o no el descuento ',
  visualización_facebook VARCHAR(45) NULL COMMENT 'metricas de facebook ',
  disponible_facebook VARCHAR(45) NULL COMMENT 'Inventario de los productos disponibles de la aplicación',
  marca VARCHAR(45) NULL COMMENT ' identificador comercial de los bienes y servicios que ofrece una empresa\n',
  sexo VARCHAR(45) NULL COMMENT 'hace referencia a las características biológicas y fisiológicas que definen a los machos de las hembras',
  id_marca INT NULL COMMENT 'id clase',
  proveedor_idproveedor INT NOT NULL COMMENT 'id clase',
  version VARCHAR(45) NULL COMMENT 'Valor númerico de la actualización del producto ',
  PRIMARY KEY (id_interno),
  INDEX id_marca_idx (id_marca ASC) VISIBLE,
  CONSTRAINT id_marca
    FOREIGN KEY (id_marca)
    REFERENCES marca (id_marca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;