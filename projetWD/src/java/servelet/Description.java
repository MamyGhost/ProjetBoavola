/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import gestion.Categorie;
import gestion.Hotel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mamitiana
 */
public class Description extends HttpServlet {

    
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
        HttpSession session = req.getSession();
        String id= req.getParameter("idhotel");
        String[] cat=Categorie.getcategorie();
        Hotel hotel=Hotel.search(Integer.parseInt(id));
        req.setAttribute("hotel", hotel);
        Cookie cookieid = new Cookie("IdHotel", id);
        Cookie cookietarif = new Cookie("tarif", hotel.getTarif().toString());
        res.addCookie(cookieid);
        res.addCookie(cookietarif);
        req.setAttribute("cat", cat);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/front/fiche.jsp");
        dispatcher.forward(req,res);
 }

    

}
