const express = require("express");
const app = express();
const morgan = require("morgan");
const cors = require("cors");
require("dotenv").config();

//settings
app.set("port", process.env.BACK_PORT || 3000);

//middleware
app.use(morgan("dev"));
app.use(express.json());
app.use(cors());

//routes
app.use("/api", require("./routes"));

//start server
app.listen(app.get("port"), () => {
  console.log("server en puerto", app.get("port"));
});
