package Model.Data.DAO;

import Model.Almacenamiento;
import org.jooq.DSLContext;
import org.jooq.Record;
import org.jooq.Result;
import org.jooq.impl.DSL;

import java.util.ArrayList;
import java.util.List;

public class almacenamientoDAO {
    public boolean registrarAlma(Almacenamiento almacenamiento, DSLContext query) {
        String modeloAlma = almacenamiento.getModelo();
        String capacidadAlma = almacenamiento.getCapacidad();
        String precioAlma = almacenamiento.getPrecio();
        String tipoAlma = almacenamiento.getTipo();
        int result = query.insertInto(DSL.table("almacenamientos"),
                DSL.field("idAlma"),
                DSL.field("modelo"),
                DSL.field("capacidad"),
                DSL.field("precio"),
                DSL.field("tipo")).values(0,modeloAlma,capacidadAlma,precioAlma,tipoAlma).execute();
        return result==1;
    }

    public boolean eliminarAlma(DSLContext query, Almacenamiento almacenamiento) {
        int idAlma = almacenamiento.getIdAlma();
        int result = 0;
        try {
            result = query.deleteFrom(
                    DSL.table("almacenamientos")).where(DSL.field("idAlma").eq(idAlma)).execute();
        }catch (Exception e){
            System.out.println(e);
        }
        return result==1;
    }

    public ArrayList<Almacenamiento> buscarAlma(Almacenamiento almacenamiento, DSLContext query) {
        String modeloAlma = almacenamiento.getModelo();
        String capacidadAlma = almacenamiento.getCapacidad();
        String tipoAlma = almacenamiento.getTipo();

        Result<Record> result = query.select().from(DSL.table("almacenamientos")).where(
                DSL.field("modelo").eq(modeloAlma)).or(DSL.field("capacidad").eq(capacidadAlma)).or(DSL.field("tipo").eq(tipoAlma)).fetch();
        ArrayList<Almacenamiento> almacenamientos = new ArrayList<>();
        System.out.println(result.getValue(0,"idAlma"));
        System.out.println(result.getValue(0,"modelo"));
        System.out.println(result.getValue(0,"capacidad"));
        System.out.println(result.getValue(0,"precio"));
        System.out.println(result.getValue(0,"tipo"));

        for (int i = 0; i < result.size(); i++){
            almacenamientos.add(new Almacenamiento(
                    Integer.parseInt(result.getValue(i,"idAlma").toString()),
                    result.getValue(i,"modelo").toString(),
                    result.getValue(i,"capacidad").toString(),
                    result.getValue(i,"precio").toString(),
                    result.getValue(i,"tipo").toString()));
        }
        return almacenamientos;
    }


    /* Metodo para agregar a la BD que recibe los parametros query y almacenamiento que es un objeto de la clase Almacenamientos*/
    /*public boolean agregarAlma(Almacenamiento almacenamiento, DSLContext query) {

        /*Se obtiene el nombre del modelo del objeto almacenamiento y se le asigna la variable modelo*/
        /*String modelo = almacenamiento.getModelo();
        int capacidad = almacenamiento.getCapacidad();
        int precio = almacenamiento.getPrecio();
        int result = 0;

        /*Con el objeto query se realiza la insercion de datos en la tabla almacenamientos con el insertInto y esta diciendo que ingrese a la tabla almacenamientos
        * y define tambien los nombres de las columnas de la tabla*/
        /*try {
            result = query.insertInto(DSL.table("almacenamientos"),
                            DSL.field("Id_alma"),
                            DSL.field("Modelo"),
                            DSL.field("Capacidad"),
                            DSL.field("Precio"))
                    /*en values añade los valores a las tablas, null es para id autoincrementable*/
                    /*.values(null, modelo, capacidad, precio).execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
        /*Aqui se verifica si se añadio 1 fila a la tabla mediante el result == 1, si es si etnonces es true sino false*/
       /*return result==1;
    }*/


}



