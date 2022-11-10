-- relaciones

CREATE table proveedores(
	id INT primary key not null auto_increment
	, nombre varchar(100) not null
	, rut varchar(100) not null
);
/*
 * Proveedor
 * id nombre rut
 * 1 Fran SPA 01-sept
 */

CREATE table direccion(
	id INT primary key not null auto_increment
	, calle varchar(100) not null
	, numero INT not null
	, sector varchar(100) not null
	, ciudad varchar(100) not null
	, region varchar(100) not null
	, codigo_postal INT
	, proveedor_id INT not null
);

-- agregando relacion de tablas

ALTER TABLE direccion
ADD CONSTRAINT fk_proveedor_id -- Agregando nombre a relacion. se le puede poner el nombre que uno quiera, pero este es intuitivo.
FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)

-- insertando proveedores en tabla
INSERT INTO proveedores 
(nombre, rut) 
VALUES 
("Aconcagua","18.247.874-8")
,("WildLama","11.054.774-6")
,("Quicksilver","8.457.662-7")
;

INSERT INTO proveedores 
(nombre, rut) 
VALUES 
("forPets","22.008.104-7");

-- insertando direcciones en tabla
INSERT INTO direccion 
(calle, numero,sector,ciudad,region,codigo_postal,proveedor_id)
VALUES
("arica",161,"maipu","santiago","rm",78400,2)
, ("curepto",68,"pudahuel","santiago","rm",78780,1)
, ("bandera",44,"santiago","santiago","rm",77410,3)

INSERT INTO direccion 
(calle, numero,sector,ciudad,region,proveedor_id)
VALUES
("mejillones",7014,"vitacura","santiago","rm",2)
;

SELECT
*
FROM proveedores p;

SELECT 
*
FROM direccion d ;

-- SQL JOINS

-- inner join
SELECT * FROM proveedores p 
INNER JOIN direccion d -- Join es para encontrar registros en comun entre dos o mas tablas
ON p.id = d.proveedor_id 
;

SELECT d.* FROM proveedores p 
INNER JOIN direccion d ON p.id = d.proveedor_id 
WHERE p.id = 2
;

SELECT 
d.id
, d.calle
,d.numero  
FROM proveedores p 
INNER JOIN direccion d ON p.id = d.proveedor_id 
WHERE p.id = 2
;

-- left join
SELECT * FROM proveedores p 
LEFT JOIN direccion d ON p.id = d.proveedor_id 
;

-- right join
SELECT * FROM proveedores p 
RIGHT JOIN direccion d ON p.id = d.proveedor_id 
;