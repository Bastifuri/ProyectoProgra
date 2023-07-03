<%@ page import="org.jooq.DSLContext" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JBEM-Tienda de Hardware</title>
    <link rel="stylesheet" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<body>

<!--encabezado-->
<header class="container-fluid custom-header d-flex justify-content-center">
    <p class="mb-0 fs-6"><a href="mailto://soporte@jbem.cl" title="Escribenos" style="color: white"> Escribenos a soporte@jbem.cl ! </a></p>
</header>

            <!---------------------------------------------------------------------------------------->

<!--Menu de pagina-->
<nav class="navbar navbar-expand-lg color-navbar">
    <div class="container-fluid">
        <!--Logo-->
        <a class="navbar-brand" href="index.jsp">
            <img src="Imagenes/JBEM.png" alt="Logo" style="width: 100px; height: auto;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!--Elementos del menu-->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active text-light" aria-current="page" href="#" style="font-size: 20px;">PCs
                        preensamblados</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-light" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false" style="font-size: 20px;">
                        Hardware
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Procesadores</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Tarjetas gráficas</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Memorias RAM</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Discos duros</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Fuentes de poder</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Gabinetes</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Placas madre</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Refrigeraciones</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-light" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false" style="font-size: 20px;">
                        Perifericos
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Audifonos</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Mouse</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Teclados</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link active text-align text-light" aria-current="page" href="#"
                       style="font-size: 20px;">Nosotros</a>
                </li>
            </ul>

            <!---------------------------------------------------------------------------------------->

            <!-- Boton modal login -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Iniciar Sesión
            </button>

            <!-- Modal para ingresar con una cuenta-->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Por favor ingrese sus datos debajo</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="logearusuario" method="post" class="text-center">
                                <div class="form-group">
                                <input type="text" name="rut" placeholder="Ingrese su rut" class="form-control" required><br>
                                </div>
                                <div class="form-group">
                                <input type="password" name="password" placeholder="Ingrese su contraseña" class="form-control" required><br>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Iniciar sesión</button>
                                    <button class="btn btn-secondary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Registrate</button>
                                </div>
                                <p>${errorMessage}</p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--Pop Up para registrarse-->

            <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">Registro</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>


                        <!--Campos para ingresar los datos-->

                        <div class="modal-body">
                            <form action="agregarusuario" method="post" class="text-center">
                                <div class="form-group">
                                    <input placeholder="Ingrese su nombre" name="rut" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <input placeholder="Ingrese su rut" name="nombre" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <input placeholder="Ingrese su contraseña" name="password" type="password" class="form-control">
                                </div>
                                <br>
                                <div class="modal-footer">
                                    <button class="btn btn-secondary" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal">Registrate</button>
                                    <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Cerrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
            <!---------------------------------------------------------------------------------------->

</br>
<div class="container">

<h2 align="center"> PCs preensamblados con tus juegos favoritos!</h2>

<!--Carrusel-->
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="5000">
                        <a href="pagina1.jsp">
                            <img src="Imagenes/cyber2077.jpg" class="d-block w-100" alt="Cyberpunk2077">
                        </a>
                    </div>
                    <div class="carousel-item" data-bs-interval="5000">
                        <a href="pagina2.jsp">
                            <img src="Imagenes/lol.jpg" class="d-block w-100" alt="League of Legends">
                        </a>
                    </div>
                    <div class="carousel-item" data-bs-interval="5000">
                        <a href="preensamble.jsp">
                            <img src="Imagenes/RDR2.jpg" class="d-block w-100" alt="Red dead Redemption 2">
                        </a>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
<div>
</div>

            <!---------------------------------------------------------------------------------------->


    <!--Seccion fotos-->
<br>
<h2 align="center">Ofertas imperdibles</h2>
<div class="row">
    <div class="col-4">
        <div><a href="catalogoSSD.jsp"><img src="Imagenes/ofSSD.png" class="img-thumbnail img-responsive" style="border-color: #1F1D9C;" title="Oferta de discos SSD"></a></div>
    </div>
    <div class="col-4">
        <div><img src="Imagenes/ofM.png" class="img-thumbnail img-responsive" style="border-color: #1F1D9C;" title="Oferta de monitores"></div><br>
        <div><img src="Imagenes/ofTG.png" class="img-thumbnail img-responsive" style="border-color: #1F1D9C;" title="Oferta de tarjetas graficas"></div>
    </div>
    <div class="col-4">
        <div><img src="Imagenes/ofP.png" class="img-thumbnail img-responsive" style="border-color: #1F1D9C;" title="Oferta de perifericos"></div>
    </div>
</div>
</div>
<br>

            <!---------------------------------------------------------------------------------------->


<br/>
<!--Pie de pagina-->
<div class="container-fluid footer">
<footer>
    <div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3">
                <h4>Ayuda</h4>
                <ul>
                    <li><a href="#">Centro de ayuda</a></li>
                    <li><a href="#">Seguimiento de mi compra</a></li>
                </ul></div>
            <div class="col-md-3">
                <h4>Nosotros</h4>
                <ul>
                    <li><a href="#">Quiénes somos</a></li>
                    <li><a href="#">Términos y condiciones</a></li>
                    <li><a href="#">Políticas de privacidad</a></li>
                </ul>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
        integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</div>
</body>
</html>