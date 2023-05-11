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

--------------------------------------------------
INSERT INTO TIPORECURSOFISICO (TIRE_IDTIPORECURSOFISICO, TIRE_NOMBRETIPORECURSOFISICO) 
VALUES 
(1, 'Sala'),
(2, 'Laboratorio'),
(3, 'Cancha'),
(4, 'Auditorio'),
(5, 'Salon');

INSERT INTO INVENTARIO (INVE_IDINVENTARIO, INVE_NOMBREINVENTARIO) 
VALUES 
(1, 'Inventario Sala 1'),
(2, 'Inventario Laboratorio de quimica'),
(3, 'Inventario Cancha'),
(4, 'Auditorio'),
(5, 'Inventario Laboratorio de fisica');

INSERT INTO ESTADOSOLICITUD (ESSO_IDESTADOSOLICITUD, ESSO_NOMBREESTADOSOLICITUD) 
VALUES 
(1, 'Aprobado'),
(2, 'En proceso'),
(3, 'Rechazado');

INSERT INTO RESCURSOFISICO (REFI_IDRESCURSOFISICO, REFI_NOMBRERESCURSOFISICO, REFI_CAPACIDADRECURSOFISICO, REFI_ESTADORECURSOFISICO, FK_TIRE_IDTIPORECURSOFISICO, FK_INVE_IDINVENTARIO)
VALUES 
(1, 'Sala de Sistemas 1', 30, 'Disponible', 1, 1),
(2, 'Sala de Sistemas 2', 30, 'Disponible', 1, 1),
(3, 'Laboratorio de Química', 20, 'Mantenimiento', 2, 2),
(4, 'Cancha de Fútbol', 22, 'Disponible', 3, 3),
(5, 'Auditorio', 200, 'Ocupado', 4, 4);

INSERT INTO SOLICITUD (SOLI_IDSOLICITUD, SOLI_FECHASOLICITUD, SOLI_FECHADEVOLUCION, SOLI_FECHAPRESTAMO, 
  SOLI_DESCRIPCION, ARCH_IDARCHIVOSOLICITUD, FK_ROUS_IDROLUSUARIO, FK_ESSO_IDESTADOSOLICITUD, FK_REFI_IDRESCURSOFISICO, INVENTARIO_INVE_IDINVENTARIO
) 
VALUES 
(1, '2023-05-10', '2023-05-15', '2023-05-11', 'Solicitud de préstamo de una sala de sistemas para realizar una práctic de programación', NULL, 2, 1, 3, 1),
(2, '2023-05-12', '2023-05-18', '2023-05-13', 'Solicitud de préstamo de un laboratorio para realizar una práctica de química', NULL, 3, 2, 2, 2),
(3, '2023-05-15', NULL, '2023-05-16', 'Solicitud de préstamo de una cancha para realizar un partido de fútbol', NULL, 4, 3, 1, 3),
(4, '2023-05-17', NULL, '2023-05-18', 'Solicitud de préstamo de un laboratorio para realizar una práctica de biología', NULL, 2, 3, 2, 4),
(5, '2023-05-20', '2023-05-22', '2023-05-21', 'Solicitud de préstamo de una sala de sistemas para realizar una presentación de proyecto', NULL, 1, 1, 3, 1);

INSERT INTO GRUPOCURSO (GRCU_IDGRUPOCURSO, GRCU_NOMBREGRUPOCURSO, GRCU_DOCENTEGRUPOCURSO, GRDO_CANTIDADESTUDIANTES, FK_REFI_IDRESCURSOFISICO) 
VALUES 
(1, 'Grupo 1', 'Docente 1', 30, 2),
(2, 'Grupo 2', 'Docente 2', 25, 3),
(3, 'Grupo 3', 'Docente 3', 20, 4),
(4, 'Grupo 4', 'Docente 4', 15, 5),
(5, 'Grupo 5', 'Docente 5', 10, 1);

INSERT INTO DETALLEELEMENTO (DEEL_IDDETALLEELEMENTO, DEEL_FECHAREGISTRO, DEEL_DESCRIPCION) VALUES 
(1, '2023-05-09', 'Detalle 1'),
(2, '2023-05-07', 'Detalle 2'),
(3, '2023-05-06', 'Detalle 3'),
(4, '2023-05-08', 'Detalle 4'),
(5, '2023-05-05', 'Detalle 5');


INSERT INTO ELEMENTOS (ELEM_IDELEMENTO, ELEM_NOMBREELEMENTO, ELEM_MARCA, ELEM_ESTADO, FK_DEEL_IDDETALLEELEMENTO)
VALUES 
  (1, 'Microscopio', 'Zeiss', 'Bueno', 1),
  (2, 'Balón de fútbol', 'Nike', 'Regular', 2),
  (3, 'Bata de laboratorio', 'Labtex', 'Bueno', 3),
  (4, 'Gafas de seguridad', '3M', 'Excelente', 4),
  (5, 'Banco óptico', 'Olympus', 'Malo', 5);


INSERT INTO PRESTAMO (PRES_IDPRESTAMO, PRES_FECHAPRESTAMO, PRES_FECHADEVOLUCION, ESTADO, FK_USUR_IDUSUARIO, FK_PROD_IDPRODUCTO) VALUES
(1, '2023-05-09 10:00:00', '2023-05-09 18:00:00', 'EN PRÉSTAMO', 1, 1),
(2, '2023-05-09 14:00:00', '2023-05-09 20:00:00', 'EN PRÉSTAMO', 2, 2),
(3, '2023-05-10 09:00:00', '2023-05-10 16:00:00', 'EN PRÉSTAMO', 3, 3),
(4, '2023-05-10 12:00:00', '2023-05-10 20:00:00', 'EN PRÉSTAMO', 4, 4),
(5, '2023-05-11 10:00:00', '2023-05-11 18:00:00', 'EN INVENTARIO', 5, 5);

INSERT INTO CATEGORIA (CATE_IDCATEGORIA, CATE_NOMBRECATEGORIA, FK_ELEM_IDELEMENTO, FK_INVE_IDINVENTARIO)
VALUES (1, 'Química', 1, 1),
       (2, 'Física', 2, 2),
       (3, 'Biología', 3, 3),
       (4, 'Deporte',4 ,4),
       (5, 'Tecnología',5 ,5);

