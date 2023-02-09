<%-- 
    Document   : searchEmp
    Created on : Dec 19, 2022, 10:18:45 AM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search</title>
        <%@page import="method.EmpMethod" %>
        <% String name =request.getParameter("name");%>
        <jsp:forward page="index.jsp">
            <jsp:param name="name" value="${name}"/>
        </jsp:forward>
        
        <%= name%>
        
    </head>
    <body>
        
    </body>
</html>
