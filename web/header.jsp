<%-- 
    Document   : header
    Created on : 7 ene 2026, 1:37:46 p.m.
    Author     : Alexis Montiel
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/ventanas.css">
<link rel="stylesheet"
 href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<div class="header">
    <div class="header-left">        
        <img src="img/ame.png" class="logo" alt="Logo">
    </div>

    <div class="header-center">
        <span class="titulo-sistema">Sistema de Pedidos</span>

        <%
            String rolHeader = (String) session.getAttribute("rol");
            if ("admin".equals(rolHeader)) {
        %>
            <a href="admin.jsp">Inicio</a>
            <a href="verEmpleados.jsp">Editar Personal</a>
        <%
            } else if ("empleado".equals(rolHeader)) {
        %>
            <a href="empleado.jsp">Inicio</a>
            <a href="verPedidosEmpleado.jsp">Pedidos</a>
        <%
            }
        %>
    </div>

    <div class="header-right">
        <span class="usuario">
            <i class="bi bi-person-circle icono-usuario"></i>
            <%= session.getAttribute("nombre") %>
        </span>

        <a class="logout" href="logout.jsp">Salir</a>
    </div>
</div>
