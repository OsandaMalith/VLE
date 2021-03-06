<%@ include file="/WEB-INF/dbdriver.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : addStudentDao
    Created on : May 19, 2016, 2:50:12 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <c:if test="${ empty param.name or empty param.username or empty param.password or empty param.email or empty param.dor}">
            <c:redirect url="index.jsp" >
                <c:param name="errMsgAdd" value="Please Enter Name, Userame, Password, E-Mail and Date" />
            </c:redirect>
        </c:if>
        <c:if test="${not empty param.register}">
            <c:catch var ="catchException">
                <sql:update dataSource="${dbdriver}" var="result">
                    INSERT INTO OSANDA.STUDENT (USERNAME, PASSWORD, "name", EMAIL, "DATE") 
                    VALUES (?, ?, ?, ?, ?)
                    <sql:param value="${param.username}" />
                    <sql:param value="${param.password}" />
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.dor}" />
                </sql:update> 
            </c:catch>
            <c:if test = "${catchException != null}">
                <c:redirect url="index.jsp" >
                    <c:param name="errMsgAdd" value="Username is already taken." />
                </c:redirect>
            </c:if>
        </c:if>
        <c:if test="${result>=1}">
            <c:redirect url="index.jsp" >
                <c:param name="susMsgAdd" value="Data inserted
                         successfully." />
            </c:redirect>
        </c:if>
        <c:if test="${not empty param.update}">
            <sql:update dataSource="${dbdriver}" var="resultUpdate">
                UPDATE OSANDA.STUDENT set PASSWORD= ?, "name"= ?, USERNAME= ? where ID = ?
                <sql:param value="${param.password}" />
                <sql:param value="${param.name}" />
                <sql:param value="${param.username}" />
                <sql:param value="${param.id}" />
            </sql:update> 
        </c:if>
        <c:if test="${resultUpdate>=1}">
            <c:redirect url="index.jsp" >
                <c:param name="susMsgAdd" value="Data updated successfully. " />
            </c:redirect>
        </c:if>
    </body>
</html>
