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
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
	</head>
	
	<br><br><br><br><br><br>
	<c:if test="${(sessionScope.adminId == null || sessionScope.adminId == '')}">
		<body id="index" onload="adminidfocus()">
		<div id="header">
			<h1><a href="adminPensionHome.do"><img src="/LetsPension/img/LetsPensionLogo.png" alt="" width="130" height="71"></a></h1>
			<div class="gnb">
				<ul>
					<li><a>펜션 소개</a>
						<ul>
							<li><a href="adminLocation.do">오시는 길</a></li>
						</ul>
					</li>
					<li><a>관리자 Room</a>
						<ul>
							<li><a href="adminRoomList.do">방 둘러보기</a></li>
							<li><a href="adminRoomDetail.do?r_id=1">room1</a></li>
							<li><a href="adminRoomDetail.do?r_id=2">room2</a></li>
							<li><a href="adminRoomDetail.do?r_id=3">room3</a></li>
							<li><a href="adminRoomDetail.do?r_id=4">room4</a></li>
							<li><a href="adminRoomDetail.do?r_id=5">room5</a></li>
							<li><a href="adminRoomDetail.do?r_id=6">room6</a></li>
						</ul>
					</li>
					<li><a>관리자 예약</a>
						<ul>
							<li><a href="#" onclick="managerbookchk();">예약</a></li>
						</ul>
					</li>
					<li><a>관리자 공지사항</a>
						<ul>
							<li><a href="adminNoticeList.do">관리자 공지사항</a></li>
							<li><a href="adminPensionQna.do">관리자 QnA</a></li>
							<li><a href="adminChatting.do"> 관리자 1:1 문의 </a></li>
						</ul>
					</li>
					<li><a>후기</a>
						<ul>
							<li><a href="list.do">후기</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div><br><br><br>
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
		<body id="index">
		<div id="header">
			<h1><a href="adminPensionHome.do"><img src="/LetsPension/img/LetsPensionLogo.png" alt="" width="130" height="71"></a></h1>
			<div class="gnb">
				<ul>
					<li><a>펜션 소개</a>
						<ul>
							<li><a href="adminLocation.do">오시는 길</a></li>
						</ul>
					</li>
					<li><a>관리자 Room</a>
						<ul>
							<li><a href="adminRoomList.do">방 둘러보기</a></li>
							<li><a href="adminRoomDetail.do?r_id=1">room1</a></li>
							<li><a href="adminRoomDetail.do?r_id=2">room2</a></li>
							<li><a href="adminRoomDetail.do?r_id=3">room3</a></li>
							<li><a href="adminRoomDetail.do?r_id=4">room4</a></li>
							<li><a href="adminRoomDetail.do?r_id=5">room5</a></li>
							<li><a href="adminRoomDetail.do?r_id=6">편의시설</a></li>
						</ul>
					</li>
					<li><a>관리자 예약</a>
						<ul>
							<li><a href="#" onclick="managerbookchk();">예약</a></li>
						</ul>
					</li>
					<li><a>관리자 공지사항</a>
						<ul>
							<li><a href="adminNoticeList.do">관리자 공지사항</a></li>
							<li><a href="adminPensionQna.do">관리자 QnA</a></li>
							<li><a href="adminChatting.do"> 관리자 1:1 문의 </a></li>
						</ul>
					</li>
					<li><a>후기</a>
						<ul>
							<li><a href="list.do">후기</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="logon">
				<ul>
					<li><a>${sessionScope.adminId} ${msg_adminmain} </a>
					<ul>
						<li><a href="adminManageMember.do">${str_managemember}</a></li>
						<li><a href="adminManageBookPro.do">${str_managebook}</a></li>
						<li><a href="adminManageProductPro.do">${str_manageproduct}</a></li>
						<li><a href="adminLogout.do">${str_logout}</a></li>
					</ul>
					</li>
				</ul>
			</div>
			<br>
		</div>
		</body>
	</c:if>
	
	<script type="text/javascript">
		//<!-- 에러 아니니 신경 X
		function managerroomchk(){
		    if(${sessionScope.adminId != null}){
		        location.href = "adminRoomList.do";
		        return true;
		    } else {
		    	var adminloginerror = "로그인해야지";
		    	alert( adminloginerror );
		        return false;
		    }
		}
		function managerbookchk(){
		    if(${sessionScope.adminId != null}){
		        location.href = "adminBookGuide.do";
		        return true;
		    } else {
		    	var adminloginerror = "어디가 로그인해야지";
		    	alert( adminloginerror );
		        return false;
		    }
		}
		function managerqnachk(){
		    if(${sessionScope.adminId != null}){
		        location.href = "adminQnaPro.do";
		        return true;
		    } else {
		    	var adminloginerror = "로그인안해?";
		    	alert( adminloginerror );
		        return false;
		    }
		}
		function managerafterchk(){
		    if(${sessionScope.adminId != null}){
		        location.href = "adminAfterPro.do";
		        return true;
		    } else {
		    	var adminloginerror = "로그인 하고 가";
		    	alert( adminloginerror );
		        return false;
		    }
		}
		//-->
		</script>
</html>