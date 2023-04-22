const express = require("express");
const mysqlConnection = require("../database");

const signUpRouter = express.Router();

signUpRouter.post("/", (req, res) => {
  const {
    numerodni,
    nombre1,
    nombre2,
    apellido1,
    apellido2,
    genero,
    correo,
    tipodni,
  } = req.body;

  const getUserQuery = "SELECT * FROM PERSONA WHERE PERS_DNI = ?";
  mysqlConnection.query(getUserQuery, [numerodni], (error, results) => {
    if (!error) {
      if (results.length > 0) {
        res.status(409).json({ error: "El usuario ya existe" });
      } else {
        const getLastIDQuery = "SELECT MAX(PERS_ID_PERSONA) AS lastID FROM PERSONA";
        mysqlConnection.query(getLastIDQuery, (error, results) => {
          if (!error) {
            const lastID = results[0].lastID;
            const newID = lastID ? lastID + 1 : 1;
            const insertQuery = `
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
                TIID_ID_TIPOID
              ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `;
            const insertParams = [
              newID,
              numerodni,
              nombre1,
              nombre2,
              apellido1,
              apellido2,
              genero,
              correo,
              newID, 
              tipodni,
            ];
            mysqlConnection.query(insertQuery, insertParams, (error, results) => {
              if (!error) {
                res.json({ msg: "Usuario guardado" });
              } else {
                console.log(error);
                res.status(500).json({ msg: "Error en la Base da Datos" });
              }
            });
          } else {
            console.log(error);
            res.status(500).json({ msg: "Error de servidor 2" });
          }
        });
      }
    } else {
      console.log(error);
      res.status(500).json({ msg: "Error de servidor" });
    }
  });
});

module.exports = signUpRouter;
