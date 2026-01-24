<%-- 
    Document   : editarEmpleado
    Created on : 12 ene 2026, 2:58:04?p.m.
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

    int id_usuario = 0;
    try {
        id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
    } catch(Exception ex) {
        out.println("ID de usuario inválido.");
        return;
    }

    String nombre = "";
    String apellido = "";
    String usuario = "";
    String password = "";
    String rolEmpleado = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tienda_ropa",
            "umontielis",
            "UDL123"
        );

        PreparedStatement ps = cn.prepareStatement(
            "SELECT nombre, apellido, usuario, password, rol FROM usuarios WHERE id_usuario=?"
        );
        ps.setInt(1, id_usuario);
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            nombre = rs.getString("nombre");
            apellido = rs.getString("apellido");
            usuario = rs.getString("usuario");
            password = rs.getString("password");
            rolEmpleado = rs.getString("rol");
        } else {
            out.println("Empleado no encontrado.");
            return;
        }

        rs.close();
        ps.close();
        cn.close();

    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    }
%>

<%@include file="header.jsp"%>

<h2 style="text-align:center;">Editar Empleado</h2>

<div class="form-container">
  <form action="guardarEmpleado.jsp" method="post">
        <input type="hidden" name="id_usuario" value="<%= id_usuario %>">

        <label>Nombre</label>
        <input type="text" name="nombre" value="<%= nombre %>" required>

        <label>Apellido</label>
        <input type="text" name="apellido" value="<%= apellido %>" required>

        <label>Usuario</label>
        <input type="text" name="usuario" value="<%= usuario %>" required>

        <label>Password</label>
        <input type="password" name="password" value="<%= password %>" required>

        <label>Rol</label>
        <select name="rol">
            <option value="admin" <%= rolEmpleado.equals("admin")?"selected":"" %>>Admin</option>
            <option value="empleado" <%= rolEmpleado.equals("empleado")?"selected":"" %>>Empleado</option>
           <option value="editor" <%= rolEmpleado.equals("editor")?"selected":"" %>>Editor</option>
        </select>

        <input type="submit" value="Guardar cambios" class="boton-verde">
  </form>
</div>

<%@include file="footer.jsp"%>
