<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <meta name="description" content="html5, css, php, jascript">
    <link rel="stylesheet" href="../Configuracion/css/bootstrap.min.css">
    <title>Formulario Factura_Cliente</title>
</head>
<body>
    <div class="container">
        <h1 class="h1">Formulario Factura_Cliente</h1>
        <form action="" method="post" name="FacturaCliente">
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th class="form-label">
                            <label class="col-form-label">Factura a buscar</label>
                        </th>
                        <th><input class="form-control" type="text" name= "buscar" placeholder= "Buscar"></input></th>
                        <th>
                            <div class="btn-group">
                                <button class="btn btn-outline-success" name= "consulta" type= "button">Buscar</button>
                                <button class="btn btn-outline-success" name= "crear" type= "button">Crear</button>
                                <button class="btn btn-outline-success" name= "cerrar" type= "button">Salir</button>
                            </div>
                        </th>
                        
                        
                    </tr>
                </thead>
            </table>
            <br>
            <div class="table-responsive">
                <table class="table table-sm table table-striped table-hover table-bordered " >
                    <thead  class="table-info">
                        <tr>
                            <th>N°</th>
                            <th>Fecha</th>
                            <th>Rete_ica</th>
                            <th>Rete_fuente</th>
                            <th>Iva</th>
                            <th>Subtotal</th>
                            <th>Compra_neta</th>
                            <th>Digitos_tarjeta</th>
                            <th>Id_banco</th>
                            <th>Codigo_facturado</th>
                            <th>Respuesta_banco</th>
                            <th>Forma_pago</th>
                            <th>Nombre_destinatario</th>
                            <th>Tipo_documento</th>
                            <th>Numero_documento</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody >
                        <tr>
                            <th>313454</th>
                            <th>2022-06-07 00:00:00</th>
                            <th>0</th>
                            <th>0</th>
                            <th>23456.6</th>
                            <th>123456</th>
                            <th>146913</th>
                            <th>956</th>
                            <th>B12</th>
                            <th>67545h6767</th>
                            <th>1</th>
                            <th>Tj</th>
                            <th>Santiago Huertas</th>
                            <th>C</th>
                            <th>8706833565</th>
                            
                            <th>
                                <div class="btn-group" role="group">
                                    <button id="btnGroupDrop1" type="button" class="btn btn-outline-success btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                        Dropdown
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                        <li><a class="dropdown-item" href="#" name= "detalle"></a>Detalle</li>
                                        <li><a class="dropdown-item" href="#" name= "editar"></a>Editar</li>
                                    </ul>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>3156486</th>
                            <th>2019-10-01 00:00:00</th>
                            <th>0</th>
                            <th>0</th>
                            <th>110200</th>
                            <th>580000</th>
                            <th>690200</th>
                            <th>970</th>
                            <th>B13</th>
                            <th>67545h6768</th>
                            <th>0</th>
                            <th>Tj</th>
                            <th>Marlon Martinez</th>
                            <th>C</th>
                            <th>378120729</th>
                            <th>
                                <button class="btn btn-outline-success btn-sm" name= "detalle" type= "button">Detalle</button>
                                <button class="btn btn-outline-success btn-sm" name= "editar" type= "button">Editar</button>
                            </th>
                        </tr>
                        <tr>
                            <th>3145654</th>
                            <th>2022-10-20 00:00:00</th>
                            <th>0</th>
                            <th>0</th>
                            <th>6460</th>
                            <th>34000</th>
                            <th>40460</th>
                            <th>226</th>
                            <th>B14</th>
                            <th>67545h6769</th>
                            <th>1</th>
                            <th>Tj</th>
                            <th>Lucas Contreras</th>
                            <th>c</th>
                            <th>1038055081</th>
                            <th>
                                <button class="btn btn-outline-success btn-sm" name= "detalle" type= "button">Detalle</button>
                                <button class="btn btn-outline-success btn-sm" name= "editar" type= "button">Editar</button>
                            </th>
                        </tr>
                        <tr>
                            <th>313478454</th>
                            <th>2020-10-12 00:00:00</th>
                            <th>0</th>
                            <th>0</th>
                            <th>22800</th>
                            <th>120000</th>
                            <th>142800</th>
                            <th>142</th>
                            <th>B15</th>
                            <th>67545h6770</th>
                            <th>1</th>
                            <th>Tj</th>
                            <th>Milena Castro</th>
                            <th>C</th>
                            <th>4592966760</th>
                            <th>
                                <button class="btn btn-outline-success btn-sm" name= "detalle" type= "button">Detalle</button>
                                <button class="btn btn-outline-success btn-sm" name= "editar" type= "button">Editar</button>
                            </th>
                        </tr>
                </table>
            </div>
            
        </form>
    </div>
    
</body>
</html>



