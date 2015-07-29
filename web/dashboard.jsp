<%-- 
    Document   : dashboard
    Created on : Jul 24, 2015, 7:09:02 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="work.dashboardServlet"%>
<%@page import="java.sql.*"%>
<%@page import="register.SQLConnector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        <h2>Welcome, <% //username
            //dashboardServlet ds = new dasboardServlet();
            HttpSession sess = request.getSession();
            String user = (String)session.getAttribute("user");
            
            out.println(user);
            %>
        </h2>
        <!--TODO add check of existing session to not let unlogged people here -->
        <div id="files">
            <%
                String sqlRequest = "SELECT * FROM userfiles WHERE username = '"+user+"'";
                SQLConnector sqlConnector = new SQLConnector();
                ResultSet res = sqlConnector.getResult(sqlRequest);
                
                while(res.next())
                {
                    int a=res.getInt("id");
                    String username = res.getString("username");
                    //String content = res.getString("content");
                    String size = res.getString("size");
                    String created = res.getString("created");
                    out.println("|"+a+"|"+user+"|"+"|"+size+"|"+created+"|"+"<br>");
                }
                
            %>
        </div>
            
        <form method="post" action="addNote">
            <input type="text" name="content" placeholder="Enter your text here...">
            <input type="submit" value="Create new Note">
        </form>
            
        <form method="post" action="logout">
            <input type="submit" value="Log out">
        </form>
    </body>
</html>
