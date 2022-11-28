-- MUCHO A MUCHOS

-- tabla productos 
CREATE TABLE productos ( 
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	nombre varchar(100) NOT NULL,
	descripcion varchar(100) not null
);

-- pedidos
CREATE TABLE pedidos ( 
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	fecha DATE NOT NULL,
	monto INT NOT NULL,
	cliente_id INT;
);

-- tabla relacional tipo intermedia; nombre dado en orden alfabetico > pedido_productos
-- id, fk de la tabla 1, fk tabla 2
-- id, pedido_id, producto_id
CREATE TABLE pedidos_productos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	pedido_id INT NOT NULL, 
	producto_id INT NOT NULL,
	cant_productos INT,
	subtotal INT,
	FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
	FOREIGN KEY (producto_id) REFERENCES productos(id) 
);

-- inserciones 
INSERT INTO productos (nombre, descripcion) 
VALUES ("stout","cerveza negra tipo stout"),
("coors","cerveza tipo lager");

INSERT INTO pedidos (fecha, monto)
VALUES ('2022-11-09 00:00:00',2300) -- formato de fecha mas usado: DATA TIME porque sirve para los filtros

-- para el pedido uno se solicita dos veces el producto 1. Lo correcto seria agregar una columna cantidad
INSERT INTO pedidos_productos (pedido_id, producto_id)
VALUES 
(1,1)
,(1,1);

-- agregando columnas 


