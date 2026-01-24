<%-- 
    Document   : nuevoArticulo
    Created on : 19 ene 2026, 5:34:44 p.m.
    Author     : Alexis Montiel
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>

<%
    // Solo EDITOR puede guardar
    if(session.getAttribute("rol") == null || 
       !session.getAttribute("rol").equals("editor")) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Si no vienen datos, redirige al formulario
    if(request.getParameter("titulo") == null) {
        response.sendRedirect("publicarArticulo.jsp");
        return;
    }

    String titulo = request.getParameter("titulo");
    String contenido = request.getParameter("contenido");
    int idAutor = Integer.parseInt(session.getAttribute("id_usuario").toString());

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa?useSSL=false&serverTimezone=UTC",
            "umontielis",
            "UDL123"
        );

        String sql = "INSERT INTO articulos (titulo, contenido, estado, id_autor) VALUES (?,?,?,?)";
        PreparedStatement ps = cn.prepareStatement(sql);

        ps.setString(1, titulo);
        ps.setString(2, contenido);
        ps.setString(3, "PUBLICADO");
        ps.setInt(4, idAutor);

        ps.executeUpdate();
        cn.close();

        response.sendRedirect("articulos.jsp");

    } catch(Exception e) {
        out.println("ERROR: " + e.getMessage());
    }
%>
