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
		<h2> </h2>
		<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
		<jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/>

		Admin Pension Room 본문		


		<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
	</body>
</html>
	