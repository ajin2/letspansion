<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:query var="rs" dataSource="jdbc/kh">
		select distinct to_char(b_reg_date, 'yyyy-mm-dd') b_reg_date, b_num, b_term, b_totalprice, m_id
		from pension_book where m_id = ? order by b_reg_date asc
		<sql:param value="${param.m_id}" />
	</sql:query>

	<books>
		<data>
			{
				"book" : [
						<c:forEach var="row" items="${rs.rows}">
							{
								"b_num" : "${row.b_num}",
								"m_id" : "${row.m_id}",
								"b_totalprice" : "${row.b_totalprice}",  
								"b_reg_date" : "${row.B_REG_DATE}",
								"b_term" : "${row.b_term}"
							},
						</c:forEach>
				]
			}
		</data>
	</books>
	
	
	
	
	