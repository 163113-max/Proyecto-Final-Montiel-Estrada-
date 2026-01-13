<%-- 
    Document   : actualizarPedido
    Created on : 12 ene 2026, 2:40:10?p.m.
    Author     : Alexis Montiel
--%>

<%@page import="java.sql.*"%>
<%@page session="true"%>

<%
if(session.getAttribute("id_usuario") == null){
    response.sendRedirect("index.jsp");
    return;
}

int idEmpleado = Integer.parseInt(session.getAttribute("id_usuario").toString());
int idPedido = Integer.parseInt(request.getParameter("id_pedido"));
String cliente = request.getParameter("cliente");
String fecha = request.getParameter("fecha_pedido");

Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/tienda_ropa",
    "umontielis",
    "UDL123"
);

// 1?? Actualizar detalle_pedido
double total = 0; // acumularemos el total
PreparedStatement psDetalle = null;
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT id_detalle FROM detalle_pedido WHERE id_pedido=" + idPedido);

while(rs.next()){
    int idDetalle = rs.getInt("id_detalle");

    String producto = request.getParameter("producto_" + idDetalle);
    double precio = Double.parseDouble(request.getParameter("precio_" + idDetalle));
    int cantidad = Integer.parseInt(request.getParameter("cantidad_" + idDetalle));
    double subtotal = precio * cantidad;
    total += subtotal;

    psDetalle = con.prepareStatement(
        "UPDATE detalle_pedido SET producto=?, precio=?, cantidad=?, subtotal=? WHERE id_detalle=?"
    );
    psDetalle.setString(1, producto);
    psDetalle.setDouble(2, precio);
    psDetalle.setInt(3, cantidad);
    psDetalle.setDouble(4, subtotal);
    psDetalle.setInt(5, idDetalle);

    psDetalle.executeUpdate();
    psDetalle.close();
}
rs.close();
stmt.close();

// 2?? Actualizar tabla pedidos
PreparedStatement psPedido = con.prepareStatement(
    "UPDATE pedidos SET cliente=?, fecha_pedido=?, total=? WHERE id_pedido=? AND id_empleado=?"
);
psPedido.setString(1, cliente);
psPedido.setString(2, fecha);
psPedido.setDouble(3, total);
psPedido.setInt(4, idPedido);
psPedido.setInt(5, idEmpleado);

int filas = psPedido.executeUpdate();
psPedido.close();
con.close();

if(filas == 0){
    out.println("No tienes permiso para editar este pedido.");
} else {
    response.sendRedirect("verPedidosEmpleado.jsp");
}
%>
