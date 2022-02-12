-- Que consultas se quieren ejecutar

START TRANSACTION;

SET @libro_id = 4, @usuario_id = 2;

UPDATE libros SET stock = stock - 1 WHERE libro_id = @libro_id;
SELECT stock FROM libros WHERE libro_id = @libro_id;

INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(@libro_id, @usuario_id);
SELECT * FROM libros_usuarios;

-- Mantiene los cambios
COMMIT;

-- Regresa a un estado donde la transaccion no iniciaba
ROLLBACK;