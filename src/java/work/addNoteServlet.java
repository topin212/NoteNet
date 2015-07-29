/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package work;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import register.SQLConnector;
/**
 *
 * @author Alex
 */
public class addNoteServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse rep)
    {
        HttpSession sess = req.getSession();
        String name = (String) sess.getAttribute("user"); //get username
        
        String content = req.getParameter("content"); //get content for the sql update
        
        int size = content.length();
        
//        Date date = new Date();
        
        if(size!=0)
        {
            //check if there is somebody with that name
            SQLConnector tmpSQL = new SQLConnector();
            String request = "INSERT INTO userfiles VALUES (NULL, '"+name+"', '"+content+"', '"+size+"', NOW())";
            tmpSQL.insertValues(request);
            String ctxPath = req.getContextPath();
            try {
                rep.sendRedirect(ctxPath+"/dashboard.jsp");
            } catch (IOException ex) {
                Logger.getLogger(addNoteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
        }
    }
}
