package Model.Data.DAO;

import Model.Procesador;
import org.jooq.DSLContext;
import org.jooq.Record;
import org.jooq.Result;

import java.util.ArrayList;
import java.util.List;

import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class procesadorDAO {
    public static List<Procesador> obtenerproce(DSLContext query) {
        List<Procesador> procesadores = new ArrayList<>();

        // Obtener los datos de la tabla de proces
        Result<Record> result = query.select().from(table(name("procesadores"))).fetch();

        // Recorrer los registros y crear objetos Categoria
        for (Record record : result) {
            int idProce = record.get("Id_proce", Integer.class);
            String modeloProce = record.get("Modelo", String.class);
            int precioProce = record.get("Precio", Integer.class);

            Procesador procesador = new Procesador(idProce, modeloProce,precioProce);
            procesadores.add(procesador);
        }
        System.out.println("addd");
        return procesadores;
    }
}
