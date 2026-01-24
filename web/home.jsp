<%-- 
    Document   : home
    Created on : 19 ene 2026, 10:38:13 a.m.
    Author     : Alexis Montiel
--%>

<<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>



<%
    String mensajeError = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {

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

            String sql = "SELECT * FROM usuarios WHERE usuario=? AND password=? AND rol=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, password);
            ps.setString(3, rol);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("id_usuario", rs.getInt("id_usuario"));
                session.setAttribute("usuario", rs.getString("usuario"));
                session.setAttribute("nombre", rs.getString("nombre"));
                session.setAttribute("apellido", rs.getString("apellido"));
                session.setAttribute("rol", rol);

                if ("admin".equals(rol)) {
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("empleado.jsp");
                }
                return;
            } else {
                mensajeError = "Usuario o contraseña incorrectos";
            }

        } catch (Exception e) {
            mensajeError = "Error en el sistema";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
<%@include file="header.jsp"%>
<h2>Acceso al sistema</h2>

<div class="login-container">
<form method="post">
    Usuario:<br>
    <input type="text" name="usuario" required><br><br>

    Password:<br>
    <input type="password" name="password" required><br><br>

    Rol:<br>
    <select name="rol" required>
        <option value="admin">Admin</option>
        <option value="empleado">Empleado</option>
         <option value="editor">Editor</option>
    </select><br><br>

   <input type="submit" value="Ingresar" class="boton-verde">

</form>
    </div>

<%-- ALERTA EMERGENTE --%>
<% if (mensajeError != null) { %>
<script>
    alert("<%= mensajeError %>");
</script>
<% } %>


</body>


</html>

<%@include file="footer.jsp"%>
