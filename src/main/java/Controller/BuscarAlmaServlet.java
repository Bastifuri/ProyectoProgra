package Controller;

import Model.Almacenamiento;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet
public class BuscarAlmaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String modelo = request.getParameter("modelo").toString();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/buscarAlma.jsp");
        if (!modelo.isEmpty()) {
            Almacenamiento almacenamiento = new Almacenamiento(0, modelo, 0, 0);
            ArrayList<Almacenamiento> almacenamientos = almacenamiento.buscarAlma();
            if (almacenamientos.size() != 0) {
                request.setAttribute("almacenamientos", almacenamiento);
            }
        }
    }
}

