<%@page import="member.EmailConfirm"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ include file="setting.jsp" %>
   <script src="${project}member/script.js"></script>

      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<style type="text/css">

div #b{
margin-left:15%;
}
</style>

	<c:if test="${authNum != null && authNum != '' }">
		<script type="text/javascript">
		<!--
			alert(senderror);
		//-->
		</script>
	</c:if>
	<c:if test="${authNum == null || authNum == '' }">
		<script type="text/javascript">
		<!--
			alert(emailerror);
			history.back();
		//-->
		</script>
	</c:if>


	   <body>
   <div class="col-md-12">
      <div class="page-header">
         <h1 align="center"> 인증번호를 입력하세요 <small> LetsBand </small> </h1>
      </div>
      <form class="form-horizontal" method="post" action="" name="emailcheck">
      
   <div class="form-group">
            <label class="col-sm-3 control-label" for="inputemail" id="b"></label>
              <div class="col-sm-2">
                <div class="input-group">
                  <input class="form-control" type="text" name="emailconfirm" placeholder="이메일 인증번호" autofocus />
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="button" name="confirmbtn" onclick="confirmemail(emailcheck.emailconfirm.value, ${authNum},${emailvalue})">
                    ${btn_ok}<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
                </div>
              </div>
        </div>

       </form>
      </div>

   </body>

   
     