const solicitudRouter = require("express").Router();
const mysql = require("../database");

solicitudRouter.get("/", (req, res) => {

    const mysqlQuery = `SELECT 
        CANTIDAD.CANT_IDCANTIDAD as id,
        CANTIDAD.CANT_NOMBRECATEGORIA as name 
    FROM 
      CANTIDAD`;    
    
    mysql.query(mysqlQuery, (err, rows) => {
        console.log(err);
        if (!err) {
          res.json(rows);
        } else {
          res.status(500).json({ msg: "Error!" });
        }
      });
});

module.exports = solicitudRouter;