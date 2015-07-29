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
         <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="style.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="bootstrap/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    <body>
       <div class="container">

      <form class="form-signin" method="post" action="login">
        <h2 class="form-signin-heading">Log in right meow</h2>
        <label for="inputUsername" class="sr-only">Username</label>
        <input type="text" name="username" id="inputUsername" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
      
      <form class="form-register" method="post" action="register">
        <h2 class="form-register-heading">No account yet?</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputUsername" class="sr-only">Email address</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
      </form>

    </div> <!-- /container -->

        
    <%--<%
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
        %>--%>
        <script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>