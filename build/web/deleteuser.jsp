<%-- 
    Document   : deleteuser.jsp
    Created on : Dec 10, 2022, 9:54:46 PM
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
        <%@page import="method.EmpMethod"%>  
<jsp:useBean id="u" class="bean.Emp"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%
int state=EmpMethod.delete(u);
String text="";
 if (state!=0){
    text="delete successfully";}
    else{
    text="Sorry, an error occurred!";
    }
%>  

<jsp:forward page="index.jsp">  
<jsp:param name="state" value= "${text}" />  
</jsp:forward>
    </body>
</html>
