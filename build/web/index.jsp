<%-- 
    Document   : index
    Created on : 23.07.2015, 17:47:48
    Author     : Alex
--%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="register.SQLConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("register.SQLConnector");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NoteNet</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
        <p>You are not yet logged in, please, login with your existing account or sign up to create a new one!</p>
        <h3>This is a registration form</h3>
        <form method ="post" action="register" id="regform">
            <label for="usernameField">Choose a login:</label><input type="text" id="usernameField" name ="username" placeholder="Enter your username">
            <label for="passwordField">Chosse a password:</label><input type="password" id="passwordField" name ="password" placeholder="Enter your password">
            <label for="emailField">Enter your E-mail:</label><input type="text" id="emailField" name ="email" placeholder="Enter your email">
            <input type="submit" value="Sign up!">
        </form>
        <h3>This is a login form</h3>
        
        <form method ="post" action="login" id="loginform">
            <label for="usernameFieldLogin">Login or e-mail:</label><input type="text" id="usernameFieldLogin" name ="username" placeholder="Enter your username">
            <label for="passwordFieldLogin">Password:</label><input type="password" id="passwordFieldLogin" name ="password" placeholder="Enter your password">
            <input type="submit" value="Sign up!">
        </form>
        
        <br><br><br>

        
        <%
            String sqlRequest = "SELECT * FROM users";
            SQLConnector connector = new SQLConnector();
            ResultSet res = connector.getResult(sqlRequest);
            
            while(res.next())
            {
                int a=res.getInt("id");
                String user = res.getString("username");
                String password = res.getString("password");
                String email = res.getString("email");
                
                out.println("|"+a+"|"+user+"|"+password+"|"+email+"|"+"<br>");
            }
            
          
        %>
    </body>
</html>
