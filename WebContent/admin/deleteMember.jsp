<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

<sql:query var="result" dataSource="jdbc/kh">
	update into pension_member set m_del=0 where m_id=?
	<sql:param value="${param.m_id}"/>
</sql:query>

<c:if test="${result == 0}">
	<result>
		<code>error</code>
		<message>회원 삭제 실패</message>
	</result>
</c:if>
<c:if test="${result == 1}">
	<result>
		<code>success</code>
		<data>${param.m_id}</data>
	</result>
</c:if>