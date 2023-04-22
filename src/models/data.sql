INSERT INTO
    ROL (ROLL_ID_ROL, ROLL_NOMBREROL)
VALUES
    (1, 'ESTUDIANTE'),
    (2, 'ADMINISTRATIVO'),
    (3, 'DOCENTE'),
    (4, 'EGRESADO'),
    (5, 'ENCARGADO'),
    (6, 'AUXILIAR');

INSERT INTO
    PERSONA (
        PERS_ID_PERSONA,
        PERS_DNI,
        PERS_NOMBRE1,
        PERS_NOMBRE2,
        PERS_APELLIDO1,
        PERS_APELLIDO2,
        PERS_GENERO,
        PERS_CORREO,
        USUR_ID_USUARIO,
        TIID_ID_TIPOID
    )
VALUES
    (
        1,
        1006458608,
        'JOSE',
        'DANIEL',
        'TOQUICA',
        'AGUDELO',
        '',
        'J.TOQUICA@UDLA.EDU.CO',
        1,
        1
    ),
    (
        2,
        1117552739,
        'YERSON',
        'ARLEY',
        'CENON',
        'CABRERA',
        '',
        'y.cenon@udla.edu.co',
        2,
        1
    ),
    (
        3,
        1117531976,
        'DAIRO',
        NULL,
        'GARCIA',
        NULL,
        '',
        '',
        3,
        1
    ),
    (
        4,
        1003480546,
        'ANGIE',
        'ALEXANDRA',
        'ORTIZ',
        'PALACIOS',
        '',
        'angie.ortiz@udla.edu.co',
        4,
        1
    ),
    (
        5,
        0,
        'FALCAO',
        NULL,
        'GARCIA',
        NULL,
        '',
        '',
        5,
        1
    );

INSERT INTO
    USUARIO (
        USUR_ID_USUARIO,
        USUR_NICKNAME,
        USUR_PASSWORD,
        FOTO_IDFOTO
    )
VALUES
    (1, 'J.TOQUICA', '12345', 0),
    (2, 'Y.CENON', '12345', 0),
    (3, 'J.CHINGAL', '12345', 0),
    (4, 'A.ORTIZ', '12345', 0),
    (5, 'F.GARCIA', '12345', 0);

INSERT INTO
    ROLUSUARIO (
        ROUS_IDROLUSURARIO,
        ROLL_ID_ROL,
        USUR_ID_USUARIO,
        ROUS_ESTADO
    )
VALUES
    (1, 1, 1, "ACTIVO"),
    (2, 2, 2, "ACTIVO"),
    (3, 3, 3, "ACTIVO"),
    (4, 4, 4, "ACTIVO"),
    (5, 5, 5, "INACTIVO");

INSERT INTO
    TIPOIDENTIFICACION (TIID_ID_TIPOID, TIID_NOMBRE_TIPOID)
VALUES
    (1, 'Cédula de Ciudadanía'),
    (2, 'Tarjeta de Identidad'),
    (3, 'Cédula de Extranjería'),
    (4, 'Registro Civil');