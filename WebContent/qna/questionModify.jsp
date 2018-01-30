<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		 <script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
		 <script type="text/javascript" src="js/jquery-ui.js"></script>
	     <link rel="stylesheet" type="text/css" href="css/boards.css"/>
	     
	</head>
<body id="talk">
    <div class="talk">
    <jsp:include page="/home/pensionHeader.jsp" flush="false"/>
      <div class="top_bg"><h3><span> 문의하기 </span></h3></div>
      <div class="board">
      <div class="snb">
      <div class="center"><div class="col-md-6 col-md-offset-3">
	<form method="post" name="questionform" action="questionModifyPro.do" 
		onsubmit="return writecheck()">
		
		<input type="hidden" name="m_id" value="${qDto.m_id}" />
		<input type="hidden" name="q_num" value="${q_num}" />
		<input type="hidden" name="pageNum" value="${pageNum}" />
		
		<div class="form-group">
              <label for="inputId" id="a">*카테고리</label>
              <div class="input-group">
              	<c:if test="${q_cate ne null }">
						${q_cate}
				</c:if>
				<c:if test="${q_cate eq null }">
					 <c:if test="${qDto.q_cate eq 1}">
						<label for="inputId" id="a">[환불/취소]</label> 
					</c:if>
					<c:if test="${qDto.q_cate eq 2}">
						<label for="inputId" id="a">[예약취소]</label> 
					</c:if>
					<c:if test="${qDto.q_cate eq 3}">
						<label for="inputId" id="a">[픽업문의]</label> 
					</c:if>
					<c:if test="${qDto.q_cate eq 4}">
						<label for="inputId" id="a">[기타문의]</label> 
					</c:if>
				</c:if>	
              </div>
            </div>
		
			<br> 
			
			<div class="form-group">
              <label for="inputId" id="a">*회원정보(아이디)</label> 
              <div class="input-group">
              	<label for="inputId" id="a">${qDto.m_id}</label>
              </div>
            </div>
	
			<br>
			
			<div class="form-group">
              <label for="inputId" id="a">*문의하기</label> 
              <div class="input-group">
              	<label for="inputId" id="a">&nbsp;제목</label> 
              	<input type="text" class="form-control" name="q_subject" value="${qDto.q_subject}" width="100px">
              	<br>
              	<label for="inputId" id="a">&nbsp;내용</label>
              	<textarea class="form-control" rows="15" cols="65" name="q_content">${qDto.q_content}</textarea>
              </div>              
            </div>
		
		<br>

		<input class="btn btn-success" type="submit" value="수정하기" >
		<input class="btn btn-warning" type="button" value="취소" onclick="location='questionlist.do'">
		<br><br><br>
		

	</form>
	<br><br><br><br><br><br><br>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%-- <jsp:include page="/home/pensionBottom.jsp" flush="false"/> --%> 	
	
	</body>
	

</html>