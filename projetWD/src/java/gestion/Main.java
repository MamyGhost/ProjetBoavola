/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;
import connection.Connexion;
import java.sql.*;
import gestion.*;
import service.Shotel;
import service.Sreservation;
/**
 *
 * @author Mamitiana
 */
public class Main {
    
    public static void main(String[] ftft) throws Exception
	{
            try
    {
      //étape 1: charger la classe de driver
      Class.forName("com.mysql.jdbc.Driver");

      //étape 2: créer l'objet de connexion
      Connection conn = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/projetmvc", "root", "");

      //étape 3: créer l'objet statement 
     Statement stmt = conn.createStatement();
    ResultSet res = stmt.executeQuery("SELECT * FROM hotelV ORDER BY RAND() LIMIT 3");
    

      //étape 4: exécuter la requête
      while(res.next())
        System.out.println(res.getInt(1)+"  "+res.getString(2)
        +"  "+res.getString(3));

      //étape 5: fermez l'objet de connexion
      conn.close();
    }
    catch(Exception e){ 
      System.out.println(e);
    }
       
   Hotel[] gg=Shotel.gettopHotel();
   System.out.println(gg.length);
   
   Float [][] test=Sreservation.getstatannuel();
   System.out.println("testabe");
   for(int i=0;i<test.length;i++){
       System.out.println(test[0][i]);
   }
   
        }
   
    
}
