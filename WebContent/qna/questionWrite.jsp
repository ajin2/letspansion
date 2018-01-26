<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp" %>
		<script src="${project}qna/script.js"></script>

	
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
	<form name="questionform" action="questionWritePro.do" 
		onsubmit="return writecheck()">
		
		<input type="hidden" name="m_id" value="${sessionScope.memId}" />
		<input type="hidden" name="q_num" value="${q_num}" />
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<input type="hidden" name="ref" value="${ref}" />
		<input type="hidden" name="re_step" value="${re_step}" />
		<input type="hidden" name="re_level" value="${re_level}" />

	
			<div class="form-group">
              <label for="inputId" id="a">*카테고리</label>
              <div class="input-group">
              	<c:if test="${q_cate ne null }">
						${q_cate}
					</c:if>
						<c:if test="${q_cate eq null }">
						<select class="custom-select" name="q_cate">
							<option value="1"> 환불/교환 </option>
							<option value="2"> 예약취소 </option>
							<option value="3"> 픽업문의 </option>
							<option value="4"> 기타문의 </option>
						</select>
					</c:if>	
              </div>
            </div>
		
			<br> 
			
			<div class="form-group">
              <label for="inputId" id="a">*회원정보(아이디)</label> 
              <div class="input-group">
              	<input type="text" class="form-control" name="m_id" value="${sessionScope.memId}">
              </div>
            </div>
	
			<br>
			
			<div class="form-group">
              <label for="inputId" id="a">*문의하기</label> 
              <div class="input-group">
              	<label for="inputId" id="a">&nbsp;제목</label> 
              	<input type="text" class="form-control" name="q_subject" width="100px">
              	<br>
              	<label for="inputId" id="a">&nbsp;내용</label>
              	<pre><textarea class="form-control" rows="15" cols="65" name="q_content"></textarea></pre>
              </div>              
            </div>

		<input class="btn btn-info" type="submit" value="문의하기" >
		<input class="btn btn-warning" type="button" value="취소" onclick="location='questionlist.do'">
		<br><br>
		 
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>

</html>