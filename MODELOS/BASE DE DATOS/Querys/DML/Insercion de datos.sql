use DBwuky;

DESCRIBE marca;
INSERT INTO marca (nombre) values ('GUAMBA');
INSERT INTO marca (nombre) values ('FURRY');
INSERT INTO marca (nombre) values ('PETYS');
INSERT INTO marca (nombre) values ('MAX');
INSERT INTO marca (nombre) values ('PURINA ONE');
INSERT INTO marca (nombre) values ('EQUILIBRIO');
SELECT*FROM marca;

DESCRIBE usuario;
INSERT INTO usuario (correo, contrasenna, nombre, genero, tipo_documento, numero_documento, fecha_nacimiento, direccion)
  values ('pepito@perez.com', 'xxxxx', 'Pepito Perez', 'M', 'CC', '1001000000', '1999-05-25', 'KR 150 #18-68 Bgta');
 INSERT INTO usuario (correo, contrasenna, nombre, genero, tipo_documento, numero_documento, fecha_nacimiento, direccion)
  values ('lupe@gomez.com', 'xxxxx', 'Lupe Gomez', 'F', 'CC', '1001000001', '1998-05-25', 'KR 50 #10-23 Bgta');
INSERT INTO usuario (correo, contrasenna, nombre, genero, tipo_documento, numero_documento, fecha_nacimiento, direccion)
  values ('hernan@gomez.com', 'xxxxx', 'Hernan Gomez', 'M', 'CC', '1001000023', '1998-05-10', 'CLL 01 #10-23 Bgta');
INSERT INTO usuario (correo, contrasenna, nombre, genero, tipo_documento, numero_documento, fecha_nacimiento, direccion)
 values ('santiago@huertas.com', 'xxxxx', 'Santiago Huertas', 'M', 'TI', '1001000121', '2003-10-10', 'CLL 9 #10-23 Bgta');
INSERT INTO usuario (correo, contrasenna, nombre, genero, tipo_documento, numero_documento, fecha_nacimiento, direccion)
 values ('jessica@perez.com', 'xxxxx', 'Jessica Perez', 'F', 'CC', '1001000523', '1989-10-20', 'KR 50 #10-28 Bgta');
INSERT INTO usuario (correo, contrasenna, nombre, genero, tipo_documento, numero_documento, fecha_nacimiento, direccion)
 values ('alejandra@herrera.com', 'xxxxx', 'Alejandra Herrera', 'F', 'TI', '1001569881', '2005-01-10', 'KR 50 #10-23 Bgta');
SELECT*FROM usuario;
#drop table usuario;

DESCRIBE tipo_contrato;
INSERT INTO tipo_contrato (nombre) VALUES ('Termino Indefinido');
INSERT INTO tipo_contrato (nombre) VALUES ('Termino Fijo');
INSERT INTO tipo_contrato (nombre) VALUES ('Obra a Labor');
SELECT*FROM tipo_contrato;

DESCRIBE rol;
INSERT INTO rol (nombre_rol) VALUES ('Administrador');
INSERT INTO rol (nombre_rol) VALUES ('Empleado');
SELECT*FROM rol;

DESCRIBE permiso;
INSERT INTO permiso (nombre_permiso) VALUES ('Editar Producto');
INSERT INTO permiso (nombre_permiso) VALUES ('Agregar Producto');
INSERT INTO permiso (nombre_permiso) VALUES ('Eliminar Producto');
INSERT INTO permiso (nombre_permiso) VALUES ('Agregar Empleado');
INSERT INTO permiso (nombre_permiso) VALUES ('Editar Empleado');
INSERT INTO permiso (nombre_permiso) VALUES ('Eliminar Empleado');
SELECT*FROM permiso;

DESCRIBE rol_permiso;
INSERT INTO rol_permiso (id_rol, id_permiso)  VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6);
INSERT INTO rol_permiso (id_rol, id_permiso) VALUES (2,1),(2,2),(2,3);
SELECT*FROM rol_permiso;

DESCRIBE imagen;
INSERT INTO imagen (url, descripcion, tamaño) VALUES ('https://images.app.goo.gl/Y1Z5PurqitfCGRgCA', 'Foto de Lupe Gomez', 'P');
INSERT INTO imagen (url, descripcion, tamaño) VALUES ('https://images.app.goo.gl/Qer9qCJbQdSBSm8e9', 'Foto de Alejandra Herrera', 'P');
INSERT INTO imagen (url, descripcion, tamaño) VALUES ('https://images.app.goo.gl/4D36yBeYVHQUtydN6', 'Foto de Pepito Perez', 'P');
INSERT INTO imagen (url, descripcion, tamaño) VALUES ('https://images.app.goo.gl/K13DUXHQ5qsEsMeU8', 'Foto de Gato Persa', 'P');
INSERT INTO imagen (url, descripcion, tamaño) VALUES ('https://images.app.goo.gl/uehwDKNMPRK1JQKZ6', 'Foto de Perro Bulldog', 'M');
INSERT INTO imagen (url, descripcion, tamaño) VALUES ('https://images.app.goo.gl/ycwSQ3F64iZHe84Q9', 'Foto de Perro Pastor Aleman', 'P');
INSERT INTO imagen (url, descripcion, tamaño) VALUES ('https://images.app.goo.gl/ab4xVUdBBDTMgwbZ7', 'Foto de Gato Maine Coon', 'P');
INSERT INTO imagen (url, descripcion, tamaño) VALUES ('https://images.app.goo.gl/megbGYmqbQTuiCL28', 'Foto de Gato Bengala', 'G');
SELECT*FROM imagen;
#drop table imagen;


DESCRIBE empleado;
INSERT INTO empleado(id_usuario, id_tipo_contrato, id_rol, foto, grupo_sanguineo_RH, fecha_contratacion, fecha_fin_contratacion, codigo_contrato, activo, cargo)
 VALUES (2, 2, 2, 1, 'O+', '2022-05-12', '2022-10-12', '001', 1, 'Auxiliar de Contabilidad');
INSERT INTO empleado(id_usuario, id_tipo_contrato, id_rol, foto, grupo_sanguineo_RH, fecha_contratacion, fecha_fin_contratacion, codigo_contrato, activo, cargo)
 VALUES (6, 3, 1, 2, 'AB+', '2022-01-01', '2022-03-15', '002', 1, 'Administradora de Plataformas');
INSERT INTO empleado(id_usuario, id_tipo_contrato, id_rol, foto, grupo_sanguineo_RH, fecha_contratacion, fecha_fin_contratacion, codigo_contrato, activo, cargo)
  VALUES (1, 2, 2, 3, 'O-', '2021-12-12', '2022-12-12', '003', 1, 'Auxiliar de Contabilidad');
SELECT*FROM empleado;
#drop table empleado;

DESCRIBE cliente; 
INSERT INTO cliente (id_usuario) VALUES (3);
INSERT INTO cliente (id_usuario) VALUES (4);
INSERT INTO cliente (id_usuario) VALUES (5);
SELECT*FROM cliente;
#drop table cliente;

DESCRIBE especie;
INSERT INTO especie (nombre) VALUES ('Gato');
INSERT INTO especie (nombre) VALUES ('Perro');
SELECT*FROM especie;

DESCRIBE raza;
INSERT INTO raza (id_especie, nombre) VALUES (2, 'Bulldog');
INSERT INTO raza (id_especie, nombre) VALUES (2, 'Pastor Aleman');
INSERT INTO raza (id_especie, nombre) VALUES (2, 'Boxer');
INSERT INTO raza (id_especie, nombre) VALUES (2, 'Pug');
INSERT INTO raza (id_especie, nombre) VALUES (2, 'Labrador');
INSERT INTO raza (id_especie, nombre) VALUES (1, 'Gato Persa');
INSERT INTO raza (id_especie, nombre) VALUES (1, 'Maine Coon');
INSERT INTO raza (id_especie, nombre) VALUES (1, 'Bengala');
SELECT*FROM raza;

DESCRIBE mascota;
INSERT INTO mascota (id_raza, id_cliente, foto, nombre, sexo, tamaño, fecha_nacimiento)
 VALUES (1, 1, 5, 'lucas', 'M', 'Grande', '2015-05-12');
INSERT INTO mascota (id_raza, id_cliente, foto, nombre, sexo, tamaño, fecha_nacimiento)
 VALUES (6, 2, 4, 'Anastacia', 'H', 'Pequeño', '2020-08-02');
INSERT INTO mascota (id_raza, id_cliente, foto, nombre, sexo, tamaño, fecha_nacimiento)
 VALUES (7, 3, 7, 'Horacio', 'M', 'Grande', '2018-12-16');
INSERT INTO mascota (id_raza, id_cliente, foto, nombre, sexo, tamaño, fecha_nacimiento)
 VALUES (8, 3, 8, 'Pancho', 'H', 'Pequeña', '2018-12-16');
SELECT*FROM mascota;
#drop table mascota;

DESCRIBE factura_cliente;
INSERT INTO factura_cliente (id_factura_cliente,fecha,rete_ica,rete_fuente,iva,subtotal,compra_neta,dijitos_tarjeta,id_banco,codigo_facturado,respuesta_banco,forma_pago,nombre_destinatario,tipo_documento,numero_documento) 
VALUES (null,'2022-06-07',0,0,23456.64,123456,146912.64,956,'B12','67545h6767',1,'Tj','Santiago Huertas','C',8706833565);
INSERT INTO factura_cliente (id_factura_cliente,fecha,rete_ica,rete_fuente,iva,subtotal,compra_neta,dijitos_tarjeta,id_banco,codigo_facturado,respuesta_banco,forma_pago,nombre_destinatario,tipo_documento,numero_documento) 
VALUES (null,'2019-10-01',0,0,110200,580000,690200,970,'B13','67545h6768',0,'Tj','Marlon Martinez','C',378120729);
INSERT INTO factura_cliente (id_factura_cliente,fecha,rete_ica,rete_fuente,iva,subtotal,compra_neta,dijitos_tarjeta,id_banco,codigo_facturado,respuesta_banco,forma_pago,nombre_destinatario,tipo_documento,numero_documento) 
VALUES (null,'2022-10-20',0,0,6460,34000,40460,226,'B14','67545h6769',1,'Tj','Lucas Contreras','C',1038055081);
INSERT INTO factura_cliente (id_factura_cliente,fecha,rete_ica,rete_fuente,iva,subtotal,compra_neta,dijitos_tarjeta,id_banco,codigo_facturado,respuesta_banco,forma_pago,nombre_destinatario,tipo_documento,numero_documento) 
VALUES (null,'2020-10-12',0,0,22800,120000,142800,142,'B15','67545h6770',1,'Tj','Milena Castro ','C',4592966760);
SELECT*FROM factura_cliente;
#DROP TABLE factura_cliente;

DESCRIBE estados_facturas_cliente;
INSERT INTO estados_facturas_cliente (id_estados_facturas_cliente,id_factura_cliente,estado,fecha_inicio,id_estado_anterior) 
VALUES (null,2,'Pendiente','2022-02-03',null);
INSERT INTO estados_facturas_cliente (id_estados_facturas_cliente,id_factura_cliente,estado,fecha_inicio,id_estado_anterior) 
VALUES (null,1,'Pagada','2020-02-02',null);
INSERT INTO estados_facturas_cliente (id_estados_facturas_cliente,id_factura_cliente,estado,fecha_inicio,id_estado_anterior) 
VALUES (null,3,'Pagada','2022-01-02',null);
SELECT*FROM  estados_facturas_cliente;
#DROP TABLE estados_facturas_cliente;

