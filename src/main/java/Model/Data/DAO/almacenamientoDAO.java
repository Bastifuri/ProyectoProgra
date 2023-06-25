package Model.Data.DAO;

import Model.Almacenamiento;
import org.jooq.DSLContext;
import org.jooq.Result;
import org.jooq.impl.DSL;

import java.util.ArrayList;
import java.util.List;

public class almacenamientoDAO {


        /* Metodo para agregar a la BD que recibe los parametros query y almacenamiento que es un objeto de la clase Almacenamientos*/
    public boolean agregarAlma(Almacenamiento almacenamiento, DSLContext query) {

        /*Se obtiene el nombre del modelo del objeto almacenamiento y se le asigna la variable modelo*/
        String modelo = almacenamiento.getModelo();
        int capacidad = almacenamiento.getCapacidad();
        int precio = almacenamiento.getPrecio();
        int result = 0;

        /*Con el objeto query se realiza la insercion de datos en la tabla almacenamientos con el insertInto y esta diciendo que ingrese a la tabla almacenamientos
        * y define tambien los nombres de las columnas de la tabla*/
        try {
            result = query.insertInto(DSL.table("almacenamientos"),
                            DSL.field("Id_alma"),
                            DSL.field("Modelo"),
                            DSL.field("Capacidad"),
                            DSL.field("Precio"))
                    /*en values añade los valores a las tablas, null es para id autoincrementable*/
                    .values(null, modelo, capacidad, precio).execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
        /*Aqui se verifica si se añadio 1 fila a la tabla mediante el result == 1, si es si etnonces es true sino false*/
        return result==1;
    }

    public ArrayList<Almacenamiento> buscarAlma(Almacenamiento almacenamiento, DSLContext query) {
        String modelo = almacenamiento.getModelo();
        int capacidad = almacenamiento.getCapacidad();
        Result results = query
                .select()
                .from(DSL.table("almacenamientos"))
                .where(DSL.field("Modelo").eq(modelo)
                        .or(DSL.field("Capacidad").eq(capacidad))).fetch();
        ArrayList<Almacenamiento> almaEncontrados = new ArrayList<>();
        for (int i = 0; i < results.size(); i++){
            almaEncontrados.add(new Almacenamiento(
                    (Integer) results.getValue(i,"Id_alma"),
                    (String) results.getValue(i,"Modelo"),
                    (Integer) results.getValue(i,"Capacidad"),
                    (Integer) results.getValue(i,"Precio")
            ));
        }
        return almaEncontrados;
    }

    public boolean modificarAlma(Almacenamiento almacenamiento, DSLContext query) {
        return false;
    }

}



