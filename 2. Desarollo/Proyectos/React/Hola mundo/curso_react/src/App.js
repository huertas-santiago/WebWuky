import {BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.css';
import { ListadoPeliculas } from './vistas/ListadoPeliculas';


function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<ListadoPeliculas />}/>
        
      </Routes>
    </BrowserRouter>
  );
}

export default App;
