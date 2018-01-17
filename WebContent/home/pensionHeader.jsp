<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${project}home/script.js"></script>
		<link href="css/reset.css" rel="stylesheet">
	</head>
	
	<c:if test="${(sessionScope.memId == null || sessionScope.memId == '')}">
		<body>
			<h1><a href="pensionHome.do"><img src="/LetsPension/img/LetsPensionLogo.png" alt="" width="130" height="71"></a></h1>
			<div class="gnb">
				<a class="text-shadow text-white" href="logonMain.do">${str_login}</a>  | 
		    	<a class="text-shadow text-white" href="logonInputForm.do">${str_signon}</a> |  
		    	<a class="text-shadow text-white" href="pensionFindId.do">${str_findid}</a>  | 
		    	<a class="text-shadow text-white" href="logonFindPasswd.do">${str_findpasswd}</a>     
			</div>
		</body>
	</c:if>
	
	<c:if test="${sessionScope.memId != null}">
	    <body>
		    <a class="text-shadow text-white" >${sessionScope.memId} 님</a> |
		    <a class="text-shadow text-white" href="pensionMypage.do">${str_mypage}</a> | 
		    <a class="text-shadow text-white" href="logonLogout.do">${str_logout}</a>
		</body>
	</c:if>  	
	
</html>
   
	