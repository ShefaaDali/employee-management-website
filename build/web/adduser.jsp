<%-- 
    Document   : adduser
    Created on : Dec 10, 2022, 10:51:23 PM
    Author     : shefa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
    <body>
        <%@page import="method.EmpMethod"%>  
<jsp:useBean id="u" class="bean.Emp"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
 String str=request.getParameter("depid");
int id=Integer.parseInt(str);
 u.setDepId(id);
int state=EmpMethod.save(u);  
String text="";
if(state !=0){  
text="add successfully";
  }else{  
text="Sorry, an error occurred!";
}  
%>
<%=text%>
<%=id %>

<%--<jsp:forward page="index.jsp">  
<jsp:param name="state" value= "${text}" />  
</jsp:forward>--%>
    </body>
</html>
