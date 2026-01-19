<%-- 
    Document   : mantenimiento
    Created on : 19 ene 2026, 2:22:25 p.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>En mantenimiento</title>

<!-- Bootstrap Icons -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
    body {
        margin: 0;
        height: 100vh;
        font-family: Arial, Helvetica, sans-serif;
        background: linear-gradient(135deg, #1f2a36, #34495e);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .card-mantenimiento {
        background-color: #ffffff;
        padding: 40px;
        max-width: 500px;
        width: 90%;
        text-align: center;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    }

    .card-mantenimiento i {
        font-size: 60px;
        color: #f39c12;
        margin-bottom: 20px;
    }

    .card-mantenimiento h1 {
        margin: 0;
        font-size: 28px;
        color: #2c3e50;
    }

    .card-mantenimiento p {
        margin-top: 15px;
        font-size: 16px;
        color: #555555;
        line-height: 1.6;
    }

    .btn-regresar {
        display: inline-block;
        margin-top: 25px;
        padding: 12px 24px;
        background-color: #1f2a36;
        color: #ffffff;
        text-decoration: none;
        border-radius: 25px;
        transition: background-color 0.3s ease;
    }

    .btn-regresar:hover {
        background-color: #00bcd4;
    }
</style>


</head>

<body>


<div class="card-mantenimiento">
    <i class="bi bi-tools"></i>

    <h1>¡Disculpa las molestias!</h1>

    <p>
        Estamos trabajando para mejorar y brindarte un mejor servicio.
        Muy pronto esta sección estará disponible.
    </p>

    <a href="${pageContext.request.contextPath}/index.jsp" class="btn-regresar">
        Volver al inicio
    </a>
</div>


</body>
</html>
