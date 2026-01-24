<%-- 
    Document   : verEmpleados
    Created on : 7 ene 2026, 5:18:31?p.m.
    Author     : Alexis Montiel
--%>

<%@page session="true"%>
<%@page import="java.sql.*"%>

<%
    // Solo admin puede acceder
    if(session.getAttribute("rol") == null || 
       !session.getAttribute("rol").equals("admin")) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>

<%@include file="header.jsp"%>

<h2 style="text-align:center;">Usuarios</h2>

<div style="text-align:center; margin-bottom:20px;">
    <!-- Botones para mostrar Empleados o Admins -->
    <a href="verEmpleados.jsp?tipo=empleado" 
       style="background:#007bff;color:white;padding:8px 15px;border-radius:5px;text-decoration:none;margin-right:10px;">Empleados</a>
    <a href="verEmpleados.jsp?tipo=admin" 
       style="background:#28a745;color:white;padding:8px 15px;border-radius:5px;text-decoration:none;">Admins</a>
        <a href="verEmpleados.jsp?tipo=editor" 
       style="background:#007bff;color:white;padding:8px 15px;border-radius:5px;text-decoration:none;">Editor</a>
</div>

<%
    String tipo = request.getParameter("tipo");
    if(tipo == null) tipo = "empleado"; // por defecto muestra empleados

    Class.forName("com.mysql.jdbc.Driver");
    Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tienda_ropa",
        "umontielis",
        "UDL123"
    );

    Statement st = cn.createStatement();
    ResultSet rs = st.executeQuery(
        "SELECT id_usuario, nombre, apellido, usuario FROM usuarios WHERE rol='" + tipo + "'"
    );

    // Tabla centrada y estilizada
    out.println("<table style='margin:auto; border-collapse:collapse; width:80%;'>");
    out.println("<tr style='background-color:#0a1f44; color:white;'>");
    out.println("<th>ID</th>");
    out.println("<th>Nombre</th>");
    out.println("<th>Apellido</th>");
    out.println("<th>Usuario</th>");
    out.println("<th>Acción</th>");
    out.println("</tr>");

    while(rs.next()){
        int id = rs.getInt("id_usuario");
        String nombre = rs.getString("nombre");
        String apellido = rs.getString("apellido");
        String usuario = rs.getString("usuario");

        out.println("<tr style='text-align:center;'>");
        out.println("<td>" + id + "</td>");
        out.println("<td>" + nombre + "</td>");
        out.println("<td>" + apellido + "</td>");
        out.println("<td>" + usuario + "</td>");

        out.println("<td style='white-space:nowrap;'>");
        // BOTÓN EDITAR
        out.println("<a href='editarEmpleado.jsp?id_usuario=" + id + "' " +
                    "style='background:#007bff;color:white;padding:5px 10px;border-radius:5px;text-decoration:none;margin-right:5px;display:inline-block;'>Editar</a>");
        // BOTÓN ELIMINAR
        out.println("<form action='eliminarUsuario.jsp' method='post' style='display:inline;'>");
        out.println("<input type='hidden' name='id_usuario' value='" + id + "'>");
        out.println("<input type='submit' value='Eliminar' " +
                    "style='background:#dc3545;color:white;border:none;padding:5px 10px;border-radius:5px;cursor:pointer;' " +
                    "onclick=\"return confirm('¿Seguro que deseas eliminar este usuario?');\">");
        out.println("</form>");
        out.println("</td>");
        out.println("</tr>");
    }

    out.println("</table>");

    rs.close();
    st.close();
    cn.close();
%>

<%@include file="footer.jsp"%>
