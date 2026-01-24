<%-- 
    Document   : articulos
    Created on : 19 ene 2026, 6:15:56 p.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>

<%
    if(session.getAttribute("rol") == null || 
       !session.getAttribute("rol").equals("editor")) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<%@include file="header.jsp"%>

<h2 style="text-align:center;">Publicar Artículo</h2>

<%
    // Si viene del formulario, guarda en BD
    if(request.getParameter("titulo") != null) {

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
    }
%>

<!-- CONTENEDOR CENTRADO -->
<div style="display:flex; justify-content:center; margin-top:30px;">

    <form method="guardarArticulo.jsp" style="width:60%;">

        Título:<br>
        <input type="text" name="titulo" required
               style="width:100%; padding:8px;"><br><br>

        Contenido:<br>
        <textarea name="contenido" rows="8" cols="60" required
                  style="width:100%; padding:8px;"></textarea><br><br>

        <div style="text-align:center;">
            <input type="submit" value="Publicar"
                   style="background:#28a745;color:white;border:none;
                          padding:8px 20px;border-radius:5px;
                          cursor:pointer;">
        </div>

    </form>
</div>
