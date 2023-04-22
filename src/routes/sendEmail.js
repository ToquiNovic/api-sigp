const routerSendEmail = require("express").Router();
const nodemailer = require("nodemailer");
const { ACOUNT } = require("../config");

routerSendEmail.post("/recoverpassword", (req, res) => {
  const { nickName } = req.body;
  const mysqlConnection = require("../database");

  const query = `
  SELECT 
    PERS_NOMBRE1, PERS_NOMBRE2, PERS_APELLIDO1, PERS_APELLIDO2, PERS_CORREO, USUR_PASSWORD
  FROM 
    PERSONA
    LEFT JOIN USUARIO ON PERSONA.USUR_ID_USUARIO = USUARIO.USUR_ID_USUARIO
  WHERE 
    USUR_NICKNAME = ?;`;

  mysqlConnection.query(query, [nickName], async (err, rows, fields) => {
    if (!err) {
      console.log(nickName);
      console.log(rows);
      if (rows.length !== 0) {
        const transporter = nodemailer.createTransport({
          host: "smtp.gmail.com",
          port: 587,
          secure: false,
          auth: {
            user: ACOUNT.USER_EMAIL,
            pass: ACOUNT.PASS,
          },
        });

        await transporter.sendMail({
          from: ACOUNT.USER,
          to: rows[0].PERS_CORREO,
          subject: "Contraseña",
          text: `la contraseña de su usuario ${nickName} es: ${rows[0].USUR_PASSWORD}`,
        });

        res.json({
          msg: "Contraseña enviada al Correo: " + rows[0].PERS_CORREO,
        });
      } else {
        res.status(404).json({ msg: "Usuario no encontrado" });
      }
    } else {
      res.status(500).json({ msg: "Error de servidor" });
    }
  });
});

module.exports = routerSendEmail;
