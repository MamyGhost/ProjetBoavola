/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;

import connection.Connexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Mamitiana
 */
public class Reservation {
    Integer idReservation;
    Integer idHotel;
    Integer idVisiteur;
    Date dateA;
    Date dateD;
    Integer nbrPersonne;
    Integer lit;
    Float cout;
    Date dateRes;
    String hotel;
    String visisteur;

    public Reservation(Integer idReservation, Date dateA, Date dateD, Integer lit, Float cout, String hotel, String visisteur, Date dateRes) {
        this.idReservation = idReservation;
        this.dateA = dateA;
        this.dateD = dateD;
        this.lit = lit;
        this.cout = cout;
        this.hotel = hotel;
        this.visisteur = visisteur;
         this.dateRes = dateRes;
    }
    
     public Reservation( Date dateA, Date dateD, Integer lit, Float cout, String hotel, String visisteur, Date dateRes) {
        this.dateA = dateA;
        this.dateD = dateD;
        this.lit = lit;
        this.cout = cout;
        this.hotel = hotel;
        this.visisteur = visisteur;
         this.dateRes = dateRes;
    }

    public Reservation(Integer idHotel, Integer idVisiteur, Date dateA, Date dateD, Integer nbrPersonne, Integer lit, Float cout, Date dateRes) {
        this.idHotel = idHotel;
        this.idVisiteur = idVisiteur;
        this.dateA = dateA;
        this.dateD = dateD;
        this.nbrPersonne = nbrPersonne;
        this.lit = lit;
        this.cout = cout;
        this.dateRes = dateRes;
       
    }

    
    

    public Reservation() {
    }
    
    
    

    public Integer getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(Integer idReservation) {
        this.idReservation = idReservation;
    }

    public Integer getIdHotel() {
        return idHotel;
    }
    
     public Integer getIdHotel(String nom) {
        String val=new String();
        Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT ID_Hotel FROM hotel where nom='"+nom+"'");
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

    public void setIdHotel(Integer idHotel) {
        this.idHotel = idHotel;
    }

    public Integer getIdVisiteur() {
        return idVisiteur;
    }
    
     public Integer getIdVisiteur(String nom) {
        String val=new String();
        Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT ID_Visiteur FROM visiteur where nom='"+nom+"'");
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


    public void setIdVisiteur(Integer idVisiteur) {
        this.idVisiteur = idVisiteur;
    }

    public Date getDateA() {
        return dateA;
    }

    public void setDateA(Date dateA) {
        this.dateA = dateA;
    }

    public Date getDateD() {
        return dateD;
    }

    public Date getDateRes() {
        return dateRes;
    }

    public void setDateRes(Date dateRes) {
        this.dateRes = dateRes;
    }
    
    

    public void setDateD(Date dateD) {
        this.dateD = dateD;
    }

    public Integer getNbrPersonne() {
        return nbrPersonne;
    }

    public void setNbrPersonne(Integer nbrPersonne) {
        this.nbrPersonne = nbrPersonne;
    }

    public Integer getLit() {
        return lit;
    }

    public void setLit(Integer lit) {
        this.lit = lit;
    }

    public Float getCout() {
        return cout;
    }

    public void setCout(Float cout) {
        this.cout = cout;
    }
    
    public String getHotel() {
        return hotel;
    }
    
     public String getHotel(Integer id) {
         String val=new String();
        Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT hotel FROM reservationV where ID_Reservation='"+id.toString()+"'");
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

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public String getVisisteur() {
        return visisteur;
    }
    
    public String getVisisteur(Integer id) {
       String val=new String();
        Connexion c= new Connexion();
           try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT visiteur FROM reservationV where ID_Reservation='"+id.toString()+"'");
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

    public void setVisisteur(String visisteur) {
        this.visisteur = visisteur;
    }
    
    
    
     public void create()
    {
        Connexion c = new Connexion();
        try {
             String request ="INSERT INTO reservation values(null,?,?,?,?,?,?,?,?)";
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setInt(1,this.getIdHotel());
             stmt.setInt(2,this.getIdVisiteur());
             stmt.setDate(3,this.getDateA());
             stmt.setDate(4,this.getDateD());
             stmt.setInt(5,this.getNbrPersonne());
             stmt.setInt(6,this.getLit());
             stmt.setFloat(7,this.getCout());
             stmt.setDate(8,this.getDateRes());
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
             String request ="DELETE FROM `reservation` WHERE ID_Reservation=?";
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
             String request ="UPDATE `reservation` SET `ID_Hotel`=?,`ID_Visiteur`=?,`Date_A`=?,`Date_D`=?,`Nbr_Personne`=?,`Lit`=?,`Cout`=?,`DateRes`=? WHERE ID_Reservation="+id.toString();
             PreparedStatement stmt = c.getconex().prepareStatement(request);
             stmt.setInt(1,this.getIdHotel(this.getHotel()));
             stmt.setInt(2,this.getIdVisiteur(this.getVisisteur()));
             stmt.setDate(3,this.getDateA());
             stmt.setDate(4,this.getDateD());
             stmt.setInt(5,this.getNbrPersonne());
             stmt.setInt(6,this.getLit());
             stmt.setFloat(7,this.getCout());
             stmt.setDate(8,this.getDateRes());
             stmt.executeUpdate();
             c.getconex().close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static Reservation search(Integer id)
    {
        Connexion c = new Connexion();
         Reservation temp=new Reservation();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM reservationV where ID_Reservation="+id.toString());
        while(res.next()){
            temp.setIdReservation(res.getInt(1));
            temp.setHotel(res.getString(2));
            temp.setVisisteur(res.getString(4));
            temp.setDateA(res.getDate(5));
            temp.setDateD(res.getDate(6));
            temp.setNbrPersonne(res.getInt(7));
            temp.setLit(res.getInt(8));
            temp.setCout(res.getFloat(9));
            temp.setDateRes(res.getDate(10));
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return temp ;
    }
    
    
    
    public static Reservation[] getReservation(Integer id)
    {
        Connexion c = new Connexion();
        Vector<Reservation> list=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM reservationV where ID_Visiteur="+id.toString());
        while(res.next()){
            Reservation temp=new Reservation();
            temp.setIdReservation(res.getInt(1));
            temp.setHotel(res.getString(2));
            temp.setVisisteur(res.getString(4));
            temp.setDateA(res.getDate(5));
            temp.setDateD(res.getDate(6));
            temp.setNbrPersonne(res.getInt(7));
            temp.setLit(res.getInt(8));
            temp.setCout(res.getFloat(9));
            temp.setDateRes(res.getDate(10));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         return list.toArray(new Reservation[list.size()]);
    }
    
    public static Reservation[] getselectedReservation(Integer debut,String nbr)
    {
        Connexion c = new Connexion();
        Vector<Reservation> list=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM reservationV LIMIT "+debut.toString()+", "+nbr);
        while(res.next()){
            Reservation temp=new Reservation();
            temp.setIdReservation(res.getInt(1));
            temp.setHotel(res.getString(2));
            temp.setVisisteur(res.getString(4));
            temp.setDateA(res.getDate(5));
            temp.setDateD(res.getDate(6));
            temp.setNbrPersonne(res.getInt(7));
            temp.setLit(res.getInt(8));
            temp.setCout(res.getFloat(9));
            temp.setDateRes(res.getDate(10));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         return list.toArray(new Reservation[list.size()]);
    }
    
    
      public static String[] searchS(Integer id)
    {
        Connexion c = new Connexion();
         Vector<String> temp=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM reservationV where ID_Reservation="+id.toString());
        while(res.next()){
            temp.add(res.getString(1));
            temp.add(res.getString(2));
          
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

    public static Reservation[] getallReservation()
    {
        Connexion c = new Connexion();
         Vector<Reservation> list=new Vector();
         Reservation temp=new Reservation(); 
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM Reservation");
        while(res.next()){
            temp.setIdReservation(res.getInt(1));
            temp.setIdHotel(res.getInt(2));
            temp.setIdVisiteur(res.getInt(3));
            temp.setDateA(res.getDate(4));
            temp.setDateD(res.getDate(5));
            temp.setNbrPersonne(res.getInt(6));
            temp.setLit(res.getInt(7));
            temp.setCout(res.getFloat(8));
            temp.setDateRes(res.getDate(9));
            list.add(temp);
        }
         c.getconex().close();
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Reservation[] val=list.toArray(new Reservation[list.size()]); 
        return val;
    }
    
    public static String[] getcolumn(){
        Connexion c=new Connexion();
        Vector<String> list= new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'reservationv'");
        int count=0;
        while(res.next()){
           String temp= res.getString(1);
           if(temp.compareTo("ID_Visiteur")!=0){
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
}
