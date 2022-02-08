/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import connection.Connexion;
import gestion.Admin;
import gestion.Hotel;
import gestion.Reservation;
import gestion.Visiteur;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mamitiana
 */
public class EditValidation extends HttpServlet {


   
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req servlet request
     * @param res servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");
         String table=req.getParameter("table");
        try{
         
         if(table.compareTo("Visiteur")==0){
             if(req.getParameter("type")!=null){
                Visiteur temp=new Visiteur(req.getParameter("Nom"),req.getParameter("Prenom"),req.getParameter("Mail"),req.getParameter("Numero"),req.getParameter("Mdp"),Float.parseFloat(req.getParameter("Vola")));
                temp.create();
                }
             else{
                 int id=Integer.parseInt(req.getParameter("id"));
                  Visiteur temp=new Visiteur(id,req.getParameter("Nom"),req.getParameter("Prenom"),req.getParameter("Mail"),req.getParameter("Numero"),req.getParameter("Mdp"),Float.parseFloat(req.getParameter("Vola")));
                  temp.update(id);
             }
            
         }
         if(table.compareTo("Admin")==0){
             if(req.getParameter("type")!=null){
             Admin temp=new Admin(req.getParameter("Pseudo"),req.getParameter("Mdp"));
             temp.create();
             }
             else{
                 int id=Integer.parseInt(req.getParameter("id"));
             Admin temp=new Admin(id,req.getParameter("Pseudo"),req.getParameter("Mdp"));
             temp.update(id);
             }
         }
         if(table.compareTo("Hotel")==0){
             if(req.getParameter("type")!=null){
             Hotel temp=new Hotel(req.getParameter("Nom"),Float.parseFloat(req.getParameter("Tarif")),req.getParameter("Description"),req.getParameter("Photo"),Integer.parseInt(req.getParameter("Values")),Integer.parseInt(req.getParameter("Hebergement")),req.getParameter("Pays"),req.getParameter("Region"),Integer.parseInt(req.getParameter("etoiles")));
             temp.create();    
             }
             else{
                 int id=Integer.parseInt(req.getParameter("id"));
             Hotel temp=new Hotel(id,req.getParameter("Nom"),Float.parseFloat(req.getParameter("Tarif")),req.getParameter("Description"),req.getParameter("Photo"),Integer.parseInt(req.getParameter("Values")),Integer.parseInt(req.getParameter("Hebergement")),req.getParameter("Pays"),req.getParameter("Region"),Integer.parseInt(req.getParameter("etoiles")));
             temp.update(id);
             }
         }
         if(table.compareTo("Reservation")==0){
              Reservation temp;
             SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsed = format.parse(req.getParameter("Date_A"));
            java.util.Date parsed1 = format.parse(req.getParameter("Date_D"));
             java.util.Date parsed2 = format.parse(req.getParameter("DateRes"));
            java.sql.Date dateA = new java.sql.Date(parsed.getTime());
            java.sql.Date dateD = new java.sql.Date(parsed1.getTime());
             java.sql.Date dateRes = new java.sql.Date(parsed2.getTime());
             if(req.getParameter("type")!=null){
               temp = new Reservation(Date.valueOf(req.getParameter("DateA")),Date.valueOf(req.getParameter("DateD")),Integer.parseInt(req.getParameter("Lit")),Float.parseFloat(req.getParameter("cout")),req.getParameter("Hotel"),req.getParameter("Visiteur"),dateRes);
               temp.create();  
             }
             else{
              int id=Integer.parseInt(req.getParameter("id"));
             temp = new Reservation(id,Date.valueOf(req.getParameter("DateA")),Date.valueOf(req.getParameter("DateD")),Integer.parseInt(req.getParameter("Lit")),Float.parseFloat(req.getParameter("cout")),req.getParameter("Hotel"),req.getParameter("Visiteur"),dateRes);
             temp.update(id);
             }
         }
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        
         RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Table?table="+table);
         dispatcher.forward(req,res);

    }

   
  
}
