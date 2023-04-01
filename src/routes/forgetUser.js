const forgetRouter = require("express").Router();

forgetRouter.post("/", (req, res) => {
  const mysqlConnection = require("../database");
  const dni = req.body.dni;
  const query = `
  SELECT 
    USUR_NICKNAME 
  FROM 
    PERSONA 
    INNER JOIN USUARIO ON PERSONA.USUR_ID_USUARIO = USUARIO.USUR_ID_USUARIO 
  WHERE
    PERS_DNI = ? 
  LIMIT 1;`;

  mysqlConnection.query(query, [dni], (err, rows, fields) => {
    if (!err) {
      if (rows.length !== 0) {
        // const nickname = rows[0].USUR_NICKNAME;
        res.json({ ...rows[0] });
      } else {
        res.status(404).json({ msg: "Usuario no encontrado" });
      }
    } else {
      res.status(500).json({ msg: "Error de servidor"});
    }
  });
});

module.exports = forgetRouter;
