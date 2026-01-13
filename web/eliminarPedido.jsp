<%-- 
    Document   : eliminarPedido
    Created on : 7 ene 2026, 12:49:27?p.m.
    Author     : Alexis Montiel
--%>

<%@page import="java.sql.*"%>
<%@page session="true"%>

<%
    int idPedido = Integer.parseInt(request.getParameter("id"));

    Connection conexion = null;
    PreparedStatement ps = null;

    Class.forName("com.mysql.jdbc.Driver");
    conexion = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tienda_ropa",
        "umontielis",
        "UDL123"
    );

    conexion.setAutoCommit(false);

    ps = conexion.prepareStatement(
        "DELETE FROM detalle_pedido WHERE id_pedido = ?"
    );
    ps.setInt(1, idPedido);
    ps.executeUpdate();

    ps = conexion.prepareStatement(
        "DELETE FROM pedidos WHERE id_pedido = ?"
    );
    ps.setInt(1, idPedido);
    ps.executeUpdate();

    conexion.commit();

    ps.close();
    conexion.close();

    response.sendRedirect("verPedidosEmpleado.jsp");
%>

