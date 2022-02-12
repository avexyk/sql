SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER //

CREATE FUNCTION obtener_paginas()
RETURNS INT
BEGIN
	SET @paginas = (SELECT (ROUND( RAND() * 100) * 4));
	RETURN @paginas;
END //

DELIMITER ;

UPDATE libros SET paginas = obtener_paginas();