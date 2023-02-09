/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package method;

import java.sql.Connection;
import java.sql.DriverManager;
import bean.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author shefa
 */
public class UserMethod {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2000");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
    public static boolean validate(User user){
        boolean status=false;  
        try(Connection con =getConnection();){
        PreparedStatement ps=con.prepareStatement("select * from user where name=? password= ?");
        ps.setString(1, user.getName());
         ps.setString(1, user.getPassword());
        ResultSet rs=ps.executeQuery();
        status=rs.next();
        }catch(Exception ex){System.out.println(ex);}
        return status;
    }
    
    public static User getUserByName(String name){
        User user=new User();
        try(Connection con =getConnection();){
        PreparedStatement ps=con.prepareStatement("select * from user where name=?");
        ps.setString(1, name);
        ResultSet rs=ps.executeQuery();
        rs.next();
        user.setName(rs.getString("name"));
        user.setPassword(rs.getString("password"));
        }catch(Exception ex){System.out.println(ex);}
        return user;
    }

}
