<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/dbdriver.jsp" %>
<%-- 
    Document   : viewCourses
    Created on : May 22, 2016, 4:17:44 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Current Courses of ${param.username}</title>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"> 
    </head>
    <body>
        <sql:query var="result" dataSource="${dbdriver}">
            SELECT CODE, "NAME", EKEY FROM OSANDA.COURSE where EKEY 
            IN(SELECT EKEY FROM OSANDA.COURSETEACHER 
            where USERNAME= ? )
            <sql:param value="${param.username}" />
        </sql:query>
        <table>
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Enrollment Key</th>
                <th>Action</th>
            </tr>
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                        <td> <A href="enrollTeacherDao.jsp?unenroll=xx&username=<c:out value="${param.username}"/>&code=<c:out value="${row[2]}"/>" onclick="return confirm('Delete Record?')" >Unenroll</a></td>

                </tr>
            </c:forEach>
        </table>
    </body>
</html>
