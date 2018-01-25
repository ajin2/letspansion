<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:update var="rs" dataSource="jdbc/kh">
		delete from pension_order where p_id = ? and b_num = ?
		<sql:param value="${param.pid}" />
		<sql:param value="${param.bnum}" />
	</sql:update>
	
	<c:choose>
		<c:when test="${rs == 1}">
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
	
	
	
	
	