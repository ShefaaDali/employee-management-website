/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package method;

import bean.Dep;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.*;

/**
 *
 * @author shefa
 */
public class DepMethod {

    public static Connection getConnection() {
        Connection con = null;
        try {
//Class.forName("com.mysql.cj.jdbc.Driver"); 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2000");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public static List<Dep> getAllDep() {
        List<Dep> list=new ArrayList();
        try(Connection con=getConnection();){
            PreparedStatement ps=con.prepareStatement("select *from dep");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                   Dep d=new Dep();
                   d.setDepId(rs.getInt("depId"));
                   d.setDepName(rs.getNString("depName"));
                   list.add(d);
            }
        }catch(Exception ex){
        System.out.println(ex);}  
        return list;
}
}
