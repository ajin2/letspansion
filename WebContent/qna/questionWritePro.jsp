<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
	</head>
	<body>
		<c:if test="${result == 0}">
		<script type="text/javascript">
		<!--
		erroralert(writeerror);
		//-->
		</script>
	</c:if>
	<c:if test="${result != 0}" >
		<c:redirect url="questionlist.do" />
	</c:if>
	</body>
</html>