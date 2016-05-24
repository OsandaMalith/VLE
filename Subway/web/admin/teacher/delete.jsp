<%@ include file="/WEB-INF/dbdriver.jsp" %>
<%-- 
    Document   : delete
    Created on : May 22, 2016, 4:17:56 PM
    Author     : user
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <sql:update dataSource="${dbdriver}" var="resultUpdate">
            DELETE FROM OSANDA.TEACHER WHERE ID = ?
            <sql:param value="${param.id}" />
        </sql:update> 
    <c:redirect url="index.jsp" >
        
    </c:redirect>
</body>
</html>
