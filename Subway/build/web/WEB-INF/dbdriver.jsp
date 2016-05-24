<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : dbdriver
    Created on : May 21, 2016, 7:23:55 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <sql:setDataSource var="dbdriver" driver="org.apache.derby.jdbc.ClientDriver"
                           url="jdbc:derby://localhost:1527/students"
                           user="osanda"  password="osanda"/>
    </body>
</html>
