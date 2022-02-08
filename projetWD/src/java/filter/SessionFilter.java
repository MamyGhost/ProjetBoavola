/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import gestion.Admin;
import gestion.Visiteur;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mamitiana
 */
@WebFilter(filterName = "SessionFilter", urlPatterns = {"/Reserver","/AcceuilAdmin","/Table","/Edit","/EditValidation","/Delete"})
public class SessionFilter implements Filter {
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
       HttpServletRequest req = (HttpServletRequest) request;
       HttpServletResponse res = (HttpServletResponse) response;
       HttpSession session = req.getSession();
       
       Visiteur visiteur = (Visiteur)session.getAttribute("visiteur");
       
       Admin admin = (Admin)session.getAttribute("admin");
       
       String chemin = req.getServletPath();
       
       String method = req.getMethod();
       
       if(visiteur!= null || admin!= null ){
           chain.doFilter(request, response);
           }
       else{
           if(chemin.equals("/Reserver")){
                RequestDispatcher rd =  request.getRequestDispatcher("/page/front/login.jsp?warning=1");
                rd.forward(request, response);
           }
           else{
               RequestDispatcher rd =  request.getRequestDispatcher("/page/admin/login.jsp");
               rd.forward(request, response);
           
            }
       }
}

}
