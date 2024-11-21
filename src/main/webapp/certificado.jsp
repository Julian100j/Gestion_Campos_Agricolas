<%-- 
    Document   : certificado
    Created on : 18/11/2024, 5:49:23 p. m.
    Author     : Julian Ceballos Y Juan Zambrano
--%>

<%@page import="Mundo.CampoAgricola"%>
<%@page import="Mundo.GestionarCampos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombreCampo = request.getParameter("nombre");
    boolean esDoble = Boolean.parseBoolean(request.getParameter("esDoble"));
    
    GestionarCampos gestionarCampos = (GestionarCampos) application.getAttribute("gestionarCampos");
    if (gestionarCampos == null) {
        gestionarCampos = new GestionarCampos();
        application.setAttribute("gestionarCampos", gestionarCampos);
    }

    CampoAgricola campo = gestionarCampos.obtenerCampo(nombreCampo, esDoble);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Certificado de Propiedad</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        .certificado-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .certificado-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .certificado-title {
            font-size: 24px;
            font-weight: bold;
        }
        .certificado-content {
            font-size: 18px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="certificado-container">
        <div class="certificado-header">
            <h1 class="certificado-title">Certificado de Propiedad</h1>
            <h2>Alcaldía de <%= campo.getUbicacion() %></h2>
        </div>
        <div class="certificado-content">
            <p>
                Certificamos que el Sr./Sra. <strong><%= campo.getPropietario() %></strong> es propietario del campo agrícola 
                denominado <strong><%= campo.getNombre() %></strong>, ubicado en <strong><%= campo.getUbicacion() %></strong> 
                a una altitud de <strong><%= campo.getAltitud() %> metros</strong>.
            </p>
            <p>
                Tipo de Cultivo: <strong><%= campo.getTipoSemilla() %></strong><br>
                Producción: <strong><%= campo.getProduccion() %> Kg</strong><br>
            </p>
            <div class="text-center">
                <img src="<%= campo.getImagen() %>" alt="Imagen del campo" class="img-fluid mt-3" style="max-width: 100%;"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
