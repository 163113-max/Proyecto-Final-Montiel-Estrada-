<%-- 
    Document   : conexion
    Created on : 7 ene 2026, 11:17:33?a.m.
    Author     : Alexis Montiel
--%>
<%@page import="java.sql.*"%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");

    Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tienda_ropa",
        "umontielis",
        "UDL123"
    );

    out.println("CONEXIÓN OK");

} catch (Exception e) {
    out.println("ERROR: " + e);
}
%>
