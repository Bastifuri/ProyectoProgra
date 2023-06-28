package Model;

import Model.Data.DAO.UsuarioDAO;
import Model.Data.DBConnector;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.util.ArrayList;

public class Usuario {
    String nombre;
    String Rut;
    String password;

    public Usuario(String nombre, String rut, String password) {
        this.nombre = nombre;
        Rut = rut;
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRut() {
        return Rut;
    }

    public void setRut(String rut) {
        Rut = rut;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public boolean registrarUsuario(){
        Connection connection = DBConnector.connection("jbem","root","");
        DSLContext query = DSL.using(connection);
        System.out.println("a");
        return new UsuarioDAO().registrarUsuario(this,query);
    }
    public ArrayList<Usuario> obtenerUsuario(){
        Connection connection = DBConnector.connection("jbem","root","");
        DSLContext query = DSL.using(connection);
        ArrayList<Usuario> usuarios = new UsuarioDAO().obtenerUsuarios(this,query);
        System.out.println("a");
        return usuarios;
    }
}
