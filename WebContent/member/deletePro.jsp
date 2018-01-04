<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>

<h2> ${page_delete} </h2>

<c:if test="${resultCheck == 1}">
	<c:if test="${result == 0}">
		<script type="text/javascript">
			<!--
			erroralert( deleteerror );
			//-->
		</script>
	</c:if>
	<c:if test="${result != 0}">	
		${sessionScope.memId = null}
		<c:redirect url="logonMain.do"/>
	</c:if>
</c:if>
<c:if test="${resultCheck == -1}">
	<script type="text/javascript">
		<!--
		erroralert( loginpasserror );
		//-->
	</script>
</c:if>
		







