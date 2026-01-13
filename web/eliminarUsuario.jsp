<%-- 
    Document   : eliminarUsuario
    Created on : 7 ene 2026, 11:46:06 a.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>


<%
    // Validar que solo admin pueda ejecutar la eliminación
    if(session.getAttribute("rol") == null || 
       !session.getAttribute("rol").equals("admin")) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Obtener el id del usuario desde el formulario
    String idUsuario = request.getParameter("id_usuario");

    if(idUsuario != null && !idUsuario.isEmpty()){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tienda_ropa",
                "umontielis",
                "UDL123"
            );

            String sql = "DELETE FROM usuarios WHERE id_usuario=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(idUsuario));

            int n = ps.executeUpdate();

            if(n > 0){
                // Si se eliminó correctamente, volver a admin.jsp
                response.sendRedirect("admin.jsp");
            } else {
                out.println("No se pudo eliminar el usuario.");
            }

        } catch(Exception e){
            out.println("Error: " + e.getMessage());
        }
    } else {
        out.println("ID de usuario no válido.");
    }
%>
