package servelet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import gestion.*;

/**
 *
 * @author pc
 */

public class SearchAdmin extends HttpServlet{

    /**
     * @param args the command line arguments
     */
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        // TODO code application logic here
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        
        
}
}