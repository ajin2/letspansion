<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:query var="rs" dataSource="jdbc/kh">
		select b_num, p_id, o_amount, o_price
		from pension_order where b_num = ? order by p_id asc
		<sql:param value="${param.bnum}" />
	</sql:query>
	
	<books>
		<data>
			{
				"book" : [
						<c:forEach var="row" items="${rs.rows}">
							<sql:query var="product" dataSource="jdbc/kh">
								select p_name, p_sys, p_amount, p_cate from pension_product where p_id = ?
								<sql:param value="${row.p_id}" />
							</sql:query>
							<c:forEach var="prow" items="${product.rows}">
								{
									"b_num" : "${row.b_num}",
									"p_id" : "${row.p_id}",
									"p_name" : "${prow.p_name}",
									"o_amount" : "${row.o_amount}",
									"o_price" : "${row.o_price}",
									"p_sys" : "${prow.p_sys}",
									"p_amount" : "${prow.p_amount}",
									"p_cate" : "${prow.p_cate}" 
								},
							</c:forEach>
						</c:forEach>
				]
			}
		</data>
	</books>
	
	
	
	
	