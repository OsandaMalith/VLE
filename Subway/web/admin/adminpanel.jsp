<%@ include file="/WEB-INF/dbdriver.jsp" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : profile
    Created on : Mar 17, 2016, 11:50:13 AM
    Author     : @OsandaMalith
--%>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">        
    </head>
    <body>
        <c:if test="${sessionScope.userid == null}">
            <c:redirect url="error.jsp" >
                <c:param name="errMsg" value="Only Admin can view this Page" />
            </c:redirect>
        </c:if>
        
        <header class="site-header">
            <div class="container">
                <h1>Welcome to Admin Panel</h1>
            </div>
        </header>
        
        <div class="subheader">   
            <div class="container">
                <p class="greeting">Hello <%= session.getAttribute("userid")%>!</p>
                <div class="admin-nav">
                    <a href="admin/teacher/" target="_blank">Control Teachers</a> | 
                    <a href="admin/student/controlStudent.jsp" target="_blank">Control Students</a> |
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
        </div><!-- /subheader -->

        <div class="container site-content">
            <h4>Add Courses</h4>
            <form name="course" action="insertCourses.jsp" method="POST">
                Enter Course code:<br>
                <input type="text" name="code" value="" />
                Enter Course Name:<br>
                <input type="text" name="name" value="" />
                Enter Course Key: <br>
                <input type="text" name="ekey" value="" />
                <input type="submit" value="Add Course" name="course" />
            </form>
            <br>
            <font color="red"><c:if test="${not empty param.errMsg}">
                <c:out value="${param.errMsg}" />
            </c:if></font>
            <br>
            <font color="green"><c:if test="${not empty param.susMsg}">
                <c:out value="${param.susMsg}" />
            </c:if></font>            
            
            <h4>Current Courses:</h4>
            <br>

            <sql:query dataSource="${dbdriver}" var="result">
                SELECT * from OSANDA.COURSE
            </sql:query>

            <table>
                <tr>
                    <th>Module Code</th>
                    <th>Module Name</th>
                    <th>Enrollment Key</th>
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.code}"/></td>
                        <td><c:out value="${row.name}"/></td>
                        <td><c:out value="${row.ekey}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        
        <footer class="site-footer">
            <div class="container">
                <span>&copy; 2016 Osanda</span>
            </div>
        </footer>
    </body>
</html>
