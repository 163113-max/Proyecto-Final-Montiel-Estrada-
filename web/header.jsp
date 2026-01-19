<%--
Document   : header
Created on : 7 ene 2026
Author     : Alexis Montiel
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ventanas.css">
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<%
String rolHeader = (String) session.getAttribute("rol");
%>

<div class="header">


<!-- IZQUIERDA -->
<div class="header-left">
    <% if ("admin".equals(rolHeader)) { %>
        <a href="${pageContext.request.contextPath}/admin.jsp">
            <img src="${pageContext.request.contextPath}/img/ameia.png"
                 class="logo" alt="Logo">
        </a>
    <% } else { %>
        <a href="${pageContext.request.contextPath}/empleado.jsp">
            <img src="${pageContext.request.contextPath}/img/ameia.png"
                 class="logo" alt="Logo">
        </a>
    <% } %>
</div>

<!-- CENTRO -->
<div class="header-center">
    <h1 class="titulo-sistema">IA para Todos</h1>


    <% if ("admin".equals(rolHeader)) { %>
        <a href="${pageContext.request.contextPath}/admin.jsp">Inicio</a>
        <a href="${pageContext.request.contextPath}/verEmpleados.jsp">Editar Personal</a>

    <% } else if ("empleado".equals(rolHeader)) { %>
        <a href="${pageContext.request.contextPath}/empleado.jsp">Inicio</a>
        <a href="${pageContext.request.contextPath}/verPedidosEmpleado.jsp">Pedidos</a>
    <% } %>
</div>

<!-- DERECHA -->
<div class="header-right">
    <% if (rolHeader == null) { %>
        <a href="${pageContext.request.contextPath}/home.jsp" class="login-btn">
            <i class="bi bi-box-arrow-in-right"></i>
            Empleados
        </a>
    <% } else { %>
        <span class="usuario">
            <i class="bi bi-person-circle icono-usuario"></i>
            <%= session.getAttribute("nombre") %>
        </span>

        <a class="logout" href="${pageContext.request.contextPath}/logout.jsp">
            Salir
        </a>
    <% } %>
</div>


</div>
