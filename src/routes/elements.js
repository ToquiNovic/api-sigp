const elementsRouter = require("express").Router();
const mysql = require("../database");

elementsRouter.get("/", (req, res) => {
  const { limit, name } = req.query;

  let mysqlQuery = `
    SELECT
      ELEMENTOS.ELEM_IDELEMENTO AS id,
      ELEMENTOS.ELEM_NOMBREELEMENTO AS name,
      ELEMENTOS.ELEM_ESTADO AS state, 
      ELEMENTOS.ELEM_MARCA AS brand, 
      CANTIDAD.CANT_NOMBRECATEGORIA as category,
      DETALLEELEMENTO.DEEL_IMAGEN as image,
      DETALLEELEMENTO.DEEL_DESCRIPCION as description,
      COUNT(*) AS stock
    FROM 
      ELEMENTOS
    INNER JOIN 
      CANTIDAD
    ON 
      ELEMENTOS.FK_CANT_IDCANTIDAD = CANTIDAD.CANT_IDCANTIDAD
    INNER JOIN 
      DETALLEELEMENTO
    ON 
      ELEMENTOS.FK_DEEL_IDDETALLEELEMENTO = DETALLEELEMENTO.DEEL_IDDETALLEELEMENTO
    WHERE 
      ELEMENTOS.ELEM_ESTADO = 'Disponible'
      ${name ? `AND ELEMENTOS.ELEM_NOMBREELEMENTO = '${name}'` : ""}
    GROUP BY 
      ELEMENTOS.ELEM_NOMBREELEMENTO,
      ELEMENTOS.ELEM_ESTADO
    ORDER BY 
      ELEMENTOS.ELEM_IDELEMENTO ASC
  `;

  if (limit) {
    mysqlQuery = mysqlQuery + `LIMIT ${limit};`;
  } else {
    mysqlQuery = mysqlQuery + ";";
  }

  mysql.query(mysqlQuery, (err, rows) => {
    console.log(err);
    if (!err) {
      res.json(rows);
    } else {
      res.status(500).json({ msg: "Error!" });
    }
  });
});

elementsRouter.get("/:id", (req, res) => {
  const { id } = req.params;
  let mysqlQuery = `
  SELECT 
    ELEMENTOS.ELEM_IDELEMENTO as id,
    DETALLEELEMENTO.DEEL_IMAGEN as image,
    ELEMENTOS.ELEM_NOMBREELEMENTO as name,
    DETALLEELEMENTO.DEEL_DESCRIPCION as description,
    CANTIDAD.CANT_NOMBRECATEGORIA as category,
    ELEMENTOS.ELEM_ESTADO as estate,
    COUNT(*) AS stock
  FROM
    ELEMENTOS
  INNER JOIN 
    CANTIDAD ON ELEMENTOS.FK_CANT_IDCANTIDAD = CANTIDAD.CANT_IDCANTIDAD
  INNER JOIN 
    DETALLEELEMENTO ON ELEMENTOS.FK_DEEL_IDDETALLEELEMENTO = DETALLEELEMENTO.DEEL_IDDETALLEELEMENTO
  WHERE ELEMENTOS.ELEM_IDELEMENTO =  ${id}
  GROUP BY 
    ELEMENTOS.ELEM_NOMBREELEMENTO,
    ELEMENTOS.ELEM_ESTADO;
  `;

  mysql.query(mysqlQuery, (err, rows) => {
    if (!err) {
      if (rows[0]) {
        res.json(rows[0]);
      } else {
        res.status(404).json({ msg: "Elemento no encontrado" });
      }
    } else {
      res.status(500).json({ msg: "Error!" });
    }
  });
});

elementsRouter.get("/:id", (req, res) => {
  const { id } = req.params;
  let mysqlQuery = `
  SELECT 
    ELEMENTOS.ELEM_IDELEMENTO as id,
    DETALLEELEMENTO.DEEL_IMAGEN as image,
    ELEMENTOS.ELEM_NOMBREELEMENTO as name,
    DETALLEELEMENTO.DEEL_DESCRIPCION as description,
    CANTIDAD.CANT_NOMBRECATEGORIA as category,
    ELEMENTOS.ELEM_ESTADO as estate,
    COUNT(*) AS stock
  FROM
    ELEMENTOS
  INNER JOIN 
    CANTIDAD ON ELEMENTOS.FK_CANT_IDCANTIDAD = CANTIDAD.CANT_IDCANTIDAD
  INNER JOIN 
    DETALLEELEMENTO ON ELEMENTOS.FK_DEEL_IDDETALLEELEMENTO = DETALLEELEMENTO.DEEL_IDDETALLEELEMENTO
  WHERE ELEMENTOS.ELEM_IDELEMENTO =  ${id}
  GROUP BY 
    ELEMENTOS.ELEM_NOMBREELEMENTO,
    ELEMENTOS.ELEM_ESTADO;
  `;

  mysql.query(mysqlQuery, (err, rows) => {
    if (!err) {
      if (rows[0]) {
        res.json(rows[0]);
      } else {
        res.status(404).json({ msg: "Elemento no encontrado" });
      }
    } else {
      res.status(500).json({ msg: "Error!" });
    }
  });
});
module.exports = elementsRouter;
