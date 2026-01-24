<%-- 
    Document   : misArticulos
    Created on : 19 ene 2026, 6:03:02 p.m.
    Author     : Alexis Montiel
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page session="true"%>

<%@include file="header.jsp"%>

<h2 style="text-align:center;">Artículos</h2>

<div style="display:flex; justify-content:center; margin-top:20px;">
    <table border="1" cellpadding="10" style="border-collapse:collapse; width:80%; text-align:center;">
        <tr style="background-color:#f2f2f2;">
            <th>ID</th>
            <th>Título</th>
            <th>Autor</th>
            <th>Fecha</th>
            <th>Contenido</th>
            <th>Acciones</th>
        </tr>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa?useSSL=false&serverTimezone=UTC",
            "umontielis",
            "UDL123"
        );

        String sql = "SELECT a.id_articulo, a.titulo, a.contenido, u.nombre, u.apellido, a.fecha_publicacion, a.estado " +
                     "FROM articulos a " +
                     "JOIN usuarios u ON a.id_autor = u.id_usuario " +
                     "ORDER BY a.fecha_publicacion DESC";

        PreparedStatement ps = cn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
%>
        <tr>
            <td><%= rs.getInt("id_articulo") %></td>
            <td><%= rs.getString("titulo") %></td>
            <td><%= rs.getString("nombre") + " " + rs.getString("apellido") %></td>
            <td><%= rs.getTimestamp("fecha_publicacion") %></td>
            <td><%= rs.getString("contenido") %></td>
            <td style="white-space:nowrap;">
                <!-- BOTÓN EDITAR -->
                <a href="editarArticulo.jsp?id=<%= rs.getInt("id_articulo") %>" 
                   style="background:#007bff;color:white;padding:5px 10px;border-radius:5px;text-decoration:none;margin-right:5px;display:inline-block;">
                   Editar
                </a>

                <!-- BOTÓN ELIMINAR -->
                <form action="eliminarArticulo.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="id_articulo" value="<%= rs.getInt("id_articulo") %>">
                    <input type="submit" value="Eliminar" 
                           style="background:#dc3545;color:white;border:none;padding:5px 10px;border-radius:5px;cursor:pointer;"
                           onclick="return confirm('¿Seguro que deseas eliminar este artículo?');">
                </form>
            </td>
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
