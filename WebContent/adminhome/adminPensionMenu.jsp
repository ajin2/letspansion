<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<script src="${project}home/script.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
	</head>
	
	<br><br><br><br><br>
	<body id="index">
	<div id="header">
	<div class="gnb">
		<ul>
			<li><a href="adminPensionHome.do">Home</a></li>
			
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
			<li><a href="serviceAgreement.do">서비스 약관 </a></li>
		</ul>
		<!-- <a href="adminPensionHome.do">Home</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="managerroomchk();">관리자 Room</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="managerbookchk();">관리자 Book</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="managerqnachk();">관리자 Q & A</a> &nbsp; ㅣ &nbsp; 
		<a href="#" onclick="managerafterchk();">관리자 후기</a> &nbsp; ㅣ &nbsp; 		
		<a href="pensionLocation.do"> 찾아 오는 길 </a> &nbsp; ㅣ &nbsp;
		<a href="serviceAgreement.do"> 서비스 이용약관 </a> &nbsp; ㅣ &nbsp;
    <a href="adminChatting.do"> 1:1 채팅하기 </a> &nbsp; ㅣ &nbsp; -->
    
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
		</div>
		</div>
	</body>
</html>
