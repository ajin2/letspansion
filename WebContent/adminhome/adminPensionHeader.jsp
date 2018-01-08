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
		<script src="${project}adminhome/script.js"></script>
		
	</head>
	
	
	<c:if test="${(sessionScope.adminId == null || sessionScope.adminId == '')}">
		<a href="adminLoginForm.do">관리자 로그인</a> 
		<body onload="adminidfocus()">
			<form name="adminhomeform" method="post" action="adminLoginPro.do" onsubmit="return adminlogincheck()">
				<table>
					<tr>
						<th> ${str_adminid} : </th> 
						<td> <input class="input" type="text" name="adminid" maxlength="15"> </td> 
						<th> ${str_adminpasswd} : </th>
						<td> <input class="input" type="password" name="adminpasswd" maxlength="15"> </td> 
						<th>
							<input class="inputbutton" type="submit" value="${btn_adminlogin}"> 
						</th>
					</tr>
				</table>
			</form>
		</body>
	</c:if>
	
	<c:if test="${sessionScope.adminId != null}">
		<body>
			${sessionScope.adminId} ${msg_adminmain} &nbsp; ㅣ &nbsp;
			<a href="adminManageMemberPro.do">${str_managemember}</a> &nbsp; ㅣ  &nbsp;
			<a href="adminManageBookPro.do">${str_managebook}</a> &nbsp; ㅣ &nbsp;
			<a href="adminManageProductPro.do">${str_manageproduct}</a> &nbsp; ㅣ &nbsp;
			<a href="adminLogout.do">${str_logout}</a><br>
		</body>
	</c:if>
	
</html>