/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import connection.Connexion;
import gestion.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.Sadmin;
import service.Shotel;
import service.Sreservation;
import service.Svisiteur;

/**
 *
 * @author Mamitiana
 */
public class Table extends HttpServlet {

   

 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
        Integer page=1;
          if(req.getParameter("page")!=null){
              page=Integer.parseInt(req.getParameter("page"));
         }
        String table = req.getParameter("table");
        if(table.compareTo("Visiteur")==0)
        {
            Visiteur[] liste=Visiteur.getselectedVisiteur(((page-1)*3),"3");
            String[] column=Visiteur.getcolumn();
            int row=Svisiteur.searchNcount();
            req.setAttribute("classe", liste);
            req.setAttribute("colonne", column);
            req.setAttribute("table", table);
            req.setAttribute("nbrpage", row);
            req.setAttribute("page", page);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/table.jsp");
            dispatcher.forward(req,res);
            
        }
         if(table.compareTo("Hotel")==0)
        {
            Hotel[] liste=Hotel.getselectedHotel(((page-1)*3),"3");
            String[] column=Hotel.getcolumn();
            int row=Shotel.searchNcount();
            req.setAttribute("classe", liste);
            req.setAttribute("colonne", column);
            req.setAttribute("table", table);
            req.setAttribute("nbrpage", row);
            req.setAttribute("page", page);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/table.jsp");
            dispatcher.forward(req,res);
            
        }
          if(table.compareTo("Admin")==0)
        {
            Admin[] liste=Admin.getselectedAdmin(((page-1)*3),"3");
            String[] column=Admin.getcolumn();
            int row=Sadmin.searchNcount();
            req.setAttribute("classe", liste);
            req.setAttribute("colonne", column);
            req.setAttribute("table", table);
            req.setAttribute("nbrpage", row);
            req.setAttribute("page", page);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/table.jsp");
            dispatcher.forward(req,res);
            
        }
           if(table.compareTo("Reservation")==0)
        {
            Reservation[] liste=Reservation.getselectedReservation(((page-1)*3),"3");
            String[] column=Reservation.getcolumn();
            int row=Sreservation.searchNcount();
            req.setAttribute("classe", liste);
            req.setAttribute("colonne", column);
            req.setAttribute("table", table);
            req.setAttribute("nbrpage", row);
            req.setAttribute("page", page);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/table.jsp");
            dispatcher.forward(req,res);
            
        }

    }

   
  

}
