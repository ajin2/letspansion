<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="utf-8" />
	<%@ include file="setting.jsp" %>
	<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
	
	<body>
		<h2 style="margin-left:100px"> 관리자 예약 관리 </h2>
		<br><br>
		
		<jsp:include page="/adminmanagebook/adminmanagebookForm.jsp" flush="false"/>		
	</body>
	<br><br><br>
	<div id="aaa" style="clear:both" ></div>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>


