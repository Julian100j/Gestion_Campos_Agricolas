/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mundo;

//Julian Ceballos y Juan Zambrano

public class NodoSimple {
    private CampoAgricola campo;
    private NodoSimple siguiente;

    public NodoSimple(CampoAgricola campo) {
        this.campo = campo;
        this.siguiente = null;
    }

    public CampoAgricola getCampo() {
        return campo;
    }

    public NodoSimple getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(NodoSimple siguiente) {
        this.siguiente = siguiente;
    }
}
