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

	<c:if test="${result == 0}">
    	<script type="text/javascript">
    	<!--
    		erroralert(finderror);
    	//-->
    	</script>
    </c:if>
    
    <c:if test="${result == -1}">
    	<script type="text/javascript">
    	<!--
    		erroralert(finderror);
    	//-->
    	</script>
    </c:if>
    
   <c:if test="${result == 1}">
   <body id="talk" onload="findpfocus()" >
	<div class="talk">
		<jsp:include page="/home/pensionHeader.jsp" flush="false"/>
		<div class="top_bg"><h3><span>비밀번호 변경</span></h3></div>
      	<div class="board">
      	<div class="snb">
      	<div class="center"><div class="col-md-6 col-md-offset-3" >
		<form method="post" name="findform" onsubmit="return findpasswdcheck()" action="longonFindPasswdPro.do" >
			<input type="hidden" name="id" value="${id}">
			<div class="form-group ">
              <label for="inputid" id="a" style="margin-left:150px;">비밀번호</label>
              <center><input type="password" class="form-control" name="passwd" placeholder="비밀번호를 입력해주세요" style="width:50%;"></center>
            </div>
			<div class="form-group ">
              <label for="inputpasswd" id="a" style="margin-left:150px;">비밀번호 확인</label>
               <center><input type="password" class="form-control" name="repasswd" placeholder="비밀번호를 입력해주세요"  style="width:50%;"></center>
            </div>
			<div class="form-group text-center">
              <button type="submit" class="btn btn-info">비밀번호 변경<i class="fa fa-check spaceLeft"></i></button>
              <button type="reset" class="btn btn-warning" onclick="location='pensionHome.do'">취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
	
			
		</form>
		</div></div>
      	

		</div>
      	</div>
      	</div>
	</body>
   <%-- <body onload="findpfocus()">
 <form class="form-horizontal" method="post" name="findform" onsubmit="return findpasswdcheck()" action="longonFindPasswdPro.do">
    <input type="hidden" name="id" value="${id}">
   
   <div class="col-md-12">
      <div class="page-header">
         <h1 align="center"> ${msg_re_passwd} <small> LetsBand </small> </h1>
      </div>
      
      <div class="form-group">
         <label class="col-sm-3 control-label" for="inputpasswd" id="b">${str_passwd}</label>
      <div class="col-sm-2">
         <input class="form-control"  type="password" name="passwd" placeholder="비밀번호" autofocus>
      </div>
      </div>
      
      <div class="form-group">
         <label class="col-sm-3 control-label" for="inputpasswd" id="b"></label>
      <div class="col-sm-2">
         <input class="form-control" type="password" name="repasswd" placeholder="비밀번호">
      </div>
      <br>
      <br>
      <div class="form-group">
         <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">${btn_ok}</button>
         </div>
      </div>
      </div>
      </div>
      </form>
  
   </body> --%>
   	</c:if> 