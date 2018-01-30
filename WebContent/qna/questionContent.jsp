<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<%@ include file="setting.jsp"%>
		<script src="${project}qna/script.js"></script>
		
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		 <script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
		 <script type="text/javascript" src="js/jquery-ui.js"></script>
	     <link rel="stylesheet" type="text/css" href="css/boards.css"/>
		
	</head>
<center>
<body id="talk">
    <div class="talk">
    <jsp:include page="/home/pensionHeader.jsp" flush="false"/>
      <div class="top_bg"><h3><span> 문의하기 </span></h3></div>
      <div class="board">
      <div class="snb">
      <div class="center"><div class="col-md-6 col-md-offset-3">
       
		<form name="qcontent">
		<input type="hidden" name="q_num" value="${qDto.q_num}">
		<input type="hidden" name="q_cate" value="${qDto.q_cate}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="q_delete" value="${qDto.q_delete}">
		<input type="hidden" name="ref" value="${qDto.ref}">
		<input type="hidden" name="re_step" value="${qDto.re_step}">
		<input type="hidden" name="re_level" value="${qDto.re_level}">
		
			<table class='table table-striped table-bordered table-hover' border="1"> 
				<tr>
					<th style="text-align:center;"> 제목 </th>
					<td colspan="5"> &nbsp;&nbsp; ${qDto.q_subject} </td>
				</tr>
				<tr>
					<th style="text-align:center;"> 카테고리 </th>
					<td>
						<c:if test="${q_cate ne null }">
							${q_cate}
						</c:if>
						<c:if test="${q_cate eq null }">
							 <c:if test="${qDto.q_cate eq 1}">
								 &nbsp;&nbsp; [환불/취소] 
							</c:if>
							<c:if test="${qDto.q_cate eq 2}">
								 &nbsp;&nbsp; [예약취소]
							</c:if>
							<c:if test="${qDto.q_cate eq 3}">
								 &nbsp;&nbsp; [픽업문의]
							</c:if>
							<c:if test="${qDto.q_cate eq 4}">
								 &nbsp;&nbsp; [기타문의] 
							</c:if>
						</c:if>
					</td>
					<th style="text-align:center;"> 작성자 </th>
					<td> 
						<c:if test="${qDto.m_id ne null}">
			             	&nbsp;&nbsp; ${qDto.m_id} &nbsp;&nbsp;&nbsp;&nbsp;
			             </c:if>
			             <c:if test="${qDto.a_id ne null}">
							&nbsp;&nbsp; ${qDto.a_id}	&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
					</td>
					<th style="text-align:center;"> 작성일 </th>
					<td>
						&nbsp;&nbsp; 
						<fmt:formatDate value="${qDto.q_regdate}" type="both" pattern="yyyy-MM-dd HH:mm" />
					</td>
				</tr>
			
			</table> 
  
  			<br><br>

             &nbsp;&nbsp;	${qDto.q_content}


			<br><br><br>
				<!-- 목록 -->
			<input class="btn btn-success" type="button" value="목록" onclick="location='questionlist.do'">
			
				<!-- 답글 -->
			<%-- <c:if test="${qDto.re_step eq 0}">
			<input class="btn btn-info" type="button" value="답글"
			  onclick="location='questionWrite.do?m_id=${qDto.m_id}&q_cate=${qDto.q_cate}&q_num=${qDto.q_num}&ref=${qDto.ref}&re_step=${qDto.re_step}&re_level=${qDto.re_level}&pageNum=${pageNum}'">
			</c:if> --%>
			  
				<!-- 수정 -->
			<c:if test="${qDto.m_id eq sessionScope.memId}">
				<input class=class="btn btn-success" type="button" value="수정" 
					onclick="location='questionModify.do?q_num=${qDto.q_num}&pageNum=${pageNum}'">	
				
				<!-- 삭제 -->
				<input class="btn btn-warning" type="button" value="삭제" onclick="DelCheck('${qDto.q_num}', '${qDto.ref}', '${qDto.re_step}', '${qDto.re_level}' ,'${pageNum}')">	
			</c:if>
			 
			<br><br><br>
		</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</body>
</center>
</html>