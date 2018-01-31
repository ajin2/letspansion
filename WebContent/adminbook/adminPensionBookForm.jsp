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
		<jsp:include page="${project}adminhome/adminPensionHeader.jsp" flush="false"/>	

		Admin Pension 예약 본문
		
		<jsp:include page="${project}adminhome/adminPensionBottom.jsp" flush="false"/>
	</body>
</html>
	