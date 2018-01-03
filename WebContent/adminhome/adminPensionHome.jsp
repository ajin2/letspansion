<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		
	</head>
	<body>
		<h2> </h2>
		<jsp:include page="adminPensionHeader.jsp" flush="false"/>	
		<jsp:include page="adminPensionMenu.jsp" flush="false"/>

		<jsp:include page="adminPensionMain.jsp" flush="false"/>
		<jsp:include page="adminPensionBottom.jsp" flush="false"/>
	</body>
</html>
	