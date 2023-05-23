const reservasRouter = require("express").Router();

reservasRouter.post("/", (req, res) => {
  const mysqlConnection = require("../../database");

  const {id} = req.body;

  const query = `
    SELECT 
        SOLICITUD.SOLI_FECHAPRESTAMO,
        SOLICITUD.SOLI_FECHADEVOLUCION,
        SOLICITUD.SOLI_DESCRIPCION,
        ESTADOSOLICITUD.ESSO_NOMBREESTADOSOLICITUD,
        RESCURSOFISICO.REFI_IDRESCURSOFISICO
    FROM
        SOLICITUD
    INNER JOIN 
        ESTADOSOLICITUD ON SOLICITUD.FK_ESSO_IDESTADOSOLICITUD = ESTADOSOLICITUD.ESSO_IDESTADOSOLICITUD
    INNER JOIN 
        RESCURSOFISICO ON SOLICITUD.FK_REFI_IDRESCURSOFISICO = RESCURSOFISICO.REFI_IDRESCURSOFISICO
    WHERE 
        ESTADOSOLICITUD.ESSO_NOMBREESTADOSOLICITUD = "Aprobado"
    AND 
        RESCURSOFISICO.REFI_IDRESCURSOFISICO = ?
    ORDER BY SOLICITUD.SOLI_FECHAPRESTAMO ASC;`;

  mysqlConnection.query(query, [id], (err, rows, fields) => {
    if (!err) {
      if (rows.length !== 0) {
        res.json( rows );
      } else {
        res.status(404).json({ msg: "Sin Reservas" });
      }
    } else {
      res.status(500).json({ msg: "Error de servidor" });
    }
  });
});

module.exports = reservasRouter;
