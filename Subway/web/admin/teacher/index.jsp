<%-- 
    Document   : controlTeacher
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
        <title>Control Teacher</title>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"> 
    </head>
    <body>
        <header class="site-header">
            <div class="container">
                <h1>Teacher Profile</h1>
            </div>
        </header>
        
        <div class="container site-content">
            <form name="course" action="addTeacherDao.jsp" method="POST">
                Name :      
                <input type="text" name="name" value="<c:out value="${param.name}"/>" />
                Username : 
                <input type="text" name="username" value="<c:out value="${param.username}"/>" />
                E-mail :     
                <input type="email" name="email" value="<c:out value="${param.email}"/>" />
                Password :  
                <input type="password" name="password" value="<c:out value="${param.password}"/>" />
                <input type="hidden" name="id" value="<c:out value="${param.id}"/>"/>
                Registration Date: 
                <c:choose>
                    <c:when test="${not empty param.dor}">
                        <input type="date" name="dor" min="2016-01-01" readonly="readonly"
                               value="${param.dor}" />  <br>
                    </c:when>
                    <c:otherwise>
                        <input type="date" name="dor" min="2016-01-01" 
                               value="${param.dor}" />  <br>
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
            
            <h1>Enroll Teacher</h1>
            <form name="course" action="enrollTeacherDao.jsp" method="POST">
                Enter the Username:
                <input type="text" name="username" value="" />
                Enter the Enrollment Key:
                <input type="text" name="code" value="" />
                <br>
                <input type="submit" value="Enroll Teacher" name="enroll" />
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
                SELECT "NAME",USERNAME,ID,EMAIL,"DATE" FROM OSANDA.TEACHER
            </sql:query>

            <table>
                <caption><h1>Registered Teachers</h1></caption>
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
        </div>
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
