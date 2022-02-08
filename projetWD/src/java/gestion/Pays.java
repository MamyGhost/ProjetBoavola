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
public class Pays {
    Integer idpays;
    String nom;

    public Integer getIdpays() {
        return idpays;
    }

    public void setIdpays(Integer idpays) {
        this.idpays = idpays;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    
     public void create()
    {
        Connexion c = new Connexion();
        try {
             String request ="INSERT INTO pays values(null,?)";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setString(1,this.getNom());
             stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void delete()
    {
        Connexion c = new Connexion();
        try {
             String request ="DELETE FROM `pays` WHERE id=?";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setInt(1,this.getIdpays());
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void update(Integer id)
    {
        Connexion c = new Connexion();
         try {
             String request ="UPDATE `pays` SET `nom`=? WHERE ID_Pays="+id.toString();
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setString(1,this.getNom());
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static Pays search(Integer id)
    {
        Connexion c = new Connexion();
        Pays temp=new Pays();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM pays where ID_Pays="+id.toString());
        while(res.next()){
            temp.setIdpays(res.getInt(1));
            temp.setNom(res.getString(2));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }
    
    public static Pays search(String nom)
    {
        Connexion c = new Connexion();
        Pays temp=new Pays();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM pays where ID_Pays="+nom);
        while(res.next()){
            temp.setIdpays(res.getInt(1));
            temp.setNom(res.getString(2));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }

    
     public static Pays[] getallPays()
    {
        Connexion c = new Connexion();
         Vector<Pays> list=new Vector();
         Pays temp=new Pays(); 
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM pays");
        while(res.next()){
            temp.setIdpays(res.getInt(1));
            temp.setNom(res.getString(2));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Pays[] val=list.toArray(new Pays[list.size()]); 
        return val;
    }
}
