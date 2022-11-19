import mysql from 'mysql';

function conexionDB(){
  
  var connection = mysql.createConnection({
    host: "admin-ecommerce.mysql.database.azure.com", /* localhost */
    user: "wuky",
    password: "Temporal01",
    database:'db_ecommerce'
  });
  
  return connection;
};

export {conexionDB};