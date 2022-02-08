/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import connection.Connexion;
import gestion.Hotel;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Mamitiana
 */
public class Shotel {
   
    public static Hotel[] getthreeHotel()
    {
        Connexion c = new Connexion();
         Vector<Hotel> list=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("SELECT * FROM hotelV ORDER BY RAND() LIMIT 3");
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
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
         Hotel[] val=list.toArray(new Hotel[list.size()]); 
        return val;
        
    }
    
      public static Hotel[] gettopHotel()
    {
        Connexion c = new Connexion();
         Vector<Hotel> list=new Vector();
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery("select * from hotelv ORDER by valeur desc LIMIT 6");
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
      
      public static Hotel[] searchAV(String[] parameter,Integer page)
    {
        Connexion c = new Connexion();
         Vector<Hotel> list=new Vector();
         String request="select * from hotelv where ";
      
       if(parameter[0].isEmpty() && parameter[1].isEmpty() &&  parameter[2].compareTo("all")==0){
             request=request+"tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
          if(parameter[0].isEmpty() && parameter[1].isEmpty() &&  parameter[2].compareTo("all")!=0){
             request=request+"etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
          if(parameter[1].isEmpty()==false && parameter[0].isEmpty() &&  parameter[2].compareTo("all")==0){
             request=request+"region like %'"+parameter[1]+"%' and"+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
           if(parameter[1].isEmpty()==false && parameter[0].isEmpty() && parameter[2].compareTo("all")!=0){
             request=request+"region like %'"+parameter[1]+"%' and etoiles="+parameter[2]+"' and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
            if(parameter[0].isEmpty()==false && parameter[1].isEmpty() && parameter[2].compareTo("all")==0){
             request=request+"pays like '%"+parameter[0]+"%' and"+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
            if(parameter[0].isEmpty()==false && parameter[1].isEmpty() && parameter[2].compareTo("all")!=0){
             request=request+"pays like '%"+parameter[0]+"%' and etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+"and "+parameter[4];
         }
             if(parameter[0].isEmpty()==false && parameter[1].isEmpty()==false &&  parameter[2].compareTo("all")!=0){
             request=request+"pays like '%"+parameter[0]+"%' and region like '%"+parameter[1]+"%' and etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
             if(parameter[0].isEmpty()==false && parameter[1].isEmpty()==false &&  parameter[2].compareTo("all")==0){
             request=request+"pays like '%"+parameter[0]+"%' and region like '%"+parameter[1]+"%' and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
             request=request+" limit "+page.toString()+",3";
             System.out.print(request);
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(request);
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
      
      
         public static String searchAVS(String[] parameter,Integer page)
    {
        
         String request="select * from hotelv where ";
       if(parameter[0].isEmpty() && parameter[1].isEmpty() &&  parameter[2].compareTo("all")==0){
             request=request+"tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
          if(parameter[0].isEmpty() && parameter[1].isEmpty() &&  parameter[2].compareTo("all")!=0){
             request=request+"etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
          if(parameter[1].isEmpty()==false && parameter[0].isEmpty() &&  parameter[2].compareTo("all")==0){
             request=request+"region like %'"+parameter[1]+"%' and"+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
           if(parameter[1].isEmpty()==false && parameter[0].isEmpty() && parameter[2].compareTo("all")!=0){
             request=request+"region like %'"+parameter[1]+"%' and etoiles="+parameter[2]+"' and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
            if(parameter[0].isEmpty()==false && parameter[1].isEmpty() && parameter[2].compareTo("all")==0){
             request=request+"pays like '%"+parameter[0]+"%' and"+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
            if(parameter[0].isEmpty()==false && parameter[1].isEmpty() && parameter[2].compareTo("all")!=0){
             request=request+"pays like '%"+parameter[0]+"%' and etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+"and "+parameter[4];
         }
             if(parameter[0].isEmpty()==false && parameter[1].isEmpty()==false &&  parameter[2].compareTo("all")!=0){
             request=request+"pays like '%"+parameter[0]+"%' and region like '%"+parameter[1]+"%' and etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
             if(parameter[0].isEmpty()==false && parameter[1].isEmpty()==false &&  parameter[2].compareTo("all")==0){
             request=request+"pays like '%"+parameter[0]+"%' and region like '%"+parameter[1]+"%' and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
             request=request+" limit "+page.toString()+",3";
             
         
        return request;
        
    }
      
         
             public static int searchAVcount(String[] parameter)
    {
        Connexion c = new Connexion();
         int row=0;
         String request="select count(*) from hotelv where ";
       if(parameter[0].isEmpty() && parameter[1].isEmpty() &&  parameter[2].compareTo("all")==0){
             request=request+"tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
          if(parameter[0].isEmpty() && parameter[1].isEmpty() &&  parameter[2].compareTo("all")!=0){
             request=request+"etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
          if(parameter[1].isEmpty()==false && parameter[0].isEmpty() &&  parameter[2].compareTo("all")==0){
             request=request+"region like %'"+parameter[1]+"%' and"+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
           if(parameter[1].isEmpty()==false && parameter[0].isEmpty() && parameter[2].compareTo("all")!=0){
             request=request+"region like %'"+parameter[1]+"%' and etoiles="+parameter[2]+"' and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
            if(parameter[0].isEmpty()==false && parameter[1].isEmpty() && parameter[2].compareTo("all")==0){
             request=request+"pays like '%"+parameter[0]+"%' and"+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
            if(parameter[0].isEmpty()==false && parameter[1].isEmpty() && parameter[2].compareTo("all")!=0){
             request=request+"pays like '%"+parameter[0]+"%' and etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+"and "+parameter[4];
         }
             if(parameter[0].isEmpty()==false && parameter[1].isEmpty()==false &&  parameter[2].compareTo("all")!=0){
             request=request+"pays like '%"+parameter[0]+"%' and region like '%"+parameter[1]+"%' and etoiles="+parameter[2]+" and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
             if(parameter[0].isEmpty()==false && parameter[1].isEmpty()==false &&  parameter[2].compareTo("all")==0){
             request=request+"pays like '%"+parameter[0]+"%' and region like '%"+parameter[1]+"%' and "+" tarif BETWEEN "+parameter[3]+" and "+parameter[4];
         }
//             request=request+" limit "+page.toString()+",5";
              try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(request);
        while(res.next()){
           row=res.getInt(1);
        }
         
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        int valiny=0;
              if(row%3==0)
              {
                  valiny=row/3;
              }
              else{
                  valiny=(int)row/3+1;
              }
         
        return valiny;
        
    }
             
                  
             public static int searchNcount(String nom)
    {
        Connexion c = new Connexion();
         int row=0;
         String request="select count(*) from hotelv where nom like '%"+nom+"%'";
        
//         request=request+" limit "+page.toString()+",5";
        
        try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(request);
        while(res.next()){
           row=res.getInt(1);
        }
       
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        int valiny=0;
              if(row%3==0)
              {
                  valiny=row/3;
              }
              else{
                  valiny=(int)row/3+1;
              }
         
        return valiny;
        
    
    }
             
             public static int searchNcount()
    {
        Connexion c = new Connexion();
         int row=0;
         String request="select count(*) from hotel";
        
//         request=request+" limit "+page.toString()+",5";
        
        try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(request);
        while(res.next()){
           row=res.getInt(1);
        }
       
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        int valiny=0;
              if(row%3==0)
              {
                  valiny=row/3;
              }
              else{
                  valiny=(int)row/3+1;
              }
         
        return valiny;
        
    
    }
      
        public static Hotel[] searchN(String nom,Integer page)
    {
        Connexion c = new Connexion();
         Vector<Hotel> list=new Vector();
         String request="select * from hotelv where nom like '%"+nom+"%'";
        
         request=request+" limit "+page.toString()+",3";
         
         try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(request);
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
      
   
}
