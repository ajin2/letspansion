<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	
	<body onload="openserver()">
		<form name="inputform">
			<table border="1">
				<tr>
					<th> 메시지 </th>
					<td> <input type="text" name="id" size="5px" value="${sessionScope.memId}" readonly="readonly"> </td>
					<td> <input type="text" name="message" autofocus placeholder="대화를 입력하세요" onkeyup="enterkey()"> </td>
					<td> <input type="button" value="전송" onclick="sendmsg()"> </td>
				</tr>
				<tr>
					<th colspan="4">
						<div id="msg"></div>
					</th>
				</tr>
			</table>
		</form>
		<br><br>
		<div id="result"></div>
	</body>
	
	<script type="text/javascript">
		//<!--
		var ws = null;
		function openserver() {
			var result = document.getElementById("result");
			if(!window.WebSocket) {
				result.innerHTML += "지원하지 않는 브라우저 입니다.<br>";
				return ;
			}
			
			//ws = new WebSocket("ws://echo.websocket.org");
			ws = new WebSocket("ws://localhost:8080/LetsPension/websocket/chat");	// 이게 양쪽에서 같으면 접속가능
			if(!ws) {
				result.innerHTML += "서버 연결 실패<br>";
			} else {
				ws.onopen = function() {
					result.innerHTML += "서버 연결 성공<br>";	
				}
				ws.onclose = function() {
					result.innerHTML += "서버 연결 종류<br>";
				}
				ws.onmessage = function(evt) {
					var msg = document.getElementById("msg");
					var user = evt.data.split(' : ');
					if (user[1] == inputform.id.value) {
						if (user[0] != inputform.id.value) {
							msg.innerHTML += "관리자 : ";
							for(var i = 2; i < user.length; i ++ ) {
								msg.innerHTML += user[i];
							}
						} else if (user[0] == inputform.id.value) {
							msg.innerHTML += inputform.id.value + " : ";
							for(var i = 2; i < user.length; i ++ ) {
								msg.innerHTML += user[i];
							}
						} else {
							msg.innerHTML += evt.data;
						}
						
						msg.innerHTML += "<br>";
						result.innerHTML += "메시지 수신 성공 <br>";	
					}
				}
			}
		}
		
		function sendmsg() {
			var result = document.getElementById("result");
			var msg = inputform.id.value + " : " + inputform.id.value + " : " + inputform.message.value;
			ws.send(msg);
			inputform.message.value = "";
			inputform.message.focus();
			result.innerHTML += "메시지 송신 성공<br>";
		}
		
		// 엔터키를 통해 send함
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	        	sendmsg();
	        }
	    }
		
	    // 채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	    window.setInterval(function() {
	        var elem = document.getElementById('msg');
	        elem.scrollTop = elem.scrollHeight;
	    }, 0);
		//-->
	</script>
</html>


