
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bye <%= session.getAttribute("userid")%> </title>
    </head>
    <body>
        <h1><%= session.getAttribute("userid")%> is successfully logged out! </h1>
        <% session.removeAttribute("userid");%> <br><br>
        <a href="../index.jsp">Click here to go back</a>     
    </body>
</html>
