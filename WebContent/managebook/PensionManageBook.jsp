<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<%@ include file="setting.jsp" %>
	<jsp:include page="/home/pensionHeader.jsp" flush="false"/>	
	<script src="${project}managebook/request.js"></script>
	<script src="${project}js/jquery-3.2.1.js"></script>
	
	<c:if test="${(sessionScope.memId == null || sessionScope.memId == '')}">
		<script type="text/javascript">
		//<!--
			$(document).ready(
				function(){
			    	alert( "${str_login}" );
			    	location.href = "pensionHome.do";
				}
			);
		//-->
		</script>
		 <body>
		</body>
	</c:if>
	
	<c:if test="${sessionScope.memId != null}">
	    <body>
	    	<jsp:include page="/managebook/managebook.jsp" flush="false"/>
		</body>
	</c:if>  
	<jsp:include page="/home/pensionBottom.jsp" flush="false"/>
</html>
	