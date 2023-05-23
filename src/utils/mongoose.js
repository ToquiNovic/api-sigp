// utils/mongoose.js
const mongoose = require("mongoose");

const { MONGO_URI } = require("../config");

const mongooseConnection = mongoose.createConnection(MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

mongooseConnection.on("error", (error) => {
  console.error("Error connecting to MongoDB:", error);
});

mongooseConnection.once("open", () => {
  console.log("MongoDB database connection established successfully");
});

module.exports = mongooseConnection;
