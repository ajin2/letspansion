<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>

<h2> ${page_login} </h2>

<c:if test="${deleteCheck == 0}">
	<c:if test="${result == 1}">
		${sessionScope.memId = id}
		<c:redirect url="pensionHome.do"/>
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			<!--
			erroralert( loginpasserror );
			//-->
		</script>
	</c:if>
	<c:if test="${result == 0}">	
		<script type="text/javascript">
			<!--
			erroralert( loginiderror );
			//-->
		</script>
	</c:if>
</c:if>
<c:if test="${deleteCheck == 1 }">
	<script type="text/javascript">
			<!--
			erroralert( logindeletederror );
			//-->
		</script>
</c:if>






