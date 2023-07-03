<%--
  Created by IntelliJ IDEA.
  User: Basti
  Date: 24-06-2023
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>
<body>

<!--encabezado-->
<header class="container-fluid custom-header
d-flex justify-content-center">
  <p class="mb-0 fs-6"><a href="mailto://soporte@jbem.cl" title="Escribenos" style="color: white"> Escribenos a soporte@jbem.cl ! </a></p>
</header>

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

      <div>
        <h6 class="text-light">Bienvenido Administrador</h6>
        <a href="index.jsp" class="btn btn-primary">Cerrar Sesión</a>
      </div>
    </div>
  </div>
</nav>
<br><br>
<!-------------------      Agregar Almacenamiento         ---------------------->
<div class="container">
  <div class="row">
    <div class="col">
      <h2 align="center">Agregar Disco Duro</h2>
      <form action="agregarAlma" method="post">
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text">Agregue el modelo:</span>
          <input id="modelo" name="modelo" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
        </div>
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text">Indique la capacidad:</span>
          <input id="capacidad" name="capacidad" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
        </div>
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text">Agregue el precio:</span>
          <input id="precio" name="precio" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
        </div>
        <select id="tipo" name="tipo" class="form-select form-select-sm" aria-label="Default select example" required>
          <option align="center" selected>Indique el tipo de Disco duro</option>
          <option align="center" value="HDD">HDD</option>
          <option align="center" value="SDD">SDD</option>
        </select>
        <br>
        <button type="submit" class="btn btn-success">Agregar</button>
      </form>
    </div>
<!-----------------   Busqueda de alma    ------------------->
<div class="col">
      <h2 align="center">Ingrese algún campo para buscar y eliminar</h2>
  <form action="buscarAlma" method="post">
    <input placeholder="Busqueda por modelo" name="modelo" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
    <br>
    <input placeholder="Busqueda por cantidad" name="capacidad" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
    <br>
    <input placeholder="Busqueda por el tipo" name="tipo" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
    <br>
    <button type="submit" class="btn btn-primary">Buscar</button>
  </form>
  <%
    String mensaje = (String) request.getAttribute("status");
    if (mensaje != null && !mensaje.isEmpty()) {
  %>
  <h2><%= mensaje %></h2>
  <%
    }
  %>
<br>
<section>
<table class="table">
  <tr>
    <th scope="col">ID</th>
    <th scope="col">Modelo</th>
    <th scope="col">Capacidad</th>
    <th scope="col">Precio</th>
    <th scope="col">Tipo</th>
    <th scope="col">Eliminar</th>
  </tr>
  <c:forEach items="${almacenamientos}" var="almacenamiento">
    <tr>
      <td>${almacenamiento.getIdAlma()}</td>
      <td><c:out value="${almacenamiento.getModelo()}"></c:out></td>
      <td><c:out value="${almacenamiento.getCapacidad()}"></c:out></td>
      <td><c:out value="${almacenamiento.getPrecio()}"></c:out></td>
      <td><c:out value="${almacenamiento.getTipo()}"></c:out></td>
      <td> <a href="eliminarAlma?idAlma=${almacenamiento.getIdAlma()}">Eliminar</a> </td>
    </tr>
  </c:forEach>
</table>
</section>
  <br>
    </div>
  </div>
</div>
</body>
<br><br><br><br><br><br><br><br>
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
</html>
