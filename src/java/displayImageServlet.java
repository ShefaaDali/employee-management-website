/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import method.EmpMethod;

/**
 *
 * @author shefa
 */
public class displayImageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(false);  
        if(session.getAttribute("name")==null){
        response.sendRedirect("loginForm.jsp");
        }
          int id = Integer.parseInt(request.getParameter("id"));
        try ( OutputStream os = response.getOutputStream()) {
            response.setContentType("image/jpeg");
            InputStream f=EmpMethod.getRecordById(id).getImage();
            byte[] bytes=new byte[65535];
             f.read(bytes);            
             os.write(bytes);
             os.flush();
             os.close();
        }catch(Exception ex){
       System.out.print(ex);
        }
    }

}