<%-- 
    Document   : editarCampo
    Created on : 14/10/2024, 6:24:27 p. m.
    Author     : Julian Ceballos y Juan Zambrano
--%>

<%@ page import="Mundo.CampoAgricola" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String nombreCampo = request.getParameter("nombre");
    boolean esDoble = Boolean.parseBoolean(request.getParameter("esDoble"));

    // Obtener el campo agrícola a editar
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
    <title>Editar Campo Agrícola</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-size: 1.1rem;
        }
        .container {
            margin-top: 40px;
            max-width: 700px;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: bold;
            color: #333;
        }
        h2 {
            font-size: 2rem;
            color: #007bff;
            font-weight: bold;
        }
        .btn-primary, .btn-secondary {
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">Editar Campo Agrícola</h2>
   
    <center>
        <img src="https://cdn.wikifarmer.com/wp-content/uploads/2023/04/agricultura-de-precision-tecnologias.jpg" 
             alt="Descripción de la imagen" width="800" height="400" class="img-fluid rounded mb-4">
    </center>

    <form action="gestionarCampos" method="post">
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="nombreOriginal" value="<%= campo.getNombre() %>">
        <input type="hidden" name="esDoble" value="<%= esDoble %>">
        
        <div class="mb-3">
            <label class="form-label">Editar campo en:</label><br>
            <input type="radio" id="nariñoRadio" name="esDoble" value="false" <%= !esDoble ? "checked" : "" %> > Nariño<br>
            <input type="radio" id="caucaRadio" name="esDoble" value="true" <%= esDoble ? "checked" : "" %> > Cauca
        </div>
        
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre del campo agrícola:</label>
            <input type="text" class="form-control" name="nombre" value="<%= campo.getNombre() %>" required>
        </div>

        <div class="mb-3">
            <label for="propietario" class="form-label">Propietario:</label>
            <input type="text" class="form-control" name="propietario" value="<%= campo.getPropietario() %>" required>
        </div>

        <div class="mb-3">
            <label for="ubicacion">Ubicación (Municipio):</label>
            <select class="form-control" id="ubicacion" name="ubicacion" required>
                <option value="<%= campo.getUbicacion() %>" selected><%= campo.getUbicacion() %></option>
            </select>
        </div>

        <div class="mb-3">
            <label for="altitud" class="form-label">Altitud:</label>
            <input type="number" class="form-control" name="altitud" value="<%= campo.getAltitud() %>" required>
        </div>

        <div class="mb-3">
            <label for="tipoSemilla" class="form-label">Tipo de Cultivo:</label>
            <input type="text" class="form-control" name="tipoSemilla" value="<%= campo.getTipoSemilla() %>" required>
        </div>

        <div class="mb-3">
            <label for="produccion" class="form-label">Producción (Kilos):</label>
            <input type="number" class="form-control" name="produccion" value="<%= campo.getProduccion() %>" required>
        </div>

        <div class="mb-3">
            <label for="imagen" class="form-label">Imagen (URL):</label>
            <input type="url" class="form-control" name="imagen" value="<%= campo.getImagen() %>" placeholder="https://ejemplo.com/imagen.jpg" required>
        </div>

        

        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        <a href="index.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<script>
    // Municipios de Nariño y Cauca
    const municipiosNariño = ["Pasto", "Ipiales", "Tumaco", "Tuquerres", "La Cruz", "Sandona", "Barbacoas", "Samaniego", "La Union", "El Tambo"];
    const municipiosCauca = ["Popayan", "Santander de Quilichao", "Puerto Tejada", "Patia", "El Tambo", "Corinto", "Miranda", "Toribio", "Guachene", "Morales"];

    // Elementos HTML
    const ubicacionSelect = document.getElementById('ubicacion');
    const nariñoRadio = document.getElementById('nariñoRadio');
    const caucaRadio = document.getElementById('caucaRadio');

    // Función para actualizar la lista de municipios
    function actualizarMunicipios() {
        ubicacionSelect.innerHTML = ''; // Limpiar opciones anteriores
        
        let municipios;
        if (nariñoRadio.checked) {
            municipios = municipiosNariño;
        } else if (caucaRadio.checked) {
            municipios = municipiosCauca;
        }

        municipios.forEach(municipio => {
            const option = document.createElement('option');
            option.value = municipio;
            option.textContent = municipio;
            ubicacionSelect.appendChild(option);
        });
    }

    // Escuchar el cambio en el tipo de lista (radio buttons)
    nariñoRadio.addEventListener('change', actualizarMunicipios);
    caucaRadio.addEventListener('change', actualizarMunicipios);

    // Inicializar la lista de municipios en Nariño por defecto
    actualizarMunicipios();
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
