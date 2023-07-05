<%--
  Created by IntelliJ IDEA.
  User: Basti
  Date: 03-07-2023
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="col">
        <h2 align="center">Ingrese algún campo para buscar y eliminar</h2>
        <form action="buscarPC" method="post">
            <select id="tipo" name="nombre" class="form-select form-select-sm" aria-label="Default select example"
                    required>
                <option align="center" selected>Indique cual es su preferida</option>
                <option align="center" value="Turquoise Frost">Turquoise Frost</option>
                <option align="center" value="Inferno Noir">Inferno Noir</option>
                <option align="center" value="Sapphire Shadow">Sapphire Shadow</option>
            </select>
            <br>
            <button type="submit" class="btn btn-success">Buscar</button>
        </form>
        <%
            String mensaje = (String) request.getAttribute("status");
            if (mensaje != null && !mensaje.isEmpty()) {
        %>
        <h2><%= mensaje %>
        </h2>
        <%
            }
        %>
        <br>
        <section>
            <table class="table">
                <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Juego</th>
                    <th scope="col">Modelo del Procesador</th>
                </tr>
                <c:forEach items="${pcbarato}" var="pc">
                    <tr>
                        <td><c:out value="${pc.nombre}" /></td>
                        <td><c:out value="${pc.juego}" /></td>
                        <td><c:out value="${pc.procesador}" /></td>
                    </tr>
                </c:forEach>
            </table>
        </section>
        <br>
    </div>
</div>
</body>
</html>
