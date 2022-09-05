
function CardMovie(props) {
  const listDirectores =
    props.directores.map((director) => 
      <a href="#">{director}, </a>
    );

  const listProtagonistas =
    props.protagonistas.map((protagonista) => 
      <a href="#">{protagonista}, </a>
    );
  

  return (
    <div className="movie-item-style-2">
      <img src={/* "images/uploads/"+ */props.srcImagen} alt=""/>
      <div className="mv-item-infor">
        <h6><a href={props.linkTitulo}>{props.titulo}<span>({props.anho})</span></a></h6>
        <p className="rate"><i className="ion-android-star"></i><span>{props.calificacion}</span> {props.baseCalificacion} </p>
        <p className="describe">{props.children}</p>
        <p className="run-time"> Run Time: {props.duration}    .     <span>MMPA: PG-13 </span>    .     <span>Release: {props.fechaLanzamiento}</span></p>
        <p>Director: <a href="#">{listDirectores}</a></p>
        <p>Stars: {listProtagonistas} </p>
      </div>
    </div>
  );
}

export default CardMovie;