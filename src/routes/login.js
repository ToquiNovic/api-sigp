const loginRoute = require("express").Router();

loginRoute.get("/login", (req, res) => {
  res.send("Hello");
});

loginRoute.post("/login", (req, res) => {
  const { nombre1, contrasena } = req.body;

  res.json({ nombre1, contrasena });
});

module.exports = loginRoute;
