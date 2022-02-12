
DROP DATABASE IF EXISTS libreria;

CREATE DATABASE IF NOT EXISTS libreria;

USE libreria;

CREATE TABLE IF NOT EXISTS autores(
	autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(25) NOT NULL,
	apellido VARCHAR(25) NOT NULL,
	seudonimo VARCHAR(50) UNIQUE,
	-- genero CHAR(1) NOT NULL,
	genero ENUM('M', 'F'),
	fecha_nacimiento DATE NOT NULL,
	pais_origen VARCHAR(40) NOT NULL,
	fecha_creacion DATETIME DEFAULT current_timestamp
);

ALTER TABLE autores ADD COLUMN cantidad_libros INT DEFAULT 0;

CREATE TABLE libros(
	libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	autor_id INT UNSIGNED NOT NULL,
	titulo VARCHAR(50) NOT NULL,
	descripcion VARCHAR(250),
	paginas INTEGER UNSIGNED,
	fecha_publicacion DATE NOT NULL,
	fecha_creacion DATETIME DEFAULT current_timestamp,
	FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

CREATE TABLE usuarios(
	usuario_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(25) NOT NULL,
	apellidos VARCHAR(25),
	username VARCHAR(25) NOT NULL,
	email VARCHAR(50) NOT NULL,
	fecha_creacion DATETIME DEFAULT current_timestamp
);

ALTER TABLE libros ADD ventas INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE libros ADD stock INT UNSIGNED DEFAULT 10;

CREATE TABLE libros_usuarios(
	libro_id INT UNSIGNED NOT NULL,
	usuario_id INT UNSIGNED NOT NULL,

	FOREIGN KEY (libro_id) REFERENCES libros(libro_id),
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
	fecha_creacion DATETIME DEFAULT current_timestamp
);

INSERT INTO autores (nombre, apellido, seudonimo, genero, fecha_nacimiento, pais_origen)
VALUES ('Stephen', 'King', 'Soul', 'M', '2020-04-08', 'USA'),
			 ('Linus', 'Tolvards', 'Tux', 'M', '2020-04-08', 'USA'),
			 ('Richard', 'Stallman', 'Guru', 'M', '2020-04-08', 'USA');

INSERT INTO libros(autor_id, titulo, fecha_publicacion)
VALUES (1, 'Dark Tower', '1975-01-01'),
			 (1, 'Niebla', '1980-02-02'),
			 (2, 'Code Linux', '2000-03-03'),
			 (3, 'GNU', '2000-05-10');

INSERT INTO usuarios (nombre, apellidos, username, email)
VALUES ('Francisco', 'Javier', 'avexyk', 'avexyk@avexyk.com'),
			 ('Yuri', 'Zahard', 'yuri', 'yuri@gmail.com');

INSERT INTO libros_usuarios(libro_id, usuario_id)
VALUES (1, 1), (2, 1), (3, 1),
			 (1, 2), (2, 2), (4, 2);

SELECT * FROM autores;
SELECT * FROM libros;
SELECT * FROM usuarios;
SELECT * FROM libros_usuarios;