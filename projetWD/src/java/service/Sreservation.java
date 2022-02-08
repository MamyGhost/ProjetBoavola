/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import connection.Connexion;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Mamitiana
 */
public class Sreservation {
    
    
    public static Float getgainnmensuel()
    {
        Connexion c = new Connexion();
        Float argent=0.0F;
        String requete="select sum(cout) from reservation where month(DateRes)=month(CURRENT_DATE())";
          try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(requete);
        while(res.next()){
           argent=res.getFloat(1);
        }
       
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return argent;
    }
   
    
      public static Float getgainannuel()
    {
        Connexion c = new Connexion();
        Float argent=0.0F;
        String requete="select sum(cout) from reservation where year(DateRes)=year(CURRENT_DATE())";
          try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(requete);
        while(res.next()){
           argent=res.getFloat(1);
        }
       
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return argent;
    }
      
        public static Float[][] getstatannuel()
    {
        Connexion c = new Connexion();
        Float[][] argent=new Float[1][12];
        String requete="SELECT \n" +
            "  SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 1 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Janvier\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 2 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Fevrier\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 3 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Mars\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 4 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Avril\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 5 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Mai\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 6 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Juin\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 7 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Juillet\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 8 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Aout\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 9 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Septembre\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 10 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Octobre\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 11 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Novembre\",\n" +
            "        SUM(CASE MONTH(DateRes)\n" +
            "          WHEN 12 THEN cout\n" +
            "      ELSE 0\n" +
            "    END) \"Decembre\"\n" +
            "FROM reservation where year(DateRes)=year(CURRENT_DATE());";
          try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(requete);
        while(res.next()){
            for(int i=0;i<argent[0].length;i++){
                argent[0][i]=res.getFloat(i+1);
            }
           
        }
       
         }
         catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return argent;
    }
        
    public static int searchNcount()
    {
        Connexion c = new Connexion();
         int row=0;
         String requete="select count(*) from reservation ";
        
//         request=request+" limit "+page.toString()+",5";
        
        try {
        Statement stmt = c.getconex().createStatement();
        ResultSet res = stmt.executeQuery(requete);
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
}
