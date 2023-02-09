<%-- 
    Document   : adduser
    Created on : Dec 10, 2022, 10:51:23 PM
    Author     : shefa
--%>

<%@page import="java.io.FileInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:if test="${name == null}">  
        <% response.sendRedirect("loginForm.jsp");%>
    </c:if>
<!DOCTYPE html>
<html>

    <body>
        <%@page import="method.EmpMethod"%>  
        <jsp:useBean id="e" class="bean.Emp"></jsp:useBean>  
        <jsp:setProperty property="*" name="e"/>  

        <%
            String str = request.getParameter("depid");
            int id = Integer.parseInt(str);
            e.setDepId(id);
            int state = EmpMethod.save(e);
            String text = "";
            if (state != 0) {
                text = "add successfully";
            } else {
                text = "Sorry, an error occurred!";
            }
        %>   
         <jsp:forward page="index.jsp"/> 
         
    </body>
</html>
