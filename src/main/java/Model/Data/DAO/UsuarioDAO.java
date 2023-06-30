package Model.Data.DAO;

import Model.Almacenamiento;
import Model.Usuario;
import org.jooq.*;
import org.jooq.Record;
import org.jooq.impl.DSL;

import java.util.ArrayList;

import static org.jooq.impl.DSL.*;

public class UsuarioDAO {
    public boolean registrarUsuario(Usuario usuario, DSLContext query) {
        String rut = usuario.getRut();
        String nombre = usuario.getNombre();
        String password = usuario.getPassword();
        Table usuarioTabla = table(name("usuario"));
        Field[] columnas = usuarioTabla.fields(
                "rut", "nombre", "password");
        int results = 0;
        try {
            results = query.insertInto(usuarioTabla, columnas[0], columnas[1], columnas[2])
                    .values(rut, nombre, password).execute();
        } catch (Exception e){
            System.err.println("No se pudo ejecutar la consulta : " + e.getMessage());
        }
        return results == 1;
    }

    public ArrayList<Usuario> obtenerUsuarios(Usuario usuario, DSLContext query) {
        String rut = usuario.getRut();
        String password = usuario.getPassword();
        String nombre = usuario.getNombre();

        Result<Record> result = query.select().from(DSL.table("usuario"))
                .where(DSL.field("rut").eq(rut).and(DSL.field("password").eq(password))).or(DSL.field("nombre").eq(nombre)).fetch();

        ArrayList<Usuario> usuarios = new ArrayList<>();
        System.out.println(result.toString());


        for (int i = 0; i < result.size(); i++) {
            usuarios.add(new Usuario(
                    result.getValue(i, "rut").toString(),
                    result.getValue(i, "password").toString(),
                    result.getValue(i, "nombre").toString()));
        }
        return usuarios;
    }
}
