<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<sql:query var="rs" dataSource="jdbc/kh">
	select * from pension_pic where r_id=? order by pict_id asc
	<sql:param value="${param.r_id}"/>
</sql:query>
<c:set var="util" value="<%=new handler.Util() %>"/>
<result>
	<code>success</code>
	<data>{
		"pictures" : [
			<c:forEach var="row" items="${rs.rows}">
				{
					"pict_id" : ${row.pict_id},
					"pic_ori" : "${row.pic_ori}",
					"pic_sys" : "${row.pic_sys}"
				},
			</c:forEach>
		]
	}
	</data>
</result>