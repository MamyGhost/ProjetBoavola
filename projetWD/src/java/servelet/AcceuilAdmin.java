/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.Sreservation;

/**
 *
 * @author Mamitiana
 */
public class AcceuilAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
         res.setContentType("text/html");
         PrintWriter out = res.getWriter();
        Float argentM= Sreservation.getgainnmensuel();
        Float argentA= Sreservation.getgainannuel();
        Float[][] statA=Sreservation.getstatannuel();
        HttpSession session = req.getSession();
        session.setAttribute("argentM", argentM);
        session.setAttribute("argentA", argentA);
        session.setAttribute("statA", statA);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/acceuil.jsp");
        dispatcher.forward(req,res);
    }
    
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
         res.setContentType("text/html");
         PrintWriter out = res.getWriter();
        Float argentM= Sreservation.getgainnmensuel();
        Float argentA= Sreservation.getgainannuel();
        Float[][] statA=Sreservation.getstatannuel();
        HttpSession session = req.getSession();
        session.setAttribute("argentM", argentM);
        session.setAttribute("argentA", argentA);
        session.setAttribute("statA", statA);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/admin/acceuil.jsp");
        dispatcher.forward(req,res);
    }

    

}
