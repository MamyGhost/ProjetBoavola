/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;

import connection.Connexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Mamitiana
 */
public class Categorie {
    Integer idCategorie;
    Integer etoiles;

    public Integer getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(Integer idCategorie) {
        this.idCategorie = idCategorie;
    }

    public Integer getEtoiles() {
        return etoiles;
    }

    public void setEtoiles(Integer etoiles) {
        this.etoiles = etoiles;
    }
    
    public void create()
    {
        Connexion c = new Connexion();
        try {
             String request ="INSERT INTO categorie values(null,?)";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setFloat(1,this.getEtoiles());
             stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void delete(Connexion c)
    {
        try {
             String request ="DELETE FROM `categorie` WHERE id=?";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setInt(1,getIdCategorie());
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void update(Integer id)
    {
        Connexion c = new Connexion();
         try {
             String request ="UPDATE `categorie` SET `Etoiles`=? WHERE ID_Categorie="+id.toString();
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setFloat(1,this.getEtoiles());
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static Categorie search(Integer id)
    {
        Connexion c = new Connexion();
        Categorie temp=new Categorie();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM categorie where ID_Categorie="+id.toString());
        while(res.next()){
            temp.setIdCategorie(res.getInt(1));
            temp.setEtoiles(res.getInt(2));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }
    
     public static Categorie search1(Integer nom)
    {
        Connexion c = new Connexion();
        Categorie temp=new Categorie();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM categorie where Etoiles="+nom.toString());
        while(res.next()){
            temp.setIdCategorie(res.getInt(1));
            temp.setEtoiles(res.getInt(2));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }
    
     public static Categorie[] getallCategorie()
    {
        Connexion c = new Connexion();
         Vector<Categorie> list=new Vector();
         Categorie temp=new Categorie(); 
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM categorie");
        while(res.next()){
            temp.setIdCategorie(res.getInt(1));
            temp.setEtoiles(res.getInt(2));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Categorie[] val=list.toArray(new Categorie[list.size()]); 
        return val;
    }
    
     
           public static String[] getcategorie()
    {
        Connexion c = new Connexion();
         Vector<String> list=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("select etoiles  from categorie ");
        while(res.next()){
            list.add(res.getString(1));
        }
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         String[] val=list.toArray(new String[list.size()]); 
        return val;
        
    }
}
