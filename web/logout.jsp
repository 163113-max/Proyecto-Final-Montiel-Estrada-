<%-- 
    Document   : logout
    Created on : 7 ene 2026, 10:28:53?a.m.
    Author     : Alexis Montiel
--%>

<%@page session="true"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
