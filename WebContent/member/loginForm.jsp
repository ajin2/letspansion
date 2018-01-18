<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>

<script src="${project}member/script.js"></script>
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="css/boards.css"/>
	</head>
	
	<body id="talk" onload="mainfocus()" >
	<div class="talk">
		<jsp:include page="/home/pensionHeader.jsp" flush="false"/>
		<div class="top_bg"><h3><span>로그인</span></h3></div>
      	<div class="board">
      	<div class="snb">
      	<div class="center">      	<div class="col-md-6 col-md-offset-3" >
		<form method="post" action="logonLoginPro.do" name="mainform"
			onsubmit="return maincheck()" >
			<div class="form-group ">
              <label for="inputid" id="a" style="margin-left:150px;">아이디</label>
              <center><input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요" style="width:50%;"></center>
            </div>
			<div class="form-group ">
              <label for="inputpasswd" id="a" style="margin-left:150px;">비밀번호</label>
               <center><input type="password" class="form-control" name="passwd" placeholder="비밀번호를 입력해주세요"  style="width:50%;"></center>
            </div>
			<div class="form-group text-center">
              <button type="submit" class="btn btn-info">로그인<i class="fa fa-check spaceLeft"></i></button>
              <button type="reset" class="btn btn-warning" onclick="location='pensionHome.do'">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
	
			
		</form>
		</div></div>
      	

		</div>
      	</div>
      	</div>
	</body>
