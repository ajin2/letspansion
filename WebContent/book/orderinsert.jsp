<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:query var="num" dataSource="jdbc/kh">
		select max(o_num) o_num from pension_order
	</sql:query>
	
	<c:set var="max" value="0"/>
	<c:forEach var="row" items="${num.rows}">
		<c:set var="max" value="${row.o_num}"/>
	</c:forEach>
	
	<c:set var="max" value="${max+1}"/>
	
	<sql:update var="result" dataSource="jdbc/kh">
		insert into pension_order(o_num, b_num, p_id, o_amount, o_price)
		values(?, ?, ?, ?, ?)
		<sql:param value="${max}" />
		<sql:param value="${param.b_num}" />
		<sql:param value="${param.pid}" />
		<sql:param value="${param.amount}" />
		<sql:param value="${param.price}" />
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
	
	
	
	