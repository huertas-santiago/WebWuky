var texto = document.getElementById("texto_lineas");
var boton = document.getElementById("boton");
boton.addEventListener("click", dibujoClick);

var d = document.getElementById("dibujito");
var ancho;
var lienzo = d.getContext("2d");
var lineas;

function dibujarLinea(color, xinicial, yinicial, xfinal, yfinal)
{
    lienzo.beginPath();
    lienzo.strokeStyle = color;
    lienzo.moveTo(xinicial, yinicial);
    lienzo.lineTo(xfinal, yfinal);
    lienzo.stroke();
    lienzo.closePath();
}

function dibujoClick()
{
    d = document.getElementById("dibujito");
    ancho = d.scrollWidth;
    lineas = parseInt(texto.value);
    
    var l = 0;
    var yi, xf;
    var colorcito = "red";
    var espacio = ancho / lineas; 
    console.log("Cabio de santiago 2")
    
    for(l; l < lineas; l++)
    {
        yi = espacio * l;
        xf = espacio *(l + 1)
        dibujarLinea(colorcito, 0, yi, xf, 300);
        console.log("linea " +  yi + 0+ xf + 300);
    }    
        
    dibujarLinea( colorcito, 1,1,1,299);
    dibujarLinea( colorcito, 1,299,299,299);
 
}
