const express = require('express');
const mysql = require('mysql');
const myconn = require('express-myconnection');

const app = express();
app.set('port', process.env.PORT || 3000)

const dbOptions = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'proyecto_final'
}

//middlewares -------------
app.use(myconn(mysql,dbOptions,'single'))

//routers--------------
app.get('/', (req,res) => {
    res.send('Hello Wolrd')
})


//server running-------
app.listen(app.get('port'), () => {
    console.log('server en puerto', app.get('port'))
})