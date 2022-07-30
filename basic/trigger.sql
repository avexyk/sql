-- NEW: Registro actual que se ha insertado

DELIMITER //

CREATE TRIGGER after_insert_actualizacion_libros
AFTER INSERT ON libros
FOR EACH ROW
BEGIN
	UPDATE autores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
END;
//

DELIMITER ;

-- Evento DELETE
-- OLD: Registro que se a eliminado

DELIMITER //

CREATE TRIGGER after_delete_actualizacion_libros
AFTER DELETE ON libros
FOR EACH ROW
BEGIN
	UPDATE autores SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
END;
//

DELIMITER ;

-- Evento Update

DELIMITER //

CREATE TRIGGER after_update_actualizacion_libros
AFTER UPDATE ON libros
FOR EACH ROW
BEGIN
	IF(NEW.autor_id != OLD.autor_id) THEN
		UPDATE autores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
		UPDATE autores SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
	END IF;
END;
//

DELIMITER ;