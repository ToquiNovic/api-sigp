const mysql = require("mysql2");
const { DB_HOST, DB_NAME, DB_PASS, DB_USER } = require("./config");

const mysqlConnection = mysql.createConnection({
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASS,
  database: DB_NAME,
});

mysqlConnection.connect(function (err) {
  if (err) {
    console.log(err);
    return;
  } else {
    console.log("BD conectada");
  }
});

module.exports = mysqlConnection;
