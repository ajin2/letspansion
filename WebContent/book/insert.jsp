<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:query var="num" dataSource="jdbc/kh">
		select max(b_num) b_num from pension_book
	</sql:query>
	
	<c:set var="max" value="0"/>
	<c:forEach var="row" items="${num.rows}">
		<c:set var="max" value="${row.b_num}"/>
	</c:forEach>
	
	<c:set var="max" value="${max+1}"/>
	
	<sql:update var="result" dataSource="jdbc/kh">
		insert into pension_book(b_num, m_id, r_id, b_person, b_totalprice, b_payway, b_status, b_reg_date, b_book_date) 
		values(?, ?, ?, ?, ?, ?, ?, to_Date(?, 'mm/dd/yyyy'), sysdate)
		<sql:param value="${max}" />
		<sql:param value="${param.m_id}" />
		<sql:param value="${param.r_id}" />
		<sql:param value="${param.b_person}" />
		<sql:param value="${param.b_totalprice}" />
		<sql:param value="${param.b_payway}" />
		<sql:param value="${param.b_status}" />
		<sql:param value="${param.date}" />
	</sql:update>
	
	<c:choose>
		<c:when test="${result == 1}">
			<result>
				<code>success</code>
				<message>${max}</message>
			</result>
		</c:when>
		
		<c:otherwise>
			<result>
				<code>fail</code>
				<message>실패</message>
			</result>
		</c:otherwise>
	</c:choose>
	
	
	
	