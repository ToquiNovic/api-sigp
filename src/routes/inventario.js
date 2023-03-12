const { ROLL } = require("../config");
const { verifyToken } = require("../middlewares");

const routerInventario = require("express").Router();

routerInventario.post("/", verifyToken, (req, res) => {
  const { name, description } = req.body;
  console.log(req.user);
 
  if (req.user.ROLL_NOMBREROL === ROLL.ESTUDIANTE) {
    res.status(401).json({ msg: "No tienes permitido hacer esto!" });
  } else {
    // hace toda la mierda en la base de datos
    console.log(name, description);
    res.json(req.user);
  }
});

module.exports = routerInventario;
