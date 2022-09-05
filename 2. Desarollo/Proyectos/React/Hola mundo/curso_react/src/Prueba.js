
function Prueba() {
  const [paginaActual,setPaginaActual] = useState(1);
  const [cantidadPeliculasPagina,setCantidadPeliculasPagina] = useState(5);
  // const [peliculas,setPeliculas] = useState([]);


  const buscarPeliculas = async () => {
    let url = 'https://lucasmoy.dev/data/react/peliculas.json';
    
    let peliculas = peliculasJson; 

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
    // setPeliculas(json);
    //alert(json);
  }

  // useEffect(()=> {
    buscarPeliculas();
  // },[]);


  const onChangePagina=(pagina) => {
    setPaginaActual(pagina);
  }

  const onChancePaginado = (evento)=>{
    setCantidadPeliculasPagina(evento.target.value);
  }

  const cargarPeliculas = ()=>{
    peliculas = peliculas.slice((paginaActual-1)*cantidadPeliculasPagina,(paginaActual*cantidadPeliculasPagina)); 
    if(peliculas.length == 0){
      setPaginaActual(1);
    }
  }

  const getTotalPaginas = ()=>{
    return Math.ceil( peliculas.length/cantidadPeliculasPagina);
  }

  
  cargarPeliculas();
  return (
    <PageWrapper>
      {peliculasFiltradas.map((pelicula,index)=>{
        
        return <CardMovie 
        key={index}
        srcImagen={pelicula.srcImagen}
        linkTitulo={pelicula.linkTitulo}
        titulo={pelicula.titulo}
        anho= {pelicula.anho}
        calificacion={pelicula.calificacion}
        baseCalificacion={pelicula.baseCalificacion}
        duration={pelicula.duration}
        directores={pelicula.directores} 
        protagonistas={pelicula.protagonistas}
        fechaLanzamiento={pelicula.fechaLanzamiento}>
        {pelicula.descripcion}
        
      </CardMovie>;
      
      })
      }

      <Paginacion 
        paginaActual={paginaActual} 
        totalPaginas={getTotalPaginas()}
        onChangePagina = {onChangePagina}
        onChancePaginado={onChancePaginado}
      />
    </PageWrapper>
}

export default Prueba;