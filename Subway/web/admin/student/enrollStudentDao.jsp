<%-- 
    Document   : enrollStudentDao
    Created on : May 17, 2016, 11:57:09 PM
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
    </head>
    <body>
        <c:if test="${ empty param.code or empty param.username }">
            <c:redirect url="index.jsp" >
                <c:param name="errMsg" value="Please Enter the Username and Code" />
            </c:redirect>
        </c:if>
        <sql:query dataSource="${dbdriver}" var="coursCode">
            SELECT EKEY FROM OSANDA.COURSE where EKEY = ?
            <sql:param value="${param.code}" />
        </sql:query>
        <sql:query dataSource="${dbdriver}" var="TeacherUser">
            SELECT USERNAME FROM OSANDA.STUDENT where USERNAME= ?
            <sql:param value="${param.username}" />
        </sql:query>
        <c:choose>
            <c:when test="${TeacherUser.rowCount == 0}">
                <c:redirect url="index.jsp" >
                    <c:param name="errMsg" value="Enter a valid Username" />
                </c:redirect>
            </c:when>
            <c:when test="${coursCode.rowCount == 0}">
                <c:redirect url="index.jsp" >
                    <c:param name="errMsg" value="Invalid Enrollment Key" />
                </c:redirect>
            </c:when>
            <c:otherwise>
                <c:if test="${not empty param.enroll}">
                    <sql:update dataSource="${dbdriver}" var="updateVar">
                        INSERT INTO OSANDA.COURSEUSER (STUDENTUSER, EKEY) 
                        VALUES (?, ?)
                        <sql:param value="${param.username}" />
                        <sql:param value="${param.code}" />
                    </sql:update>
                    <c:if test="${updateVar>=1}">
                        <c:redirect url="index.jsp" >
                            <c:param name="susMsg" value="Course enrolled." />
                        </c:redirect>
                    </c:if> 
                </c:if> 
                <c:if test="${not empty param.unenroll}">
                    <sql:update dataSource="${dbdriver}" var="updateVar">
                        DELETE FROM OSANDA.COURSEUSER WHERE STUDENTUSER = ? AND EKEY = ?
                        <sql:param value="${param.username}" />
                        <sql:param value="${param.code}" />
                    </sql:update>
                    <c:if test="${updateVar>=1}">
                        <c:redirect url='<%= request.getHeader("referer") %>' >
                            <c:param name="susMsg" value="Course Unenrolled." />
                        </c:redirect>
                    </c:if> 
                </c:if> 
            </c:otherwise>
        </c:choose>
    </body>
</html>
