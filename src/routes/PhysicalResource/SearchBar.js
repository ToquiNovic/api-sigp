const SearchBar = require("express").Router();
const mysqlConnection = require("../../database");

SearchBar.post("/", (req, res) => {

  const { name } = req.body;
  const query = `
  SELECT 
    REFI_IDRESCURSOFISICO,
    REFI_NOMBRERESCURSOFISICO, REFI_CAPACIDADRECURSOFISICO, REFI_ESTADORECURSOFISICO, TIRE_NOMBRETIPORECURSOFISICO 
  FROM 
    RESCURSOFISICO
  INNER JOIN 
    TIPORECURSOFISICO ON RESCURSOFISICO.FK_TIRE_IDTIPORECURSOFISICO = TIPORECURSOFISICO.TIRE_IDTIPORECURSOFISICO
  WHERE 
    REFI_NOMBRERESCURSOFISICO LIKE CONCAT('%', ?, '%');`;

  mysqlConnection.query(query, [name], (err, rows, fields) => {
    if (!err) {
      if (rows.length !== 0) {
        res.json({ msg: rows });
      } else {
        res.status(404).json({ msg: "Recurso Fisico no encontrado" });
      }
    } else {
      res.status(500).json({ msg: "Error de servidor" });
    }
  });
});

module.exports = SearchBar;
