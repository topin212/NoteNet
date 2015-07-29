<%-- 
    Document   : dashboard
    Created on : Jul 24, 2015, 7:09:02 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="work.dashboardServlet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        <h2>Welcome, <% //username
            //dashboardServlet ds = new dasboardServlet();
            
            out.println();%>
        </h2>
        
        <form action="logout" method="post">
            <input type="button" value="Log out">
        </form>
    </body>
</html>
