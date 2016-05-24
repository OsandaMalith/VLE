<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%-- 
    Document   : insert.jsp
    Created on : May 15, 2016, 1:18:49 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Courses</title>
    </head>
    <body>
        <c:if test="${ empty param.code or empty param.name or empty param.ekey}">
            <c:redirect url="adminpanel.jsp" >
                <c:param name="errMsg" value="Please Enter Code, Name and Enrollment Key" />
            </c:redirect>
        </c:if>
        <sql:setDataSource var="dbsource" driver="org.apache.derby.jdbc.ClientDriver"
                           url="jdbc:derby://localhost:1527/students"
                           user="osanda"  password="osanda"/>

        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO COURSE (CODE, NAME, EKEY) VALUES (?,?,?)
            <sql:param value="${param.code}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.ekey}" />
        </sql:update> 
        <c:if test="${result>=1}">
            <c:redirect url="adminpanel.jsp" >
                <c:param name="susMsg" value="Data inserted
                         successfully." />
            </c:redirect>
        </c:if> 

    </body>
</html>
