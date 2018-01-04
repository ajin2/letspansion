<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>

<h2> ${page_modify} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
	 	<!--
	 	alert( updateerror );
	 	//-->
	</script>
	<meta http-equiv="refresh" content="0; url=logonMain.do"/>				
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="logonMain.do"/>
</c:if>











