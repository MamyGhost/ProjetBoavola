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
public class Acceuil extends HttpServlet {

    

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
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
         Hotel[] trois=Shotel.getthreeHotel();
         String[] cat=Categorie.getcategorie();
         Hotel[] top =Shotel.gettopHotel();
        req.setAttribute("trois", trois);
        req.setAttribute("top", top);
        req.setAttribute("cat", cat);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/front/acceuil.jsp");
        dispatcher.forward(req,res);
        
         
    }
    
     protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
         Hotel[] trois=Shotel.getthreeHotel();
         String[] cat=Categorie.getcategorie();
         Hotel[] top =Shotel.gettopHotel();
        req.setAttribute("trois", trois);
        req.setAttribute("top", top);
        req.setAttribute("cat", cat);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/front/acceuil.jsp");
        dispatcher.forward(req,res);
        
       }

}
