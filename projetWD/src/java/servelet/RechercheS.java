/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import connection.Connexion;
import gestion.Categorie;
import gestion.Hotel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.Shotel;

/**
 *
 * @author Mamitiana
 */
public class RechercheS extends HttpServlet {

    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
         Integer page=1;
         if(req.getParameter("page")!=null){
              page=Integer.parseInt(req.getParameter("page"));
         }
         String nom=req.getParameter("nom");
         String[] cat=Categorie.getcategorie();
         int row=Shotel.searchNcount(nom);
         Hotel[] hotely=Shotel.searchN(nom,((page-1)*3));
         req.setAttribute("hotel", hotely);
         req.setAttribute("cat", cat);
         req.setAttribute("nom", nom);
         req.setAttribute("nbrpage",row);
         req.setAttribute("page", page);
         req.setAttribute("type", "simple");
        
         
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/front/resultat.jsp");
     dispatcher.forward(req,res);
    }
    
        

   

}
