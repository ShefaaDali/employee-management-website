<%-- 
    Document   : veiw
    Created on : Dec 14, 2022, 10:30:43 AM
    Author     : shefa
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:if test="${name == null}">  
    <% response.sendRedirect("loginForm.jsp");%>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="method.*,bean.*,java.util.*,org.json.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
        <%  List<Emp> emp;
            String empName = request.getParameter("ename");
            if (empName == null || empName == "") {
                emp = EmpMethod.getAllRecords();
                request.setAttribute("emp", emp);
            } else {
                emp = EmpMethod.getRecordByName(empName);
                request.setAttribute("emp", emp);
            }

            if (pageContext.getAttribute("language", PageContext.APPLICATION_SCOPE) == "E") {
                out.print("<h3>  number of item:" + emp.size() + "</h3>");
            } else {
                out.print("<h3 dir='rtl'>   " + emp.size() + ":" + "عدد العناصر</h3>");
            }
        %>
        <table border="1" width="90%">
            <colgroup>
                <col width="5%"/>
                <col width="15%"/>
                <col width="5%"/>
                <col width="20%"/>
                <col width="15%"/>
                <col width="15%"/>
                <col width="10%"/>
            </colgroup>
            <%
                if (pageContext.getAttribute("language", PageContext.APPLICATION_SCOPE) == "E") {
                    out.print("<tr><th>image</th><th>Name</th><th>Sex</th><th>Email</th><th>Country</th><th>Department</th><th></th></tr>");
                } else {
                    out.print("<tr><th>الصورة</th><th>الاسم</th><th>الجنس</th><th>الإيميل</th><th>المدينة</th><th>القسم</th><th></th></tr>");
                }
            %>
            <c:if test="${emp.size()==0}"><tr><th colspan="7">Employee not found</th></tr></c:if>

            <c:forEach items="${emp}" var="e"> 
                <tr><td><img src=displayImageServlet?id=${e.getId()} alt="image not found" width="100px" height="100px"></td><td>${e.getName()}</td><td>${e.getSex()}</td><td>${e.getEmail()}</td><td>${e.getCountry()}</td><td>${e.getDepId()}</td>
                    <td><a class="delet" href="deleteConfirmMsg.jsp?id=${e.getId()}"><span class="material-symbols-outlined">delete_forever</span></a>
                        <a class="edit" href="editform.jsp?id=${e.getId()}" ><span class="material-symbols-outlined">edit_note</span></a></td>
                </tr>
            </c:forEach>
        </table>                                 
    </body>
</html>
