/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mundo;

import java.io.Serializable;


//Julian Ceballos y Juan Zambrano

    
    public class CampoAgricola implements Serializable {
        
      
      private static final long serialVersionUID = 1L;

    private String nombre;
    private String propietario;
    private String ubicacion;
    private double altitud;
    private String tipoSemilla;
    private int produccion;
    private String imagen;

    public CampoAgricola(String nombre, String propietario, String ubicacion, double altitud, String tipoSemilla, int produccion, String imagen) {
        this.nombre = nombre;
        this.propietario = propietario;
        this.ubicacion = ubicacion;
        this.altitud = altitud;
        this.tipoSemilla = tipoSemilla;
        this.produccion = produccion;
        this.imagen = imagen;
    }

    @Override
    public String toString() {
        return nombre + "," + propietario + "," + ubicacion + "," + altitud + "," + tipoSemilla + "," + produccion + "," + imagen;
    }

    // Getters y Setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public double getAltitud() {
        return altitud;
    }

    public void setAltitud(double altitud) {
        this.altitud = altitud;
    }

    public String getTipoSemilla() {
        return tipoSemilla;
    }

    public void setTipoSemilla(String tipoSemilla) {
        this.tipoSemilla = tipoSemilla;
    }

    public int getProduccion() {
        return produccion;
    }

    public void setProduccion(int produccion) {
        this.produccion = produccion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
