<%-- 
    Document   : verTicket
    Created on : 7 ene 2026, 1:19:32 p.m.
    Author     : Alexis Montiel
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@include file="header.jsp"%>

<%
    int idPedido = Integer.parseInt(request.getParameter("id"));

    Connection conexion = null;
    PreparedStatement psPedido = null;
    PreparedStatement psDetalle = null;
    ResultSet rp = null;
    ResultSet rd = null;

    Class.forName("com.mysql.jdbc.Driver");
    conexion = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tienda_ropa",
        "umontielis",
        "UDL123"
    );

    psPedido = conexion.prepareStatement(
        "SELECT * FROM pedidos WHERE id_pedido = ?"
    );
    psPedido.setInt(1, idPedido);
    rp = psPedido.executeQuery();
    rp.next();
%>

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f5f5f5;
        margin: 20px;
    }

    .ticket {
        background-color: #fff;
        padding: 30px;
        max-width: 600px;
        margin: auto;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }

    h2 {
        text-align: center;
        color: #0a1f44; /* azul marino */
        margin-bottom: 20px;
    }

    .info {
        margin-bottom: 20px;
    }

    .info b {
        display: inline-block;
        width: 120px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #0a1f44;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .total {
        text-align: right;
        font-size: 1.2em;
        font-weight: bold;
        color: #0a1f44;
    }
</style>

<div class="ticket">
    <h2>🧾 TICKET DE VENTA</h2>

    <div class="info">
        <p><b>Pedido:</b> <%= idPedido %></p>
        <p><b>Cliente:</b> <%= rp.getString("cliente") %></p>
        <p><b>Fecha:</b> <%= rp.getString("fecha_pedido") %></p>
    </div>

    <table>
        <tr>
            <th>Producto</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
        </tr>
        <%
            psDetalle = conexion.prepareStatement(
                "SELECT * FROM detalle_pedido WHERE id_pedido = ?"
            );
            psDetalle.setInt(1, idPedido);
            rd = psDetalle.executeQuery();

            while(rd.next()){
        %>
        <tr>
            <td><%= rd.getString("producto") %></td>
            <td>$<%= String.format("%.2f", rd.getDouble("precio")) %></td>
            <td><%= rd.getInt("cantidad") %></td>
            <td>$<%= String.format("%.2f", rd.getDouble("subtotal")) %></td>
        </tr>
        <%
            }
        %>
    </table>

    <p class="total">Total: $<%= String.format("%.2f", rp.getDouble("total")) %></p>
</div>

<%
    rd.close();
    rp.close();
    psDetalle.close();
    psPedido.close();
    conexion.close();
%>

<%@include file="footer.jsp"%>
