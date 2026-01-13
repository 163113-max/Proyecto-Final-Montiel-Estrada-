<%-- 
    Document   : editarPedido
    Created on : 12 ene 2026, 2:39:14?p.m.
    Author     : Alexis Montiel
--%>
<%@page import="java.sql.*"%>
<%@page session="true"%>

<%
    // Validar sesión
    if(session.getAttribute("id_usuario") == null){
        response.sendRedirect("index.jsp");
        return;
    }

    int idPedido = Integer.parseInt(request.getParameter("id"));

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tienda_ropa",
        "umontielis",
        "UDL123"
    );

    // Información general del pedido
    PreparedStatement psPedido = con.prepareStatement(
        "SELECT id_empleado, cliente, fecha_pedido, total FROM pedidos WHERE id_pedido=?"
    );
    psPedido.setInt(1, idPedido);
    ResultSet rsPedido = psPedido.executeQuery();
    rsPedido.next();

    String cliente = rsPedido.getString("cliente");
    String fechaPedido = rsPedido.getString("fecha_pedido");
    double total = rsPedido.getDouble("total");

    rsPedido.close();
    psPedido.close();

    // Productos del pedido
    PreparedStatement psDetalle = con.prepareStatement(
        "SELECT id_detalle, producto, precio, cantidad, subtotal FROM detalle_pedido WHERE id_pedido=?"
    );
    psDetalle.setInt(1, idPedido);
    ResultSet rsDetalle = psDetalle.executeQuery();
%>

<%@include file="header.jsp"%>

<h2 style="text-align:center;">Editar Pedido</h2>

<div class="form-container" style="max-width:700px; margin:auto; padding:20px; border:1px solid #ccc; border-radius:8px; background:#f9f9f9;">
    <form action="actualizarPedido.jsp" method="post">
        <input type="hidden" name="id_pedido" value="<%= idPedido %>">

        <label>Cliente</label>
        <input type="text" name="cliente" value="<%= cliente %>" required>

        <label>Fecha</label>
        <input type="date" name="fecha_pedido" value="<%= fechaPedido %>" required>

        <h3>Productos</h3>
        <table style="width:100%; border-collapse: collapse; margin-bottom: 10px;">
            <tr style="background:#0a1f44; color:white;">
                <th>Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Subtotal</th>
            </tr>
            <%
                while(rsDetalle.next()){
                    int idDetalle = rsDetalle.getInt("id_detalle");
                    String producto = rsDetalle.getString("producto");
                    double precio = rsDetalle.getDouble("precio");
                    int cantidad = rsDetalle.getInt("cantidad");
                    double subtotal = rsDetalle.getDouble("subtotal");
            %>
            <tr>
                <td>
                    <input type="text" name="producto_<%=idDetalle%>" value="<%=producto%>" required>
                </td>
                <td>
                    <input type="number" step="0.01" name="precio_<%=idDetalle%>" value="<%=precio%>" required>
                </td>
                <td>
                    <input type="number" name="cantidad_<%=idDetalle%>" value="<%=cantidad%>" required>
                </td>
                <td>
                    <input type="number" step="0.01" name="subtotal_<%=idDetalle%>" value="<%=subtotal%>" readonly>
                </td>
            </tr>
            <%
                }
                rsDetalle.close();
                psDetalle.close();
                con.close();
            %>
        </table>

        <label>Total</label>
        <input type="number" step="0.01" name="total" value="<%= total %>" readonly>

        <div style="margin-top:20px; text-align:center;">
            <button type="submit" style="background:#28a745;color:white;padding:8px 20px;border:none;border-radius:5px;cursor:pointer;margin-right:10px;">Guardar cambios</button>
            <a href="verPedidosEmpleado.jsp" style="background:#dc3545;color:white;padding:8px 20px;border-radius:5px;text-decoration:none;">Cancelar</a>
        </div>
    </form>
</div>

<%@include file="footer.jsp"%>
