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
							select r_id, b_payway, to_char(b_reg_date, 'yyyy-mm-dd') b_reg_date, m_id
							from pension_book where r_id = ? and to_char(b_reg_date,'yyyy-mm-dd') = ?
							<sql:param value="${r}" />
							<sql:param value="${param.date}" />
						</sql:query>
						
						<c:choose>
							<c:when test="${rs.rowCount != 0}">
								<c:forEach var="row" items="${rs.rows}">
									{
										"b_reg_date" : "${param.date}",
										"r_id" : "${row.r_id}",
										"b_payway" : "${row.b_payway}",
										"m_id" : "${row.m_id}"
									},
								</c:forEach>
							</c:when>   
						
							<c:otherwise>
								{
									"b_reg_date" : "${param.date}",
									"r_id" : "${r}",
									"b_payway" : "",
									"m_id" : ""
								},
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				]
			}
		</data>
	</books>
	
	
	