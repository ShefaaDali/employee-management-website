<%-- 
    Document   : deleteConfirmMsg
    Created on : Dec 21, 2022, 11:33:26 AM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:if test="${name == null}">  
        <% response.sendRedirect("loginForm.jsp");%>
    </c:if>
<jsp:useBean id="e" class="bean.Emp"></jsp:useBean>  
        <jsp:setProperty property="*" name="e"/>
        <%@page import="method.EmpMethod" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="formStyle.css"/>
        <title>confirm Delete</title>
    </head>
    <body>
         
        <div class="formContainer">
            <c:if test="${language=='E'}">
            <div class="confirmDeletMsg"> confirm delete ${EmpMethod.getRecordById(e.getId()).getName()} from Record</div>
            <a href="deleteEmp.jsp?id=${param.id}"><button>Delete</button></a>
            <a href="index.jsp"><button>Cancel</button></a>
            </c:if>
            <c:if test="${language=='A'}">
                <div class="confirmDeletMsg">من السجل  ${EmpMethod.getRecordById(e.getId()).getName()} تأكيد حذف</div>
            <a href="deleteEmp.jsp?id=${param.id}"><button>حذف</button></a>
            <a href="index.jsp"><button>إلغاء</button></a>
            </c:if>
        </div>
    </body>
</html>
