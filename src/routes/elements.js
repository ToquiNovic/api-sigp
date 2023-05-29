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

elementsRouter.post("/", async (req, res) => {
  const { name, categoryId, description, image, brand } = req.body;

  const queryCreatedDetailElement = `SET @nuevo_DEEL_IDDETALLEELEMENTO = (SELECT MAX(DEEL_IDDETALLEELEMENTO) FROM DETALLEELEMENTO) + 1;
  INSERT INTO DETALLEELEMENTO ( DEEL_IDDETALLEELEMENTO, DEEL_FECHAREGISTRO, DEEL_DESCRIPCION, DEEL_IMAGEN )
     VALUES
       (@nuevo_DEEL_IDDETALLEELEMENTO, '2023-05-05', 'Descripcioon II', 'https://firebasestorage.googleapis.com/v0/b/sig-archives-dc939.appspot.com/o/images%2Fveb1.jpg?alt=media&token=c3970708-fc00-49b9-9e36-e30e5869c449');
        SET @nuevo_ELEM_IDELEMENTO = (SELECT MAX(ELEM_IDELEMENTO) FROM ELEMENTOS) + 1;
      
   INSERT INTO ELEMENTOS (ELEM_IDELEMENTO, ELEM_NOMBREELEMENTO, ELEM_MARCA, ELEM_ESTADO, FK_DEEL_IDDETALLEELEMENTO, FK_CANT_IDCANTIDAD)
  VALUES (@nuevo_ELEM_IDELEMENTO, 'Microscopio', 'XXX', 'Disponible', @nuevo_DEEL_IDDETALLEELEMENTO, 1);
  `;

  mysql.query(queryCreatedDetailElement, (err, rows) => {
    console.log(err);
    if (!err) {
      res.json({ ...rows });
    } else {
      res.status(500).json({ msg: "Error al crear un detalle elemento" });
    }
  });
});

module.exports = elementsRouter;
