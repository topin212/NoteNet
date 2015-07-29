/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package register;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Alex
 */
public class SQLConnector {
               String URL = "jdbc:mysql://localhost:3306/test";
               String username = "root";
               String password = "";
               
               Connection connect = null;
               PreparedStatement statement = null;
               ResultSet result = null;
               
               public SQLConnector() 
               {
                   try{
                       Class.forName("com.mysql.jdbc.Driver").newInstance();
                       connect = DriverManager.getConnection(URL, username, password);
                       
                   }catch(SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException sqle){
                       sqle.printStackTrace();
                   }
               }
               
               public void insertValues(String sql)
               {
                   try {
                       statement.executeUpdate(sql);
                   } catch (SQLException ex) {
                       Logger.getLogger(SQLConnector.class.getName()).log(Level.SEVERE, null, ex);
                   }
               }
               
               public ResultSet getResult(String queue)
               {
                   try{
                       statement = connect.prepareCall(queue);
                       result = statement.executeQuery();
                   }catch(SQLException sqle)
                   {
                       System.out.println("Something gone wrong wile getting the response.");
                       sqle.printStackTrace();
                   }
                   return result;
               }              
}