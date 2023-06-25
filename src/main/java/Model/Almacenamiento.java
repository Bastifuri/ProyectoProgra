package Model;

import Model.Data.DAO.almacenamientoDAO;
import Model.Data.DBConnector;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.util.ArrayList;

public class Almacenamiento {
    private int Id_alma;
    private String Modelo;
    private int Capacidad;
    private int Precio;

    public Almacenamiento(int id_alma, String modelo, int capacidad, int precio) {
        Id_alma = id_alma;
        Modelo = modelo;
        Capacidad = capacidad;
        Precio = precio;
    }

    public int getId_alma() {
        return Id_alma;
    }

    public void setId_alma(int id_alma) {
        Id_alma = id_alma;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String modelo) {
        Modelo = modelo;
    }

    public int getCapacidad() {
        return Capacidad;
    }

    public void setCapacidad(int capacidad) {
        Capacidad = capacidad;
    }

    public int getPrecio() {
        return Precio;
    }

    public void setPrecio(int precio) {
        Precio = precio;
    }
    public boolean agregarAlmacenamiento(){
        Connection connection = DBConnector.connection("jbem","root","");
        DSLContext query = DSL.using(connection);
        return  new almacenamientoDAO().agregarAlma(this, query);
    }
    public ArrayList<Almacenamiento> buscarAlma(){
        Connection connection = DBConnector.connection("jbem", "root","");
        DSLContext query = DSL.using(connection);
        System.out.println("asds");
        return new almacenamientoDAO().buscarAlma(this, query);
    }

    public boolean modificarAlma(){
        Connection connection = DBConnector.connection("jbem", "root", "");
        DSLContext query = DSL.using(connection);
        System.out.println("ddda");
        return new almacenamientoDAO().modificarAlma(this, query);
    }
}
