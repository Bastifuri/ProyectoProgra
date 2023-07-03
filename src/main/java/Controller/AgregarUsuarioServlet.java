package Controller;

import Model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AgregarUsuarioServlet", value = "/agregarusuario")
public class AgregarUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rut = request.getParameter("rut");
        String nombre = request.getParameter("nombre");
        String password = request.getParameter("password");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        try {
            if (!rut.isEmpty() && !nombre.isEmpty() && !password.isEmpty()) {
                Usuario usuario = new Usuario(rut, nombre, password);
                if (usuario.registrarUsuario()) {
                    request.setAttribute("status", "El registro se completó correctamente");
                    response.sendRedirect("exito.jsp");
                } else {
                    request.setAttribute("status", "No se pudo completar el registro");
                    response.sendRedirect("error.jsp");
                }
            } else {
                request.setAttribute("status", "Complete todos los campos");
                response.sendRedirect("error.jsp");
            }
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
