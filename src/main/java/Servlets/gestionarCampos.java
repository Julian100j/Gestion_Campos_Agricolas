/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Servlets;

//Julian Ceballos y Juan Zambrano

import Mundo.GestionarCampos;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/gestionarCampos")
public class gestionarCampos extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GestionarCampos gestionarCampos = (GestionarCampos) getServletContext().getAttribute("gestionarCampos");
        if (gestionarCampos == null) {
            gestionarCampos = new GestionarCampos();
            getServletContext().setAttribute("gestionarCampos", gestionarCampos);
        }

        String accion = request.getParameter("accion");
        boolean esDoble = Boolean.parseBoolean(request.getParameter("esDoble"));

        // Solo requerimos el "nombre" y "esDoble" para la eliminación
        if ("eliminar".equals(accion)) {
            String nombre = request.getParameter("nombre");

            if (nombre == null || nombre.trim().isEmpty()) {
                // Redirigir con un error si falta el nombre
                response.sendRedirect("agregarCampo.jsp?error=true");
                return;
            }

            // Ejecutar la eliminación del campo agrícola
            gestionarCampos.eliminarCampo(nombre, esDoble);
            
            // Guardar los cambios después de eliminar
            gestionarCampos.guardarEnArchivo(esDoble);

        } else {
            // Para las otras acciones (agregar, actualizar), validamos todos los parámetros
            String nombre = request.getParameter("nombre");
            String propietario = request.getParameter("propietario");
            String ubicacion = request.getParameter("ubicacion");
            String altitudStr = request.getParameter("altitud");
            String tipoSemilla = request.getParameter("tipoSemilla");
            String produccionStr = request.getParameter("produccion");
            String imagen = request.getParameter("imagen");

            // Comprobar que no hay campos nulos o vacíos
            if (nombre == null || nombre.trim().isEmpty() ||
                propietario == null || propietario.trim().isEmpty() ||
                ubicacion == null || ubicacion.trim().isEmpty() ||
                altitudStr == null || altitudStr.trim().isEmpty() ||
                tipoSemilla == null || tipoSemilla.trim().isEmpty() ||
                produccionStr == null || produccionStr.trim().isEmpty() ||
                imagen == null || imagen.trim().isEmpty()) {
                
                // Redirigir de nuevo al formulario con un mensaje de error
                response.sendRedirect("agregarCampo.jsp?error=true");
                return;
            }

            double altitud;
            int produccion;

            try {
                altitud = Double.parseDouble(altitudStr);
                produccion = Integer.parseInt(produccionStr);
            } catch (NumberFormatException e) {
                // Redirigir de nuevo al formulario en caso de error de formato
                response.sendRedirect("agregarCampo.jsp?error=true");
                return;
            }

            // Realizar la acción correspondiente
            switch (accion) {
                case "agregar":
                    gestionarCampos.agregarCampo(nombre, propietario, ubicacion, altitud, tipoSemilla, produccion, imagen, esDoble);
                    // Guardar los cambios después de agregar
                    gestionarCampos.guardarEnArchivo(esDoble);
                    break;
                case "actualizar":
                    gestionarCampos.editarCampo(
                        request.getParameter("nombreOriginal"),
                        nombre,
                        propietario,
                        ubicacion,
                        altitud,
                        tipoSemilla,
                        produccion,
                        imagen,
                        esDoble
                    );
                    // Guardar los cambios después de actualizar
                    gestionarCampos.guardarEnArchivo(esDoble);
                    break;
                default:
                    // Acciones no reconocidas
                    response.sendRedirect("agregarCampo.jsp?error=true");
                    return;
            }
        }

        // Redirigir de vuelta al index después de la acción
        response.sendRedirect("index.jsp");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
