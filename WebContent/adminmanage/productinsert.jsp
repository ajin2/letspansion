<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:query var="num" dataSource="jdbc/kh">
		select max(p_id) p_id from pension_product
	</sql:query>
	
	<c:set var="max" value="0"/>
	<c:forEach var="row" items="${num.rows}">
		<c:set var="max" value="${row.p_id}"/>
	</c:forEach>
	
	<c:set var="max" value="${max+1}"/>
	
	<sql:update var="result" dataSource="jdbc/kh">
		insert into pension_product(p_id, p_cate, p_name, p_amount, p_price, p_ori, p_sys)
		values(?, ?, ?, ?, ?, ?, ?)
		<sql:param value="${max}" />
		<sql:param value="${param.pcate}" />
		<sql:param value="${param.pname}" />
		<sql:param value="${param.amount}" />
		<sql:param value="${param.price}" />
		<sql:param value="${param.ori}" />
		<sql:param value="${param.sys}" />
	</sql:update>
	
	<c:choose>
		<c:when test="${result == 1}">
			<result>
				<code>success</code>
				<message>${param.pcate}</message>
			</result>
		</c:when>
		
		<c:otherwise>
			<result>
				<code>fail</code>
				<message>실패</message>
			</result>
		</c:otherwise>
	</c:choose>
	
	
	
	