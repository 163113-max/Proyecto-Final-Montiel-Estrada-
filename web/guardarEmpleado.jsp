<%-- 
    Document   : guardarEmpleado
    Created on : 12 ene 2026, 2:58:33?p.m.
    Author     : Alexis Montiel
--%>
<%@page session="true"%>
<%@page import="java.sql.*"%>

<%
    if(session.getAttribute("rol") == null || 
       !session.getAttribute("rol").equals("admin")) {
        response.sendRedirect("index.jsp");
        return;
    }

    int id = 0;
    try {
        id = Integer.parseInt(request.getParameter("id_usuario"));
    } catch(Exception ex) {
        out.println("ID de usuario inválido.");
        return;
    }

    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String usuario = request.getParameter("usuario");
    String password = request.getParameter("password");
    String nuevoRol = request.getParameter("rol");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa",
            "umontielis",
            "UDL123"
        );

        PreparedStatement ps = cn.prepareStatement(
            "UPDATE usuarios SET nombre=?, apellido=?, usuario=?, password=?, rol=? WHERE id_usuario=?"
        );

        ps.setString(1, nombre);
        ps.setString(2, apellido);
        ps.setString(3, usuario);
        ps.setString(4, password);
        ps.setString(5, nuevoRol);
        ps.setInt(6, id);

        ps.executeUpdate();

        ps.close();
        cn.close();

        response.sendRedirect("verEmpleados.jsp");

    } catch(Exception e){
        out.println("Error al guardar cambios: " + e.getMessage());
    }
%>
