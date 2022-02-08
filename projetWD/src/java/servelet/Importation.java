/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Mamitiana
 */
@MultipartConfig

public class Importation extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String table=request.getParameter("table");
        Part part = request.getPart("file");
        String fileName = part.getSubmittedFileName();
        if(fileName.contains(".jpg") || fileName.contains(".png")){
            String path = "D:\\ProgSystem\\S4\\webdynqmique\\backup\\projetWD\\web\\assets\\img";
            String finalLocation = path + File.separator + fileName;
            part.write(finalLocation);
            response.sendRedirect(request.getContextPath()+"/Table?table="+table);

        }
        else{
            String path = "D:\\ProgSystem\\S4\\webdynqmique\\backup\\projetWD\\web\\assets\\fichier";
            String finalLocation = path + File.separator + fileName;
            part.write(finalLocation);
            response.sendRedirect(request.getContextPath()+"/Table?table="+table);
        }
        
          
    }

  

}
