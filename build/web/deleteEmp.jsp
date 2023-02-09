<%-- 
    Document   : deleteEmp.jsp
    Created on : Dec 10, 2022, 9:54:46 PM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:if test="${name == null}">  
        <% response.sendRedirect("loginForm.jsp");%>
    </c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="method.EmpMethod"%>  
        <jsp:useBean id="e" class="bean.Emp"></jsp:useBean>  
        <jsp:setProperty property="*" name="e"/> 

        <%
            int state= EmpMethod.delete(e);
            String text = "";
            if (state != 0) {
                text = "delete successfully";
            } else {
                text = "Sorry, an error occurred!";
            }
        %>  

        <%   
response.sendRedirect("index.jsp?text="+text);  
%>   

    </body>
</html>
