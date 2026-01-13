<%-- 
    Document   : guardarPedidoFinal
    Created on : 7 ene 2026, 12:59:39?p.m.
    Author     : Alexis Montiel
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page session="true"%>

<%
Connection conexion = null;
PreparedStatement psPedido = null;
PreparedStatement psDetalle = null;
ResultSet rs = null;

try {

    if(session.getAttribute("id_usuario") == null){
        response.sendRedirect("index.jsp");
        return;
    }

    int idEmpleado = Integer.parseInt(
        session.getAttribute("id_usuario").toString()
    );

    String cliente = request.getParameter("cliente");

    ArrayList<Map<String,Object>> carrito =
        (ArrayList<Map<String,Object>>) session.getAttribute("carrito");

    if(carrito == null || carrito.isEmpty()){
        response.sendRedirect("empleado.jsp");
        return;
    }

    /* DRIVER MYSQL 5.1 */
    Class.forName("com.mysql.jdbc.Driver");

    conexion = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tienda_ropa",
        "umontielis",
        "UDL123"
    );

    conexion.setAutoCommit(false); // ? transacción

    /* CALCULAR TOTAL */
    double totalPedido = 0;
    for(Map<String,Object> item : carrito){
        totalPedido += (Double) item.get("subtotal");
    }

    /* 1?? GUARDAR PEDIDO */
    String sqlPedido =
        "INSERT INTO pedidos (id_empleado, cliente, fecha_pedido, total) " +
        "VALUES (?, ?, NOW(), ?)";

    psPedido = conexion.prepareStatement(
        sqlPedido, Statement.RETURN_GENERATED_KEYS
    );

    psPedido.setInt(1, idEmpleado);
    psPedido.setString(2, cliente);
    psPedido.setDouble(3, totalPedido);

    psPedido.executeUpdate();

    rs = psPedido.getGeneratedKeys();
    rs.next();
    int idPedido = rs.getInt(1);

    /* 2?? GUARDAR DETALLES */
    String sqlDetalle =
        "INSERT INTO detalle_pedido " +
        "(id_pedido, producto, precio, cantidad, subtotal) " +
        "VALUES (?, ?, ?, ?, ?)";

    psDetalle = conexion.prepareStatement(sqlDetalle);

    for(Map<String,Object> item : carrito){
        psDetalle.setInt(1, idPedido);
        psDetalle.setString(2, item.get("producto").toString());
        psDetalle.setDouble(3, (Double) item.get("precio"));
        psDetalle.setInt(4, (Integer) item.get("cantidad"));
        psDetalle.setDouble(5, (Double) item.get("subtotal"));
        psDetalle.executeUpdate();
    }

    conexion.commit(); // ? confirmar

    session.removeAttribute("carrito");
    session.setAttribute("mensaje", "Pedido guardado correctamente");

    response.sendRedirect("empleado.jsp");

} catch(Exception e){
    if(conexion != null) conexion.rollback();
    out.println("ERROR AL GUARDAR PEDIDO: " + e);
} finally {
    if(rs != null) rs.close();
    if(psDetalle != null) psDetalle.close();
    if(psPedido != null) psPedido.close();
    if(conexion != null) conexion.close();
}
%>
