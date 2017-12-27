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
		<jsp:include page="${project}adminPensionHeader.jsp" flush="false"/>	
		<jsp:include page="${project}adminPensionMenu.jsp" flush="false"/>

		Admin Pension 관리자페이지
		
		<jsp:include page="${project}adminPensionBottom.jsp" flush="false"/>
	</body>
</html>
	