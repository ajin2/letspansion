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
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<script src="${project}home/script.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
	</head>
	
	<c:if test="${(sessionScope.memId == null || sessionScope.memId == '')}">
		<body id="index">
		<div id="header">
			<h1><a href="pensionHome.do"><img src="/LetsPension/img/LetsPensionLogo.png" alt="" ></a></h1>
			<div class="gnb">
				<ul>
					<li><a>펜션 소개</a>
						<ul>
							<li><a href="pensionLocation.do">오시는 길</a></li>
						</ul>
					</li>
					<li><a>룸보기</a>
						<ul>
							<li><a href="pensionRoomList.do">방 둘러보기</a></li>
							<li><a href="pensionRoomDetail.do?r_id=1">room1</a></li>
							<li><a href="pensionRoomDetail.do?r_id=2">room2</a></li>
							<li><a href="pensionRoomDetail.do?r_id=3">room3</a></li>
							<li><a href="pensionRoomDetail.do?r_id=4">room4</a></li>
							<li><a href="pensionRoomDetail.do?r_id=5">room5</a></li>
							<li><a href="pensionRoomDetail.do?r_id=6">편의시설</a></li>
						</ul>
					</li>
					<li><a>실시간 예약</a>
						<ul>
							<li><a href="pensionBook.do">예약</a></li>
						</ul>
					</li>
					<li><a>공지사항</a>
						<ul>
							<li><a href="noticeList.do">공지사항</a></li>
							<li><a href="pensionChatting.do">1:1 문의</a></li>
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
						<li><a>로그인하기</a>
						<ul>
							<li><a href="logonMain.do">로그인</a></li>
							<li><a href="logonInputForm.do">회원가입</a></li>
							<li><a href="logonFindId.do">id 찾기</a></li>
							<li><a href="logonFindPasswd.do">비번 찾기</a></li>
              <li><a href="serviceAgreement.do">서비스 이용약관</a></li>
						</ul>
						</li>

					</ul>
				</div>
		</div>
		</body>
	</c:if>
	
	<c:if test="${sessionScope.memId != null}">
		<body id="index">
		<div id="header">
			<h1><a href="pensionHome.do"><img src="/LetsPension/img/LetsPensionLogo.png" alt="" width="130" height="71"></a></h1>
			<div class="gnb">
				<ul>
					<li><a>펜션 소개</a>
						<ul>
							<li><a href="pensionLocation.do">오시는 길</a></li>
						</ul>
					</li>
					<li><a>룸보기</a>
						<ul>
							<li><a href="pensionRoomList.do">방 둘러보기</a></li>
							<li><a href="pensionRoomDetail.do?r_id=1">room1</a></li>
							<li><a href="pensionRoomDetail.do?r_id=2">room2</a></li>
							<li><a href="pensionRoomDetail.do?r_id=3">room3</a></li>
							<li><a href="pensionRoomDetail.do?r_id=4">room4</a></li>
							<li><a href="pensionRoomDetail.do?r_id=5">room5</a></li>
							<li><a href="pensionRoomDetail.do?r_id=6">편의시설</a></li>
						</ul> 
					</li>
					<li><a>실시간 예약</a>
						<ul>
							<li><a href="pensionBookGuide.do">예약</a></li>
						</ul>
					</li>
					<li><a>공지사항</a>
						<ul>
							<li><a href="questionlist.do">Q&A</a></li>
							<li><a href="noticeList.do">공지사항</a></li>
							<li><a href="pensionChatting.do">1:1 문의</a></li>
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
						<li><a>마이페이지</a>
						<ul>
							<li><a href="logonModifyForm.do">회원수정</a></li>
							<li><a href="logonDeleteForm.do">회원탈퇴</a></li>
							<li><a href="PensionManageBook.do">예약관리</a></li> 
              				<li><a href="serviceAgreement.do">서비스 이용약관</a></li>
							<li><a href="logonLogout.do">로그아웃</a></li>
						</ul>
						</li>

					</ul>
				</div>
		
				<!-- 	<li><a>마이페이지</a>
						<ul>
							<li><a href="logonModifyForm.do">회원수정</a></li>
							<li><a href="logonDeleteForm.do">회원탈퇴</a></li>
							<li><a href="PensionManageBook.do">예약관리</a></li> 
              				<li><a href="serviceAgreement.do">서비스 이용약관</a></li>
							<li><a href="logonLogout.do">로그아웃</a></li>
						</ul>
					</li>			
					</ul> -->
			
		</div>
		</body>
	</c:if>  	
	
</html>
	