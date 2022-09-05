import  express from "express";
//import { mysqlConnection } from "./conexionBd";
import { fileURLToPath } from 'url';
import { dirname } from 'path'

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();

// Settings
const portDefecto = 5500;

app.set('port', portDefecto);
app.set('view', __dirname + '/views');


app.use(express.json({limit: "50mb"}));


// Middleware


// Routes


// Satatic



app.post('/api/clientes', function(req, res) {
  console.log("entrando al post");
  res.send("Postman entrando al post");
});

app.get("/clientes", (req, res) => {
  res.send("Hello World!");
});

app.listen(app.port,() => {
  console.log(`Listening on port ${app.port}`);
}); 

