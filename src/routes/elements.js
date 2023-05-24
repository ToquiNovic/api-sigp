const elementsRouter = require("express").Router();
const mysql = require("../database");

elementsRouter.get("/", (req, res) => {
  const { limit } = req.query;

  let mysqlQuery = `
    SELECT ELEMENTOS.ELEM_IDELEMENTO AS id, ELEMENTOS.ELEM_NOMBREELEMENTO AS name, ELEMENTOS.ELEM_ESTADO AS state, ELEMENTOS.ELEM_MARCA AS brand
    FROM ELEMENTOS
    ORDER BY ELEMENTOS.ELEM_IDELEMENTO ASC
  `;

  if(limit) {
    mysqlQuery = mysqlQuery + `LIMIT ${limit};`
  } else {
    mysqlQuery = mysqlQuery + ";"
  }

  mysql.query(mysqlQuery, (err, rows) => {
    if (!err) {
      return res.json(rows);
    } else {
      res.status(500).json({ msg: "Error!" });
    }
  });
});

module.exports = elementsRouter;
