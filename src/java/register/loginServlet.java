/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alex
 */
public class loginServlet extends HttpServlet{
    protected void doPost(HttpServletRequest req, HttpServletResponse rep)
    {
        rep.setContentType("text/html; charset=UTF-8");
        PrintWriter out = null;
        try {
            out = rep.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        
        if(name!=null && password!=null)
        {
            //check if there is somebody with that name
            SQLConnector tmpSQL = new SQLConnector();
            String forResult = "SELECT * FROM users WHERE username = '"+name+"' AND password = '"+password+"'";
            ResultSet res = tmpSQL.getResult(forResult);
            try {
                if(res.next())
                    if(res.getString("username").equals(name) && res.getString("password").equals(password))
                    {
                        out.println("Welcome, "+name);
                        
                        HttpSession session = req.getSession();
                        session.setAttribute("user", name);
                        
                        String ctxPath = req.getContextPath();
                        
                        //ServletContext ctx = getServletContext();
                        //RequestDispatcher rd = ctx.getRequestDispatcher(ctxPath+"/dashboardServlet");
                        //rd.forward(req, rep);
                        rep.sendRedirect(ctxPath+"/dashboard");
                    
                    }
                    else
                    {
                        out.println("Your login or password is incorrect.");
                    }
            } catch (SQLException | IOException ex) {
               Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }     
        }  
    }
}
