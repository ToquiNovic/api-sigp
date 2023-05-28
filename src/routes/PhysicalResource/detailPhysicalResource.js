const detailPRRopouter = require("express").Router();

detailPRRopouter.post("/", (req, res) => {
  const mysqlConnection = require("../../database");

  const { id } = req.body;

  const query = `
    SELECT 
      RESCURSOFISICO.REFI_IDRESCURSOFISICO,
      RESCURSOFISICO.REFI_NOMBRERESCURSOFISICO, 
      RESCURSOFISICO.REFI_CAPACIDADRECURSOFISICO, 
      RESCURSOFISICOREFI_ESTADORECURSOFISICO, 
      TIPORECURSOFISICO.TIRE_NOMBRETIPORECURSOFISICO, 
      INVENTARIO.INVE_NOMBREINVENTARIO 
    FROM 
     RESCURSOFISICO
    INNER JOIN 
      TIPORECURSOFISICO ON RESCURSOFISICO.FK_TIRE_IDTIPORECURSOFISICO = TIPORECURSOFISICO.TIRE_IDTIPORECURSOFISICO
    INNER JOIN
        INVENTARIO ON RESCURSOFISICO.FK_INVE_IDINVENTARIO = INVENTARIO.INVE_IDINVENTARIO
    WHERE 
        RESCURSOFISICO.REFI_IDRESCURSOFISICO = ?;`;

  mysqlConnection.query(query, [id], (err, rows, fields) => {
    if (err) {
      console.error(err);
      res.status(500).json({ msg: "Error al ejecutar la consulta" });
    } else {
      res.status(200).json(rows);
    }
  });
});

module.exports = detailPRRopouter;
