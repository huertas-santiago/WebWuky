import mysql from 'mysql';

function conexionDB(){
  
  var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database:'db_ecommerce'
  });
  
  return connection;
};

export {conexionDB};