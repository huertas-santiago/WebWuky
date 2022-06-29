
use dbwuky;

SELECT*FROM Marca;

SELECT*FROM tipo_contrato;

SELECT*FROM entidad_afiliada;

SELECT*FROM rol;

SELECT*FROM permiso;

SELECT*FROM rol_permiso;

SELECT*FROM usuario;

SELECT*FROM cliente;

SELECT*FROM empleado;

SELECT*FROM afiliacion;

SELECT*FROM proveedor;

SELECT*FROM transportadora;

SELECT*FROM producto;

SELECT*FROM variante;

SELECT*FROM material;

SELECT*FROM variante_material;

SELECT*FROM categoria;

SELECT*FROM categoria_producto;

SELECT*FROM imagen;

SELECT*FROM infografia;

SELECT*FROM imagenes_infografia;

SELECT*FROM telefono;

SELECT*FROM producto_favorito;

SELECT*FROM pedido;

SELECT*FROM estados_pedidos;

SELECT*FROM envio;

SELECT*FROM estado_factura_cliente;

SELECT*FROM factura_proveedor;

SELECT*FROM carrito;

SELECT*FROM tema_preguntas;

SELECT*FROM preguntas_frecuentes;

SELECT*FROM logs_empleado;

SELECT*FROM logs_cliente;

SELECT*FROM acciones_realizadas;

SELECT*FROM información;

SELECT*FROM producto_imagen;

SELECT*FROM producto_pedido;

SELECT*FROM producto_factura_proveedor;

SELECT*FROM especie;

SELECT*FROM raza;

SELECT*FROM mascota;



SELECT usuario.nombre, cliente.id_usuario
from usuario inner join cliente on usuario.id_usuario=cliente.id_usuario;

#Buscar mascotas de los clientes
SELECT cliente.id_usuario, usuario.nombre, mascota.nombre
from cliente inner join usuario on cliente.id_usuario=usuario.id_usuario
inner join mascota on cliente.id_usuario = mascota.id_cliente 
Order by cliente.id_usuario;

SELECT count(genero) FROM usuario GROUP BY genero having genero= 'M';

SELECT count(genero) FROM usuario GROUP BY genero having genero= 'F';

SELECT*FROM estado_factura_cliente WHERE estado = 'Pagada';

SELECT nombre, tipo_documento, numero_documento, direccion 
FROM usuario order by nombre asc;

SELECT*FROM pedido WHERE fecha > '2022-04-01';

SELECT descripción as producto, sum(stock) as cantidad FROM variante 
WHERE descripción = 'Comida para perro';

SELECT count(peso) as cantidad FROM envio WHERE peso > 2.5;

SELECT id_factura_cliente, nombre_destinatario, tipo_documento, numero_documento, fecha, compra_neta FROM factura_cliente
WHERE fecha > '2022-04-01' AND compra_neta <600000;

SELECT id_factura_cliente, fecha, compra_neta, dijitos_tarjeta, id_banco FROM factura_cliente
WHERE compra_neta > 100000 order by fecha desc;



