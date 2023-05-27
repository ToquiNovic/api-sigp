CREATE TABLE CANTIDAD  (
   CANT_IDCANTIDAD  int(11) NOT NULL,
   CANT_NOMBRECATEGORIA  varchar(45) NOT NULL,
   FK_ELEM_IDELEMENTO  int(11) NOT NULL,
   FK_INVE_IDINVENTARIO  int(11) NOT NULL
);

CREATE TABLE  DETALLEELEMENTO  (
   DEEL_IDDETALLEELEMENTO  int(11) NOT NULL,
   DEEL_FECHAREGISTRO  varchar(45) NOT NULL,
   DEEL_DESCRIPCION  varchar(45) NOT NULL,
   DEEL_IMAGEN  int(11) NOT NULL
);

CREATE TABLE  ELEMENTOS  (
   ELEM_IDELEMENTO  int(11) NOT NULL,
   ELEM_NOMBREELEMENTO  varchar(45) NOT NULL,
   ELEM_MARCA  varchar(45) NOT NULL,
   ELEM_ESTADO  varchar(45) NOT NULL,
   FK_DEEL_IDDETALLEELEMENTO  int(11) NOT NULL,
   FK_CANT_IDCANTIDAD int(11) NOT NULL
);

CREATE TABLE  ESTADOSOLICITUD  (
   ESSO_IDESTADOSOLICITUD  int(11) NOT NULL,
   ESSO_NOMBREESTADOSOLICITUD  varchar(45) NOT NULL
);

CREATE TABLE GRUPOCURSO  (
   GRCU_IDGRUPOCURSO  int(11) NOT NULL,
   GRCU_NOMBREGRUPOCURSO  varchar(45) NOT NULL,
   GRCU_DOCENTEGRUPOCURSO  varchar(45) NOT NULL,
   GRDO_CANTIDADESTUDIANTES  int(11) NOT NULL,
   FK_REFI_IDRESCURSOFISICO  int(11) NOT NULL
);

CREATE TABLE INVENTARIO  (
   INVE_IDINVENTARIO  int(11) NOT NULL,
   INVE_NOMBREINVENTARIO  varchar(45) NOT NULL
);

CREATE TABLE  PERSONA  (
   PERS_ID_PERSONA int(11) NOT NULL,
   PERS_DNI int(11) NOT NULL,
   PERS_NOMBRE1 varchar(50) NOT NULL,
   PERS_NOMBRE2 varchar(50) DEFAULT NULL,
   PERS_APELLIDO1 varchar(60) NOT NULL,
   PERS_APELLIDO2 varchar(60) DEFAULT NULL,
   PERS_GENERO varchar(20) NOT NULL,
   PERS_CORREO varchar(150) NOT NULL,
   USUR_ID_USUARIO int(11) NOT NULL,
   TIID_ID_TIPOID int(11) NOT NULL
);

CREATE TABLE  RESCURSOFISICO  (
   REFI_IDRESCURSOFISICO  int(11) NOT NULL,
   REFI_NOMBRERESCURSOFISICO  varchar(45) NOT NULL,
   REFI_CAPACIDADRECURSOFISICO  int(11) NOT NULL,
   REFI_ESTADORECURSOFISICO  varchar(45) NOT NULL,
   FK_TIRE_IDTIPORECURSOFISICO  int(11) NOT NULL,
   FK_INVE_IDINVENTARIO  int(11) NOT NULL,
   IDFOTO_RECURSOFISICO  int(11) DEFAULT NULL
);

CREATE TABLE  ROL  (
   ROLL_ID_ROL  int(11) NOT NULL,
   ROLL_NOMBREROL  varchar(50) NOT NULL
);

CREATE TABLE  ROLUSUARIO  (
   ROUS_IDROLUSURARIO  int(11) NOT NULL,
   ROLL_ID_ROL  int(11) NOT NULL,
   USUR_ID_USUARIO  int(11) NOT NULL,
   ROUS_ESTADO  varchar(15) NOT NULL
);

CREATE TABLE  SOLICITUD  (
   SOLI_IDSOLICITUD  int(11) NOT NULL,
   SOLI_ESTADOSOLICITUD  varchar(45) NOT NULL,
   SOLI_FECHASOLICITUD  datetime NOT NULL,
   SOLI_FECHADEVOLUCION  datetime NOT NULL,
   SOLI_FECHAPRESTAMO  datetime NOT NULL,
   SOLI_DESCRIPCION  varchar(45) DEFAULT NULL,
   ARCH_IDFIRMASOLICITUD  int(10) DEFAULT NULL,
   FK_ROUS_IDROLUSUARIO  int(11) NOT NULL,
   FK_ESSO_IDESTADOSOLICITUD  int(11) NOT NULL,
   FK_REFI_IDRESCURSOFISICO  int(11),
   FK_INVE_IDINVENTARIO  int(11)
);

CREATE TABLE  TIPOIDENTIFICACION  (
   TIID_ID_TIPOID  int(11) NOT NULL,
   TIID_NOMBRE_TIPOID  varchar(50) NOT NULL
);

CREATE TABLE  TIPORECURSOFISICO  (
   TIRE_IDTIPORECURSOFISICO  int(11) NOT NULL,
   TIRE_NOMBRETIPORECURSOFISICO  varchar(45) NOT NULL
);

CREATE TABLE  USUARIO  (
   USUR_ID_USUARIO  int(11) NOT NULL,
   USUR_NICKNAME  varchar(100) NOT NULL,
   USUR_PASSWORD  varchar(100) NOT NULL,
   FOTO_IDFOTO  int(11) DEFAULT NULL
);

-- PRIMARY KEY
ALTER TABLE  CANTIDAD 
  ADD PRIMARY KEY ( CANT_IDCANTIDAD );

ALTER TABLE  DETALLEELEMENTO 
  ADD PRIMARY KEY ( DEEL_IDDETALLEELEMENTO );

ALTER TABLE  ELEMENTOS 
  ADD PRIMARY KEY ( ELEM_IDELEMENTO );

ALTER TABLE  ESTADOSOLICITUD 
  ADD PRIMARY KEY ( ESSO_IDESTADOSOLICITUD );

ALTER TABLE  GRUPOCURSO 
  ADD PRIMARY KEY ( GRCU_IDGRUPOCURSO );

ALTER TABLE  INVENTARIO 
  ADD PRIMARY KEY ( INVE_IDINVENTARIO );

ALTER TABLE  PERSONA 
  ADD PRIMARY KEY ( PERS_ID_PERSONA );

ALTER TABLE  RESCURSOFISICO 
  ADD PRIMARY KEY ( REFI_IDRESCURSOFISICO );

ALTER TABLE  ROL 
  ADD PRIMARY KEY ( ROLL_ID_ROL );

ALTER TABLE  ROLUSUARIO 
  ADD PRIMARY KEY ( ROUS_IDROLUSURARIO );

ALTER TABLE  SOLICITUD 
  ADD PRIMARY KEY ( SOLI_IDSOLICITUD );

ALTER TABLE  TIPOIDENTIFICACION 
  ADD PRIMARY KEY ( TIID_ID_TIPOID );

ALTER TABLE  TIPORECURSOFISICO 
  ADD PRIMARY KEY ( TIRE_IDTIPORECURSOFISICO );

ALTER TABLE  USUARIO 
  ADD PRIMARY KEY ( USUR_ID_USUARIO );

-- FOREIGN KEY
ALTER TABLE  CANTIDAD 
  ADD CONSTRAINT  fk_id_elementocateg  FOREIGN KEY ( FK_ELEM_IDELEMENTO ) REFERENCES  ELEMENTOS  ( ELEM_IDELEMENTO ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT  fk_id_inventariocat  FOREIGN KEY ( FK_INVE_IDINVENTARIO ) REFERENCES  INVENTARIO  ( INVE_IDINVENTARIO ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE  ELEMENTOS 
  ADD CONSTRAINT  fk_id_ielementos  FOREIGN KEY ( FK_DEEL_IDDETALLEELEMENTO ) REFERENCES  DETALLEELEMENTO  ( DEEL_IDDETALLEELEMENTO ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE  GRUPOCURSO 
  ADD CONSTRAINT  fk_RECURSO  FOREIGN KEY ( FK_REFI_IDRESCURSOFISICO ) REFERENCES  RESCURSOFISICO  ( REFI_IDRESCURSOFISICO ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE  PERSONA 
  ADD CONSTRAINT  fk_USUR_ID_USUARIO  FOREIGN KEY ( USUR_ID_USUARIO ) REFERENCES  USUARIO  ( USUR_ID_USUARIO ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT  fk_tipoid  FOREIGN KEY ( TIID_ID_TIPOID ) REFERENCES  TIPOIDENTIFICACION  ( TIID_ID_TIPOID ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE  RESCURSOFISICO 
  ADD CONSTRAINT  fk_inventariores  FOREIGN KEY ( FK_INVE_IDINVENTARIO ) REFERENCES  INVENTARIO  ( INVE_IDINVENTARIO ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT  fk_tiporecursorecur  FOREIGN KEY ( FK_TIRE_IDTIPORECURSOFISICO ) REFERENCES  TIPORECURSOFISICO  ( TIRE_IDTIPORECURSOFISICO ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE  ROLUSUARIO 
  ADD CONSTRAINT  fk_rol  FOREIGN KEY ( ROLL_ID_ROL ) REFERENCES  ROL  ( ROLL_ID_ROL ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT  fk_usuario  FOREIGN KEY ( USUR_ID_USUARIO ) REFERENCES  USUARIO  ( USUR_ID_USUARIO ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE  SOLICITUD 
  ADD CONSTRAINT  FK_ESSO_IDESTADOSOLICITUD  FOREIGN KEY ( FK_ESSO_IDESTADOSOLICITUD ) REFERENCES  ESTADOSOLICITUD  ( ESSO_IDESTADOSOLICITUD ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT  FK_REFI_IDRESCURSOFISICO  FOREIGN KEY ( FK_REFI_IDRESCURSOFISICO ) REFERENCES  RESCURSOFISICO  ( REFI_IDRESCURSOFISICO ) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT  INVENTARIO_INVE_IDINVENTARIO  FOREIGN KEY ( FK_INVE_IDINVENTARIO ) REFERENCES  INVENTARIO  ( INVE_IDINVENTARIO ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE SOLICITUD 
ADD CONSTRAINT FK_ROUS_IDROLUSUARIO 
FOREIGN KEY (FK_ROUS_IDROLUSUARIO) 
REFERENCES ROLUSUARIO (ROUS_IDROLUSURARIO) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

