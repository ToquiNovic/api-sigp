const express = require("express");
const loginRoute = require("express").Router();

const mysqlConnection = require("../database");

loginRoute.get("/login", (req, res) => {
  mysqlConnection.query("SELECT * FROM USUARIO", (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

loginRoute.get("/usuarios/nickname/:nickname/:password", (req, res) => {
  const { nickname, password } = req.params;
  const query =
    "SELECT * FROM USUARIO WHERE USUR_NICKNAME= ? AND USUR_PASSWORD = ?";
  mysqlConnection.query(query, [nickname, password], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

loginRoute.post("/login", (req, res) => {
  const { nickname, password } = req.body;
  const query =
    "SELECT * FROM usuarios WHERE USUR_NICKNAME = ? AND USUR_PASSWORD = ?";

  // Realiza la consulta a la base de datos
  connection.query(query, [nickname, password], (error, results, fields) => {
    if (error) {
      console.error("Error al realizar la consulta:", error);
      return res.status(500).json({ error: "Error interno del servidor" });
    }

    // Si no se encontraron resultados, el usuario no existe o la contraseña es incorrecta
    if (results.length === 0) {
      return res
        .status(401)
        .json({ error: "Usuario o contraseña incorrectos" });
    }

    // Si se encontró un resultado, el usuario existe y la contraseña es correcta
    const usuario = results[0];
    const { nickname, password } = usuario;
    return res.status(200).json({ nickname, password });
  });
});

module.exports = loginRoute;
