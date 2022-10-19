import { Router } from "express";
import { conexionDB } from "../config/conexionDB.js";

const router = Router();

let connection = conexionDB();


router.get('/API/clientes', (req,res) => {
  if(connection.state !='connected'){
    connection = conexionDB();
  }

  try {
    let resultado = connection.query('SELECT * FROM cliente', function(err, rows, fields) {
      if (err){
        res.status(500).send(rows);
        //throw err;
      }
      else{
        console.log('The solution is: ', rows[0].solution);
        console.log(rows);
        res.status(200).send(rows);
      }
    });
  } catch (error) {
    console.log('The solution is: ', error);
  }
});
/*
  connection.end();
  
 */
export {router};