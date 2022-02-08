package servelet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import gestion.*;
import service.Sadmin;

/**
 *
 * @author pc
 */

public class SconnexionAdmin extends HttpServlet{

    /**
     * @param req
     * @param res
     * @param args the command line arguments
     */
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        // TODO code application logic here
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        if(Sadmin.connexionAdmin(req.getParameter("pseudo"),req.getParameter("password"))!=null)
        {
            
            HttpSession session = req.getSession();
            Admin admin=Sadmin.connexionAdmin(req.getParameter("pseudo"),req.getParameter("password"));
            session.setAttribute("admin",admin);
            session.setAttribute("type","admin");
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/AcceuilAdmin");
            dispatcher.forward(req,res);
            
            

        }
        else{
            req.setAttribute("error",1);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/page/login.jsp");
            dispatcher.forward(req,res);
        }
        
}
}