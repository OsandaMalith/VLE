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
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/login.css">
    </head>

    <body>
        <div class="login-logo">
            <img src="${pageContext.request.contextPath}/images/logo.png">
        </div>
        <div class="login-container">
            <h1>Enter Your Login Details</h1>
            <form action="LoginServlet" method="POST">
                <div class="login-radio-wrap">
                    <input id="rdo_admin" type="radio" name="login" value="admin"><label for="rdo_admin">&nbsp;Admin</label>
                    <input id="rdo_teacher" type="radio" name="login" value="teacher"><label for="rdo_teacher">&nbsp;Teacher</label>
                    <input id="rdo_student" type="radio" name="login" value="student" checked="checked"><label for="rdo_student">&nbsp;Student</label>
                </div>
                
                <label for="username">Username</label><input id="username" type="text" name="username" >
                <label for="password">Password</label><input id="password" type="password" name="password">
                <input type="submit" value="Sign in" alight="center">
            </form>
        </div>
        <footer class="login-footer">
            <span>&copy; 2016 Osanda</span>
        </footer>
    </body>
</html>
