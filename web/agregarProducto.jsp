<%-- 
    Document   : agregarProducto
    Created on : 7 ene 2026, 12:52:14?p.m.
    Author     : Alexis Montiel
--%>

<%@page import="java.util.*"%>
<%@page session="true"%>

<%
/* Obtener carrito de sesión */
ArrayList<Map<String,Object>> carrito =
    (ArrayList<Map<String,Object>>) session.getAttribute("carrito");

if(carrito == null){
    carrito = new ArrayList<Map<String,Object>>();
}

/* Obtener datos del formulario */
String producto = request.getParameter("producto");
double precio = Double.parseDouble(request.getParameter("precio"));
int cantidad = Integer.parseInt(request.getParameter("cantidad"));

/* Calcular subtotal */
double subtotal = precio * cantidad;

/* Crear item */
Map<String,Object> item = new HashMap<String,Object>();
item.put("producto", producto);
item.put("precio", precio);
item.put("cantidad", cantidad);
item.put("subtotal", subtotal);

/* Agregar al carrito */
carrito.add(item);

/* Guardar nuevamente en sesión */
session.setAttribute("carrito", carrito);

/* Regresar a la pantalla del empleado */
response.sendRedirect("empleado.jsp");
%>
