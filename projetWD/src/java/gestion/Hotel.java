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
public class Hotel {
    Integer idHotel;
    Integer IdPays;
    Integer IdRegion;
    Integer IdCategorie;
    String nom;
    Float tarif;
    String description;
    String photo;
    Integer values;
    Integer hebergement;
    String pays;
    String region;
    Integer etoiles;

  public Hotel(Integer idHotel, String nom, Float tarif, String description, String photo, Integer values, Integer hebergement, String pays, String region, Integer etoiles) {
        this.idHotel = idHotel;
        this.nom = nom;
        this.tarif = tarif;
        this.description = description;
        this.photo = photo;
        this.values = values;
        this.hebergement = hebergement;
        this.pays = pays;
        this.region = region;
        this.etoiles = etoiles;
    }
  
  public Hotel( String nom, Float tarif, String description, String photo, Integer values, Integer hebergement, String pays, String region, Integer etoiles) {

        this.nom = nom;
        this.tarif = tarif;
        this.description = description;
        this.photo = photo;
        this.values = values;
        this.hebergement = hebergement;
        this.pays = pays;
        this.region = region;
        this.etoiles = etoiles;
    }
  
    public Hotel() {
    }
    
    

    public Integer getIdHotel() {
        return idHotel;
    }
    

    public void setIdHotel(Integer idHotel) {
        this.idHotel = idHotel;
    }

    public Integer getIdPays() {
        return IdPays;
    }
    
     public Integer getIdPays(String nom) {
         String val=new String();
          Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT ID_Pays FROM pays where nom='"+nom+"'");
        while(res.next()){
            val=res.getString(1);
            
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        } 
        return Integer.parseInt(val);
    }

    public void setIdPays(Integer IdPays) {
        this.IdPays = IdPays;
    }

    public Integer getIdRegion() {
        return IdRegion;
    }
    
     public Integer getIdRegion(String nom) {
         String val=new String();
          Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT ID_Region FROM region where nom='"+nom+"'");
        while(res.next()){
            val=res.getString(1);
            
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        } 
        return Integer.parseInt(val);
    }


    public void setIdRegion(Integer IdRegion) {
        this.IdRegion = IdRegion;
    }

    public Integer getIdCategorie() {
        return IdCategorie;
    }
    
    public Integer getIdCategorie(Integer etoiles) {
          String val=new String();
          Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT ID_Categorie FROM categorie where Etoiles='"+etoiles.toString()+"'");
        while(res.next()){
            val=res.getString(1);
            
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        } 
        return Integer.parseInt(val);
    }

    public void setIdCategorie(Integer IdCategorie) {
        this.IdCategorie = IdCategorie;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Float getTarif() {
        return tarif;
    }

    public void setTarif(Float tarif) {
        this.tarif = tarif;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getValues() {
        return values;
    }

    public void setValues(Integer values) {
        this.values = values;
    }

    public Integer getHebergement() {
        return hebergement;
    }

    public void setHebergement(Integer hebergement) {
        this.hebergement = hebergement;
    }

  

    

     public void create()
    {
        Connexion c = new Connexion();
        try {
             String request ="INSERT INTO hotel values(null,?,?,?,?,?,?,?,?,?)";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setInt(1,this.getIdPays());
             stmt.setInt(2,this.getIdRegion());
             stmt.setFloat(3,this.getIdCategorie());
             stmt.setString(4,this.getNom());
             stmt.setFloat(5,this.getTarif());
             stmt.setString(6,this.getDescription());
             stmt.setString(7,this.getPhoto());
             stmt.setInt(8,this.getValues());
             stmt.setInt(9,this.getHebergement());
             stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void delete(Integer id)
    {
        Connexion c = new Connexion();
        try {
             String request ="DELETE FROM `hotel` WHERE ID_Hotel=?";
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
        Connexion c = new Connexion();
         try {
             String request ="UPDATE `hotel` SET `ID_Pays`=?,`ID_Region`=?,`ID_Categorie`=?,`Nom`=?,`tarif`=?,`description`=?,`photo`=?,`values`=?,`hebergement`=? WHERE ID_Hotel="+id.toString();
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setInt(1,this.getIdPays(this.getPays()));
             stmt.setInt(2,this.getIdRegion(this.getRegion()));
             stmt.setInt(3,this.getIdCategorie(this.getEtoiles()));
             stmt.setString(4,this.getNom());
             stmt.setFloat(5,this.getTarif());
             stmt.setString(6,this.getDescription());
             stmt.setString(7,this.getPhoto());
             stmt.setInt(8,this.getValues());
             stmt.setInt(9,this.getHebergement());
              stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static Hotel search(Integer id)
    {
        Connexion c = new Connexion();
         Hotel temp=new Hotel();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM hotelV where ID_Hotel="+id.toString());
        while(res.next()){
            temp.setIdHotel(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setPays(res.getString(3));
            temp.setRegion(res.getString(4));
            temp.setEtoiles(res.getInt(5));
            temp.setTarif(res.getFloat(6));
            temp.setDescription(res.getString(7));
            temp.setPhoto(res.getString(8));
            temp.setValues(res.getInt(9));
            temp.setHebergement(res.getInt(10));
           
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
        ResultSet res = stmt.executeQuery("SELECT * FROM hotelV where ID_Hotel="+id.toString());
        while(res.next()){
            temp.add(res.getString(1));
            temp.add(res.getString(2));
            temp.add(res.getString(3));
            temp.add(res.getString(4));
            temp.add(res.getString(5));
            temp.add(res.getString(6));
            temp.add(res.getString(7));
            temp.add(res.getString(8));
            temp.add(res.getString(9));
            temp.add(res.getString(10));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp.toArray(new String[temp.size()]); 
    }
     
     public String getPays(Integer id)
     {
         String val=new String();
          Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT pays FROM hotelV where ID_Hotel='"+id.toString()+"'");
        while(res.next()){
            val=res.getString(1);
            
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        } 
        return val;
     }
     
     public void setPays(String pays){
         this.pays=pays;
     }

    public String getRegion(Integer id) {
        String val=new String();
        Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT region FROM hotelV where ID_Hotel='"+id.toString()+"'");
        while(res.next()){
            val=res.getString(1);
            
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        } 
        return val;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public Integer getEtoiles(Integer id) {
       Integer val=0;
        Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT etoiles FROM hotelV where ID_Hotel='"+id.toString()+"'");
        while(res.next()){
            val=res.getInt(1);
            
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        } 
        return val;
    }

    public void setEtoiles(Integer etoiles) {
        this.etoiles = etoiles;
    }

    public String getPays() {
        return pays;
    }

    public String getRegion() {
        return region;
    }

    public Integer getEtoiles() {
        return etoiles;
    }
     
     

    public static Hotel[] getallHotel()
    {
        Connexion c = new Connexion();
         Vector<Hotel> list=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM hotelV");
        while(res.next()){
            Hotel temp=new Hotel(); 
            temp.setIdHotel(res.getInt(1));
            temp.setIdPays(res.getInt(2));
            temp.setIdRegion(res.getInt(3));
            temp.setIdCategorie(res.getInt(4));
            temp.setNom(res.getString(5));
            temp.setTarif(res.getFloat(6));
            temp.setDescription(res.getString(7));
            temp.setPhoto(res.getString(8));
            temp.setValues(res.getInt(9));
            temp.setHebergement(res.getInt(10));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Hotel[] val=list.toArray(new Hotel[list.size()]); 
        return val;
    }
    
      public static Hotel[] getselectedHotel(Integer debut,String nbr)
    {
        Connexion c = new Connexion();
         Vector<Hotel> list=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM hotelV LIMIT "+debut.toString()+", "+nbr);
        while(res.next()){
            Hotel temp=new Hotel(); 
            temp.setIdHotel(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setPays(res.getString(3));
            temp.setRegion(res.getString(4));
            temp.setEtoiles(res.getInt(5));
            temp.setTarif(res.getFloat(6));
            temp.setDescription(res.getString(7));
            temp.setPhoto(res.getString(8));
            temp.setValues(res.getInt(9));
            temp.setHebergement(res.getInt(10));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Hotel[] val=list.toArray(new Hotel[list.size()]); 
        return val;
    }
    
    public static String[] getcolumn(){
        Connexion c=new Connexion();
        Vector<String> list= new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'hotelV'");

        while(res.next()){
           String temp= res.getString(1);
            if(temp.compareTo("photo")!=0)
            {
                list.add(temp);
            }
          
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
     
        String[] val=list.toArray(new String[list.size()]); 
        return val;
    }
    
      public static String[] getcolumn1(){
        Connexion c=new Connexion();
        Vector<String> list= new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'hotelV'");

        while(res.next()){
           String temp= res.getString(1);

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
