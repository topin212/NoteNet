/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package register;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alex
 */
public class logoutServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse rep)
    {
        try {
            HttpSession sess = req.getSession();
            sess.invalidate();
            String ctxPath = req.getContextPath();
            rep.sendRedirect(ctxPath+"/login");
        } catch (IOException ex) {
            Logger.getLogger(logoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
