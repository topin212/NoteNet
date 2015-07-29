package register;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Alex
 */
public class RegisterServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse rep)
    {
        rep.setContentType("text/html; charset=UTF-8");
        PrintWriter out = null;
        try {
            out = rep.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
          
          
          
        if(name!=null && password!=null && email!=null)
        {
            //check if there is somebody with that name
            SQLConnector tmpSQL = new SQLConnector();
            String forResult = "SELECT * FROM users WHERE username = '"+name+"'";
            ResultSet res = tmpSQL.getResult(forResult);
            try {
                if(res.next())
                    if(res.getString("username").equals(name))
                    {
                        out.println("This username is already in use, try another one!");
                    }
                    else
                    {
                        String request = "INSERT INTO users VALUES (NULL, '"+name+"', '"+password+"', '"+email+"')";
                        new SQLConnector().insertValues(request);
                    }
            } catch (SQLException ex) {
               Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }     
        }
        out.close();
    }
}