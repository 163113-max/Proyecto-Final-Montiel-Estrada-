<%-- 
    Document   : eliminarArticulo
    Created on : 20 ene 2026, 9:38:03 a.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>

<%
    int id = Integer.parseInt(request.getParameter("id_articulo"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa?useSSL=false&serverTimezone=UTC",
            "umontielis",
            "UDL123"
        );

        PreparedStatement ps = cn.prepareStatement(
            "DELETE FROM articulos WHERE id_articulo=?"
        );
        ps.setInt(1, id);

        ps.executeUpdate();
        cn.close();

        response.sendRedirect("articulos.jsp");

    } catch(Exception e){
        out.println("ERROR: " + e.getMessage());
    }
%>
