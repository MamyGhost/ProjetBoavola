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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mamitiana
 */
public class Delete extends HttpServlet {

    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req
     * @param res
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
         res.setContentType("text/html");
        PrintWriter out = res.getWriter();
         String table=req.getParameter("table");
         Integer id=Integer.parseInt(req.getParameter("id"));
         if(table.compareTo("Visiteur")==0){
            Visiteur temp=new Visiteur();
            temp.delete(id);
         }
         if(table.compareTo("Admin")==0){
            Admin temp=new Admin();
             temp.delete(id);
         }
         if(table.compareTo("Hotel")==0){
            Hotel temp= new Hotel();
             temp.delete(id);
         }
         if(table.compareTo("Reservation")==0){
             Reservation temp= new Reservation();
              temp.delete(id);
         }
       res.sendRedirect(req.getContextPath()+"/Table?table="+table);

        
    }

   

}
