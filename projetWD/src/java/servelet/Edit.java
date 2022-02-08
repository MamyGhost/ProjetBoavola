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
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mamitiana
 */
public class Edit extends HttpServlet {

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
      
        if(table.compareTo("Visiteur")==0){
             String[] column=Visiteur.getcolumn();
             req.setAttribute("colonne", column);
             if(req.getParameter("type")!=null){
            String type=req.getParameter("type");
            req.setAttribute("type", type);
             req.setAttribute("table", table);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/edit.jsp");
            dispatcher.forward(req,res);
        }
             else{
        String id=req.getParameter("id");
        String[] temp1=Visiteur.searchS(Integer.parseInt(id));
        req.setAttribute("classeS", temp1);
            }
        }
         if(table.compareTo("Admin")==0){
              String[] column=Admin.getcolumn();
              req.setAttribute("colonne", column);
              if(req.getParameter("type")!=null){
            String type=req.getParameter("type");
            req.setAttribute("type", type);
            req.setAttribute("table", table);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/edit.jsp");
            dispatcher.forward(req,res);
        }
              else{
        String id=req.getParameter("id");
        String[] temp1=Admin.searchS(Integer.parseInt(id));
        req.setAttribute("classeS", temp1);
              }
        }
          if(table.compareTo("Hotel")==0){
                String[] column=Hotel.getcolumn1();
                 req.setAttribute("table", table);
               if(req.getParameter("type")!=null){
            String type=req.getParameter("type");
            req.setAttribute("type", type);
            req.setAttribute("colonne", column);
            req.setAttribute("table", table);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/edit.jsp");
            dispatcher.forward(req,res);
        }
               else{
        String id=req.getParameter("id");      
        String[] temp1=Hotel.searchS(Integer.parseInt(id));
        req.setAttribute("classeS", temp1);
               }
        }
           if(table.compareTo("Reservation")==0){
                String[] column=Reservation.getcolumn();
                req.setAttribute("colonne", column);
                if(req.getParameter("type")!=null){
            String type=req.getParameter("type");
             req.setAttribute("table", table);
            req.setAttribute("type", type);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/edit.jsp");
            dispatcher.forward(req,res);
        }
                else{
        String id=req.getParameter("id");       
        String[] temp1=Reservation.searchS(Integer.parseInt(id));
        req.setAttribute("classeS", temp1);
                }
        }
       
        req.setAttribute("table", table);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/edit.jsp");
        dispatcher.forward(req,res);
    
       
    }

    

}

