/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mundo;

//Julian Ceballos y Juan Zambrano

public class NodoDoble {
    private CampoAgricola campo;
    private NodoDoble siguiente;
    private NodoDoble anterior;

    public NodoDoble(CampoAgricola campo) {
        this.campo = campo;
        this.siguiente = null;
        this.anterior = null;
    }

    public CampoAgricola getCampo() {
        return campo;
    }

    public NodoDoble getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(NodoDoble siguiente) {
        this.siguiente = siguiente;
    }

    public NodoDoble getAnterior() {
        return anterior;
    }

    public void setAnterior(NodoDoble anterior) {
        this.anterior = anterior;
    }
}
