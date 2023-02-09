<%-- 
    Document   : EmpForm
    Created on : Dec 14, 2022, 2:20:31 PM
    Author     : shefa
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="bean.Dep"%>
<%@page import="method.DepMethod" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${name == null}">  
    <% response.sendRedirect("loginForm.jsp");%>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Employee</title>
        <link rel="stylesheet" href="formStyle.css"/>
    </head>
    <body>
        <%List<Dep> deps = DepMethod.getAllDep();%>
        <c:if test="${language=='E'}">
            <div class="formContainer">
                <h1>Add New Employee</h1>  
                <form action="addEmp" method="post" enctype="multipart/form-data">  
                    <table>  
                        <tr colspan="2" >
                        <label for="image">Choose a profile picture:</label>
                        <input type="file" id="image" name="image"
                               accept="image/png, image/jpeg"></tr>

                        <tr><td>Name:</td><td><input type="text" name="name"  required/></td></tr>  
                        <tr><td>Password:</td><td>  
                                <input type="password" name="password"  required/></td></tr>  
                        <tr><td>Email:</td><td><input type="email" name="email" required/></td></tr>  
                        <tr><td>Sex:</td><td>  
                                <input type="radio" name="sex" value="male" id="male" required/><label for="male" > Male </label>   
                                <input type="radio" name="sex" value="female"id="female" required/><label for="female"> Female </label> </td></tr>  
                        <tr><td>Country:</td><td>  
                                <select name="country" style="width:155px">  
                                    <option>Amman</option>  
                                    <option>Zarqa</option>  
                                    <option>Irbid</option>    
                                    <option>Other</option>  
                                </select>  
                            </td></tr>  
                        <tr><td>Department:</td><td> 
                                <select name="depid" style="width:155px">
                                    <c:forEach items="<%=deps%>" var="dep">
                                        <option value="${dep.getDepId()}">${dep.getDepName()}</option>
                                    </c:forEach> 
                                </select>  
                            </td></tr> 
                        <tr><td colspan="2"><button>Add Employee</button></td></tr>  
                    </table>
            </div>
        </c:if>
        
        <c:if test="${language=='A'}">
            <div class="formContainer">
                <h1>إضافة موظف جديد</h1>  
                <form action="addEmp" method="post" enctype="multipart/form-data" dir='rtl'>  
                    <table>  
                        <tr colspan="2" >
                        <label for="image">حدد صورة الموضف:</label>
                        <input type="file" id="image" name="image"
                               accept="image/png, image/jpeg"></tr>

                        <tr><td>الإسم:</td><td><input type="text" name="name"required/></td></tr>  
                        <tr><td>كلمة المرور:</td><td>  
                                <input type="password" name="password" required/></td></tr>  
                        <tr><td>البريد الإلكتروني:</td><td><input type="email" name="email" required/></td></tr>  
                        <tr><td>الجنس:</td><td>  
                                <input type="radio" name="sex" value="male" id="male" required/><label for="male"> ذكر </label>   
                                <input type="radio" name="sex" value="female"id="female" required/><label for="female"> أنثى </label> </td></tr>  
                        <tr><td>المدينة:</td><td>  
                                <select name="country" style="width:155px">  
                                    <option value="Amman">عمان</option>  
                                    <option value="Zarqa">الزرقاء</option>  
                                    <option value="Irbid">إربد</option>    
                                    <option value="Other">غير ذلك</option>  
                                </select>  
                            </td></tr>  
                        <tr><td>القسم:</td><td> 
                                <select name="depid" style="width:155px">
                                    <c:forEach items="<%=deps%>" var="dep">
                                        <option value="${dep.getDepId()}">${dep.getDepName()}</option>
                                    </c:forEach> 
                                </select>  
                            </td></tr> 
                        <tr><td colspan="2"><button>إضافة</button></td></tr>  
                    </table>
            </div>
        </c:if>
    </body>
</html>
