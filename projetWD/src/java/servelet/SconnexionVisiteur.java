package servelet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import gestion.*;
import service.Svisiteur;

/**
 *
 * @author pc
 */

public class SconnexionVisiteur extends HttpServlet{

    /**
     * @param req
     * @param res
     * @param args the command line arguments
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        // TODO code application logic here
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        if(Svisiteur.connexionVisiteur(req.getParameter("mail"),req.getParameter("mdp"))!=null)
        {
            HttpSession session = req.getSession();
            session.setAttribute("visiteur",Svisiteur.connexionVisiteur(req.getParameter("mail"),req.getParameter("mdp")));
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Acceuil");
            dispatcher.forward(req,res);

        }
        else{
            req.setAttribute("error",1);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page.jsp");
            dispatcher.forward(req,res);
        }
}
}