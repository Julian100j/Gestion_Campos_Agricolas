package Servlets;

import Mundo.GestionarCampos;
import Mundo.Usuario;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//Julian Ceballos y Juan Zambrano

// Servlet para registrar usuarios
public class RegistroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identificacion = request.getParameter("identificacion");
        String nombre = request.getParameter("nombre");
        String contrasena = request.getParameter("contrasena");

        // Guardar usuario en usuarios.txt
        Usuario nuevoUsuario = new Usuario(identificacion, nombre, contrasena);
        GestionarCampos.guardarUsuario(nuevoUsuario, "usuarios.txt");

        // Redireccionar al login
        response.sendRedirect("login.jsp");
    }
}
