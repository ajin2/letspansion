<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}admin/script.js"></script>

<h2> ${page_login} </h2>

<c:if test="${result == 1}">
	${sessionScope.adminId = adminId}
	<c:redirect url="adminPensionHome.do"/>
</c:if>

<c:if test="${result == -1}">
	<script type="text/javascript">
		<!--
		erroralert( adminloginpasswderror );
		//-->
	</script>		
</c:if>	
<c:if test="${result == 0}">		
	<script type="text/javascript">
		<!--
		erroralert( adminloginiderror );
		//-->
	</script>
</c:if>