<%-- 
    Document   : teacherPanel
    Created on : May 19, 2016, 5:47:15 AM
    Author     : user
--%>
<%@ include file="/WEB-INF/dbdriver.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello <%= request.getParameter("username")%></h1>

        Your current courses:

        <sql:query dataSource="${dbdriver}" var="result">
            SELECT * FROM OSANDA.STUDENT
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Enrollment Key</th>
            </tr>
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <td><c:out value="${row[0]}"/></td>
                    <td><c:out value="${row[1]}"/></td>
                    <td><c:out value="${row[2]}"/></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>

<!--

SELECT "NAME",CODE FROM OSANDA.COURSE where EKEY IN(SELECT EKEY FROM OSANDA.COURSEUSER where STUDENTUSER='osanda');
SELECT EKEY FROM OSANDA.COURSEUSER where STUDENTUSER='osanda';

-->