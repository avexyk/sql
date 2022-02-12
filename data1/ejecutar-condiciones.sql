
DROP DATABASE IF EXISTS libreria;

CREATE DATABASE IF NOT EXISTS libreria;

USE libreria;

CREATE TABLE IF NOT EXISTS autores(
	autor_id INT,
	nombre VARCHAR(25),
	apellido VARCHAR(25),
	genero CHAR(1),
	fecha_nacimiento DATE,
	pais_origen VARCHAR(40)
);

INSERT INTO autores (autor_id, nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES (1, 'Stephen', 'King', 'M', '2020-04-08', 'USA'),
			 (2, 'Stephen', 'King', 'M', '2020-04-08', 'USA'),
			 (3, 'Stephen', 'King', 'M', '2020-04-08', 'USA'),
			 (4, 'Stephen', 'King', 'M', '2020-04-08', 'USA'),
			 (5, 'Stephen', 'King', 'M', '2020-04-08', 'USA');

SELECT * FROM autores;