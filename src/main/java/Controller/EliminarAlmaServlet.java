package Controller;

import Model.Almacenamiento;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EliminarAlmaServlet", value = "/eliminarAlma")
public class EliminarAlmaServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        int idAlma = Integer.parseInt(request.getParameter("idAlma"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/buscarAlma.jsp");
        Almacenamiento almacenamiento = new Almacenamiento(idAlma,"","","","");
        if(almacenamiento.eliminarAlma()){
            request.setAttribute("status", "Se ha eliminado correctamente el almacenamiento");
        }else{
            request.setAttribute("status","No se pudo realizar la acción");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
