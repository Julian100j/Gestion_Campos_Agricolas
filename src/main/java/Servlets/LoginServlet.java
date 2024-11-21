package Servlets;

import Mundo.GestionarCampos;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

//Julian Ceballos y Juan Zambrano

// Servlet para iniciar sesión
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identificacion = request.getParameter("identificacion");
        String contrasena = request.getParameter("contrasena");

        // Validar usuario en usuarios.txt
        if (GestionarCampos.validarUsuario(identificacion, contrasena, "usuarios.txt")) {
            // Guardar la identificación en la sesión
            HttpSession session = request.getSession();
            session.setAttribute("identificacion", identificacion);
            response.sendRedirect("index.jsp");
        } else {
            // Redireccionar de nuevo al login con un mensaje de error
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
