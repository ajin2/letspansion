<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<%@ include file="/book/setting.jsp" %>
	<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
	<jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/>
	
	<c:if test="${sessionScope.adminId != null}">
	    <body>
	    	<jsp:include page="/adminbook/adminBookForm.jsp" flush="false"/>
		
			<br><br><br>
			<jsp:include page="/book/productorder.jsp" flush="false"/>
			
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
			<br><br><br><br><br><br><br><br><br>
		</body>
	</c:if>  
	
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>
</html>
	