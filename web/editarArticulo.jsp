<%-- 
    Document   : editarArticulo
    Created on : 20 ene 2026, 9:35:59 a.m.
    Author     : Alexis Montiel
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>

<%@include file="header.jsp"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    // Obtener datos actuales
    String titulo = "";
    String contenido = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa?useSSL=false&serverTimezone=UTC",
            "umontielis",
            "UDL123"
        );

        PreparedStatement ps = cn.prepareStatement(
            "SELECT titulo, contenido FROM articulos WHERE id_articulo=?"
        );
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            titulo = rs.getString("titulo");
            contenido = rs.getString("contenido");
        }

        cn.close();

    } catch(Exception e) {
        out.println("ERROR: " + e.getMessage());
    }
%>

<h2 style="text-align:center;">Editar Artículo</h2>

<!-- CONTENEDOR CENTRADO -->
<div style="display:flex; justify-content:center; margin-top:30px;">

    <form method="post" action="guardaredicionArticulo.jsp"
          style="width:60%; text-align:left;">

        <input type="hidden" name="id" value="<%= id %>">

        <label>Título:</label><br>
        <input type="text" name="titulo" value="<%= titulo %>" required
               style="width:100%; padding:8px;"><br><br>

        <label>Contenido:</label><br>
        <textarea name="contenido" rows="8" required
                  style="width:100%; padding:8px;"><%= contenido %></textarea><br><br>

        <!-- BOTONES -->
        <div style="text-align:center;">
            <input type="submit" value="Guardar"
                   style="background:#007bff;color:white;border:none;
                          padding:8px 15px;border-radius:5px;cursor:pointer;">

            <a href="articulos.jsp"
               style="background:#6c757d;color:white;
                      padding:8px 15px;border-radius:5px;
                      text-decoration:none;margin-left:10px;">
               Cancelar
            </a>
        </div>

    </form>
</div>
