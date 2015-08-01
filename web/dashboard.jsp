<%-- 
    Document   : dashboard
    Created on : Jul 24, 2015, 7:09:02 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="work.dashboardServlet"%>
<%@page import="java.sql.*"%>
<%@page import="register.SQLConnector"%>
<%@page import="extra.RegEx"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="textfield.css" rel="stylesheet">
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <title>Dashboard</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container">
                <p class="navbar-brand">NotNet</p>
                <form class="navbar-text navbar-right" action="logout" method="POST">
                    <input id="logout" class="navbar-link" type="submit" name="logout" value="logout">
                </form>
                <p class="navbar-text navbar-right">Signed in as <button type="button" id="logout" class="navbar-link"><% //username            //dashboardServlet ds = new dasboardServlet();
                                                                                                        HttpSession sess = request.getSession();
                                                                                                        String user = (String)session.getAttribute("user");

                                                                                                        out.println(user);%>
                </button>
                </p>
            </div> 
        </nav>

        <div class="page-header">
            <h2>Welcome here, <%=user%>.</h2>
        </div>
        <!--
        <div class="container">
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    <h4 class="list-group-item-heading">Первая запись</h4>
                    <p class="list-group-item-text">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, officia!
                    </p>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">Вторая запись</h4>
                    <p class="list-group-item-text">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, officia!
                    </p>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">Хуевая запись</h4>
                    <p class="list-group-item-text">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, officia!
                    </p>
                </a>
            </div>
        -->
        <!--TODO add check of existing session to not let unlogged people here -->
        <div class="container">
            <div class="list-group">
                <%
                    String sqlRequest = "SELECT * FROM userfiles WHERE username = '"+user+"'";
                    SQLConnector sqlConnector = new SQLConnector();
                    ResultSet res = sqlConnector.getResult(sqlRequest);

                    String query = request.getQueryString();//this query looks like "sel=45"
                    String regulex = "[^=]+=([0-9]+)"; //even this guy returns no matches
                    String result = null;
                    Integer selected = null;
                    
                    String ctxPath = request.getContextPath();
                    if(query!=null)
                    {
                        result = RegEx.checkRegex(query, regulex);
                        selected = new Integer(result);
                    }
    
                    //out.println(result);
                    
                    while(res.next())
                    {
                        int a=res.getInt("id");
                        //String username = res.getString("username");
                        String content = res.getString("content");
                        //String size = res.getString("size");
                        String created = res.getString("created");
                        if(selected!=null)
                        {
                            if(selected!=a){
                                out.println("<a href="+ctxPath+"/dashboard.jsp?sel="+a+" class=\"list-group-item\"><h4 class=\"list-group-item-heading\">"+a+created+"</h4><p class=\"list-group-item-text\">"+content+" </p></a>");
                            }
                            else{
                                out.println("<a href="+ctxPath+"/dashboard.jsp?sel="+a+" class=\"list-group-item active\"><h4 class=\"list-group-item-heading\">"+a+created+"</h4><p class=\"list-group-item-text\">"+content+" </p></a>");
                            } 
                        }
                        else{
                        selected = a;
                        }
                          
                    }

                %>
            </div>
            
            
            <form id="input-group" method="POST" class="input-group" action="addNote">
            <div>
                <input  id="textfield" name="content" type="text" class="form-control" aria-describedby="basic-addon2"/>
            </div>
            <div>
                <button id="subm-btn" type="submit" class="btn btn-primary">Submit</button>
            </div>
            <div id="alert">
                <div class="alert alert-success" role="alert">Запись успешно добавлена</div>
                <div class="alert alert-danger" role="alert">Ошибка при добавлении записи</div>
            </div>
            </form>
        </div>
         <!--
            
        <form method="post" action="logout">
            <input type="submit" value="Log out">
        </form> -->
    </body>
</html>
