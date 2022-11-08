-- Query para crear tabla
CREATE TABLE generationc2.Estudiantes (
	nombre varchar(100) NOT NULL,
	Id BIGINT auto_increment NOT NULL,
	apellido varchar(100) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_spanish_ci;

-- Query de insersión
INSERT INTO generationc2.estudiante (id,nombre,apellido)
	VALUES (3,'Tony','Stark');

-- Query de eliminación 
DELETE FROM generationc2.estudiante
	WHERE id=1 AND nombre='Jhon' AND apellido='Doe';

-- creacion de usuario (no se relaciona con creacion de tablas)

CREATE USER 'javier'@'localhost' IDENTIFIED BY 'Admin1234*'; -- creacion de usuario

GRANT ALL PRIVILEGES ON *.* TO 'javier'@'localhost' WITH GRANT OPTION; -- otorgando privilegios al usuario

FLUSH PRIVILEGES;