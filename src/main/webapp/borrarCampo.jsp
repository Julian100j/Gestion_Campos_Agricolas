<%-- 
    Document   : borrarCampo
    Created on : 14/10/2024, 7:42:42 p. m.
    Author     : Julian Ceballos y Juan Zambrano
--%>

<%@page import="Mundo.CampoAgricola"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombreCampo = request.getParameter("nombre");
    boolean esDoble = Boolean.parseBoolean(request.getParameter("esDoble"));

    // Obtener el campo agrícola a eliminar
    CampoAgricola campo = null;
    Mundo.GestionarCampos gestionarCampos = (Mundo.GestionarCampos) application.getAttribute("gestionarCampos");
    if (gestionarCampos == null) {
        gestionarCampos = new Mundo.GestionarCampos();
        application.setAttribute("gestionarCampos", gestionarCampos);
    }
    campo = gestionarCampos.obtenerCampo(nombreCampo, esDoble);

    if (campo == null) {
        // Redirigir si no se encuentra el campo
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eliminar Campo Agrícola</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Eliminar Campo Agrícola</h1>
    <div class="alert alert-warning" role="alert">
        ¿Estás seguro de que deseas eliminar el campo agrícola <strong><%= campo.getNombre() %></strong>?
    </div>
    <form action="gestionarCampos" method="post">
        <input type="hidden" name="accion" value="eliminar">
        <input type="hidden" name="nombre" value="<%= campo.getNombre() %>">
        <input type="hidden" name="esDoble" value="<%= esDoble %>">
        <button type="submit" class="btn btn-danger">Eliminar</button>
        <a href="index.jsp?esDoble=<%= esDoble %>" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
</body>
</html>
