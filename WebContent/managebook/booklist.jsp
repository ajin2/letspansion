<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:query var="rs" dataSource="jdbc/kh">
		select b_num, m_id, r_id, b_person, b_totalprice, b_payway, to_char(b_reg_date, 'yyyy-mm-dd') b_reg_date, b_status, b_term
		from pension_book where m_id = ? and to_char(b_reg_date, 'yyyy-mm-dd') >= ? order by r_id asc, b_reg_date asc
		<sql:param value="${param.mid}" />
		<sql:param value="${param.date}" />
	</sql:query>
	
	<books>
		<data>
			{
				"book" : [
						<c:forEach var="row" items="${rs.rows}">
							{
								"b_num" : "${row.b_num}",
								"m_id" : "${row.m_id}",
								"r_id" : "${row.r_id}",
								"b_person" : "${row.b_person}",
								"b_totalprice" : "${row.b_totalprice}",  
								"b_payway" : "${row.b_payway}",
								"b_reg_date" : "${row.B_REG_DATE}",
								"b_status" : "${row.b_status}",
								"b_pay_date" : "${row.b_pay_date}",
								"b_term" : "${row.b_term}" 
							},
						</c:forEach>
				]
			}
		</data>
	</books>
	
	
	
	
	