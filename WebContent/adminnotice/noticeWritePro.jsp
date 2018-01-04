<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<script src="${project}notice/script.js"></script>
	</head>
	<body>
		<c:if test="${result == 0}">
			<script type="text/javascript">
			<!--
			erroralert( writeerror );
			//-->
			</script>
		</c:if>
		<c:if test="${result == 1}">
			<c:redirect url="noticeList.do"/>
		</c:if>		
	</body>
</html>