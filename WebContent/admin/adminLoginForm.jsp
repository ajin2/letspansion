<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>

    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${project}admin/script.js"></script>
	</head>
	<body onload="adminidfocus()">
		<form name="adminhomeform" method="post" action="adminLoginPro.do?adminid=${adminid}" onsubmit="return adminlogincheck()">
			<table border="1">
				<tr>
					<th> &nbsp; ${str_adminid} : &nbsp;</th> 
					<td> &nbsp; <input class="input" type="text" name="adminid" maxlength="15"> &nbsp;&nbsp; </td> 
				</tr>	
				<tr>
					<th> &nbsp; ${str_adminpasswd} : &nbsp; </th>
					<td> &nbsp; <input class="input" type="password" name="adminpasswd" maxlength="15"> &nbsp;&nbsp; </td> 
				</tr>
				<tr>	
					<td> &nbsp; <input class="inputbutton" type="submit" value="${btn_adminlogin}"> &nbsp; </td>
				</tr>
			</table>
		</form>
	</body>
</html>




