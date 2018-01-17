<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<%@ include file="/book/setting.jsp" %>
	<jsp:include page="/home/pensionHeader.jsp" flush="false"/>	
	<jsp:include page="/home/pensionMenu.jsp" flush="false"/>
	
	<body>
		<h2> 날짜 선택 </h2>

		Pension 예약 본문
		
		
		<br><br>
		<jsp:include page="/book/BookForm.jsp" flush="false"/>
		
		<br><br><br>
		<jsp:include page="/book/productorder.jsp" flush="false"/>
		
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
		<br><br><br><br><br><br><br><br><br>
	</body>
	<jsp:include page="/home/pensionBottom.jsp" flush="false"/>
</html>
	