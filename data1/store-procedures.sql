-- Inserta un registro en la tabla libros_usuarios y resta 1 del
-- la columna stock en la tabla libros

DELIMITER //

CREATE PROCEDURE prestamos(usuario_id INT, libro_id INT)
BEGIN
	INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id, usuario_id);
	UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;


END //

DELIMITER ;

SHOW PROCEDURE STATUS WHERE db = 'libreria';

CALL prestamos(2, 4);