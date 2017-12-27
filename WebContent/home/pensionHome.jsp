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
		<jsp:include page="pensionHeader.jsp" flush="false"/>	
		<jsp:include page="pensionMenu.jsp" flush="false"/>

		<jsp:include page="pensionMain.jsp" flush="false"/>
		<jsp:include page="pensionBottom.jsp" flush="false"/>
	</body>
</html>
	