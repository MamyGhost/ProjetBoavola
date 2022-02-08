/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;
import connection.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author T76
 */
public class Admin {
    Integer idAdmin;
    String Pseudo;
    String mdp;

    public Admin(Integer idAdmin, String Pseudo, String mdp) {
        this.idAdmin = idAdmin;
        this.Pseudo = Pseudo;
        this.mdp = mdp;
    }

    public Admin(String Pseudo, String mdp) {
        this.Pseudo = Pseudo;
        this.mdp = mdp;
    }
    
    

    public Admin() {
    }
    
    

    public Integer getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(Integer idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getPseudo() {
        return Pseudo;
    }

    public void setPseudo(String Pseudo) {
        this.Pseudo = Pseudo;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }
    
    public void create()
    {
        Connexion c =new Connexion();
        try {
             String request ="INSERT INTO admin values(null,?,?)";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setString(1,getPseudo());
             stmt.setString(2,getMdp());
             stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void delete(Integer id)
    {
        Connexion c =new Connexion();
        try {
             String request ="DELETE FROM `admin` WHERE ID_Admin=?";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setInt(1,id);
               stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void update(Integer id)
    {
        Connexion c =new Connexion();
         try {
             String request ="UPDATE `admin` SET `Pseudo`=?,`Mdp`=? WHERE ID_Admin="+id.toString();
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setString(1,getPseudo());
             stmt.setString(2,getMdp());
              stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static Admin search(Integer id)
    {
        Connexion c = new Connexion();
        Admin temp=new Admin();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM admin where ID_Admin="+id.toString());
        while(res.next()){
            temp.setIdAdmin(res.getInt(1));
            temp.setPseudo(res.getString(2));
            temp.setMdp(res.getString(3));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }
    
     public static String[] searchS(Integer id)
    {
        Connexion c = new Connexion();
         Vector<String> temp=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM admin where ID_Admin="+id.toString());
        while(res.next()){
             temp.add(res.getString(1));
             temp.add(res.getString(2));
             temp.add(res.getString(3));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
       return temp.toArray(new String[temp.size()]); 
    }
    
    
    
    public static Admin[] getallAdmin()
    {
        Connexion c = new Connexion();
         Vector<Admin> list=new Vector();
         Admin temp=new Admin(); 
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM admin");
        while(res.next()){
            temp.setIdAdmin(res.getInt(1));
            temp.setPseudo(res.getString(2));
            temp.setMdp(res.getString(3));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Admin[] val=list.toArray(new Admin[list.size()]); 
        return val;
    }
    
      public static Admin[] getselectedAdmin(Integer debut,String nbr)
    {
        Connexion c = new Connexion();
         Vector<Admin> list=new Vector();
         Admin temp=new Admin(); 
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM admin LIMIT "+debut.toString()+", "+nbr);
        while(res.next()){
            temp.setIdAdmin(res.getInt(1));
            temp.setPseudo(res.getString(2));
            temp.setMdp(res.getString(3));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Admin[] val=list.toArray(new Admin[list.size()]); 
        return val;
    }
    
    
  
       public  static String[] getcolumn(){
        Connexion c=new Connexion();
        Vector<String> list= new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'admin'");
        int count=0;
        while(res.next()){
            String temp= res.getString(1);
            if(temp.contains("ID_")  && count!=0)
            {
                temp=temp.substring(3);
            }
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
     
        String[] val=list.toArray(new String[list.size()]); 
        return val;
    }
}

