/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package method;
import bean.Emp;
import java.sql.Blob;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author shefa
 */
public class EmpMethod { 
  
public static Connection getConnection(){  
    Connection con=null;  
    try{  
//Class.forName("com.mysql.cj.jdbc.Driver"); 
Class.forName("com.mysql.cj.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","2000"); 
    }catch(Exception e){System.out.println(e);}  
    return con;  
} 

public static int delete(Emp u){  
    int status=0;  
    try(Connection con=getConnection();){  
        PreparedStatement ps=con.prepareStatement("delete from emp where Id=?");  
        ps.setInt(1,u.getId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}
public static List<Emp> getRecordByName(String name){
    List<Emp> list;
        list = new ArrayList<>();
    try(Connection con =getConnection();) {
        PreparedStatement ps=con.prepareStatement("select * from emp where Name like ? ");
        ps.setString(1, '%'+name+'%');
        ResultSet rs=ps.executeQuery();
        while(rs.next()){  
            Emp e=new Emp();  
            e.setId(rs.getInt("Id"));
            e.setDepId(rs.getInt("depId"));
            e.setName(rs.getString("Name"));  
            e.setPassword(rs.getString("password"));  
            e.setEmail(rs.getString("Email"));   
            e.setCountry(rs.getString("Country"));
            e.setSex(rs.getString("six"));
            list.add(e); } 
    } catch (SQLException ex) {
        System.out.println(ex);
    }
    System.out.print(list+"===========");
    
    return list;
        }

public static List<Emp> getAllRecords(){ 
    List<Emp> list;  
    list = new ArrayList<>();
      
    try(Connection con=getConnection();  ){  
        PreparedStatement ps=con.prepareStatement("select * from emp");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            Emp e=new Emp();  
            e.setId(rs.getInt("Id"));
            e.setDepId(rs.getInt("depId"));
            e.setName(rs.getString("Name"));  
            e.setPassword(rs.getString("password"));  
            e.setEmail(rs.getString("Email"));   
            e.setCountry(rs.getString("Country"));
            e.setSex(rs.getString("six")); 
            e.setImage(rs.getBinaryStream("image"));
            list.add(e);  
        }  
    }catch(Exception e){System.out.println(e);}  
    return list;  
}  

public static int save(Emp e){  
    int status=0;  
    try(Connection con=getConnection();){   
        PreparedStatement ps=con.prepareStatement("insert into emp(name,password,email,country,six,depid,image) values(?,?,?,?,?,?,?)");  
        ps.setString(1,e.getName());  
        ps.setString(2,e.getPassword());  
        ps.setString(3,e.getEmail());  
        ps.setString(4,e.getCountry());  
        ps.setString(5,e.getSex());
        ps.setInt(6,e.getDepId());
        ps.setBlob(7, e.getImage());
        status=ps.executeUpdate();  
    }catch(Exception ex){System.out.println(ex);}  
    return status;  
}

public static Emp getRecordById(int id){
    Emp e=new Emp(); 
    try (Connection con =getConnection();){
        PreparedStatement ps=con.prepareStatement("select * from emp where id= ?");
        ps.setInt(1, id);
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
            e.setId(rs.getInt("Id"));
            e.setDepId(rs.getInt("depId"));
            e.setName(rs.getString("Name"));  
            e.setPassword(rs.getString("password"));  
            e.setEmail(rs.getString("Email"));   
            e.setCountry(rs.getString("Country"));
            e.setSex(rs.getString("six"));
            e.setImage(rs.getBinaryStream("image"));
        } 
    } catch (SQLException ex) {
        System.out.println(ex);
    }
    
    return e;
}

public static int updateRecord(Emp e){
    int state=0;
        try(Connection con =getConnection();) {
        PreparedStatement ps=con.prepareStatement("update emp set name= ? ,password= ? ,email=? ,country=? ,six=? ,depid=?,image=? where id=?");
        ps.setString(1,e.getName());  
        ps.setString(2,e.getPassword());  
        ps.setString(3,e.getEmail());  
        ps.setString(4,e.getCountry());  
        ps.setString(5,e.getSex());
        ps.setInt(6,e.getDepId());
        ps.setBlob(7, e.getImage());
        ps.setInt(8, e.getId());
        
       state =ps.executeUpdate();
    } catch (SQLException ex) {
        System.out.println(ex);
    }
        return state;
}
}  
