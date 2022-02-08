/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import gestion.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

/**
 *
 * @author Mamitiana
 */
public class Reserver extends HttpServlet {

   
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req servlet request
     * @param res servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        Reservation reserve=new Reservation();
        HttpSession session = req.getSession();
        Visiteur visiteur=(Visiteur)session.getAttribute("visiteur");
           out.println(visiteur.getIdVisiteur());
        Cookie[] cookies = req.getCookies();
        try{
        long millis=System.currentTimeMillis();  
        java.sql.Date dateRes=new java.sql.Date(millis);
        Integer idhotel=Integer.parseInt(cookies[1].getValue());
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date tarrive = format.parse(req.getParameter("arrive"));
        java.sql.Date arrive = new java.sql.Date(tarrive.getTime());
        Date tdepart = format.parse(req.getParameter("depart"));
        java.sql.Date depart = new java.sql.Date(tdepart.getTime());
        Integer nbrp=Integer.parseInt(req.getParameter("nbrpersonne"));
        Integer lits=Integer.parseInt(req.getParameter("lits"));
        Float tarif=Float.parseFloat(cookies[2].getValue());

        reserve=new Reservation(idhotel,visiteur.getIdVisiteur(),arrive,depart,nbrp,lits,tarif,dateRes);
        out.println(reserve.getDateRes());
        reserve.create();
     
       
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/ListeReservation");
       dispatcher.forward(req,res);
        
    }

   
}
