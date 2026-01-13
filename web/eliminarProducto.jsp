<%-- 
    Document   : eliminarProducto
    Created on : 7 ene 2026, 1:14:09?p.m.
    Author     : Alexis Montiel
--%>

<%@page import="java.util.*"%>
<%@page session="true"%>

<%
    ArrayList<Map<String,Object>> carrito =
        (ArrayList<Map<String,Object>>) session.getAttribute("carrito");

    if(carrito != null){
        int index = Integer.parseInt(
            request.getParameter("index")
        );

        if(index >= 0 && index < carrito.size()){
            carrito.remove(index);
        }

        session.setAttribute("carrito", carrito);
    }

    response.sendRedirect("empleado.jsp");
%>
