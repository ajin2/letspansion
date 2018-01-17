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
   
   <body onload="findpfocus()">
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
  
   </body>
   	</c:if> 