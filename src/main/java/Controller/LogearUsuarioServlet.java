package Controller;

import Model.Data.DAO.UsuarioDAO;
import Model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jooq.DSLContext;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LogearUsuarioServlet", value = "/logearusuario")
public class LogearUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        try {
            String rut = request.getParameter("rut");
            String nombre = request.getParameter("nombre");
            String password = request.getParameter("password");

            requestDispatcher = request.getRequestDispatcher("index.jsp");

            if (!rut.isEmpty() && !password.isEmpty()) {
                if (rut.equals("admin") && password.equals("123")) {
                    response.sendRedirect("buscarAlma.jsp");
                } else {
                    Usuario usuario = new Usuario(nombre, rut, password);
                    ArrayList<Usuario> usuarios = usuario.obtenerUsuario();
                    if (usuarios.size() != 0) {
                        request.setAttribute("usuario", usuarios);
                        response.sendRedirect("index1.jsp");
                    } else {
                        // El rut y la contraseña no coinciden con ningún usuario
                        request.setAttribute("error", "Credenciales inválidas");
                        requestDispatcher = request.getRequestDispatcher("error.jsp");
                        requestDispatcher.forward(request, response);
                    }
                }
            } else {
                // Campos requeridos vacíos
                request.setAttribute("error", "Debes completar todos los campos");
                requestDispatcher = request.getRequestDispatcher("error.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
            // Error no controlado
            request.setAttribute("error", "Ha ocurrido un error inesperado");
            requestDispatcher = request.getRequestDispatcher("error.jsp");
            requestDispatcher.forward(request, response);
        }
    }
}
