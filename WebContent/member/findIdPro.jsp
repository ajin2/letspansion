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
	<body onload="findfocus()">
      
      <c:if test="${result == 1}">
          <div class="talk">
    <jsp:include page="/home/pensionHeader.jsp" flush="false"/>
      <div class="top_bg"><h3><span>id찾기</span></h3></div>
      <div class="board">
      <div class="snb">
      
      <div class="center">
      <div class="col-md-6 col-md-offset-3" >
		<form method="post" name="findform">
			<div class="form-group ">
               <center><input type="text" class="form-control" value="${memberDto.m_id}" style="width:50%;" readonly></center>
            </div>
            <div class="form-group text-center">
              <button class="btn btn-info" type="button" onclick="location='logonMain.do'">${btn_ok}<i class="fa fa-check spaceLeft"></i></button>
            </div>
      <%-- <form  method="post" name="findform">
      <div class="form-group">
         <label for="inputid" id="a" style="margin-left:150px;">${str_id}</label>
      <div class="col-sm-2">
        <center> <input class="form-control" type="text" value="${memberDto.m_id}" style="width:50%;" readonly></center>
      </div>
      </div>
      
      <br>

      <div class="form-group">
         <div class="col-sm-12 text-center">
             <button class="btn btn-primary" type="button" onclick="location='logonMain.do'">${btn_ok}</button>
         </div>
      </div>
     
      </form> --%>
      </form>
      </div>
      </div>
      </div>
      </div>
      </c:if>
      
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
    </html>
    
    