/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;
import java.sql.*;

/**
 *
 * @author T76
 */
public class Connexion {
   
	Connection conex; 

	public 	Connexion()
	{
		try
    {
      //étape 1: charger la classe de driver
      Class.forName("com.mysql.jdbc.Driver");

      //étape 2: créer l'objet de connexion
      conex = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/projetmvc", "root", "");
    }
    catch(Exception e){ 
      System.out.println(e);
    }
	}

	public Connection getconex()
	{
		return conex;
	}
}
