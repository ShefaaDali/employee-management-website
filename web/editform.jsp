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
                <h1>تعديل معلومات الموضف </h1>  
                <form action="editEmpServlet" method="post" enctype="multipart/form-data" dir='rtl'>  
                    <table>  
                        <input type="text" name="id" value="<%=emp.getId()%>" hidden="true"/>
                        <tr colspan="2" >
                        <label for="image">حدد صورة الموضف:</label>
                        <input type="file" id="image" name="image"
                               accept="image/png, image/jpeg"></tr>

                        <tr><td>الإسم:</td><td><input type="text" name="name" value="<%=emp.getName()%>"/></td></tr>  
                        <tr><td>كلمة المرور:</td><td>  
                                <input type="password" name="password" value="<%=emp.getPassword()%>"/></td></tr>  
                        <tr><td>البريد الإلكتروني:</td><td><input type="email" name="email" value="<%=emp.getEmail()%>"/></td></tr>  
                        <tr><td>الجنس:</td><td>  
                                <input type="radio" name="sex" value="male" id="male" <%=emp.getSex().equals("male") ? "checked" : ""%>/><label for="male"> ذكر </label>   
                                <input type="radio" name="sex" value="female" id="female" <%=emp.getSex().equals("female") ? "checked" : ""%> /><label for="female"> أنثى </label>   
                        <tr><td>المدينة:</td><td>  
                                <select name="country" style="width:155px">  
                                    <option value="Amman" <%=emp.getCountry().equals("Amman") ? "selected" : ""%>>عمان</option>  
                                    <option value="Zarqa" <%=emp.getCountry().equals("Zarqa") ? "selected" : ""%>>الزرقاء</option>  
                                    <option value="Irbid" <%=emp.getCountry().equals("Irbid") ? "selected" : ""%>>إربد</option>    
                                    <option value="Other" <%=emp.getCountry().equals("Other") ? "selected" : ""%>>غير ذلك</option>    
                                </select>  
                            </td></tr>  
                        <tr><td>القسم:</td><td>
                                <select name="depid" style="width:155px">
                                    <c:forEach items="<%=deps%>" var="dep">
                                        <option value="${dep.getDepId()}">${dep.getDepName()}</option>
                                    </c:forEach> 
                                </select> 
                            </td></tr> 
                        <tr><td colspan="2"><button>تعديل</button></td></tr>  
                    </table>
                </form>
            </c:if>
        </div>

    </body>
</html>

