<%-- 
    Document   : loginForm
    Created on : Dec 21, 2022, 12:06:52 PM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="formStyle.css"/>
        <title>login Form</title>
    </head>
    <body>
        <div class="formContainer">
        <c:if test="${language=='E'}">
            <form action="register.jsp">
                <h1>login</h1>
                <input name="name" type='text' placeholder=" Enter user name">
                <input name="password" type='password' placeholder="Enter your password">
                <button>login</button>
            </form>
        </c:if>
        <c:if test="${language=='A'}">
            <form action="register.jsp">
                <h1>دخول</h1>
                <input name="name" type='text' placeholder=" Enter user name">
                <input name="password" type='password' placeholder="Enter your password">
                <button>تسجيل دخول</button>
            </form>
        </c:if>
            <span class="error">
        <%
        String text = request.getParameter("error");
        if (text != null) {
            out.print(text);
        }
    %></span>
              </div>

    </body>
</html>
