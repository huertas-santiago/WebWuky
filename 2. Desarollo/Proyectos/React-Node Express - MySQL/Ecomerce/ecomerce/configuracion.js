const express = require('express');
const path = require('path');
const morgan =require('morgan');
const mysql = require('mysql');
const myConnection = require('express-myconnection');
const app = express(); // me devuelve un objeto, por eso se convierte en una constante, para crear mi servidor

//importando routers
const customerRoutes = require('../routes/categorias');

//configuramos el servidor
app.set('port', process.env.PORT || 3000) // si el servidor esta en la nube aqui le decimos que escuche ese puerto o por defecto el 3000
app.set('view engine','ejs');
app.set('view',path.join(__dirname, 'view'));

//Funcion que se ejecutan antes

//middelware
app.use(morgan('dev'));
app.use(myConnection(mysql,{
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    db:'ventas'
}, 'single'));



//routers
app.use('/',customerRoutes);

//archivos staticos
app.use(express.static(path.join(__dirname,'public')));

//Inicializamos el servidor
app.listen(app.get('port'), ()=>{
    console.log('servidor puerto 3000'); 
});
