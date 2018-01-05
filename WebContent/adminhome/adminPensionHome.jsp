<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		
	</head>
	<jsp:include page="adminPensionHeader.jsp" flush="false"/>	
	<jsp:include page="adminPensionMenu.jsp" flush="false"/>

	<body>
		<h2> </h2>

		<jsp:include page="adminPensionMain.jsp" flush="false"/>
	</body>
	<jsp:include page="adminPensionBottom.jsp" flush="false"/>
</html>
	