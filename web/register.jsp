<%-- 
    Document   : register
    Created on : Dec 21, 2022, 2:15:20 PM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page import="method.UserMethod,bean.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="u" class="bean.User"/>
        <jsp:setProperty property="*" name="u"/>
        <% User user = UserMethod.getUserByName(u.getName());
           try{ if (user.getName().equals(u.getName()) && user.getPassword().equals(u.getPassword())) {
            session.setAttribute("name",u.getName());
            response.sendRedirect("index.jsp");
//            request.getRequestDispatcher("index.jsp").forward(request, response);
            }else{response.sendRedirect("loginForm.jsp?error=incorrect password");}
            }catch(Exception ex){  
            response.sendRedirect("loginForm.jsp?error=invalid user name");
            }
        %>
        
          




    </body>
</html>
