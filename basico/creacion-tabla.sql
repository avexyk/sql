/*
Tipo de entidades: Autores

- Nombre, Genero, Fecha de nacimiento, País de origen
- Columna y el tipo de dato

nombre VARCHAR(50);
genero CHAR(1);
fecha_nacimiento DATE;
pais_origen VARCHAR(40);

- Normalización (Evitar datos repetidos y columnas compuestas)

autor_id INT
nombre VARCHAR(25);
apellido VARCHAR(25);
genero CHAR(1);
fecha_nacimiento DATE;
pais_origen VARCHAR(40);


*/

CREATE TABLE autores(
	autor_id INT,
	nombre VARCHAR(25),
	apellido VARCHAR(25),
	genero CHAR(1),
	fecha_nacimiento DATE,
	pais_origen VARCHAR(40)
);