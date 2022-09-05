
function Paginacion(props) {

  const pagindo = [3,5,10];

  const getPaginas = ()=> {
    let paginas = [];
    for (let i=0; i<props.totalPaginas; i++) {
      paginas.push(
        <a key={i+1} onClick={()=>props.onChangePagina(i+1)} 
        className={`${(props.paginaActual==i+1) && 'active'}`}
        //Otra forma:
        //className={(props.paginaActual===(i+1))? 'active':''}
        /* href="#" */>
          {(i+1)}
        </a>
      );
    }
    return paginas;
  }


  return (
    <div className="topbar-filter">
      <label>Peliculas por pagina:</label>
      <select onChange={props.onChancePaginado}>
        {pagindo.map((numero)=>
          <option key={numero} value={numero}>{numero} Movies</option>
        )
        }
      </select>
      <div className="pagination2">
        <span>Pagina {props.paginaActual} de {props.totalPaginas}:</span>
        {getPaginas()}
        <a href="#">
          <i className="ion-arrow-right-b"></i>
        </a>
      </div>
    </div>
  );
}

export {Paginacion};