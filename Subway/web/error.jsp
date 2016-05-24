<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : errror
    Created on : Mar 17, 2016, 11:50:21 AM
    Author     : cb005482
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Not Found</title>
    </head>
    <body>
        <h1>404 :)</h1>
        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            <a href="index.jsp">Go Back</a>
        </c:if></font>
        <!--<a href="index.jsp">Go Back</a>-->
    </body>
</html>

