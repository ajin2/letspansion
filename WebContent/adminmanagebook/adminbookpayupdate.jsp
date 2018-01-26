<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	
	<sql:update var="result" dataSource="jdbc/kh">
		update pension_book set b_status = 2 where m_id = ?
		<sql:param value="${param.m_id}" />
	</sql:update>
	
	<c:choose>
		<c:when test="${result == 1}">
			<result>
				<code>success</code>
				<message>성공</message>
			</result>
		</c:when>
		
		<c:otherwise>
			<result>
				<code>fail</code>
				<message>실패</message>
			</result>
		</c:otherwise>
	</c:choose>
	
	
	
	