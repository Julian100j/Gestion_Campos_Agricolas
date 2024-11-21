/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mundo;

//Julian Ceballos y Juan Zambrano

import java.util.ArrayList;
import java.util.List;

public class ListaDoble {
    private List<CampoAgricola> campos;

    public ListaDoble() {
        campos = new ArrayList<>();
    }

    public void agregar(CampoAgricola campo) {
        campos.add(campo);
    }

    public void eliminar(String nombre) {
        campos.removeIf(campo -> campo.getNombre().equals(nombre));
    }

    public void editar(String nombreOriginal, CampoAgricola campoEditado) {
        for (int i = 0; i < campos.size(); i++) {
            if (campos.get(i).getNombre().equals(nombreOriginal)) {
                campos.set(i, campoEditado);
                break;
            }
        }
    }

    public CampoAgricola buscar(String nombre) {
        for (CampoAgricola campo : campos) {
            if (campo.getNombre().equals(nombre)) {
                return campo;
            }
        }
        return null;
    }

    public List<CampoAgricola> obtenerCampos() {
        return campos;
    }
}
