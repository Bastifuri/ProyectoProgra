package Model;

import Model.Data.DAO.almacenamientoDAO;
import Model.Data.DBConnector;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.util.ArrayList;

public class Almacenamiento {
        private int idAlma;
        private String modelo;
        private String capacidad;
        private String precio;
        private String tipo;

    public Almacenamiento(int idAlma, String modelo, String capacidad, String precio, String tipo) {
        this.idAlma = idAlma;
        this.modelo = modelo;
        this.capacidad = capacidad;
        this.precio = precio;
        this.tipo = tipo;
    }

    public int getIdAlma() {
        return idAlma;
    }

    public void setIdAlma(int idAlma) {
        this.idAlma = idAlma;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(String capacidad) {
        this.capacidad = capacidad;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean registrarAlma(){
        Connection connection = DBConnector.connection("jbem","root","");
        DSLContext query = DSL.using(connection);
        return new almacenamientoDAO().registrarAlma(this, query);
    }
    public ArrayList<Almacenamiento> buscarAlma(){
        System.out.println("buscarAlma");
        Connection connection = DBConnector.connection("jbem","root","");
        DSLContext query = DSL.using(connection);
        ArrayList<Almacenamiento> almacenamientos = new almacenamientoDAO().buscarAlma(this,query);
        System.out.println("Ya se obtuvieron los almacenamientos");
        return almacenamientos;
    }

    public boolean eliminarAlma(){
        Connection connection = DBConnector.connection("jbem","root","");
        DSLContext query = DSL.using(connection);
        return new almacenamientoDAO().eliminarAlma(query,this);
    }

}
