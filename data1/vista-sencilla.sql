-- Conocer todos los usuarios que han prestado libros la ultima semana y la cantidad
-- Antes de generar la vista se genera la consulta

CREATE OR REPLACE VIEW prestamos_usuarios_view AS

SELECT
	usuarios.usuario_id,
	usuarios.nombre,
	usuarios.email,
	usuarios.username,
	COUNT(usuarios.usuario_id) AS total_prestamos
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
	AND libros_usuarios.fecha_creacion >= CURDATE() -INTERVAL 5 DAY
GROUP BY usuarios.usuario_id;