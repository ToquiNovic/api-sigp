DROP DATABASE if EXISTS proyecto_final;

CREATE DATABASE proyecto_final;

use proyecto_final;

CREATE TABLE PERSONA (
    PERS_ID_PERSONA INT NOT NULL,
    PERS_NOMBRE1 VARCHAR(50) NOT NULL,
    PERS_NOMBRE2 VARCHAR(50),
    PERS_APELLIDO1 VARCHAR(60) NOT NULL,
    PERS_APELLIDO2 VARCHAR(60),
    USUR_ID_USUARIO INT NOT NULL
);

CREATE Table USUARIO (
    USUR_ID_USUARIO INT NOT NULL,
    USUR_NICKNAME VARCHAR(100) NOT NULL,
    USUR_PASSWORD VARCHAR(100) NOT NULL,
    ROLL_ID_ROL INT NOT NULL
);

CREATE Table ROL (
    ROLL_ID_ROL INT NOT NULL,
    ROLL_NOMBREROL VARCHAR(50) NOT NULL 
);

CREATE Table PRUEBA (
    ID_PRUEBA INT NOT NULL
);

-- PRIMARY KEYS

ALTER Table PERSONA ADD CONSTRAINT pk_id_persona PRIMARY KEY (PERS_ID_PERSONA);
ALTER Table USUARIO ADD CONSTRAINT pk_id_usuario PRIMARY KEY (USUR_ID_USUARIO);
ALTER Table ROL ADD CONSTRAINT pk_id_rol PRIMARY KEY (ROLL_ID_ROL);

-- FOREIGN KEY

ALTER Table PERSONA ADD CONSTRAINT fk_USUR_ID_USUARIO FOREIGN KEY (USUR_ID_USUARIO) REFERENCES USUARIO (USUR_ID_USUARIO) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER Table USUARIO ADD CONSTRAINT fk_ROLL_ID_ROL FOREIGN KEY (ROLL_ID_ROL) REFERENCES ROL (ROLL_ID_ROL) ON DELETE NO ACTION ON UPDATE NO ACTION;

