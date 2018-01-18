<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<script src="${project}adminnotice/script.js"></script>
	</head>
	<body>
		<c:if test="${result == 0 }">
		<script type='text/javascript'>
		<!--
		erroralert(modifyerror);
		//-->
		</script>
		<meta http-equiv='refresh' content="0; url=adminNoticeList.do?n_pageNum=${n_pageNum}">
		</c:if>
		<c:if test="${result != 0 }">
			<c:redirect url="adminNoticeList.do?n_pageNum=${n_pageNum}" />
		</c:if>
	</body>
</html>