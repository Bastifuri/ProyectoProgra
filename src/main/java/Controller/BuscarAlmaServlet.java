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

@WebServlet(name = "BuscarAlmaServlet", value = ("/buscarAlma"))
public class BuscarAlmaServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String modelo = request.getParameter("modelo");
        String capacidad = request.getParameter("capacidad");
        String precio = request.getParameter("precio");
        String tipo = request.getParameter("tipo");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/buscarAlma.jsp");
        if (!modelo.isEmpty() || !capacidad.isEmpty() || !tipo.isEmpty()) {
            Almacenamiento almacenamiento = new Almacenamiento(0, modelo, capacidad, precio, tipo);
            ArrayList<Almacenamiento> almacenamientos = almacenamiento.buscarAlma();
            if (almacenamientos.size() != 0) {
                request.setAttribute("almacenamientos", almacenamientos);
                System.out.println("aasdas");
            }
        }
        requestDispatcher.forward(request, response);
    }
}

