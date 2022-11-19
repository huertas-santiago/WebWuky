import CardMovie from './CardMovie';
import PageWrapper from './PageWrapper';
import { Paginacion } from './Paginacion';
// import peliculasJson from './json/peliculas.json';
import React, { useEffect, useState } from 'react';

function ListadoPeliculas() {
  const [paginaActual,setPaginaActual] = useState(1);
  const [cantidadPeliculasPagina,setCantidadPeliculasPagina] = useState(3);
  const [peliculas,setPeliculas] = useState([]);
  
  const buscarPeliculas = async () => {
    let url = 'https://lucasmoy.dev/data/react/peliculas.json';
    
    let respuesta = await fetch(
      url
      /* ,{"methods": 'GET',
      "mode": 'no-cors',
      "headers": {
        "Accept": "application/json",
        "Content-Type": "application/json"
        "Origin": 'https://lucasmoy.dev'
      }} */
    );
    let json = await respuesta.json();
    setPeliculas(json);
    //alert(json);
  }

  //let peliculas = peliculasJson;

  useEffect(()=> {
    buscarPeliculas();
  },[]);

  useEffect(()=> {
      setPaginaActual(1);
  },[cantidadPeliculasPagina]); 

  const onChangePagina=(pagina) => {
    setPaginaActual(pagina);
  }

  const onChancePaginado = (evento)=>{
    setCantidadPeliculasPagina(evento.target.value);
  }

  const getTotalPaginas = ()=>{
    return Math.ceil( peliculas.length/cantidadPeliculasPagina);
  }
  
  
  let peliculasFiltradas = ()=>{
    let retorno = peliculas.slice(
      (paginaActual-1)*cantidadPeliculasPagina,
      (paginaActual*cantidadPeliculasPagina)
    ); 
    return retorno;
  };
  
  
  return (
    <PageWrapper>
      {(peliculasFiltradas()).map((pelicula,index)=>{
        
        return <CardMovie 
        key={index+1}
        srcImagen={pelicula.img}
        // {pelicula.srcImagen}
        linkTitulo={pelicula.linkTitulo}
        titulo={pelicula.titulo}
        anho= {2012}
        // {pelicula.anho}
        calificacion={pelicula.calificacion}
        baseCalificacion={pelicula.baseCalificacion}
        duration={pelicula.duration}
        directores={["Joss Whedon"]}
        // {pelicula.directores} 
        protagonistas={["Robert Downey Jr.", "Chris Evans","Chris Hemsworth"]}
        // {pelicula.protagonistas}
        fechaLanzamiento={pelicula.fechaLanzamiento}
      >
        {pelicula.descripcion}
        
      </CardMovie>;
      
      })
      }

      <Paginacion paginaActual={paginaActual} totalPaginas={getTotalPaginas()} 
        onChangePagina = {onChangePagina}
        onChancePaginado={onChancePaginado}
      />
    </PageWrapper>      
  );
}

export {ListadoPeliculas}




function App() {

  
}