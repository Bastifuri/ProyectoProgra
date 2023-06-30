package Controller;

import Model.Almacenamiento;
import Model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AgregarAlmaServlet", value = "/agregarAlma")
public class AgregarAlmaServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/buscarAlma.jsp");
        requestDispatcher.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String modelo = request.getParameter("modelo");
        String capacidad = request.getParameter("capacidad");
        String precio = request.getParameter("precio");
        String tipo = request.getParameter("tipo");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("buscarAlma.jsp");
        try {
            if(!modelo.isEmpty() && !capacidad.isEmpty() && !precio.isEmpty() && !tipo.isEmpty()){
                Almacenamiento almacenamiento = new Almacenamiento(0,modelo,capacidad,precio,tipo);
                if (almacenamiento.registrarAlma()){
                    request.setAttribute("status", "El registro se completo correctamente");
                    requestDispatcher.forward(request,response);
                }
            }else{
                request.setAttribute("status", "Complete todos los campos");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
