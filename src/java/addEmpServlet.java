/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import bean.Emp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import method.EmpMethod;

/**
 *
 * @author shefa
 */

@MultipartConfig(maxFileSize = 16177216)
public class addEmpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(false);
         if(session.getAttribute("name")==null){
        response.sendRedirect("loginForm.jsp");
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Emp e = new Emp();
        e.setName(request.getParameter("name"));
        e.setPassword(request.getParameter("password"));
        e.setEmail(request.getParameter("email"));
        e.setSex(request.getParameter("sex"));
        e.setCountry(request.getParameter("country"));
        e.setDepId(Integer.parseInt(request.getParameter("depid")));
        Part part = request.getPart("image");
        e.setImage(part.getInputStream());
        int status = EmpMethod.save(e);
        

        if (status != 0) {
            response.sendRedirect("index.jsp?text=add successfully");
        } else {
            response.sendRedirect("index.jsp?text=Sorry, an error occurred!");
        }
        out.close();
    }
}
