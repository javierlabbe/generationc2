-- insertar datos en tablas

-- INSERT INTO NOMBRE_TABLA (NOMBRE_COL1, NOMBRE_COL2, ...) VALUES (VALOR1, VALOR2, ...);

INSERT INTO directivos (nombre, apellido) 
VALUES ("Ana","Rubio");

INSERT INTO directivos (nombre, apellido) -- no es necesario repetir el insert, se pueden poner varios parentesis separados con comas en values.
VALUES ("Lau","Soto"),
("Andrea","Montecinos");

-- consultar
select *
from directivos
where id = 2; -- filtrar

/* tarea tabla mascotas realizada en Tareamascotas.sql */

-- MODIFICAR LA DATA
-- drop database generationc2; elimina la base de datos, muy peligroso.

-- eliminar la tabla, tambien eliminamos contenido, no se puede recuperar
drop table directivos;

-- eliminar contenido de una tabla
TRUNCATE TABLE directivos;

-- modificar data de una columna especifica (dato especifico)
UPDATE nombre_tabla SET nombre_columna= el_nuevo_dato WHERE CONDICION

UPDATE directivos SET nombre= "Laura" WHERE id= 3; -- sin la condicion se cambiarian todos los nombres a laura

-- NOTA: antes de modificar, respaldar los datos (exportar)

-- se pueden consultar columnas especificas
SELECT 
apellido
, id
from directivos;

-- alias
SELECT
d.apellido as last_name -- tambien se pueden agregar alias a las columnas con "as"
, d.id
from directivos d; -- alias d 

-- Filtrar
SELECT
d.apellido as last_name 
, d.id
from directivos d 
where d.nombre = "andrea" and d.id = 4; -- con and podemos poner mas condiciones

-- filtrar por parte de palabra/numero; LIKE coincidencias
SELECT
d.nombre as first_name 
, d.id
from directivos d 
where d.nombre LIKE "an%"; -- el % es un regex 

-- PRIMARY KEY AND FOREING KEY 

-- Creacion de tabla sin foreing key

CREATE TABLE generationc2.cursos ( 
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	nombre varchar(100) NOT NULL,
	cant_alumnos INT NOT NULL,
	especialidad varchar(100)
);

-- insert tabla cursos 
INSERT INTO cursos
(nombre, cant_alumnos,especialidad) 
VALUES 
("Cohorte 1",30,"Java")
,("Cohorte 2",34,"Java")
,("Cohorte 3",35,"Java")
;

-- 1. agregar columna FK a estudiantes
ALTER TABLE estudiantes 
ADD curso_id INT ; -- no se pone not null porque si la tabla ya tiene datos nos obligara a llenar estos

-- 2. relacion de tablas
ALTER TABLE estudiantes 
ADD FOREIGN KEY(curso_id) REFERENCES cursos(id); -- aparecera MUL (multiples valores) en columna Key de propiedades de tabla estudiantes

INSERT into estudiantes 
(nombre, apellido, curso_id)
VALUES
("John","Doe",1)
,("Jane","Doe",2)
,("Tony","Stark",2)
,("Zoe","Doe",3);

