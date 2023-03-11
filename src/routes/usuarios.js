const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.get('/usuarios', (req, res) => {
    mysqlConnection.query('SELECT * FROM USUARIO', (err,rows,fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);            
        }
    })
} );

router.get('/usuarios/nickname/:nickname', (req,res) => {
    const {nickname} = req.params;
    mysqlConnection.query('SELECT * FROM USUARIO WHERE USUR_NICKNAME= ?', [nickname],(err,rows,fields) => {
        if (!err) {
            res.json(rows[0]);
        } else {
            console.log(err);            
        }
    })
});

//INGRESAR
router.post('/registrar/usuarios',(req,res) => {
    const {id,nombre1,nombre2,apellido1,apellido2,n_identificacion,tipo_usuario} = req.body;
    const query = `
    insert into usuario (id,nombre1,nombre2,apellido1,apellido2,n_identificacion,tipo_usuario) values (?,?,?,?,?,?,?)
    `;
   mysqlConnection.query(query, [id,nombre1,nombre2,apellido1,apellido2,n_identificacion,tipo_usuario], (err,rows,fields) =>{
        if (!err) {
            res.json({Status: 'Usuario Guardado'});
        } else {
            console.log(err);            
        }
   })
});

//ACTUALIZAR
router.put('/actualizar/usuarios/:id',(req,res) => {
    const {nombre1,nombre2,apellido1,apellido2,n_identificacion,tipo_usuario} = req.body;
    const {id} = req.params;
    const query = `
    update usuario SET nombre1 = ?, nombre2 = ?,
        apellido1 = ?,apellido2 = ?,
        n_identificacion = ?,tipo_usuario = ? where id = ?
    `;
    mysqlConnection.query(query, [nombre1,nombre2,apellido1,apellido2,n_identificacion,tipo_usuario,id], (err,rows,fields) =>{
        if (!err) {
            res.json({Status: 'Usuario Actualizado'});
        } else {
            console.log(err);            
        }
   })
});


//ELIMINAR
router.delete('/eliminar/usuarios/:id',(req,res) => {
    const {id} = req.params;
    mysqlConnection.query('delete from usuario where id = ?',[id], (err,rows,fields) => {
        if ((!err)) {
            res.json({Status: 'usuario eliminado'});
        } else {
            console.log(err);
        }
    })
});


module.exports = router;