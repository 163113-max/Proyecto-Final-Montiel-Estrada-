<%-- 
    Document   : admin
    Created on : 7 ene 2026, 10:27:49?a.m.
    Author     : Alexis Montiel
--%>
<%@page session="true"%>
<%@page import="java.sql.*"%>

<%
    if(session.getAttribute("rol") == null || 
       !session.getAttribute("rol").equals("admin")) {
        response.sendRedirect("index.jsp");
    }
%>


<%@include file="header.jsp"%>
<h2>Bienvenido, <%= session.getAttribute("nombre") %> <%= session.getAttribute("apellido") %></h2>



<br><br>

<!-- Panel de agregar usuario con botón de cerrar -->
<div id="panelAgregar">
    <h3>Agregar nuevo usuario</h3>
    
    <div class="form-container">

    <form action="guardarUsuario.jsp" method="post">
        Nombre:<br>
        <input type="text" name="nombre" required><br><br>

        Apellido:<br>
        <input type="text" name="apellido" required><br><br>

        Usuario:<br>
        <input type="text" name="usuario" required><br><br>

        Password:<br>
        <input type="password" name="password" required><br><br>

        Rol:<br>
        <select name="rol" required>
            <option value="admin">Admin</option>
    <option value="empleado">Empleado</option>
    <option value="edit">Edi</option>
        </select><br><br>

        <input type="submit" value="Agregar Usuario">
      
    </form>
</div>

<hr>

<h3>Lista de Usuarios</h3>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa",
            "umontielis",
            "UDL123"
        );

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("SELECT id_usuario, nombre, apellido, usuario, rol FROM usuarios");

        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Usuario</th><th>Rol</th><th>Acciones</th></tr>");
        while(rs.next()){
            int id = rs.getInt("id_usuario");
            out.println("<tr>");
            out.println("<td>" + id + "</td>");
            out.println("<td>" + rs.getString("nombre") + "</td>");
            out.println("<td>" + rs.getString("apellido") + "</td>");
            out.println("<td>" + rs.getString("usuario") + "</td>");
            out.println("<td>" + rs.getString("rol") + "</td>");
            // Botón eliminar
            out.println("<td>");
            out.println("<form action='eliminarUsuario.jsp' method='post' style='display:inline;'>");
            out.println("<input type='hidden' name='id_usuario' value='" + id + "'>");
            out.println("<input type='submit' value='Eliminar' class='eliminar' onclick='return confirm(\"¿Seguro que deseas eliminar este usuario?\");'>");
            out.println("</form>");
            out.println("</td>");
            out.println("</tr>");
        }
        out.println("</table>");

    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    }
%>


<%@include file="footer.jsp"%>
