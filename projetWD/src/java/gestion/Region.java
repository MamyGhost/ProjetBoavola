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
public class Region {
    Integer idRegion;
    public Integer idPays;
    String nom;

    public Integer getIdRegion() {
        return idRegion;
    }

    public void setIdRegion(Integer idRegion) {
        this.idRegion = idRegion;
    }

    public Integer getIdPays() {
        return idPays;
    }

    public void setIdPays(Integer idPays) {
        this.idPays = idPays;
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
             String request ="INSERT INTO region values(null,?,?)";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setString(1,this.getNom());
             stmt.setInt(2,this.getIdPays());
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
             String request ="DELETE FROM `region` WHERE id=?";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setInt(1,this.getIdRegion());
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void update(Integer id)
    {
        Connexion c = new Connexion();
         try {
             String request ="UPDATE `region` SET `nom`=? ,`Id_Pays`=? WHERE ID_Region="+id.toString();
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setString(1,this.getNom());
             stmt.setInt(2,this.getIdPays());
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public Region search(Integer id)
    {
        Connexion c = new Connexion();
        Region temp=new Region();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM regionV where ID_Region="+id.toString());
        while(res.next()){
            temp.setIdRegion(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setIdPays(res.getInt(3));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }

     public static Region search(String nom)
    {
        Connexion c = new Connexion();
        Region temp=new Region();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM regionV where pays="+nom);
        while(res.next()){
            temp.setIdRegion(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setIdPays(res.getInt(3));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }

    public static Region[] getallRegion()
    {
        Connexion c = new Connexion();
         Vector<Region> list=new Vector();
         Region temp=new Region(); 
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM regionV");
        while(res.next()){
            temp.setIdRegion(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setIdPays(res.getInt(3));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Region[] val=list.toArray(new Region[list.size()]); 
        return val;
    }
    
    

    /**
     * @return the nomPays
     */
   
    
}
