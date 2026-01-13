<%-- 
    Document   : agregarEmpleado
    Created on : 7 ene 2026, 11:11:57?a.m.
    Author     : Alexis Montiel
--%>
<%@page import="java.sql.*"%>
<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String usuario = request.getParameter("usuario");
    String password = request.getParameter("password");
    String rol = request.getParameter("rol");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa",
            "umontielis",
            "UDL123"
        );

        String sql = "INSERT INTO usuarios(nombre, apellido, usuario, password, rol) VALUES(?,?,?,?,?)";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, nombre);
        ps.setString(2, apellido);
        ps.setString(3, usuario);
        ps.setString(4, password);
        ps.setString(5, rol);

        int n = ps.executeUpdate();
        if(n > 0){
            response.sendRedirect("admin.jsp"); // vuelve al admin y se ve el nuevo usuario
        } else {
            out.println("Error al agregar usuario");
        }

    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    }
%>
