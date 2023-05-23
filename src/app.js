const express = require("express");
const app = express();
const morgan = require("morgan");
const cors = require("cors");
require("dotenv").config();
const mongoose = require("mongoose");

//settings
app.set("port", process.env.BACK_PORT || 3000);
// const uri = process.env.ATLAS_URI;

//middleware
app.use(morgan("dev"));
app.use(express.json());
app.use(cors());

// Conectar a MongoDB Atlas utilizando Mongoose
// mongoose.connect(uri, {
//   useNewUrlParser: true,
//   useUnifiedTopology: true,
// });

// const connection = mongoose.connection;
// connection.once("open", () => {
//   console.log(" MongoDB database connection");
// });

//routes
app.use("/api", require("./routes"));

//start server
app.listen(app.get("port"), () => {
  console.log("😁 server en puerto", app.get("port",));
});
