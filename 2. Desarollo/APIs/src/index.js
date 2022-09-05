import app from "./app.js";

// con.connect((err) =>{
//   if (err) console.log( err);
//   // con.query("SELECT * FROM usuario", function (err, result, fields) {
//   //   if (err) throw err;
//   //   console.log(result);
//   // });
//   console.log("conectado!");
// });

async function main() {
  await app.listen(app.get('port'));
  console.log('listening on port ' + app.get('port'));

}

main();