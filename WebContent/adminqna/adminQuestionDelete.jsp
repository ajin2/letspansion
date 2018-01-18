<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<script src="${project}adminqna/script.js"></script>
	</head>
	<body>
		<c:if test="${result == 0}">
	      <script type="text/javascript">
	      
	      </script>
	      <meta http-equiv="refresh" content="0; url=adminPensionQna.do?pageNum=${pageNum}">
	   </c:if>
	   <c:if test="${result == -1 }">
	      <script type="text/javascript">
	      <!--
	      alert(replyerror);
	      // -->
	      </script>
	      <meta http-equiv="refresh" content="0; url=adminPensionQna.do?pageNum=${pageNum}">
	   </c:if>
	   <c:if test="${result == 1 }">
	      <c:redirect url="adminPensionQna.do?pageNum=${pageNum}"/>
	   </c:if>
	</body>
</html>