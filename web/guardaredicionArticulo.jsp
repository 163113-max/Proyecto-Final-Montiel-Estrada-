<%-- 
    Document   : guardaredicionArticulo
    Created on : 20 ene 2026, 9:37:13 a.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String titulo = request.getParameter("titulo");
    String contenido = request.getParameter("contenido");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa?useSSL=false&serverTimezone=UTC",
            "umontielis",
            "UDL123"
        );

        PreparedStatement ps = cn.prepareStatement(
            "UPDATE articulos SET titulo=?, contenido=? WHERE id_articulo=?"
        );

        ps.setString(1, titulo);
        ps.setString(2, contenido);
        ps.setInt(3, id);

        ps.executeUpdate();
        cn.close();

        response.sendRedirect("articulos.jsp");

    } catch(Exception e){
        out.println("ERROR: " + e.getMessage());
    }
%>
