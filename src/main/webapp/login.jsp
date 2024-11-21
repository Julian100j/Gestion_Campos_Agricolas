<%-- 
    Document   : newjsplogin
    Created on : 13/11/2024, 9:59:34 p. m.
    Author     : Julian Ceballos y Juan Zambrano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Inicio de Sesión</title>
        <style>
            body {
                background-color: #f4f5f7; 
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .form-container {
                width: 90%;
                max-width: 400px;
                background-color: #ffffff;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }
            .form-header {
                background: #0056b3; /* Azul más oscuro para contraste */
                color: #fff;
                padding: 20px;
                text-align: center;
            }
            .form-header h2 {
                margin: 0;
                font-size: 1.5rem;
                font-weight: bold;
            }
            .form-body {
                padding: 20px;
            }
            .form-control {
                border-radius: 10px;
                height: 45px;
                margin-bottom: 15px;
            }
            .btn-primary {
                width: 100%;
                background-color: #0056b3; /* Azul más oscuro */
                border: none;
                border-radius: 10px;
                height: 45px;
                font-size: 1rem;
                font-weight: 500;
            }
            .btn-primary:hover {
                background-color: #003d80;
            }
            .footer-text {
                text-align: center;
                margin-top: 10px;
                font-size: 0.9rem;
            }
            .footer-text a {
                color: #0056b3;
                text-decoration: none;
            }
            .footer-text a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <div class="form-header">
                <h2>Inicio de Sesion</h2>
            </div>
            <div class="form-body">
                <form action="LoginServlet" method="POST">
                    <div class="form-group">
                        <label for="identificacion">Identificación:</label>
                        <input type="text" class="form-control" id="identificacion" name="identificacion" required>
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Contraseña:</label>
                        <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                </form>
                <p class="footer-text">No tienes Cuenta? <a href="registro.jsp">Registrate</a></p>
            </div>
        </div>
    </body>
</html>
