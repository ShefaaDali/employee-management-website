/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author shefa
 */
package bean;
import java.io.InputStream;
public class Emp {
private InputStream image;
private int id,depId;  
private String name,password,email,country,sex;  
//setter
public int getId() {  
    return id;  
}  
public void setId(int id) {  
    this.id = id;  
} 

public int getDepId() {  
    return depId;  
}  
public void setDepId(int depId) {  
    this.depId = depId;  
}  

public String getName() {  
    return name;  
}  
public void setName(String name) {  
    this.name = name;  
}  
public String getPassword() {  
    return password;  
}  
public void setPassword(String password) {  
    this.password = password;  
}  
public String getEmail() {  
    return email;  
}  
public void setEmail(String email) {  
    this.email = email;  
}  
public String getCountry() {  
    return country;  
}  
public void setCountry(String country) {  
    this.country = country;  
}  

public String getSex() {  
    return sex;  
}  
public void setSex(String sex) {  
    this.sex = sex;  
}   

public void setImage(InputStream image){
this.image=image;
}

public InputStream getImage(){
return image;
}
}  
