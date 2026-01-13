<%-- 
    Document   : verPedidosEmpleado
    Created on : 7 ene 2026, 12:37:58 p.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page session="true"%>

<%@include file="header.jsp"%>

<%
    if(session.getAttribute("id_usuario") == null){
        response.sendRedirect("index.jsp");
        return;
    }

    int idEmpleado = Integer.parseInt(session.getAttribute("id_usuario").toString());

    Connection conexion = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");
    conexion = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tienda_ropa",
        "umontielis",
        "UDL123"
    );

    String sql = "SELECT * FROM pedidos WHERE id_empleado = ?";
    ps = conexion.prepareStatement(sql);
    ps.setInt(1, idEmpleado);
    rs = ps.executeQuery();
%>

<h2 style="text-align:center;">Mis Pedidos</h2>

<table style="margin:auto; border-collapse:collapse; width:80%;">
<tr style="background-color:#0a1f44; color:white; text-align:center;">
    <th>ID</th>
    <th>Cliente</th>
    <th>Fecha</th>
    <th>Total</th>
    <th>Acciones</th>
</tr>

<%
    while(rs.next()){
        int idPedido = rs.getInt("id_pedido");
%>
<tr style="text-align:center; border-bottom:1px solid #ccc;">
    <td><%= idPedido %></td>
    <td><%= rs.getString("cliente") %></td>
    <td><%= rs.getString("fecha_pedido") %></td>
    <td>$<%= rs.getDouble("total") %></td>
    <td style="white-space:nowrap;">
        <!-- Ver -->
        <a href="verTicket.jsp?id=<%= idPedido %>" 
           style="background:#17a2b8; color:white; padding:5px 10px; border-radius:5px; text-decoration:none; margin-right:5px; display:inline-block;">
           Ver
        </a>

        <!-- Editar -->
        <a href="editarPedido.jsp?id=<%= idPedido %>" 
           style="background:#007bff; color:white; padding:5px 10px; border-radius:5px; text-decoration:none; margin-right:5px; display:inline-block;">
           Editar
        </a>

        <!-- Eliminar -->
        <a href="eliminarPedido.jsp?id=<%= idPedido %>" 
           style="background:#dc3545; color:white; padding:5px 10px; border-radius:5px; text-decoration:none; display:inline-block;"
           onclick="return confirm('¿Eliminar pedido?');">
           Eliminar
        </a>
    </td>
</tr>
<%
    }

    rs.close();
    ps.close();
    conexion.close();
%>
</table>

<%@include file="footer.jsp"%>
