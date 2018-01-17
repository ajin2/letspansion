<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ include file="setting.jsp" %>
     
	<script src="${project}member/script.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
    <style type="text/css">
			div #a{
			margin-left:15%;}
		</style>

	<body onload="findfocus()">
   <div class="col-md-12">
      <div class="page-header">
         <h1 align="center"> ${page_findId} <small> LetsBand </small> </h1>
      </div>
      
      <c:if test="${result == 1}">
      
      <form class="form-horizontal" method="post" name="findform">
      <div class="form-group">
         <label class="col-sm-3 control-label" id="a">${str_id}</label>
      <div class="col-sm-2">
         <input class="form-control" type="text" value="${memberDto.m_id}" readonly>
      </div>
      </div>
      
      <br>

      <div class="form-group">
         <div class="col-sm-12 text-center">
             <button class="btn btn-primary" type="button" onclick="location='BandBoard_main.do'">${btn_ok}</button>
         </div>
      </div>
     
      </form>
      
      </c:if>
      
   </div>
   </body>
	
	
	 
	
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
    
    