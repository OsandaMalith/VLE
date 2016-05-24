<%-- 
    Document   : redirect
    Created on : May 15, 2016, 11:43:59 PM
    Author     : user
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            RequestDispatcher rd;
            if (request.getParameter("login").equals("admin")) {
                String pg = "../admin/adminpanel.jsp";
                session.setAttribute("userid", "admin");
                rd = request.getRequestDispatcher(pg);
                rd.forward(request, response);
            }
            if (request.getParameter("login").equals("teacher")) {
                String pg = "../teacher/teacherPanel.jsp";
                session.setAttribute("userid", "teacher");
                rd = request.getRequestDispatcher(pg);
                rd.forward(request, response);
            }
            //response.sendRedirect(pg);
        %>
    </body>
</html>
