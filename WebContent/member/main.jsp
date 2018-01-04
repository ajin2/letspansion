<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>

<h2> ${page_main} </h2>

<c:if test="${sessionScope.memId == null}">
	<body onload="mainfocus()">
		<form method="post" action="logonLoginPro.do" name="mainform"
			onsubmit="return maincheck()">
			<table>
				<tr>
					<th colspan="2">${msg_main}</th>
				</tr>
				<tr>
					<th>${str_id}</th>
					<td><input class="input" type="text" name="id" maxlength="15">
					</td>
				</tr>
				<tr>
					<th>${str_passwd}</th>
					<td><input class="input" type="password" name="passwd"
						maxlength="15"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_login}"> 
						<input class="inputbutton" type="reset" value="${btn_cancel}">						 
						<input class="inputbutton" type="button" value="${btn_input}"
							onclick="location='logonInputForm.do'"></th>
				</tr>
	
			</table>
		</form>
	</body>
</c:if>
<c:if test="${sessionScope.memId != null}">
	<table>
		<tr>
			<th><span>${sessionScope.memId}</span> ${msg_loginmain}
			</th>
		</tr>
		<tr>
			<td align="center">
				<input class="inputbutton" type="button" value="${btn_logout}" 
					onclick="location='logonLogout.do'"> 
				<input class="inputbutton" type="button" value="${btn_modify}"
					onclick="location='logonModifyForm.do'">
				<input class="inputbutton" type="button" value="${btn_delete}"
					onclick="location='logonDeleteForm.do'">
			</td>
		</tr>
	</table>
</c:if>









