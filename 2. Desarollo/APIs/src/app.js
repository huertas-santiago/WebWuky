import express from 'express';
import morgan from 'morgan';

import { router } from './routes/index.js';

/* import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename); */
import path from 'path';
const __dirname = path.resolve();

const app = express();

//Setting
const port = 5000; 
app.set('port', port);
app.set('view', path.join(__dirname, 'views'));
app.set('views engine', 'ejs');
app.use(express.json({limit: "50mb"}));

//Middlewares
app.use(morgan('dev'));// le decimos que vamos a usar el metodo dev de morgan
app.use(express.urlencoded({extended: false}));//convertir datos a json

// Routes
app.use(router);//Importa todas las rutas


// Static
app.use(express.static(path.join(__dirname, 'public')));


// App handler
app.use((req,res,next)=>
  res.status(404).send('404 Not found')
);


export default app;