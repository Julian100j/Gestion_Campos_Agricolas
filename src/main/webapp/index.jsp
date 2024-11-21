<%-- 
    Document   : index
    Created on : 14/10/2024, 6:23:13 p. m.
    Author     : Julian Ceballos y Juan Zambrano
--%>

<%@page import="java.util.List"%>
<%@page import="Mundo.CampoAgricola"%>
<%@page import="Mundo.GestionarCampos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Inicializar el objeto de gestión de campos si no está creado
    GestionarCampos gestionarCampos = (GestionarCampos) application.getAttribute("gestionarCampos");
    if (gestionarCampos == null) {
        gestionarCampos = new GestionarCampos();
        application.setAttribute("gestionarCampos", gestionarCampos);
    }

    // Obtener si es lista doble o simple
    boolean esDoble = request.getParameter("esDoble") != null && request.getParameter("esDoble").equals("true");
    String tipoLista = esDoble ? "Lista Doble" : "Lista Simple";
    List<CampoAgricola> listaCampos = gestionarCampos.obtenerLista(esDoble); // Verifica que este método funcione correctamente.
    String errorMessage = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Campos Agrícolas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f5f7;
        }
        .navbar {
            background-color: #007bff;
            color: white;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .header-img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        .container-intro {
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 20px;
        }
        .container-intro h2 {
            color: #007bff;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn {
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            opacity: 0.8;
        }
        .alert {
            display: none;
        }
        footer {
            margin-top: 40px;
            padding: 20px 0;
            background-color: #007bff;
            color: white;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="inicio.jsp">Gestión de Campos Agrícolas</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="inicio.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Campos Agrícolas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contacto.jsp">Contacto</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Imagen destacada -->
<img src="https://img.freepik.com/fotos-premium/paneles-solares-integrados-tierras-cultivo-doble-beneficio-generacion-energia-sombreado-cultivos-concepto-integracion-granja-solar-energia-renovable-sombreado-cultivos-agricultura-sostenible_864588-262358.jpg" alt="Campo Agricola" class="header-img">

<center>
    <div class="col-md-4 feature-item">
        <div class="card text-center">
            <div class="card-body">
                <i class="bi bi-people" style="font-size: 2rem;"></i> <!-- Ajusta el tamaño del ícono si es necesario -->
                <h3 class="card-title">Hecho por:</h3>
                <p class="card-text">Julian Ceballos y Juan Zambrano</p>
            </div>
        </div>
    </div>
</center>
<!-- Contenedor de bienvenida -->
<div class="container mt-5 container-intro">
    <h2>Bienvenido a la Gestión de Campos Agrícolas</h2>
    <p>En esta página puedes gestionar de manera eficiente y fácil los diferentes campos agrícolas, ya sea mediante una lista simple o doble. Administra la información de los campos, incluyendo nombre, propietario, ubicación, altitud, tipo de semilla y producción.</p>
    <p>Selecciona el tipo de lista que deseas usar y comienza a agregar, editar o eliminar los campos agrícolas segun los departamentos disponibles (Nariño o Cauca).</p>
</div>

<!-- Contenedor principal -->
<div class="container">
    <h3 class="text-center mb-4">Campos Agrícolas - <%= tipoLista %></h3>

    <div class="alert alert-danger" <% if (errorMessage == null) { %> style="display:none;" <% } %> >
        <%= errorMessage != null ? "Error al realizar la operación. Por favor, inténtalo de nuevo." : "" %>
    </div>

    <div class="text-center mb-4">
        <form action="gestionarCampos" method="post">
            <input type="hidden" name="accion" value="agregar">
            <button type="submit" class="btn btn-primary btn-lg">Agregar un nuevo Campo Agrícola</button>
        </form>
    </div>

    <!-- Selector de lista -->
    <div class="d-flex justify-content-between mb-4">
        <form method="get" action="index.jsp" class="form-inline">
            <label for="esDoble" class="mr-2">Mostrar Lista del departamento de:</label>
            <select class="form-control" id="esDoble" name="esDoble" onchange="this.form.submit()">
                <option value="false" <%= !esDoble ? "selected" : "" %>>Nariño</option>
                <option value="true" <%= esDoble ? "selected" : "" %>>Cauca</option>
            </select>
        </form>
    </div>

    <!-- Tabla de campos agrícolas -->
    <table class="table table-striped table-bordered">
        <thead class="table-light">
            <tr>
                <th>Nombre</th>
                <th>Propietario</th>
                <th>Ubicación</th>
                <th>Altitud</th>
                <th>Tipo de Semilla</th>
                <th>Producción</th>
                <th>Imagen</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (CampoAgricola campo : listaCampos) {
            %>
            <tr>
                <td><%= campo.getNombre() %></td>
                <td><%= campo.getPropietario() %></td>
                <td><%= campo.getUbicacion() %></td>
                <td><%= campo.getAltitud() %></td>
                <td><%= campo.getTipoSemilla() %></td>
                <td><%= campo.getProduccion() %> Kg</td>
                <td><img src="<%= campo.getImagen() %>" alt="Imagen del campo" class="img-fluid" style="max-width: 200px;"/></td>
                <td>
                    <form action="editarCampo.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="nombre" value="<%= campo.getNombre() %>">
                        <input type="hidden" name="esDoble" value="<%= esDoble %>">
                        <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                    </form>
                    <form action="gestionarCampos" method="post" style="display:inline;">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="nombre" value="<%= campo.getNombre() %>">
                        <input type="hidden" name="esDoble" value="<%= esDoble %>">
                        <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                    </form>
                        <form action="certificado.jsp" method="get" style="display:inline;">
                       <input type="hidden" name="nombre" value="<%= campo.getNombre() %>">
                     <input type="hidden" name="esDoble" value="<%= esDoble %>">
                      <button type="submit" class="btn btn-success btn-sm">Generar Certificado</button>
                      </form>

                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
       



<!-- Footer -->
<footer>
    <p>© 2024 Gestión de Campos Agrícolas. Todos los derechos reservados.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
