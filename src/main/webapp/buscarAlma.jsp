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
</head>
<body>
<main>
  <section>
    <form action="BuscarAlmaServlet" method="post">
      <input name="modelo" placeholder="Ingresa Modelo" type="text" required>
      <button type="submit">Buscar</button>
    </form>
    <section>
      <table>
        <tr>
          <th>Id</th>
          <th>Modelo</th>
          <th>Capacidad</th>
          <th>Precio</th>
        </tr>
        <c:forEach items="${almacenamientos}" var="almacenamiento">
          <td><c:out value="${almacenamiento.getId_alma}"></c:out> </td>
          <td><c:out value="${almacenamiento.getModelo}"></c:out> </td>
          <td><c:out value="${almacenamiento.getCapacidad}"></c:out> </td>
          <td><c:out value="${almacenamiento.getPrecio}"></c:out> </td>
        </c:forEach>
      </table>
    </section>
  </section>
</main>
</body>
</html>
