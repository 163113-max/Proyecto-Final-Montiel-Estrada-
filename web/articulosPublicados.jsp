<%-- 
    Document   : articulosPublicados
    Created on : 20 ene 2026, 9:56:13 a.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>

<%@include file="header.jsp"%>

<h2 style="text-align:center;">Artículos Publicados</h2>

<div style="display:flex; justify-content:center; margin-top:20px;">
    <table border="1" cellpadding="10" style="border-collapse:collapse; width:80%; text-align:center;">
        <tr style="background-color:#f2f2f2;">
            <th>ID</th>
            <th>Autor</th>
            <th>Título</th>
            <th>Texto</th>
            <th>Fecha</th>
        </tr>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa?useSSL=false&serverTimezone=UTC",
            "umontielis",
            "UDL123"
        );

        // SOLO artículos publicados
        String sql = "SELECT a.id_articulo, a.titulo, a.contenido, u.nombre, u.apellido, a.fecha_publicacion " +
                     "FROM articulos a " +
                     "JOIN usuarios u ON a.id_autor = u.id_usuario " +
                     "WHERE a.estado = 'PUBLICADO' " +
                     "ORDER BY a.fecha_publicacion DESC";

        PreparedStatement ps = cn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
%>
        <tr>
            <td><%= rs.getInt("id_articulo") %></td>
            <td><%= rs.getString("nombre") + " " + rs.getString("apellido") %></td>
            <td><%= rs.getString("titulo") %></td>
            <td style="text-align:left;"><%= rs.getString("contenido") %></td>
            <td><%= rs.getTimestamp("fecha_publicacion") %></td>
        </tr>
<%
        }

        cn.close();

    } catch(Exception e) {
        out.println("ERROR: " + e.getMessage());
    }
%>

    </table>
</div>