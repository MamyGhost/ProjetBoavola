/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;
import connection.Connexion;
import gestion.*;
import static gestion.Admin.getallAdmin;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Mamitiana
 */
public class Sadmin {
    
      public static Admin connexionAdmin(String pseudo,String mdp)
    {
        Connexion c=new Connexion();
       Admin[] list=getallAdmin();
        for(int i=0;i<list.length;i++)
        {
            if(list[i].getPseudo().compareTo(pseudo)==0 && list[i].getMdp().compareTo(mdp)==0)
            {
                return  list[i];
            }
        }
        return null;
    }
      
                public static int searchNcount()
    {
        Connexion c = new Connexion();
         int row=0;
         String request="select count(*) from admin ";
        
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
}
