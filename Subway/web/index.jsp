<%-- 
    Document   : index
    Created on : Mar 17, 2016, 11:17:13 AM
    Author     : cb005482
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to VLE Login Portal</title>
        <style type="text/css">
            .container {
                width: 500px;
                clear: both;
            }
            .container input {
                width: 100%;
                clear: both;
            }
            P { text-align: center }
        </style>
    </head>

    <body>
        <h1>Enter Your Login Details</h1>
        <form action="LoginServlet" method="POST">
            <input type="radio" name="login" value="admin"> Admin
            <input type="radio" name="login" value="teacher"> Teacher
            <input type="radio" name="login" value="student" checked="checked"> Student
            <div class="container">
                <p> Username   : </p> <input type="name" name="username" > <br>
                <p> Password: </p> <input type="password" name="password"> <br><br>
                <input type="submit" value="Sign in" alight="center">
                </form>
            </div>
    </body>
</html>
