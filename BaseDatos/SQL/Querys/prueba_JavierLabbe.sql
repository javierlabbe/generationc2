/*CREACION DE TABLAS*/

/* Entidad Cliente
 *  En esta entidad se alojaran los clientes a los que se les realiza una venta */
CREATE TABLE Cliente ( 
	idCliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
	nombre varchar(100) NOT NULL,
	rut varchar(100) NOT NULL
	);

/* Entidad Proveedor
 * En esta entidad se alojaran los proveedores que abastecen de productos al almacen */
CREATE TABLE Proveedor ( 
	idProveedor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
	nombre varchar(100) NOT NULL,
	rut varchar(100) NOT NULL
	);

/* Entidad Venta 
 * En esta entidad se alojara cada venta asociada a un cliente */
CREATE TABLE Venta ( 
	idVenta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
	fecha DATE NOT NULL,
	cliente_id INT,
	FOREIGN KEY(cliente_id) REFERENCES Cliente(idCliente)
	);
	
/* Entidad TipoProducto 
 * En esta entidad se alojaran los tipos de productos (Bebidas, Lacteos, Congelados, Confitería, Aseo) */
CREATE TABLE TipoProducto ( 
	idTipoProducto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
	tipo varchar(100) NOT NULL
	);

/* Entidad Producto 
 * En esta entidad se alojaran los productos ofrecidos a venta 
 * con su respectivo precio de compra al proveedor
 * y su precio de venta */
CREATE TABLE Producto ( 
	idProducto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
	nombre varchar(100) NOT NULL,
	precioCompra INT NOT NULL,
	precioVenta INT NOT NULL,
	tipo_id INT NOT NULL,
	FOREIGN KEY(tipo_id) REFERENCES TipoProducto(idTipoProducto)
	);

/* Entidad Producto_Venta 
 * Tabla de relacion entre Productos y Ventas */
CREATE TABLE Producto_Venta ( 
	idPrVe INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
	venta_id INT NOT NULL,
	producto_id INT NOT NULL,
	cantProd INT NOT NULL,
	FOREIGN KEY (venta_id) REFERENCES Venta(idVenta), 
	FOREIGN KEY (producto_id) REFERENCES Producto(idProducto)  
	);
	
/* Entidad Producto_Proveedor 
 * Tabla de relacion entre productos y proveedores */
CREATE TABLE Producto_Proveedor ( 
	idPrPr INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
	proveedor_id INT NOT NULL,
	producto_id INT NOT NULL,
	FOREIGN KEY (proveedor_id) REFERENCES Proveedor(idProveedor),  
	FOREIGN KEY (producto_id) REFERENCES Producto(idProducto)  
	);

/*INSERCION DE DATOS*/

-- Tipos de productos
INSERT INTO TipoProducto (tipo)
VALUES 
('Bebidas') 
,('Aseo')
,('Congelados')
,('Lacteos')
,('Confiteria')
;

-- Productos ofrecidos
INSERT INTO Producto (nombre, precioCompra, precioVenta, tipo_id)
VALUES 
('Cocacola',1200,2000,1)
,('Sprite',1200,2000,1)
,('Cloro',350,700,2)
,('Lavaloza',400,850,2)
,('Leche descremada',500,900,4)
,('Filetes de pollo',2000,4500,3)
,('Chocolate costarama',700,1000,5)
;

-- Proveedores
INSERT INTO Proveedor (nombre,rut)
VALUES 
('Cocacola','8.547.741-9')
,('Costa','77.458.111-8')
,('Clorox','84.447.899-1')
,('Unilever','45.474.662-7')
,('Soprole','12.455.784-1')
,('Superpollo','25.687.451-2')
;

-- Clientes
INSERT INTO Cliente (nombre, rut)
VALUES 
('Julio Muñoz','19.457.845-4')
,('Felipe Madrid','5.784.216-7')
,('Tony Stark','8.784.965-7')
;

-- Ventas
INSERT INTO Venta (fecha, cliente_id)
VALUES 
('2021-05-06',1)
,('2021-06-16',1)
,('2021-06-20',2)
,('2021-07-06',3)
,('2022-03-16',1)
,('2022-05-20',2)
,('2022-07-06',2)
,('2022-08-07',3)
;

-- Producto_Venta
INSERT INTO Producto_Venta (venta_id, producto_id, cantProd)
VALUES 
(1,1,1)
,(1,5,3)
,(1,3,1)
,(2,1,2)
,(2,7,1)
,(3,3,1)
,(4,6,3)
,(4,2,1)
,(5,7,4)
,(6,1,1)
,(6,2,1)
,(7,4,1)
,(7,5,5)
,(8,6,1)
;

-- Producto_Proveedor
INSERT INTO Producto_Proveedor (proveedor_id, producto_id)
VALUES 
(1,1)
,(1,2)
,(3,3)
,(4,4)
,(5,5)
,(6,6)
,(2,7)
;

/* CONSULTA DE DATOS 
 * Esta consulta entrega la cantidad total vendida y la ganancia asociada por producto
 * durante el año 2022 */
SELECT 
extract(YEAR from v.fecha) as año 
,p.nombre 
,SUM(pv.cantProd) as sumaCantidad
,SUM(pv.cantProd * (p.precioVenta - p.precioCompra)) as sumaGanancia
FROM Producto_Venta pv 
LEFT JOIN Producto p ON producto_id = p.idProducto
LEFT JOIN Venta v ON venta_id = v.idVenta
WHERE v.fecha BETWEEN '2022-01-01' and '2022-12-31'
GROUP BY año ,p.nombre
ORDER BY sumaGanancia DESC
;

