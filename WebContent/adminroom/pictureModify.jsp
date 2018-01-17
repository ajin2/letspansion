<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<sql:update var="result" dataSource="jdbc/kh">
	update pension_pic set pic_ori=?, pic_sys=? where pict_id=? and r_id=?
	<sql:param value="${param.pic_ori}"/>
	<sql:param value="${param.pic_sys}"/>
	<sql:param value="${param.pict_id}"/>
	<sql:param value="${param.r_id}"/>
</sql:update>

<c:if test="${result == 0}">
	<result>
		<code>error</code>
		<message>수정에 실패함</message>
	</result>
</c:if>

<c:set var="util" value="<%=new handler.Util() %>"/>
<c:if test="${result == 1}">
	<result>
		<code>success</code>
		<data>	
			{
				"pict_id" : ${row.pict_id},
				"pic_ori" : "${row.pic_ori}",
				"pic_sys" : "${row.pic_sys}"
			}	
		</data>
	</result>
</c:if>