<%-- 
    Document   : agregarCampo
    Created on : 14/10/2024, 6:35:03 p. m.
    Author     : Julian Ceballos y Juan Zambrano
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Campo Agrícola</title>
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
    <h2 class="text-center mb-4">Agregar Campo Agrícola</h2>
    
    <center>
        <img src="https://jungleworks.com/wp-content/uploads/2020/12/image-10-1024x536.png" 
             alt="Descripción de la imagen" width="800" height="400" class="img-fluid rounded mb-4">
    </center>

    <form action="gestionarCampos" method="post">
        <input type="hidden" name="accion" value="agregar">
        
        <div class="mb-3">
    <label class="form-label">Agregar campo Agrícola en:</label>
    <div class="d-flex flex-column">
        <div class="mb-2">
            <input type="radio" id="nariñoRadio" name="esDoble" value="false" checked> 
            <label for="nariñoRadio">Nariño</label>
        </div>
        <div>
            <input type="radio" id="caucaRadio" name="esDoble" value="true"> 
            <label for="caucaRadio">Cauca</label>
        </div>
    </div>
</div>



        
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre del campo agrícola:</label>
            <input type="text" class="form-control" name="nombre" required>
        </div>

        <div class="mb-3">
            <label for="propietario" class="form-label">Propietario:</label>
            <input type="text" class="form-control" name="propietario" required>
        </div>

        <div class="mb-3">
            <label for="ubicacion" class="form-label">Ubicación (Municipio):</label>
            <select class="form-control" id="ubicacion" name="ubicacion" required></select>
        </div>

        <div class="mb-3">
            <label for="altitud" class="form-label">Altitud:</label>
            <input type="number" class="form-control" name="altitud" required>
        </div>

        <div class="mb-3">
            <label for="tipoSemilla" class="form-label">Tipo de Cultivo:</label>
            <input type="text" class="form-control" name="tipoSemilla" required>
        </div>

        <div class="mb-3">
            <label for="produccion" class="form-label">Producción (Kilos):</label>
            <input type="number" class="form-control" name="produccion" required>
        </div>

        <div class="mb-3">
            <label for="imagen" class="form-label">Imagen (URL):</label>
            <input type="url" class="form-control" name="imagen" placeholder="https://ejemplo.com/imagen.jpg" required>
        </div>

        <div class="d-flex justify-content-center mt-4">
            <button type="submit" class="btn btn-primary me-2">Agregar Campo</button>
            <a href="index.jsp" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>
    
<script>
    const municipiosNariño = ["Pasto", "Ipiales", "Tumaco", "Tuquerres", "La Cruz", "Sandona", "Barbacoas", "Samaniego", "La Union", "El Tambo"];
    const municipiosCauca = ["Popayan", "Santander de Quilichao", "Puerto Tejada", "Patia", "El Tambo", "Corinto", "Miranda", "Toribio", "Guachene", "Morales"];

    const ubicacionSelect = document.getElementById('ubicacion');
    const nariñoRadio = document.getElementById('nariñoRadio');
    const caucaRadio = document.getElementById('caucaRadio');

    function actualizarMunicipios() {
        ubicacionSelect.innerHTML = '';
        let municipios = nariñoRadio.checked ? municipiosNariño : municipiosCauca;
        municipios.forEach(municipio => {
            const option = document.createElement('option');
            option.value = municipio;
            option.textContent = municipio;
            ubicacionSelect.appendChild(option);
        });
    }

    nariñoRadio.addEventListener('change', actualizarMunicipios);
    caucaRadio.addEventListener('change', actualizarMunicipios);
    actualizarMunicipios();
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
