-- ejercicio

/* 
 * tabla direcciones
 * id, nombre, numero, ciudad
 * 
 * agregar todas las tablas la relacion
 * */

CREATE TABLE generationc2.direcciones ( 
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	nombre varchar(100) NOT NULL,
	numero INT NOT NULL,
	ciudad varchar(100) not null
);

INSERT INTO direcciones
(nombre, numero,ciudad) 
VALUES 
("Arica",161,"Santiago")
,("Monte aconcagua",34,"Santiago")
;

-- agregando direcciones_id a tablas
ALTER TABLE administrativos 
ADD direcciones_id INT;

ALTER TABLE directivos 
ADD direcciones_id INT; 

ALTER TABLE estudiantes  
ADD direcciones_id INT; 


ALTER TABLE profesores  
ADD direcciones_id INT; 


ALTER TABLE tecnicos  
ADD direcciones_id INT; 


-- relacionando tablas
ALTER TABLE administrativos 
ADD FOREIGN KEY(direcciones_id) REFERENCES direcciones(id);

ALTER TABLE directivos  
ADD FOREIGN KEY(direcciones_id) REFERENCES direcciones(id);

ALTER TABLE estudiantes  
ADD FOREIGN KEY(direcciones_id) REFERENCES direcciones(id);

ALTER TABLE profesores  
ADD FOREIGN KEY(direcciones_id) REFERENCES direcciones(id);

ALTER TABLE tecnicos  
ADD FOREIGN KEY(direcciones_id) REFERENCES direcciones(id);

-- insercion de datos
UPDATE directivos SET direcciones_id= 1 WHERE id= 3;
UPDATE directivos SET direcciones_id= 2 WHERE id= 1;

