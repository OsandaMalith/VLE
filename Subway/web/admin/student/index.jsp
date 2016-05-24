<%-- 
    Document   : controlStudent
    Created on : May 17, 2016, 8:34:25 PM
    Author     : user
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/dbdriver.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Student</title>
    </head>
    <body>
        <h1>Student Profile</h1>
        <form name="course" action="addStudentDao.jsp" method="POST">
            Name :      
            <input type="text" name="name" value="<c:out value="${param.name}"/>" /><br><br>
            Username : 
            <input type="text" name="username" value="<c:out value="${param.username}"/>" /><br><br>
            E-mail :     
            <input type="email" name="email" value="<c:out value="${param.email}"/>" /><br><br>
            Password :  
            <input type="password" name="password" value="<c:out value="${param.password}"/>" /><br><br>
            <input type="hidden" name="id" value="<c:out value="${param.id}"/>"/>
            Registration Date: 
            <c:choose>
                <c:when test="${not empty param.dor}">
                    <input type="date" name="dor" min="2016-01-01" readonly="readonly"
                           value="${param.dor}" />  <br><br>
                </c:when>
                <c:otherwise>
                    <input type="date" name="dor" min="2016-01-01" 
                           value="${param.dor}" />  <br><br>
                </c:otherwise>
            </c:choose> 

            <input type="submit" value="Register" name="register" />
            <input type="submit" value="Update" name="update" />
        </form>
        <br>
        <font color="red"><c:if test="${not empty param.errMsgAdd}">
            <c:out value="${param.errMsgAdd}" />
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsgAdd}">
            <c:out value="${param.susMsgAdd}" />
        </c:if></font>
        <br>
        <h1>Enroll Student</h1>
        <form name="course" action="enrollStudentDao.jsp" method="POST">
            Enter the Username:<br>
            <input type="text" name="username" value="" /><br><br>
            Enter the Enrollment Key: <br>
            <input type="text" name="code" value="" /><br><br>
            <input type="submit" value="Enroll Student" name="enroll" />
            <input type="submit" value="Unenroll Student" name="unenroll" />
        </form>
        <br>
        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
        </c:if></font>
        <br><br>
        <a href="../adminpanel.jsp">Go Back</a>
        <br><br>
        <sql:query dataSource="${dbdriver}" var="teacherDao">
            SELECT "name",USERNAME,ID,EMAIL,"DATE" FROM OSANDA.STUDENT
        </sql:query>

        <table border="1" style="width:100%" >
            <caption><h1>Registered Students</h1></caption>
            <tr>
                <th>Name</th>
                <th>Username</th>
                <th>E-Mail</th>
                <th>Registration Date</th>
                <th colspan="3">Action</th>
            </tr>
            <c:forEach var="teacher" items="${teacherDao.rowsByIndex}">
                <tr>
                    <td><c:out value="${teacher[0]}"/></td>
                    <td><c:out value="${teacher[1]}"/></td>
                    <td><c:out value="${teacher[3]}"/></td>
                    <td><fmt:formatDate pattern="dd MMM yyyy" value="${teacher[4]}"/></td>
                    <td><a href="viewCourses.jsp?username=<c:out value="${teacher[1]}" />" onclick="return popitup('viewCourses.jsp?username=<c:out value="${teacher[1]}" />')">View Courses</a></td>
                    <td><a href="index.jsp?name=<c:out value="${teacher[0]}&username=${teacher[1]}&id=${teacher[2]}&dor=${teacher[4]}&email=${teacher[3]}"/>">Update</a> 
                    </td>
                    <td><A href="delete.jsp?id=<c:out value="${teacher[2]}"/>" onclick="return confirm('Delete Record?')" >Delete</a></td>

                </tr>
            </c:forEach> 
        </table> 
        <script language="javascript" type="text/javascript">
        <!--
            function popitup(url) {
                newwindow = window.open(url, 'name', 'height=500,width=500');
                if (window.focus) {
                    newwindow.focus()
                }
                return false;
            }
        // -->
        </script>
    </body>
</html>

