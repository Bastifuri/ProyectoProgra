<%--
  Created by IntelliJ IDEA.
  User: Basti
  Date: 24-06-2023
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
<main>
  <section>
    <article class="b-form">
      <form action="" method="post">
        <input placeholder="Ingrese el modelo" name="modelo" type="text">
        <button type="submit">Buscar</button>
      </form>
      <a href="index.jsp">volver</a>
    </article>
  </section>
  <%
    String mensaje = (String) request.getAttribute("status");
    if (mensaje != null && !mensaje.isEmpty()) {
  %>
  <h2><%= mensaje %></h2>
  <%
    }
  %>
  <section class="r-busqueda">
    <table>
      <tr>
        <th>ID</th>
        <th>Modelo</th>
        <th>Capacidad</th>
        <th>Precio</th>
        <th>Tipo</th>
      </tr>
      <c:forEach items="${almacenamientos}" var="almacenamiento">
        <tr>
          <td><c:out value="${almacenamiento.getIdAlma()}"></c:out></td>
          <td><c:out value="${almacenamiento.getModelo()}"></c:out></td>
          <td><c:out value="${almacenamiento.getCapacidad()}"></c:out></td>
          <td><c:out value="${almacenamiento.getPrecio()}"></c:out></td>
          <td><c:out value="${almacenamiento.getTipo()}"></c:out></td>
          <td> <a href="eliminarAlma?id=${almacenamiento.getIdAlma()}">Eliminar</a> </td>
        </tr>
      </c:forEach>
    </table>
  </section>
</main>

</body>
</html>
