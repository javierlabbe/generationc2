--Query para la insercion de un registro
INSERT INTO generationc2.estudiante (nombre,id,apellido) 
VALUES ('Zoe',6,'Loren');

--query para eliminar un registro
DELETE FROM generationc2.estudiante
	WHERE id=1 AND nombre='Jhon' AND apellido='Doe';