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
    </head>
    <body>
        <c:if test="${sessionScope.userid == null}">
            <c:redirect url="error.jsp" >
                <c:param name="errMsg" value="Only Admin can view this Page" />
            </c:redirect>
        </c:if>
        <h1>Welcome to Admin Panel</h1>
        <h2>Hello <%= session.getAttribute("userid")%></h2>
        <br>
        <a href="controlTeacher.jsp" target="_blank">Control Teachers</a> | 
        <a href="controlStudent.jsp" target="_blank">Control Students</a> |
        <a href="logout.jsp">Logout</a>
        <br><br>
        <h4>Add Courses</h4>
        <br>
        <form name="course" action="insertCourses.jsp" method="POST">
            Enter Course code:<br>
            <input type="text" name="code" value="" /><br><br>
            Enter Course Name:<br>
            <input type="text" name="name" value="" /><br><br>
            Enter Course Key: <br>
            <input type="text" name="ekey" value="" /><br><br>
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
        <br><br>
        Current Courses:
        <sql:setDataSource var="dbdriver" driver="org.apache.derby.jdbc.ClientDriver"
                           url="jdbc:derby://localhost:1527/students"
                           user="osanda"  password="osanda"/>

        <sql:query dataSource="${dbdriver}" var="result">
            SELECT * from OSANDA.COURSE
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>Module Code</th>
                <th>Module Name</th>
                <th>Enrollment Key</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.code}"/></td>
                    <td><c:out value="${row.name}"/></td>
                    <td><c:out value="${row.ekey}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
