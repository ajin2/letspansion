<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:update var="rs" dataSource="jdbc/kh">
		update pension_book set b_reg_date = to_date(?,'mm/dd/yyyy'), r_id = ?, b_person = ?, b_totalprice = ?, b_term = ? where b_num = ? and m_id = ?
		<sql:param value="${param.date}" />
		<sql:param value="${param.r_id}" />
		<sql:param value="${param.b_person}" />
		<sql:param value="${param.b_totalprice}" />
		<sql:param value="${param.term}" />
		<sql:param value="${param.bnum}" />
		<sql:param value="${param.m_id}" />
	</sql:update>
	
	<c:choose>
		<c:when test="${rs == 1}">
			<sql:update var="ds" dataSource="jdbc/kh">
				delete from pension_book where m_id = ? and b_num != ?
				<sql:param value="${param.m_id}" />
				<sql:param value="${param.bnum}" />
			</sql:update>
			
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
