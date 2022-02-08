/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import gestion.Reservation;
import gestion.Visiteur;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mamitiana
 */
public class ListeReservation extends HttpServlet {

  

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
       PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();
        Visiteur visiteur=(Visiteur)session.getAttribute("visiteur");
          String[] column=Reservation.getcolumn();
        Reservation[] liste=Reservation.getReservation(visiteur.getIdVisiteur());
      
         req.setAttribute("reservation", liste);
         req.setAttribute("colonne", column);
        
         
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/front/historique.jsp");
     dispatcher.forward(req,res);
    }
  

}
