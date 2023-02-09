<%-- 
    Document   : index
    Created on : Nov 30, 2022, 3:07:55 PM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="method.*,bean.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:if test="${name == null}">  
    <% response.sendRedirect("loginForm.jsp");%>
</c:if>
<% if (pageContext.getAttribute("language", PageContext.APPLICATION_SCOPE) == null) {
        pageContext.setAttribute("language", "E", PageContext.APPLICATION_SCOPE);
    }%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee</title>
        <link rel="stylesheet" href="index.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>
    <c:if test="${language=='E'}">
        <header>
        <h3 style="color: white;font-size: 20px"> <c:out value="  user name: ${name}"/></h3>
        <div>
        <a href="logout.jsp"> <button>LogOut</button></a>
        <a href="changeLanguage.jsp"> <button><span class="material-symbols-outlined">language</span></button></a>
        </div>
         
    </header> 

    <div class="container" >
        <a href="EmpForm.jsp"> <button>add employee</button></a>
        <form action="index.jsp">
            <input name="ename" type="text" class="Search" value="" >
            <button type="submit">Search</button>
        </form>
    </div>
    </c:if>
    <c:if test="${language=='A'}">
         <header dir='rtl'>
        <h3 style="color: white;font-size: 20px"> <c:out value=" إسم المستخدم: ${name} "/></h3>
        <div>
        <a href="logout.jsp"> <button>خروج</button></a>
        <a href="changeLanguage.jsp"> <button><span class="material-symbols-outlined">language</span></button></a> 
        </div>
    </header> 

    <div class="container" >
        <a href="EmpForm.jsp"> <button>إضافة موضف</button></a>
        <form action="index.jsp">
            <input name="ename" type="text" class="Search" value="" >
            <button type="submit">بحث</button>
        </form>
    </div> 
    </c:if>
    
    <div><jsp:include page="veiw.jsp"/> </div>
    
    <%
        String text = request.getParameter("text");
        if (text != null) {
            out.print(text);
        }
    %>
</html>
