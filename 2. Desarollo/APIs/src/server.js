import app from "./app.js";

async function main() {
  await app.listen(app.get('port'));
  console.log('listening on port ' + app.get('port'));
}

main();