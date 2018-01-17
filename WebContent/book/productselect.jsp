<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

	<sql:query var="po" dataSource="jdbc/kh">
		select * from pension_product where p_cate = ? order by p_id asc
		<sql:param value="${param.cate}" />
	</sql:query>
	 
	<products>
		<data>
			{
				"product" : [
					<c:forEach var="row" items="${po.rows}">
						{
							"p_id" : "${row.p_id}",
							"p_cate" : "${row.p_cate}",
							"p_name" : "${row.p_name}",
							"p_amount" : "${row.p_amount}",
							"p_price" : "${row.p_price}",
							"p_stock" : "${row.p_stock}",
							"p_ori" : "${row.p_ori}",
							"p_sys" : "${row.p_sys}"
						},
					</c:forEach>
				]
			}
		</data>
	</products>
	
	
	
	

	
	
	
	