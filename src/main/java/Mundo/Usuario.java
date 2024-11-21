/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mundo;

/**
 *
 * @author Julian Ceballos y Juan Zambrano
 */
public class Usuario {
    private String identificacion; // Identificación del usuario
    private String nombre; 
    private String contrasena;

   
    public Usuario(String identificacion, String nombre, String contrasena) {
        this.identificacion = identificacion;
        this.nombre = nombre;
        this.contrasena = contrasena;
    }

        public String getIdentificacion() {
        return identificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public String getContrasena() {
        return contrasena;
    }
}


