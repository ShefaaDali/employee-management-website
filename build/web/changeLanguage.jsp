<%-- 
    Document   : changeLanguage
    Created on : Dec 28, 2022, 2:46:07 PM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>   
        <%
            if(pageContext.getAttribute("language",PageContext.APPLICATION_SCOPE)=="E" ){
            pageContext.setAttribute("language","A",PageContext.APPLICATION_SCOPE);
            }else{
            pageContext.setAttribute("language","E",PageContext.APPLICATION_SCOPE);
            }
        %>
        <%response.sendRedirect("index.jsp"); %>
    </body>
</html>
