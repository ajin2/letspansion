<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:update var="result" dataSource="jdbc/kh">
	delete from pension_pic where pict_id=? and r_id=?
	<sql:param value="${param.pict_id}"/>
	<sql:param value="${param.r_id}"/>
</sql:update>

<c:if test="${result == 0}">
	<result>
		<code>error</code>
		<message>글삭제 실패</message>
	</result>
</c:if>
<c:if test="${result == 1}">
	<result>
		<code>success</code>
		<data>${param.pict_id}</data>
	</result>
</c:if>