<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>

<h2> ${page_login} </h2>

<body onload="mainfocus()">
	<form name="mainform" method="post" action="logonLoginPro.do"
		onsubmit="return maincheck()">
		<table>
			<tr>
				<th colspan="2">
					${msg_login}
				</th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td>
					<input class="input" type="text" name="id"
						maxlength="15"> 
				</td>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd"
						maxlength="15">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_login}">
					<input class="inputbutton" type="reset" value="${btn_cancel}">
					<input class="inputbutton" type="button" value="${btn_login_cancel}"
						onclick="location='logonMain.do'">					
				</th>
			</tr>		
		</table>	
	</form>
</body>













