DELIMITER //
CREATE TRIGGER tr_crear_usuario BEFORE INSERT ON PERSONA
FOR EACH ROW
BEGIN
    DECLARE nickname VARCHAR(100);
    DECLARE max_id INT;
    DECLARE existing_nickname VARCHAR(100);
    DECLARE nombre1 VARCHAR(100);
    DECLARE nombre2 VARCHAR(100);
    DECLARE apellido1 VARCHAR(100);
    DECLARE apellido2 VARCHAR(100);
    DECLARE dni INT;

    SELECT MAX(USUR_ID_USUARIO) INTO max_id FROM USUARIO;

    SET nombre1 = NEW.PERS_NOMBRE1;
    SET nombre2 = NEW.PERS_NOMBRE2;
    SET apellido1 = NEW.PERS_APELLIDO1;
    SET apellido2 = NEW.PERS_APELLIDO2;
    SET dni = NEW.PERS_DNI;

    SET nickname = UPPER(CONCAT_WS('.', LEFT(nombre1, 1), apellido1));

SELECT COUNT(*) INTO existing_nickname
FROM PERSONA
WHERE PERS_NOMBRE1 = nombre1
    AND PERS_NOMBRE2 = nombre2
    AND PERS_APELLIDO1 = apellido1
    AND PERS_APELLIDO2 = apellido2;


    IF existing_nickname IS NOT NULL THEN

        SET nickname = UPPER(CONCAT_WS('.', LEFT(nombre1, + (existing_nickname + 1)), apellido1));

    END IF;


    INSERT INTO USUARIO (USUR_ID_USUARIO, USUR_NICKNAME, USUR_PASSWORD) VALUES (max_id + 1, nickname, dni);

    SET NEW.USUR_ID_USUARIO = max_id + 1;

END//
DELIMITER ;




