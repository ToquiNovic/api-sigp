const physicalresource = require("express").Router();

physicalresource.get("/", (req, res) => {
    const mysqlConnection = require("../../database");
  
    const query = `
      SELECT 
      REFI_IDRESCURSOFISICO,
      REFI_NOMBRERESCURSOFISICO, REFI_CAPACIDADRECURSOFISICO, REFI_ESTADORECURSOFISICO, TIRE_NOMBRETIPORECURSOFISICO 
      FROM 
      RESCURSOFISICO
      INNER JOIN 
      TIPORECURSOFISICO ON RESCURSOFISICO.FK_TIRE_IDTIPORECURSOFISICO = TIPORECURSOFISICO.TIRE_IDTIPORECURSOFISICO;`;
  
    mysqlConnection.query(query, (err, rows, fields) => {
      if (err) {
        console.error(err);
        res.status(500).json({ msg: "Error al ejecutar la consulta" });
      } else {
        res.status(200).json(rows);
      }
    });
  });
  
  module.exports = physicalresource;
  