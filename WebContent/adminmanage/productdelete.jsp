<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	
	<sql:query var="cate" dataSource="jdbc/kh">
		select p_cate from pension_product where p_id = ?
		<sql:param value="${param.pid}" />
	</sql:query>
	
	<c:set var="pcate" value="0"/>
	<c:forEach var="row" items="${cate.rows}">
		<c:set var="pcate" value="${row.p_cate}"/>
	</c:forEach>
	
	<sql:update var="result" dataSource="jdbc/kh">
		delete from pension_product where p_id = ?
		<sql:param value="${param.pid}" />
	</sql:update>
	
	<c:choose>
		<c:when test="${result == 1}">
			<result>
				<code>success</code>
				<message>${pcate}</message>
			</result>
		</c:when>
		
		<c:otherwise>
			<result>
				<code>fail</code>
				<message>실패</message>
			</result>
		</c:otherwise>
	</c:choose>
	
	
	
	