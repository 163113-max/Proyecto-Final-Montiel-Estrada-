<%-- 
    Document   : guardarPedido
    Created on : 7 ene 2026, 11:53:47 a.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="conexion.jsp"%>

<%
int idEmpleado = (Integer) session.getAttribute("id_usuario");
String cliente = request.getParameter("cliente");

PreparedStatement ps = conexion.prepareStatement(
    "INSERT INTO pedidos (id_empleado, cliente, fecha_pedido, total) VALUES (?, ?, NOW(), 0)",
    Statement.RETURN_GENERATED_KEYS
);

ps.setInt(1, idEmpleado);
ps.setString(2, cliente);
ps.executeUpdate();

ResultSet rs = ps.getGeneratedKeys();
if (rs.next()) {
    session.setAttribute("id_pedido", rs.getInt(1));
}

response.sendRedirect("agregarProducto.jsp");
%>
