/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mundo;

//Julian Ceballos y Juan Zambrano

import java.util.ArrayList;
import java.util.List;
import java.io.*;

public class ListaCircular {
    private NodoCircular cabeza;

    public ListaCircular() {
        this.cabeza = null;
    }

    public void agregar(CampoAgricola campo) {
        NodoCircular nuevo = new NodoCircular(campo);
        if (cabeza == null) {
            cabeza = nuevo;
        } else {
            NodoCircular temp = cabeza;
            while (temp.getSiguiente() != cabeza) {
                temp = temp.getSiguiente();
            }
            temp.setSiguiente(nuevo);
            nuevo.setSiguiente(cabeza);
        }
    }

    public List<CampoAgricola> obtenerCampos() {
        List<CampoAgricola> campos = new ArrayList<>();
        if (cabeza != null) {
            NodoCircular temp = cabeza;
            do {
                campos.add(temp.getCampo());
                temp = temp.getSiguiente();
            } while (temp != cabeza);
        }
        return campos;
    }

    public void guardarEnArchivo(String rutaArchivo) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(rutaArchivo))) {
            oos.writeObject(obtenerCampos());
        }
    }

    @SuppressWarnings("unchecked")
    public void cargarDesdeArchivo(String rutaArchivo) throws IOException, ClassNotFoundException {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(rutaArchivo))) {
            List<CampoAgricola> campos = (List<CampoAgricola>) ois.readObject();
            for (CampoAgricola campo : campos) {
                agregar(campo);
            }
        }
    }
}
