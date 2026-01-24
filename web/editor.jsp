<%-- 
    Document   : editor
    Created on : 19 ene 2026, 6:04:58 p.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    // Solo editor puede entrar
    if(session.getAttribute("rol") == null || 
       !session.getAttribute("rol").equals("editor")) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<%@include file="header.jsp"%>

<h2 style="text-align:center;">Panel del Editor</h2>

<!-- CONTENEDOR CENTRADO -->
<div style="display:flex; justify-content:center; margin-top:30px;">

    <!-- PANEL -->
    <div class="panel-editor" style="width:70%; display:flex; justify-content:space-around;">

        <div class="opcion" style="text-align:center;">
            <h3>📌 Publicar Artículo</h3>
            <p>Crear un nuevo artículo para la plataforma.</p>
            <a href="articulos.jsp"
               style="display:inline-block;
                      background:#28a745;
                      color:white;
                      padding:10px 20px;
                      border-radius:5px;
                      text-decoration:none;
                      font-weight:bold;">
               Publicar
            </a>
        </div>

        <div class="opcion" style="text-align:center;">
            <h3>📌 Mis Artículos</h3>
            <p>Ver, editar o eliminar tus artículos publicados.</p>
            <a href="misArticulos.jsp"
               style="display:inline-block;
                      background:#007bff;
                      color:white;
                      padding:10px 20px;
                      border-radius:5px;
                      text-decoration:none;
                      font-weight:bold;">
               Mis artículos
            </a>
        </div>

    </div>
</div>
