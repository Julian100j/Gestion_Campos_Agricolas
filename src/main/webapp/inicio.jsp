<%-- 
    Document   : inicio
    Created on : 17/10/2024, 1:50:02?p.?m.
    Author     : Julian Ceballos y Juan Zambrano
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Gestión de Campos Agrícolas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f5f7;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .banner {
            background: url('https://www.shutterstock.com/image-photo/golden-hour-light-casting-over-600nw-2465691597.jpg') no-repeat center center;
            background-size: cover;
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        .banner h1 {
            font-size: 4.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.7);
        }
        .section-title {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .features {
            margin-top: 40px;
        }
        .features .feature-item {
            text-align: center;
            margin-bottom: 30px;
        }
        .features .feature-item i {
            font-size: 3.5rem;
            color: #007bff;
            margin-bottom: 15px;
        }
        .features .feature-item img {
            width: 300px;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-top: 15px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        footer {
            margin-top: 50px;
            padding: 30px 0;
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

<!-- Banner -->
<div class="banner">
    <h1>Bienvenido a la Gestión de Campos Agrícolas</h1>
</div>

<!-- Autores -->
<center>
    <div class="col-md-4 feature-item mt-5">
        <div class="card text-center">
            <div class="card-body">
                <i class="bi bi-people" style="font-size: 2rem;"></i>
                <h3 class="card-title">Hecho por:</h3>
                <p class="card-text">Julian Ceballos y Juan Zambrano</p>
            </div>
        </div>
    </div>
</center>

<!-- Sección de Descripción -->
<div class="container mt-5">
    <div class="text-center">
        <h2 class="section-title">Optimiza la Gestión de Tus Campos</h2>
        <p class="lead">
            Nuestra plataforma te permite gestionar todos los aspectos de tu campo agrícola de manera eficiente y rápida.
            Desde la planificación de la siembra hasta la supervisión de la producción, contarás con herramientas avanzadas 
            que te ayudarán a obtener mejores resultados y a aprovechar al máximo cada hectárea de tierra.
        </p>
        
        <img src="https://img.freepik.com/fotos-premium/agronomo-evaluando-exuberantes-campos-soya-serenidad-agricultura-concepto-practicas-agricolas-gestion-cultivos-esforzos-sostenibilidad-agricultura-serena-viejas-agronomia-investigacion_864588-70263.jpg" alt="Descripción de la imagen" width="1000" height="500">

    </div>
    

    <!-- Características -->
    <div class="row features">
        <div class="col-md-4 feature-item">
            <i class="bi bi-speedometer2"></i>
            <h3>Rendimiento</h3>
            <p>Optimiza la productividad de tu campo agrícola implementando prácticas modernas de gestión y monitoreo.</p>
            <img src="https://www.bizneo.com/blog/wp-content/uploads/2021/01/gestio%CC%81n-del-rendimiento.jpg" alt="Imagen de rendimiento">
        </div>
        <div class="col-md-4 feature-item">
            <i class="bi bi-geo-alt"></i>
            <h3>Ubicación y Control</h3>
            <p>Monitorea la ubicación de cada uno de tus campos y lleva un registro detallado de sus condiciones y producción.</p>
            <img src="https://concepto.de/wp-content/uploads/2019/11/Mapas-1-e1722604464723.jpg" alt="Imagen de ubicación y control">
        </div>
        <div class="col-md-4 feature-item">
            <i class="bi bi-people"></i>
            <h3>Equipo y Personal</h3>
            <p>Organiza y gestiona eficientemente tu equipo de trabajo, garantizando el uso adecuado de tus recursos humanos.</p>
            <img src="https://www.medvidasalud.com/wp-content/uploads/epp-medvida-salud-ocupacional.webp" alt="Imagen de equipo y personal">
        </div>
        <div class="col-md-4 feature-item mt-4">
            <i class="bi bi-bar-chart-line"></i>
            <h3>Reportes y Análisis</h3>
            <p>Genera reportes detallados que te permiten analizar el rendimiento y la productividad de tus campos a lo largo del tiempo.</p>
            <img src="https://paradopolis.es/wp-content/uploads/2023/12/Analisis-y-Reportes-Web-1.jpg" alt="Imagen de reportes y análisis">
        </div>
        <div class="col-md-4 feature-item mt-4">
            <i class="bi bi-globe"></i>
            <h3>Sostenibilidad</h3>
            <p>Fomenta prácticas agrícolas sostenibles para proteger el medio ambiente y reducir el impacto ecológico.</p>
            <img src="https://thelogisticsworld.com/wp-content/uploads/2023/07/concepto-de-sustentabilidad-828x548.jpg" alt="Imagen de sostenibilidad">
        </div>
        <div class="col-md-4 feature-item mt-4">
            <i class="bi bi-calendar3"></i>
            <h3>Calendario de Actividades</h3>
            <p>Programa y organiza cada etapa del ciclo de cultivo, optimizando tiempos y recursos para un mayor rendimiento.</p>
            <img src="https://img.freepik.com/vector-gratis/plantilla-diseno-calendario-ano-nuevo-moderno-2022_1017-34368.jpg" alt="Imagen de calendario de actividades">
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>© 2024 Gestión de Campos Agrícolas. Todos los derechos reservados.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css"></script>
</body>
</html>
