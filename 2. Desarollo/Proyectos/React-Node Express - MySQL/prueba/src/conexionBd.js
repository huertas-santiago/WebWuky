import mysql from 'mysql';

// El comando para correr este archivo por consola es 
//node src/conexionBd.js


//function mysqlConnection(){
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database:'dbwuky'
  });

  con.connect((err) =>{
    if (err) console.log( err);
    con.query("SELECT * FROM usuario", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
    // console.log("conectado!");
  });

//}

//export {mysqlConnection};