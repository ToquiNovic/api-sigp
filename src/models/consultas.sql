-- forgetuser
SELECT
    USUR_NICKNAME
FROM
    PERSONA
    INNER JOIN USUARIO ON USUARIO.USUR_ID_USUARIO = PERSONA.USUR_ID_USUARIO
WHERE
    PERS_DNI = 1006458608;


--login
SELECT USUARIO.USUR_NICKNAME, ROL.ROLL_NOMBREROL 
FROM USUARIO 
INNER JOIN ROLUSUARIO ON USUARIO.USUR_ID_USUARIO = ROLUSUARIO.USUR_ID_USUARIO 
INNER JOIN ROL ON ROLUSUARIO.ROLL_ID_ROL = ROL.ROLL_ID_ROL 
WHERE USUARIO.USUR_NICKNAME = 'j.toquica' AND USUARIO.USUR_PASSWORD = '12345';


SELECT PERS_NOMBRE1, PERS_NOMBRE2, PERS_APELLIDO1, PERS_APELLIDO2, PERS_CORREO, USUR_PASSWORD
FROM PERSONA
INNER JOIN USUARIO ON PERSONA.USUR_ID_USUARIO = USUARIO.USUR_ID_USUARIO
WHERE USUR_NICKNAME = 'j.toquica';


INSERT INTO PERSONA (
    PERS_ID_PERSONA, 
    PERS_DNI,
    PERS_NOMBRE1, 
    PERS_NOMBRE2, 
    PERS_APELLIDO1, 
    PERS_APELLIDO2, 
    PERS_GENERO, 
    PERS_CORREO, 
    USUR_ID_USUARIO, 
    TIID_ID_TIPOID)  
VALUES (8, 123458799, 'Maria', 'Josefa', 'Rodriguez', 'Perez', 'Femenino', 'maria.rodriguez@example.com', 7, 1);

INSERT INTO PERSONA (PERS_ID_PERSONA, PERS_DNI, PERS_NOMBRE1, PERS_NOMBRE2, PERS_APELLIDO1, PERS_APELLIDO2, PERS_GENERO, PERS_CORREO, USUR_ID_USUARIO, TIID_ID_TIPOID)
VALUES (6, 1, 'valor_PERS_NOMBRE1', 'valor_PERS_NOMBRE2', 'valor_PERS_APELLIDO1', 'valor_PERS_APELLIDO2', 'valor_PERS_GENERO', 'valor_PERS_CORREO', 6, 1);

SELECT * FROM PERSONA WHERE PERS_DNI = 1006458608;
SELECT MAX(PERS_ID_PERSONA) AS lastID FROM PERSONA

SELECT REFI_NOMBRERESCURSOFISICO, REFI_CAPACIDADRECURSOFISICO, REFI_ESTADORECURSOFISICO, TIRE_NOMBRETIPORECURSOFISICO 
FROM RESCURSOFISICO
INNER JOIN TIPORECURSOFISICO ON RESCURSOFISICO.FK_TIRE_IDTIPORECURSOFISICO = TIPORECURSOFISICO.TIRE_IDTIPORECURSOFISICO;


SELECT 
    REFI_IDRESCURSOFISICO,
    REFI_NOMBRERESCURSOFISICO, REFI_CAPACIDADRECURSOFISICO, REFI_ESTADORECURSOFISICO, TIRE_NOMBRETIPORECURSOFISICO 
    FROM 
    RESCURSOFISICO
    INNER JOIN 
    TIPORECURSOFISICO ON RESCURSOFISICO.FK_TIRE_IDTIPORECURSOFISICO = TIPORECURSOFISICO.TIRE_IDTIPORECURSOFISICO
    WHERE REFI_NOMBRERESCURSOFISICO LIKE '%Sala%';








