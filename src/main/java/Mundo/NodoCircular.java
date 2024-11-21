/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mundo;

//Julian Ceballos y Juan Zambrano

// NodoCircular para lista circular simple
public class NodoCircular {
    private CampoAgricola campo;
    private NodoCircular siguiente;

    public NodoCircular(CampoAgricola campo) {
        this.campo = campo;
        this.siguiente = this; // Inicialmente apunta a sí mismo
    }

    public CampoAgricola getCampo() {
        return campo;
    }

    public NodoCircular getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(NodoCircular siguiente) {
        this.siguiente = siguiente;
    }
}
