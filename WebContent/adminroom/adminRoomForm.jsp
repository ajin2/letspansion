<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		
	</head>

	<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
	<jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/>

	<body>
		<h2> Let's Pension의 방을 소개합니다. </h2>

		<input type="button" value="${room_add}" onclick="location='adminRoomWrite.do'">
		<form>
			<table border="1">
				
			
			</table>
		</form>
	</body>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>
	