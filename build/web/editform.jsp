<%-- 
    Document   : editform
    Created on : Dec 10, 2022, 9:55:04 PM
    Author     : shefa
--%>

<%@page import="bean.Dep"%>
<%@page import="method.DepMethod"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:if test="${name == null}">  
    <% response.sendRedirect("loginForm.jsp");%>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit Employee</title>
        <link rel="stylesheet" href="formStyle.css"/>
    </head>
    <%@page import="method.EmpMethod,bean.Emp,java.util.List" %>
    <% int id = Integer.parseInt(request.getParameter("id"));
        Emp emp = EmpMethod.getRecordById(id);
    %>

    <body>
        <div class="formContainer">
            <%  List<Dep> deps = DepMethod.getAllDep();%>
            <c:if test="${language=='E'}">
                <h1>Edit Employee</h1>  
                <form action="editEmpServlet" method="post" enctype="multipart/form-data">  
                    <table>  
                        <input type="text" name="id" value="<%=emp.getId()%>" hidden="true"/>
                        <tr colspan="2" >
                        <label for="image">Choose a profile picture:</label>
                        <input type="file" id="image" name="image"
                               accept="image/png, image/jpeg"></tr>

                        <tr><td>Name:</td><td><input type="text" name="name" value="<%=emp.getName()%>"/></td></tr>  
                        <tr><td>Password:</td><td>  
                                <input type="password" name="password" value="<%=emp.getPassword()%>"/></td></tr>  
                        <tr><td>Email:</td><td><input type="email" name="email" value="<%=emp.getEmail()%>"/></td></tr>  
                        <tr><td>Sex:</td><td>  
                                <input type="radio" name="sex" value="male" id="male" <%=emp.getSex().equals("male") ? "checked" : ""%>/><label for="male"> Male </label>   
                                <input type="radio" name="sex" value="female" id="female" <%=emp.getSex().equals("female") ? "checked" : ""%> /><label for="female"> Female </label> </td></tr>  
                        <tr><td>Country:</td><td>  
                                <select name="country" style="width:155px">  
                                    <option value="Amman" <%=emp.getCountry().equals("Amman") ? "selected" : ""%>>Amman</option>  
                                    <option value="Zarqa" <%=emp.getCountry().equals("Zarqa") ? "selected" : ""%>>Zarqa</option>  
                                    <option value="Irbid" <%=emp.getCountry().equals("Irbid") ? "selected" : ""%>>Irbid</option>    
                                    <option value="Other" <%=emp.getCountry().equals("Other") ? "selected" : ""%>>Other</option>    
                                </select>  
                            </td></tr>  
                        <tr><td>Department:</td><td>  
                                <select name="depid" style="width:155px">
                                    <c:forEach items="<%=deps%>" var="dep">
                                        <option value="${dep.getDepId()}" <c:if test="${dep.getDepId()==emp.getDepId()}" >selected</c:if>>${dep.getDepName()}</option>
                                    </c:forEach> 
                                </select>  
                            </td></tr> 
                        <tr><td colspan="2"><button>Edit Employee</button></td></tr>  
                    </table>
                </form>
            </c:if>
            <c:if test="${language=='A'}">
                <h1>?????????? ?????????????? ???????????? </h1>  
                <form action="editEmpServlet" method="post" enctype="multipart/form-data" dir='rtl'>  
                    <table>  
                        <input type="text" name="id" value="<%=emp.getId()%>" hidden="true"/>
                        <tr colspan="2" >
                        <label for="image">?????? ???????? ????????????:</label>
                        <input type="file" id="image" name="image"
                               accept="image/png, image/jpeg"></tr>

                        <tr><td>??????????:</td><td><input type="text" name="name" value="<%=emp.getName()%>"/></td></tr>  
                        <tr><td>???????? ????????????:</td><td>  
                                <input type="password" name="password" value="<%=emp.getPassword()%>"/></td></tr>  
                        <tr><td>???????????? ????????????????????:</td><td><input type="email" name="email" value="<%=emp.getEmail()%>"/></td></tr>  
                        <tr><td>??????????:</td><td>  
                                <input type="radio" name="sex" value="male" id="male" <%=emp.getSex().equals("male") ? "checked" : ""%>/><label for="male"> ?????? </label>   
                                <input type="radio" name="sex" value="female" id="female" <%=emp.getSex().equals("female") ? "checked" : ""%> /><label for="female"> ???????? </label>   
                        <tr><td>??????????????:</td><td>  
                                <select name="country" style="width:155px">  
                                    <option value="Amman" <%=emp.getCountry().equals("Amman") ? "selected" : ""%>>????????</option>  
                                    <option value="Zarqa" <%=emp.getCountry().equals("Zarqa") ? "selected" : ""%>>??????????????</option>  
                                    <option value="Irbid" <%=emp.getCountry().equals("Irbid") ? "selected" : ""%>>????????</option>    
                                    <option value="Other" <%=emp.getCountry().equals("Other") ? "selected" : ""%>>?????? ??????</option>    
                                </select>  
                            </td></tr>  
                        <tr><td>??????????:</td><td>
                                <select name="depid" style="width:155px">
                                    <c:forEach items="<%=deps%>" var="dep">
                                        <option value="${dep.getDepId()}">${dep.getDepName()}</option>
                                    </c:forEach> 
                                </select> 
                            </td></tr> 
                        <tr><td colspan="2"><button>??????????</button></td></tr>  
                    </table>
                </form>
            </c:if>
        </div>

    </body>
</html>

