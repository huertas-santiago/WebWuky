import mysql from 'mysql';

function conexionDB(){
  
  var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database:'dbwuky'
  });
  
  return connection;
};

export {conexionDB};