/* TABLAS */

	-- CREAR TABLA
CREATE TABLE generationc2.tecnicos ( -- tabla 1 
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- primary key asignado a columna id 
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL
--  PRIMARY KEY (id) * otra opción para agregar PK *
--  FOREIGN KEY (nombreCol_id) REFERENCES nombreTabla2(id) 	 * nombreCol_id es columna de tabla1 que sera FK para relacionar con PK de Tabla2 (id)
	);

	-- ELIMINAR TABLA
	-- elimina toda la tabla en si, no es que la deje vacia.
drop table nombreTabla;

	-- MODIFICAR ESTRUCTURA COLUMNA EN TABLA CREADA
	-- alter table para modificar tabla
	-- modify column para modificar estructura columna
ALTER TABLE generationc2.administrativos MODIFY COLUMN id INT PRIMARY KEY auto_increment NOT NULL;

	-- AGREGAR COLUMNA EN TABLA CREADA
ALTER TABLE nombreTabla 
ADD nombreColumna -- ejemplo tipo dato INT
;

	-- ELIMINAR COLUMNA EN TABLA CREADA
ALTER TABLE nombreTabla
DROP COLUMN nombreColumna;
	
	-- DESCRIBIR TABLA
DESCRIBE nombreTabla;
	
/* CONSULTA DE DATOS */

	-- CONSULTAR DATOS DE TABLA (TODOS)
SELECT 
* -- * (all) consulta todas las columnas 
FROM nombreTabla
;

	-- CONSULTAR COLUMNAS ESPECIFICAS
SELECT 
apellido
, id
from directivos;

	-- ALIAS
SELECT
d.apellido as last_name -- tambien se pueden agregar alias a las columnas con "as"
, d.id
from directivos d -- alias d 
;

	-- FILTRAR CON WHERE
SELECT
d.apellido as last_name 
, d.id
from directivos d 
where d.nombre = "andrea" and d.id = 4 -- con and podemos poner mas condiciones
;

	-- FILTRAR POR PARTE DE PALABRA/NUMERO; LIKE coincidencias
SELECT
d.nombre as first_name 
, d.id
from directivos d 
where d.nombre LIKE "an%" -- el % es un regex 
;

/* INSERCION */
	
	-- INSERCION DE DATOS EN COLUMNAS
INSERT INTO nombreTabla (columna1,columna2, columnaN)
VALUES 
(datoC1,datoC2,datoCN) -- insertara tantos registros como parentesis separados por comas hayan.
,(datoC1,datoC2,datoCN) 
;

/* MODIFICAR O ELIMINAR DATA */

	-- ELIMINAR TODOS LOS DATOS
	-- deja la tabla vacia, sin datos.
TRUNCATE nombreTabla;

	-- ELIMINAR DATO ESPECIFICO
DELETE FROM nombreTabla
	WHERE condicion;

	-- MODIFICAR DATO ESPECIFICO
UPDATE nombre_tabla SET nombre_columna= el_nuevo_dato WHERE CONDICION -- sin el where se modificaria toda la columna

/* RELACIONES */

	-- ADD PK A TABLA CREADA SIN PK
ALTER TABLE nombreTabla ADD PRIMARY KEY (nombreColumna);

	-- BORRAR PK EN TABLA
ALTER TABLE nombreTabla DROP PRIMARY KEY;
 
	-- RELACIONANDO TABLAS CON FK
ALTER TABLE direccion -- sin la tabla no tiene FK (en este caso es proveedor_id) agregar esa columna
ADD CONSTRAINT fk_proveedor_id -- Agregando nombre a relacion. se le puede poner el nombre que uno quiera, pero este es intuitivo.
FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)

/* JOINS */

	-- INNER JOIN
SELECT d.* FROM proveedores p 
INNER JOIN direccion d -- Join es para encontrar registros en comun entre dos o mas tablas
ON p.id = d.proveedor_id 
WHERE p.id = 2
;

	-- LEFT JOIN
SELECT * FROM proveedores p 
LEFT JOIN direccion d ON p.id = d.proveedor_id 
;

	-- RIGHT JOIN
SELECT * FROM proveedores p 
RIGHT JOIN direccion d ON p.id = d.proveedor_id 
;