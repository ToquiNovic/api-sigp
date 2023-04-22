const routerTipoID = require("express").Router();

routerTipoID.get("/", (req, res) => {
    const mysqlConnection = require("../database");

    const query = `SELECT TIID_ID_TIPOID, TIID_NOMBRE_TIPOID FROM TIPOIDENTIFICACION;`;

    mysqlConnection.query(query, (err, rows, fields) => {
        if (!err) {
            console.log(rows);
            res.json({msg: rows});
        } else {
            console.log(err);            
        }
    });
});

module.exports = routerTipoID;