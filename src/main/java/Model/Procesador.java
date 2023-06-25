package Model;

public class Procesador {
    private int id_Procesador;
    private String modelo;
    private int precio;

    public Procesador(int id_Procesador, String modelo, int precio) {
        this.id_Procesador = id_Procesador;
        this.modelo = modelo;
        this.precio = precio;
    }

    public int getId_Procesador() {
        return id_Procesador;
    }

    public String getModelo() {
        return modelo;
    }

    public int getPrecio() {
        return precio;
    }
}
