<%-- 
    Document   : catalogo
    Created on : 19 ene 2026, 1:29:00 p.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <title>Catálogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ventanas.css">

```
<style>
    .catalogo-container {
        padding: 30px;
    }

    .seccion {
        margin-bottom: 40px;
    }

    .seccion h2 {
        border-bottom: 2px solid #ccc;
        padding-bottom: 10px;
    }

    .items {
        display: flex;
        gap: 20px;
        margin-top: 20px;
    }

    .item {
        border: 1px solid #ddd;
        padding: 15px;
        width: 200px;
        text-align: center;
        border-radius: 8px;
    }

    /* MENSAJE FLOTANTE */
    .mensaje-flotante {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #333;
        color: #fff;
        padding: 15px 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        z-index: 999;
        animation: fadeIn 1s;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
```

</head>
<body>

<%@include file="header.jsp"%>

<div class="catalogo-container">

```
<!-- SECCIÓN LIBROS -->
<div class="seccion">
    <h2>📚 Libros</h2>
    <div class="items">
        <div class="item">
            <strong>Libro 1</strong><br>
            Introducción a TI
        </div>
        <div class="item">
            <strong>Libro 2</strong><br>
            Programación Básica
        </div>
    </div>
</div>

<!-- SECCIÓN CURSOS -->
<div class="seccion">
    <h2>🎓 Cursos</h2>
    <div class="items">
        <div class="item">
            <strong>Curso 1</strong><br>
            Java para principiantes
        </div>
        <div class="item">
            <strong>Curso 2</strong><br>
            Bases de Datos
        </div>
    </div>
</div>
```

</div>

<!-- MENSAJE FLOTANTE -->

<div class="mensaje-flotante">
    Solo contamos con pedidos en tienda física,<br>
    disculpa las molestias.
</div>

</body>
</html>

