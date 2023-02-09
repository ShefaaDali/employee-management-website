<%-- 
    Document   : logout
    Created on : Dec 21, 2022, 2:50:30 PM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% session.invalidate(); %>
        <jsp:forward page="loginForm.jsp"/>
    </body>
</html>
