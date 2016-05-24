<%-- 
    Document   : viewCourse
    Created on : May 23, 2016, 6:26:52 AM
    Author     : user
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/dbdriver.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Current Courses of ${param.username}</title>
    </head>
    <body>
        <sql:query var="result" dataSource="${dbdriver}">
            SELECT CODE, "NAME", EKEY FROM OSANDA.COURSE where EKEY 
            IN(SELECT EKEY FROM OSANDA.COURSEUSER 
            where STUDENTUSER= ? )
            <sql:param value="${param.username}" />
        </sql:query>
        <table border="1" style="width:100%" >
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Enrollment Key</th>
                <th> Action </th>
            </tr>
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                        <td> <A href="enrollStudentDao.jsp?unenroll=xx&username=<c:out value="${param.username}"/>&code=<c:out value="${row[2]}"/>" onclick="return confirm('Delete Record?')" >Unenroll</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
