-- tarea: crear tabla mascotas, minimo 4 columnas, minimo 4 inserciones
CREATE TABLE generationc2.mascotas ( 
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	tipo varchar(100) NOT NULL,
	dueño varchar(100) NOT NULL
);

INSERT INTO mascotas (nombre, tipo, dueño) 
VALUES ("Chop","perro","Israel"),
("Michi","gato","Dominique"),
("Raul","hamster","Eduardo"),
("Rene","rana","Sofia")
;