<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html>
	<script src="${project}js/jquery-3.2.1.js"></script>
	<script src="${project}js/request.js"></script>
	
	<script type="text/javascript">
		//<!--
		var httpRequest = null;
		
		function deleteMember(m_id) {
			var param = "m_id=" + m_id;
			httpRequest = new HttpRequest(deleteMemberResult, "deleteMember.do", param);
			httpRequest.sendRequest();
		}
		
		function deleteMemberResult() {
			var manageMember = document.getElementById("manageMember");
			var console = document.getElementById("console");
			var msg = "";
			
			if (httpRequest.request.readyState == 4) {
				if (httpRequest.request.status == 200) {
					var xmldoc = httpRequest.request.responseXML;
					var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
					var message = xmldoc.getElementsByTagName("message").item(0).firstChild.nodeValue;
					
					if (code == "success") {
						selectMember();
					} else {
						msg += "회원탈퇴 : " + message;
					}
				} else {
					msg += "회원탈퇴 : 에러발생";
				}
			} else {
				msg += "회원탈퇴 : 통신중";
			}
			console.innerHTML = msg;
		}
		
		function selectMember() {
			httpRequest = new HttpRequest(selectMemberResult, "selectMember.do");
	        httpRequest.sendRequest();
		}
		
		function selectMemberResult() {
			var manageMember = document.getElementById("manageMember");
			manageMember.innerHMTL = "";
			var console = document.getElementById("console");
			var msg = "";
			
			if (httpRequest.request.readyState == 4) {
				if (httpRequest.request.status == 200) {
					var xmldoc = httpRequest.request.responseXML;
					var code = xmldoc.getElementsByTagName("code").item(0).firstChild.nodeValue;
					if(code == "success") {
						var data = eval("(" + xmldoc.getElementsByTagName("data").item(0).firstChild.nodeValue + ")");
						var m = "<form name='deleteform'>";
						m += "<table border='1'>";
						m += "<tr>";
						m += "<th> 아이디 </th>";
						m += "<th> 이름 </th>";
						m += "<th> 전화번호 </th>";
						m += "<th> E-Mail </th>";
						m += "<th> 주소 </th>";
						m += "<th> 가입 일자 </th>";
						m += "<th> 탈퇴 버튼 </th>";
						m += "</tr>";
						
						for(var i = 0; i < data.member.length; i++) {
							m += "<tr>";
							m += "<td> <input type='text' name='memid"+i+"' value='"+data.member[i].m_id+"'></td>";
							m += "<td>" + data.member[i].m_name + "</td>";
							m += "<td>" + data.member[i].m_tel + "</td>";
							m += "<td>" + data.member[i].m_email + "</td>";
							m += "<td>" + data.member[i].m_address + "</td>";
							m += "<td>" + data.member[i].m_regdate + "</td>";
							m += "<td> <input class='inputbutton' type='button' value='탈퇴' onclick='javascript:deleteMember(memid"+i+".value)'></td>";
							m += "</tr>";
						}
						m += "</table>";
						m += "</form>";
						manageMember.innerHTML = m;
						msg += "회원 조회 : 끝~";
					} else {
						msg += "회원 조회 : 에러";
					} 
				} else {
					msg += "회원조회 : 서버에러";
				} 
			} else {
				msg += "회원조회 : 통신중";
			}
			console.innerHTML = msg;
		}
		
		//-->
	</script>
	<body onload="selectMember()">
		<table>
			<tr>
				<jsp:include page="/adminhome/adminPensionHeader.jsp" flush="false"/>	
				<jsp:include page="/adminhome/adminPensionMenu.jsp" flush="false"/>
			</tr>
		</table>
		<div id="manageMember"></div>
		<div id="console"></div>
	</body>
	<jsp:include page="/adminhome/adminPensionBottom.jsp" flush="false"/>

</html>


