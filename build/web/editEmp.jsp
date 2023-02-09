<%-- 
    Document   : editEmp
    Created on : Dec 19, 2022, 2:59:20 PM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page import="javax.servlet.http.Part" %>
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
        <%@page import="method.EmpMethod" %>
        <jsp:useBean id="e" class="bean.Emp"></jsp:useBean>  
        <jsp:setProperty property="*" name="e"/> 
        <%
            String str = request.getParameter("depid");
            int id = Integer.parseInt(str);
            e.setDepId(id);
            str= request.getParameter("id");
            id = Integer.parseInt(str);
            e.setId(id);       
           
            int state= EmpMethod.updateRecord(e);
        %>
        
        <jsp:forward page="index.jsp"/>

        
    </body>
</html>
