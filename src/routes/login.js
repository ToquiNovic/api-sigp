const loginRoute = require("express").Router();
const jwt = require("jsonwebtoken");
const { JWT_KEY } = require("../config");

loginRoute.post("/", (req, res) => {
  const mysqlConnection = require("../database");
  const { nickname, password } = req.body;
  const query = `
  SELECT
    USUARIO.USUR_NICKNAME,
    ROL.ROLL_NOMBREROL
  FROM
    USUARIO
    INNER JOIN ROL on USUARIO.ROLL_ID_ROL = ROL.ROLL_ID_ROL
  WHERE
    USUARIO.USUR_NICKNAME = ?
    AND USUARIO.USUR_PASSWORD = ?
  ORDER BY
    USUARIO.USUR_ID_USUARIO ASC;`;

  mysqlConnection.query(query, [nickname, password], (err, rows, fields) => {
    if (!err) {
      if (rows.length !== 0) {
        const data = {
          name: rows[0].USUR_NICKNAME,
          roles: rows.map(({ ROLL_NOMBREROL }) => ROLL_NOMBREROL),
        };
        jwt.sign(data, JWT_KEY, (err, token) => {
          if (err) {
            res.status(401).json({ msg: "Error en JWT" });
          } else {
            res.json({
              ...data,
              token,
            });
          }
        });
      } else {
        res.status(404).json({ msg: "Credenciales incorrectas!" });
      }
    } else {
      res.status(500).json({ msg: "Error en la base de datos!" });
    }
  });
});

module.exports = loginRoute;
