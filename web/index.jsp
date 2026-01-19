<%-- 
    Document   : index
    Created on : 10 nov 2025, 1:20:29?p.m.
    Author     : Alexis Montiel
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>

<!DOCTYPE html>

<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap 5.3 CDN -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
/>

<!-- Google Font -->
<link
  href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900&display=swap"
  rel="stylesheet"
/>

<!-- CSS de la plantilla -->
<link rel="stylesheet" href="css/blog.css" />

</head>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


<body>
    
    <!-- HEADER -->
<%@include file="header.jsp"%>

<!-- BARRA DE NAVEGACIÓN INFERIOR -->

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" >Menu</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="mantenimiento.jsp">Quiénes somos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="mantenimiento.jsp">Articulos</a>
        </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle"
           href="#"
           role="button"
           data-bs-toggle="dropdown"
           aria-expanded="false">
            Catálogo
        </a>

        <ul class="dropdown-menu">
            <li>
                <a class="dropdown-item" href="catalogo.jsp">
                    Cursos
                </a>
            </li>
            <li>
                <a class="dropdown-item" href="catalogo.jsp">
                    Libros
                </a>
            </li>
        </ul>
    </li>

</ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

</div>

<!-- CONTENIDO PRINCIPAL -->
<main class="container mt-4">

    <!-- HERO -->
   
<!-- CONTENIDO PRINCIPAL -->

<main class="container mt-4">


<!-- HERO -->
<div class="p-4 p-md-5 mb-4 rounded text-body-emphasis bg-body-secondary">
    <div class="row align-items-center">

        <!-- TEXTO IZQUIERDA -->
        <div class="col-lg-6">
            <h1 class="display-4 fst-italic">
                Introducción a la Inteligencia Artificial
            </h1>

            <p class="lead my-3">
                La Inteligencia Artificial (IA) es una rama de la informática que se encarga de desarrollar sistemas
                capaces de realizar tareas que normalmente requieren inteligencia humana, como aprender, analizar
                información, reconocer patrones y tomar decisiones.
            </p>

            <p class="lead mb-0">
                <a href="articulo1.jsp" class="text-body-emphasis fw-bold">
                    Continuar leyendo…
                </a>
            </p>
        </div>

        <!-- IMAGEN DERECHA -->
        <div class="col-lg-6">
            <img src="img/ia.png"
                 alt="Inteligencia Artificial"
                 class="img-fluid rounded w-100"
                 style="max-height: 400px; object-fit: contain;">
        </div>

    </div>
</div>


</main>




    <!-- CONTENIDO -->
    <div class="row">
        <div class="col-md-8">
            <article class="blog-post">
                <h2 class="display-5 link-body-emphasis mb-1">
                    ¿Qué es la IA Generativa?
                </h2>
                <p class="blog-post-meta">
                    Enero 2026 · por <a href="mantenimiento.jsp">Anaid M</a>
                 </p>
            
                    La inteligencia artificial generativa permite crear
                    texto, imágenes y código a partir de datos de
                    entrenamiento avanzados.
                </p>

<p class="lead mb-0">
                <a href="mantenimiento.jsp" class="text-body-emphasis fw-bold">
                    Continuar leyendo…
                </a>
            </p>            </article>
        </div>

        <div class="col-md-4">
            <div class="p-4 mb-3 bg-body-tertiary rounded">
                <h4 class="fst-italic">Acerca de</h4>
                <p class="mb-0">
                    Plataforma dedicada a la difusión y comercialización
                    de contenido educativo en Inteligencia Artificial.
                </p>
            </div>
        </div>
    </div>

    <!-- ARTÍCULOS RECIENTES -->
    <div class="mt-4">
        <h4 class="fst-italic mb-3">Artículos recientes</h4>

        <div class="row row-cols-1 row-cols-md-3 g-3">

            <div class="col">
                <div class="card h-100 shadow-sm">
                    <img src="https://via.placeholder.com/400x250"
                         class="card-img-top" alt="Artículo 1">
                    <div class="card-body">
                        <h6 class="card-title">
                            IA en los negocios
                        </h6>
                        <p class="card-text small text-body-secondary">
                            15 de enero de 2026
                        </p>
                        <a href="mantenimiento.jsp" class="stretched-link"></a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card h-100 shadow-sm">
                    <img src="https://via.placeholder.com/400x250"
                         class="card-img-top" alt="Artículo 2">
                    <div class="card-body">
                        <h6 class="card-title">
                            Ética y riesgos de la IA
                        </h6>
                        <p class="card-text small text-body-secondary">
                            14 de enero de 2026
                        </p>
                        <a href="mantenimiento.jsp" class="stretched-link"></a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card h-100 shadow-sm">
                    <img src="https://via.placeholder.com/400x250"
                         class="card-img-top" alt="Artículo 3">
                    <div class="card-body">
                        <h6 class="card-title">
                            Cursos de IA recomendados
                        </h6>
                        <p class="card-text small text-body-secondary">
                            13 de enero de 2026
                        </p>
                        <a href="mantenimiento.jsp" class="stretched-link"></a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</main>



<!-- FOOTER -->
<<%@include file="footer.jsp"%>


</body>
</html>
