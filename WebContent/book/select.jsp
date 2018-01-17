<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<books>
		<data>
			{
				"book" : [
						<c:forEach var="r" begin="1" end="5">
							<sql:query var="rs" dataSource="jdbc/kh">
								select b_num, m_id, r_id, b_person, b_totalprice, b_payway, to_char(b_reg_date, 'yyyy-mm-dd') b_reg_date, b_status
								from pension_book where r_id = ? and to_char(b_reg_date,'yyyy-mm-dd') = ?
								<sql:param value="${r}" />
								<sql:param value="${param.date}" />
							</sql:query>
							<c:choose>
								<c:when test="${rs.rowCount != 0}">
									<c:forEach var="row" items="${rs.rows}">
										{
											"b_num" : "${row.b_num}",
											"m_id" : "${row.m_id}",
											"r_id" : "${row.r_id}",
											"b_person" : "${row.b_person}",
											"b_totalprice" : "${row.b_totalprice}",  
											"b_payway" : "${row.b_payway}",
											"b_reg_date" : "${row.B_REG_DATE}",
											"b_status" : "${row.b_status}"
										},
									</c:forEach>
								</c:when>   
								<c:otherwise>
									{
										"b_num" : "",
										"m_id" : "",
										"r_id" : "${r}",
										"b_person" : "",
										"b_totalprice" : "",
										"b_payway" : "",
										"b_reg_date" : "${param.date}",
										"b_status" : ""
									},
								</c:otherwise>
							</c:choose>
						</c:forEach>
				]
			}
		</data>
	</books>
	
	
	
	
	