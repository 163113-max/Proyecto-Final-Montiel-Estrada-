<%-- 
    Document   : empleado
    Created on : 7 ene 2026, 10:28:24?a.m.
    Author     : Alexis Montiel
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>
<%@page session="true"%>


<%
    if(session.getAttribute("rol") == null || 
       !session.getAttribute("rol").equals("empleado")) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Inicializar carrito si no existe
    if(session.getAttribute("carrito") == null){
        session.setAttribute("carrito", new ArrayList<Map<String,Object>>());
    }

    ArrayList<Map<String,Object>> carrito =
        (ArrayList<Map<String,Object>>) session.getAttribute("carrito");
%>

<%@include file="header.jsp"%>


<h2>Empleado: <%= session.getAttribute("nombre") %></h2>

<hr>



<h3>Agregar producto al pedido</h3>

<div class="form-container">
<form action="agregarProducto.jsp" method="post">
    Producto:<br>
    <input type="text" name="producto" required><br>

    Precio:<br>
    <input type="number" step="0.01" name="precio" required><br>

    Cantidad:<br>
    <input type="number" name="cantidad" required><br><br>

    <input type="submit" value="Agregar" class="agregar">

</form>
</div>

<hr>

<h3>Productos del pedido</h3>

<table border="1">
<tr>
    <th>Producto</th>
    <th>Precio</th>
    <th>Cantidad</th>
    <th>Subtotal</th>
    <th>Acción</th>
</tr>

<%
    double total = 0;
    int index = 0;

    for(Map<String,Object> item : carrito){
        double subtotal = (Double) item.get("subtotal");
        total += subtotal;
%>
<tr>
    <td><%= item.get("producto") %></td>
    <td>$<%= item.get("precio") %></td>
    <td><%= item.get("cantidad") %></td>
    <td>$<%= subtotal %></td>
    <td>
        <form action="eliminarProducto.jsp" method="post" style="display:inline;">
            <input type="hidden" name="index" value="<%= index %>">
            <input type="submit" value="Eliminar" class="eliminar">
        </form>
    </td>
</tr>
<%
        index++;
    }
%>

<tr>
    <td colspan="4"><b>Total</b></td>
    <td><b>$<%= total %></b></td>
</tr>
</table>


<hr>

<form action="guardarPedidoFinal.jsp" method="post">
    Nombre del Cliente:<br>
    
    <input type="text" name="cliente" required><br><br>

    <input type="submit" value="Confirmar pedido" class="confirmar">
</form>

<hr>




<%@include file="footer.jsp"%>
