<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8"/>

<sql:query var="rs" dataSource="jdbc/kh">
	select SEQ_pension_reply_re_num.NEXTVAL from dual
</sql:query>

<c:set var="num" value="0"/>
<c:forEach var="row" items="${rs.rowsByIndex}">
	<c:set var="num" value="${row[0]}"/>
</c:forEach>

<sql:update var="result" dataSource="jdbc/kh">
	insert into pension_reply values(?, ?, ?)
	<sql:param value="${num}"/>
	<sql:param value="${param.m_id}">
	<sql:param value="${param.re_content}">
</sql:update>







