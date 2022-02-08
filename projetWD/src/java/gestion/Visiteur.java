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
public class Visiteur {
    Integer idVisiteur;
    String nom;
    String prenom;
    String mail;
    String numero;
    String mdp;
    Float vola;

    public Visiteur(Integer idVisiteur, String nom, String prenom, String mail, String numero, String mdp, Float vola) {
        this.idVisiteur = idVisiteur;
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.numero = numero;
        this.mdp = mdp;
        this.vola = vola;
    }

    public Visiteur(String nom, String prenom, String mail, String numero, String mdp, Float vola) {
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.numero = numero;
        this.mdp = mdp;
        this.vola = vola;
    }
    
    

    public Visiteur() {
    }
    
    

    public Integer getIdVisiteur() {
        return idVisiteur;
    }

    public void setIdVisiteur(Integer id_Visiteur) {
        this.idVisiteur = id_Visiteur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public Float getVola() {
        return vola;
    }

    public void setVola(Float vola) {
        this.vola = vola;
    }
    
    
    public void create()
    {
        Connexion c = new Connexion();
        try {
             String request ="INSERT INTO visiteur values(null,?,?,?,?,?,?)";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setString(1,this.getNom());
              stmt.setString(2,this.getPrenom());
               stmt.setString(3,this.getMail());
               stmt.setString(4,this.getNumero());
                stmt.setFloat(5,this.getVola());
             stmt.setString(6,this.getMdp());
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
             String request ="DELETE FROM `visiteur` WHERE ID_Visiteur=?";
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
             String request ="UPDATE `visiteur` SET `Nom`=?,`Prenom`=?,`Mail`=?,`Numero`=?,`Mdp`=?,`Vola`=? where id_Visiteur="+id.toString();
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setString(1,this.getNom());
             stmt.setString(2,this.getPrenom());
               stmt.setString(3,this.getMail());
                 stmt.setString(4,this.getNumero());
                   stmt.setString(5,this.getMdp());
                     stmt.setFloat(6,this.getVola());
                    stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static Visiteur search(Integer id)
    {
        Connexion c = new Connexion();
        Visiteur temp=new Visiteur();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM visiteur where ID_Visiteur="+id.toString());
        while(res.next()){
            temp.setIdVisiteur(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setPrenom(res.getString(3));
            temp.setMail(res.getString(4));
            temp.setNumero(res.getString(5));
            temp.setMdp(res.getString(6));
            temp.setVola(res.getFloat(7));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }
    
    public static Visiteur search(String nom)
    {
        Connexion c = new Connexion();
        Visiteur temp=new Visiteur();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM visiteur where nom='"+nom+"'");
        while(res.next()){
            temp.setIdVisiteur(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setPrenom(res.getString(3));
            temp.setMail(res.getString(4));
            temp.setNumero(res.getString(5));
            temp.setMdp(res.getString(6));
            temp.setVola(res.getFloat(7));
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
        ResultSet res = stmt.executeQuery("SELECT * FROM visiteur where ID_Visiteur="+id.toString());
        while(res.next()){
            temp.add(res.getString(1));
            temp.add(res.getString(2));
            temp.add(res.getString(3));
            temp.add(res.getString(4));
            temp.add(res.getString(5));
            temp.add(res.getString(6));
            temp.add(res.getString(7));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp.toArray(new String[temp.size()]); 
    }
    public static Visiteur[] getallVisiteur()
    {
        Connexion c = new Connexion();
         Vector<Visiteur> list=new Vector();
         Visiteur temp=new Visiteur(); 
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM visiteur");
        while(res.next()){
            temp.setIdVisiteur(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setPrenom(res.getString(3));
            temp.setMail(res.getString(4));
            temp.setNumero(res.getString(5));
            temp.setMdp(res.getString(6));
            temp.setVola(res.getFloat(7));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Visiteur[] val=list.toArray(new Visiteur[list.size()]); 
        return val;
    }
    
    public static Visiteur[] getselectedVisiteur(Integer debut,String nbr)
    {
        Connexion c = new Connexion();
         Vector<Visiteur> list=new Vector();
        
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM visiteur LIMIT "+debut.toString()+", "+nbr);
        while(res.next()){
             Visiteur temp=new Visiteur(); 
            temp.setIdVisiteur(res.getInt(1));
            temp.setNom(res.getString(2));
            temp.setPrenom(res.getString(3));
            temp.setMail(res.getString(4));
            temp.setNumero(res.getString(5));
            temp.setMdp(res.getString(6));
            temp.setVola(res.getFloat(7));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Visiteur[] val=list.toArray(new Visiteur[list.size()]); 
        return val;
    }
   
    
    
    public static String[] getcolumn(){
        Connexion c=new Connexion();
        Vector<String> list= new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'visiteur'");
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
