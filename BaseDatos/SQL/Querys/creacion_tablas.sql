-- crear tabla
/* 
estructura:
CREATE TABLE baseDeDatos.nombreTabla (
	nombre_columna1 tipo_dato restricciones,
	nombre_columna2 tipo_dato restricciones,
	nombre_columna3 tipo_dato restricciones,
);

**/

CREATE TABLE generationc2.tecnicos ( 
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- primary key asignado a columna id 
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL
);

-- Para modificar estructura de columna en tabla creada 
-- alter table para modificar tabla
-- modify column para modificar columna
ALTER TABLE generationc2.administrativos MODIFY COLUMN id INT PRIMARY KEY auto_increment NOT NULL;

CREATE TABLE generationc2.directivos ( 
	id INT NOT NULL AUTO_INCREMENT, 
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL,
	PRIMARY KEY (id)
);

-- describir tabla
describe profesores;

-- Para consultar los datos dentro de la tabla
select * from directivos;