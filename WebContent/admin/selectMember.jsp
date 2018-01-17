<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

<sql:query var="rs" dataSource="jdbc/kh">
	select * from pension_member where m_del=0
</sql:query>

<members>
	<code>success</code>
	<data>
		{
			"member" : [
				<c:forEach var="row" items="${rs.rows}">
					{
						"m_id" : "${row.m_id}",
						"m_name" : "${row.m_name}",
						"m_tel" : "${row.m_tel}",
						"m_email" : "${row.m_email}",
						"m_address" : "${row.m_address}",
						"m_regdate" : "${row.m_regdate}"
					},
				</c:forEach>
			]
		}
	</data>
</members>